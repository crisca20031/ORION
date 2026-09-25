# Choque pediátrico: reconocimiento y manejo PALS/AHA 2025

Fecha: 2026-09-09
Fuente: exportado de una conversación con Claude

## Yo

CREA UNA PRESENTACIÓN POWERPOINT (.PPTX) DE NIVEL MÉDICO ESPECIALIZADO SOBRE “CHOQUE EN PEDIATRÍA: RECONOCIMIENTO, EVALUACIÓN Y MANEJO SEGÚN PALS/AHA 2025”, utilizando como fuente principal y actualizada las recomendaciones de la American Heart Association (AHA) y American Academy of Pediatrics (AAP), específicamente las 2025 AHA Guidelines for Cardiopulmonary Resuscitation and Emergency Cardiovascular Care, Pediatric Advanced Life Support (PALS) 2025 y sus algoritmos oficiales, complementando cuando sea necesario con las International Guidelines for the Management of Septic Shock and Sepsis-Associated Organ Dysfunction in Children de la Surviving Sepsis Campaign y literatura pediátrica reciente de alta calidad; NO utilizar como fuente principal versiones PALS anteriores a 2025 y verificar que todas las recomendaciones, dosis y algoritmos correspondan a la actualización 2025. La presentación debe tener aproximadamente 30–40 diapositivas, formato 16:9, diseño médico profesional, moderno y visual, dirigido a médicos generales, residentes de Pediatría, pediatras, médicos de urgencias y UCI pediátrica, evitando diapositivas saturadas de texto y priorizando algoritmos, flujogramas, tablas comparativas, esquemas fisiopatológicos, infografías, casos clínicos y perlas clínicas. Desarrollar: definición de choque, epidemiología, fisiopatología, relación entre gasto cardíaco, transporte y consumo de oxígeno, clasificación en shock hipovolémico, distributivo, cardiogénico y obstructivo, diferencias entre shock compensado y descompensado, reconocimiento temprano, Triángulo de Evaluación Pediátrica, ABCDE, evaluación de perfusión, signos vitales por edad, criterios de hipotensión pediátrica, evaluación neurológica, diuresis, lactato, gasometría, estudios de laboratorio, ECG, radiografía y POCUS/ecocardiografía, acceso IV/IO, oxigenación y ventilación, reanimación con líquidos, tipos de cristaloides, indicaciones, volúmenes y velocidad de administración según PALS 2025, reevaluación después de cada bolo, criterios para continuar o detener líquidos y signos de sobrecarga, manejo del shock séptico, shock frío y caliente, antibióticos, vasoactivos e inotrópicos, mecanismos de acción, indicaciones, dosis pediátricas, preparación, titulación, efectos adversos y precauciones de epinefrina, norepinefrina, dopamina y otros medicamentos relevantes, manejo del shock hipovolémico y hemorrágico, uso de hemoderivados, control de hemorragia, manejo del shock cardiogénico y prevención de sobrecarga de volumen, shock obstructivo y tratamiento de causas reversibles, shock refractario, criterios de escalamiento, indicaciones de UCI pediátrica y terapias avanzadas como ECMO cuando corresponda, monitorización de respuesta y objetivos de reanimación, errores frecuentes y “DO NOT”, algoritmo general de manejo del shock pediátrico y casos clínicos interactivos con preguntas y respuestas. Además, junto con la presentación, CREA UNA “REVISIÓN DE TEMA” COMPLETA Y PROFUNDA SOBRE CHOQUE PEDIÁTRICO PARA ESTUDIO INDIVIDUAL Y PREPARACIÓN DE LA EXPOSICIÓN, organizada como material académico complementario a las diapositivas, que incluya obligatoriamente: definición, epidemiología, etiologías, fisiopatología detallada, clasificación, manifestaciones clínicas, signos tempranos y tardíos, diferencias por tipo de shock, escalas y herramientas de evaluación cuando estén disponibles, categorías de evaluación, criterios diagnósticos, estudios de laboratorio e imagen, interpretación de hallazgos, enfoque ABCDE/PALS, algoritmos diagnósticos y terapéuticos, tratamiento paso a paso, indicaciones y contraindicaciones de líquidos, dosis exactas de medicamentos y vasoactivos en pediatría, mecanismos de acción, preparación y administración, criterios de respuesta, criterios de fracaso terapéutico, shock refractario, complicaciones y pronóstico; explicar cada concepto con suficiente profundidad para que el expositor pueda comprenderlo y explicarlo oralmente durante una conferencia, incluyendo “PERLAS PARA LA EXPOSICIÓN”, errores frecuentes, preguntas que podrían realizar durante la exposición y sus respuestas, puntos controversiales o cambios introducidos por PALS/AHA 2025, y ejemplos clínicos que permitan aplicar la teoría a pacientes reales. La revisión debe distinguir claramente qué recomendaciones provienen de PALS/AHA 2025 y cuáles de otras guías o literatura complementaria. Todas las dosifile:///C:/Users/CRISTIAN/Downloads/2024_PALS_Handbook.mds deben verificarse cuidadosamente, expresarse con unidades pediátricas correctas y acompañarse de las concentraciones o consideraciones necesarias para evitar errores de medicación. No extrapolar recomendaciones de adultos a niños. Incluir referencias bibliográficas actuales en formato Vancouver, con las fuentes citadas al final de la presentación y de la revisión. La presentación y la revisión deben ser coherentes entre sí, de manera que la revisión sirva como material de estudio para comprender y defender cada diapositiva durante la exposición. El producto final debe tener calidad de una presentación académica para una sesión de Pediatría de nivel universitario/especialización y debe priorizar la seguridad del paciente, la precisión de las dosis y la fidelidad a las recomendaciones PALS/AHA 2025.

