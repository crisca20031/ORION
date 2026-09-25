# Reanimación cardiopulmonar neonatal: revisión completa basada en guías internacionales

Fecha: 2026-08-05
Fuente: exportado de una conversación con Claude

## Yo

En formato DOCX y en max 15 páginas, Actúa como un médico especialista en Pediatría, Neonatología y Reanimación Neonatal, con amplia experiencia clínica, docente y basado en las recomendaciones más recientes del International Liaison Committee on Resuscitation, American Academy of Pediatrics y el European Resuscitation Council. Realiza una revisión de tema completa, estructurada y orientada a medicina general y pediatría sobre Reanimación Cardiopulmonar (RCP) Neonatal, utilizando lenguaje claro pero con profundidad académica. Desarrolla los siguientes apartados: **definición y objetivos de la reanimación neonatal; epidemiología; fisiología de la transición cardiorrespiratoria al nacimiento; factores de riesgo prenatales e intraparto; preparación del equipo, personal y material; algoritmo completo de reanimación neonatal paso a paso; evaluación inicial (edad gestacional, tono, respiración/llanto); control térmico y prevención de hipotermia; apertura y manejo de la vía aérea; indicaciones para aspiración de secreciones; ventilación con presión positiva (indicaciones, técnica, dispositivos, parámetros y evaluación de la efectividad); secuencia correctiva MR SOPA; indicaciones de CPAP; intubación endotraqueal (indicaciones, técnica y confirmación de la posición); uso de mascarilla laríngea; compresiones torácicas (indicaciones, técnica, relación 3:1, profundidad y coordinación con la ventilación); administración de oxígeno (FiO₂ inicial según edad gestacional y metas de saturación por minuto de vida); monitorización (oximetría preductal, ECG y capnografía); acceso vascular (catéter venoso umbilical e intraóseo); medicamentos (adrenalina: mecanismo de acción, indicaciones, dosis, concentraciones, vías de administración y repetición; expansión de volumen: indicaciones, soluciones y dosis; otras terapias cuando estén indicadas); criterios para suspender o continuar la reanimación; cuidados posreanimación; indicaciones de hipotermia terapéutica; complicaciones; pronóstico; errores frecuentes durante la reanimación; perlas clínicas; diferencias entre la reanimación del recién nacido a término y el prematuro; modificaciones en situaciones especiales (líquido meconial, hernia diafragmática congénita, neumotórax, hidropesía fetal, gemelos y parto por cesárea); y un resumen final con los puntos clave para examen. Incluye tablas con dosis, tamaños de tubos endotraqueales, profundidad de inserción, tamaño de mascarillas, metas de saturación preductal, concentraciones de adrenalina, y un algoritmo diagnóstico-terapéutico explicado paso a paso, resaltando las recomendaciones fuertes y los cambios más recientes de las guías internacionales.

## Claude

Voy a construir el documento con el pipeline habitual. Primero verifico el entorno y preparo la estructura.

Ahora construyo el documento completo.

Detecté dos defectos de formato. Los corrijo y reordeno la figura 1 para eliminar el espacio en blanco de la página 1.

Documento de **13 páginas** (dentro del límite de 15), con los 29 apartados solicitados, 18 tablas, 2 figuras originales y el resumen de 20 puntos clave para examen.

**Un aviso importante sobre la vigencia de las guías.** Al verificar las fuentes encontré que el material cambió sustancialmente respecto a lo que probablemente estás enseñando: el **NRP 9.ª edición** se publicó el 22 de octubre de 2025 (obligatorio desde el 1 de junio de 2026), junto con el **ILCOR CoSTR 2025** y las **guías ERC 2025**. El documento está construido sobre esas versiones, no sobre la 8.ª edición. Los cambios con mayor impacto docente:

- La **aspiración salió del algoritmo** como paso inicial rutinario.
- **MR SOPA ya no es estrictamente secuencial**: se priorizan los pasos más probablemente útiles.
- La **máscara laríngea pasó de dispositivo de rescate a dispositivo primario** de ventilación.
- Frecuencia de ventilación **30–60 rpm** (antes 40–60) y PIP inicial sugerido **25 cm H₂O** con rango por edad gestacional.
- Profundidad del TET ahora **"punta-encía"** y tabla de calibres reajustada, con categoría nueva para < 800 g.
- La tabla de metas de SpO₂ **empieza a los 2 minutos**; se eliminó la fila de 1 minuto.
- FiO₂ inicial desglosada en **32–34 sem (21–30 %)** y **< 32 sem (≥ 30 %)**.
- El **bicarbonato de sodio fue retirado** de la reanimación en sala de partos.

Incluí una tabla comparativa "antes/ahora" (sección 29) precisamente para que sirva de material de transición con tus internos, y un recuadro sobre los tres puntos donde los protocolos institucionales colombianos necesitan actualizarse aunque la Resolución 3280 siga siendo compatible.

