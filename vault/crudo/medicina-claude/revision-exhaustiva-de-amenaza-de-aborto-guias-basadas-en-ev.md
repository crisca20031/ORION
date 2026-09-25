# Revisión exhaustiva de amenaza de aborto: guías basadas en evidencia

Fecha: 2026-07-21
Fuente: exportado de una conversación con Claude

## Yo

En formato de DOCX, Actúa como un médico especialista en Ginecología y Obstetricia, Medicina Materno-Fetal, Embriología, Fisiología, Patología Obstétrica y Medicina Basada en la Evidencia, con experiencia docente universitaria. Realiza una revisión exhaustiva, estructurada y orientada a la práctica clínica sobre "Amenaza de aborto", fundamentada en las guías más recientes de ACOG, RCOG, FIGO, NICE, OMS, ESHRE y el Ministerio de Salud de Colombia, además de referencias como Williams Obstetricia, Gabbe, Novak y UpToDate. La revisión debe incluir: **definición; terminología y clasificación del aborto; epidemiología; embriología y fisiología de la implantación y del primer trimestre; anatomía y fisiología materno-fetal relacionadas; fisiopatología de la amenaza de aborto; factores de riesgo y factores protectores; etiología (embrionaria, materna, uterina, endocrina, inmunológica, infecciosa, trombofílica y ambiental); manifestaciones clínicas; diagnóstico diferencial con otras causas de sangrado del primer trimestre; anamnesis dirigida; examen físico; estudios de laboratorio e imagen (incluyendo interpretación detallada de β-hCG y ecografía obstétrica según la edad gestacional); criterios diagnósticos y criterios de viabilidad embrionaria; escalas o herramientas pronósticas si existen; algoritmo diagnóstico; manejo inicial en urgencias; tratamiento farmacológico y no farmacológico, explicando para cada medicamento su mecanismo de acción, indicaciones, dosis, vía, duración, contraindicaciones, efectos adversos y nivel de evidencia (incluyendo progesterona, inmunoglobulina anti-D cuando esté indicada y otros tratamientos relevantes); indicaciones de hospitalización y manejo ambulatorio; seguimiento clínico y ecográfico; criterios de remisión a mayor complejidad; complicaciones maternas y fetales a corto y largo plazo; pronóstico; prevención; recomendaciones al egreso; signos de alarma; controversias actuales; perlas clínicas; errores frecuentes en el diagnóstico y manejo; y un apartado final con los puntos clave para exámenes y práctica clínica. Explica cada tema desde la fisiología hasta la aplicación clínica, prioriza tablas comparativas, algoritmos diagnósticos y terapéuticos, cuadros resumen y esquemas que faciliten el aprendizaje, e indica al final de cada apartado las recomendaciones más importantes junto con la guía que las respalda y el año de publicación.

## Claude

Voy a preparar una revisión exhaustiva en DOCX. Primero verifico algunos detalles de guías recientes para que las atribuciones y años sean precisos.

He confirmado los detalles clave de las guías. Ahora construyo el documento. Configuro primero el entorno y el script.

Ahora escribo el script con todo el contenido clínico. Es un documento extenso, así que lo construyo con funciones auxiliares y secciones numeradas.

Ahora agrego las secciones de contenido. Secciones 1–4:

Secciones 5–8:

Secciones 9–14 (clínica, diagnóstico diferencial, β-hCG y ecografía, criterios de viabilidad):

Secciones 15–20 (pronóstico, algoritmo, urgencias, tratamiento farmacológico, hospitalización, seguimiento):

Secciones 21–29 (remisión, complicaciones, pronóstico, prevención, egreso/alarmas, controversias, perlas, errores, puntos clave) y referencias:

Ahora agrego el ensamblaje del documento (estilos, numeración, encabezado/pie, generación del archivo):

Se generó correctamente. Ahora lo convierto a PDF para verificar visualmente el resultado:

Encontré el problema: `bullets()`/`nums()` devuelven arrays y la función `B` los empujaba sin aplanar. Lo corrijo:

XML válido y tamaño mayor (contenido completo). Convierto a PDF y reviso:

El diseño se ve limpio y profesional. Reviso la tabla de contenido y una página de perlas/errores:

La TOC aparece vacía en la conversión (LibreOffice no puebla campos; Word sí lo hará al abrir). Añado la bandera para que Word actualice el índice automáticamente. Reviso antes unas páginas más:

Detecto que la numeración de las recomendaciones se acumula entre secciones (17, 18…). Lo cambio a viñetas con flecha para que cada bloque sea independiente, y activo la actualización automática del índice:

La lista numerada del algoritmo también continúa el conteo entre secciones (15, 16…). Cada bloque `nums()` debe reiniciar en 1. Creo un conjunto de referencias de numeración independientes:

La numeración reinicia correctamente. Verifico las tablas de tratamiento y las secciones finales:

Todo el documento se ve pulido y completo (22 páginas, 30 secciones). Valido el archivo y lo copio a la carpeta de salida:

Documento listo: **revisión clínica estructurada sobre "Amenaza de aborto"** en DOCX, 22 páginas, 30 secciones numeradas, con portada, índice automático (se puebla al abrir en Word y aceptar "Actualizar campos"), encabezado y pie con paginación.

**Formato aplicado** (según tu esquema habitual): secciones numeradas con encabezados descriptivos, **tablas comparativas** con encabezado sombreado, **algoritmos** diagnóstico y terapéutico, negritas en hallazgos clave dentro de la prosa, y recuadros diferenciados por color — *perlas clínicas* (verde), *errores frecuentes* (rojo), *recomendaciones clave* (azul) y *puntos clave para examen* (ámbar). Cada apartado cierra con **"Recomendaciones clave y respaldo (guía · año)"**.

**Contenido cubierto:** definición; terminología y clasificación; epidemiología; embriología/fisiología de la implantación y transición luteoplacentaria; anatomía y fisiología materno-fetal; fisiopatología; factores de riesgo/protectores; etiología por grupos; clínica; diagnóstico diferencial del sangrado del 1.er trimestre; anamnesis; examen físico; interpretación de β-hCG (dinámica ≥ 35–53 %/48 h, zona discriminatoria 1500–2000 vs. 3500 mUI/mL de ACOG) y ecografía por edad gestacional; criterios de no viabilidad (CRL ≥ 7 mm / DMS ≥ 25 mm, SRU 2013); herramientas pronósticas; algoritmo; urgencias; tratamiento con mecanismo, dosis, vía, contraindicaciones y nivel de evidencia (progesterona micronizada vaginal 400 mg BID según PRISM 2019/NICE NG126 2021; anti-D); hospitalización vs. ambulatorio; seguimiento; remisión; complicaciones; pronóstico; prevención; egreso y signos de alarma; controversias; perlas; errores; puntos clave, y referencias.

Puntos de matiz que reflejé como controversia y no como dogma: la **progesterona solo beneficia al subgrupo con sangrado + aborto previo**, y la **anti-D antes de las 12 semanas** con cérvix cerrado tiene evidencia débil (RCOG más restrictiva). Verifica siempre la presentación de anti-D disponible en tu institución (250 UI vs. 300 µg).

Si quieres, puedo añadir un **diagrama SVG del algoritmo diagnóstico** o una **versión en Markdown descargable** para tus diapositivas.
