# Revisión de líquidos y electrolitos en pediatría

Fecha: 2026-08-11
Fuente: exportado de una conversación con Claude

## Yo

COMO MÉDICO ESPECIALISTA EN PEDIATRÍA, CREA UNA REVISIÓN DE TEMA SOBRE LÍQUIDOS Y ELECTROLITOS, EN BASE AL PROMT ADJUNTO EN EL "PASTED"

## Claude

No encuentro los archivos en el disco del entorno, así que reviso el estado antes de construir.

Toolchain lista. Empiezo por las figuras originales.

Figuras listas. Ahora construyo el DOCX. Empiezo por el módulo de helpers.

Ahora las secciones de contenido. Empiezo por preliminares y fundamentos.

Verifico que el andamiaje compila antes de seguir escribiendo.

El formato funciona bien. Continúo con las secciones restantes.

## Claude

## Estado del trabajo

Alcancé el límite de herramientas de esta respuesta con el proyecto avanzado pero **sin los archivos finales generados todavía**. Te resumo con precisión dónde quedó todo.

### Advertencia importante sobre las fuentes

De los dos archivos que adjuntaste, **solo el PDF pudo leerse**. El archivo `REVISIÓN_LIQUIDOS_Y_ELECTROLITOS.pptx` no llegó al sistema de archivos del entorno, así que su contenido **no está incorporado**. Todo lo construido hasta ahora se basa íntegramente en el PDF (apunte del 12 de julio de 2024), que sí se extrajo completo. Si el PPTX contiene tablas o esquemas ausentes en el PDF, habría que volver a cargarlo.

### Lo que ya está construido

**8 figuras originales** (Python/matplotlib, con QA visual y correcciones aplicadas): distribución del agua corporal por edad, composición iónica LIC/LEC en espejo, efecto de la tonicidad sobre la célula, Holliday-Segar vs. regla 4-2-1, algoritmo de hiponatremia, corredores seguros de corrección de disnatremias, cambios ECG del potasio, y algoritmo integrado de fluidoterapia.

**Secciones del DOCX escritas y compilando** (verificado: 32 páginas renderizadas correctamente con portada, TOC, encabezados, cuadros de color y tablas cebra): secciones 0 a 18, es decir, nota metodológica, objetivos, conceptos fundamentales, compartimentos, composición, osmolaridad/tonicidad, regulación fisiológica, balance hídrico, soluciones IV, mantenimiento, Holliday-Segar, deshidratación, SRO/planes A-B-C, rehidratación IV y shock, los cuatro componentes, hiponatremia, hipernatremia, hipokalemia e hiperkalemia.

**Pendiente:** secciones 19–28 (Ca/Mg/P, ácido-base, situaciones especiales, complicaciones, algoritmos, tablas de consulta rápida, perlas/errores, 8 casos clínicos, 15 preguntas, «lo imprescindible»), el ensamblaje final del DOCX y la creación completa del PPTX.

### Hallazgo más relevante: 15 discrepancias documentadas en la fuente

Este es probablemente el valor añadido más útil del trabajo. Las más importantes:

- **«Severa: > 125» en hiponatremia** — errata evidente; debe leerse 120–125, o la categoría se solapa con «moderada».
- **«Descenso del pH» como causa de redistribución en hipokalemia** — invertido: es la alcalosis la que introduce K⁺ a la célula. El propio apunte lo consigna correctamente en hiperkalemia.
- **Orden estándar «500 cc DAD 5% + 20 cc Natrol + 5 cc Katrol»** — resulta en ≈80 mEq/L de Na⁺, es decir hipotónica, frente a la recomendación vigente de mantenimiento isotónico en el niño hospitalizado.
- **«4 mL/kg de agua libre disminuyen 1 mEq/Na/h»** — error de unidad: bajan el Na⁺ en 1 mEq/L, no por hora.
- **BNP «liberado por sobredistensión auricular»** — es el ANP; además la enumeración de efectos está invertida.
- **El ejemplo integrado del lactante de 7,5 kg** aporta 84 mEq en 1350 mL = 62 mEq/L (hipotónico). El método clásico de déficit funciona porque el bolo apaga la ADH, pero obliga a control de sodio a las 4–6 h. Verifiqué toda la aritmética del ejemplo: es correcta (84 mL/h coincide exactamente).
- **«LIC 40 % del ACT»** — deben ser porcentajes del peso corporal; la propia tabla de la fuente lo confirma.

También verifiqué que el apunte es **internamente coherente** en un punto elegante: la regla de 1,2 mL/kg de SS 3 % por mEq/L coincide exactamente con la fórmula 0,6 × peso × ΔNa.

**Si me lo confirmas en el siguiente mensaje, retomo desde aquí** y completo las secciones 19–28, el DOCX final y el PPTX de 20–30 diapositivas. Todo el andamiaje (helpers, build.js, figuras) está listo y probado, así que el tramo restante es principalmente redacción de contenido. Si además vuelves a cargar el PPTX, lo integro en la misma pasada.

## Yo

Continuar

## Claude

Ambos entregables están listos.

