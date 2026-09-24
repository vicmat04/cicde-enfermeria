-- ================================================================
-- OBGYN Section Segmentation Correction
-- 
-- Issue: All OBGYN sections currently contain duplicated full MD
-- Fix: Replace with properly segmented content from MD
-- 
-- Lessons affected: 3 (OBGYN-01, OBGYN-02, OBGYN-03)
-- Sections corrected: 143 (37 + 52 + 54)
-- 
-- This corrective migration:
-- 1. Validates current duplicated state
-- 2. Updates each section body with extracted MD segment
-- 3. Verifies proper segmentation
-- ================================================================

BEGIN;

-- ================================================================
-- PRECONDITIONS
-- ================================================================

DO $$
DECLARE
  obgyn_lessons INT;
  obgyn_sv INT;
  obgyn_sections INT;
  obgyn_sources INT;
  obgyn_lesson_sources INT;
  baseline_sv INT;
  verified INT;
  obgyn_01_unique_bodies INT;
  obgyn_02_unique_bodies INT;
  obgyn_03_unique_bodies INT;
BEGIN
  -- Verify OBGYN baseline
  SELECT COUNT(*) INTO obgyn_lessons
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%';
  
  IF obgyn_lessons != 3 THEN
    RAISE EXCEPTION 'Expected 3 OBGYN lessons, found %', obgyn_lessons;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_sv
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%' AND l.status = 'SOURCE_VALIDATED';
  
  IF obgyn_sv != 3 THEN
    RAISE EXCEPTION 'Expected 3 OBGYN SOURCE_VALIDATED, found %', obgyn_sv;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_sections
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%';
  
  IF obgyn_sections != 143 THEN
    RAISE EXCEPTION 'Expected 143 OBGYN sections, found %', obgyn_sections;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_sources
  FROM sources s
  WHERE EXISTS (
    SELECT 1 FROM lesson_sources lsrc
    JOIN lessons l ON l.id = lsrc.lesson_id
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code LIKE 'OBGYN%' AND s.id = lsrc.source_id
  );
  
  IF obgyn_sources != 29 THEN
    RAISE EXCEPTION 'Expected 29 OBGYN distinct sources, found %', obgyn_sources;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_lesson_sources
  FROM lesson_sources lsrc
  JOIN lessons l ON l.id = lsrc.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%';
  
  IF obgyn_lesson_sources != 39 THEN
    RAISE EXCEPTION 'Expected 39 OBGYN lesson_sources, found %', obgyn_lesson_sources;
  END IF;
  
  -- Verify baseline preserved
  SELECT COUNT(*) INTO baseline_sv
  FROM lessons WHERE status = 'SOURCE_VALIDATED';
  
  IF baseline_sv != 61 THEN
    RAISE EXCEPTION 'Expected 61 SOURCE_VALIDATED baseline, found %', baseline_sv;
  END IF;
  
  SELECT COUNT(*) INTO verified
  FROM lessons WHERE status = 'VERIFIED';
  
  IF verified != 0 THEN
    RAISE EXCEPTION 'Expected 0 VERIFIED, found %', verified;
  END IF;
  
  -- Verify current duplicated state
  SELECT COUNT(DISTINCT ls.body) INTO obgyn_01_unique_bodies
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code = 'OBGYN-01';
  
  IF obgyn_01_unique_bodies != 1 THEN
    RAISE EXCEPTION 'Expected OBGYN-01 to have 1 unique body (all duplicated), found %', obgyn_01_unique_bodies;
  END IF;
  
  SELECT COUNT(DISTINCT ls.body) INTO obgyn_02_unique_bodies
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code = 'OBGYN-02';
  
  IF obgyn_02_unique_bodies != 1 THEN
    RAISE EXCEPTION 'Expected OBGYN-02 to have 1 unique body (all duplicated), found %', obgyn_02_unique_bodies;
  END IF;
  
  SELECT COUNT(DISTINCT ls.body) INTO obgyn_03_unique_bodies
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code = 'OBGYN-03';
  
  IF obgyn_03_unique_bodies != 1 THEN
    RAISE EXCEPTION 'Expected OBGYN-03 to have 1 unique body (all duplicated), found %', obgyn_03_unique_bodies;
  END IF;
  
  RAISE NOTICE 'Preconditions PASS - duplicated state confirmed';
END $$;

-- ================================================================
-- UPDATE SECTION BODIES WITH EXTRACTED CONTENT
-- ================================================================


-- Update OBGYN-01 sections (37)
UPDATE lesson_sections
SET body = $OBGYN_BODY$El lineamiento CICDE 2026 incluye expresamente el tema **“Atención maternal, salud sexual y reproductiva”** y exige estudiar cinco subtemas:

1. Promoción de la salud reproductiva humana.
2. Bases anatomo-fisiológicas del aparato reproductor femenino y masculino.
3. Climaterio y menopausia.
4. Planificación familiar y anticoncepción.
5. Trastorno de fertilidad de la pareja.

Este paquete desarrolla esos cinco puntos sin ampliar silenciosamente el alcance oficial. Las actualizaciones clínicas y normativas se identifican como contexto contemporáneo y no sustituyen la redacción del CICDE.

---$OBGYN_BODY$
WHERE section_key = 'scope'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Al finalizar este tema, el estudiante debe poder:

1. Explicar la relación entre salud sexual, salud reproductiva y derechos en salud.
2. Reconocer acciones de promoción y prevención propias de enfermería en salud sexual y reproductiva.
3. Identificar las estructuras principales de los aparatos reproductores femenino y masculino y relacionarlas con su función.
4. Explicar de forma básica el ciclo ovárico y menstrual y la regulación hormonal del eje hipotálamo-hipófisis-gónada.
5. Diferenciar climaterio, transición menopáusica, perimenopausia y menopausia.
6. Reconocer manifestaciones frecuentes y riesgos de salud asociados a la transición menopáusica.
7. Explicar el concepto de planificación familiar y clasificar los principales métodos anticonceptivos.
8. Reconocer que la elegibilidad anticonceptiva depende de condiciones clínicas individuales y criterios normativos.
9. Identificar que el preservativo es el único método anticonceptivo que además reduce el riesgo de transmisión de ITS, incluido VIH.
10. Explicar qué es la anticoncepción de urgencia y diferenciarla del aborto.
11. Definir infertilidad y diferenciar infertilidad primaria y secundaria.
12. Identificar causas femeninas, masculinas, combinadas o no explicadas y comprender que la evaluación debe considerar a ambos miembros de la pareja.
13. Aplicar educación, consejería, privacidad, consentimiento, no discriminación y referencia oportuna en situaciones tipo examen.

---$OBGYN_BODY$
WHERE section_key = 'objectives'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La salud sexual y la salud reproductiva están relacionadas, pero no son sinónimos.

## Salud sexual

Se refiere al bienestar físico, emocional, mental y social relacionado con la sexualidad. Requiere un enfoque respetuoso, seguro y libre de coerción, discriminación y violencia.

## Salud reproductiva

Se refiere al bienestar relacionado con las funciones, procesos y sistema reproductivo, incluyendo la posibilidad de decidir de forma informada sobre reproducción, anticoncepción, maternidad/paternidad y acceso a servicios de calidad.

## Clave CICDE

La atención no debe reducirse a enfermedad o embarazo. Incluye promoción, prevención, información, autonomía, acceso, detección de riesgos, continuidad y referencia.

---$OBGYN_BODY$
WHERE section_key = 'sexual_reproductive_health'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La promoción busca fortalecer capacidades para que las personas tomen decisiones informadas y accedan a servicios oportunos y seguros.

Acciones relevantes:

- educación sexual integral y adecuada a la etapa de vida;
- prevención de ITS y VIH;
- promoción del uso correcto del preservativo;
- acceso a planificación familiar;
- consejería preconcepcional cuando corresponde;
- identificación de factores de riesgo reproductivo;
- prevención de embarazos no planificados;
- prevención, detección y atención de violencia sexual;
- promoción del autocuidado y consulta oportuna;
- apoyo durante climaterio y menopausia;
- orientación sobre fertilidad e infertilidad;
- referencia cuando el problema supera el nivel de competencia o complejidad.

---$OBGYN_BODY$
WHERE section_key = 'promotion'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El Ministerio de Salud mantiene un **Programa de Salud Sexual y Reproductiva** dentro de la estructura de salud pública. Entre sus funciones declaradas se encuentran la planificación de actividades del programa y la elaboración de normas para la atención integral, con acciones de promoción, vigilancia, gestión sanitaria y monitoreo.

## Relevancia para enfermería

En el contexto panameño, enfermería participa en educación, consejería, captación, seguimiento, promoción, procedimientos autorizados dentro de competencia, registro, vigilancia y referencia.

## Contexto 2026

Durante 2026 MINSA ha realizado jornadas de colocación de implantes subdérmicos y capacitación a personal médico y de enfermería, lo que confirma que los anticonceptivos reversibles de larga duración forman parte de la prestación actual de servicios de planificación familiar en distintas regiones del país.

**Importante:** una noticia regional confirma prestación de servicios, pero no sustituye los protocolos nacionales de elegibilidad, inserción, retiro y seguimiento.

---$OBGYN_BODY$
WHERE section_key = 'panama_ssr'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La consejería debe ser:

- centrada en la persona;
- confidencial dentro de los límites legales;
- no coercitiva;
- sin discriminación;
- comprensible;
- basada en información científica;
- respetuosa de preferencias, valores y decisiones;
- orientada a beneficios, riesgos, alternativas y signos de alarma;
- documentada de forma objetiva.

## Error frecuente

Decidir por la persona cuál método “debe” usar sin valorar preferencias y elegibilidad clínica.

---$OBGYN_BODY$
WHERE section_key = 'counselling'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Ovarios

Gónadas femeninas. Producen ovocitos y hormonas sexuales, principalmente estrógenos y progesterona.

## Trompas uterinas

Conducen el ovocito desde la región ovárica hacia el útero. La fecundación ocurre con mayor frecuencia en la porción ampular.

## Útero

Órgano muscular donde puede implantarse y desarrollarse el embarazo. Se divide de forma general en fondo, cuerpo y cuello uterino.

### Capas principales

- **Endometrio:** capa interna que responde a cambios hormonales y participa en menstruación e implantación.
- **Miometrio:** capa muscular, fundamental en contracciones uterinas.
- **Perimetrio:** cubierta externa.

## Cérvix o cuello uterino

Comunica el útero con la vagina. El moco cervical cambia durante el ciclo menstrual y responde a influencias hormonales.

## Vagina

Conducto fibromuscular que comunica el cérvix con el exterior; participa en relaciones sexuales, salida del flujo menstrual y canal del parto.

## Vulva

Conjunto de genitales externos femeninos, incluyendo labios mayores, labios menores, clítoris y vestíbulo.

---$OBGYN_BODY$
WHERE section_key = 'female_anatomy'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Testículos

Gónadas masculinas donde ocurre la espermatogénesis y se produce testosterona.

## Epidídimo

Estructura asociada a maduración, almacenamiento y transporte inicial de espermatozoides.

## Conductos deferentes

Transportan espermatozoides desde el epidídimo hacia los conductos eyaculadores.

## Vesículas seminales

Aportan una parte importante del líquido seminal.

## Próstata

Glándula que contribuye con secreciones al semen.

## Pene y uretra

El pene participa en la función sexual; la uretra conduce orina y, en momentos distintos, semen hacia el exterior.

---$OBGYN_BODY$
WHERE section_key = 'male_anatomy'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El eje hipotálamo-hipófisis-gónada participa en el control reproductivo.

De forma simplificada:

- el hipotálamo libera GnRH;
- la hipófisis anterior libera FSH y LH;
- ovarios o testículos responden produciendo gametos y hormonas sexuales;
- las hormonas gonadales ejercen retroalimentación sobre hipotálamo e hipófisis.

Este sistema funciona con patrones diferentes en mujeres y hombres.

---$OBGYN_BODY$
WHERE section_key = 'hormonal_axis'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Fase folicular

Predomina el desarrollo folicular. El estrógeno aumenta progresivamente.

## Ovulación

El aumento rápido de LH participa en la ruptura del folículo dominante y liberación del ovocito.

## Fase lútea

El cuerpo lúteo produce progesterona y también estrógenos. Si no ocurre embarazo, el cuerpo lúteo involuciona y disminuyen las hormonas ováricas.

## Menstruación

La caída hormonal favorece el desprendimiento de la capa funcional del endometrio.

## Clave

No asumir que todas las personas tienen ciclos de 28 días ni que la ovulación ocurre siempre en un día fijo.

---$OBGYN_BODY$
WHERE section_key = 'menstrual_cycle'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La fecundación implica la unión de gametos femenino y masculino. Posteriormente ocurren divisiones celulares mientras el producto de la concepción avanza hacia el útero.

La implantación corresponde a la adhesión e invasión del blastocisto en el endometrio receptivo.

Estos conceptos sirven como base para comprender anticoncepción, fertilidad y desarrollo temprano, sin convertir este tema en el contenido detallado de embarazo de `OBGYN-02`.

---$OBGYN_BODY$
WHERE section_key = 'fertilization_implantation'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Climaterio

Etapa de transición de la vida reproductiva hacia la no reproductiva. Incluye cambios endocrinos y clínicos progresivos.

## Transición menopáusica / perimenopausia

Periodo en el que aparecen cambios del ciclo y síntomas relacionados con la reducción progresiva de la función ovárica. La OMS describe la perimenopausia desde el inicio de estos cambios hasta un año después de la última menstruación.

