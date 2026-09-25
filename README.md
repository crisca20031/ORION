# ORIÓN

Segundo cerebro con manos, armado siguiendo la guía "Armá tu ORIÓN" de
Juan Bertorello. Cuatro piezas modulares que se hablan por archivos, no por
conexiones cerradas: **motor** (Claude Code + skills) → **memoria** (vault)
→ **voz** (whisper.cpp + Piper, local) → **cara** (HUD).

Se arma de adentro hacia afuera. Cada paso ya sirve solo, no hace falta
llegar al final para que valga la pena.

## Paso 1 — El motor

Skills propias en `.claude/skills/`:

- **plan** — arma las 3 prioridades del día en `vault/plan/`.
- **inbox** — resume correo, agenda y novedades en `vault/salidas/`.
- **metricas** — **✅ completa** — lee `vault/crudo/metricas.md` (una
  plantilla que completás vos a mano) y te resume cómo venís, en
  `vault/salidas/`.
- **vault** — lee y escribe notas sueltas en `vault/crudo/`.

`CLAUDE.md` en la raíz tiene las reglas generales del sistema.

Skill packs adicionales — **✅ instalados** (globales, disponibles en
cualquier proyecto):

```bash
npx skills add anthropics/skills -g      # documentos, planillas, diseño
npx skills add obra/superpowers -g       # 86 skills de desarrollo
npx skills add kepano/obsidian-skills    # formato correcto para el vault (por proyecto)
```

## Paso 2 — La memoria

`vault/` — carpeta con archivos de texto plano, sin depender de ningún
programa:

```
vault/
├── crudo/     lo que entra sin procesar
├── medio/     lo ya masticado (quien-soy.md, decisiones.md, aprendizajes.md)
├── pedidos/   lo que se le pidió al sistema por voz
├── plan/      planes diarios (AAAA-MM-DD.md)
└── salidas/   lo que produjo (métricas, resúmenes, textos)
```

Completá `vault/medio/quien-soy.md` con tus datos reales — es lo primero que
Claude lee para no tratarte como a un desconocido.

Para abrirlo lindo y navegarlo como grafo — **✅ instalado**, usá
[Obsidian](https://obsidian.md) apuntando a esta carpeta (`Open folder as
vault`).

Para memoria automática de sesiones (sin que hagas nada) — **✅ instalado**,
corriendo local con tu propio plan de Claude, sin cuenta ni sincronización a
la nube:

```bash
npx claude-mem install --provider claude
```

(El `--provider claude` es importante: sin él, el instalador pide crear una
cuenta en cmem.ai. Con ese flag corre 100% en tu plan, sin cuenta.)

## Paso 3 — La voz — **✅ instalado y probado**

Ver `voice/README.md`. Script para Windows en `voice/orion-voice.ps1`.
100% local: whisper.cpp escucha, Piper (paquete `piper-tts` de Python)
contesta con voz `es_ES-davefx-medium`.

## Paso 4 — El HUD — **✅ armado**

Panel oscuro de una sola pantalla que lee directo del vault (nunca inventa
un dato: si falta, muestra un guion).

```bash
python3 hud/server.py
# abrí http://localhost:8420/hud/
```

## Extras de la guía

- **context7** (evita código desactualizado al programar) — ⏸️ pendiente a
  propósito: requiere cuenta e internet, no es local como el resto. Se
  instala con `npx ctx7 setup --claude` cuando haga falta.
  Link de la guía: `github.com/upstash/context7`.
- **Tarea programada** — **✅ armada**: "ORION Inbox" en el Programador de
  tareas de Windows corre `/inbox` todos los días a las 7:00 y deja el
  resumen en `vault/salidas/`. Requiere que la compu esté prendida y con
  sesión iniciada a esa hora.
  - Pausarla: `schtasks /change /tn "ORION Inbox" /disable`
  - Reactivarla: `schtasks /change /tn "ORION Inbox" /enable`
  - Borrarla: `schtasks /delete /tn "ORION Inbox" /f`
- **Ollama** (modelos locales para tareas chicas: clasificar, resumir
  corto, dejando a Claude para lo pesado) — **✅ instalado y probado**
  (`ollama run gemma4`). Link de la guía: `github.com/ollama/ollama`.

## Orden recomendado

1. Empezá por **una sola skill** (`plan`) y usala una semana entera.
2. Sumá memoria cuando sientas que perdés contexto entre sesiones.
3. Voz y HUD son comodidad — andá a ellos cuando el resto ya sea costumbre.

Los 5 errores que lo arruinan (según la guía): empezar por el HUD, poner
veinte skills el primer día, carpetas por tema en vez de por estado,
respuestas largas en las skills de voz, y no usarlo el primer día.
