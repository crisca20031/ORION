# RCP pediatrico

Fecha: 2026-08-10
Fuente: exportado de una conversación con Claude

## Yo

En formato DOCX, realiza una revisión de tema con las indicaciones adjuntas en el “TXT”, adicionalmente crea una presentación a modo de material de estudio rápido

## Yo

En formato DOCX, en Max 15-20 páginas, realiza una revisión de tema con las indicaciones adjuntas en el “TXT”, adicionalmente crea una presentación a modo de material de estudio rápido

## Claude

Ahora la presentación de estudio rápido.

Listo, Camilo. Ambos materiales están construidos y verificados visualmente.

**Documento DOCX — 20 páginas exactas**, formato Carta, con encabezado, pie con numeración y tabla de contenido en portada. Cubre los 33 apartados del TXT reorganizados en 29 secciones sin perder contenido: fisiopatología explicada como cascada (el *por qué* de cada paso), tablas comparativas por grupo etario, algoritmos numerados paso a paso, tabla completa de fármacos con concentración/dosis/volumen/preparación práctica con ampolla colombiana, 5H y 5T, 5 casos clínicos resueltos con cálculo de dosis, y 20 preguntas tipo quiz con respuestas comentadas (verificado que las opciones no revelan la respuesta).

**Un hallazgo importante:** las guías vigentes ya no son las de 2020. El **22 de octubre de 2025 se publicaron las Guías AHA/AAP 2025** (Parte 6 PBLS y Parte 8 PALS, *Circulation* 152 supl 2), junto con las **ERC/RCUK 2025**. Construí todo el material sobre ellas. Los ocho cambios que van a preguntarle en la exposición:

- **Se eliminó la técnica de 2 dedos en el lactante** → talón de una mano o 2 pulgares abarcadores
- **OVACE en el niño ahora inicia con 5 golpes interescapulares** + 5 compresiones abdominales
- **Adrenalina lo antes posible en ritmo no desfibrilable**; en desfibrilable, tras 2 desfibrilaciones
- **PAD ≥25 mmHg (lactante) / ≥30 mmHg (niño ≥1 año)** durante la RCP con línea arterial
- **Usar EtCO₂ para suspender la RCP es Clase 3: Daño**
- **Presión post-paro subió del percentil 5 al 10**
- **Evitar temperatura >37,5 °C**, monitorización central continua
- **Sotalol IV** entra al algoritmo de TSV refractaria

Incluí una tabla explícita de divergencias AHA vs. ERC 2025 (energía inicial 2 vs. 4 J/kg, choques apilados, relación C:V, peso ideal en obesidad), priorizando AHA como pediste implícitamente al ser el estándar de certificación local.

**Presentación PPTX — 20 diapositivas**, paleta azul profundo/rojo crítico, sin viñetas planas: tarjetas, pasos numerados, cifras grandes y tablas. Cierra con una **"tarjeta de bolsillo"** que resume todo en una pantalla. Validación estructural: aprobada.

Dos notas de honestidad clínica: no incluí dosis específica de sotalol IV (la guía no la fija y exige monitorización de QTc — remito a protocolo institucional y cardiología), y señalé que la "dosis mínima de atropina de 0,1 mg" carece de sustento sólido aunque muchos protocolos la conservan.

Solo me quedó pendiente la inspección visual de las diapositivas 2 y 11 tras el último ajuste de altura de tarjetas y tamaño de tabla; el resto quedó revisado sin desbordes ni solapamientos. Si quieres, en un siguiente turno las verifico y te entrego los archivos con `present_files`, o los ajusto: puedo agregar figuras programáticas (trazados de ritmos, diagramas de algoritmo) al DOCX como en tus documentos previos, aunque eso lo llevaría por encima de las 20 páginas.

## Yo

Continuar

## Claude

QA visual completo de las 20 diapositivas. Corregí tres defectos que encontré en la inspección:

