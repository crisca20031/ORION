# Quemaduras en pediatría: presentación académica

Fecha: 2026-09-18
Fuente: exportado de una conversación con Claude

## Yo

Actúa como médico especialista en Pediatría y experto en el manejo del paciente pediátrico quemado. Crea una presentación académica en formato PPTX sobre “QUEMADURAS EN PEDIATRÍA”, basada principalmente en la guía institucional de quemaduras del Hospital Universitario Hernando Moncaleano Perdomo, con un máximo de 30 diapositivas, dirigida a estudiantes de Medicina e internos de Pediatría. Incluye definición, epidemiología, etiología, clasificación según profundidad y extensión, evaluación inicial ABCDE, estimación de la superficie corporal quemada (Lund y Browder), criterios de gravedad, reanimación hídrica, manejo del dolor, tratamiento inicial de las heridas, indicaciones de hospitalización y remisión a unidades especializadas, manejo de quemaduras térmicas, químicas y eléctricas, complicaciones y prevención. Incorpora algoritmos, tablas comparativas, imágenes ilustrativas y casos clínicos. Explica brevemente la fisiopatología y los fundamentos del tratamiento, incluyendo dosis pediátricas cuando corresponda. Añade notas del presentador para facilitar la exposición y finaliza con conclusiones y referencias bibliográficas. Utiliza la guía institucional como fuente principal y complementa únicamente con bibliografía científica actualizada cuando sea necesario. TODO EN BASE A LA GUÍA ADJUNTA, MÁXIMO 30 DIAPOSITIVAS

## Claude

Sigo revisando la guía para tener todo el contenido clínico antes de estructurar la presentación.

Ahora sigo con la sección de reanimación hídrica, ABCDE, dolor, tratamiento inicial, tipos especiales (térmica, química, eléctrica), hospitalización y remisión.

Continuando con el resto: reanimación hídrica (Galveston/Carvajal), analgesia, tratamiento heridas, quemaduras eléctricas/químicas, hospitalización, prevención.

Sigo revisando el resto del contenido: pronóstico, quemaduras eléctricas/químicas, hospitalización, prevención, hidratación diferida.

Ahora construyo el script completo del deck. Voy a estructurarlo con funciones auxiliares para mantener consistencia visual a lo largo de las 30 diapositivas.

Ahora valido el archivo y hago QA de contenido y visual.

Sin resultados problemáticos (esos matches son de "TODO" dentro de palabras normales, falsos positivos). Ahora la QA visual, convirtiendo a imágenes.

Buena. Sigo revisando el resto en lote.

Bien pero hay mucho espacio vacío abajo. Es aceptable pero podría mejorarse — sigo revisando el resto primero para priorizar arreglos.

Bien, aunque hay espacio vacío en la parte inferior izquierda. Continúo.

Excelente. Sigo.

Muy bien. Continúo.

Excelente diagrama de capas de piel. Continúo revisando.

Bien pero con espacio vacío grande. Continúo.

Muy buena. Continúo.

Muy buena. Continúo revisando el resto.

Bien. Continúo.

Bien pero con mucho espacio vacío en la parte inferior. Continúo.

Excelente, muy claro. Continúo.

Excelente. Continúo con las siguientes.

Excelente. Continúo.

Excelente. Continúo con las siguientes.

Bien. Continúo.

Bien. Continúo.

Bien. Continúo.

Bien. Continúo.

Excelente. Continúo.

Muy bien, buen cierre del caso. Continúo.

Bien. Y la última.

Detecté algunos problemas de diseño que corregiré: contraste del pie de página en diapositivas oscuras, franjas laterales de color (prohibidas por la guía de diseño) en la diapositiva 12, y flechas que no se renderizan bien en la diapositiva 17.

Ahora agrego el footer a las diapositivas 15 y 30 (que no lo tenían) con el flag dark, y reviso la 1 (no necesita número de página al ser portada, pero verifiquemos):

Encontré varios ajustes de diseño pendientes en la presentación antes de darla por terminada. Resumen del estado actual:

