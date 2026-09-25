# Decisiones

<!-- Una línea por decisión que tomaste, con la fecha y el porqué.
Se escribe de a una línea por vez, cuando pasa la cosa. -->

- 2026-09-24 — Se arma el sistema ORIÓN en este repo, siguiendo la guía
  "Armá tu ORIÓN" de Juan Bertorello, porque se quiere un segundo cerebro
  con memoria persistente en vez de reexplicar contexto en cada sesión.
- 2026-09-25 — Se ajusta el nombre: el asistente se llama "ORIÓN" (con
  tilde), aunque el repositorio de GitHub sigue llamándose "ORION" (sin
  tilde, por convención de nombres de repos).
- 2026-09-25 — Se instala `claude-mem` (memoria automática de sesiones)
  con `npx claude-mem install --provider claude`, para que corra sobre el
  plan propio de Claude sin necesidad de crear una cuenta en cmem.ai ni
  sincronizar nada a la nube — mantiene la misma filosofía 100% local
  del resto del sistema. Se declinó también la telemetría anónima, por
  el mismo motivo.
- 2026-09-25 — Se completa el resto de la guía: Obsidian instalado y
  apuntando a este vault, skills de Obsidian (`kepano/obsidian-skills`),
  skills oficiales de Anthropic (`anthropics/skills`, 20 skills) y
  Superpowers (`obra/superpowers`) instaladas globalmente. Se decidió
  dejar `context7` pendiente (requiere cuenta e internet, no es local) y
  se retoma solo si hace falta más adelante para programar. Se armó la
  tarea "ORION Inbox" en el Programador de tareas de Windows: corre
  `/inbox` todos los días a las 7:00 y deja el resumen en
  `vault/salidas/`. También se instala Ollama (modelos locales) — probado
  con `ollama run gemma4`, funcionando. Con esto queda 100% completo todo
  lo que pide la guía "Armá tu ORIÓN", incluidos los extras opcionales
  (solo `context7` queda pendiente a propósito).