## Menopausia natural

Se determina retrospectivamente después de **12 meses consecutivos de amenorrea** sin otra causa fisiológica, patológica o intervención clínica que la explique.

La mayoría de las mujeres experimenta menopausia natural entre los **45 y 55 años**.

---$OBGYN_BODY$
WHERE section_key = 'climacteric_menopause'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Pueden aparecer, con gran variabilidad entre personas:

- cambios en frecuencia y volumen menstrual durante la transición;
- sofocos y sudoración nocturna;
- alteraciones del sueño;
- cambios del estado de ánimo;
- sequedad vaginal;
- dolor durante las relaciones sexuales;
- síntomas urinarios;
- cambios de composición corporal;
- pérdida de densidad ósea;
- modificación del riesgo cardiovascular con la edad y la pérdida estrogénica.

La menopausia **no es una enfermedad**, pero los síntomas y riesgos asociados pueden requerir valoración y tratamiento.

---$OBGYN_BODY$
WHERE section_key = 'menopause_changes'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Las guías panameñas de atención ginecológica publicadas mediante Resoluciones 235 y 236 de 2023 incluyen un apartado específico de **Menopausia y Climaterio**.

El documento establece la necesidad de valorar factores de riesgo y condiciones como osteoporosis, enfermedad cardiovascular, diabetes, cáncer, problemas urogenitales y salud mental, además de promover educación sobre estilos de vida, alimentación, sexualidad y autocuidado.

## Rol de enfermería

- escuchar y valorar síntomas;
- identificar signos de alarma;
- promover ejercicio y hábitos saludables;
- orientar sobre salud ósea y cardiovascular;
- reforzar salud sexual y prevención de ITS;
- identificar necesidades emocionales;
- referir para evaluación médica cuando corresponda;
- evitar minimizar síntomas como “algo normal que debe aguantar”.

---$OBGYN_BODY$
WHERE section_key = 'panama_menopause'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Existen intervenciones hormonales y no hormonales para síntomas menopáusicos. La selección depende de síntomas, antecedentes, edad, tiempo desde la menopausia, factores de riesgo, contraindicaciones y preferencias.

Para CICDE, la idea esencial es:

**No indicar terapia hormonal de forma automática.** Requiere evaluación individual por personal clínico competente.

Este paquete no desarrolla esquemas farmacológicos detallados porque no forman parte explícita del subtema OBGYN-01 y requieren valoración clínica individual.

---$OBGYN_BODY$
WHERE section_key = 'menopause_therapy_boundary'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La planificación familiar permite a personas y parejas alcanzar el número deseado de hijos y determinar el espaciamiento de los embarazos.

Incluye:

- anticoncepción;
- información y consejería;
- atención de la fertilidad e infertilidad;
- decisiones informadas y voluntarias.

La elección anticonceptiva debe considerar eficacia, seguridad, reversibilidad, duración, preferencias, necesidades reproductivas, condiciones clínicas, interacciones y posibilidad de protección frente a ITS.

---$OBGYN_BODY$
WHERE section_key = 'family_planning'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Métodos reversibles de larga duración

- implantes subdérmicos;
- dispositivos intrauterinos (DIU) de cobre;
- sistemas intrauterinos con levonorgestrel, cuando disponibles y elegibles.

## Métodos hormonales de uso periódico

- anticonceptivos orales combinados;
- anticonceptivos de progestágeno solo;
- inyectables;
- parche;
- anillo vaginal.

## Métodos de barrera

- preservativo externo;
- preservativo interno;
- otros métodos de barrera según disponibilidad.

## Métodos basados en conocimiento de la fertilidad

Requieren comprensión del ciclo y adherencia estricta; su efectividad depende especialmente del uso correcto.

## Métodos permanentes

- esterilización femenina;
- vasectomía.

Requieren consejería específica sobre permanencia y consentimiento informado.

---$OBGYN_BODY$
WHERE section_key = 'contraceptive_methods'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Los preservativos son el único método anticonceptivo que además ofrece protección frente a la transmisión de ITS, incluido VIH, cuando se utilizan correcta y consistentemente.

## Clave de examen

Una persona que usa otro método anticonceptivo puede seguir necesitando preservativo para reducción de riesgo de ITS.

Esto se conoce con frecuencia como **doble protección** cuando se combina prevención de embarazo con prevención de ITS.

---$OBGYN_BODY$
WHERE section_key = 'condoms_sti'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La OMS actualizó en 2025 los **Medical Eligibility Criteria for Contraceptive Use, 6th edition**.

Las categorías generales son:

- **Categoría 1:** sin restricción para usar el método.
- **Categoría 2:** ventajas generalmente superan riesgos teóricos o demostrados.
- **Categoría 3:** riesgos generalmente superan ventajas; normalmente se prefiere otro método salvo circunstancias especiales y valoración experta.
- **Categoría 4:** riesgo inaceptable; no usar el método.

## Seguridad

No memorizar “un método sirve para todas”. Hipertensión, migraña con aura, tabaquismo, enfermedad tromboembólica, posparto, lactancia, cáncer, hepatopatía y otras condiciones pueden modificar elegibilidad según el método.

Para examen, la conducta segura es **valorar antes de recomendar**.

---$OBGYN_BODY$
WHERE section_key = 'mec'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Combinada

Contiene estrógeno y progestágeno.

## Progestágeno solo

No contiene estrógeno.

## Puntos esenciales

- requieren uso adecuado para mantener eficacia;
- no protegen contra ITS;
- la fertilidad retorna rápidamente tras suspender píldoras, según OMS;
- la elegibilidad depende del estado clínico individual.

No asumir que la amenorrea por anticoncepción equivale a menopausia.

---$OBGYN_BODY$
WHERE section_key = 'oral_contraception'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Los DIU y los implantes son métodos reversibles de larga duración y alta eficacia.

## Enfermería

Según normas institucionales, capacitación y competencias autorizadas, enfermería puede participar en:

- educación;
- consejería;
- preparación;
- asistencia o realización de procedimientos cuando esté habilitada;
- vigilancia de efectos esperados y signos de alarma;
- documentación;
- seguimiento;
- referencia.

En Panamá, MINSA documentó en 2026 capacitación específica a médicos y enfermeras para colocación y extracción de implantes subdérmicos.

---$OBGYN_BODY$
WHERE section_key = 'iud_implants'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Se utiliza después de una relación sexual sin protección o ante falla del método anticonceptivo.

La OMS recomienda usar anticoncepción de urgencia lo antes posible y dentro de los **5 días** posteriores a la relación sexual, según el método.

Opciones reconocidas por OMS incluyen:

- acetato de ulipristal;
- levonorgestrel;
- régimen combinado de estrógeno/progestágeno en contextos específicos;
- DIU de cobre.

## Clave crítica

Las píldoras de anticoncepción de urgencia actúan principalmente evitando o retrasando la ovulación y **no interrumpen un embarazo establecido**.

El DIU de cobre es el método de anticoncepción de urgencia más eficaz cuando es clínicamente elegible y se coloca en el intervalo recomendado.

---$OBGYN_BODY$
WHERE section_key = 'emergency_contraception'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La OMS define infertilidad como una enfermedad del aparato reproductor masculino o femenino caracterizada por no lograr embarazo después de **12 meses o más de relaciones sexuales regulares sin protección**.

Puede ser:

- **primaria:** nunca se ha logrado un embarazo;
- **secundaria:** existe antecedente de al menos un embarazo previo, pero posteriormente no se logra otro embarazo.

Aproximadamente una de cada seis personas en edad reproductiva experimenta infertilidad en algún momento de la vida.

---$OBGYN_BODY$
WHERE section_key = 'infertility_definition'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Pueden incluir alteraciones relacionadas con:

- ovulación;
- reserva o función ovárica;
- trompas uterinas;
- útero y cavidad uterina;
- endometriosis;
- alteraciones endocrinas;
- edad reproductiva;
- factores infecciosos;
- otras causas médicas.

No toda infertilidad femenina se explica por una sola causa.

---$OBGYN_BODY$
WHERE section_key = 'female_infertility'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Pueden relacionarse con:

- ausencia o baja concentración de espermatozoides;
- alteraciones de motilidad;
- alteraciones morfológicas;
- problemas de producción espermática;
- obstrucción del tracto reproductivo;
- trastornos de eyaculación;
- alteraciones hormonales;
- causas infecciosas, genéticas, ambientales o de estilo de vida.

## Clave

La infertilidad no debe atribuirse automáticamente a la mujer.

---$OBGYN_BODY$
WHERE section_key = 'male_infertility'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La evaluación debe considerar a ambos miembros de la pareja cuando corresponda.

Puede incluir, según historia y criterio clínico:

- antecedentes reproductivos;
- frecuencia y oportunidad de relaciones sexuales;
- antecedentes médicos y quirúrgicos;
- medicamentos y exposiciones;
- evaluación menstrual y ovulatoria;
- examen físico;
- análisis seminal;
- estudio anatómico y funcional femenino;
- pruebas adicionales según hallazgos.

## Cuándo evaluar antes de 12 meses

La regla de 12 meses no significa que siempre deba esperarse. La valoración puede iniciarse antes cuando existen factores clínicos que hacen sospechar infertilidad o cuando la edad reproductiva hace desaconsejable retrasar la evaluación.

---$OBGYN_BODY$
WHERE section_key = 'couple_evaluation'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Las guías ginecológicas panameñas de 2023 incluyen la infertilidad femenina como tema de abordaje y señalan que el acceso a servicios de infertilidad forma parte de los derechos de salud reproductiva.

Para la plataforma, esto debe interpretarse junto con la guía global OMS 2025, que actualiza la prevención, diagnóstico y tratamiento de infertilidad e incluye factores femeninos, masculinos y no explicados.

---$OBGYN_BODY$
WHERE section_key = 'panama_infertility'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$- realizar acogida sin estigma;
- obtener datos relevantes de forma respetuosa;
- brindar educación sobre el proceso diagnóstico;
- evitar atribuir culpa;
- apoyar adherencia a estudios y seguimiento;
- identificar impacto emocional;
- proteger privacidad;
- facilitar referencia;
- reforzar hábitos saludables sin prometer que por sí solos resolverán la infertilidad;
- reconocer límites de competencia y no prescribir tratamientos de reproducción asistida.

---$OBGYN_BODY$
WHERE section_key = 'nursing_infertility'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La salud sexual y reproductiva puede involucrar creencias, identidad, proyecto de vida, relaciones de pareja, expectativas familiares, estigma y duelo.

Enfermería debe:

- usar lenguaje respetuoso;
- evitar juicios morales;
- mantener confidencialidad conforme a la ley;
- identificar coerción o violencia;
- respetar decisiones informadas;
- evitar discriminación por edad, estado civil, discapacidad, orientación sexual u otras condiciones;
- derivar ante necesidades psicológicas, sociales o legales.

---$OBGYN_BODY$
WHERE section_key = 'psychosocial_ethics'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$| Concepto | Significado |
|---|---|
| Salud sexual | Bienestar relacionado con sexualidad, seguridad, respeto y ausencia de coerción/violencia |
| Salud reproductiva | Bienestar y atención relacionados con sistema y decisiones reproductivas |
| Climaterio | Transición amplia de la etapa reproductiva a no reproductiva |
| Menopausia | 12 meses consecutivos sin menstruación por pérdida de función folicular, sin otra causa |
| Planificación familiar | Decidir número y espaciamiento de hijos mediante información, anticoncepción y atención de fertilidad |
| Anticoncepción | Prevención del embarazo mediante distintos métodos |
| Anticoncepción de urgencia | Prevención de embarazo después de relación sin protección/falla del método; no interrumpe embarazo establecido |
| Infertilidad | No lograr embarazo tras 12 meses o más de relaciones regulares sin protección |

---$OBGYN_BODY$
WHERE section_key = 'differences'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Caso 1

Mujer de 48 años con ciclos irregulares y sofocos pregunta si ya no puede quedar embarazada.

**Respuesta esperada:** no asumir menopausia por irregularidad menstrual; la menopausia natural se establece retrospectivamente tras 12 meses consecutivos de amenorrea sin otra causa. Durante la transición todavía puede existir posibilidad de embarazo.

## Caso 2

Paciente con síntomas climatéricos intensos recibe como respuesta: “eso es normal, no necesita valoración”.

**Problema:** normalizar no significa ignorar síntomas. Deben valorarse impacto, riesgos y necesidad de tratamiento o referencia.

## Caso 3

Persona usa anticonceptivo oral y pregunta si también queda protegida contra VIH.

**Respuesta:** no. Los anticonceptivos orales previenen embarazo, pero no ITS. El preservativo es el método anticonceptivo que también reduce transmisión de ITS/VIH.

## Caso 4

Mujer solicita un método anticonceptivo y el profesional selecciona uno sin preguntar antecedentes ni preferencias.

**Problema:** falta de consejería centrada en la persona y valoración de elegibilidad.

## Caso 5

Paciente tuvo relación sexual sin protección hace dos días y pregunta por anticoncepción de urgencia.

**Prioridad:** orientar oportunamente sobre opciones elegibles; la anticoncepción de urgencia es tiempo-dependiente y debe utilizarse lo antes posible.

## Caso 6

Paciente afirma que la anticoncepción de urgencia “es un aborto”.

