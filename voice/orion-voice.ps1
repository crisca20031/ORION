<#
.SYNOPSIS
    Circuito de voz de ORION (paso 3 de la guía) para Windows.

    Mantené apretada una tecla para grabar, soltala para procesar:
    grabar -> whisper.cpp (voz a texto, local) -> Claude Code -> Piper (texto a voz, local) -> reproducir.
    Cada pedido y respuesta se guarda en vault/pedidos/ con fecha y hora.

.NOTES
    Corre 100% local. Ningún audio sale de tu máquina.

    Instalá antes de correr esto:
      1. Claude Code           -> https://docs.claude.com  (npm install -g @anthropic-ai/claude-code)
      2. whisper.cpp (Windows) -> https://github.com/ggerganov/whisper.cpp
         Compilalo o descargá un release, y un modelo en español (ej. ggml-medium.bin
         o el modelo "large-v3" para mejor precisión con rioplatense).
      3. Piper (TTS)           -> https://github.com/rhasspy/piper
         Descargá el binario para Windows y una voz en castellano (ej. es_AR o es_ES).
      4. SoX o ffmpeg para grabar/reproducir audio desde la terminal
         -> https://sourceforge.net/projects/sox/  o  https://ffmpeg.org

    Ajustá las rutas de la sección CONFIG antes del primer uso.
#>

# ---------- CONFIG (ajustá estas rutas a tu instalación) ----------
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
    Write-Host "Mantené SPACE apretada para hablar, soltala para terminar..." -ForegroundColor Yellow
    while (-not [Console]::KeyAvailable) { Start-Sleep -Milliseconds 50 }
    $key = [Console]::ReadKey($true)
    if ($key.Key -ne $RecordKey) { return $false }

    $proc = Start-Process -FilePath $SoxExe -ArgumentList "-t waveaudio -d `"$OutFile`" rate 16000" -PassThru -WindowStyle Hidden
    Write-Host "Grabando... soltá SPACE para parar." -ForegroundColor Red
    while ([Console]::KeyAvailable -and [Console]::ReadKey($true).Key -eq $RecordKey) { }
    Start-Sleep -Milliseconds 150
    Stop-Process -Id $proc.Id -Force -ErrorAction SilentlyContinue
    return $true
}

function Transcribir {
    param([string]$AudioFile)
    $txtBase = Join-Path $TempDir "out"
    & $WhisperExe -m $WhisperModel -f $AudioFile -l es -otxt -of $txtBase | Out-Null
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
    if (-not (Test-Path $logFile)) { "# Pedidos por voz — $fecha`n" | Out-File $logFile -Encoding utf8 }
    @"

## $hora
**Pedido:** $Pregunta
**Respuesta:** $Respuesta
"@ | Out-File $logFile -Append -Encoding utf8
}

Write-Host "=== ORION — circuito de voz ===" -ForegroundColor Cyan
Write-Host "Ctrl+C para salir." -ForegroundColor DarkGray

while ($true) {
    $audioFile = Join-Path $TempDir "grabacion.wav"
    if (-not (Grabar-Audio -OutFile $audioFile)) { continue }

    Write-Host "Transcribiendo..." -ForegroundColor DarkGray
    $texto = Transcribir -AudioFile $audioFile
    if ([string]::IsNullOrWhiteSpace($texto)) { Write-Host "No se entendió nada, probá de nuevo."; continue }
    Write-Host "Vos: $texto" -ForegroundColor Green

    Write-Host "Pensando..." -ForegroundColor DarkGray
    $respuesta = Preguntar-Claude -Texto $texto

    Write-Host "ORION: $respuesta" -ForegroundColor Cyan
    Hablar -Texto $respuesta
    Guardar-Log -Pregunta $texto -Respuesta $respuesta
}
