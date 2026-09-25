# NAC y bronquilitis

Fecha: 2026-08-10
Fuente: exportado de una conversación con Claude

## Yo

EJECUTA EL PROMT ADJUNTO EN EL PASTED

## Yo

REALIZA UNA PRESENTACIÓN PARA UNA REVISIÓN DE TEMA, EN BASE AL PROMTP ADJUNTO EN EL "PASTED"

## Claude

Voy a construir el documento. Primero preparo el entorno y el módulo de helpers.

Ahora construyo el esqueleto del documento y el módulo de portada.

Ahora el módulo principal de neumonía adquirida en la comunidad.

Ahora la Parte B, bronquiolitis.

## Claude

Ahora el módulo transversal: comparación, abordaje, algoritmos y farmacología.

## Estado del trabajo

Camilo, alcancé el límite de herramientas de esta respuesta con el documento parcialmente construido. Te resumo lo que ya está listo y lo que falta, para que retomemos en el siguiente turno.

### Ya construido

**Infraestructura** (`/home/claude/nac-bronq/`)
- `lib/helpers.js` — módulo compartido con la arquitectura habitual: formato Carta, parseo inline de `**negrita**`/`*cursiva*`, seis tipos de caja (clave, perla, alerta, error, norma, nota), tablas con filas alternas y anchos DXA, bloque `recomendacion()` con fuente y grado GRADE, y `figura()` devolviendo array (aplicado el spread para evitar el XML malformado).
- `build.js` — ensamblador con TOC, numeración de viñetas, encabezado y pie con paginación.
- **9 figuras originales** ya generadas y revisadas visualmente (corregí desbordamientos de texto en las figuras 5, 6 y 9).

**Contenido escrito (4 de 7 módulos)**
- Portada, TOC, convenciones y nota metodológica.
- **Parte A – NAC**: 17 capítulos, 19 tablas, desde definición hasta prevención.
- **Parte B – Bronquiolitis**: capítulos 18–27, incluyendo CNAF en detalle.
- **Parte C – Integración**: NAC vs bronquiolitis, ABCDE, 10 algoritmos numerados, tabla farmacológica en tres bloques (mecanismo / dosis / ajustes y efectos adversos) y la comparativa Colombia vs internacional.

### Hallazgos de la búsqueda que vale la pena que sepas ya

Verifiqué las fuentes contra los documentos originales y encontré **tres actualizaciones posteriores a la GPC 42** que cambian el contenido respecto de lo que probablemente esperabas:

1. **IDSA/PIDS publicó en marzo de 2026 la primera entrega de la actualización de la guía de NAC pediátrica de 2011** (Clin Infect Dis, ciag186), dedicada al derrame paraneumónico: ecografía sobre TAC, observación en derrames pequeños, tubo ≤ 12 Fr, tubo + fibrinolítico antes que VATS, y tPA solo antes que tPA + DNasa.
2. **Colombia incorporó la vacuna materna contra VSR (RSVpreF/Abrysvo) al PAI nacional en noviembre de 2025**, para gestantes de 28–36 semanas. Nirsevimab **no** está en el PAI nacional; Bogotá inició estrategia distrital intrahospitalaria en febrero de 2026.
3. Extraje **textualmente** las 15 recomendaciones de la GPC 42 desde el PDF de MinSalud, así que las dosis, grados GRADE y puntos de buena práctica están citados literalmente, no de memoria.

### Falta

- `04_sintesis.js` (perlas, errores frecuentes, qué no hacer, datos que cambian la conducta, resumen de guardia, qué memorizar)
- `05_quiz.js` (30 preguntas tipo ENAM con respuestas comentadas)
- `06_referencias.js` (referencias completas con enlaces)
- Compilar, renderizar a PDF, revisar página por página y entregarte el archivo

Dime "continúa" y termino el ensamblaje.

## Claude

Voy a construir la presentación. Primero armo el andamiaje del proyecto (tema, motor de render modular) y luego el contenido.

Encontré varios desbordes de tablas y espacio desaprovechado en el quiz. Los corrijo en el motor de render:

Ahora rediseño las diapositivas de quiz y respuestas para 3 por lámina, con el círculo alineado arriba:

Listo, Camilo. La presentación está construida, validada y revisada visualmente.

**Archivo:** `/mnt/user-data/outputs/NAC-y-Bronquiolitis-Pediatria-Revision-de-Tema.pptx` — **88 diapositivas**, formato 16:9 panorámico, en español, con voz de médico interno expositor y **fuente bibliográfica al pie de cada lámina**.