**Respuesta:** explicar que las píldoras de anticoncepción de urgencia previenen el embarazo principalmente al impedir o retrasar la ovulación y no interrumpen un embarazo establecido.

## Caso 7

Pareja lleva 13 meses con relaciones regulares sin protección y no ha logrado embarazo. Toda la entrevista se centra únicamente en la mujer.

**Problema:** la infertilidad puede tener factores femeninos o masculinos; la evaluación debe considerar a ambos miembros cuando corresponda.

## Caso 8

Mujer de 37 años con antecedentes de cirugía pélvica pregunta si debe esperar obligatoriamente 12 meses antes de consultar por fertilidad.

**Respuesta:** no necesariamente. Algunos factores justifican evaluación más temprana; debe remitirse para valoración individual.

## Caso 9

En consulta se le dice a una mujer que los anticonceptivos modernos le producirán infertilidad permanente.

**Respuesta:** información incorrecta. La OMS señala que los métodos anticonceptivos modernos no causan infertilidad; el retorno de fertilidad depende del método, y para anticonceptivos orales es rápido tras suspenderlos.

## Caso 10

Paciente en menopausia pregunta si todavía necesita prevención de ITS.

**Respuesta:** sí. La menopausia elimina la capacidad reproductiva natural, pero no protege frente a ITS.

## Caso 11

En una consulta de planificación familiar, la persona refiere coerción sexual por su pareja.

**Prioridad de enfermería:** seguridad, escucha sin juicio, atención conforme a protocolos de violencia, privacidad y referencia apropiada; no limitar la consulta a elegir anticonceptivo.

## Caso 12

Paciente con infertilidad se culpa y afirma que “seguro todo es por mí”.

**Respuesta:** evitar culpabilización; explicar que puede haber factores femeninos, masculinos, combinados o no explicados y ofrecer apoyo y referencia.

---$OBGYN_BODY$
WHERE section_key = 'cases'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$1. Confundir salud sexual con ausencia de enfermedad.
2. Reducir salud reproductiva solo a embarazo.
3. Usar consejería coercitiva.
4. Confundir climaterio con menopausia.
5. Diagnosticar menopausia solo por edad o síntomas.
6. Creer que menopausia elimina riesgo de ITS.
7. Decir que todos los anticonceptivos protegen contra ITS.
8. Recomendar anticoncepción sin revisar elegibilidad.
9. Confundir anticoncepción de urgencia con aborto.
10. Atribuir infertilidad automáticamente a la mujer.
11. Esperar siempre 12 meses aun con factores que justifican evaluación temprana.
12. Prometer éxito de tratamientos de fertilidad.

---$OBGYN_BODY$
WHERE section_key = 'errors'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$- **CICDE OBGYN-01 tiene cinco ejes: promoción reproductiva, anatomía/fisiología, climaterio-menopausia, planificación familiar y fertilidad.**
- **Menopausia natural = 12 meses consecutivos de amenorrea sin otra causa.**
- **La mayoría de las mujeres presenta menopausia natural entre 45 y 55 años.**
- **Preservativo = único método anticonceptivo que también reduce transmisión de ITS, incluido VIH.**
- **Anticoncepción de urgencia ≠ aborto.**
- **Infertilidad = no lograr embarazo tras 12 meses o más de relaciones regulares sin protección.**
- **La infertilidad puede tener factores femeninos o masculinos; valorar a ambos.**
- **MEC OMS 2025: categorías 1–4 según seguridad del método ante condiciones clínicas.**
- **Panamá mantiene Programa de Salud Sexual y Reproductiva y en 2026 continúa prestación de planificación familiar con métodos de larga duración.**
- **Consejería correcta = información + autonomía + elegibilidad + privacidad + seguimiento.**

---$OBGYN_BODY$
WHERE section_key = 'memorize'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Este tema aporta a competencias transversales de:

- cuidado durante el ciclo vital;
- educación para la salud;
- comunicación efectiva;
- pensamiento crítico;
- toma de decisiones;
- cuidado humanizado;
- aplicación de aspectos éticos y legales;
- prevención y promoción;
- documentación y continuidad.

---$OBGYN_BODY$
WHERE section_key = 'competencies'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Fuente rectora de alcance

**IV CICDE. Lineamientos para el Examen por Competencia de Profesionales de Enfermería, 2026.**  
Define literalmente el tema y los cinco subtemas de OBGYN-01.

## Bibliografía señalada por CICDE

- Organización Mundial de la Salud. **La salud sexual y su relación con la salud reproductiva: un enfoque operativo.** 2018.
- Cunningham, Leveno, Hoffman, Spong & Casey. **Williams Obstetricia.** 26.ª ed., McGraw Hill, 2022. CICDE la cita también para OBGYN-02; se conserva como bibliografía declarada por CICDE, sin afirmar acceso completo a copias no autorizadas.
- Carvajal, J. & García, K. **Manual de obstetricia y ginecología.** 2024, citado por CICDE.
- Espinoza y colaboradores. **Enfermería en Gineco-obstetricia.** Mawil, 2022, citado por CICDE.
- Beckmann & Ling. **Obstetricia y ginecología.** 2019, citado por CICDE.
- MINSA/CSS. **Plan Nacional de Salud Sexual y Reproductiva 2021–2025.** Se conserva como antecedente programático citado por CICDE; su periodo nominal terminó en 2025 y no se presenta como plan vigente 2026.

## Fuentes oficiales y complementarias actuales

### Panamá

- Ministerio de Salud de Panamá. **Programa Salud Sexual y Reproductiva.** Página institucional vigente.
- MINSA. **Resoluciones 235 y 236 de 12 de abril de 2023**, Gaceta Oficial 29769-B. Incluyen guía de atención ginecológica y contenidos de climaterio, menopausia e infertilidad.
- MINSA. **Decreto Ejecutivo No. 17 de 23 de marzo de 2026**, Política Nacional de Salud y Lineamientos Estratégicos 2026–2035.
- MINSA. **MINSA lleva implantes subdérmicos a Panamá Este.** 17 junio 2026.
- MINSA. **Capacitan a enfermeras, médicos y profesionales de la salud en la colocación y extracción de implantes subdérmicos.** 25 julio 2026.

### Internacionales

- World Health Organization. **Menopause.** Fact sheet, 16 October 2024.
- World Health Organization. **Family planning/contraception methods.** 3 July 2025.
- World Health Organization. **Medical eligibility criteria for contraceptive use, 6th ed.** 2025.
- World Health Organization. **Selected practice recommendations for contraceptive use, 4th ed.** 2025.
- World Health Organization. **Guideline for the prevention, diagnosis and treatment of infertility.** 2025.
- World Health Organization. **Emergency contraception.** Fact sheet.

---$OBGYN_BODY$
WHERE section_key = 'sources'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Este paquete:

- cubre los cinco subtemas explícitos de OBGYN-01;
- mantiene el texto CICDE como alcance rector;
- distingue bibliografía CICDE de actualización normativa 2026;
- no presenta el Plan Nacional SSR 2021–2025 como vigente en 2026;
- incorpora la Política Nacional de Salud 2026–2035 como contexto nacional actual;
- usa la actualización OMS 2025 de elegibilidad y prácticas anticonceptivas;
- usa la primera guía global OMS 2025 de infertilidad;
- incorpora la guía panameña 2023 para climaterio, menopausia e infertilidad;
- no reproduce extensamente textos protegidos de libros;
- no utiliza enlaces no oficiales de copias de libros como soporte clínico principal;
- incluye 12 situaciones originales tipo examen;
- mantiene estado `REVIEW` y no declara revisión clínica humana.

---$OBGYN_BODY$
WHERE section_key = 'quality_control'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$**Estado recomendado:** `REVIEW`

Antes de cualquier publicación bajo un estado de mayor confianza deben mantenerse trazabilidad de fuentes, fecha de revisión y reglas de gobernanza del proyecto. Este paquete ha sido sometido a revisión documental y académica asistida por IA, pero **no equivale a revisión humana por un profesional clínico licenciado**.$OBGYN_BODY$
WHERE section_key = 'integration_status'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-01'
  );


-- Update OBGYN-02 sections (52)
UPDATE lesson_sections
SET body = $OBGYN_BODY$El lineamiento CICDE 2026 incluye expresamente el tema **“Embarazo normal y patológico”** y exige estudiar:

1. Desarrollo fetal.
2. Cambios fisiológicos durante el embarazo.
3. Pruebas durante el embarazo.
4. Valoración física de la mujer embarazada.
5. Cuidados de enfermería a la mujer durante el embarazo.
6. Cuidados de enfermería de la mujer con alteraciones gineco obstétricas.

Este paquete conserva ese alcance. Para el componente patológico se priorizan complicaciones obstétricas de alta relevancia clínica y de seguridad contempladas en las **Guías de Manejo de las Complicaciones en el Embarazo de Panamá, versión 5.0 (2024)**, aprobadas por Resolución 1105 de 30 de diciembre de 2024 y de cumplimiento nacional desde su promulgación en 2025.

---$OBGYN_BODY$
WHERE section_key = 'scope'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Al finalizar el tema, el estudiante debe poder:

1. Describir de forma general fecundación, implantación y desarrollo embriofetal.
2. Diferenciar período embrionario y fetal.
3. Reconocer cambios fisiológicos normales del embarazo y distinguirlos de signos de alarma.
4. Explicar la finalidad de las principales pruebas prenatales.
5. Realizar una valoración de enfermería ordenada de la gestante.
6. Reconocer componentes esenciales del control prenatal.
7. Identificar factores de riesgo maternos y fetales que requieren referencia o atención de mayor complejidad.
8. Diferenciar hipertensión crónica, hipertensión gestacional y preeclampsia según la normativa panameña vigente.
9. Reconocer signos y síntomas de urgencia obstétrica.
10. Identificar principios básicos del abordaje de sangrado en el embarazo, ruptura de membranas, parto pretérmino, alteraciones del crecimiento fetal y diabetes en el embarazo.
11. Aplicar prioridades de enfermería: seguridad, valoración rápida, vigilancia, comunicación, documentación y referencia oportuna.
12. Resolver situaciones tipo examen sin asumir diagnósticos ni tratamientos fuera de competencia.

---$OBGYN_BODY$
WHERE section_key = 'objectives'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El embarazo comienza con la fecundación y continúa con implantación, desarrollo embrionario, crecimiento fetal y preparación para el nacimiento.

## Edad gestacional

En la práctica obstétrica, la edad gestacional se calcula habitualmente desde el primer día de la última menstruación cuando esta fecha es confiable y se complementa con ultrasonido, especialmente cuando existen dudas o discrepancias.

## Trimestres

De manera práctica:

- **Primer trimestre:** hasta 13 semanas y 6 días.
- **Segundo trimestre:** 14 a 27 semanas y 6 días.
- **Tercer trimestre:** desde 28 semanas hasta el nacimiento.

La clasificación exacta puede variar ligeramente entre fuentes; para decisiones clínicas debe seguirse el protocolo institucional vigente.

---$OBGYN_BODY$
WHERE section_key = 'pregnancy_basics'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La fecundación ocurre con mayor frecuencia en la ampolla de la trompa uterina. El cigoto inicia divisiones sucesivas, forma blastocisto y posteriormente se implanta en el endometrio.

La implantación normal es intrauterina. Un embarazo implantado fuera de la cavidad uterina corresponde a embarazo ectópico y puede constituir una urgencia, especialmente si se acompaña de dolor intenso, sangrado, mareo, síncope o inestabilidad hemodinámica.

---$OBGYN_BODY$
WHERE section_key = 'fertilization_implantation'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Período embrionario

Corresponde a las primeras semanas de desarrollo, cuando ocurren procesos críticos de diferenciación y organogénesis. Es un período especialmente sensible a exposiciones teratógenas.

## Período fetal

Predomina el crecimiento y la maduración funcional de órganos y sistemas ya formados.

## Clave de seguridad

En una pregunta tipo examen, evitar afirmar que un medicamento es “seguro en el embarazo” solo porque sea de uso frecuente. La decisión depende de fármaco, dosis, trimestre, indicación y balance riesgo-beneficio.

---$OBGYN_BODY$
WHERE section_key = 'embryonic_fetal_period'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El desarrollo fetal es continuo. Para examen es más útil comprender la secuencia que memorizar listas aisladas.

- Al inicio predominan organogénesis y diferenciación.
- Luego aumenta el crecimiento corporal y la maduración funcional.
- La placenta se convierte en órgano esencial de intercambio materno-fetal.
- La viabilidad neonatal depende no solo de edad gestacional, sino también de peso, madurez y recursos disponibles.
- El tercer trimestre se caracteriza por rápido crecimiento, depósito de grasa y maduración progresiva, especialmente pulmonar y neurológica.

No debe utilizarse un único hito como prueba absoluta de edad gestacional.

---$OBGYN_BODY$
WHERE section_key = 'fetal_development'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Placenta

Permite intercambio de oxígeno, nutrientes y productos de desecho y posee funciones endocrinas relevantes.

## Cordón umbilical

Conecta al feto con la placenta. La anatomía habitual incluye dos arterias y una vena umbilical.

## Líquido amniótico

Contribuye a protección mecánica, movilidad y desarrollo. Alteraciones marcadas en cantidad pueden asociarse a complicaciones y requieren valoración especializada.

---$OBGYN_BODY$
WHERE section_key = 'placenta_cord_fluid'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Durante el embarazo se producen cambios fisiológicos para cubrir las necesidades maternas y fetales.

