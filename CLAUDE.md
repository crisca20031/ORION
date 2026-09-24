# ORION

Este proyecto es un "segundo cerebro con manos": Claude Code es el motor, `vault/`
es la memoria, y las skills en `.claude/skills/` son las neuronas que se prenden
según lo que se pida.

## Quién soy

Leé `vault/medio/quien-soy.md` al arrancar cualquier conversación para saber
quién sos y en qué estás.

## Reglas del sistema

- **Una skill, un propósito.** No mezcles tareas distintas en la misma skill.
- **El vault es la única fuente de verdad.** No inventes datos: si algo no
  está en `vault/`, se muestra como guion (`—`), nunca como un número o dato
  inventado.
- **Respuestas cortas.** Las skills pensadas para voz responden en una o dos
  frases, sin explicaciones de más, salvo que se pida lo contrario.
- **Todo se mueve en una sola dirección:** `crudo/ → medio/ → salidas/`. Nada
  se borra.

## Estructura del vault

```
vault/
├── crudo/     lo que entra sin procesar: notas sueltas, audios, links
├── medio/     lo ya masticado: resúmenes, decisiones, aprendizajes
├── pedidos/   lo que se le pidió al sistema, para repetirlo después
├── plan/      los planes diarios (AAAA-MM-DD.md)
└── salidas/   lo que produjo: métricas, textos terminados
```

## Antes de escribir en el vault

1. Leé lo que necesites en `medio/` antes de trabajar.
2. Escribí siempre con fecha (`AAAA-MM-DD`).
3. Preferí enlazar notas (estilo `[[nota]]`) antes que duplicar contenido.
