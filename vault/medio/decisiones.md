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