Entre los cambios esperables se encuentran:

- incremento del volumen plasmático;
- aumento del gasto cardíaco;
- aumento de la frecuencia cardíaca en grados variables;
- disminución fisiológica de la resistencia vascular sistémica;
- descenso relativo de la presión arterial en parte del embarazo, con tendencia a acercarse a valores previos posteriormente.

## Alarma

Hipertensión nueva, cefalea intensa, síntomas visuales, dolor epigástrico/hipocondrio derecho, disnea importante, edema pulmonar, convulsión o alteración del estado mental no son “cambios normales”.

---$OBGYN_BODY$
WHERE section_key = 'cardiovascular_changes'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El aumento del volumen plasmático suele ser proporcionalmente mayor que el aumento de masa eritrocitaria, produciendo **hemodilución fisiológica**.

Esto no significa que toda anemia sea normal. La anemia verdadera requiere evaluación según hemoglobina, contexto clínico, trimestre, nutrición y otros hallazgos.

El embarazo también se asocia con un estado de mayor coagulabilidad, lo que contribuye a proteger contra hemorragia pero incrementa el riesgo tromboembólico.

---$OBGYN_BODY$
WHERE section_key = 'hematologic_changes'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Pueden presentarse:

- mayor ventilación minuto;
- elevación del diafragma por crecimiento uterino;
- sensación de disnea leve en algunas gestantes;
- aumento de requerimientos de oxígeno.

## Alarma

Disnea súbita o intensa, dolor torácico, cianosis, hemoptisis, síncope o saturación de oxígeno anormal requieren evaluación urgente.

---$OBGYN_BODY$
WHERE section_key = 'respiratory_changes'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Durante el embarazo aumentan el flujo renal y la filtración glomerular. También pueden aparecer frecuencia urinaria y dilatación fisiológica de las vías urinarias.

## Seguridad

Disuria, fiebre, dolor lumbar, hematuria o síntomas sistémicos sugieren infección u otra patología y no deben atribuirse automáticamente al embarazo normal.

---$OBGYN_BODY$
WHERE section_key = 'renal_changes'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Son frecuentes:

- náuseas y vómitos, especialmente al inicio;
- reflujo gastroesofágico;
- estreñimiento;
- disminución de motilidad gastrointestinal.

## Alarma

Vómitos persistentes con incapacidad para tolerar líquidos, pérdida importante de peso, signos de deshidratación o alteraciones metabólicas requieren valoración clínica.

---$OBGYN_BODY$
WHERE section_key = 'gastrointestinal_changes'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Pueden presentarse:

- aumento de lordosis lumbar;
- modificaciones en postura y equilibrio;
- laxitud ligamentaria;
- dolor lumbar;
- hiperpigmentación;
- línea nigra;
- estrías.

Estos cambios son frecuentes, pero dolor intenso, déficit neurológico, edema unilateral doloroso u otros hallazgos atípicos deben valorarse.

---$OBGYN_BODY$
WHERE section_key = 'musculoskeletal_skin'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Son esperables:

- aumento de tamaño y vascularización mamaria;
- cambios en areolas;
- crecimiento uterino;
- aumento de flujo vaginal fisiológico en algunas gestantes.

## Diferencia importante

Flujo vaginal fisiológico ≠ pérdida de líquido amniótico. Una salida súbita o continua de líquido requiere valoración por posible ruptura de membranas.

---$OBGYN_BODY$
WHERE section_key = 'breast_reproductive_changes'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El embarazo puede implicar ajustes emocionales, familiares, laborales y sociales. Enfermería debe valorar:

- estado emocional;
- apoyo familiar/social;
- violencia o coerción;
- consumo de sustancias;
- condiciones económicas y de vivienda;
- acceso a controles;
- capacidad para comprender indicaciones y signos de alarma.

Ansiedad intensa, depresión, ideas suicidas, violencia o incapacidad para autocuidado requieren intervención y referencia apropiada.

---$OBGYN_BODY$
WHERE section_key = 'psychosocial_changes'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La atención prenatal busca favorecer una experiencia positiva de embarazo, promover salud y detectar tempranamente complicaciones maternas y fetales.

La OMS recomienda **ocho contactos prenatales** como modelo de atención, iniciando lo más temprano posible. Panamá mantiene normas y protocolos propios para la atención integral de la mujer; las decisiones operativas deben seguir la normativa nacional e institucional vigente.

---$OBGYN_BODY$
WHERE section_key = 'prenatal_care'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Una valoración inicial completa incluye, según protocolo y nivel de atención:

- identificación y edad gestacional estimada;
- antecedentes obstétricos;
- antecedentes médicos, quirúrgicos y familiares;
- medicamentos, alergias y exposiciones;
- antecedentes infecciosos;
- hábitos y sustancias;
- valoración nutricional;
- salud mental;
- violencia y seguridad;
- examen físico;
- signos vitales;
- peso e índice de masa corporal cuando corresponde;
- pruebas de laboratorio y tamizaje indicadas;
- clasificación de riesgo y plan de seguimiento.

---$OBGYN_BODY$
WHERE section_key = 'first_prenatal_assessment'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Presión arterial

Debe medirse con técnica adecuada y manguito apropiado. Una lectura anormal debe confirmarse y contextualizarse según protocolo.

## Peso

El seguimiento del peso forma parte de la valoración nutricional, pero no debe interpretarse aislado de talla, IMC pregestacional o inicial, edad gestacional, edema, alimentación y crecimiento fetal.

## Examen general

Incluye valoración de estado general, piel y mucosas, tiroides cuando esté indicado, cardiopulmonar, abdomen, extremidades y otros sistemas según historia y hallazgos.

---$OBGYN_BODY$
WHERE section_key = 'vital_signs_exam'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Según edad gestacional y competencia profesional, puede incluir:

- altura uterina;
- frecuencia cardíaca fetal;
- movimientos fetales;
- situación, presentación y posición fetal en etapas apropiadas;
- presencia de contracciones;
- sangrado o pérdida de líquido;
- síntomas maternos;
- bienestar fetal según indicación.

Hallazgos anormales requieren comunicación y referencia según nivel de atención.

---$OBGYN_BODY$
WHERE section_key = 'obstetric_assessment'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Las pruebas no sustituyen la valoración clínica. Su selección depende de edad gestacional, antecedentes, hallazgos y protocolo.

La OMS incluye entre las evaluaciones prenatales habituales:

- pruebas de sangre de rutina en el primer contacto;
- tamizaje temprano de VIH, sífilis y hepatitis B;
- ultrasonido temprano para estimar edad gestacional;
- medición de presión arterial en cada contacto;
- valoración de glucosa para diabetes gestacional alrededor de 24–28 semanas;
- evaluación de proteinuria cuando corresponde, especialmente en vigilancia de preeclampsia.

Panamá dispone además de normas nacionales y protocolos específicos.

---$OBGYN_BODY$
WHERE section_key = 'prenatal_tests'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El hemograma ayuda a identificar anemia y otras alteraciones hematológicas.

Una hemoglobina baja no debe atribuirse automáticamente a hemodilución. Se valoran dieta, hierro, pérdidas sanguíneas, hemoglobinopatías y otras causas según clínica y antecedentes.

Enfermería contribuye con educación nutricional, adherencia a suplementación indicada, vigilancia de efectos adversos y referencia cuando existe anemia moderada/severa o síntomas.

---$OBGYN_BODY$
WHERE section_key = 'cbc_anemia'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La determinación de grupo ABO y factor Rh forma parte de la evaluación prenatal.

Una gestante Rh negativa requiere manejo conforme a protocolo, evaluación de sensibilización y profilaxis anti-D cuando esté indicada.

La normativa panameña del Programa de Salud Integral de la Mujer establece valoración especializada de usuarias Rh negativas y referencia de pacientes isoimunizadas.

---$OBGYN_BODY$
WHERE section_key = 'abo_rh'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La OMS recomienda ofrecer estas pruebas lo antes posible durante el embarazo. La detección permite iniciar intervenciones que protegen a la madre y reducen transmisión perinatal.

Las normas panameñas también contemplan tamizaje prenatal y seguimiento. El consentimiento, confidencialidad, educación y vinculación rápida al tratamiento son responsabilidades esenciales del equipo.

---$OBGYN_BODY$
WHERE section_key = 'infection_screening'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La OMS sitúa el tamizaje de diabetes gestacional habitualmente entre **24 y 28 semanas**.

La guía panameña vigente incluye un capítulo específico de diabetes en el embarazo y diferencia diabetes pregestacional y diabetes mellitus gestacional.

## Objetivos de glucosa que aparecen en la guía panameña 2024

Como metas de control metabólico se presentan valores aproximados de:

- ayuno <95 mg/dL;
- 1 hora posprandial <140 mg/dL;
- 2 horas posprandial <120 mg/dL.

Estas son **metas de control**, no criterios únicos de diagnóstico. El diagnóstico debe seguir el algoritmo y prueba de tolerancia definidos por el protocolo vigente.

---$OBGYN_BODY$
WHERE section_key = 'glucose_screening'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La OMS recomienda un ultrasonido antes de las 24 semanas para estimar edad gestacional, mejorar detección de ciertas anomalías y apoyar la planificación del cuidado.

El ultrasonido puede valorar, según indicación:

- localización del embarazo;
- vitalidad;
- número de fetos;
- biometría y crecimiento;
- anatomía fetal;
- placenta;
- líquido amniótico;
- cérvix y otros parámetros especializados.

Un ultrasonido normal no elimina todos los riesgos ni sustituye controles posteriores.

---$OBGYN_BODY$
WHERE section_key = 'ultrasound'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La guía panameña 2024 incluye valoración de:

- movimientos fetales;
- monitoreo fetal anteparto;
- registro cardiotocográfico;
- Doppler feto-materno-placentario;
- perfil biofísico fetal modificado;
- monitoreo intraparto.

Estas pruebas se utilizan según indicación, riesgo y edad gestacional; no todas corresponden a cada control prenatal de bajo riesgo.

---$OBGYN_BODY$
WHERE section_key = 'fetal_wellbeing'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La educación debe incluir, adaptada a cada persona:

- importancia del control prenatal;
- alimentación segura y adecuada;
- suplementación indicada;
- actividad física según condición clínica;
- evitar alcohol, tabaco y otras sustancias;
- uso seguro de medicamentos;
- prevención de infecciones;
- vacunación de acuerdo con esquema vigente;
- salud bucal;
- signos de alarma;
- preparación para nacimiento y emergencias;
- lactancia materna;
- planificación posparto;
- apoyo emocional y redes de apoyo.

---$OBGYN_BODY$
WHERE section_key = 'nursing_education'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Requieren valoración urgente, según contexto:

- sangrado vaginal;
- pérdida de líquido por vagina;
- dolor abdominal intenso o persistente;
- contracciones regulares antes de término;
- cefalea intensa o persistente;
- alteraciones visuales;
- dolor epigástrico o en hipocondrio derecho;
- convulsiones;
- fiebre;
- disnea intensa o dolor torácico;
- edema súbito/generalizado asociado a otros signos;
- disminución marcada o ausencia de movimientos fetales cuando ya son percibidos regularmente;
- síncope o inestabilidad;
- cualquier deterioro materno importante.

**Prioridad:** evaluar estabilidad materna primero y activar atención obstétrica o emergencia según necesidad.

---$OBGYN_BODY$
WHERE section_key = 'warning_signs'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Un embarazo de alto riesgo presenta condiciones maternas, fetales, obstétricas o sociales que aumentan probabilidad de complicaciones y requieren vigilancia o atención especializada.

Ejemplos:

- hipertensión;
- diabetes;
- enfermedad renal o cardíaca;
- gestación múltiple;
- antecedentes obstétricos graves;
- edad materna extrema según contexto;
- hemorragia;
- alteraciones del crecimiento fetal;
- infección importante;
- trastorno de coagulación;
- malformaciones o anomalías fetales;
- barreras de acceso o violencia que comprometan seguridad.

El término “alto riesgo” no significa que inevitablemente ocurrirá un desenlace adverso.

---$OBGYN_BODY$
WHERE section_key = 'high_risk_pregnancy'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Las Guías de Manejo de las Complicaciones en el Embarazo, versión 5.0, incluyen entre otros:

- embarazo en adolescentes y edad materna avanzada;
- pruebas de bienestar fetal;
- sangrado del primer trimestre;
- aborto;
- embarazo ectópico;
- enfermedad gestacional del trofoblasto;
- placenta previa;
- desprendimiento prematuro de placenta normoinserta;
- espectro de placenta acreta;
- parto pretérmino;
- embarazo prolongado;
- ruptura prematura de membranas;
- trastornos hipertensivos;
- restricción del crecimiento fetal;
- pérdida de bienestar fetal;
- hemorragia posparto;
- tromboembolismo;
- anemia;
- diabetes y enfermedad tiroidea;
- aloimunización eritrocitaria;
- enfermedades inmunológicas y cardíacas en el embarazo.

Para CICDE, el estudiante debe reconocer manifestaciones de peligro, prioridades de enfermería y necesidad de referencia, no memorizar tratamientos médicos complejos fuera de su competencia.

---$OBGYN_BODY$
WHERE section_key = 'panama_complications_scope'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El sangrado temprano puede tener causas diversas, incluyendo amenaza o pérdida gestacional, embarazo ectópico y enfermedad trofoblástica.

## Prioridades de enfermería

