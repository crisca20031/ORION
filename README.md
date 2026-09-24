# ORION

Segundo cerebro con manos, armado siguiendo la guía "Armá tu ORION" de
Juan Bertorello. Cuatro piezas modulares que se hablan por archivos, no por
conexiones cerradas: **motor** (Claude Code + skills) → **memoria** (vault)
→ **voz** (whisper.cpp + Piper, local) → **cara** (HUD).

Se arma de adentro hacia afuera. Cada paso ya sirve solo, no hace falta
llegar al final para que valga la pena.

## Paso 1 — El motor

Skills en `.claude/skills/`:

- **plan** — arma las 3 prioridades del día en `vault/plan/`.
- **inbox** — resume correo, agenda y novedades en `vault/salidas/`.
- **metricas** — busca tus números y los deja en `vault/salidas/`.
  ⚠️ Pendiente: completá tu fuente real en
  `.claude/skills/metricas/SKILL.md` (panel, planilla, página).
- **vault** — lee y escribe notas sueltas en `vault/crudo/`.

`CLAUDE.md` en la raíz tiene las reglas generales del sistema.

Para sumar más skills (oficiales de Anthropic, Superpowers, las de Obsidian):

```bash
npx skills add anthropics/skills -g
npx skills add obra/superpowers -g
npx skills add kepano/obsidian-skills -g
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

Para abrirlo lindo y navegarlo como grafo, usá [Obsidian](https://obsidian.md)
apuntando a esta carpeta, e instalá las skills del propio creador de Obsidian:

```bash
npx skills add kepano/obsidian-skills
```

Para memoria automática de sesiones (sin que hagas nada):

```bash
npx claude-mem install
```

## Paso 3 — La voz (opcional, corre en tu máquina, no acá)

Ver `voice/README.md`. Script para Windows en `voice/orion-voice.ps1`.
100% local: whisper.cpp escucha, Piper contesta.

## Paso 4 — El HUD

Panel oscuro de una sola pantalla que lee directo del vault (nunca inventa
un dato: si falta, muestra un guion).

```bash
python3 hud/server.py
# abrí http://localhost:8420/hud/
```

## Orden recomendado

1. Empezá por **una sola skill** (`plan`) y usala una semana entera.
2. Sumá memoria cuando sientas que perdés contexto entre sesiones.
3. Voz y HUD son comodidad — andá a ellos cuando el resto ya sea costumbre.

Los 5 errores que lo arruinan (según la guía): empezar por el HUD, poner
veinte skills el primer día, carpetas por tema en vez de por estado,
respuestas largas en las skills de voz, y no usarlo el primer día.