- **Diapositiva 11** (fármacos): la tabla se desbordaba y chocaba con el pie de página tras el ajuste de fuente — reducida a un tamaño intermedio legible.
- **Diapositiva 8** (algoritmo desfibrilable): los pasos iban en zigzag (1 izquierda, 2 derecha, 3 izquierda…), difícil de seguir en un algoritmo. Ahora es columnar: **1–4 a la izquierda, 5–8 a la derecha**, consistente con la diapositiva de SVB.
- **Diapositiva 3**: el título de la primera tarjeta se solapaba con el cuerpo al ocupar dos líneas.

Sin desbordes, solapamientos ni texto de relleno en el resto. Validación estructural del PPTX: aprobada.

**Entregables** (incluyo los PDF para que puedas abrirlos en el celular durante la guardia sin depender de Office):

| Archivo | Contenido |
|---|---|
| **DOCX — 20 págs** | Revisión completa: 29 secciones, tabla de fármacos con preparación práctica, 5 casos resueltos, 20 preguntas comentadas, tarjeta de guardia |
| **PPTX — 20 diapositivas** | Material de estudio rápido, cierra con tarjeta de bolsillo |

Dos observaciones para la exposición: la tabla de **divergencias AHA vs. ERC 2025** (pág. 2 del DOCX) es probablemente lo más rentable si el auditorio incluye docentes, porque muestra que conoces las dos escuelas y por qué priorizas una. Y el punto que más se falla en quiz y en la práctica real sigue siendo el mismo: **FC <60 con hipoperfusión pese a ventilación adecuada = comprimir**. Lo dejé marcado en rojo en ambos materiales.

Si quieres, en otro turno puedo agregar al DOCX figuras programáticas —trazados de ritmos en matplotlib y diagramas de flujo de los algoritmos, como en tus documentos de monitoreo fetal y HPP—, aunque eso lo llevaría a unas 26–28 páginas y rompería el límite que fijaste.

## Yo

Realiza nuevamente la revisión de tema sobre RCP pediátrico, teniando como principio la guía AHAy PALS más actualizada, te dejo la que tengo por el momento, necesito que todo sea muy algoritmico para su ejecución, detallando todo, desde definiciones, causas, etc

## Claude

El entorno se reinició, así que voy a reconstruir la librería base y luego el contenido nuevo, mucho más algorítmico. No usaré ningún texto del PDF que subiste (tiene aviso de copyright de Satori/Disque Foundation): tomo solo su lista de temas como referencia estructural y redacto todo el contenido desde cero con base en las **Guías AHA/AAP 2025** que ya investigué (son más recientes que el manual 2023 que compartiste, basado en 2020).

Ahora el contenido, empezando por el marco 2025 y el enfoque sistemático (nuevo, muy algorítmico).

Ahora bradicardia, taquicardia y paro cardiorrespiratorio, con algoritmos de reconocimiento explícitos (nuevos) además de los de respuesta.

Ahora vía aérea, accesos, fármacos, desfibrilación/cardioversión y las 5H/5T.

Ahora post-resucitación (algorítmico por sistemas), situaciones especiales, OVACE, errores, casos, quiz, resumen y referencias.

Excelente estructura. Reviso algunas páginas más críticas: choque, paro y OVACE.

Muy sólido. Reviso la sección de paro con las cajas de color rojo/naranja en los pasos (feature nueva: chips coloreados en algo()).

Todo perfectamente contenido, sin desbordes. Reviso las últimas páginas (quiz, resumen, referencias) y termino.

Todo bien contenido, sin desbordes en ninguna de las 16 páginas revisadas. Entrego el documento.

Rehecho, Camilo — 16 páginas, 100% algorítmico, verificado visualmente sin desbordes.

**Nota importante sobre la fuente:** el PDF que subiste (*PALS Provider Handbook*, Dr. Karl Disque, Satori Continuum Publishing) está basado en las **guías de 2020** y tiene copyright explícito, así que no tomé ni una frase de su texto — solo usé su lista de capítulos como referencia de qué temas cubre un curso PALS clásico. Todo el contenido lo redacté de nuevo con base en las **Guías AHA/AAP 2025** (las que ya había investigado en este chat), que reemplazan formalmente las de 2020 en las que se apoya ese manual.

**Qué cambió estructuralmente frente al documento anterior:**