1. Valorar estado hemodinámico.
2. Cuantificar y describir sangrado cuando sea posible.
3. Valorar dolor, mareo, síncope y signos vitales.
4. Confirmar edad gestacional y antecedentes.
5. Mantener acceso venoso y tomar muestras si están indicados.
6. Preparar ultrasonido y pruebas según orden/protocolo.
7. Evitar tacto vaginal cuando exista sospecha de placenta previa en gestación avanzada hasta que se descarte de forma apropiada.
8. Brindar apoyo emocional y privacidad.

---$OBGYN_BODY$
WHERE section_key = 'first_trimester_bleeding'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Debe sospecharse ante combinación de embarazo posible/confirmado con dolor abdominal o pélvico, sangrado vaginal, mareo, síncope o signos de irritación peritoneal.

Un ectópico roto puede producir hemorragia interna y shock.

## Prioridad tipo examen

Gestante con dolor intenso + síncope + hipotensión = **emergencia**. No priorizar educación ni trámites administrativos sobre estabilización y evaluación urgente.

---$OBGYN_BODY$
WHERE section_key = 'ectopic_pregnancy'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La guía panameña diferencia causas como placenta previa y desprendimiento prematuro de placenta.

## Placenta previa

Clásicamente puede presentarse con sangrado vaginal, con frecuencia indoloro.

## Desprendimiento prematuro de placenta

Puede asociarse con sangrado, dolor abdominal, hipertonía uterina y compromiso materno-fetal; el sangrado visible puede subestimar la pérdida real.

## Seguridad

Ante sangrado en embarazo avanzado, priorizar estabilidad materna, evaluación fetal y protocolo obstétrico. No asumir diagnóstico solo por un síntoma.

---$OBGYN_BODY$
WHERE section_key = 'late_pregnancy_bleeding'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Se refiere a ruptura de membranas antes del inicio del trabajo de parto; cuando ocurre antes de término se considera pretérmino.

Puede aumentar riesgo de infección, parto pretérmino y otras complicaciones.

## Valoración

- hora de inicio;
- cantidad y características del líquido;
- olor;
- fiebre;
- contracciones;
- movimientos fetales;
- frecuencia cardíaca fetal;
- edad gestacional;
- signos de infección o prolapso de cordón.

Evitar manipulaciones vaginales innecesarias y seguir el protocolo institucional.

---$OBGYN_BODY$
WHERE section_key = 'premature_rupture_membranes'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La guía panameña incluye labor de parto pretérmino, diagnóstico, causas, tratamiento, corticoterapia y otras intervenciones especializadas.

## Enfermería

- identificar contracciones y síntomas;
- controlar signos vitales;
- valorar pérdida de líquido o sangrado;
- monitorizar bienestar fetal según indicación;
- mantener reposo/posición y acceso según protocolo;
- administrar tratamientos prescritos de forma segura;
- vigilar efectos adversos;
- preparar referencia a mayor nivel cuando corresponda.

No administrar tocolíticos o corticosteroides sin indicación y protocolo.

---$OBGYN_BODY$
WHERE section_key = 'preterm_labor'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La guía nacional vigente define:

## Hipertensión crónica

Presión arterial **≥140/90 mmHg** presente antes del embarazo, antes de 20 semanas o persistente después de 42 días posparto.

## Hipertensión gestacional

Hipertensión **de novo ≥140/90 mmHg después de 20 semanas**, sin criterios de preeclampsia.

## Preeclampsia

Hipertensión **de novo ≥140/90 mmHg después de 20 semanas** asociada a uno o más criterios de disfunción materna u organoplacentaria, como proteinuria, lesión renal, complicaciones hematológicas, hepáticas, neurológicas o uteroplacentarias.

**Clave:** la preeclampsia no requiere obligatoriamente proteinuria cuando existen otros criterios de daño orgánico.

---$OBGYN_BODY$
WHERE section_key = 'hypertensive_disorders'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Hallazgos que requieren evaluación rápida incluyen:

- presión arterial severamente elevada;
- cefalea intensa persistente;
- alteraciones visuales;
- dolor epigástrico o en hipocondrio derecho;
- alteración neurológica;
- convulsión;
- disnea o edema pulmonar;
- oliguria/lesión renal;
- trombocitopenia u otras alteraciones hematológicas;
- compromiso fetal.

La guía panameña indica iniciar manejo de crisis hipertensiva cuando la presión sistólica es **≥160 mmHg** o la diastólica **≥110 mmHg**.

## Eclampsia

Convulsión en el contexto de preeclampsia constituye una emergencia obstétrica. Las prioridades son seguridad, vía aérea, prevención de lesiones, activación inmediata del equipo, medicación prescrita/protocolizada y preparación para resolución obstétrica según criterio especializado.

---$OBGYN_BODY$
WHERE section_key = 'preeclampsia_emergency'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La restricción del crecimiento fetal implica que el feto no alcanza su potencial de crecimiento esperado por causas maternas, fetales o placentarias.

La guía panameña contempla diagnóstico, clasificación y seguimiento, incluyendo herramientas de bienestar fetal y Doppler.

## Enfermería

- vigilar adherencia a controles;
- identificar factores de riesgo;
- reforzar signos de alarma;
- apoyar monitorización indicada;
- comunicar disminución de movimientos fetales;
- documentar hallazgos y asegurar continuidad.

---$OBGYN_BODY$
WHERE section_key = 'fetal_growth_restriction'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Puede existir diabetes pregestacional o desarrollarse diabetes mellitus gestacional.

Factores de riesgo pueden incluir antecedentes de diabetes gestacional, obesidad, familiares de primer grado con diabetes, antecedentes de recién nacido grande para edad gestacional u otros definidos por protocolo.

## Cuidados de enfermería

- educación sobre automonitoreo cuando esté indicado;
- reconocimiento de hipoglucemia e hiperglucemia;
- adherencia a nutrición y tratamiento;
- administración segura de insulina u otros medicamentos prescritos;
- seguimiento fetal y materno;
- cuidado de piel y sitios de inyección;
- coordinación multidisciplinaria.

La guía panameña 2024 contempla tanto insulina como metformina en escenarios seleccionados; la decisión farmacológica corresponde al equipo tratante.

---$OBGYN_BODY$
WHERE section_key = 'diabetes_pregnancy'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La guía nacional incluye anemia ferropénica y hemoglobinopatías.

Enfermería debe valorar:

- síntomas como fatiga intensa, palidez, disnea o taquicardia;
- adherencia a suplementación;
- tolerancia gastrointestinal;
- dieta rica en hierro;
- hemoglobina y estudios indicados;
- signos de sangrado;
- necesidad de referencia.

No asumir que toda anemia se corrige únicamente con dieta.

---$OBGYN_BODY$
WHERE section_key = 'anemia_pregnancy'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Las infecciones pueden afectar a la madre, feto o recién nacido. La conducta depende del agente y edad gestacional.

Enfermería participa en:

- tamizaje;
- educación;
- administración de tratamientos prescritos;
- vigilancia de fiebre y signos sistémicos;
- prevención de transmisión;
- adherencia;
- notificación cuando corresponda;
- coordinación para manejo perinatal.

Fiebre, dolor abdominal, ruptura de membranas con mal olor o deterioro materno/fetal requieren atención rápida.

---$OBGYN_BODY$
WHERE section_key = 'infections_pregnancy'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Principios seguros:

- verificar indicación y alergias;
- revisar dosis y vía;
- considerar edad gestacional;
- evitar automedicación;
- confirmar compatibilidad con embarazo según fuente actual y protocolo;
- vigilar efectos maternos y fetales;
- documentar respuesta;
- no suspender tratamientos esenciales sin valoración profesional.

“Natural” no significa “seguro”. Plantas y suplementos también pueden producir efectos adversos o interacciones.

---$OBGYN_BODY$
WHERE section_key = 'medication_safety'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La enfermera debe:

1. Reconocer deterioro.
2. Realizar valoración primaria y signos vitales.
3. Identificar edad gestacional y problema principal.
4. Activar protocolos y equipo adecuado.
5. Monitorizar madre y feto según situación.
6. Obtener acceso y muestras cuando estén indicados.
7. Administrar tratamientos prescritos con seguridad.
8. Vigilar respuesta y efectos adversos.
9. Mantener comunicación clara y respetuosa.
10. Documentar de forma objetiva.
11. Preparar transferencia/referencia segura.
12. Brindar apoyo emocional sin retrasar intervenciones críticas.

---$OBGYN_BODY$
WHERE section_key = 'nursing_complications'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Ante una gestante, priorizar en este orden conceptual:

1. **Amenaza inmediata a vida materna.**
2. **Compromiso fetal significativo.**
3. **Complicación obstétrica que puede progresar rápidamente.**
4. **Necesidades de vigilancia y tratamiento.**
5. **Educación, comodidad y continuidad.**

La estabilidad materna suele ser requisito para preservar bienestar fetal.

---$OBGYN_BODY$
WHERE section_key = 'prioritization'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Caso 1
Gestante de 32 semanas con cefalea intensa, visión borrosa y PA 166/112 mmHg.

**Prioridad:** activar atención urgente por crisis hipertensiva/preeclampsia con criterios de gravedad; valorar madre y feto y seguir protocolo.

## Caso 2
Gestante de 10 semanas presenta dolor pélvico intenso, sangrado escaso, mareo y TA 82/50 mmHg.

**Prioridad:** emergencia por posible hemorragia interna/embarazo ectópico roto; estabilización inmediata.

## Caso 3
Gestante de 30 semanas refiere salida continua de líquido claro y contracciones leves.

**Prioridad:** valorar posible ruptura prematura de membranas y amenaza de parto pretérmino; evitar tactos innecesarios y activar protocolo.

## Caso 4
Gestante de 28 semanas acude sin síntomas y pregunta por qué debe realizarse prueba de glucosa.

**Respuesta:** la diabetes gestacional puede ser asintomática; el tamizaje se realiza en el período recomendado para detectarla oportunamente.

## Caso 5
Gestante Rh negativa pregunta si el resultado “solo es un dato de laboratorio”.

**Respuesta:** no; el Rh puede determinar necesidad de evaluación de sensibilización y profilaxis específica según protocolo.

## Caso 6
Gestante de 36 semanas presenta sangrado rojo brillante sin dolor.

**Prioridad:** valorar hemorragia obstétrica y posible placenta previa; evitar tacto vaginal digital hasta evaluación obstétrica apropiada.

## Caso 7
Gestante con diabetes pregestacional registra glucemias posprandiales persistentemente altas pese a plan indicado.

**Intervención:** comunicar al equipo tratante, revisar adherencia/técnica y reforzar monitoreo; no ajustar medicación por cuenta propia fuera de protocolo.

## Caso 8
Gestante de 34 semanas refiere menos movimientos fetales de lo habitual durante varias horas.

**Prioridad:** valoración de bienestar fetal; no recomendar simplemente “esperar hasta mañana”.

## Caso 9
Gestante de 9 semanas pregunta si puede tomar cualquier producto herbal porque es “natural”.

**Respuesta:** no; debe verificar seguridad con el equipo porque los productos naturales pueden tener efectos adversos o interacciones.

## Caso 10
Gestante de 24 semanas presenta disuria, fiebre y dolor lumbar.

**Prioridad:** sospechar infección urinaria alta/complicada y referir para evaluación y tratamiento; no atribuir los síntomas a cambios normales.

## Caso 11
Gestante con preeclampsia desarrolla una convulsión.

**Prioridad:** seguridad, vía aérea, activar emergencia obstétrica y protocolo de eclampsia; prevenir lesiones y administrar tratamiento indicado.

## Caso 12
Gestante adolescente falta repetidamente a controles porque no tiene transporte y teme revelar el embarazo.

**Intervención:** valorar barreras, confidencialidad, red de apoyo y riesgo; coordinar acceso y seguimiento sin estigmatizar.

---$OBGYN_BODY$
WHERE section_key = 'cases'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$1. Considerar edema aislado como diagnóstico de preeclampsia.
2. Creer que preeclampsia siempre requiere proteinuria.
3. Llamar “normal” a una PA ≥140/90 mmHg durante el embarazo.
4. Realizar tacto vaginal digital ante sangrado tardío sin descartar placenta previa.
5. Confundir metas de glucemia con criterios diagnósticos de diabetes gestacional.
6. Considerar cualquier sangrado del primer trimestre como aborto inevitable.
7. Confundir salida de líquido amniótico con leucorrea sin valorar.
8. Esperar a que aparezca fiebre para considerar riesgo infeccioso en ruptura de membranas.
9. Considerar disminución marcada de movimientos fetales como “normal al final del embarazo”.
10. Ajustar antihipertensivos, insulina o tocolíticos sin orden/protocolo.
11. Asumir que una prueba prenatal normal elimina todo riesgo posterior.
12. Retrasar estabilización materna para realizar educación o documentación no urgente.

---$OBGYN_BODY$
WHERE section_key = 'errors'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$**CICDE OBGYN-02 = desarrollo fetal + cambios fisiológicos + pruebas + valoración + cuidados + alteraciones gineco-obstétricas.**

**OMS: atención prenatal temprana y modelo de 8 contactos.**

**Ultrasonido antes de 24 semanas: útil para edad gestacional y evaluación fetal.**

**Tamizaje temprano: VIH, sífilis y hepatitis B.**

**Diabetes gestacional: tamizaje habitual 24–28 semanas.**

**Panamá 2024/2025: Resolución 1105 aprueba Guías de Manejo de las Complicaciones en el Embarazo para todo el país.**