**Estructura**

| Bloque | Contenido |
|---|---|
| Apertura | Portada, hoja de ruta, jerarquía metodológica y tabla de fuentes |
| A · NAC (26) | Definición, epidemiología, etiología por edad, fisiopatología en 6 pasos, clínica por edad, FR y saturación por altitud, hospitalización/UCI, laboratorios, viral vs bacteriana, radiología y ecografía, diferenciales, algoritmos ambulatorio y hospitalizado, 2 tablas farmacológicas, patógenos específicos, derrame/empiema/absceso, alta y PAI |
| B · Bronquiolitis (18) | Definición, VSR, concepto BAR, fisiopatología, examen físico, qué NO pedir, diferenciales, 5 pilares de soporte, metas de O₂, hidratación, CNAF (mecanismo + algoritmo), tabla de lo que no se recomienda, alta y prevención |
| C · Transversal (18) | Tabla comparativa NAC vs bronquiolitis en 2 láminas, razonamiento probabilístico, ABCDE, escalera de soporte, 2 algoritmos maestros, tabla farmacológica de bolsillo, Colombia vs internacional (2 láminas), perlas, errores, qué no hacer, datos que cambian la conducta, resumen de guardia y "lo que debo memorizar" |
| D · Quiz (20) | 25 preguntas de dificultad progresiva + respuestas comentadas con justificación |
| E · Referencias (5) | 26 referencias con enlace, separadas en colombianas, internacionales y evidencia primaria |

**Hallazgos de la búsqueda que vale la pena que revise antes de exponer** (son posteriores a la GPC colombiana y varios son de este año):

- **IDSA/PIDS publicó una actualización en 2026** sobre derrame paraneumónico: ecografía por encima de TAC/RM, observación en derrames pequeños, **tubo ≤12 Fr** y **tPA solo, sin DNasa**, y drenaje+fibrinolítico antes que cirugía. Es la novedad más "vendible" ante docentes.
- **Colombia incorporó la vacuna materna RSVpreF al PAI desde noviembre de 2025** (gestantes de 28–36 semanas; >53.000 dosis a febrero de 2026), y **Bogotá inició nirsevimab intrahospitalario el 24 de febrero de 2026**. La implementación es territorial, así que dejé una advertencia explícita para verificar el lineamiento vigente en Huila.
- De la GPC No. 42 recuperé y cité textualmente lo que más se olvida: **amoxicilina 90 mg/kg/día × 5 días**, **penicilina cristalina 250.000 UI/kg/día**, **ampicilina 200 mg/kg/día en 4 dosis × 7 días si el esquema de Hib está incompleto**, y la escala de hipoxemia por altitud (**≤94 % de 0 a 1.500 msnm** — el umbral que aplica en Neiva).

**Nota de honestidad metodológica:** marqué literalmente "**no se identificó recomendación colombiana específica**" en CNAF, ecografía torácica y fibrinolíticos, porque la GPC es de 2014 y no los cubre. También evité cifras epidemiológicas nacionales puntuales y remito al boletín del INS.

Si quiere, puedo generar la versión DOCX extensa que complementa esta exposición, o una versión condensada de ~35 diapositivas para una franja de 45 minutos.

## Yo

Continuar

## Claude

Continúo con el documento de revisión extenso en DOCX, que complementa la presentación.

## Yo

Necesito la presentación de máximo 30-40 diapositivas, en formatos de power point listo para descargar

## Claude

Entendido — versión condensada. Reutilizo el mismo motor y selecciono el contenido esencial:

La hoja de ruta todavía anuncia secciones que no están en esta versión (quiz, algoritmos completos). La ajusto:

Versión condensada lista: **39 diapositivas**, PPTX validado y renderizado.

**Cómo quedó distribuida** (aprox. 45–50 minutos de exposición):

| Bloque | Diapositivas | Contenido |
|---|---|---|
| Apertura | 2 | Portada y hoja de ruta |
| **A · NAC** | 15 | Definición, etiología por edad, fisiopatología en 6 pasos, clínica por edad, FR/oximetría, hipoxemia por altitud, hospitalización y UCI, viral vs bacteriana, radiografía y ecografía, tratamiento ambulatorio y hospitalizado, tabla de antibióticos con dosis, derrame/empiema con IDSA/PIDS 2026, alta y PAI |
| **B · Bronquiolitis** | 12 | Definición y BAR, factores de riesgo, fisiopatología, qué NO pedir, 5 pilares de soporte, metas de O₂ Colombia vs mundo, CNAF (mecanismo + algoritmo), intervenciones no recomendadas, alta y signos de alarma, prevención del VSR |
| **C · Transversal** | 8 | Tabla comparativa unificada, ABCDE, Colombia vs internacional, perlas, errores frecuentes, resumen de guardia, "lo que debo memorizar" |
| Cierre | 2 | Referencias con enlace y diapositiva final |