- **Nuevo "Enfoque sistemático" al inicio** (Impresión general → ABCDE → Clasificación → Evaluación secundaria/terciaria) que funciona como *router*: cada hallazgo lo dirige a la sección correcta.
- **Dos secciones completamente nuevas y algorítmicas** que antes eran solo tablas: **Dificultad/Falla Respiratoria** (con algoritmo de reconocimiento de 7 pasos + causas por categoría anatómica + tratamiento dirigido por causa) y **Choque** (algoritmo de reconocimiento + 4 ramas de tratamiento específicas: hipovolémico, séptico, anafiláctico, cardiogénico, obstructivo).
- **Bradicardia y taquicardia** ahora tienen algoritmo de *reconocimiento* explícito (no solo de respuesta) — por ejemplo, la bifurcación QRS estrecho/ancho en taquicardia como primer paso de decisión.
- **Post-resucitación reorganizado por sistema** (respiratorio, cardiovascular, neurológico, renal, GI, hematológico), cada uno como checklist ejecutable.
- **Chips de color en los pasos críticos**: los pasos de decisión de alto riesgo (iniciar compresiones, dar adrenalina, descargar) aparecen en rojo dentro de la secuencia numerada, para que salten a la vista en medio de una tabla larga.

Mantuve intactos los 8 cambios 2025 frente a 2020, las dosis con preparación práctica, las 5H/5T, OVACE, errores frecuentes, casos y quiz — pero todo reencuadrado en la lógica algorítmica que pediste.

Si quieres, en el siguiente turno puedo actualizar también la presentación PPTX de estudio rápido para que siga esta misma estructura de "reconocimiento → causas → respuesta", o generar diagramas de flujo visuales (rectángulos y flechas) en lugar de las tablas numeradas, que darían una sensación aún más de flujograma clínico real.

## Yo

Ahora con las misma instrucciones genera la guía de repaso rapido en formato pptx/pdf

## Claude

Buen momento para revisar la skill de pptx (ya la leí antes en esta conversación) y construir el deck alineado a la nueva estructura algorítmica del DOCX.

26 diapositivas, coherente con las 26 secciones planeadas. Reviso las más críticas visualmente.

Se ve bien pero con bastante espacio vacío abajo a la izquierda. Voy a revisar 8-9 (choque) y 15-16 (paro), que son las más densas.

Bien contenida y con la numeración columnar correcta. Verifico las tablas más densas (fármacos, energía) y el cierre.

Contenido correcto, aunque hay bastante aire debajo — es aceptable dado que la tabla no necesita más filas. Reviso el cierre (26) y el quiz-free content check.

Excelente, todo bien contenido sin desbordes. Corro el chequeo de contenido por placeholders/texto residual y verifico un par más de diapositivas antes de entregar.

Sin residuos reales (los dos matches son "TODO EN UNA PANTALLA" y contenido clínico legítimo, no placeholders). Reviso dos diapositivas más antes de cerrar.

Todo bien. Copio los archivos finales y los entrego.

Listo — 26 diapositivas en PPTX y PDF, siguiendo exactamente la misma lógica algorítmica del documento: **enfoque sistemático → dificultad/falla respiratoria → choque (4 tipos) → bradicardia → taquicardia → SVB → paro (desfibrilable/no desfibrilable) → fármacos → energía → vía aérea/accesos → 5H/5T → post-RCE por sistema → OVACE → errores → tarjeta de bolsillo**.

Validación estructural (`validate.py`): aprobada. QA visual de las diapositivas más densas (choque, algoritmos de paro, tabla de fármacos, 5H/5T, tarjeta de bolsillo): sin desbordes ni solapamientos. Sin texto placeholder residual.

Dos diapositivas (5 y 22) quedaron con algo de espacio libre en la mitad inferior porque su contenido natural no llenaba más — preferí eso a rellenar con relleno artificial que no aporte.

Si quieres, en un siguiente turno puedo:
- Convertir algunas diapositivas clave (SVB, paro desfibrilable/no desfibrilable) en **diagramas de flujo reales** con flechas y formas de decisión en lugar de listas numeradas, dándole aspecto de flujograma clínico.
- Ajustar el número de diapositivas si 26 es demasiado para tu tiempo de exposición.
