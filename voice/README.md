# Paso 3 — La voz (Windows)

Circuito: apretás ENTER y hablás (se corta solo tras 1.5s de silencio) →
whisper.cpp pasa tu audio a texto → se lo mandás a Claude Code → la
respuesta se convierte en audio con Piper → se reproduce. Cada pedido y
respuesta queda en `vault/pedidos/AAAA-MM-DD.md`.

Nada de esto sale de tu máquina.

## Ya instalado en esta máquina

Las rutas de `orion-voice.ps1` ya están ajustadas a esta instalación:

| Programa | Ruta |
|---|---|
| Claude Code | instalado global (`npm install -g @anthropic-ai/claude-code`) |
| whisper.cpp | `C:\orion\whisper.cpp\whisper-cli.exe` |
| Modelo de voz a texto | `C:\orion\whisper.cpp\models\ggml-medium.bin` |
| Python | instalado desde python.org (con "Add to PATH") |
| Piper | `pip install piper-tts` (paquete de Python, no el `.exe` original) |
| Voz de Piper | `C:\orion\es_ES-davefx-medium.onnx` (bajada con `python -m piper.download_voices es_ES-davefx-medium`) |
| SoX | `C:\Program Files (x86)\sox-14-4-2\sox.exe` |

⚠️ El binario `piper.exe` original de github.com/rhasspy/piper **crashea
siempre** en esta máquina (código `-1073740791`, falla dentro de
`ucrtbase.dll`, un componente de Windows) — es una incompatibilidad entre
cómo está compilado ese binario (proyecto archivado, sin mantenimiento
desde 2023) y una build reciente de Windows, no algo arreglable desde el
script. Se usa en su lugar el paquete de Python `piper-tts`
(proyecto activo [OHF-Voice/piper1-gpl](https://github.com/OHF-Voice/piper1-gpl)),
que no tiene ese problema.

Si en algún momento reinstalás algo en otra ubicación, actualizá la
sección `CONFIG` al principio de `orion-voice.ps1` con la ruta nueva.

## Correrlo

```powershell
powershell -ExecutionPolicy Bypass -File .\voice\orion-voice.ps1
```

Apretá ENTER, hablá, y esperá — se corta solo tras 1.5s de silencio.
`Ctrl+C` para salir.

## Si se complica

Es la parte más técnica de las cuatro y la que más depende de tu sistema
operativo. El resto del sistema (motor + memoria + HUD) funciona igual sin
esto: escribís en vez de hablar. Volvé a este paso cuando el resto ya esté
andando.
