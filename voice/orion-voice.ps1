<#
.SYNOPSIS
    Circuito de voz de ORION (paso 3 de la guia) para Windows.

    Apreta ENTER para grabar; se corta solo tras 1.5s de silencio:
    grabar -> whisper.cpp (voz a texto, local) -> Claude Code -> Piper (texto a voz, local) -> reproducir.
    Cada pedido y respuesta se guarda en vault/pedidos/ con fecha y hora.

.NOTES
    Corre 100% local. Ningun audio sale de tu maquina.

    Instala antes de correr esto:
      1. Claude Code           -> https://docs.claude.com  (npm install -g @anthropic-ai/claude-code)
      2. whisper.cpp (Windows) -> https://github.com/ggerganov/whisper.cpp
         Compilalo o descarga un release, y un modelo en espanol (ej. ggml-medium.bin
         o el modelo "large-v3" para mejor precision con rioplatense).
      3. Piper (TTS)           -> https://github.com/rhasspy/piper
         Descarga el binario para Windows y una voz en castellano (ej. es_AR o es_ES).
      4. SoX o ffmpeg para grabar/reproducir audio desde la terminal
         -> https://sourceforge.net/projects/sox/  o  https://ffmpeg.org

    Ajusta las rutas de la seccion CONFIG antes del primer uso.
#>

# ---------- CONFIG (ajusta estas rutas a tu instalacion) ----------
$WhisperExe   = "C:\orion\whisper.cpp\whisper-cli.exe"
$WhisperModel = "C:\orion\whisper.cpp\models\ggml-medium.bin"
$PiperExe     = "C:\orion\piper\piper.exe"
$PiperVoice   = "C:\orion\piper\es_AR-daniela-high.onnx"
$SoxExe       = "C:\Program Files (x86)\sox-14-4-2\sox.exe"
$VaultPedidos = Join-Path $PSScriptRoot "..\vault\pedidos"
$TempDir      = Join-Path $env:TEMP "orion-voice"
# --------------------------------------------------------------------

# Forzar UTF-8 en toda la consola: sin esto, el texto con tildes que se le
# pasa a Piper por la tuberia (|) puede llegar mal codificado y hacerlo
# fallar (crash con codigo -1073740791).
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

New-Item -ItemType Directory -Force -Path $TempDir, $VaultPedidos | Out-Null

function Grabar-Audio {
    param([string]$OutFile)
    Write-Host "Apreta ENTER y empeza a hablar. Se corta solo cuando dejes de hablar." -ForegroundColor Yellow
    [Console]::ReadKey($true) | Out-Null

    if (Test-Path $OutFile) { Remove-Item $OutFile -Force }
    Write-Host "Grabando... habla ahora." -ForegroundColor Red

    # SoX corta la grabacion solo, despues de 1.5s de silencio, y cierra el
    # archivo correctamente (evita matar el proceso a la fuerza, que dejaba
    # el .wav vacio o corrupto).
    & $SoxExe -t waveaudio -d $OutFile rate 16000 silence 1 0.1 2% 1 1.5 2%

    if (-not (Test-Path $OutFile) -or (Get-Item $OutFile).Length -eq 0) {
        Write-Host "No se grabo nada. Revisa que SoX tenga permiso de usar el microfono (Configuracion > Privacidad > Microfono) o que la ruta de SoX en CONFIG sea correcta." -ForegroundColor Red
        return $false
    }

    # Los 1.5s de silencio que quedan pegados al final (necesarios para
    # detectar que dejaste de hablar) hacen que whisper.cpp "alucine" y
    # repita la ultima frase. Se recortan aca, sobre el archivo ya cerrado.
    $trimmed = Join-Path $TempDir "grabacion_trim.wav"
    if (Test-Path $trimmed) { Remove-Item $trimmed -Force }
    & $SoxExe $OutFile $trimmed reverse silence 1 0.1 2% reverse
    if ((Test-Path $trimmed) -and (Get-Item $trimmed).Length -gt 0) {
        Move-Item -Force $trimmed $OutFile
    }

    return $true
}

function Quitar-Duplicado {
    param([string]$Texto)
    # whisper.cpp tiene un bug conocido: en audios cortos, a veces repite
    # toda la frase dos veces seguidas, incluso en modo greedy. Si el texto
    # es "X. X." (la misma frase dos veces), nos quedamos con una copia.
    # Se normaliza a NFC antes de comparar: las dos copias pueden traer la
    # misma letra acentuada representada con Unicode distinto (compuesto vs
    # descompuesto), lo que hace que una comparacion exacta no las detecte
    # como iguales aunque se vean identicas en pantalla.
    $normalizado = $Texto.Normalize([System.Text.NormalizationForm]::FormC)
    if ($normalizado -match '^(?<a>.{4,}?)[.!?\xbf\xa1]*\s+\k<a>[.!?\xbf\xa1]*$') {
        return $Matches['a'].Trim()
    }
    return $normalizado
}