**Contenido (completo y correcto):** Las 30 diapositivas cubren todo lo solicitado —introducción/epidemiología (global y del estudio local HUHMP 2015-2019), definición, fisiopatología, etiología, clasificación por profundidad y extensión (Lund-Browder, regla de los 9, palma), localización y gravedad, complicaciones sistémicas, un caso clínico hilado a lo largo de la presentación (introducido en la diapositiva 15 y resuelto en la 28), ABCDE, reanimación hídrica (Parkland y Galveston con dosis exactas), manejo del dolor y ansiedad con dosis pediátricas, soporte nutricional, tratamiento de la herida, escarotomía, quemaduras eléctricas/químicas, criterios de remisión ABA, índice de Garcés, prevención, y conclusiones con referencias. Todo basado en la guía institucional del HUHMP, con notas del presentador en cada diapositiva.

**Validación técnica:** El archivo pasó la validación estructural (`validate.py` → "All validations PASSED") y el QA de contenido (sin texto placeholder, sin errores).

**Problemas visuales detectados en el QA que estoy corrigiendo ahora mismo:**
1. Bajo contraste del pie de página en las diapositivas de fondo oscuro (1, 15, 30) — ya corregido en el código, falta aplicar el parámetro a esas diapositivas específicas.
2. La diapositiva 12 usa franjas de color en el borde izquierdo de las tarjetas, que la guía de diseño prohíbe explícitamente (se ven como "AI-generado") — pendiente de reemplazar por otro recurso visual.
3. En la diapositiva 17, las flechas "→" entre los pasos no se renderizan bien (aparecen como guiones) — pendiente de sustituir por una forma o carácter que sí renderice correctamente.

Estoy en el proceso de aplicar estas tres correcciones y luego regeneraré el PDF/imágenes para una verificación visual final antes de entregar el archivo .pptx definitivo. En mi próxima respuesta completaré estos ajustes y te compartiré el archivo terminado.

## Yo

Continuar

## Claude

Aplico las tres correcciones: dark footer en 1/15/30, quitar franjas laterales en slide 12, y arreglar flechas en slide 17.

Ahora la diapositiva 1 (portada) y la 30 (cierre) — reviso si tienen footer:

Slide 1 no tiene footer (correcto para portada, no lo necesita). Ahora corrijo la diapositiva 30:

Ahora corrijo la diapositiva 12: quito las franjas laterales prohibidas y uso un ícono numerado como en otras diapositivas.

Ahora corrijo las flechas de la diapositiva 17, reemplazándolas por triángulos vectoriales (forma), que sí renderizan correctamente:

Ahora regenero el archivo y vuelvo a verificar las tres diapositivas corregidas.

Bien (sin cambios necesarios aquí). Ahora reviso las diapositivas 12, 15, 17 y 30 corregidas.

Se eliminaron correctamente las franjas laterales, ahora usa el mismo motivo de ícono circular numerado consistente con el resto del deck. Reviso las diapositivas 15, 17 y 30.

Ahora el pie de página es legible. Reviso 17 y 30.

Las flechas triangulares ahora se renderizan correctamente. Reviso la 30.

Todo el pie de página es legible ahora. Confirmo con un QA de contenido final y luego entrego el archivo.

Falsos positivos (contienen "TODO" dentro de palabras como "método"). Todo correcto. Presento el archivo final.

Aquí está la presentación completa: **30 diapositivas** basadas en la guía institucional del HUHMP, cubriendo definición, epidemiología (global y local del estudio 2015-2019), fisiopatología, clasificación por profundidad y extensión (Lund-Browder, regla de los 9, palma), ABCDE, reanimación hídrica con fórmulas exactas (Parkland/Galveston), analgesia con dosis pediátricas, soporte nutricional, tratamiento de heridas, quemaduras eléctricas/químicas, criterios de remisión ABA, índice de Garcés y prevención — con un caso clínico hilado a lo largo de la charla, notas del presentador en cada diapositiva y referencias bibliográficas.