**HTA crónica: ≥140/90 antes del embarazo o antes de 20 semanas.**

**HTA gestacional: ≥140/90 de novo después de 20 semanas sin criterios de preeclampsia.**

**Preeclampsia: HTA de novo después de 20 semanas + proteinuria y/o disfunción orgánica/uteroplacentaria.**

**Crisis hipertensiva en la guía panameña: PAS ≥160 o PAD ≥110 mmHg.**

**Sangrado + inestabilidad = emergencia hasta demostrar lo contrario.**

**Pérdida de líquido + prematuridad = valorar ruptura de membranas y riesgo de parto pretérmino.**

**Disminución significativa de movimientos fetales = evaluar bienestar fetal.**

---$OBGYN_BODY$
WHERE section_key = 'memorize'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$| Concepto | Diferencia práctica |
|---|---|
| Cambio fisiológico | Esperado, sin datos de deterioro |
| Signo de alarma | Puede indicar complicación y requiere valoración |
| HTA crónica | Previa o <20 semanas; puede persistir posparto |
| HTA gestacional | De novo >20 semanas, sin criterios de preeclampsia |
| Preeclampsia | HTA >20 semanas + proteinuria y/o disfunción orgánica/uteroplacentaria |
| Eclampsia | Convulsión asociada a preeclampsia; emergencia |
| Placenta previa | Sangrado tardío frecuentemente indoloro |
| DPPNI | Puede producir dolor, hipertonía y hemorragia visible u oculta |
| RPM | Ruptura de membranas antes del trabajo de parto |
| RPM pretérmino | RPM antes de 37 semanas |
| Meta de glucosa | Objetivo de control en paciente ya diagnosticada |
| Criterio diagnóstico | Define enfermedad según prueba/protocolo |

---$OBGYN_BODY$
WHERE section_key = 'differences'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Este tema evalúa especialmente la capacidad para:

- brindar cuidados durante el ciclo vital;
- aplicar proceso de enfermería;
- establecer prioridades;
- reconocer situaciones de urgencia;
- aplicar bioseguridad;
- administrar tratamientos prescritos de forma segura;
- educar a la persona y familia;
- documentar y evaluar resultados;
- coordinar con el equipo multidisciplinario;
- aplicar principios éticos, legales y de respeto a derechos.

---$OBGYN_BODY$
WHERE section_key = 'competencies'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Fuente rectora

**CICDE Panamá. Lineamientos para el Examen por Competencia de Profesionales de Enfermería, 2026.**

El documento identifica expresamente OBGYN-02 como **“Embarazo normal y patológico”** con los seis subtemas desarrollados en este paquete.

## Bibliografía señalada por CICDE

- **Cunningham, Leveno, Hoffman, Spong & Casey. Williams Obstetricia. 26.ª edición. McGraw Hill. 2022.** Se conserva como bibliografía CICDE; este paquete no depende de copias no autorizadas.
- **Carvajal, J. & García, K. Manual de obstetricia y ginecología. 2024.**
- **Espinoza, P.; Guaraca, A.; Calderón, P.; Guapacasa, A. Enfermería en Gineco obstetricia. Mawil. 2022.**

## Panamá — normativa y fuentes institucionales

- **Ministerio de Salud. Resolución 1105 de 30 de diciembre de 2024.** Aprueba las Guías de Manejo de las Complicaciones en el Embarazo para todas las instalaciones públicas y privadas del país. La guía es versión 5.0, año 2024, promulgada en enero de 2025.
- **MINSA/CSS. Normas Técnicas-Administrativas y Protocolos de Atención del Programa de Salud Integral de la Mujer.** Fuente institucional para control prenatal, Rh, tamizajes y continuidad. Su antigüedad obliga a contrastar conductas de alto impacto con normativa más reciente.
- **Ministerio de Salud. Programa de Salud Sexual y Reproductiva.**

## Fuentes complementarias actuales

- **World Health Organization. WHO recommendations on maternal health: guidelines approved by the WHO Guidelines Review Committee, 2nd ed. 2025.**
- **World Health Organization. WHO recommendations on antenatal care for a positive pregnancy experience.** Recomendaciones y actualizaciones vigentes, incluyendo ultrasonido antes de 24 semanas.
- **World Health Organization. Toolkit for adaptation of WHO recommendations for a positive pregnancy and postnatal experience. 2025.**

---$OBGYN_BODY$
WHERE section_key = 'sources'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Este paquete:

- cubre los seis subtemas explícitos de OBGYN-02;
- distingue embarazo normal de signos de alarma;
- integra valoración prenatal y pruebas de manera no prescriptiva;
- utiliza la Guía Panamá 2024/Resolución 1105 como referencia normativa principal para complicaciones;
- incluye criterios de hipertensión y crisis hipertensiva tomados de la guía panameña vigente;
- diferencia metas de control glucémico de criterios diagnósticos;
- evita presentar protocolos antiguos como si fueran automáticamente vigentes cuando existe normativa más reciente;
- evita sustituir decisiones médicas especializadas por algoritmos simplificados;
- contiene 12 situaciones originales tipo examen;
- permanece en `REVIEW` porque no existe revisión humana/clinician provenance.

---$OBGYN_BODY$
WHERE section_key = 'quality_control'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$**Estado recomendado:** `REVIEW`

Antes de un eventual estado de publicación más fuerte:

- mantener trazabilidad con CICDE;
- conservar como referencia nacional principal la Resolución 1105/2024 y su guía anexa;
- revalidar cualquier protocolo farmacológico o de alto riesgo si MINSA publica una actualización posterior;
- no registrar `reviewed_by` ni `VERIFIED` sin revisión humana real.$OBGYN_BODY$
WHERE section_key = 'integration_status'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-02'
  );


-- Update OBGYN-03 sections (54)
UPDATE lesson_sections
SET body = $OBGYN_BODY$El lineamiento CICDE 2026 incluye expresamente:

1. Labor y parto normal.
2. Cambios fisiológicos durante el puerperio.
3. Intervenciones de enfermería durante el puerperio.
4. Cuidados de enfermería en cesárea y farmacología.

El título del punto exige además comprender los mecanismos del parto en sus diferentes períodos. Este paquete mantiene ese alcance y actualiza el contexto con recomendaciones OMS y normativa panameña vigente.

---$OBGYN_BODY$
WHERE section_key = 'scope'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Al finalizar, el estudiante debe poder:

1. Diferenciar pródromos, trabajo de parto verdadero y falso trabajo de parto.
2. Reconocer las etapas del trabajo de parto.
3. Describir los movimientos cardinales del mecanismo del parto cefálico.
4. Identificar parámetros básicos de vigilancia materna y fetal durante el parto.
5. Aplicar cuidados respetuosos, seguros y centrados en la mujer.
6. Reconocer signos de progreso normal y signos de alarma.
7. Explicar cambios fisiológicos del puerperio.
8. Priorizar la vigilancia de hemorragia, infección, hipertensión, tromboembolismo y alteraciones emocionales posparto.
9. Reconocer cuidados preoperatorios, intraoperatorios y posoperatorios de cesárea.
10. Identificar grupos farmacológicos frecuentes en obstetricia sin prescribir ni sustituir protocolos.
11. Reconocer la hemorragia posparto como emergencia obstétrica.
12. Resolver situaciones clínicas tipo CICDE mediante priorización de enfermería.

---$OBGYN_BODY$
WHERE section_key = 'objectives'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El trabajo de parto es un proceso fisiológico caracterizado por contracciones uterinas que producen cambios cervicales progresivos y culminan con nacimiento y alumbramiento.

La evaluación debe considerar el conjunto de contracciones, cambios cervicales, presentación fetal, membranas, bienestar materno y fetal y contexto clínico.

---$OBGYN_BODY$
WHERE section_key = 'labor_concept'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Trabajo de parto verdadero

Suele presentar:

- contracciones regulares que aumentan en intensidad y frecuencia;
- cambios cervicales progresivos;
- dolor que puede irradiar desde espalda hacia abdomen;
- persistencia pese a cambios de actividad.

## Falso trabajo de parto

Puede presentar contracciones irregulares, sin cambios cervicales progresivos y con variabilidad según actividad o reposo.

## Clave

La presencia de dolor por sí sola no confirma trabajo de parto.

---$OBGYN_BODY$
WHERE section_key = 'true_false_labor'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Una forma clásica de recordar los factores es considerar:

- **pasajero:** feto y placenta;
- **pasaje:** pelvis ósea y tejidos blandos;
- **poderes:** contracciones uterinas y esfuerzos expulsivos;
- **posición materna:** movilidad y postura;
- **respuesta psicológica:** percepción, ansiedad, apoyo y ambiente.

La evaluación integral evita atribuir progreso lento a una sola causa.

---$OBGYN_BODY$
WHERE section_key = 'five_ps'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Situación

Relación entre eje fetal y eje materno: longitudinal, transversa u oblicua.

## Presentación

Parte fetal que se aproxima al estrecho superior de la pelvis. La cefálica es la presentación más frecuente en el parto vaginal normal.

## Posición

Relación de un punto de referencia de la presentación fetal con la pelvis materna.

En presentación cefálica de vértice, el occipucio es el punto de referencia habitual.

---$OBGYN_BODY$
WHERE section_key = 'fetal_lie_presentation_position'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Primera etapa

Desde el inicio del trabajo de parto establecido hasta dilatación cervical completa.

Incluye fase latente y fase activa. La OMS advierte que la progresión del parto es variable y que usar de forma rígida una velocidad de dilatación de 1 cm/h como criterio universal puede llevar a intervenciones innecesarias.

## Segunda etapa

Desde dilatación completa hasta nacimiento del bebé.

## Tercera etapa

Desde nacimiento del bebé hasta expulsión de la placenta.

## Cuarta etapa o recuperación inmediata

Período de vigilancia intensiva posterior al alumbramiento, importante para detectar hemorragia y deterioro materno temprano.

---$OBGYN_BODY$
WHERE section_key = 'labor_stages'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$En un parto cefálico de vértice, los movimientos cardinales se describen de forma secuencial, aunque en la realidad se superponen:

1. Encajamiento.
2. Descenso.
3. Flexión.
4. Rotación interna.
5. Extensión.
6. Restitución y rotación externa.
7. Expulsión.

## Clave

No confundir estas maniobras fisiológicas del feto con intervenciones realizadas por el personal.

---$OBGYN_BODY$
WHERE section_key = 'cardinal_movements'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Encajamiento

Ocurre cuando el diámetro biparietal atraviesa el estrecho superior de la pelvis.

## Descenso

Progresión de la presentación fetal a través de la pelvis.

Puede ocurrir gradualmente durante el trabajo de parto y aumenta durante el segundo período.

---$OBGYN_BODY$
WHERE section_key = 'engagement_descent'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Flexión

Facilita la presentación de un diámetro cefálico más favorable para el paso por la pelvis.

## Rotación interna

Orienta el occipucio hacia una posición compatible con el diámetro de salida.

## Extensión

Permite que la cabeza pase por debajo de la sínfisis púbica y nazca.

---$OBGYN_BODY$
WHERE section_key = 'flexion_rotation_extension'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Tras el nacimiento de la cabeza:

- la cabeza realiza restitución respecto a los hombros;
- ocurre rotación externa relacionada con la rotación de los hombros;
- nacen hombro anterior, hombro posterior y resto del cuerpo.

---$OBGYN_BODY$
WHERE section_key = 'restitution_expulsion'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Valorar:

- signos vitales;
- frecuencia y características de contracciones;
- estado de membranas;
- sangrado;
- movimientos fetales;
- frecuencia cardíaca fetal;
- presentación y situación según competencia;
- edad gestacional;
- antecedentes obstétricos;
- factores de riesgo;
- dolor y preferencias;
- alergias y medicamentos;
- apoyo/acompañante;
- datos de alarma.

---$OBGYN_BODY$
WHERE section_key = 'labor_admission'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La OMS recomienda atención centrada en la mujer, que preserve:

- dignidad;
- privacidad;
- confidencialidad;
- comunicación clara;
- consentimiento informado;
- ausencia de maltrato;
- acompañante de elección cuando sea posible y permitido;
- participación en decisiones;
- alivio del dolor apropiado;
- apoyo emocional.

La seguridad clínica y el respeto no son objetivos opuestos.

---$OBGYN_BODY$
WHERE section_key = 'respectful_care'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$En mujeres de bajo riesgo, la movilidad y posiciones elegidas pueden favorecer comodidad y experiencia positiva cuando no existen contraindicaciones.

La hidratación y alimentación durante trabajo de parto deben ajustarse al riesgo, fase, posibilidad de intervención y protocolo institucional.

No imponer restricción absoluta de movimiento o posición sin indicación clínica.

---$OBGYN_BODY$
WHERE section_key = 'mobility_hydration'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Valorar:

- frecuencia;
- duración;
- intensidad según método disponible;
- tono uterino entre contracciones;
- patrón y progresión;
- respuesta fetal.

Taquisistolia, dolor continuo anormal o hipertonía requieren valoración inmediata.

---$OBGYN_BODY$
WHERE section_key = 'contractions_monitoring'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La vigilancia fetal busca identificar signos de compromiso fetal y orientar decisiones oportunas.

La guía panameña 2024 incluye monitoreo fetal intraparto y sistemas de clasificación del registro cardiotocográfico.