**Qué recortó respecto a la versión de 88:**
- El quiz completo de 25 preguntas con respuestas comentadas.
- Los algoritmos maestros por separado (quedan integrados en los flujos de tratamiento y CNAF).
- Diapositivas de epidemiología detallada, factores de riesgo de NAC, laboratorios ampliados, absceso/necrosis, patógenos específicos y escalar/desescalar.
- Las dos tablas comparativas se fusionaron en una sola de 11 filas.
- La tabla de fuentes inicial (redundante: cada diapositiva conserva su fuente al pie).

**Qué se conservó íntegro:** los umbrales de saturación por altitud, todas las dosis exactas con distinción mg/kg/día vs mg/kg/dosis, la actualización IDSA/PIDS 2026, la prevención del VSR en Colombia 2025–2026 y las declaraciones explícitas de "no se identificó recomendación colombiana específica".

Le dejo también el archivo extenso por si quiere usarlo como material de estudio o para el quiz posterior. Si necesita bajar a 25–30 diapositivas para una franja de 30 minutos, o que le devuelva el quiz como anexo separado, lo ajusto.

## Yo

Ahora realiza la revisión de tema en máximo 20-30, en formado DOCX y PDF, adicionalmente una presentación en formato PPTX para estudio rápido

## Claude

Ahora construyo el documento de revisión (DOCX + PDF, 20–30 páginas) y luego el PPTX de estudio rápido.

37 páginas. Ajusto para entrar en el rango de 20–30:

30 páginas exactas. Reviso el renderizado:

El documento está correcto. Genero el PDF final y el PPTX de estudio rápido:

Listo, Camilo. Tres entregables nuevos:

**1 y 2 · Revisión de tema — 30 páginas exactas (DOCX + PDF)**

Formato Carta, encabezado y pie con numeración, tabla de contenido automática (**recuerde presionar F9 en Word** para poblarla), recuadros codificados por color (concepto clave, normativa colombiana, alerta, perla, error, evidencia), 23 tablas y 4 algoritmos en cascada.

| Secciones | Contenido |
|---|---|
| 1 | Introducción, alcance y jerarquía de fuentes |
| 2 · NAC | Definición, epidemiología, etiología por edad, factores de riesgo, fisiopatología en 6 pasos, clínica por edad, taquipnea, hipoxemia por altitud, hospitalización/UCI, laboratorios, viral vs bacteriana, imágenes, diferenciales, tratamiento con dosis, patógenos específicos, IV→VO, NAC complicada, alta y prevención |
| 3 · Bronquiolitis | Definición y BAR, epidemiología, factores de riesgo, fisiopatología, evaluación y escalas, qué no pedir, diferenciales, soporte, metas de O₂, CNAF/CPAP/VM, intervenciones no recomendadas, complicaciones, alta y prevención del VSR |
| 4–9 | Tabla comparativa de 16 filas, ABCDE, 4 algoritmos, tabla farmacológica de 20 fármacos, Colombia vs internacional, perlas, errores, qué no hacer, datos que cambian la conducta, resumen de guardia, "lo que debo memorizar" |
| 10–11 | 16 preguntas con respuestas comentadas en tabla + referencias con enlace |

**3 · PPTX de estudio rápido — 17 diapositivas**

Es un mazo de repaso, no una conferencia: sin narrativa, todo cifras, umbrales, dosis y algoritmos. Incluye instrucción de uso (tapar la columna derecha y responder antes de leer), la tabla de altitud, etiología por edad, decisión terapéutica en 5 pasos, fases del derrame con la actualización 2026, qué NO pedir / qué NO dar en dos columnas enfrentadas, los 4 números de la CNAF, prevención del VSR, "las nueve trampas" y una tarjeta de bolsillo final.

**Para reducir de 37 a 30 páginas** recorté el quiz de 20 a 16 preguntas, pasé las respuestas comentadas a formato de tabla, eliminé saltos de página redundantes y compacté interlineados y márgenes de celda — sin quitar contenido clínico.