## Claude

Voy a construir ambos materiales. Primero preparo el generador de la presentación.

La presentación está lista y verificada. Ahora construyo la revisión de tema.

## Yo

Continuar

## Yo

Continuar

## Claude

Ahora ejecuto el ensamblaje:

Buen resultado. Ahora la revisión visual y de contenido.

42 páginas — muy razonable para una revisión de tema completa. Verifiquemos visualmente algunas páginas clave.

El título "CHOQUE EN PEDIATRÍA" es invisible porque el color del texto coincide con el fondo oscuro. Corrijo eso.

Título corregido. Ahora reviso índice y algunas páginas de contenido con tablas y cajas.

Es esperado: el índice es un campo TOC que se actualiza con F9 en Word (documentado en el flujo de trabajo estándar). Continúo revisando contenido.

El formato general se ve muy limpio. Reviso el resto en detalle.

Se ve perfecto, es solo un salto de tabla natural. Continúo revisando el resto.

Detecté un bug real: la numeración de listas usa una sola referencia global, por lo que los números seguirán incrementándose por todo el documento en lugar de reiniciar en cada lista. Reviso y corrijo.

Ahora agrego `_resetOl()` a las demás funciones que delimitan bloques, y reescribo `num()` con numeración manual:

Ahora agrego `_resetOl()` a `box()`, `table()` y `mcq()`, y quito la dependencia de numbering config ya innecesaria:

Bien, `num()` en sí no llama a `_resetOl()`. Ahora quito la configuración de numbering ya innecesaria en buildDoc.js (no rompe nada si queda, pero la limpio) y reconstruyo.

Excelente — la numeración ahora reinicia correctamente en cada lista (1-3, 1-7, 1-10, etc.). El fix funcionó perfectamente. Verifico el resto de las listas y las páginas visualmente una vez más.

Todas las listas numeradas reinician correctamente. El único detalle cosmético es el espaciado extra en "10." (tabulación de un solo dígito vs dos), típico de un tab stop — es aceptable visualmente. Verifico las páginas restantes visualmente.

El documento se ve consistente y bien diagramado. Ahora presento ambos entregables finales.

Listos los dos entregables:

**1. Presentación (47 diapositivas, 16:9)** — cubre las 6 secciones que pediste: fisiopatología, clasificación, evaluación (TEP/ABCDE/POCUS), manejo inicial universal, manejo por tipo de choque, y refractariedad/casos clínicos. Con algoritmos, tablas comparativas, perlas clínicas y 2 casos interactivos.

**2. Revisión de tema (42 páginas)** — material de estudio profundo con 22 secciones, tabla de correspondencia diapositiva↔sección, 12 preguntas comentadas del auditorio y 12 MCQ estilo ENAM/USMLE con retroalimentación.