La interpretación debe considerar línea basal, variabilidad, aceleraciones, desaceleraciones, contracciones y contexto clínico. Enfermería debe reconocer patrones preocupantes, aplicar medidas iniciales indicadas y comunicar oportunamente.

---$OBGYN_BODY$
WHERE section_key = 'fetal_monitoring'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Cuando se rompen las membranas, valorar:

- hora;
- color;
- olor;
- cantidad;
- frecuencia cardíaca fetal;
- presentación fetal;
- signos de prolapso de cordón;
- temperatura materna y otros signos de infección.

Líquido meconial requiere valoración contextual; no equivale por sí solo a diagnóstico de sufrimiento fetal.

---$OBGYN_BODY$
WHERE section_key = 'membrane_rupture'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El dolor tiene componentes fisiológicos, emocionales y culturales.

Medidas no farmacológicas pueden incluir:

- apoyo continuo;
- respiración y relajación;
- cambio de posición;
- masaje;
- ambiente tranquilo;
- calor u otras medidas permitidas.

El alivio farmacológico y anestésico se administra según indicación, elección informada y protocolo.

---$OBGYN_BODY$
WHERE section_key = 'labor_pain'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Durante el período expulsivo:

- mantener vigilancia materna y fetal;
- apoyar posición elegida cuando sea segura;
- guiar pujos de acuerdo con situación clínica y protocolo;
- mantener asepsia;
- preparar equipo para nacimiento y reanimación neonatal;
- observar progreso y posibles emergencias;
- ofrecer información y apoyo continuo.

No aplicar presión fúndica de rutina como forma de acelerar el nacimiento.

---$OBGYN_BODY$
WHERE section_key = 'second_stage_nursing'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Tras el nacimiento se priorizan:

- valoración inicial del recién nacido;
- respiración y tono;
- prevención de pérdida de calor;
- contacto piel con piel cuando madre y bebé están estables;
- inicio temprano de lactancia cuando es posible;
- identificación segura;
- vigilancia materna del sangrado y tono uterino.

Los detalles de atención neonatal se desarrollan en el área pediátrica.

---$OBGYN_BODY$
WHERE section_key = 'birth_immediate_care'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El tercer período termina con la expulsión de la placenta.

Enfermería vigila:

- sangrado;
- signos vitales;
- tono uterino;
- integridad aparente de placenta según rol/protocolo;
- dolor;
- signos de retención o hemorragia;
- respuesta a uterotónicos prescritos.

La prevención y detección precoz de hemorragia posparto es prioritaria.

---$OBGYN_BODY$
WHERE section_key = 'third_stage'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La guía panameña vigente contiene un protocolo específico de hemorragia posparto.

Ante sangrado excesivo o signos de shock:

1. Activar respuesta obstétrica de emergencia.
2. Valorar vía aérea, respiración y circulación.
3. Cuantificar pérdida sanguínea cuando sea posible.
4. Vigilar signos vitales y estado mental.
5. Obtener/mantener acceso venoso de calibre adecuado según protocolo.
6. Preparar líquidos, sangre, medicamentos y procedimientos indicados.
7. Valorar tono uterino y causas posibles con el equipo.
8. Mantener comunicación y documentación continua.

No esperar a que aparezca hipotensión profunda para actuar.

---$OBGYN_BODY$
WHERE section_key = 'postpartum_hemorrhage'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Las primeras horas después del nacimiento requieren vigilancia estrecha.

Valorar repetidamente:

- presión arterial, pulso, respiración y temperatura;
- tono y altura uterina;
- sangrado/loquios;
- vejiga;
- periné o herida quirúrgica;
- dolor;
- nivel de conciencia;
- recuperación anestésica si aplica;
- vínculo y lactancia;
- signos de deterioro.

---$OBGYN_BODY$
WHERE section_key = 'fourth_stage'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El puerperio es el período posterior al nacimiento durante el cual el organismo materno experimenta cambios progresivos hacia el estado no gestante.

La recuperación física y emocional continúa durante semanas y puede requerir más tiempo en algunos sistemas.

---$OBGYN_BODY$
WHERE section_key = 'puerperium_definition'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Después del alumbramiento el útero se contrae y disminuye progresivamente de tamaño.

Un útero blando asociado a sangrado puede sugerir atonía y requiere intervención inmediata según protocolo.

La vejiga distendida puede desplazar el útero e interferir con una contracción eficaz.

---$OBGYN_BODY$
WHERE section_key = 'uterine_involution'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Los loquios cambian de aspecto durante el puerperio.

La cantidad, olor, presencia de coágulos y evolución deben valorarse en conjunto.

## Alarma

Sangrado abundante, aumento súbito, coágulos grandes, mal olor, fiebre, mareo o signos de shock requieren valoración urgente.

---$OBGYN_BODY$
WHERE section_key = 'lochia'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Después del nacimiento se producen cambios importantes en volumen circulante y distribución de líquidos.

Pueden aparecer diuresis y diaforesis aumentadas como mecanismos fisiológicos de eliminación de exceso de líquido.

Sin embargo, disnea, dolor torácico, taquicardia persistente, síncope o edema pulmonar requieren evaluación urgente.

---$OBGYN_BODY$
WHERE section_key = 'postpartum_cardiovascular'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El puerperio incluye inicio y establecimiento de lactancia.

Enfermería debe apoyar:

- contacto precoz;
- posición y agarre;
- alimentación a demanda cuando corresponda;
- identificación de dolor, grietas o ingurgitación;
- reconocimiento de signos de mastitis;
- educación sin coerción y respetando decisiones informadas.

---$OBGYN_BODY$
WHERE section_key = 'breastfeeding'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Valorar:

- micción espontánea;
- retención urinaria;
- dolor o disuria;
- función intestinal;
- estreñimiento;
- hemorroides;
- hidratación y movilidad.

Retención urinaria puede afectar involución uterina y comodidad.

---$OBGYN_BODY$
WHERE section_key = 'elimination'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Tras parto vaginal valorar:

- edema;
- hematoma;
- dolor;
- suturas si existen;
- signos de infección;
- higiene;
- función urinaria y rectal.

Dolor desproporcionado, masa dolorosa o deterioro hemodinámico pueden sugerir hematoma significativo.

---$OBGYN_BODY$
WHERE section_key = 'perineum'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Es importante diferenciar cambios emocionales transitorios de trastornos que requieren atención.

Valorar:

- tristeza persistente;
- ansiedad intensa;
- incapacidad para dormir aun cuando existe oportunidad;
- deterioro funcional;
- ideas de daño a sí misma o al bebé;
- confusión, delirios o alucinaciones.

La psicosis posparto es una emergencia. La ideación suicida también requiere evaluación inmediata de seguridad.

---$OBGYN_BODY$
WHERE section_key = 'postpartum_mental_health'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$El riesgo tromboembólico permanece aumentado en el puerperio.

Signos de alarma:

- edema unilateral;
- dolor en pantorrilla o extremidad;
- disnea súbita;
- dolor torácico;
- taquicardia inexplicada;
- hemoptisis;
- síncope.

No realizar maniobras provocativas de dolor como método diagnóstico.

---$OBGYN_BODY$
WHERE section_key = 'postpartum_vte'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Vigilar:

- fiebre;
- escalofríos;
- dolor uterino importante;
- loquios fétidos;
- herida enrojecida o con secreción;
- disuria;
- mastitis;
- deterioro sistémico.

Sepsis puerperal requiere reconocimiento y tratamiento rápidos.

---$OBGYN_BODY$
WHERE section_key = 'puerperal_infection'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Los trastornos hipertensivos pueden persistir o aparecer después del parto.

Cefalea intensa, alteraciones visuales, dolor epigástrico, disnea, hipertensión severa o convulsión en puerperio requieren atención urgente.

No asumir que el riesgo de preeclampsia termina inmediatamente con el nacimiento.

---$OBGYN_BODY$
WHERE section_key = 'postpartum_hypertension'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Incluir:

- sangrado esperado y signos de alarma;
- fiebre e infección;
- cuidado de herida/periné;
- dolor y medicamentos;
- lactancia o alimentación elegida;
- hidratación y nutrición;
- movilidad;
- salud mental;
- signos de tromboembolismo;
- planificación familiar;
- controles maternos y del recién nacido;
- dónde acudir en caso de emergencia.

---$OBGYN_BODY$
WHERE section_key = 'discharge_education'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La cesárea es un procedimiento quirúrgico para el nacimiento mediante incisiones abdominal y uterina.

Puede ser programada o urgente. No es intrínsecamente “mejor” o “peor” que el parto vaginal; la indicación depende de seguridad materna y fetal.

---$OBGYN_BODY$
WHERE section_key = 'cesarean_concept'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Según protocolo:

- verificar identidad y procedimiento;
- confirmar consentimiento informado;
- revisar alergias;
- verificar estudios y preparación;
- controlar signos vitales y bienestar fetal;
- establecer acceso venoso;
- administrar profilaxis prescrita;
- preparar piel según norma;
- retirar objetos cuando corresponda;
- brindar información y apoyo emocional;
- documentar.

---$OBGYN_BODY$
WHERE section_key = 'cesarean_preop'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Enfermería participa en:

- seguridad quirúrgica;
- asepsia;
- posicionamiento y prevención de lesiones;
- conteo de material según rol;
- vigilancia hemodinámica;
- administración segura de medicamentos;
- preparación para hemorragia;
- comunicación del equipo;
- recepción segura del recién nacido.

---$OBGYN_BODY$
WHERE section_key = 'cesarean_intraop'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Prioridades:

- vía aérea y recuperación anestésica;
- signos vitales;
- dolor;
- sangrado vaginal y tono uterino;
- herida quirúrgica;
- diuresis;
- náuseas/vómitos;
- movilidad temprana cuando sea segura;
- prevención de tromboembolismo;
- lactancia y contacto madre-bebé cuando estén estables;
- infección;
- función intestinal;
- educación de alta.

---$OBGYN_BODY$
WHERE section_key = 'cesarean_postop'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La farmacología en parto y cesárea debe estudiarse por **objetivo, efecto, riesgos y vigilancia**, no solo por nombres.

Grupos frecuentes:

- uterotónicos;
- analgésicos y anestésicos;
- antibióticos profilácticos o terapéuticos;
- antieméticos;
- anticoagulantes en pacientes seleccionadas;
- medicamentos para hipertensión/eclampsia cuando corresponda;
- fármacos para inducción o maduración cervical según protocolo.

Enfermería no prescribe; verifica orden, dosis, vía, alergias, compatibilidad, respuesta y efectos adversos.

---$OBGYN_BODY$
WHERE section_key = 'obstetric_pharmacology'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Se utiliza en contextos de inducción/estimulación del trabajo de parto y prevención o tratamiento de hemorragia posparto según protocolos específicos.

## Riesgos a vigilar

- taquisistolia uterina;
- alteraciones del patrón fetal;
- hipotensión u otros efectos según vía/dosis;
- balance hídrico en infusiones prolongadas.

La oxitocina es un medicamento de alto riesgo en muchos sistemas y requiere control preciso.

---$OBGYN_BODY$
WHERE section_key = 'oxytocin'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$MINSA publicó en 2026 un **Protocolo para el uso fuera de etiqueta de misoprostol** en obstetricia/ginecología.

Esto confirma que su utilización se encuentra sujeta a indicaciones, contraindicaciones, vía, dosis y vigilancia protocolizadas.

## Seguridad

No memorizar ni aplicar una dosis aislada fuera del escenario clínico, porque el esquema cambia según indicación, edad gestacional, condición uterina y objetivo terapéutico.

---$OBGYN_BODY$
WHERE section_key = 'misoprostol_panama'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La profilaxis antibiótica perioperatoria busca reducir infección del sitio quirúrgico y endometritis.

Enfermería debe:

- verificar alergias;
- confirmar administración en el tiempo indicado por protocolo;
- vigilar reacciones;
- documentar;
- no prolongar antibióticos por cuenta propia.

---$OBGYN_BODY$
WHERE section_key = 'cesarean_antibiotics'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La cesárea puede realizarse con técnicas neuraxiales o anestesia general según situación clínica.

Enfermería vigila:

- presión arterial;
- respiración y oxigenación;
- nivel de conciencia;
- dolor;
- bloqueo motor/sensitivo;
- náusea y vómito;
- prurito o efectos de opioides;
- retención urinaria;
- recuperación segura antes de movilización.

---$OBGYN_BODY$
WHERE section_key = 'analgesia_anesthesia'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$La cesárea incrementa riesgo tromboembólico en comparación con parto vaginal.

Las medidas pueden incluir:

- movilización temprana;
- hidratación adecuada;
- dispositivos mecánicos;
- anticoagulación en pacientes seleccionadas.

La elección depende de evaluación individual y protocolo.

---$OBGYN_BODY$
WHERE section_key = 'vte_prevention'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$1. Reconocer deterioro.
2. Pedir ayuda/activar protocolo.
3. Evaluar ABC y circulación.
4. Controlar signos vitales.
5. Valorar sangrado y tono uterino cuando aplique.
6. Evaluar bienestar fetal si aún está embarazada.
7. Mantener acceso venoso y preparar tratamiento indicado.
8. Revaluar respuesta.
9. Documentar tiempos, hallazgos e intervenciones.
10. Mantener comunicación respetuosa con la mujer y familia.

---$OBGYN_BODY$
WHERE section_key = 'deterioration_priorities'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Caso 1
Mujer en trabajo de parto tiene contracciones regulares y dilatación cervical progresiva.