Si quiere, puedo devolver el quiz a 25 preguntas como anexo independiente en PDF, o generar una versión imprimible del mazo de estudio rápido (2 diapositivas por hoja) para llevar en el bolsillo de la bata.

## Yo

El formato PPTX hazlo en 30 diapositivas y que sea más detallado

## Claude

Amplío el mazo de estudio a 30 diapositivas con mayor profundidad:

Mazo de estudio ampliado: **30 diapositivas exactas**, validado y revisado visualmente.

**Lo que agregué respecto a la versión de 17** (13 diapositivas nuevas, todas de contenido clínico):

| Bloque | Diapositivas nuevas |
|---|---|
| NAC | Fisiopatología completa en 6 pasos (colonización → shunt → agotamiento) · Semiología de gravedad con las cuatro formas de medir mal la FR, el quejido como autoPEEP y las señales que engañan · Viral vs bacteriana enfrentadas · Qué laboratorios pedir y cuáles no (6 tarjetas) · Lectura de la placa por patrón + ecografía vs TAC · Tabla de antibióticos I (10 fármacos con mecanismo, dosis, máximo y adversos) · Tabla de antibióticos II (S. aureus, SAMR, tPA) · Escalar/desescalar/IV→VO y el checklist de fracaso terapéutico · Algoritmo completo de derrame y empiema |
| Bronquiolitis | Fisiopatología en 6 pasos con la ley de Poiseuille · Examen físico que cambia decisiones + escalas de severidad y sus limitaciones · Los 5 pilares del soporte · Metas de saturación Colombia vs internacional |
| Diferenciar | Diagnóstico diferencial completo (7 entidades con "qué me hace dudar" y "cómo lo aclaro") · Tabla Colombia vs guías internacionales |

**Cómo llegué a 30 exactas:** eliminé las dos diapositivas separadoras de sección (A y B). En un mazo de repaso no aportan —el rótulo superior de cada lámina ya identifica el bloque ("Repaso · NAC · Farmacología")— y así conservé el 100 % del contenido clínico.

**Se mantiene el carácter de estudio, no de conferencia:** cada diapositiva es autocontenida, con la fuente al pie, y sigue el diseño de "tape el bloque derecho y responda antes de leer". Las tres diapositivas de cierre (nueve trampas, tarjeta de bolsillo, tres ideas finales) siguen funcionando como repaso terminal.

Si quiere, puedo generarlo también en PDF apaisado para imprimir 2 o 4 diapositivas por hoja.

## Yo

Te falta fisiopatología, semiología y demás, la parte clínica y paraclínica, complementa

## Yo

Te falta fisiopatología, semiología y demás, la parte clínica y paraclínica, complementa, puedes ampliar a 40 diapositivas

## Claude

Amplío a 40 diapositivas reforzando fisiopatología, semiología y paraclínicos:

Ampliado a **40 diapositivas**, con el refuerzo concentrado justo donde lo pidió.

**Las 10 diapositivas nuevas**

*Fisiopatología de base (3)*
- **"Por qué el niño no es un adulto pequeño":** las seis diferencias mecánicas con su consecuencia clínica — ley de Poiseuille (1 mm de edema en una vía de 4 mm multiplica la resistencia ~16 veces), poros de Kohn y canales de Lambert inmaduros, caja torácica distensible, diafragma con pocas fibras tipo I, consumo de O₂ de 6–8 mL/kg/min, respirador nasal obligado.
- **Defensas pulmonares y cómo el virus las abre para la bacteria:** escalera mucociliar → IgA y proteínas A/D del surfactante → macrófago alveolar → reclutamiento neutrofílico → punto de quiebre viral.
- **Los cinco mecanismos de hipoxemia** en tabla, con gradiente A-a y respuesta al oxígeno. Incluye el cálculo que explica la tabla colombiana: PiO₂ ≈142 mmHg en Neiva vs ≈108 mmHg en Bogotá.

*Semiología y clínica (3)*
- **Examen del tórax:** 10 hallazgos con el mecanismo que los produce y hacia dónde orientan (crépitos finos vs gruesos, sibilancia focal = cuerpo extraño, soplo tubárico, tórax silencioso).
- **Signos que miden gravedad** (ya existente, ahora con las cuatro formas de medir mal la FR).
- **El cuadro cambia con la edad:** presentación, auscultación y trampa clínica en cuatro grupos etarios.