**Documento (101 páginas, 28 secciones):** portada, índice automático (F9 en Word), nota metodológica, y las 28 secciones del índice que pediste. Incluye 8 figuras originales, 11 casos clínicos progresivos resueltos en formato fórmula → datos → sustitución → resultado → interpretación → conducta, 15 preguntas tipo examen con explicación de cada distractor, y la sección final «Lo imprescindible para guardia y examen» con los 20 datos de memoria.

**Presentación (28 diapositivas):** portada, mapa del tema, fundamentos, cálculo, deshidratación, sodio, potasio, algoritmo global, discrepancias, errores frecuentes, los 20 datos de memoria y cierre. Cada diapositiva lleva la fuente al pie y notas del orador.

**Advertencia importante sobre las fuentes:** de los dos archivos que adjuntaste, **solo el PDF pudo leerse**. El `REVISIÓN_LIQUIDOS_Y_ELECTROLITOS.pptx` nunca llegó al sistema de archivos del entorno. Todo se construyó sobre el apunte del 12 de julio de 2024. Si el PPTX contiene tablas o esquemas ausentes en el PDF, vuelve a cargarlo y hago una segunda pasada de integración.

**Lo separado explícitamente:**

- **15 discrepancias** en recuadros naranja, consolidadas en la Tabla 0.2. Las de mayor peso clínico: la orden estándar de 500 cc DAD 5% + 20 cc Natrol aporta 80 mEq/L de sodio (hipotónica, mecanismo de la hiponatremia hospitalaria, desarrollado con cálculo completo en el caso 11); «descenso del pH» como causa de redistribución en hipokalemia está invertido; «4 mL/kg bajan 1 mEq/Na/h» es error de unidad (mEq/L, no por hora); «severa >125» se solapa con moderada; el BNP es ventricular, no auricular.
- **Contenido complementario** en recuadros morados, marcado como no respaldado: SRO y planes A/B/C, Ca/Mg/P, equilibrio ácido-base, y el desarrollo de las situaciones especiales.

Verifiqué la aritmética de todos los ejemplos de la fuente: son correctos. Y hay una coincidencia elegante que aproveché como herramienta de verificación rápida en el documento — la regla de 1,2 mL/kg de SS 3% y la fórmula 0,6 × peso × ΔNa son aritméticamente idénticas, así que cada una comprueba a la otra en segundos.

## Yo

Ahora dame las versiones en PDF

## Claude

Ahí están los cuatro archivos.

**PDF del documento — 103 páginas.** Un detalle que resolví: la tabla de contenido del DOCX es un campo de Word que solo se rellena al presionar F9, así que en el PDF habría salido en blanco. Para esta versión generé un índice estático real, con los 145 títulos (29 secciones y 116 subsecciones) y sus números de página verificados uno por uno contra el PDF final. También corregí una página en blanco que quedaba entre la portada y el índice.

**PDF de la presentación — 28 diapositivas** en formato apaisado 16:9, listo para proyectar o imprimir como material de repaso.

Mantuve los originales editables: el DOCX (recuerda el F9 sobre el índice) y el PPTX con sus notas del orador.

Una diferencia entre las dos versiones del documento que conviene tener presente: el DOCX indexa hasta el tercer nivel de títulos, mientras que el índice estático del PDF llega hasta el segundo. Si prefieres que el PDF baje también al tercer nivel, lo regenero.

## Yo

Concreta el DOCX a máximo 15 -20 páginas, y sácalo también en PDF

## Claude

**17 páginas**, dentro del rango. La reconstruí desde cero en lugar de recortar la extensa: márgenes de 0,8", cuerpo a 9,5 pt y arquitectura de tablas en vez de prosa.

**Qué se conservó íntegro** — todo lo que se consulta o se pregunta:

- Las 15 tablas de datos duros: compartimentos, composición iónica, regulación, balance e insensibles, soluciones, Holliday-Segar, signos de deshidratación, déficit por peso, clasificación de hiponatremia, hipokalemia, fármacos de hiperkalemia.
- Todas las fórmulas y equivalencias, incluidas las dos recetas de SS 3 % y las conversiones de Natrol/Katrol.
- Las dos listas de excepciones (bolo y dextrosa) con el porqué de cada una.
- Las 15 discrepancias, ahora en una sola tabla de consulta con la precisión al lado.
- Los 20 datos de memoria y las cinco cosas que nunca se hacen.
- Las dos figuras de mayor rendimiento: ECG del potasio y algoritmo integrado.

**Qué se sacrificó:** la argumentación fisiopatológica extendida, el desarrollo de Ca/Mg/P, ácido-base y situaciones especiales, seis de las ocho figuras, y los 11 casos clínicos. Estos últimos se comprimieron a **5 cálculos resueltos** en el formato completo (rehidratación integrada de 14 kg, hiponatremia, hipernatremia, hipokalemia y la cuenta del agua libre en la orden estándar) más **10 preguntas de verificación con respuesta razonada** en tabla, en lugar de las 15 de opción múltiple con distractores.

Un detalle de formato: esta versión no lleva índice automático. Con 17 páginas y diez secciones numeradas, la tabla de contenido costaba media página y aportaba poco; si la prefieres, la agrego.
