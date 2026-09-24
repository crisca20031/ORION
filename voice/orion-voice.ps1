<#
.SYNOPSIS
    Circuito de voz de ORION (paso 3 de la guia) para Windows.

    Mantene apretada una tecla para grabar, soltala para procesar:
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
$WhisperExe   = "C:\orion\whisper.cpp\main.exe"
$WhisperModel = "C:\orion\whisper.cpp\models\ggml-medium.bin"
$PiperExe     = "C:\orion\piper\piper.exe"
$PiperVoice   = "C:\orion\piper\es_AR-daniela-high.onnx"
$SoxExe       = "C:\Program Files (x86)\sox-14-4-2\sox.exe"
$VaultPedidos = Join-Path $PSScriptRoot "..\vault\pedidos"
$TempDir      = Join-Path $env:TEMP "orion-voice"
$RecordKey    = [System.ConsoleKey]::Spacebar
# --------------------------------------------------------------------

New-Item -ItemType Directory -Force -Path $TempDir, $VaultPedidos | Out-Null

function Grabar-Audio {
    param([string]$OutFile)
    Write-Host "Mantene SPACE apretada para hablar, soltala para terminar..." -ForegroundColor Yellow
    while (-not [Console]::KeyAvailable) { Start-Sleep -Milliseconds 50 }
    $key = [Console]::ReadKey($true)
    if ($key.Key -ne $RecordKey) { return $false }

    if (Test-Path $OutFile) { Remove-Item $OutFile -Force }
    $proc = Start-Process -FilePath $SoxExe -ArgumentList "-t waveaudio -d `"$OutFile`" rate 16000" -PassThru -WindowStyle Hidden
    Write-Host "Grabando... solta SPACE para parar." -ForegroundColor Red
    while ([Console]::KeyAvailable -and [Console]::ReadKey($true).Key -eq $RecordKey) { }
    Start-Sleep -Milliseconds 150
    Stop-Process -Id $proc.Id -Force -ErrorAction SilentlyContinue
    Start-Sleep -Milliseconds 300

    if (-not (Test-Path $OutFile) -or (Get-Item $OutFile).Length -eq 0) {
        Write-Host "No se grabo nada. Revisa que SoX tenga permiso de usar el microfono (Configuracion > Privacidad > Microfono) o que la ruta de SoX en CONFIG sea correcta." -ForegroundColor Red
        return $false
    }
    return $true
}

function Transcribir {
    param([string]$AudioFile)
    $txtBase = Join-Path $TempDir "out"
    if (Test-Path "$txtBase.txt") { Remove-Item "$txtBase.txt" -Force }

    Write-Host "--- salida de whisper.cpp ---" -ForegroundColor DarkGray
    & $WhisperExe -m $WhisperModel -f $AudioFile -l es -otxt -of $txtBase
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
    return (Get-Content "$txtBase.txt" -Raw).Trim()
}

function Preguntar-Claude {
    param([string]$Texto)
    return (& claude -p $Texto | Out-String).Trim()
}

function Hablar {
    param([string]$Texto)
    $wav = Join-Path $TempDir "respuesta.wav"
    $Texto | & $PiperExe --model $PiperVoice --output_file $wav
    Start-Process -FilePath $SoxExe -ArgumentList "`"$wav`" -d" -NoNewWindow -Wait
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
    $texto = Transcribir -AudioFile $audioFile
    if ([string]::IsNullOrWhiteSpace($texto)) { Write-Host "No se entendio nada, proba de nuevo."; continue }
    Write-Host "Vos: $texto" -ForegroundColor Green

    Write-Host "Pensando..." -ForegroundColor DarkGray
    $respuesta = Preguntar-Claude -Texto $texto

    Write-Host "ORION: $respuesta" -ForegroundColor Cyan
    Hablar -Texto $respuesta
    Guardar-Log -Pregunta $texto -Respuesta $respuesta
}
