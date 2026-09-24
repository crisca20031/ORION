# Paso 3 — La voz (Windows)

Circuito: mantenés SPACE para hablar → whisper.cpp pasa tu audio a texto →
se lo mandás a Claude Code → la respuesta se convierte en audio con Piper →
se reproduce. Cada pedido y respuesta queda en `vault/pedidos/AAAA-MM-DD.md`.

Nada de esto sale de tu máquina.

## Instalar antes de correrlo

1. **Claude Code**
   ```powershell
   npm install -g @anthropic-ai/claude-code
   ```
2. **whisper.cpp** (voz → texto, local) — https://github.com/ggerganov/whisper.cpp
   Compilalo o bajá un release para Windows, y un modelo en español
   (`ggml-medium.bin` anda bien; `large-v3` si querés más precisión con
   acento rioplatense).
3. **Piper** (texto → voz, local) — https://github.com/rhasspy/piper
   Bajá el binario para Windows y una voz en castellano (`es_AR` o `es_ES`).
4. **SoX** (grabar/reproducir audio desde la terminal) —
   https://sourceforge.net/projects/sox/

Después, abrí `jarvis-voice.ps1` y ajustá las rutas de la sección `CONFIG`
a donde instalaste cada cosa.

## Correrlo

```powershell
powershell -ExecutionPolicy Bypass -File .\voice\jarvis-voice.ps1
```

Mantené SPACE apretada, hablá, soltala. `Ctrl+C` para salir.

## Si se complica

Es la parte más técnica de las cuatro y la que más depende de tu sistema
operativo. El resto del sistema (motor + memoria + HUD) funciona igual sin
esto: escribís en vez de hablar. Volvé a este paso cuando el resto ya esté
andando.