*Paraclínicos (4)*
- **Biomarcadores con cinética:** PCR sube a las 6–12 h con vida media ≈19 h; procalcitonina sube a las 3–4 h con vida media ≈24 h; puntos de corte de la ACNP y para qué sirven realmente (seguimiento, no decisión inicial).
- **Gases arteriales:** cuándo pedirlos y los tres patrones (tipo I, tipo II y el que más engaña — la pCO₂ "normal" en el taquipneico).
- **Ecografía pulmonar:** líneas A, líneas B (≥3 por campo), consolidación con broncograma aéreo dinámico y derrame libre vs tabicado, con ventajas y limitaciones.
- **Líquido pleural y estudios dirigidos:** citoquímico con umbrales de derrame complicado, Gram/cultivo, PCR bacteriana, hemocultivos, influenza, tuberculosis y por qué no usar antígeno urinario en niños.

*Bronquiolitis (1)*
- **Escalas de severidad:** qué puntúan Wood-Downes-Ferrés (1–3 leve, 4–7 moderada, 8–14 grave) y Martinón-Torres (≥8 grave), con las cinco limitaciones declaradas y el uso correcto (seguir la tendencia, no decidir el alta).

Todo mantiene el estilo del mazo: cada diapositiva autocontenida, fuente al pie y el "porqué" fisiopatológico antes del dato. Si prefiere que algún bloque quede aún más profundo —por ejemplo separar la inmunopatogenia del VSR o añadir la interpretación del gradiente A-a con ejemplos numéricos—, lo desarrollo.

## Yo

Te falta fisiopatología, semiología y demás, la parte clínica y paraclínica, complementa puedes ampliar hasta 40 diapositivas

## Claude

Tiene razón: la fisiopatología, la semiología y los paraclínicos estaban resumidos, no desarrollados. Los amplío con bloques dedicados.

## Yo

Te falta fisiopatología, semiología y demás, la parte clínica y paraclínica, complementa puedes ampliar hasta 40 diapositivas

## Claude

Tiene razón — falta profundidad clínica y paraclínica. Agrego 10 diapositivas para llegar a 40:

El archivo quedó con referencias duplicadas de una edición previa. Lo limpio:

Ampliado a **40 diapositivas**, validado y revisado. Las 10 nuevas cubren justamente lo que faltaba:

**Fisiopatología**
- *Dos preguntas que siempre caen en el examen oral*: por qué hay taquipnea antes que hipoxemia (el CO₂ difunde ~20 veces mejor) y por qué el oxígeno no corrige el shunt verdadero.

**Semiología**
- *Definición operativa de neumonía* (clínica, AIEPI y OMS) con el problema de la baja concordancia interobservador.
- *El cuadro cambia con la edad*: presentación, auscultación y trampa clínica de <2 meses a ≥5 años.
- *Examen del tórax* (nueva): inspección, palpación, percusión, ruidos respiratorios, adventicios y transmisión de la voz — con los dos patrones que hay que reconocer de memoria: **consolidación** = matidez + frémito aumentado + soplo tubárico; **derrame** = matidez + frémito abolido + egofonía en el borde superior.
- *Niño con dificultad respiratoria: ABCDE* con el Triángulo de Evaluación Pediátrica.

**Paraclínica**
- *Gases arteriales* (nueva): falla tipo I hipoxémica vs tipo II hipercápnica, con la trampa del pCO₂ "normal" en el niño taquipneico y la advertencia de que los valores de referencia descienden con la altitud.
- *Líquido pleural* (nueva): citoquímico completo con los puntos de corte de derrame complicado (pH <7,20, glucosa <40–60 mg/dL, LDH >1.000), predominio celular y la nota de que los criterios de Light aportan poco en el niño.
- *Escalas de severidad en bronquiolitis* (nueva): qué puntúan, bandas de Wood-Downes-Ferrés y Martinón-Torres, sus limitaciones y los seis datos que sí deciden el destino del paciente.

**Clínica y desenlaces**
- *Escalera del soporte respiratorio* en cinco peldaños.
- *Complicaciones, criterios de alta y signos de alarma* en bronquiolitis.

Una nota honesta sobre las escalas: los puntos de corte por ítem varían entre publicaciones, así que presenté los parámetros y las bandas de gravedad con la instrucción explícita de usar la escala adoptada por su institución, en lugar de fabricar una tabla de puntuación que podría no coincidir con la de Neiva.