Un detalle de armado: el índice no lo incluí porque, con el límite de páginas, habría consumido casi una página completa. Si lo quieres, lo agrego y compenso reduciendo alguna tabla.

## Yo

Haz en formato PPTX, la guía rapida de estudio detallada

## Claude

Bien, las figuras están regeneradas. Ahora construyo el módulo de helpers para PPTX.

Detecté el problema: en `pptxgenjs`, `TextProps.text` debe ser una cadena plana (no un array anidado), a diferencia de las celdas de tabla que sí aceptan arrays. Corrijo los helpers de texto enriquecido.

Ahora agrego `flattenParas` al `module.exports` y vuelvo a probar:

Encontré la causa raíz en el XML: `pptxgenjs` emite un `<a:pPr>` por cada *run*, y el renderizador usa el último cuando hay texto en negrita dentro de una viñeta. Ajusto para fijar `bullet` en todos los runs del párrafo (el `align` global ya evita que esto rompa la agrupación):

Todo corregido. Los helpers están validados. Ahora construyo el deck completo de ~40 diapositivas.

Los 12 resultados son falsos positivos (la palabra española "todo" coincide con el patrón "TODO" en modo insensible a mayúsculas). Sin contenido de relleno real. Ahora la QA visual completa.

Excelente, bien proporcionado. Ahora reviso la diapositiva 8 (checklist) y la 9 (algoritmo completo).

Detecté un desbordamiento del callout final con el pie de página. Ajusto el espaciado.

He revisado a fondo la deck y confirmo el diagnóstico: el motor de construcción funciona bien (tablas, viñetas con negrita, imágenes, insignias y colores se ven correctamente), pero encontré **problemas de espaciado en varias diapositivas** que debo corregir antes de entregar el archivo final:

1. **Diapositiva 8** (checklist de material): el callout de error se superponía con el pie de página — **ya corregido**.
2. **Diapositiva 11** (los siete bloques): queda un vacío grande entre las viñetas y el recuadro de recomendación inferior — pendiente de ajustar (acercar el callout).
3. **Diapositiva 16** (dispositivos de ventilación): las tarjetas son mucho más altas de lo que su texto necesita, dejando un espacio en blanco muy grande en la mitad-inferior de cada tarjeta — necesito reducir la altura de las tarjetas o aumentar el tamaño de fuente/agregar contenido para que se vean equilibradas.

Este mismo patrón (contenedor dimensionado para el "peor caso" pero con texto corto) probablemente se repite en otras diapositivas con tarjetas o con combinación de viñetas cortas + callout inferior (por ejemplo, CPAP, máscara laríngea, efectividad de VPP). Antes de presentar el archivo voy a:

- Recorrer sistemáticamente las 42 diapositivas restantes buscando este mismo defecto de "hueco grande".
- Ajustar alturas de tarjetas/callouts para que el contenido quede visualmente equilibrado (ya sea acortando contenedores o enriqueciendo el contenido donde tenga sentido).
- Volver a renderizar y confirmar que no queden huecos ni desbordamientos.

¿Quieres que continúe con esta ronda de ajustes y te entregue el PPTX ya pulido, o prefieres ver primero el archivo tal como está (con estos huecos visuales pendientes) para darme tu visto bueno sobre el enfoque general antes de que invierta tiempo en el pulido fino?

## Yo

Continuar

## Claude

Confirmado: es un problema sistémico del helper `addCards` (estira las tarjetas para llenar todo el alto disponible). Lo arreglo en el helper para que las tarjetas usen una altura de fila natural y se centren, y así corrijo todas las diapositivas afectadas de una sola vez.

Ahora ajusto la altura de fila (`rowH`) en cada diapositiva según la longitud real de su contenido:

Ahora agrego un callout de cierre al hueco de la diapositiva 7 (preparación):

Ahora corrijo el hueco en "los siete bloques" acercando el callout:

Voy a hacer el ajuste de altura de tarjetas automático (igual que hice con los

## Claude

Bien, veo que los helpers de `addCards` y `addCallout` ya quedaron con altura natural (centrado vertical, sin estirar). Recompilo y verifico si esto resuelve los huecos.

Voy a hacer que `addCards` calcule la altura de fila a partir del contenido real (igual que ya hice con `addCallout`), en vez de usar una constante fija — así el padding interno queda proporcional al texto.

Mejor, pero ahora el hueco quedó arriba (por el centrado vertical). Es más predecible alinear las tarjetas arriba del bloque, dejando el margen sobrante abajo (como el resto del deck).

Ahora reconstruyo y reviso de forma sistemática las 42 diapositivas.

Falsa alarma, era un artefacto de compresión JPEG en la miniatura. Continúo revisando.

Ahora activo `center:true` en las diapositivas donde las tarjetas son el único contenido y corrijo la etiqueta "Cinco dominios":

Bien, coincide exactamente con lo esperado; el error anterior fue por espacios. Reintento con `sed` para mayor fiabilidad:

Ahora reconstruyo y reviso las diapositivas modificadas.

Voy a recalibrar el criterio: el centrado vertical en diapositivas con poco contenido es un patrón de diseño válido (no un defecto), siempre que no haya solapamientos ni cortes de texto. Reviso las hojas de contacto completas una vez más para detectar problemas reales.

This looks solid overall. Let me check contact sheets 2 and 3 for the remaining slides.

Buen momento para hacer un corte y contarte dónde va esto.

**Lo que ya está sólido:**
- El deck completo de 42 diapositivas compila, valida sin errores y renderiza correctamente en LibreOffice.
- El motor de negrita/viñetas quedó corregido (el bug de `pptxgenjs` que perdía el bullet en párrafos con **texto en negrita**).
- Las tarjetas ahora calculan su alto a partir del contenido real (título + descripción), en vez de estirarse a ciegas y dejar dos tercios de color vacíos.
- Diapositivas clave —el algoritmo completo, la dosis de adrenalina, MR SOPA, las tablas de FiO₂/SpO₂— se ven limpias, bien proporcionadas y consistentes con la paleta del DOCX.

**Lo que acabo de corregir en esta ronda:**
- Reactivé el centrado vertical (opt-in) para las diapositivas donde las tarjetas son el único contenido (dispositivos de ventilación, acceso vascular, monitorización, posreanimación, situaciones especiales, errores frecuentes, perlas clínicas), evitando que todo el vacío caiga en un solo bloque al fondo.
- Corregí una etiqueta inconsistente ("Cinco dominios" cuando en realidad mostraba seis).
- Añadí un callout de cierre a la diapositiva de "Expansión de volumen y otras terapias", que se quedaba con casi la mitad inferior en blanco.
- Acabo de reconstruir y renderizar el PDF con ese último cambio, pero se agotó el límite de herramientas de este turno antes de poder revisar visualmente el resultado final ni copiar el archivo a la carpeta de salida.

**Lo que falta antes de entregarte el archivo:**
1. Verificar visualmente la diapositiva de "Expansión de volumen" con el callout nuevo.
2. Un barrido final rápido de las diapositivas con tablas largas (complicaciones, término vs. prematuro, cambios 2025) que aún no revisé a resolución completa.
3. Copiar el `.pptx` final a la carpeta de salida y presentártelo con `present_files`.

¿Quieres que continúe en el siguiente mensaje para cerrar estos tres puntos y entregarte el archivo?

## Yo

Continuar

## Claude

Excelente, esa se ve perfecta. Continúo revisando las demás combinaciones tabla+callout.

No overlaps. Continúo con las restantes.

No overlap, buen espaciado. Continúo.

Excelente. Sigo con hipotermia, complicaciones, término vs prematuro, cambios 2025 y el cheat sheet final.

Bien. Sigo.

Ahora reviso las tres restantes (término vs prematuro, cambios 2025, cheat sheet).

Todas las combinaciones tabla+callout están libres de solapamientos. Reconstruyo con los tres callouts añadidos y hago la validación final completa.

Ahora las tres diapositivas recién modificadas, para confirmar que los nuevos callouts no se solapan con nada:

Perfecto.

Los tres callouts nuevos quedaron perfectos, sin solapamientos. El deck está terminado. Copio los archivos finales a la carpeta de salida.

Listo — la guía rápida en PPTX está terminada, con 42 diapositivas.

**Estructura:** portada → 4 partes (Fundamentos, El algoritmo, Fármacos y situaciones especiales, Resumen para examen) → cierre, con divisores intermedios.

**Diseño:** misma paleta que la revisión de tema en Word (azul marino, acentos por categoría — verde perlas, rojo errores, ámbar dosis, violeta cambios 2025), tablas con encabezado oscuro y filas alternadas, insignias circulares como motivo visual recurrente, y las dos figuras originales (algoritmo completo y cascada fisiológica) reutilizadas a página completa.

**Lo que corregí en esta ronda final:**
- Un solapamiento real entre un callout y una tabla (expansión de volumen).
- Tres diapositivas con tablas que dejaban la mitad inferior en blanco (complicaciones, término vs. prematuro, cambios 2025): les agregué un cierre con contenido genuino en vez de dejarlas vacías — el de cambios 2025 incluye la reconciliación con la Resolución 3280, siguiendo tu propio patrón de trabajo.
- Verifiqué uno por uno todos los cruces tabla+callout del documento para descartar solapamientos similares.

Validé el archivo con el esquema OOXML (sin errores) y revisé las 42 diapositivas renderizadas a imagen. Los dos archivos —DOCX de la revisión de tema y este PPTX— quedan como material complementario: uno para profundizar, el otro para repasar rápido antes de la exposición o el examen.