**Interpretación:** trabajo de parto verdadero.

## Caso 2
Durante el monitoreo con oxitocina aparecen contracciones excesivamente frecuentes y patrón fetal preocupante.

**Prioridad:** reconocer posible hiperestimulación, actuar según protocolo, detener/reducir la infusión si el protocolo/orden lo establece y comunicar de inmediato.

## Caso 3
Después del parto el útero está blando y hay sangrado abundante.

**Prioridad:** sospechar atonía/hemorragia posparto y activar manejo urgente.

## Caso 4
Puérpera presenta vejiga distendida, fondo uterino desplazado y sangrado aumentado.

**Intervención:** favorecer vaciamiento vesical según condición y protocolo mientras se revalora tono/sangrado.

## Caso 5
Puérpera de cesárea presenta dolor torácico súbito y disnea.

**Prioridad:** emergencia por posible tromboembolismo pulmonar; activar respuesta inmediata.

## Caso 6
Mujer de bajo riesgo solicita cambiar de posición durante el trabajo de parto.

**Respuesta:** favorecer movilidad/posición elegida si no hay contraindicación clínica.

## Caso 7
Puérpera presenta fiebre, dolor uterino y loquios fétidos.

**Prioridad:** sospechar infección puerperal y referir/evaluar oportunamente.

## Caso 8
Después de cesárea, la paciente continúa con bloqueo motor importante e intenta caminar sola.

**Intervención:** impedir deambulación insegura, asistir y revaluar recuperación anestésica.

## Caso 9
Puérpera refiere tristeza leve durante primeras horas pero mantiene vínculo, descanso y funcionamiento; otra paciente presenta delirios y dice que el bebé está poseído.

**Prioridad:** la segunda requiere atención de emergencia por posible psicosis posparto.

## Caso 10
Tras ruptura de membranas, se observa bradicardia fetal y una estructura compatible con cordón en vagina.

**Prioridad:** emergencia por posible prolapso de cordón; activar protocolo y medidas de alivio de compresión según entrenamiento mientras se prepara resolución urgente.

## Caso 11
Paciente pregunta por qué recibe antibiótico antes de cesárea.

**Respuesta:** la profilaxis reduce el riesgo de infección quirúrgica; confirmar alergias y administración según tiempo protocolizado.

## Caso 12
Puérpera con antecedente de preeclampsia presenta cefalea intensa y PA 165/110 mmHg dos días después del parto.

**Prioridad:** emergencia hipertensiva posparto; no atribuirla a cansancio.

---$OBGYN_BODY$
WHERE section_key = 'cases'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$1. Pensar que trabajo de parto se confirma solo por dolor.
2. Utilizar 1 cm/h como regla rígida universal de progreso.
3. Confundir movimientos cardinales con maniobras del personal.
4. Considerar líquido meconial diagnóstico automático de sufrimiento fetal.
5. Ignorar la vejiga distendida cuando existe atonía/sangrado.
6. Retrasar respuesta a hemorragia hasta que la paciente esté hipotensa.
7. Creer que el riesgo de preeclampsia termina al nacer el bebé.
8. Realizar deambulación sin verificar recuperación anestésica.
9. Considerar fiebre puerperal siempre “normal por la leche”.
10. Aplicar dosis de uterotónicos sin contexto/protocolo.
11. Omitir evaluación de salud mental posparto.
12. Priorizar documentación antes que estabilización en una emergencia.

---$OBGYN_BODY$
WHERE section_key = 'errors'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$**Etapas:** dilatación → expulsivo → alumbramiento → recuperación inmediata.

**Movimientos cardinales:** encajamiento, descenso, flexión, rotación interna, extensión, restitución/rotación externa, expulsión.

**Parto respetuoso:** dignidad + privacidad + comunicación + consentimiento + apoyo.

**1 cm/h NO es una regla universal para intervenir.**

**Posparto inmediato: vigilar signos vitales + útero + sangrado + vejiga + dolor + recuperación anestésica.**

**Útero blando + sangrado = emergencia por posible atonía/HPP.**

**Preeclampsia puede presentarse o persistir posparto.**

**Cesárea: seguridad preoperatoria + vigilancia intraoperatoria + recuperación, sangrado, herida, movilidad y tromboprofilaxis posoperatoria.**

**Oxitocina y misoprostol requieren indicación y protocolo; no son medicamentos para uso improvisado.**

---$OBGYN_BODY$
WHERE section_key = 'memorize'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$| Concepto | Diferencia |
|---|---|
| Trabajo de parto verdadero | Contracciones + cambios cervicales progresivos |
| Falso trabajo | Sin progresión cervical sostenida |
| Primera etapa | Inicio del trabajo de parto a dilatación completa |
| Segunda etapa | Dilatación completa a nacimiento |
| Tercera etapa | Nacimiento a expulsión placentaria |
| Cuarta etapa | Recuperación inmediata y vigilancia de complicaciones |
| Atonía uterina | Útero con contracción ineficaz, causa importante de HPP |
| Lochia fisiológica | Evolución esperada sin deterioro |
| Hemorragia posparto | Sangrado excesivo/compromiso; emergencia |
| Cesárea programada | Planificada antes de urgencia intraparto |
| Cesárea urgente | Indicada por condición materna/fetal que requiere resolución rápida |

---$OBGYN_BODY$
WHERE section_key = 'differences'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Este tema exige:

- juicio clínico y priorización;
- atención segura durante parto y puerperio;
- vigilancia materno-fetal;
- administración segura de medicamentos;
- comunicación terapéutica;
- educación a mujer y familia;
- bioseguridad y técnica aséptica;
- documentación;
- colaboración interdisciplinaria;
- respeto de derechos, privacidad y consentimiento.

---$OBGYN_BODY$
WHERE section_key = 'competencies'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$## Fuente rectora

**CICDE Panamá. Lineamientos para el Examen por Competencia de Profesionales de Enfermería, 2026.** El punto 3 del área Gineco-Obstétrica exige labor y parto, mecanismos del parto, puerperio, cesárea y farmacología.

## Bibliografía CICDE

- **Espinoza, P.; Guaraca, A.; Calderón, P.; Guapacasa, A. Enfermería en Gineco obstetricia. Mawil. 2022.**
- **Guana, M.; Cappadona, R.; Di Paolo, A. Enfermería Ginecoobstetricia. 2006.**

## Panamá — fuentes oficiales

- **MINSA. Resolución 1105 de 30 de diciembre de 2024 / Guías de Manejo de las Complicaciones en el Embarazo, versión 5.0.** Incluye monitoreo fetal intraparto, hemorragia posparto, ruptura uterina, shock, tromboembolismo, puerperio e inducción/maduración, entre otros.
- **MINSA. Protocolo para uso fuera de etiqueta de misoprostol, 2026.** Se usa únicamente como contexto de farmacología protocolizada; este paquete no reproduce esquemas de dosis.

## Fuentes complementarias

- **World Health Organization. WHO recommendations: intrapartum care for a positive childbirth experience. 2018.**
- **World Health Organization. WHO Labour Care Guide: user’s manual. 2021.**
- **World Health Organization. WHO Labour Care Guide implementation resource package. 2025.**
- **World Health Organization. WHO recommendations on maternal and newborn care for a positive postnatal experience. 2022.**
- **World Health Organization. WHO recommendations on maternal health, 2nd ed. 2025.**

---$OBGYN_BODY$
WHERE section_key = 'sources'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$Este paquete:

- cubre los cuatro subtemas explícitos de OBGYN-03;
- incorpora los mecanismos cardinales del parto exigidos por el título;
- utiliza enfoque de parto respetuoso y centrado en la mujer;
- evita la regla rígida de dilatación de 1 cm/h;
- prioriza vigilancia materna y fetal;
- incluye puerperio fisiológico y principales signos de alarma;
- incorpora cuidados de cesárea por fases;
- trata farmacología por objetivos y seguridad, sin convertir el material en prescripción;
- incorpora la existencia del protocolo MINSA 2026 de misoprostol sin reproducir dosis dependientes de contexto;
- contiene 12 situaciones originales tipo examen;
- permanece en `REVIEW` sin atribuir revisión humana inexistente.

---$OBGYN_BODY$
WHERE section_key = 'quality_control'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

UPDATE lesson_sections
SET body = $OBGYN_BODY$**Estado recomendado:** `REVIEW`.

Antes de un estado de publicación más fuerte:

- conservar trazabilidad con CICDE;
- revalidar farmacología obstétrica contra cualquier norma MINSA posterior;
- mantener referencia a la Guía Panamá 2024/Resolución 1105;
- no establecer `reviewed_by` ni `VERIFIED` sin revisión humana real.$OBGYN_BODY$
WHERE section_key = 'integration_status'
  AND lesson_id IN (
    SELECT l.id FROM lessons l
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code = 'OBGYN-03'
  );

-- ================================================================
-- POSTCONDITIONS
-- ================================================================

DO $$
DECLARE
  obgyn_lessons INT;
  obgyn_sv INT;
  obgyn_sections INT;
  obgyn_sources INT;
  obgyn_lesson_sources INT;
  obgyn_empty_bodies INT;
  obgyn_01_unique_bodies INT;
  obgyn_02_unique_bodies INT;
  obgyn_03_unique_bodies INT;
  baseline_sv INT;
  verified INT;
BEGIN
  -- Verify structure preserved
  SELECT COUNT(*) INTO obgyn_lessons
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%';
  
  IF obgyn_lessons != 3 THEN
    RAISE EXCEPTION 'Expected 3 OBGYN lessons, found %', obgyn_lessons;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_sv
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%' AND l.status = 'SOURCE_VALIDATED';
  
  IF obgyn_sv != 3 THEN
    RAISE EXCEPTION 'Expected 3 OBGYN SOURCE_VALIDATED, found %', obgyn_sv;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_sections
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%';
  
  IF obgyn_sections != 143 THEN
    RAISE EXCEPTION 'Expected 143 OBGYN sections preserved, found %', obgyn_sections;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_sources
  FROM sources s
  WHERE EXISTS (
    SELECT 1 FROM lesson_sources lsrc
    JOIN lessons l ON l.id = lsrc.lesson_id
    JOIN topics t ON t.id = l.topic_id
    WHERE t.code LIKE 'OBGYN%' AND s.id = lsrc.source_id
  );
  
  IF obgyn_sources != 29 THEN
    RAISE EXCEPTION 'Expected 29 OBGYN sources preserved, found %', obgyn_sources;
  END IF;
  
  SELECT COUNT(*) INTO obgyn_lesson_sources
  FROM lesson_sources lsrc
  JOIN lessons l ON l.id = lsrc.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%';
  
  IF obgyn_lesson_sources != 39 THEN
    RAISE EXCEPTION 'Expected 39 OBGYN lesson_sources preserved, found %', obgyn_lesson_sources;
  END IF;
  
  -- Verify segmentation achieved
  SELECT COUNT(*) INTO obgyn_empty_bodies
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'OBGYN%'
    AND (ls.body IS NULL OR btrim(ls.body) = '');
  
  IF obgyn_empty_bodies != 0 THEN
    RAISE EXCEPTION 'Found % empty OBGYN section bodies after correction', obgyn_empty_bodies;
  END IF;
  
  -- Verify bodies are now unique (segmented)
  SELECT COUNT(DISTINCT ls.body) INTO obgyn_01_unique_bodies
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code = 'OBGYN-01';
  
  IF obgyn_01_unique_bodies < 30 THEN
    RAISE EXCEPTION 'OBGYN-01 still has too few unique bodies (% < 30), segmentation may have failed', obgyn_01_unique_bodies;
  END IF;
  
  SELECT COUNT(DISTINCT ls.body) INTO obgyn_02_unique_bodies
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code = 'OBGYN-02';
  
  IF obgyn_02_unique_bodies < 40 THEN
    RAISE EXCEPTION 'OBGYN-02 still has too few unique bodies (% < 40), segmentation may have failed', obgyn_02_unique_bodies;
  END IF;
  
  SELECT COUNT(DISTINCT ls.body) INTO obgyn_03_unique_bodies
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code = 'OBGYN-03';
  
  IF obgyn_03_unique_bodies < 40 THEN
    RAISE EXCEPTION 'OBGYN-03 still has too few unique bodies (% < 40), segmentation may have failed', obgyn_03_unique_bodies;
  END IF;
  
  -- Verify baseline preserved
  SELECT COUNT(*) INTO baseline_sv
  FROM lessons WHERE status = 'SOURCE_VALIDATED';
  
  IF baseline_sv != 61 THEN
    RAISE EXCEPTION 'Expected 61 SOURCE_VALIDATED baseline, found %', baseline_sv;
  END IF;
  
  SELECT COUNT(*) INTO verified
  FROM lessons WHERE status = 'VERIFIED';
  
  IF verified != 0 THEN
    RAISE EXCEPTION 'Expected 0 VERIFIED, found %', verified;
  END IF;
  
  RAISE NOTICE 'Postconditions PASS';
  RAISE NOTICE 'OBGYN-01: % unique bodies (was 1)', obgyn_01_unique_bodies;
  RAISE NOTICE 'OBGYN-02: % unique bodies (was 1)', obgyn_02_unique_bodies;
  RAISE NOTICE 'OBGYN-03: % unique bodies (was 1)', obgyn_03_unique_bodies;
  RAISE NOTICE 'OBGYN sections properly segmented';
END $$;

COMMIT;

-- ================================================================
-- OBGYN correction complete
-- ================================================================