function Transcribir {
    param([string]$AudioFile)
    $txtBase = Join-Path $TempDir "out"
    if (Test-Path "$txtBase.txt") { Remove-Item "$txtBase.txt" -Force }

    Write-Host "--- salida de whisper.cpp ---" -ForegroundColor DarkGray
    # -bs 1 (beam size 1, decodificacion "greedy"): mucho mas rapido que el
    # default (5 beams) y evita que repita la ultima frase por el silencio
    # que queda al final de la grabacion.
    & $WhisperExe -m $WhisperModel -f $AudioFile -l es -otxt -of $txtBase -nt -bs 1 -bo 1
    $exitCode = $LASTEXITCODE
    Write-Host "--- fin salida de whisper.cpp ---" -ForegroundColor DarkGray

    if ($exitCode -ne 0) {
        Write-Host "whisper.cpp devolvio un error (codigo $exitCode). Revisa el mensaje de arriba." -ForegroundColor Red
        return ""
    }
    if (-not (Test-Path "$txtBase.txt")) {
        Write-Host "whisper.cpp no genero el archivo de texto. Revisa el mensaje de arriba." -ForegroundColor Red
        return ""
    }
    # Se usa .NET directo para leer en UTF-8: Get-Content -Encoding UTF8 es
    # poco confiable en PowerShell 5.1 con archivos sin BOM.
    return [System.IO.File]::ReadAllText("$txtBase.txt", [System.Text.Encoding]::UTF8).Trim()
}

function Preguntar-Claude {
    param([string]$Texto)
    return (& claude -p $Texto | Out-String).Trim()
}

function Hablar {
    param([string]$Texto)
    $wav = Join-Path $TempDir "respuesta.wav"
    if (Test-Path $wav) { Remove-Item $wav -Force }

    Write-Host "--- salida de piper ---" -ForegroundColor DarkGray
    # En vez de pasarle el texto por la tuberia de PowerShell (|), que en
    # algunos builds de Windows llega mal a programas nativos y los hace
    # crashear (codigo -1073740791), se escribe a un archivo UTF-8 sin BOM
    # y se lo redirige como entrada estandar via cmd.exe, byte a byte.
    $txtIn = Join-Path $TempDir "respuesta_in.txt"
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($txtIn, $Texto, $utf8NoBom)

    $piperDir = Split-Path $PiperExe -Parent
    Push-Location $piperDir
    try {
        cmd /c "`"$PiperExe`" --model `"$PiperVoice`" --output_file `"$wav`" < `"$txtIn`""
        $exitCode = $LASTEXITCODE
    } finally {
        Pop-Location
    }
    Write-Host "--- fin salida de piper (codigo $exitCode) ---" -ForegroundColor DarkGray

    if (-not (Test-Path $wav) -or (Get-Item $wav).Length -eq 0) {
        Write-Host "Piper no genero el audio (codigo $exitCode). Revisa que junto a piper.exe este la carpeta 'espeak-ng-data' (viene en el mismo .zip que descargaste) y que PiperVoice/PiperExe en CONFIG sean correctos." -ForegroundColor Red
        return
    }
    & $SoxExe $wav -t waveaudio -d
}

function Guardar-Log {
    param([string]$Pregunta, [string]$Respuesta)
    $fecha = Get-Date -Format "yyyy-MM-dd"
    $hora  = Get-Date -Format "HH:mm"
    $logFile = Join-Path $VaultPedidos "$fecha.md"
    if (-not (Test-Path $logFile)) { "# Pedidos por voz - $fecha`n" | Out-File $logFile -Encoding utf8 }
    @"

## $hora
**Pedido:** $Pregunta
**Respuesta:** $Respuesta
"@ | Out-File $logFile -Append -Encoding utf8
}

Write-Host "=== ORION - circuito de voz ===" -ForegroundColor Cyan
Write-Host "Ctrl+C para salir." -ForegroundColor DarkGray

while ($true) {
    $audioFile = Join-Path $TempDir "grabacion.wav"
    if (-not (Grabar-Audio -OutFile $audioFile)) { continue }

    Write-Host "Transcribiendo..." -ForegroundColor DarkGray
    $texto = Quitar-Duplicado (Transcribir -AudioFile $audioFile)
    if ([string]::IsNullOrWhiteSpace($texto)) { Write-Host "No se entendio nada, proba de nuevo."; continue }
    Write-Host "Vos: $texto" -ForegroundColor Green

    Write-Host "Pensando..." -ForegroundColor DarkGray
    $respuesta = Preguntar-Claude -Texto $texto

    Write-Host "ORION: $respuesta" -ForegroundColor Cyan
    Hablar -Texto $respuesta
    Guardar-Log -Pregunta $texto -Respuesta $respuesta
}
