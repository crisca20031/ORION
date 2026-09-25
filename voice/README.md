# Paso 3 — La voz (Windows)

Circuito: mantenés SPACE para hablar → whisper.cpp pasa tu audio a texto →
se lo mandás a Claude Code → la respuesta se convierte en audio con Piper →
se reproduce. Cada pedido y respuesta queda en `vault/pedidos/AAAA-MM-DD.md`.

Nada de esto sale de tu máquina.

## Ya instalado en esta máquina

Las rutas de `orion-voice.ps1` ya están ajustadas a esta instalación:

| Programa | Ruta |
|---|---|
| Claude Code | instalado global (`npm install -g @anthropic-ai/claude-code`) |
| whisper.cpp | `C:\orion\whisper.cpp\main.exe` |
| Modelo de voz a texto | `C:\orion\whisper.cpp\models\ggml-medium.bin` |
| Piper | `C:\orion\piper\piper.exe` |
| Voz de Piper | `C:\orion\piper\es_AR-daniela-high.onnx` |
| SoX | `C:\Program Files (x86)\sox-14-4-2\sox.exe` |

Si en algún momento reinstalás algo en otra ubicación, actualizá la
sección `CONFIG` al principio de `orion-voice.ps1` con la ruta nueva.

## Correrlo

```powershell
powershell -ExecutionPolicy Bypass -File .\voice\orion-voice.ps1
```

Mantené SPACE apretada, hablá, soltala. `Ctrl+C` para salir.

## Si se complica

Es la parte más técnica de las cuatro y la que más depende de tu sistema
operativo. El resto del sistema (motor + memoria + HUD) funciona igual sin
esto: escribís en vez de hablar. Volvé a este paso cuando el resto ya esté
andando.