Una advertencia importante de transparencia metodológica que apliqué en ambos documentos: pude verificar directamente contra la fuente primaria de la AHA (cpr.heart.org) el texto íntegro de varias subsecciones del Part 8 — vía aérea, fármacos en paro, energías de desfibrilación, monitorización fisiológica durante RCP, cuidados posparo y neuropronóstico — pero **no pude recuperar literalmente la subsección específica "manejo de los tipos de choque"** de esa misma Part 8 (el sitio la entrega fragmentada y el PDF de Circulation está bloqueado para scraping). Por eso, en todo el material:

- Las recomendaciones sobre reanimación con líquidos y vasoactivos en el choque se atribuyen a **PALS 2020** (que 2025 mantiene vigente en temas no re-revisados) y a la **Surviving Sepsis Campaign pediátrica 2020**, nunca presentadas falsamente como "nuevas de 2025".
- Cada caja de guía indica su fuente exacta, y hay una nota de discrepancias documentadas (p. ej. cristaloides balanceados, regla de 6 vs. concentraciones estandarizadas) precisamente para que no se promedien silenciosamente.

Antes de exponer, te recomiendo contrastar las secciones 11-16 de la revisión contra el texto completo de la Part 8 (Circulation 2025;152:S479-S537) si tienes acceso institucional.

## Yo

Ahora crea la guía de estudio rapido detallada en formato pptx y pdf

## Yo

Continuar

## Yo

Realiza una guía de estudio rapido detallada, en formato pptx y pdf

## Claude

Perfecto, tengo la librería de diseño previa. Voy a construir una guía de estudio rápido (formato "cheat sheet" denso, tipo repaso pre-examen) usando la misma identidad visual, en PPTX y luego exportada a PDF.

Buena base. Ahora construyo la guía de estudio rápido como un documento nuevo, denso y en formato "cheat sheet" para repaso pre-examen.

22 diapositivas generadas. Ahora valido y convierto a PDF, y hago QA visual.

Ambos formatos generados. Ahora hago QA visual de todas las diapositivas.

Encontré el problema: la tabla ABCDE tiene columnas más angostas de lo previsto (la suma de `colW` no coincidía con el ancho asignado), causando desbordamiento sobre el cuadro inferior. Corrijo.

Ahora reviso sistemáticamente todas las demás tablas del documento para descartar el mismo problema de anchos.

Ahora reconstruyo y re-verifico todas las diapositivas afectadas.

Corregido perfectamente. Ahora verifico las otras dos.

Excelente, se ve limpio y proporcionado.

Los tres arreglos se ven perfectos. Ahora hago una revisión visual completa del resto de las 22 diapositivas para confirmar que no queden más problemas.

Todo se ve consistente. Reviso el resto de las diapositivas (10-22).

Todo se ve muy bien. Verifico las últimas 4 diapositivas (algoritmo, números clave, fuentes, cierre).

Todas las 22 diapositivas están limpias, bien alineadas y sin desbordamientos. Los archivos finales están listos.

Listo — la **Guía de Estudio Rápido** (22 diapositivas, 16:9), disponible en PPTX y PDF idénticos en contenido:

1. Portada + cómo usar la guía
2. Definición núcleo en una frase
3. TEP + ABCDE en 60 segundos
4. Signos vitales y fórmula de hipotensión (con ejemplo resuelto)
5. Compensado → descompensado → paro inminente
6. **Tabla maestra de los 4 tipos de choque** (mecanismo, precarga/GC/RVS, 1ª línea)
7. Frío vs. caliente (elección del vasoactivo)
8. Laboratorio de los primeros 15 min (checklist numerado)
9. Líquidos — cheat sheet por escenario
10. Cristaloides balanceado vs. salino
11. **Tabla maestra de vasoactivos** (dosis, titulación, cuidado clave — todo en una sola vista)
12. Regla de 6 + verificaciones de seguridad obligatorias
13. Choque séptico: checklist de la primera hora
14. Cardiogénico y obstructivo lado a lado
15. Choque refractario: qué descartar antes de escalar
16. Objetivos de reanimación
17. Los 10 errores más frecuentes
18. **Algoritmo maestro** (resumen visual de toda la guía en un diagrama)
19. Números para memorizar (formato tarjetas)
20. Fuentes
21. Cierre

Mantiene la misma identidad visual (colores, tipografía) que la presentación completa y la revisión de tema, para que las tres piezas se sientan como un solo set de materiales. Al final de la guía dejé una nota recordando que esto es para repaso rápido, no reemplaza el razonamiento fisiopatológico ni las discrepancias documentadas que sí están detalladas en los otros dos documentos.
