-- ================================================================
-- Integrate Pediatrics Lessons as REVIEW
-- 
-- Integrating 6 Pediatrics lessons (PEDS-01 through PEDS-06) from
-- authoritative MD and SPEC files.
-- 
-- Content: 6 lessons, 461 sections, 75 distinct sources
-- Status: REVIEW (will be promoted after documentary validation)
-- 
-- Source normalization: 101 raw references -> 75 distinct sources
-- ================================================================

BEGIN;

-- ================================================================
-- PRECONDITIONS
-- ================================================================

DO $$
DECLARE
  pediatrics_area_exists INT;
  pediatrics_topics_count INT;
  pediatrics_lessons_count INT;
  baseline_sv INT;
  verified_count INT;
BEGIN
  -- Verify PEDIATRICS area exists
  SELECT COUNT(*) INTO pediatrics_area_exists
  FROM areas WHERE code = 'PEDIATRICS';
  
  IF pediatrics_area_exists != 1 THEN
    RAISE EXCEPTION 'PEDIATRICS area not found';
  END IF;
  
  -- Verify no existing PEDS topics
  SELECT COUNT(*) INTO pediatrics_topics_count
  FROM topics WHERE code LIKE 'PEDS-%';
  
  IF pediatrics_topics_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 PEDS topics, found %', pediatrics_topics_count;
  END IF;
  
  -- Verify no existing PEDS lessons
  SELECT COUNT(*) INTO pediatrics_lessons_count
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%';
  
  IF pediatrics_lessons_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 PEDS lessons, found %', pediatrics_lessons_count;
  END IF;
  
  -- Verify baseline preserved
  SELECT COUNT(*) INTO baseline_sv
  FROM lessons WHERE status = 'SOURCE_VALIDATED';
  
  IF baseline_sv != 55 THEN
    RAISE EXCEPTION 'Expected 55 SOURCE_VALIDATED baseline, found %', baseline_sv;
  END IF;
  
  SELECT COUNT(*) INTO verified_count
  FROM lessons WHERE status = 'VERIFIED';
  
  IF verified_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 VERIFIED, found %', verified_count;
  END IF;
  
  RAISE NOTICE 'Preconditions PASS';
END $$;

-- ================================================================
-- INSERT TOPICS
-- ================================================================

INSERT INTO topics (area_id, code, title, description, sort_order)
VALUES (
  (SELECT id FROM areas WHERE code = 'PEDIATRICS'),
  'PEDS-01',
  $TITLE$Crecimiento, desarrollo y promoción de la salud infantil$TITLE$,
  $SUMMARY$Fundamentos de crecimiento, desarrollo y maduración; valoración antropométrica y curvas OMS; etapas y áreas del desarrollo; vigilancia de hitos y signos de alarma; promoción de nutrición, lactancia, juego, vínculo y estilos de vida saludables; atención integral del adolescente y rol de enfermería, con contexto Panamá 2026.$SUMMARY$,
  1
);

INSERT INTO topics (area_id, code, title, description, sort_order)
VALUES (
  (SELECT id FROM areas WHERE code = 'PEDIATRICS'),
  'PEDS-02',
  $TITLE$Atención de enfermería al recién nacido sano y con alteraciones de salud$TITLE$,
  $SUMMARY$Atención integral y valoración del recién nacido; examen físico y neurológico; somatometría y signos vitales; lactancia, vínculo, vacunación y tamizajes; prematuridad y bajo peso; malformaciones y cardiopatías; dificultad respiratoria; enfermedad hemolítica, ictericia, VIH perinatal y otras urgencias neonatales, con normativa Panamá 2024-2026.$SUMMARY$,
  2
);

INSERT INTO topics (area_id, code, title, description, sort_order)
VALUES (
  (SELECT id FROM areas WHERE code = 'PEDIATRICS'),
  'PEDS-03',
  $TITLE$Valoración integral y cuidados de enfermería al niño y adolescente$TITLE$,
  $SUMMARY$Valoración integral pediátrica y del adolescente; examen físico y funcional, signos vitales, antropometría y curvas de crecimiento, alimentación y nutrición, escalas pediátricas, identificación de prioridades, seguridad y participación familiar, con normativa panameña 2024 y referencias OMS/AHA actualizadas.$SUMMARY$,
  3
);

INSERT INTO topics (area_id, code, title, description, sort_order)
VALUES (
  (SELECT id FROM areas WHERE code = 'PEDIATRICS'),
  'PEDS-04',
  $TITLE$Cuidados de enfermería en las principales alteraciones de salud pediátricas$TITLE$,
  $SUMMARY$Cuidados de enfermería ante alteraciones gastrointestinales, hidroelectrolíticas, infecciosas, respiratorias, endocrinas, renales, neurológicas, cardiovasculares, oncológicas, quirúrgicas y urgencias pediátricas, con enfoque ABCDE, seguridad y fuentes 2024–2026.$SUMMARY$,
  4
);

INSERT INTO topics (area_id, code, title, description, sort_order)
VALUES (
  (SELECT id FROM areas WHERE code = 'PEDIATRICS'),
  'PEDS-05',
  $TITLE$Cuidados especializados de enfermería pediátrica$TITLE$,
  $SUMMARY$Atención pediátrica preoperatoria y postoperatoria, cuidados paliativos y acompañamiento familiar, seguridad quirúrgica, manejo del dolor, prevención de eventos adversos, medicamentos, infecciones, dispositivos, deterioro y calidad.$SUMMARY$,
  5
);

INSERT INTO topics (area_id, code, title, description, sort_order)
VALUES (
  (SELECT id FROM areas WHERE code = 'PEDIATRICS'),
  'PEDS-06',
  $TITLE$Metrología, administración farmacológica y Proceso de Atención de Enfermería$TITLE$,
  $SUMMARY$Sistemas de medidas, conversiones, cálculo de dosis por peso, dosis diaria vs dosis por administración, preparación y volumen, infusiones, seguridad farmacológica pediátrica, superficie corporal, prevención de errores y aplicación completa del Proceso de Atención de Enfermería con participación familiar.$SUMMARY$,
  6
);

-- ================================================================
-- INSERT LESSONS
-- ================================================================

INSERT INTO lessons (topic_id, title, summary, status, reviewed_at, reviewed_by)
SELECT 
  t.id,
  $TITLE$Crecimiento, desarrollo y promoción de la salud infantil$TITLE$,
  $SUMMARY$Fundamentos de crecimiento, desarrollo y maduración; valoración antropométrica y curvas OMS; etapas y áreas del desarrollo; vigilancia de hitos y signos de alarma; promoción de nutrición, lactancia, juego, vínculo y estilos de vida saludables; atención integral del adolescente y rol de enfermería, con contexto Panamá 2026.$SUMMARY$,
  'REVIEW',
  NULL,
  NULL
FROM topics t
WHERE t.code = 'PEDS-01';

INSERT INTO lessons (topic_id, title, summary, status, reviewed_at, reviewed_by)
SELECT 
  t.id,
  $TITLE$Atención de enfermería al recién nacido sano y con alteraciones de salud$TITLE$,
  $SUMMARY$Atención integral y valoración del recién nacido; examen físico y neurológico; somatometría y signos vitales; lactancia, vínculo, vacunación y tamizajes; prematuridad y bajo peso; malformaciones y cardiopatías; dificultad respiratoria; enfermedad hemolítica, ictericia, VIH perinatal y otras urgencias neonatales, con normativa Panamá 2024-2026.$SUMMARY$,
  'REVIEW',
  NULL,
  NULL
FROM topics t
WHERE t.code = 'PEDS-02';

INSERT INTO lessons (topic_id, title, summary, status, reviewed_at, reviewed_by)
SELECT 
  t.id,
  $TITLE$Valoración integral y cuidados de enfermería al niño y adolescente$TITLE$,
  $SUMMARY$Valoración integral pediátrica y del adolescente; examen físico y funcional, signos vitales, antropometría y curvas de crecimiento, alimentación y nutrición, escalas pediátricas, identificación de prioridades, seguridad y participación familiar, con normativa panameña 2024 y referencias OMS/AHA actualizadas.$SUMMARY$,
  'REVIEW',
  NULL,
  NULL
FROM topics t
WHERE t.code = 'PEDS-03';

INSERT INTO lessons (topic_id, title, summary, status, reviewed_at, reviewed_by)
SELECT 
  t.id,
  $TITLE$Cuidados de enfermería en las principales alteraciones de salud pediátricas$TITLE$,
  $SUMMARY$Cuidados de enfermería ante alteraciones gastrointestinales, hidroelectrolíticas, infecciosas, respiratorias, endocrinas, renales, neurológicas, cardiovasculares, oncológicas, quirúrgicas y urgencias pediátricas, con enfoque ABCDE, seguridad y fuentes 2024–2026.$SUMMARY$,
  'REVIEW',
  NULL,
  NULL
FROM topics t
WHERE t.code = 'PEDS-04';

INSERT INTO lessons (topic_id, title, summary, status, reviewed_at, reviewed_by)
SELECT 
  t.id,
  $TITLE$Cuidados especializados de enfermería pediátrica$TITLE$,
  $SUMMARY$Atención pediátrica preoperatoria y postoperatoria, cuidados paliativos y acompañamiento familiar, seguridad quirúrgica, manejo del dolor, prevención de eventos adversos, medicamentos, infecciones, dispositivos, deterioro y calidad.$SUMMARY$,
  'REVIEW',
  NULL,
  NULL
FROM topics t
WHERE t.code = 'PEDS-05';

INSERT INTO lessons (topic_id, title, summary, status, reviewed_at, reviewed_by)
SELECT 
  t.id,
  $TITLE$Metrología, administración farmacológica y Proceso de Atención de Enfermería$TITLE$,
  $SUMMARY$Sistemas de medidas, conversiones, cálculo de dosis por peso, dosis diaria vs dosis por administración, preparación y volumen, infusiones, seguridad farmacológica pediátrica, superficie corporal, prevención de errores y aplicación completa del Proceso de Atención de Enfermería con participación familiar.$SUMMARY$,
  'REVIEW',
  NULL,
  NULL
FROM topics t
WHERE t.code = 'PEDS-06';

-- ================================================================
-- INSERT SOURCES
-- ================================================================

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Lineamientos para el Examen por Competencia de Profesionales de Enfermería',
  'Lineamientos para el Examen por Competencia de Profesionales de Enfermería',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería'
); -- source 1/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Wong. Enfermería Pediátrica',
  'Wong. Enfermería Pediátrica',
  'Marilyn J. Hockenberry; Cheryl C. Rodgers; David Wilson',
  NULL,
  'Elsevier',
  NULL,
  '10',
  'https://shop.elsevier.com/books/wong-enfermeria-pediatrica/hockenberry/978-84-9113-512-8',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Wong. Enfermería Pediátrica'
); -- source 2/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'El Niño Sano',
  'El Niño Sano',
  'Álvaro Posada Díaz; Juan F. Gómez Ramírez; Humberto Ramírez Gómez',
  NULL,
  'Editorial Médica Panamericana',
  NULL,
  NULL,
  NULL,
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'El Niño Sano'
); -- source 3/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Sección de Salud Integral de Niñez y Adolescencia',
  'Sección de Salud Integral de Niñez y Adolescencia',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.minsa.gob.pa/programa/seccion-de-salud-integral-de-ninez-y-adolescencia',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Sección de Salud Integral de Niñez y Adolescencia'
); -- source 4/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'PANAMA_OFFICIAL',
  'Minsa lanza la implementación del AIEPI Comunitario con apoyo de UNICEF para fortalecer la salud infantil',
  'Minsa lanza la implementación del AIEPI Comunitario con apoyo de UNICEF para fortalecer la salud infantil',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://minsa.gob.pa/noticia/minsa-lanza-la-implementacion-del-aiepi-comunitario-con-apoyo-de-unicef-para-fortalecer-la',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Minsa lanza la implementación del AIEPI Comunitario con apoyo de UNICEF para fortalecer la salud infantil'
); -- source 5/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'PANAMA_OFFICIAL',
  'Minsa Panamá Este fortalece la atención integral de los adolescentes',
  'Minsa Panamá Este fortalece la atención integral de los adolescentes',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://minsa.gob.pa/noticia/minsa-panama-este-fortalece-la-atencion-integral-de-los-adolescentes',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Minsa Panamá Este fortalece la atención integral de los adolescentes'
); -- source 6/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'WHO Child Growth Standards',
  'WHO Child Growth Standards',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/tools/child-growth-standards',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'WHO Child Growth Standards'
); -- source 7/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Child growth standards: questions and answers',
  'Child growth standards: questions and answers',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/news-room/questions-and-answers/item/child-growth-standards',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Child growth standards: questions and answers'
); -- source 8/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'BMI-for-age (5-19 years)',
  'BMI-for-age (5-19 years)',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/tools/growth-reference-data-for-5to19-years/indicators/bmi-for-age',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'BMI-for-age (5-19 years)'
); -- source 9/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Improving early childhood development: WHO guideline',
  'Improving early childhood development: WHO guideline',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/97892400020986',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Improving early childhood development: WHO guideline'
); -- source 10/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Nurturing care for children with developmental delays and disabilities: thematic brief',
  'Nurturing care for children with developmental delays and disabilities: thematic brief',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/B09617',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Nurturing care for children with developmental delays and disabilities: thematic brief'
); -- source 11/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Alimentación del lactante y del niño pequeño',
  'Alimentación del lactante y del niño pequeño',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/es/news-room/fact-sheets/detail/infant-and-young-child-feeding',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Alimentación del lactante y del niño pequeño'
); -- source 12/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'WHO Guideline for complementary feeding of infants and young children 6-23 months of age',
  'WHO Guideline for complementary feeding of infants and young children 6-23 months of age',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/9789240081864',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'WHO Guideline for complementary feeding of infants and young children 6-23 months of age'
); -- source 13/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Salud del adolescente',
  'Salud del adolescente',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/es/health-topics/adolescent-health',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Salud del adolescente'
); -- source 14/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Actividad física',
  'Actividad física',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/es/news-room/fact-sheets/detail/physical-activity',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Actividad física'
); -- source 15/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'CDC Developmental Milestones / Learn the Signs. Act Early.',
  'CDC Developmental Milestones / Learn the Signs. Act Early.',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.cdc.gov/act-early/milestones/index.html',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'CDC Developmental Milestones / Learn the Signs. Act Early.'
); -- source 16/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Manual de Normas y Procedimientos. Programa Ampliado de Inmunizaciones',
  'Manual de Normas y Procedimientos. Programa Ampliado de Inmunizaciones',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Manual de Normas y Procedimientos. Programa Ampliado de Inmunizaciones'
); -- source 17/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Resolución N.° 306 de 5 de junio de 2024 — Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años',
  'Resolución N.° 306 de 5 de junio de 2024 — Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.minsa.gob.pa/normatividad/resolucion-ndeg-306-de-miercoles-05-de-junio-de-2024-que-aprueba-las-normas-tecnicas-y',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Resolución N.° 306 de 5 de junio de 2024 — Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años'
); -- source 18/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Esquema Nacional de Vacunación 2026',
  'Esquema Nacional de Vacunación 2026',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://minsa.gob.pa/sites/default/files/programas/esquema_nacional_de_vacunacion_2026_1.pdf',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Esquema Nacional de Vacunación 2026'
); -- source 19/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Programa Nacional de Tamizaje Neonatal',
  'Programa Nacional de Tamizaje Neonatal',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.minsa.gob.pa/node/5863',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Programa Nacional de Tamizaje Neonatal'
); -- source 20/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'PANAMA_OFFICIAL',
  'Panamá fortalece la promoción de la lactancia materna para garantizar un mejor inicio de vida a la niñez',
  'Panamá fortalece la promoción de la lactancia materna para garantizar un mejor inicio de vida a la niñez',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://minsa.gob.pa/noticia/panama-fortalece-la-promocion-de-la-lactancia-materna-para-garantizar-un-mejor-inicio-de',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Panamá fortalece la promoción de la lactancia materna para garantizar un mejor inicio de vida a la niñez'
); -- source 21/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'PANAMA_OFFICIAL',
  'Minsa inicia aplicación de anticuerpo monoclonal para fortalecer la protección de recién nacidos frente al VRS',
  'Minsa inicia aplicación de anticuerpo monoclonal para fortalecer la protección de recién nacidos frente al VRS',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://minsa.gob.pa/noticia/minsa-inicia-aplicacion-de-anticuerpo-monoclonal-para-fortalecer-la-proteccion-de-recien',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Minsa inicia aplicación de anticuerpo monoclonal para fortalecer la protección de recién nacidos frente al VRS'
); -- source 22/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Decreto Ejecutivo N.° 24 de 13 de octubre de 2025',
  'Decreto Ejecutivo N.° 24 de 13 de octubre de 2025',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.minsa.gob.pa/normatividad/decreto-ejecutivo-ndeg-24-de-lunes-13-de-octubre-de-2025-que-reglamenta-la-ley-40-de-14',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Decreto Ejecutivo N.° 24 de 13 de octubre de 2025'
); -- source 23/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Essential Newborn Care Course, second edition',
  'Essential Newborn Care Course, second edition',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/9789240112698',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Essential Newborn Care Course, second edition'
); -- source 24/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Essential newborn care',
  'Essential newborn care',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/teams/maternal-newborn-child-adolescent-health-and-ageing/newborn-health/essential-newborn-care',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Essential newborn care'
); -- source 25/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'WHO recommendations for care of the preterm or low-birth-weight infant',
  'WHO recommendations for care of the preterm or low-birth-weight infant',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/9789240058262',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'WHO recommendations for care of the preterm or low-birth-weight infant'
); -- source 26/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Kangaroo mother care: a clinical practice guide',
  'Kangaroo mother care: a clinical practice guide',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/m/item/kangaroo-mother-care--a-clinical-practice-guide',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Kangaroo mother care: a clinical practice guide'
); -- source 27/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'WHO updated recommendations on HIV clinical management',
  'WHO updated recommendations on HIV clinical management',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/9789240119468',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'WHO updated recommendations on HIV clinical management'
); -- source 28/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Clinical Screening and Diagnosis for Critical Congenital Heart Defects',
  'Clinical Screening and Diagnosis for Critical Congenital Heart Defects',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.cdc.gov/heart-defects/hcp/screening/index.html',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Clinical Screening and Diagnosis for Critical Congenital Heart Defects'
); -- source 29/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'The Apgar Score',
  'The Apgar Score',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.acog.org/clinical/clinical-guidance/committee-opinion/articles/2015/10/the-apgar-score',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'The Apgar Score'
); -- source 30/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Enfermedad hemolítica del recién nacido',
  'Enfermedad hemolítica del recién nacido',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://medlineplus.gov/spanish/ency/article/001298.htm',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Enfermedad hemolítica del recién nacido'
); -- source 31/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'WHO announces the development of updated guidelines on newborn resuscitation at birth',
  'WHO announces the development of updated guidelines on newborn resuscitation at birth',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/news-room/articles-detail/who-announces-the-development-of-updated-guidelines-on-newborn-resuscitation-at-birth',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'WHO announces the development of updated guidelines on newborn resuscitation at birth'
); -- source 32/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Resolución N.° 371 de 27 de junio de 2024 — Normas Técnicas y Administrativas del Programa Nacional de Salud Integral de Adolescentes',
  'Resolución N.° 371 de 27 de junio de 2024 — Normas Técnicas y Administrativas del Programa Nacional de Salud Integral de Adolescentes',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.minsa.gob.pa/normatividad/resolucion-ndeg-371-de-jueves-27-de-junio-de-2024-que-aprueba-las-normas-tecnicas-y',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Resolución N.° 371 de 27 de junio de 2024 — Normas Técnicas y Administrativas del Programa Nacional de Salud Integral de Adolescentes'
); -- source 33/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Child growth standards',
  'Child growth standards',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/news-room/questions-and-answers/item/child-growth-standards',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Child growth standards'
); -- source 34/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Growth reference data for 5–19 years',
  'Growth reference data for 5–19 years',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/tools/growth-reference-data-for-5to19-years',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Growth reference data for 5–19 years'
); -- source 35/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'BMI-for-age (5–19 years)',
  'BMI-for-age (5–19 years)',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/tools/growth-reference-data-for-5to19-years/indicators/bmi-for-age',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'BMI-for-age (5–19 years)'
); -- source 36/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Weight-for-age (5–10 years)',
  'Weight-for-age (5–10 years)',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/tools/growth-reference-data-for-5to19-years/indicators/weight-for-age-5to10-years',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Weight-for-age (5–10 years)'
); -- source 37/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Alimentación saludable',
  'Alimentación saludable',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/es/news-room/fact-sheets/detail/healthy-diet',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Alimentación saludable'
); -- source 38/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Global standards for quality health care services for adolescents',
  'Global standards for quality health care services for adolescents',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/9789240114012',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Global standards for quality health care services for adolescents'
); -- source 39/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Competency and outcomes framework for adolescent health and well-being',
  'Competency and outcomes framework for adolescent health and well-being',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/9789240115736',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Competency and outcomes framework for adolescent health and well-being'
); -- source 40/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Exploratory meeting to review new evidence for IMCI danger signs',
  'Exploratory meeting to review new evidence for IMCI danger signs',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/WHO-MCA-19.02',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Exploratory meeting to review new evidence for IMCI danger signs'
); -- source 41/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Pediatric Advanced Life Support Instructor Manual',
  'Pediatric Advanced Life Support Instructor Manual',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.heart.org/-/media/BEE8DC56E16B42B8A71CACEF03B052E1.pdf',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Pediatric Advanced Life Support Instructor Manual'
); -- source 42/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'BMI-for-Age as a Screening Measure',
  'BMI-for-Age as a Screening Measure',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.cdc.gov/growth-chart-training/hcp/using-bmi/screening-measure.html',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'BMI-for-Age as a Screening Measure'
); -- source 43/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Diarrhoeal disease',
  'Diarrhoeal disease',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/news-room/fact-sheets/detail/diarrhoeal-disease',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Diarrhoeal disease'
); -- source 44/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Guideline on management of pneumonia and diarrhoea in children up to 10 years of age',
  'Guideline on management of pneumonia and diarrhoea in children up to 10 years of age',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/health-topics/pneumonia',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Guideline on management of pneumonia and diarrhoea in children up to 10 years of age'
); -- source 45/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Pneumonia in children',
  'Pneumonia in children',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/news-room/fact-sheets/detail/pneumonia',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Pneumonia in children'
); -- source 46/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'WHO consolidated guidelines for the management of common childhood illness: management of asthma in children and adolescents and bronchiolitis in infants and young children',
  'WHO consolidated guidelines for the management of common childhood illness: management of asthma in children and adolescents and bronchiolitis in infants and young children',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/9789240122680',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'WHO consolidated guidelines for the management of common childhood illness: management of asthma in children and adolescents and bronchiolitis in infants and young children'
); -- source 47/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Asthma',
  'Asthma',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/news-room/fact-sheets/detail/asthma',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Asthma'
); -- source 48/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'WHO guidelines for clinical management of arboviral diseases',
  'WHO guidelines for clinical management of arboviral diseases',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/9789240111110',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'WHO guidelines for clinical management of arboviral diseases'
); -- source 49/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'WHO guidelines on meningitis diagnosis, treatment and care',
  'WHO guidelines on meningitis diagnosis, treatment and care',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/9789240108042',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'WHO guidelines on meningitis diagnosis, treatment and care'
); -- source 50/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Guidelines on the Clinical Management of Sepsis',
  'Guidelines on the Clinical Management of Sepsis',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/news/item/30-01-2024-guidelines-on-the-clinical-management-of-sepsis',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Guidelines on the Clinical Management of Sepsis'
); -- source 51/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'WHO recommendations for management of serious bacterial infections in infants aged 0–59 days',
  'WHO recommendations for management of serious bacterial infections in infants aged 0–59 days',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/9789240102903/',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'WHO recommendations for management of serious bacterial infections in infants aged 0–59 days'
); -- source 52/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Epilepsy',
  'Epilepsy',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/news-room/fact-sheets/detail/epilepsy',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Epilepsy'
); -- source 53/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'ISPAD Clinical Practice Consensus Guidelines 2024',
  'ISPAD Clinical Practice Consensus Guidelines 2024',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.ispad.org/resources/ispad-clinical-practice-consensus-guidelines/2024-cpcg.html',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'ISPAD Clinical Practice Consensus Guidelines 2024'
); -- source 54/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'KDIGO 2024 Clinical Practice Guideline for the Evaluation and Management of Chronic Kidney Disease',
  'KDIGO 2024 Clinical Practice Guideline for the Evaluation and Management of Chronic Kidney Disease',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://kdigo.org/guidelines/ckd-evaluation-and-management/',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'KDIGO 2024 Clinical Practice Guideline for the Evaluation and Management of Chronic Kidney Disease'
); -- source 55/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Acute Kidney Injury and Acute Kidney Disease guideline update',
  'Acute Kidney Injury and Acute Kidney Disease guideline update',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://kdigo.org/guidelines/acute-kidney-injury/',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Acute Kidney Injury and Acute Kidney Disease guideline update'
); -- source 56/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Childhood cancer',
  'Childhood cancer',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/news-room/fact-sheets/detail/cancer-in-children',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Childhood cancer'
); -- source 57/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Congenital disorders',
  'Congenital disorders',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/news-room/fact-sheets/detail/birth-defects',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Congenital disorders'
); -- source 58/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'World Patient Safety Day 2025',
  'World Patient Safety Day 2025',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/campaigns/world-patient-safety-day/2025',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'World Patient Safety Day 2025'
); -- source 59/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'World Patient Safety Day 2025 — Safe care for every newborn and every child',
  'World Patient Safety Day 2025 — Safe care for every newborn and every child',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/campaigns/world-patient-safety-day/2025',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'World Patient Safety Day 2025 — Safe care for every newborn and every child'
); -- source 60/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'World Patient Safety Day Goals 2025',
  'World Patient Safety Day Goals 2025',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/b/80934',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'World Patient Safety Day Goals 2025'
); -- source 61/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Clinical checklists — Surgical Safety Checklist',
  'Clinical checklists — Surgical Safety Checklist',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/tools/clinical-checklists',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Clinical checklists — Surgical Safety Checklist'
); -- source 62/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Safer surgery — tools and resources',
  'Safer surgery — tools and resources',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/teams/integrated-health-services/quality-of-care-and-patient-safety/patient-safety-guidance-and-tools/safe-surgery/tool-and-resources',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Safer surgery — tools and resources'
); -- source 63/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Palliative care for children',
  'Palliative care for children',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/europe/news-room/fact-sheets/item/palliative-care-for-children',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Palliative care for children'
); -- source 64/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Guidelines on the management of chronic pain in children',
  'Guidelines on the management of chronic pain in children',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/9789240017870',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Guidelines on the management of chronic pain in children'
); -- source 65/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Guidelines on the management of chronic pain in children: executive summary',
  'Guidelines on the management of chronic pain in children: executive summary',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/9789240021556',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Guidelines on the management of chronic pain in children: executive summary'
); -- source 66/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Patient safety guidance and tools',
  'Patient safety guidance and tools',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/teams/integrated-health-services/quality-of-care-and-patient-safety',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Patient safety guidance and tools'
); -- source 67/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Medication Without Harm',
  'Medication Without Harm',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/initiatives/medication-without-harm',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Medication Without Harm'
); -- source 68/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Medication without harm: Policy brief',
  'Medication without harm: Policy brief',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.who.int/publications/i/item/9789240062764/',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Medication without harm: Policy brief'
); -- source 69/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Sentinel Event Alert 39: Preventing pediatric medication errors',
  'Sentinel Event Alert 39: Preventing pediatric medication errors',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.jointcommission.org/-/media/tjc/documents/resources/patient-safety-topics/sentinel-event/sea_39.pdf',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Sentinel Event Alert 39: Preventing pediatric medication errors'
); -- source 70/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Error-Prone Abbreviations, Symbols, and Dose Designations',
  'Error-Prone Abbreviations, Symbols, and Dose Designations',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.ismp.org/system/files/resources/2021-02/Error%20Prone%20Abbreviations%202021_0.pdf',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Error-Prone Abbreviations, Symbols, and Dose Designations'
); -- source 71/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Measurement mishaps with liquid medicines',
  'Measurement mishaps with liquid medicines',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.ismp.org/sites/default/files/attachments/2018-04/ismp201609.pdf',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Measurement mishaps with liquid medicines'
); -- source 72/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Medication Administration Errors',
  'Medication Administration Errors',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://psnet.ahrq.gov/primer/medication-administration-errors',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Medication Administration Errors'
); -- source 73/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'The effect of documenting patient weight in kilograms on pediatric medication dosing errors',
  'The effect of documenting patient weight in kilograms on pediatric medication dosing errors',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://psnet.ahrq.gov/issue/effect-documenting-patient-weight-kilograms-pediatric-medication-dosing-errors-emergency',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'The effect of documenting patient weight in kilograms on pediatric medication dosing errors'
); -- source 74/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Nursing Fundamentals — Nursing Process',
  'Nursing Fundamentals — Nursing Process',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.ncbi.nlm.nih.gov/books/NBK610818/',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Nursing Fundamentals — Nursing Process'
); -- source 75/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'NCSBN Clinical Judgment Model and the Nursing Process',
  'NCSBN Clinical Judgment Model and the Nursing Process',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://www.ncbi.nlm.nih.gov/books/NBK615357/table/ch2.tab1/',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'NCSBN Clinical Judgment Model and the Nursing Process'
); -- source 76/77 (skip if exists)

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 
  'COMPLEMENTARY',
  'Estimation of body surface area in various childhood ages — validation of the Mosteller formula',
  'Estimation of body surface area in various childhood ages — validation of the Mosteller formula',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  'https://pubmed.ncbi.nlm.nih.gov/22211780/',
  NULL,
  false
WHERE NOT EXISTS (
  SELECT 1 FROM sources WHERE citation_text = 'Estimation of body surface area in various childhood ages — validation of the Mosteller formula'
); -- source 77/77 (skip if exists)

-- ================================================================
-- INSERT LESSON_SECTIONS
-- ================================================================

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-1',
  $$Crecimiento, desarrollo y promoción de la salud infantil$$,
  $$**Área:** Enfermería Pediátrica  
**Código:** PEDS-01  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión documental:** 2026-09-11

---

# 1. Alcance oficial CICDE

El lineamiento CICDE 2026 incluye expresamente el tema **“Crecimiento, desarrollo y promoción de la salud infantil”** y exige estudiar:

1. Fundamentos, principios y factores que influyen en el crecimiento, desarrollo y maduración.
2. Valoración del crecimiento: peso, talla/longitud, perímetro cefálico, índice de masa corporal, curvas y patrones de crecimiento.
3. Desarrollo del niño según etapas: recién nacido, lactante, preescolar, escolar y adolescente.
4. Áreas del desarrollo: motora, cognitiva, lenguaje, social y emocional.
5. Vigilancia de hitos del desarrollo, factores de riesgo, signos de alarma y detección temprana de alteraciones.
6. Promoción del crecimiento y desarrollo saludable: nutrición, lactancia materna, estimulación oportuna, juego, vínculo afectivo y participación familiar.
7. Promoción y mantenimiento de la salud en la infancia y adolescencia.
8. Sexualidad, nutrición y estilos de vida saludables en la adolescencia.
9. Rol de enfermería en la valoración, seguimiento, educación anticipatoria y promoción de la salud.

Este paquete conserva íntegramente esos nueve puntos y los actualiza con fuentes oficiales de Panamá, OMS/UNICEF y herramientas contemporáneas de vigilancia del desarrollo.

---

# 2. Objetivos de aprendizaje

Al finalizar el tema, el estudiante debe poder:

1. Diferenciar crecimiento, desarrollo y maduración.
2. Reconocer factores biológicos, familiares, sociales y ambientales que modifican la trayectoria de crecimiento y desarrollo.
3. Obtener e interpretar de manera básica peso, longitud/talla, perímetro cefálico e IMC para la edad.
4. Seleccionar la referencia de crecimiento apropiada por edad.
5. Comprender que la **trayectoria** en la curva es más informativa que un dato aislado.
6. Identificar las principales áreas del desarrollo y ejemplos de hitos esperados.
7. Diferenciar vigilancia del desarrollo de tamizaje estandarizado y evaluación diagnóstica.
8. Reconocer pérdida de habilidades o ausencia de hitos como señales que requieren evaluación oportuna.
9. Aplicar promoción de la salud mediante nutrición, lactancia, alimentación complementaria, juego, vínculo, seguridad y participación familiar.
10. Reconocer necesidades específicas de la adolescencia, incluida salud sexual, nutrición, salud mental y conductas de riesgo.
11. Describir el rol de enfermería en control de crecimiento y desarrollo, educación anticipatoria y referencia.
12. Resolver situaciones tipo CICDE priorizando seguridad, observación, educación y seguimiento.

---

# 3. Crecimiento, desarrollo y maduración$$,
  1
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-2',
  $$Crecimiento$$,
  $$Es el cambio cuantitativo del organismo: aumento de peso, longitud/talla, perímetros y dimensiones corporales. Se valora mediante mediciones seriadas y su comparación con referencias apropiadas.$$,
  2
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-3',
  $$Desarrollo$$,
  $$Es la adquisición progresiva e integración de capacidades funcionales. Incluye movimiento, comunicación, cognición, interacción social, conducta adaptativa y autonomía.$$,
  3
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-4',
  $$Maduración$$,
  $$Es el proceso biológico por el cual órganos, sistemas y funciones alcanzan mayor organización y capacidad funcional. Tiene una base genética, pero su expresión puede ser modulada por nutrición, salud, experiencias y ambiente.$$,
  4
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-5',
  $$Clave CICDE$$,
  $$**Crecimiento ≠ desarrollo.** Un niño puede crecer en tamaño y presentar una dificultad del desarrollo; también puede tener talla baja con desarrollo funcional apropiado. Ambos deben valorarse.

---

# 4. Factores que influyen en crecimiento y desarrollo

El crecimiento y desarrollo resultan de la interacción entre múltiples factores:

- genética y antecedentes familiares;
- edad gestacional y condiciones perinatales;
- nutrición y alimentación;
- enfermedades agudas o crónicas;
- función endocrina y metabólica;
- sueño y actividad física;
- calidad del vínculo y cuidado sensible;
- estimulación y oportunidades de aprendizaje;
- salud mental del cuidador y del niño;
- ambiente seguro, agua, saneamiento y exposición a tóxicos;
- condiciones socioeconómicas, culturales y acceso a servicios;
- violencia, negligencia y otras experiencias adversas.

La presencia de un factor de riesgo no equivale por sí sola a diagnóstico, pero aumenta la necesidad de vigilancia y seguimiento.

---

# 5. Principio de trayectoria de crecimiento

Una medición aislada describe un momento. La **serie de mediciones** permite valorar la trayectoria.

En seguimiento pediátrico interesa observar:

- si el niño mantiene una trayectoria compatible con su patrón previo;
- si cruza líneas de referencia de manera sostenida;
- si existe desaceleración o aceleración inesperada;
- si las mediciones son coherentes entre sí y con el examen clínico.$$,
  5
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-6',
  $$Error frecuente$$,
  $$No diagnosticar desnutrición, obesidad o talla baja únicamente porque un niño esté “por debajo” o “por encima” de un percentil aislado. Se requiere indicador adecuado, edad, sexo, puntaje Z/percentil, tendencia, contexto y valoración clínica.

---

# 6. Valoración antropométrica — visión general

Las mediciones centrales para CICDE son:

| Medición | Utilidad principal |
|---|---|
| Peso | masa corporal y tendencia de ganancia/pérdida |
| Longitud/talla | crecimiento lineal |
| Perímetro cefálico | crecimiento craneal, especialmente en primeros años |
| IMC para la edad | relación peso-talla ajustada por edad y sexo |

La OMS dispone de estándares de 0–5 años y referencias de 5–19 años.

---

# 7. Peso

Principios de buena técnica:

- utilizar equipo calibrado y apropiado para la edad;
- retirar objetos o prendas pesadas cuando corresponda;
- asegurar estabilidad y seguridad del niño;
- registrar de inmediato y con unidad correcta;
- comparar con mediciones previas y con el indicador apropiado para edad y sexo.

Una variación inesperada debe llevar primero a confirmar la medición antes de asumir cambio clínico real.

---

# 8. Longitud y talla

La OMS diferencia:

- **longitud:** medición recumbente;
- **talla/estatura:** medición de pie.

Como regla técnica, en menores de 2 años se utiliza longitud recumbente y desde los 2 años, si el niño puede mantenerse de pie, talla. La posición, el plano corporal y la colocación de cabeza y pies afectan la precisión.$$,
  6
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-7',
  $$Clave$$,
  $$No intercambiar longitud y talla sin reconocer que son mediciones realizadas en posiciones diferentes.

---

# 9. Perímetro cefálico

Se mide rodeando el máximo perímetro occipitofrontal con cinta no extensible. La medición debe ser reproducible y compararse con curvas por edad y sexo.

Es especialmente útil cuando se sigue crecimiento craneal temprano o existe sospecha clínica neurológica.$$,
  7
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-8',
  $$Seguridad$$,
  $$Un valor aislado atípico debe confirmarse técnicamente y correlacionarse con antecedentes, desarrollo y examen físico.

---

# 10. Índice de masa corporal para la edad

El IMC se calcula:

**IMC = peso (kg) / talla² (m²)**

En pediatría no se interpreta como en adultos: debe relacionarse con **edad y sexo** mediante curvas o puntajes Z.

Para 5–19 años, la OMS interpreta IMC/edad con referencias específicas. Entre los puntos de corte internacionales de la OMS se encuentran:

- delgadez: < −2 DE;
- delgadez severa: < −3 DE;
- sobrepeso: > +1 DE;
- obesidad: > +2 DE.

La clasificación clínica final debe seguir las normas locales y el contexto individual.

---

# 11. Curvas y patrones de crecimiento

Una curva de crecimiento permite colocar mediciones de un niño respecto a una población/referencia por edad y sexo.

El estudiante debe distinguir:

- **percentil:** posición relativa;
- **puntaje Z:** distancia en desviaciones estándar respecto a la mediana;
- **trayectoria:** evolución del niño a través del tiempo.

El seguimiento correcto exige usar la misma referencia y técnica consistente.

---

# 12. Estándares OMS de 0 a 5 años

Los estándares OMS de 2006 describen el crecimiento desde el nacimiento hasta 5 años bajo condiciones favorables y son aplicables globalmente.

Incluyen, entre otros:

- longitud/talla para la edad;
- peso para la edad;
- peso para longitud/talla;
- IMC para la edad;
- perímetro cefálico para la edad;
- velocidad de peso y longitud;
- ventanas de adquisición de hitos motores gruesos.

---

# 13. Referencia OMS de 5 a 19 años

Para niños y adolescentes mayores de 5 años, la OMS recomienda su referencia 2007 de 5–19 años, que complementa los estándares de 0–5 años.$$,
  8
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-9',
  $$Clave de examen$$,
  $$**0–5 años:** estándares OMS de crecimiento infantil.  
**5–19 años:** referencia OMS 2007 para crecimiento de escolares y adolescentes.

---

# 14. Puntajes Z y lectura clínica básica

El puntaje Z expresa cuántas desviaciones estándar se aleja una medición de la mediana de la referencia.

Conceptualmente:

- Z cercano a 0: próximo a la mediana;
- valores negativos: por debajo de la mediana;
- valores positivos: por encima;
- valores muy alejados requieren verificación y valoración clínica.

No debe interpretarse el puntaje Z sin conocer **qué indicador** se está evaluando.

---

# 15. Errores frecuentes de medición

Pueden alterar la interpretación:

- báscula no calibrada;
- ropa o calzado innecesario;
- niño en movimiento;
- longitud/talla tomada en posición incorrecta;
- cinta de perímetro cefálico mal ubicada;
- edad calculada incorrectamente;
- usar curva del sexo equivocado;
- transcribir mal unidades;
- comparar con una referencia no apropiada;
- no verificar un valor inesperado.

En enfermería, **medir bien es una intervención de seguridad**.

---

# 16. Señales de alarma en crecimiento

Requieren valoración más detenida o referencia según contexto:

- pérdida de peso inexplicada;
- detención o desaceleración sostenida del crecimiento;
- cambio marcado de trayectoria;
- edema o signos clínicos de desnutrición;
- discrepancia importante entre peso y talla;
- perímetro cefálico con trayectoria anormal;
- síntomas sistémicos asociados;
- dificultad alimentaria persistente;
- preocupación significativa de cuidadores o personal de salud.

---

# 17. Desarrollo infantil — visión integral

El desarrollo es continuo, dinámico y dependiente de la interacción entre biología y ambiente. No todos los niños adquieren cada habilidad exactamente el mismo día.

Por eso se evalúa:

- secuencia de habilidades;
- calidad de las habilidades;
- progreso en el tiempo;
- funcionamiento en diferentes contextos;
- interacción con cuidadores;
- presencia de regresión o pérdida de capacidades.

---

# 18. Áreas del desarrollo

CICDE exige reconocer cinco áreas:

1. **Motora:** motricidad gruesa y fina.
2. **Cognitiva:** aprendizaje, memoria, solución de problemas y pensamiento.
3. **Lenguaje/comunicación:** comprensión, expresión y comunicación no verbal.
4. **Social:** interacción con otras personas y participación.
5. **Emocional:** regulación, vínculo, expresión de emociones y respuesta social.

En la práctica se superponen y se influyen mutuamente.

---

# 19. Etapas del niño y adolescente

Las edades exactas pueden variar entre textos, por lo que para CICDE importa reconocer las características generales:

- recién nacido;
- lactante;
- niño pequeño;
- preescolar;
- escolar;
- adolescente.

La OMS define adolescencia como el período de **10 a 19 años**.

---

# 20. Recién nacido — enfoque del desarrollo

La prioridad es adaptación a la vida extrauterina, alimentación, termorregulación, vínculo, sueño seguro, detección de anomalías y apoyo a la familia.

Los detalles de valoración neonatal y alteraciones del recién nacido se desarrollan en **PEDS-02**.

---

# 21. Lactante — enfoque del desarrollo

En el primer año ocurren cambios rápidos en:

- control cefálico y postura;
- movilidad;
- prensión y manipulación;
- interacción social;
- comunicación prelingüística y primeras palabras;
- alimentación y transición a dieta complementaria;
- vínculo con cuidadores.

La seguridad ambiental debe aumentar conforme aparece movilidad.

---

# 22. Niño pequeño — enfoque del desarrollo

Se caracteriza por mayor autonomía motora, exploración, lenguaje en expansión, juego simbólico inicial y necesidad de límites consistentes y seguros.

La enfermería promueve rutinas, nutrición, prevención de lesiones, estimulación y disciplina no violenta.

---

# 23. Preescolar — enfoque del desarrollo

Aumentan:

- imaginación y juego simbólico;
- lenguaje y conversación;
- interacción con pares;
- coordinación motora;
- autonomía en actividades diarias;
- comprensión progresiva de reglas simples.

El juego sigue siendo una herramienta central de aprendizaje.

---

# 24. Escolar — enfoque del desarrollo

Se fortalecen habilidades académicas, pensamiento lógico concreto, cooperación, identidad social, autocuidado y participación en actividades físicas.

La promoción incluye hábitos alimentarios, actividad física, sueño, salud bucal, prevención de violencia y acompañamiento del rendimiento escolar.

---

# 25. Adolescente — enfoque del desarrollo

La adolescencia comprende 10–19 años según OMS. Se caracteriza por cambios físicos, cognitivos, emocionales y sociales rápidos.

La atención debe considerar:

- pubertad e imagen corporal;
- autonomía progresiva;
- salud mental;
- nutrición y actividad física;
- sexualidad y salud reproductiva;
- consumo de sustancias;
- violencia y seguridad;
- proyecto de vida y entorno social.

---

# 26. Hitos del desarrollo: qué significan

Los hitos son habilidades que la mayoría de los niños alcanza alrededor de determinadas edades. Sirven para **vigilancia**, no para diagnosticar por sí solos.

Los materiales CDC 2026 consideran hitos en juego, aprendizaje, lenguaje, conducta y movimiento y recuerdan que sus listas **no sustituyen herramientas estandarizadas de tamizaje**.

---

# 27. Ejemplos orientadores a los 6 meses

Ejemplos de habilidades que la mayoría de bebés puede realizar alrededor de 6 meses:

- reconoce personas familiares;
- ríe;
- alterna sonidos con el cuidador;
- alcanza un juguete deseado;
- rueda de abdomen a espalda;
- se apoya con brazos extendidos en prono;
- usa las manos para apoyarse al sentarse.

No memorizar un solo hito como diagnóstico.

---

# 28. Ejemplos orientadores a los 12 meses

Alrededor de 1 año pueden observarse:

- juegos sociales simples con el cuidador;
- despedirse con la mano;
- usar un nombre especial para madre/padre;
- buscar un objeto escondido;
- colocar un objeto dentro de un recipiente;
- ponerse de pie apoyándose;
- desplazarse sujetándose de muebles;
- prensión fina con pulgar e índice.

---

# 29. Ejemplos orientadores a los 2 años

Alrededor de 2 años, ejemplos actuales incluyen:

- notar cuando otra persona está triste o lastimada;
- combinar al menos dos palabras;
- señalar partes del cuerpo cuando se le pide;
- usar más gestos;
- manipular mecanismos simples de juguetes;
- correr;
- patear una pelota;
- usar cuchara.

---

# 30. Ejemplos orientadores a los 3 años

Pueden observarse:

- incorporarse al juego de otros niños;
- conversación con al menos dos intercambios de ida y vuelta;
- hacer preguntas “quién/qué/dónde/por qué”;
- decir su nombre;
- habla comprensible la mayor parte del tiempo;
- dibujar un círculo cuando se le muestra;
- usar tenedor;
- colocarse algunas prendas simples.

---

# 31. Ejemplos orientadores a los 4 años

Entre los ejemplos actuales:

- juego de roles o imaginación;
- buscar jugar con otros niños;
- consolar a alguien triste o lastimado;
- hablar con oraciones de cuatro o más palabras;
- contar algo que ocurrió durante el día;
- nombrar algunos colores;
- dibujar una persona con varias partes;
- atrapar una pelota grande la mayoría de las veces.

---

# 32. Ejemplos orientadores a los 5 años

Pueden incluir:

- seguir reglas o turnarse en juegos;
- contar una historia con al menos dos eventos;
- mantener conversación con varios intercambios;
- contar hasta 10;
- reconocer algunos números y letras;
- atender 5–10 minutos a una actividad no basada en pantalla;
- abotonar algunos botones;
- saltar en un pie.

---

# 33. Vigilancia del desarrollo vs tamizaje$$,
  9
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-10',
  $$Vigilancia$$,
  $$Proceso continuo en cada contacto: preguntar preocupaciones, observar al niño, revisar hitos, antecedentes y entorno.$$,
  10
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-11',
  $$Tamizaje$$,
  $$Uso de un instrumento estandarizado y validado para identificar riesgo de alteración del desarrollo.$$,
  11
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-12',
  $$Evaluación diagnóstica$$,
  $$Valoración más profunda por profesionales capacitados cuando existe sospecha.$$,
  12
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-13',
  $$Clave CICDE$$,
  $$**Lista de hitos ≠ prueba diagnóstica.**

---

# 34. Signos de alarma del desarrollo

Especial atención a:

- **pérdida de habilidades previamente adquiridas**;
- ausencia persistente de habilidades esperadas para la edad;
- asimetría motora marcada;
- alteraciones importantes de tono o movilidad;
- falta de respuesta social/comunicativa esperada;
- dificultad alimentaria que compromete crecimiento o seguridad;
- preocupaciones repetidas de la familia;
- exposición a factores de alto riesgo biológico o psicosocial.

La respuesta correcta no es “esperar indefinidamente”: se documenta, se comunica y se facilita evaluación oportuna.

---

# 35. Prematuridad y edad corregida

La prematuridad puede modificar la interpretación de hitos y crecimiento temprano. En niños nacidos prematuros, la edad corregida puede utilizarse durante la vigilancia según edad, herramienta y protocolo.

Los recursos CDC señalan que, al usar sus listas de hitos, si el niño nació más de 3 semanas antes de término debe considerarse la edad corregida.

---

# 36. Cuidado centrado en el niño y la familia

Principios:

- respetar al niño como persona y sujeto de derechos;
- reconocer a la familia como fuente esencial de información y apoyo;
- adaptar comunicación a edad y desarrollo;
- incluir al cuidador sin desplazar progresivamente la autonomía del niño/adolescente;
- tomar decisiones seguras y culturalmente respetuosas;
- reducir miedo, dolor y experiencias traumáticas evitables.

---

# 37. Cuidado cariñoso y sensible / Nurturing Care

OMS/UNICEF describen componentes centrales:

- buena salud;
- nutrición adecuada;
- seguridad y protección;
- cuidado sensible y receptivo;
- oportunidades de aprendizaje temprano.

El enfoque 2026 para niños con retrasos o discapacidades subraya apoyo coordinado, participativo y centrado en familia.

---

# 38. Juego y estimulación oportuna

El juego favorece movimiento, lenguaje, cognición, interacción y regulación emocional.

La estimulación apropiada debe ser:

- acorde a edad y capacidades;
- segura;
- integrada a actividades cotidianas;
- interactiva, no pasiva;
- respetuosa del ritmo del niño;
- compartida con cuidadores.

Más estímulo no significa sobrecargar al niño; calidad de interacción importa más que cantidad de objetos.

---

# 39. Vínculo afectivo y respuesta sensible

El cuidado sensible implica reconocer señales del niño y responder de forma oportuna y apropiada.

En enfermería se promueven:

- contacto afectivo seguro;
- comunicación verbal y no verbal;
- participación del cuidador;
- rutinas predecibles;
- consuelo y regulación compartida;
- identificación de estrés del cuidador.

---

# 40. Nutrición para crecimiento y desarrollo

La valoración nutricional integra:

- historia alimentaria;
- acceso a alimentos;
- antropometría;
- apetito y conducta alimentaria;
- signos clínicos;
- contexto familiar/cultural;
- enfermedad o condiciones especiales.

La alimentación debe promover crecimiento sin favorecer carencias ni exceso de peso.

---

# 41. Lactancia materna

OMS/UNICEF recomiendan:

- inicio de lactancia en la primera hora de vida cuando sea posible;
- lactancia materna exclusiva durante los primeros 6 meses;
- desde los 6 meses, alimentación complementaria segura y nutricionalmente adecuada;
- continuar lactancia hasta los 2 años o más según madre y niño.

**Exclusiva** significa leche materna sin otros alimentos o líquidos, ni siquiera agua, salvo excepciones terapéuticas indicadas.

---

# 42. Alimentación complementaria

Generalmente comienza alrededor de los 6 meses porque aumentan las necesidades de energía y nutrientes.

Principios:

- alimentos seguros y apropiados para el desarrollo;
- consistencia y variedad progresivas;
- alimentación responsiva, respetando señales de hambre y saciedad;
- higiene adecuada;
- mantener lactancia;
- evitar prácticas que aumenten riesgo de atragantamiento;
- vigilar crecimiento y tolerancia.

La OMS publicó guía específica para 6–23 meses en 2023.

---

# 43. Alimentación saludable en niñez

Promover:

- variedad de alimentos mínimamente procesados;
- frutas, vegetales, leguminosas y fuentes apropiadas de proteína;
- agua como bebida habitual conforme edad;
- horarios y entorno de comida predecibles;
- participación familiar;
- evitar usar alimentos como premio o castigo;
- reducir bebidas azucaradas y productos de alta densidad energética y bajo valor nutricional.

La consejería debe ser realista y culturalmente adecuada.

---

# 44. Actividad física y reducción del sedentarismo

La actividad física favorece salud ósea, desarrollo muscular, capacidad motora, cognición y salud mental.

En niños pequeños predomina el juego activo. En escolares y adolescentes se promueve actividad regular, disfrutable y acorde a capacidad, reduciendo el sedentarismo prolongado.

No convertir la promoción en mensajes de culpa sobre peso o apariencia corporal.

---

# 45. Sueño y rutinas saludables

El sueño adecuado favorece crecimiento, aprendizaje, conducta y regulación emocional.

En educación anticipatoria se promueve:

- horario consistente;
- rutina tranquila antes de dormir;
- ambiente apropiado;
- limitar estímulos y pantallas cercanas a la hora de sueño;
- reconocer que las necesidades cambian con la edad.

Las recomendaciones exactas de horas deben consultarse según edad y guía vigente cuando sean necesarias.

---

# 46. Prevención de lesiones y seguridad

La prevención cambia con el desarrollo:

- lactante: caídas, sueño seguro, quemaduras, objetos pequeños;
- niño pequeño/preescolar: intoxicaciones, ahogamiento, tránsito, caídas;
- escolar: deportes, tránsito, agua, violencia;
- adolescente: tránsito, violencia, sustancias, riesgos digitales y sexuales.

La enfermería anticipa el riesgo **antes** de que aparezca la nueva habilidad motora o autonomía.

---

# 47. Salud bucal dentro de la promoción

El control integral incluye educación sobre higiene, alimentación, valoración de riesgo y acceso a atención odontológica.

En Panamá, las actividades actuales de atención integral de adolescentes incluyen odontología como parte de servicios preventivos.

---

# 48. Vacunación — integración con promoción

La vacunación es componente esencial de promoción y mantenimiento de la salud infantil.

Para esquemas, edades, dosis y productos vigentes en Panamá debe utilizarse el **Esquema Nacional de Vacunación 2026**, que se estudia de forma específica dentro de PEDS-02/PUBLIC-11.

No memorizar calendarios antiguos cuando existe esquema nacional actualizado.

---

# 49. Promoción de la salud del adolescente

La atención integral debe ser:

- accesible;
- respetuosa;
- libre de estigma;
- adecuada a edad y desarrollo;
- orientada a prevención y habilidades para la vida;
- atenta a confidencialidad dentro del marco legal y de seguridad.

En 2026 MINSA ha mantenido actividades de atención integral de adolescentes con medicina, odontología, laboratorio, educación, nutrición, VIH, prevención del embarazo, autoestima y proyecto de vida.

---

# 50. Sexualidad y salud sexual en adolescencia

La educación debe ser clara, científica y apropiada a la edad e incluir:

- cambios puberales;
- respeto y consentimiento;
- prevención de embarazo no planificado;
- prevención de infecciones de transmisión sexual;
- toma de decisiones informada;
- reconocimiento de abuso, coerción o violencia;
- acceso seguro a servicios cuando corresponda.

La OMS considera que los adolescentes necesitan información y educación integral en sexualidad apropiada a la edad, además de servicios aceptables y equitativos.

---

# 51. Nutrición y estilos de vida en adolescencia

Valorar:

- patrón alimentario;
- crecimiento puberal;
- IMC para edad y trayectoria;
- actividad física;
- sueño;
- imagen corporal;
- riesgo de trastornos de conducta alimentaria;
- consumo de sustancias;
- salud mental.

Evitar comentarios estigmatizantes sobre cuerpo o peso.

---

# 52. Conductas de riesgo y prevención

Durante la adolescencia pueden consolidarse patrones relacionados con alimentación, actividad física, sustancias y actividad sexual.

El rol preventivo incluye:

- entrevista respetuosa;
- identificación de riesgos;
- educación basada en evidencia;
- fortalecimiento de habilidades para la vida;
- detección de violencia o autolesión;
- referencia cuando exista riesgo para seguridad.

---

# 53. Panamá — Programa de Salud Integral de Niñez y Adolescencia

MINSA mantiene una **Sección de Salud Integral de Niñez y Adolescencia** dentro de la Dirección General de Salud Pública.

Entre sus funciones vigentes se incluyen:

- planificar programas de niñez y adolescencia;
- actualizar normas de niñez 0–9 años y adolescencia 10–19 años;
- supervisar cumplimiento;
- divulgar protocolos;
- promover continuidad de atención desde madre y recién nacido hasta adolescencia;
- capacitar recursos humanos;
- elaborar materiales educativos;
- articular acciones intersectoriales.$$,
  13
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-14',
  $$Nota documental$$,
  $$El Plan Maestro de Niñez y Adolescencia 2018–2025 aparece aún entre archivos relacionados de MINSA, pero **no debe presentarse como plan vigente en 2026** sin una actualización oficial posterior.

---

# 54. Panamá 2026 — AIEPI Comunitario

En marzo de 2026, MINSA y UNICEF anunciaron la implementación de **AIEPI Comunitario** en comunidades priorizadas.

El enfoque integra salud infantil y también componentes de adolescencia, salud sexual y reproductiva, salud mental y discapacidad.

Para examen, AIEPI debe entenderse como una estrategia de atención integrada y promoción, no como sustituto de valoración clínica individual.

---

# 55. Rol de enfermería

En crecimiento, desarrollo y promoción, enfermería debe:

1. obtener medidas antropométricas con técnica correcta;
2. registrar y graficar tendencias;
3. valorar alimentación y desarrollo;
4. escuchar preocupaciones de cuidadores y del propio adolescente;
5. identificar factores de riesgo y signos de alarma;
6. educar de forma anticipatoria;
7. promover lactancia, nutrición, juego, actividad física, sueño y seguridad;
8. verificar vacunación según esquema vigente;
9. documentar hallazgos y acciones;
10. coordinar referencia y seguimiento cuando corresponda;
11. trabajar con familia y comunidad;
12. proteger dignidad, privacidad y derechos.

---

# 56. Educación anticipatoria

Consiste en orientar **antes** de que aparezca una etapa o riesgo previsible.

Ejemplos:

- antes de que el lactante sea móvil: prevención de caídas y objetos pequeños;
- antes de alimentación complementaria: textura, seguridad e higiene;
- antes de mayor autonomía: límites seguros;
- al acercarse pubertad: cambios corporales, sexualidad y autocuidado;
- en cada etapa: señales de alarma y cuándo consultar.

---

# 57. Valoración de enfermería en control de crecimiento y desarrollo

Secuencia práctica:

1. identificar edad cronológica y antecedentes perinatales;
2. escuchar motivo de consulta y preocupaciones;
3. revisar alimentación, sueño, eliminación, actividad y entorno;
4. medir peso, longitud/talla y otros parámetros indicados;
5. graficar e interpretar tendencia;
6. observar interacción y habilidades del desarrollo;
7. revisar inmunización y medidas preventivas;
8. realizar examen físico dentro del alcance profesional;
9. educar al niño/adolescente y cuidador;
10. documentar plan, seguimiento o referencia.

---

# 58. Priorización tipo CICDE

Ante una pregunta clínica, priorizar en este orden conceptual:

1. **amenaza inmediata para vida/seguridad**;
2. pérdida de habilidades o deterioro agudo;
3. crecimiento con cambio marcado o síntomas asociados;
4. riesgo nutricional, social o ambiental significativo;
5. educación y prevención;
6. seguimiento rutinario.

Un hallazgo de promoción nunca debe retrasar la atención de un problema agudo.

---

# 59. Situaciones tipo examen$$,
  14
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-15',
  $$Caso 1$$,
  $$Niño de 18 meses con peso “bajo” en una medición aislada, activo y sin síntomas. ¿Qué acción de enfermería es más apropiada primero?

**Respuesta:** confirmar técnica/medición, ubicarla en la curva apropiada y revisar trayectoria previa y contexto antes de concluir diagnóstico.$$,
  15
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-16',
  $$Caso 2$$,
  $$Niño de 20 meses no puede mantenerse de pie de forma confiable para medir estatura.

**Respuesta:** utilizar longitud recumbente con equipo apropiado y documentar el método.$$,
  16
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-17',
  $$Caso 3$$,
  $$Niño de 7 años requiere interpretación de crecimiento.

**Respuesta:** emplear referencia apropiada para edad/sexo; la OMS utiliza referencia de 5–19 años.$$,
  17
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-18',
  $$Caso 4$$,
  $$Madre informa que su hijo de 2 años dejó de usar palabras que ya decía.

**Respuesta:** la pérdida de habilidades es señal de alarma; documentar, valorar y facilitar evaluación oportuna. No limitarse a “esperar”.$$,
  18
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-19',
  $$Caso 5$$,
  $$Un niño no cumple un ítem de una lista de hitos en una sola visita.

**Respuesta:** una lista de hitos no establece diagnóstico. Revisar contexto, otros dominios, preocupaciones y necesidad de tamizaje/evaluación.$$,
  19
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-20',
  $$Caso 6$$,
  $$Lactante de 6 meses con crecimiento adecuado. La familia pregunta si necesita agua adicional durante lactancia exclusiva antes de iniciar complementarios.

**Respuesta:** la recomendación OMS es lactancia exclusiva durante los primeros 6 meses, sin otros líquidos, salvo indicaciones terapéuticas específicas.$$,
  20
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-21',
  $$Caso 7$$,
  $$A los 6 meses, la familia pregunta por inicio de otros alimentos.

**Respuesta:** iniciar alimentación complementaria segura y nutricionalmente adecuada alrededor de los 6 meses, manteniendo lactancia.$$,
  21
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-22',
  $$Caso 8$$,
  $$Padres compran dispositivos electrónicos porque creen que “estimulan más” que jugar con su hijo.

**Respuesta:** promover interacción sensible, juego, conversación y oportunidades activas de aprendizaje apropiadas a la edad.$$,
  22
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-23',
  $$Caso 9$$,
  $$Adolescente solicita orientación sobre salud sexual y teme ser juzgado.

**Respuesta:** ofrecer comunicación respetuosa, no estigmatizante, información apropiada a edad, privacidad dentro del marco legal y valoración de seguridad/riesgo.$$,
  23
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-24',
  $$Caso 10$$,
  $$En una escuela, adolescente presenta alimentación restrictiva intensa y preocupación extrema por peso.

**Respuesta:** valorar riesgo nutricional y salud mental, evitar estigma y coordinar evaluación o referencia apropiada.$$,
  24
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-25',
  $$Caso 11$$,
  $$Un niño cruza varias líneas de su curva de peso en visitas consecutivas.

**Respuesta:** verificar técnica y evaluar trayectoria, alimentación, enfermedad y otros factores; no ignorar el patrón por un valor que aún esté “dentro de percentiles”.$$,
  25
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-26',
  $$Caso 12$$,
  $$Cuidador pregunta si el progreso motor debe evaluarse aislado del lenguaje y la interacción social.

**Respuesta:** no. El desarrollo se valora de manera integral en múltiples dominios.$$,
  26
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-27',
  $$Caso 13$$,
  $$Niño con retraso del desarrollo y discapacidad acude a control.

**Respuesta:** mantener enfoque de cuidado sensible, centrado en familia, promover capacidades y coordinar apoyos; la discapacidad no excluye promoción del desarrollo.$$,
  27
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-28',
  $$Caso 14$$,
  $$Durante control pediátrico, la enfermera detecta calendario de vacunación incompleto pero el niño está estable.

**Respuesta:** verificar esquema nacional vigente, orientar y coordinar actualización según programa; no usar calendarios antiguos memorizados.

---

# 60. Errores frecuentes

1. Confundir crecimiento con desarrollo.
2. Interpretar un percentil aislado como diagnóstico.
3. Usar IMC de pediatría con puntos de corte de adulto.
4. Usar la curva 0–5 años para un adolescente.
5. Medir de pie a un lactante cuando corresponde longitud recumbente.
6. Ignorar la trayectoria previa.
7. Tratar listas de hitos como pruebas diagnósticas.
8. Restar importancia a pérdida de habilidades.
9. Considerar estimulación como exposición pasiva a pantallas.
10. Dar agua u otros líquidos dentro de “lactancia exclusiva”.
11. Iniciar complementarios demasiado temprano sin indicación.
12. Hablar con adolescentes de forma moralizante o sin privacidad apropiada.
13. Ignorar la familia y el entorno.
14. Usar el Plan Maestro 2018–2025 como si siguiera vigente en 2026.

---

# 61. Qué memorizar

- Crecimiento = cambio cuantitativo; desarrollo = adquisición funcional; maduración = progresión biológica.
- Medidas CICDE: peso, longitud/talla, perímetro cefálico, IMC.
- Menor de 2 años: longitud recumbente; desde 2 años y capaz de estar de pie: talla.
- OMS: estándares 0–5 años; referencia 5–19 años.
- IMC/edad 5–19 OMS: delgadez <−2 DE, severa <−3; sobrepeso >+1; obesidad >+2.
- Hitos: motora, cognitiva, lenguaje, social y emocional.
- Lista de hitos ≠ tamizaje diagnóstico.
- **Regresión/pérdida de habilidades = alarma.**
- Lactancia exclusiva: 6 meses.
- Complementarios: desde ~6 meses; continuar lactancia hasta 2 años o más.
- Adolescencia OMS: 10–19 años.
- Enfermería: medir, interpretar tendencia, educar, prevenir, detectar alarma, referir y seguir.

---

# 62. Diferencias clave

| Conceptos | Diferencia |
|---|---|
| Crecimiento vs desarrollo | tamaño corporal vs adquisición funcional |
| Longitud vs talla | recumbente vs de pie |
| Percentil vs puntaje Z | posición relativa vs desviaciones estándar de la mediana |
| Vigilancia vs tamizaje | observación longitudinal vs herramienta estandarizada |
| Tamizaje vs diagnóstico | identifica riesgo vs confirma/define condición |
| Estimulación vs sobreestimulación | interacción apropiada vs exceso de demandas/estímulos |
| Promoción vs tratamiento | fortalece salud/prevence riesgo vs maneja enfermedad establecida |
| Posición en curva vs trayectoria | dato puntual vs evolución en el tiempo |

---

# 63. Relación con competencias CICDE

Este tema ejercita:

- valoración integral;
- promoción y prevención;
- educación para la salud;
- comunicación con niño, adolescente y familia;
- detección oportuna de riesgos;
- priorización de cuidados;
- continuidad y referencia;
- documentación segura;
- enfoque familiar y comunitario.

---

# 64. Fuentes y validación$$,
  28
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-29',
  $$Fuente rectora CICDE$$,
  $$**IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen por Competencia de Profesionales de Enfermería*, tercera edición, Panamá, 2026.

El CICDE declara como bibliografía pediátrica:

- Hockenberry, Rodgers y Wilson. *Wong. Enfermería Pediátrica*, 10.ª edición.
- MINSA. *Manual de Normas y Procedimientos. Programa Ampliado de Inmunizaciones*.
- MINSA. *Esquema nacional de vacunación 2026*.
- Posada Díaz, Gómez Ramírez y Ramírez Gómez. *El Niño Sano*.$$,
  29
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-30',
  $$Corrección de metadatos bibliográficos$$,
  $$El documento CICDE cita **2020** para la 10.ª edición en español de *Wong. Enfermería Pediátrica*. La ficha oficial de Elsevier registra la publicación en español el **26 de agosto de 2019**. Se conserva el hecho de que CICDE la declara como referente, pero no se reproduce contenido protegido ni se depende de copias no autorizadas.$$,
  30
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-31',
  $$Panamá — fuentes oficiales$$,
  $$1. MINSA — Sección de Salud Integral de Niñez y Adolescencia  
   https://www.minsa.gob.pa/programa/seccion-de-salud-integral-de-ninez-y-adolescencia
2. MINSA — AIEPI Comunitario 2026  
   https://minsa.gob.pa/noticia/minsa-lanza-la-implementacion-del-aiepi-comunitario-con-apoyo-de-unicef-para-fortalecer-la
3. MINSA — Atención integral de adolescentes, Panamá Este, septiembre 2026  
   https://minsa.gob.pa/noticia/minsa-panama-este-fortalece-la-atencion-integral-de-los-adolescentes

**Nota:** las notas de implementación 2026 se usan para confirmar actividad programática actual, no como sustituto de normas clínicas.$$,
  31
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-01-32',
  $$OMS/UNICEF y fuentes complementarias$$,
  $$1. WHO Child Growth Standards  
   https://www.who.int/tools/child-growth-standards
2. WHO — Child Growth Standards Q&A (2025)  
   https://www.who.int/news-room/questions-and-answers/item/child-growth-standards
3. WHO — BMI-for-age 5–19 years  
   https://www.who.int/tools/growth-reference-data-for-5to19-years/indicators/bmi-for-age
4. WHO — Improving early childhood development (2020)  
   https://www.who.int/publications/i/item/97892400020986
5. WHO/UNICEF — Nurturing care for children with developmental delays and disabilities (2026)  
   https://www.who.int/publications/i/item/B09617
6. WHO — Alimentación del lactante y del niño pequeño (actualizado 4 agosto 2026)  
   https://www.who.int/es/news-room/fact-sheets/detail/infant-and-young-child-feeding
7. WHO — Complementary feeding 6–23 months guideline (2023)  
   https://www.who.int/publications/i/item/9789240081864
8. WHO — Salud del adolescente  
   https://www.who.int/es/health-topics/adolescent-health
9. WHO — Actividad física  
   https://www.who.int/es/news-room/fact-sheets/detail/physical-activity
10. CDC — Developmental Milestones / Learn the Signs. Act Early. (2026)  
    https://www.cdc.gov/act-early/milestones/index.html

---

# 65. Control de calidad

- Alcance CICDE PEDS-01: **9/9 subtemas explícitos cubiertos**.
- Bibliografía CICDE: identificada y preservada como referencia de alcance.
- Metadatos Wong: contraste con ficha oficial Elsevier documentado.
- Normativa/programa Panamá: Sección de Salud Integral de Niñez y Adolescencia verificada en sitio MINSA vigente.
- Contexto 2026 Panamá: implementación AIEPI Comunitario y actividades de atención integral de adolescentes verificadas.
- Crecimiento: contrastado con estándares OMS 0–5 y referencia 5–19.
- Lactancia/alimentación: contrastada con actualización OMS de agosto 2026 y guía complementaria 2023.
- Desarrollo: contrastado con OMS/UNICEF y recursos CDC 2026.
- Hitos: presentados como **orientadores**, nunca como diagnóstico.
- Plan Maestro 2018–2025: tratado como histórico, no como plan vigente 2026.
- Revisión clínica humana: **no realizada**.

---

# 66. Estado para integración

**Estado:** `REVIEW`  
**Version:** 1  
**is_current:** true  
**reviewed_at:** `NULL`  
**reviewed_by:** `NULL`

El paquete está listo para validación automatizada e integración técnica posterior, pero **no debe etiquetarse como `VERIFIED` humano**.$$,
  32
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-1',
  $$Atención de enfermería al recién nacido sano y con alteraciones de salud$$,
  $$**Área:** Enfermería Pediátrica  
**Código:** PEDS-02  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión documental:** 2026-09-11

---

# 1. Alcance oficial CICDE

El lineamiento CICDE 2026 incluye expresamente el tema **“Atención de enfermería al recién nacido sano y con alteraciones de salud”** y exige estudiar:

1. Atención integral del recién nacido normal.
2. Examen físico y neurológico.
3. Técnicas somatométricas y valoración de signos vitales.
4. Lactancia materna, vacunación y fortalecimiento del vínculo madre-hijo.
5. Cuidados de enfermería al recién nacido pretérmino.
6. Malformaciones congénitas y cardiopatías.
7. Problemas respiratorios.
8. Enfermedades hemolíticas.
9. VIH/SIDA y otras alteraciones de salud neonatal.

Este paquete conserva íntegramente esos nueve puntos. La actualización clínica y normativa se apoya principalmente en las **Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años (MINSA, Resolución 306 de 2024)**, el **Esquema Nacional de Vacunación 2026**, el programa panameño de tamizaje neonatal y recomendaciones vigentes de OMS/UNICEF y otras entidades sanitarias reconocidas.

---

# 2. Objetivos de aprendizaje

Al finalizar el tema, el estudiante debe poder:

1. Identificar las prioridades de atención inmediata del recién nacido.
2. Distinguir adaptación fisiológica normal de signos de alarma.
3. Explicar el propósito y las limitaciones del puntaje de Apgar.
4. Realizar una valoración física sistemática y reconocer hallazgos que requieren referencia.
5. Describir los componentes básicos de la valoración neurológica neonatal.
6. Aplicar principios seguros de peso, longitud, perímetro cefálico, edad gestacional y signos vitales.
7. Promover lactancia temprana, contacto piel con piel, vínculo y participación familiar.
8. Reconocer el esquema neonatal de vacunación vigente en Panamá.
9. Identificar necesidades especiales del recién nacido prematuro o de bajo peso.
10. Reconocer signos de cardiopatía congénita crítica y comprender el rol del tamizaje con pulsioximetría como complemento del examen.
11. Identificar signos de dificultad respiratoria y priorizar estabilización y referencia.
12. Comprender enfermedad hemolítica, ictericia patológica y cuidados relacionados con fototerapia.
13. Explicar el enfoque actual del recién nacido expuesto al VIH sin memorizar esquemas farmacológicos fuera de protocolo.
14. Priorizar acciones de enfermería ante sepsis, hipoglucemia, hipotermia, mala alimentación y otras emergencias neonatales.
15. Resolver situaciones tipo CICDE basadas en seguridad, priorización y reconocimiento temprano del deterioro.

---

# 3. Periodo neonatal

El **periodo neonatal** comprende los primeros 28 días de vida. Es una etapa de transición rápida en la que el recién nacido debe pasar de la circulación y respiración fetal a la vida extrauterina.

Durante este periodo son especialmente importantes:

- respiración efectiva;
- estabilidad térmica;
- alimentación;
- adaptación cardiovascular;
- prevención de infección;
- detección temprana de anomalías;
- vigilancia de ictericia;
- seguimiento del peso;
- apoyo al vínculo familiar.$$,
  1
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-2',
  $$Clave CICDE$$,
  $$En neonatología, pequeños cambios pueden preceder deterioro rápido. La enfermería debe observar **tendencias**, no solo valores aislados.

---

# 4. Transición fisiológica al nacimiento

Con el nacimiento ocurren cambios coordinados:

- los pulmones se expanden y sustituyen líquido por aire;
- aumenta el flujo sanguíneo pulmonar;
- disminuye gradualmente la resistencia vascular pulmonar;
- se modifican los cortocircuitos fetales;
- el recién nacido debe mantener temperatura sin el ambiente intrauterino;
- comienza la regulación independiente de glucosa;
- inicia alimentación enteral.

La transición puede alterarse por prematuridad, asfixia, infección, diabetes materna, cesárea sin trabajo de parto, meconio, malformaciones o exposición a fármacos maternos.

---

# 5. Prioridades inmediatas al nacimiento

En un recién nacido que respira o llora y mantiene buen tono, las prioridades incluyen:

- secado cuidadoso;
- mantener calor;
- valoración rápida de respiración y tono;
- contacto piel con piel cuando es clínicamente posible;
- identificación segura;
- inicio temprano de lactancia;
- vigilancia continua durante la transición.

La OMS incluye entre los cuidados esenciales: secado inmediato, contacto piel con piel, apoyo a lactancia, cuidado térmico, prevención de infección, reconocimiento de signos de peligro y reanimación cuando sea necesaria.

---

# 6. Pinzamiento del cordón y contacto piel con piel

El pinzamiento tardío del cordón forma parte de la atención basada en evidencia cuando no existe una indicación clínica que requiera una conducta diferente.

El contacto piel con piel:

- ayuda a mantener temperatura;
- favorece estabilidad fisiológica;
- facilita lactancia;
- fortalece vínculo;
- reduce separación innecesaria.

La norma panameña 2024 incluye el contacto madre-hijo y la promoción del apego en la atención del recién nacido, incluidos prematuros cuando la condición clínica lo permite.

---

# 7. Termorregulación

El recién nacido pierde calor con facilidad por:

- evaporación;
- conducción;
- convección;
- radiación.

Factores de riesgo de hipotermia:

- prematuridad;
- bajo peso;
- humedad residual;
- ambiente frío;
- separación prolongada;
- enfermedad.$$,
  2
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-3',
  $$Intervenciones$$,
  $$- secar inmediatamente;
- retirar textiles húmedos;
- gorro o abrigo apropiado según contexto;
- piel con piel;
- controlar temperatura;
- evitar baños precoces si comprometen estabilidad;
- usar dispositivos térmicos según necesidad y protocolo.$$,
  3
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-4',
  $$Prioridad$$,
  $$La hipotermia aumenta consumo de oxígeno y glucosa. No debe tratarse como un hallazgo menor.

---

# 8. Valoración inicial de respiración

La valoración inicial se centra en:

- presencia de respiración o llanto;
- frecuencia y patrón;
- simetría torácica;
- coloración;
- tono y respuesta;
- signos de esfuerzo respiratorio.

Signos preocupantes:

- apnea;
- jadeo/gasping;
- quejido;
- retracciones;
- aleteo nasal;
- cianosis central;
- mala perfusión;
- bradicardia.

---

# 9. Reanimación neonatal: principio de prioridad

La necesidad de reanimación se determina por la evaluación clínica inmediata, no por esperar el puntaje de Apgar.

El principio básico es:

1. reconocer rápidamente si el recién nacido necesita ayuda;
2. asegurar calor y posición;
3. apoyar vía aérea y ventilación de acuerdo con entrenamiento/protocolo;
4. reevaluar frecuencia cardiaca, respiración y respuesta;
5. escalar soporte cuando corresponda.$$,
  4
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-5',
  $$Actualización 2026$$,
  $$La OMS anunció en junio de 2026 que está desarrollando una actualización de sus guías de reanimación neonatal. Hasta que se publique una recomendación normativa nueva, deben seguirse los protocolos institucionales y guías vigentes, sin inventar cambios anticipados.

---

# 10. Puntaje de Apgar

El Apgar evalúa cinco componentes:

- apariencia/color;
- pulso/frecuencia cardiaca;
- gesticulación o respuesta refleja;
- actividad/tono;
- respiración.

Cada componente recibe 0, 1 o 2 puntos.

Se registra habitualmente al minuto y a los 5 minutos. Si el puntaje permanece bajo, puede repetirse según protocolo.$$,
  5
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-6',
  $$Punto crítico$$,
  $$**El Apgar no debe utilizarse para decidir si se inicia la reanimación.** La reanimación, si es necesaria, debe comenzar antes de que se complete el puntaje del primer minuto.

Tampoco debe usarse de forma aislada para diagnosticar asfixia ni para predecir el resultado neurológico individual.

---

# 11. Profilaxis neonatal de rutina

Según normas locales y protocolo institucional, la atención preventiva del recién nacido puede incluir:

- vitamina K;
- profilaxis ocular;
- inmunizaciones correspondientes;
- tamizajes;
- vigilancia de alimentación y glucosa cuando existe indicación;
- educación familiar.

La enfermería verifica:

- orden/protocolo;
- medicamento correcto;
- dosis y vía correctas;
- identificación del paciente;
- documentación;
- observación posterior.

---

# 12. Cuidado del cordón umbilical

Principios:

- higiene de manos;
- mantener el muñón limpio y seco;
- evitar sustancias caseras no indicadas;
- observar enrojecimiento, secreción, mal olor o sangrado;
- educar a la familia.$$,
  6
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-7',
  $$Signos de alarma$$,
  $$Eritema que se extiende a la piel, secreción purulenta, mal olor acompañado de deterioro, fiebre o hipoactividad requieren valoración inmediata por posible infección.

---

# 13. Seguridad e identificación

Medidas de seguridad:

- identificación correcta madre-recién nacido;
- brazaletes según política institucional;
- prevención de caídas;
- traslado seguro;
- cuna segura;
- verificación antes de procedimientos y administración de medicamentos;
- educación a cuidadores.

En neonatología, la identificación incorrecta es un evento potencialmente grave.

---

# 14. Examen físico: enfoque sistemático

El examen debe realizarse de manera ordenada, respetando temperatura y tolerancia.

Secuencia práctica:

1. observación general antes de manipular;
2. piel y color;
3. cabeza y cara;
4. ojos, oídos, nariz y boca;
5. cuello y clavículas;
6. tórax y respiración;
7. corazón y perfusión;
8. abdomen y cordón;
9. genitales y ano;
10. extremidades, caderas y columna;
11. valoración neurológica y reflejos.

Siempre correlacionar con antecedentes obstétricos y perinatales.

---

# 15. Apariencia general

Observar:

- postura;
- tono;
- movimientos espontáneos;
- simetría;
- llanto;
- interacción;
- color;
- respiración;
- respuesta al estímulo.

Hallazgos que llaman la atención:

- marcada hipotonía;
- hipoactividad;
- asimetría persistente;
- dificultad respiratoria;
- palidez intensa;
- cianosis central;
- convulsiones;
- mala perfusión.

---

# 16. Piel y coloración

Pueden observarse variaciones transitorias normales, pero deben diferenciarse de:

- cianosis central;
- palidez;
- petequias extensas;
- equimosis importantes;
- ictericia precoz;
- lesiones infecciosas;
- deshidratación.$$,
  7
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-8',
  $$Clave$$,
  $$La acrocianosis transitoria de manos y pies no equivale a **cianosis central** de lengua y mucosas.

---

# 17. Cabeza y fontanelas

Valorar:

- forma y simetría;
- suturas;
- fontanelas;
- edema del cuero cabelludo;
- lesiones por parto;
- perímetro cefálico.

Una fontanela debe interpretarse junto con estado de hidratación, llanto, posición y condición general.

Hallazgos como tensión persistente asociada a deterioro neurológico o depresión marcada requieren evaluación médica.

---

# 18. Ojos, oídos, nariz, boca y cuello

Revisar:

- simetría ocular;
- secreciones;
- integridad de paladar;
- permeabilidad nasal clínica;
- succión;
- implantación y forma de orejas;
- cuello y masas;
- clavículas.

La identificación de fisuras, masas o asimetrías puede orientar a anomalías congénitas o trauma del parto.

---

# 19. Tórax y pulmones

Valorar:

- forma del tórax;
- simetría;
- frecuencia respiratoria;
- entrada de aire;
- presencia de ruidos agregados;
- retracciones;
- quejido;
- aleteo nasal.

El recién nacido puede tener respiración periódica, pero la apnea sostenida, cianosis central o esfuerzo progresivo no son normales.

---

# 20. Corazón y circulación

Observar:

- frecuencia cardiaca;
- ritmo;
- color;
- llenado capilar;
- temperatura de extremidades;
- pulsos, especialmente femorales;
- presencia de soplos;
- signos de congestión.$$,
  8
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-9',
  $$Importante$$,
  $$Un soplo puede ser transitorio, pero la combinación de **cianosis, pulsos débiles, mala perfusión, taquipnea o dificultad para alimentarse** aumenta la sospecha de cardiopatía significativa.

---

# 21. Abdomen y cordón

Valorar:

- forma;
- distensión;
- ruidos intestinales según contexto;
- masas;
- cordón;
- vasos del cordón si corresponde;
- signos de infección;
- eliminación.

Distensión progresiva, vómito bilioso, ausencia de eliminación esperada acompañada de signos clínicos o sangre en heces requieren valoración urgente.

---

# 22. Genitales y ano

Valorar:

- anatomía externa;
- permeabilidad anal aparente;
- características de eliminación;
- anomalías visibles.

No forzar maniobras invasivas innecesarias. Ante ambigüedad genital, anomalía estructural o ausencia de orificio anal aparente, proteger al recién nacido y activar evaluación especializada.

---

# 23. Sistema musculoesquelético y columna

Examinar:

- simetría de extremidades;
- movilidad;
- dedos;
- clavículas;
- caderas;
- columna;
- región sacra.

Asimetría de movimientos puede sugerir lesión neurológica, fractura o lesión del plexo braquial.

La valoración de caderas debe realizarse por personal entrenado y no mediante maniobras bruscas repetitivas.

---

# 24. Valoración neurológica neonatal

Incluye:

- estado de alerta;
- tono;
- postura;
- movimientos espontáneos;
- simetría;
- calidad del llanto;
- succión;
- respuesta a estímulos;
- reflejos primitivos.

No existe un único hallazgo que defina normalidad neurológica. Se valora el patrón global y la evolución.

---

# 25. Reflejos primitivos

Entre los reflejos que pueden evaluarse están:

- búsqueda;
- succión;
- Moro;
- prensión palmar;
- prensión plantar;
- marcha automática en contexto de valoración;
- reflejo tónico cervical según edad y técnica.

La ausencia, marcada asimetría o persistencia fuera del periodo esperado debe interpretarse con edad gestacional, estado clínico y examen completo.

---

# 26. Peso al nacer

El peso debe obtenerse con equipo adecuado y registrarse con precisión.

Clasificaciones útiles:

- bajo peso al nacer: < 2500 g;
- muy bajo peso: < 1500 g;
- extremadamente bajo peso: < 1000 g.

El peso se interpreta junto con edad gestacional. Un recién nacido puede ser prematuro sin bajo peso o tener bajo peso siendo de término.

---

# 27. Longitud

Se mide en posición recumbente con técnica adecuada.

Puntos de calidad:

- cabeza correctamente alineada;
- cuerpo extendido sin forzar;
- piernas en posición apropiada;
- pies apoyados contra la pieza móvil;
- registro inmediato.

---

# 28. Perímetro cefálico

Se mide el máximo perímetro occipitofrontal con cinta no extensible.

Un valor aislado debe:

- confirmarse técnicamente;
- compararse con edad gestacional y sexo;
- correlacionarse con examen físico y antecedentes.

---

# 29. Edad gestacional y clasificación

La edad gestacional puede estimarse con datos obstétricos y métodos clínicos como Capurro cuando corresponde al protocolo local.

Clasificación general:

- pretérmino: < 37 semanas;
- término: 37 a menos de 42 semanas;
- postérmino: 42 semanas o más.

La clasificación por peso para edad gestacional diferencia pequeño, adecuado o grande para la edad gestacional.

---

# 30. Signos vitales: interpretación

La interpretación neonatal debe considerar:

- edad en horas o días;
- sueño o vigilia;
- llanto;
- temperatura;
- prematuridad;
- enfermedad;
- oxígeno suplementario.

Como referencias de estudio para un recién nacido de término estable:

- frecuencia respiratoria: aproximadamente 30–60/min;
- frecuencia cardiaca en reposo: aproximadamente 100–160/min;
- temperatura axilar objetivo frecuente: alrededor de 36.5–37.5 °C.

Estos rangos son orientativos; la conducta clínica debe seguir protocolo institucional y contexto.

---

# 31. Saturación de oxígeno y transición

La saturación aumenta progresivamente después del nacimiento. No debe interpretarse con valores de adulto en los primeros minutos.

Posteriormente, hipoxemia persistente en un recién nacido que debería estar estable exige evaluación de:

- pulmón;
- corazón;
- infección;
- adaptación circulatoria;
- vía aérea.

---

# 32. Glucosa neonatal: enfoque basado en riesgo

No todos los recién nacidos sanos requieren controles seriados de glucosa.

Se vigilan especialmente quienes tienen factores de riesgo como:

- prematuridad;
- bajo peso o pequeño para edad gestacional;
- grande para edad gestacional;
- hijo de madre con diabetes;
- hipotermia;
- dificultad respiratoria;
- mala alimentación;
- síntomas neurológicos.$$,
  9
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-10',
  $$Signos posibles$$,
  $$Temblor, letargo, apnea, mala succión, hipotermia o convulsiones pueden aparecer, pero son inespecíficos.

---

# 33. Lactancia: inicio temprano

La OMS promueve el inicio temprano de lactancia y la lactancia exclusiva.

Intervenciones de enfermería:

- favorecer piel con piel;
- evitar separaciones innecesarias;
- observar señales tempranas de hambre;
- ayudar con posición y agarre;
- evitar suplementación sin indicación;
- apoyar extracción de leche cuando el recién nacido no puede succionar.

---

# 34. Evaluación de una toma

Observar:

- posición madre-bebé;
- agarre;
- succión y deglución;
- dolor materno;
- duración y eficacia;
- signos de saciedad;
- eliminación;
- trayectoria de peso.

La frecuencia de tomas debe adaptarse a señales del bebé y situación clínica; un recién nacido con mala succión requiere valoración, no simplemente “esperar a que tenga hambre”.

---

# 35. Lactancia y vínculo

El vínculo se fortalece con:

- contacto piel con piel;
- respuesta sensible a señales;
- participación del cuidador;
- alojamiento conjunto cuando es seguro;
- educación sin culpabilizar;
- apoyo emocional.

La enfermería debe reconocer que dificultades de lactancia pueden tener causas maternas, neonatales o del proceso de apoyo.

---

# 36. Vacunación neonatal en Panamá 2026

El **Esquema Nacional de Vacunación 2026** incluye al nacimiento:

- **BCG:** dosis única, para protección frente a formas graves de tuberculosis;
- **Hepatitis B:** dosis al nacer, recomendada en las primeras 12 horas.

El esquema 2026 también contempla excepciones operativas para partos fortuitos/fuera de institución y situaciones de riesgo, que deben seguirse según la norma nacional.$$,
  10
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-11',
  $$Seguridad$$,
  $$La enfermería verifica edad, vacuna, dosis, vía, sitio, lote, cadena de frío y registro.

---

# 37. BCG y hepatitis B: puntos de examen

**BCG**
- se administra al nacer según esquema nacional;
- protege principalmente contra formas graves de tuberculosis infantil;
- la técnica y vía deben corresponder al producto y norma.

**Hepatitis B**
- la dosis neonatal temprana reduce riesgo de transmisión perinatal;
- en exposición materna de alto riesgo se requieren medidas adicionales según protocolo.

No sustituir el esquema nacional por calendarios de otros países.

---

# 38. Tamizaje neonatal en Panamá

El Programa Nacional de Tamizaje Neonatal del MINSA tiene como misión asegurar la toma obligatoria de muestra en instituciones públicas y privadas para detectar oportunamente enfermedades metabólicas y endocrinológicas.

La enfermería participa en:

- identificación correcta;
- toma y manejo de muestra;
- documentación;
- seguimiento de resultados;
- localización/referencia cuando un resultado requiere confirmación.$$,
  11
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-12',
  $$Clave$$,
  $$Un tamizaje positivo **no equivale a diagnóstico**. Requiere prueba confirmatoria y evaluación clínica.

---

# 39. Otros tamizajes del recién nacido

Según disponibilidad y programa institucional pueden incluir:

- tamizaje auditivo;
- pulsioximetría para cardiopatías críticas;
- evaluación de hiperbilirrubinemia;
- tamizaje metabólico;
- evaluación de cadera según riesgo y examen.

El estudiante debe diferenciar **tamizaje** de **diagnóstico**.

---

# 40. Recién nacido pretérmino: definición y riesgos

Pretérmino: nacimiento antes de 37 semanas.

Riesgos frecuentes:

- hipotermia;
- dificultad respiratoria;
- apnea;
- hipoglucemia;
- mala coordinación succión-deglución-respiración;
- infección;
- ictericia;
- anemia;
- alteraciones del neurodesarrollo.

La intensidad del cuidado depende de edad gestacional, peso y estabilidad.

---

# 41. Norma panameña para prematuro o bajo peso

Las Normas Técnicas 2024 del MINSA indican para el prematuro o bajo peso:

- atención de rutina del recién nacido adaptada a condición;
- reanimación neonatal según guías vigentes;
- contacto madre-hijo cuando sea posible;
- lactancia materna;
- examen físico y antropometría;
- evaluación de edad gestacional;
- vitamina K y profilaxis ocular;
- glucemia cuando corresponda;
- referencia a mayor complejidad cuando sea necesaria.

También contemplan seguimiento con **edad corregida** hasta los 2 años para crecimiento y neurodesarrollo.

---

# 42. Edad corregida

Para seguimiento de prematuros:

**edad corregida = edad cronológica − semanas que faltaron para llegar a 40 semanas de gestación**

Se utiliza para interpretar crecimiento y desarrollo durante los primeros años según protocolo.

No se usa para retrasar vacunas: la norma panameña señala que la vacunación del prematuro se administra según **edad cronológica** y el esquema nacional, salvo indicación específica.

---

# 43. Termorregulación en el prematuro

El prematuro tiene:

- menos grasa subcutánea;
- mayor superficie corporal relativa;
- piel más inmadura;
- menor capacidad de producir y conservar calor.

Intervenciones:

- ambiente térmico neutro;
- piel con piel/KMC cuando sea apropiado;
- control frecuente de temperatura;
- minimizar exposición;
- gorro, incubadora o calentador según necesidad.

---

# 44. Método Madre Canguro / KMC

La OMS recomienda KMC como estándar para prematuros o bajo peso, iniciándolo tan pronto como sea posible.

Combina:

- contacto piel con piel prolongado;
- alimentación con leche materna;
- apoyo y seguimiento.

La guía OMS 2025 enfatiza su aplicación en instalaciones de salud y continuidad en el hogar con apoyo apropiado.

Panamá también contempla el Programa Nacional Familia Canguro y su uso en instalaciones habilitadas.

---

# 45. Nutrición del prematuro

La leche de la propia madre es la primera opción cuando es posible.

El prematuro puede requerir:

- apoyo para extracción;
- alimentación por métodos alternativos;
- fortificación según indicación;
- vigilancia de tolerancia;
- control de peso;
- evaluación de coordinación succión-deglución-respiración.

La enfermería evita forzar alimentación oral en un bebé con inestabilidad respiratoria o mala coordinación.

---

# 46. Respiración del prematuro

Problemas frecuentes:

- síndrome de dificultad respiratoria por inmadurez pulmonar;
- apnea de la prematuridad;
- necesidad de soporte con oxígeno/CPAP;
- riesgo de lesión por oxígeno o ventilación.

La OMS reconoce CPAP y cafeína dentro de intervenciones que pueden mejorar resultados en prematuros seleccionados, bajo manejo especializado.

La enfermería monitoriza respiración, saturación, color, esfuerzo, episodios de apnea y respuesta al soporte.

---

# 47. Prevención de infección en prematuros

Medidas clave:

- higiene de manos;
- técnica aséptica;
- manejo seguro de catéteres;
- minimizar procedimientos innecesarios;
- leche humana;
- vigilancia de temperatura y conducta;
- participación familiar segura.

El prematuro puede presentar infección sin fiebre evidente.

---

# 48. Malformaciones congénitas: enfoque inicial

Ante una anomalía visible:

1. estabilizar primero respiración, circulación y temperatura;
2. evitar manipulaciones dañinas;
3. proteger tejidos expuestos;
4. valorar otras anomalías;
5. documentar;
6. informar al equipo;
7. apoyar a la familia con comunicación respetuosa;
8. coordinar referencia.

No retrasar estabilización mientras se intenta definir un diagnóstico anatómico completo.

---

# 49. Cardiopatías congénitas: signos de sospecha

Sospechar ante:

- cianosis central;
- taquipnea persistente;
- dificultad para alimentarse;
- diaforesis con la alimentación;
- mala ganancia de peso;
- pulsos femorales débiles;
- diferencia de perfusión;
- hepatomegalia;
- soplo acompañado de síntomas.

Un recién nacido con cardiopatía crítica puede parecer inicialmente sano.

---

# 50. Pulsioximetría para cardiopatía congénita crítica

La pulsioximetría puede detectar algunas cardiopatías congénitas críticas antes del alta.

Puntos esenciales:

- complementa, no sustituye, el examen físico;
- una prueba normal no excluye todas las cardiopatías;
- un resultado anormal también puede deberse a enfermedad pulmonar, infección, hipotermia o hipertensión pulmonar.

Las recomendaciones CDC 2025–2026 describen tamizaje alrededor de las 24 horas o lo más tarde posible antes del alta precoz. Esto se usa aquí como referencia complementaria internacional y no como afirmación de obligatoriedad específica en Panamá.

---

# 51. Problemas respiratorios: signos de dificultad

Signos clásicos:

- taquipnea;
- quejido espiratorio;
- aleteo nasal;
- retracciones;
- cianosis central;
- apnea;
- mala entrada de aire;
- desaturación.$$,
  12
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-13',
  $$Prioridad de enfermería$$,
  $$**Respiración primero.** Mantener calor, posición adecuada, monitorización y activar el nivel de atención necesario.

---

# 52. Taquipnea transitoria del recién nacido

Se asocia a retraso en eliminación del líquido pulmonar y es más frecuente después de cesárea sin trabajo de parto, entre otros factores.

Puede presentar:

- taquipnea temprana;
- leve a moderado esfuerzo respiratorio;
- requerimiento variable de oxígeno.

Aunque suele ser autolimitada, inicialmente debe diferenciarse de sepsis, neumonía, síndrome de dificultad respiratoria y cardiopatía.

---

# 53. Síndrome de dificultad respiratoria neonatal

Es más frecuente en prematuros por déficit de surfactante.

Manifestaciones:

- dificultad respiratoria precoz;
- quejido;
- retracciones;
- necesidad de oxígeno;
- patrón radiológico característico.

El manejo puede incluir CPAP, oxígeno titulado, surfactante y soporte especializado según gravedad.

---

# 54. Aspiración de meconio

Debe considerarse cuando existe líquido meconial y dificultad respiratoria.

La conducta depende de vigor del recién nacido y protocolos vigentes. No se realizan maniobras invasivas de rutina sin indicación.

Enfermería:

- prepara equipo de reanimación;
- vigila respiración;
- mantiene temperatura;
- documenta características del líquido y condición del neonato;
- apoya intervención especializada.

---

# 55. Apnea neonatal

Apnea es una pausa respiratoria clínicamente significativa, particularmente preocupante si se asocia con:

- bradicardia;
- desaturación;
- cambio de color;
- hipotonía.

En prematuros puede existir apnea de la prematuridad, pero siempre deben excluirse causas como infección, hipoglucemia, alteraciones térmicas, neurológicas o respiratorias.

---

# 56. Oxígeno: seguridad

El oxígeno es un medicamento.

Principios:

- administrar solo cuando está indicado;
- usar dispositivo apropiado;
- monitorizar saturación;
- evitar hiperoxia innecesaria;
- verificar humidificación/equipos según soporte;
- documentar respuesta.

Esto es especialmente importante en prematuros.

---

# 57. Enfermedad hemolítica del feto y recién nacido

Ocurre cuando anticuerpos maternos destruyen eritrocitos fetales/neonatales.

Puede relacionarse con:

- incompatibilidad Rh;
- incompatibilidad ABO;
- otros antígenos eritrocitarios.

Consecuencias:

- anemia;
- hiperbilirrubinemia;
- ictericia precoz;
- hepatosplenomegalia;
- en formas graves, hidropesía y compromiso cardiaco.

---

# 58. Evaluación de enfermedad hemolítica

Puede incluir:

- grupo y Rh materno/neonatal;
- Coombs directo;
- hemoglobina/hematocrito;
- reticulocitos;
- bilirrubina seriada;
- examen clínico.

El patrón y tendencia de bilirrubina importan más que un único valor aislado.

---

# 59. Ictericia neonatal: normal vs alarma

La ictericia es frecuente, pero requiere evaluación cuando:

- aparece en las primeras 24 horas;
- progresa rápidamente;
- es intensa;
- se acompaña de mala alimentación, letargo o signos de hemólisis;
- persiste más de lo esperado;
- existe prematuridad u otro factor de riesgo.$$,
  13
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-14',
  $$Prioridad$$,
  $$La ictericia en las **primeras 24 horas** se considera anormal hasta demostrar lo contrario.

---

# 60. Fototerapia: cuidados de enfermería

Si está indicada:

- verificar indicación y equipo;
- maximizar superficie corporal expuesta según protocolo;
- proteger ojos cuando corresponda;
- vigilar temperatura;
- favorecer alimentación/hidratación;
- registrar bilirrubinas y horas de tratamiento;
- observar piel y eliminación;
- mantener interacción familiar.

La fototerapia no sustituye investigación de la causa.

---

# 61. Exposición perinatal al VIH

Un recién nacido de madre con VIH requiere un plan especializado para:

- profilaxis antirretroviral postnatal;
- pruebas virológicas en tiempos apropiados;
- seguimiento hematológico según régimen;
- profilaxis de infecciones oportunistas cuando corresponda;
- estrategia de alimentación conforme a política nacional y situación clínica;
- seguimiento en programa especializado.$$,
  14
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-15',
  $$Actualización$$,
  $$La OMS publicó recomendaciones actualizadas de manejo clínico del VIH en diciembre de 2025, incluyendo cambios en profilaxis postnatal y prevención de transmisión vertical.

No se deben memorizar ni aplicar dosis de antirretrovirales fuera del protocolo nacional/institucional vigente.

---

# 62. VIH: rol de enfermería

- verificar exposición perinatal;
- asegurar que se active el protocolo especializado;
- favorecer administración oportuna de profilaxis prescrita;
- documentar;
- apoyar adherencia familiar;
- coordinar citas y pruebas;
- aplicar confidencialidad y trato no discriminatorio;
- reforzar vacunación y seguimiento.

La condición de exposición **no equivale a infección confirmada**.

---

# 63. Sepsis neonatal y signos de peligro

Los recién nacidos pueden deteriorarse rápidamente.

Signos de alarma:

- mala alimentación;
- hipoactividad;
- fiebre o hipotermia;
- apnea;
- dificultad respiratoria;
- alteración del color;
- convulsiones;
- irritabilidad;
- distensión abdominal;
- vómitos;
- mala perfusión.

La ausencia de fiebre no excluye infección.

---

# 64. Otras alteraciones: hipoglucemia e hipotermia

**Hipoglucemia**
- identificar factores de riesgo;
- promover alimentación apropiada;
- medir glucosa cuando esté indicado;
- tratar según protocolo;
- reevaluar.

**Hipotermia**
- corregir gradualmente;
- buscar causa;
- evaluar glucosa y respiración;
- vigilar infección.

Pueden coexistir y potenciar deterioro.

---

# 65. Educación antes del alta

Enseñar a la familia:

- lactancia y señales de hambre;
- cuidado del cordón;
- higiene de manos;
- posición segura para dormir según recomendaciones vigentes;
- vacunación;
- tamizajes y citas;
- signos de alarma;
- cuándo regresar inmediatamente.

Signos que ameritan atención urgente incluyen dificultad respiratoria, mala alimentación, fiebre/hipotermia, convulsiones, hipoactividad marcada, cianosis central e ictericia precoz o intensa.

---

# 66. Marco de priorización para preguntas CICDE

Ante cualquier caso neonatal:

**1. ABC y temperatura**
- ¿respira?
- ¿perfunde?
- ¿está caliente?

**2. Identificar deterioro**
- apnea;
- cianosis central;
- bradicardia;
- convulsión;
- shock;
- dificultad respiratoria.

**3. Seguridad**
- identificación;
- medicación;
- glucosa;
- infección.

**4. Alimentación**
- ¿puede succionar de manera segura?
- ¿hay riesgo de aspiración?

**5. Referencia**
- actuar temprano ante prematuro inestable, cardiopatía, sepsis, dificultad respiratoria o malformación compleja.

---

# 67. Errores frecuentes de examen

1. Esperar el Apgar para iniciar reanimación.
2. Confundir acrocianosis con cianosis central.
3. Interpretar signos vitales sin considerar sueño, llanto y edad.
4. Asumir que un prematuro se vacuna por edad corregida.
5. Creer que un tamizaje positivo confirma diagnóstico.
6. Considerar toda ictericia como fisiológica.
7. Forzar alimentación oral a un neonato con dificultad respiratoria.
8. Suponer que un soplo aislado siempre equivale a cardiopatía crítica.
9. Suponer que pulsioximetría normal excluye todas las cardiopatías.
10. Interpretar exposición a VIH como infección confirmada.

---

# 68. Situaciones originales tipo examen$$,
  15
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-16',
  $$Caso 1 — Recién nacido estable$$,
  $$Recién nacido de término, llora, buen tono, coloración adecuada. ¿Cuál es la prioridad inicial?

**Respuesta:** secar, mantener calor, valorar respiración, favorecer piel con piel e iniciar lactancia cuando esté estable.

**Razonamiento:** no se separa de rutina a un recién nacido vigoroso para intervenciones que pueden realizarse manteniendo el contacto.

---$$,
  16
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-17',
  $$Caso 2 — Apgar y reanimación$$,
  $$Recién nacido apneico inmediatamente después del parto. Un estudiante propone esperar el Apgar del minuto.

**Respuesta:** incorrecto. La evaluación y reanimación deben comenzar inmediatamente según condición; el Apgar se registra después y no determina el inicio.

---$$,
  17
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-18',
  $$Caso 3 — Cianosis$$,
  $$Recién nacido con manos y pies azulados, lengua rosada, respiración tranquila.

**Respuesta:** valorar transición y temperatura; la acrocianosis aislada puede ser transitoria.

Si la lengua y mucosas fueran azules, la prioridad cambia a evaluación inmediata de oxigenación/cardiopulmonar.

---$$,
  18
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-19',
  $$Caso 4 — Mala succión$$,
  $$Recién nacido de 8 horas, hipotérmico y con mala succión.

**Respuesta:** priorizar estabilización térmica, valoración de glucosa según protocolo y búsqueda de causa; no limitarse a insistir con alimentación.

---$$,
  19
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-20',
  $$Caso 5 — Prematuro$$,
  $$Prematuro de 34 semanas estable. ¿La vacunación se calcula con edad corregida?

**Respuesta:** no. La norma panameña indica vacunación según edad cronológica y esquema nacional, salvo indicación específica.

---$$,
  20
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-21',
  $$Caso 6 — KMC$$,
  $$Recién nacido de bajo peso, clínicamente estable.

**Respuesta:** favorecer contacto piel con piel prolongado/KMC y leche materna, además del seguimiento especializado.

---$$,
  21
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-22',
  $$Caso 7 — Retracciones$$,
  $$Recién nacido con FR elevada, aleteo nasal, quejido y retracciones.

**Respuesta:** dificultad respiratoria. Priorizar soporte respiratorio, temperatura, monitorización y escalamiento de atención.

---$$,
  22
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-23',
  $$Caso 8 — Cardiopatía$$,
  $$Recién nacido de 30 horas, aparentemente sano, con saturación persistentemente baja y pulsos femorales débiles.

**Respuesta:** sospechar cardiopatía congénita crítica u otra causa de hipoxemia. Requiere evaluación inmediata; pulsioximetría es tamizaje, no diagnóstico.

---$$,
  23
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-24',
  $$Caso 9 — Ictericia precoz$$,
  $$Ictericia visible a las 10 horas de vida.

**Respuesta:** no asumir fisiológica. Evaluar hiperbilirrubinemia patológica/hemólisis y obtener estudios según protocolo.

---$$,
  24
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-25',
  $$Caso 10 — Fototerapia$$,
  $$Durante fototerapia, el recién nacido está muy abrigado y la superficie expuesta es mínima.

**Respuesta:** corregir la técnica según protocolo, mantener termorregulación sin impedir la exposición terapéutica y vigilar hidratación/temperatura.

---$$,
  25
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-26',
  $$Caso 11 — VIH$$,
  $$Madre con VIH; familiar pregunta si el bebé “ya tiene sida”.

**Respuesta:** explicar que exposición no equivale a infección confirmada. El neonato necesita profilaxis y pruebas virológicas según protocolo especializado.

---$$,
  26
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-27',
  $$Caso 12 — Vacunas al nacer$$,
  $$¿Qué vacunas forman parte del esquema neonatal panameño 2026?

**Respuesta:** BCG y hepatitis B; hepatitis B se recomienda en las primeras 12 horas.

---$$,
  27
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-28',
  $$Caso 13 — Tamizaje metabólico$$,
  $$Tamizaje neonatal resulta positivo.

**Respuesta:** coordinar confirmación diagnóstica y seguimiento; no etiquetar al niño con una enfermedad hasta completar evaluación.

---$$,
  28
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-29',
  $$Caso 14 — Sepsis$$,
  $$Recién nacido con hipoactividad, rechazo al alimento e hipotermia, sin fiebre.

**Respuesta:** sospechar enfermedad grave, incluida sepsis. La ausencia de fiebre no descarta infección neonatal.

---

# 69. Fuentes y validación$$,
  29
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-30',
  $$Fuentes rectoras CICDE$$,
  $$1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen por Competencia de Profesionales de Enfermería*, tercera edición, Panamá, 2026.
2. **Hockenberry, M.; Rodgers, C.; Wilson, D.** *Wong. Enfermería Pediátrica*, 10.ª edición, Elsevier. El CICDE registra 2020; la ficha editorial de Elsevier ubica la edición española en 2019. Se conserva la discrepancia de metadatos sin alterar el alcance.
3. **MINSA.** *Manual de Normas y Procedimientos. Programa Ampliado de Inmunizaciones*, 2012. Se utiliza como bibliografía CICDE histórica, pero para calendario se prioriza el esquema 2026.
4. **Posada Díaz, A.; Gómez Ramírez, J.; Ramírez Gómez, H.** *El Niño Sano*, Editorial Médica Panamericana, 2005.$$,
  30
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-31',
  $$Panamá — fuentes oficiales actuales$$,
  $$5. **MINSA. Resolución 306 de 5 de junio de 2024.** Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años.  
   https://www.minsa.gob.pa/normatividad/resolucion-ndeg-306-de-miercoles-05-de-junio-de-2024-que-aprueba-las-normas-tecnicas-y

6. **MINSA. Esquema Nacional de Vacunación 2026.**  
   https://minsa.gob.pa/sites/default/files/programas/esquema_nacional_de_vacunacion_2026_1.pdf

7. **MINSA. Programa Nacional de Tamizaje Neonatal.**  
   https://www.minsa.gob.pa/node/5863

8. **MINSA. Panamá fortalece la promoción de la lactancia materna**, 31 julio 2026.  
   https://minsa.gob.pa/noticia/panama-fortalece-la-promocion-de-la-lactancia-materna-para-garantizar-un-mejor-inicio-de

9. **MINSA. Inicio de aplicación de nirsevimab para protección frente al VRS**, 31 agosto 2026.  
   https://minsa.gob.pa/noticia/minsa-inicia-aplicacion-de-anticuerpo-monoclonal-para-fortalecer-la-proteccion-de-recien

10. **MINSA. Decreto Ejecutivo 24 de 13 de octubre de 2025**, reglamentación del marco jurídico para ITS y VIH.  
    https://www.minsa.gob.pa/normatividad/decreto-ejecutivo-ndeg-24-de-lunes-13-de-octubre-de-2025-que-reglamenta-la-ley-40-de-14$$,
  31
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-32',
  $$Fuentes internacionales complementarias$$,
  $$11. **WHO. Essential Newborn Care Course, second edition**, 2025.  
    https://www.who.int/publications/i/item/9789240112698

12. **WHO. Essential newborn care.**  
    https://www.who.int/teams/maternal-newborn-child-adolescent-health-and-ageing/newborn-health/essential-newborn-care

13. **WHO. Recommendations for care of the preterm or low-birth-weight infant**, 2022.  
    https://www.who.int/publications/i/item/9789240058262

14. **WHO. Kangaroo mother care: a clinical practice guide**, 2025.  
    https://www.who.int/publications/m/item/kangaroo-mother-care--a-clinical-practice-guide

15. **WHO. Updated recommendations on HIV clinical management**, 2025.  
    https://www.who.int/publications/i/item/9789240119468

16. **CDC. Clinical Screening and Diagnosis for Critical Congenital Heart Defects**, actualización 2025/2026.  
    https://www.cdc.gov/heart-defects/hcp/screening/index.html

17. **ACOG/AAP. The Apgar Score**, reafirmado 2025.  
    https://www.acog.org/clinical/clinical-guidance/committee-opinion/articles/2015/10/the-apgar-score

18. **MedlinePlus/NLM. Enfermedad hemolítica del recién nacido**, revisión 2025.  
    https://medlineplus.gov/spanish/ency/article/001298.htm

19. **WHO. Development of updated guidelines on newborn resuscitation at birth**, 2026.  
    https://www.who.int/news-room/articles-detail/who-announces-the-development-of-updated-guidelines-on-newborn-resuscitation-at-birth

---

# 70. Actualizaciones Panamá 2026 que no deben confundirse$$,
  32
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-33',
  $$VRS / nirsevimab$$,
  $$En agosto de 2026 MINSA inició la aplicación de **nirsevimab** a recién nacidos elegibles, inicialmente enfocado en recién nacidos de madres sin vacunación materna contra VRS.

Esto se documenta como actualización nacional contemporánea. **Nirsevimab es un anticuerpo monoclonal, no una vacuna.**

No sustituye BCG ni hepatitis B del esquema neonatal.$$,
  33
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-02-34',
  $$Calendario PAI$$,
  $$La fuente de referencia para edades y vacunas es el **Esquema Nacional de Vacunación 2026**, no el manual PAI 2012 citado históricamente por CICDE.

---

# 71. Control de calidad

Este paquete fue revisado con las siguientes reglas:

- alcance comparado con CICDE 2026;
- bibliografía CICDE preservada;
- normativa panameña actual priorizada cuando reemplaza material histórico;
- calendario de vacunación actualizado a 2026;
- recomendaciones OMS 2025–2026 incorporadas cuando son relevantes;
- no se presentan guías en desarrollo como si ya fueran norma vigente;
- pulsioximetría CCHD se presenta como referencia complementaria internacional, no como mandato panameño no verificado;
- no se incluyen dosis de antirretrovirales neonatales fuera del protocolo;
- no se equipara exposición a VIH con infección confirmada;
- no se equipara tamizaje positivo con diagnóstico;
- no se usa Apgar como criterio para iniciar reanimación;
- situaciones de examen son originales y no reproducen bancos de preguntas protegidos.

---

# 72. Estado para integración

**Estado:** `REVIEW`

Motivo:

- contenido y fuentes fueron sometidos a validación documental y académica;
- el contenido todavía no representa una revisión clínica humana con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- fuentes no deben marcarse `verified=true` por una revisión realizada por IA.

**Cobertura CICDE PEDS-02: 9/9 subtemas explícitos.**

**Situaciones originales tipo examen: 14.**$$,
  34
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-1',
  $$Valoración integral y cuidados de enfermería al niño y adolescente$$,
  $$**Área:** Enfermería Pediátrica  
**Código:** PEDS-03  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión documental:** 2026-09-11

---

# 1. Alcance oficial CICDE

El lineamiento CICDE 2026 incluye expresamente el tema **“Valoración integral y cuidados de enfermería al niño y adolescente”** y exige estudiar:

1. Valoración física y funcional del niño y adolescente.
2. Medición e interpretación de signos vitales.
3. Técnicas antropométricas.
4. Alimentación y valoración nutricional.
5. Utilización de instrumentos y escalas de valoración pediátrica.
6. Identificación de necesidades y problemas prioritarios.
7. Participación de la familia en el cuidado.

Este paquete conserva íntegramente esos siete puntos y los desarrolla con enfoque de enfermería, seguridad, desarrollo, derechos, comunicación y priorización.

Para Panamá se priorizan las **Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años (Resolución 306 de 2024)** y las **Normas Técnicas y Administrativas del Programa Nacional de Salud Integral de Adolescentes (Resolución 371 de 2024)**. Se complementan con referencias OMS vigentes para crecimiento, nutrición y calidad de la atención adolescente.

---

# 2. Objetivos de aprendizaje

Al finalizar el tema, el estudiante debe ser capaz de:

1. Realizar una valoración pediátrica integral adaptada a la edad y etapa del desarrollo.
2. Diferenciar observación inicial, valoración primaria, historia dirigida y examen físico.
3. Medir e interpretar signos vitales considerando edad, estado emocional, sueño, fiebre, dolor y actividad.
4. Identificar signos de deterioro respiratorio, circulatorio o neurológico.
5. Ejecutar técnicas antropométricas correctas y reconocer errores frecuentes de medición.
6. Interpretar crecimiento mediante patrones y referencias apropiadas para la edad.
7. Valorar alimentación, ingesta, hábitos y riesgo nutricional.
8. Utilizar escalas pediátricas de forma apropiada sin sustituir el juicio clínico.
9. Establecer prioridades de enfermería utilizando ABCDE, seguridad y riesgo.
10. Incorporar a la familia como fuente de información y participante del cuidado.
11. Respetar progresivamente la autonomía, privacidad y participación del adolescente.
12. Reconocer cuándo una alteración requiere referencia o evaluación urgente.

---

# 3. Principios de la valoración pediátrica

La valoración del niño no es una “valoración de adulto en pequeño”.

Debe considerar:

- edad cronológica;
- edad corregida cuando corresponda en prematuros;
- etapa del desarrollo;
- capacidad de comunicación;
- dependencia del cuidador;
- contexto familiar;
- respuesta al ambiente;
- cambios rápidos de condición.

En pediatría, **la tendencia clínica suele ser más importante que un valor aislado**.

---

# 4. Preparación antes del contacto

Antes de iniciar:

- higiene de manos;
- confirmar identidad;
- revisar motivo de consulta;
- preparar equipo apropiado por tamaño;
- adaptar el ambiente;
- explicar al niño y familia qué se hará;
- identificar riesgos inmediatos;
- observar al niño antes de tocarlo.

Una valoración apresurada puede alterar frecuencia cardiaca, respiratoria y conducta.

---

# 5. Observación desde la puerta

Antes de manipular al niño se observa:

- apariencia;
- interacción;
- tono;
- postura;
- llanto o lenguaje;
- trabajo respiratorio;
- color;
- movimientos;
- respuesta al cuidador.

Este “primer vistazo” puede revelar deterioro antes de obtener números.

---

# 6. Triángulo de Evaluación Pediátrica como marco conceptual

El **Pediatric Assessment Triangle (PAT)** organiza una impresión inicial rápida en tres componentes:

- **apariencia**;
- **trabajo respiratorio**;
- **circulación a la piel**.

No reemplaza la valoración ABCDE ni el examen completo. Su utilidad es reconocer rápidamente si un niño parece estable o potencialmente enfermo.

La AHA 2025 continúa utilizando este marco dentro de la evaluación pediátrica inicial.

---

# 7. Apariencia

Valorar:

- tono;
- interacción;
- consolabilidad;
- mirada;
- habla o llanto;
- respuesta al entorno.

Una alteración marcada de apariencia puede indicar hipoxia, shock, hipoglucemia, sepsis, lesión neurológica u otra enfermedad grave.

---

# 8. Trabajo respiratorio

Observar:

- frecuencia;
- profundidad;
- retracciones;
- aleteo nasal;
- quejido;
- uso de músculos accesorios;
- posición de trípode;
- estridor;
- sibilancias audibles;
- pausas/apnea.

Un niño puede mantener saturación aparentemente aceptable y aun así mostrar trabajo respiratorio significativo.

---

# 9. Circulación a la piel

Observar:

- palidez;
- moteado;
- cianosis;
- temperatura periférica;
- llenado capilar, interpretado en contexto.

La perfusión también debe correlacionarse con pulsos, estado mental, presión arterial y diuresis cuando estén disponibles.

---

# 10. Valoración primaria ABCDE

**A – Airway / vía aérea**
- permeabilidad;
- sonidos anormales;
- secreciones;
- capacidad de hablar/llorar.

**B – Breathing / respiración**
- frecuencia;
- esfuerzo;
- expansión;
- auscultación;
- saturación si está indicada.

**C – Circulation / circulación**
- pulso;
- perfusión;
- piel;
- presión arterial;
- hemorragia.

**D – Disability / estado neurológico**
- nivel de conciencia;
- pupilas;
- glucosa si está indicada;
- convulsiones.

**E – Exposure / exposición**
- temperatura;
- lesiones;
- exantemas;
- trauma;
- examen completo preservando privacidad y temperatura.

---

# 11. Historia pediátrica dirigida

Incluye según edad:

- motivo de consulta;
- inicio y evolución;
- antecedentes prenatales/perinatales;
- enfermedades previas;
- hospitalizaciones;
- cirugías;
- alergias;
- medicamentos;
- vacunación;
- alimentación;
- crecimiento y desarrollo;
- eliminación;
- sueño;
- escuela;
- actividad;
- entorno familiar/social;
- exposición a humo, sustancias o riesgos;
- salud sexual y mental en adolescentes cuando corresponda.

---

# 12. Comunicación con lactantes y niños pequeños

Principios:

- permitir cercanía del cuidador;
- observar antes de tocar;
- usar lenguaje simple;
- realizar procedimientos menos invasivos primero;
- utilizar juego o distracción;
- evitar amenazas;
- ofrecer elecciones pequeñas cuando sea posible.

El cuidador puede aportar cambios de conducta que no son evidentes para el profesional.

---

# 13. Comunicación con escolares

El escolar puede:

- describir síntomas;
- colaborar con el examen;
- comprender explicaciones simples;
- expresar miedos.

Enfermería debe hablar directamente con el niño además de hablar con la familia.

---

# 14. Comunicación con adolescentes

La atención debe ser:

- respetuosa;
- no discriminatoria;
- centrada en derechos;
- apropiada al desarrollo;
- participativa.

Las normas OMS 2025 de calidad para servicios de adolescentes mantienen como ejes la participación, competencias del personal, atención basada en evidencia, entorno acogedor, participación familiar/comunitaria y no discriminación.

La confidencialidad se maneja conforme a legislación, riesgo y políticas locales; no se promete confidencialidad absoluta cuando existe peligro grave o deber legal de protección.

---

# 15. Examen físico pediátrico: enfoque de cabeza a pies

Una secuencia práctica:

1. estado general;
2. piel;
3. cabeza y cuello;
4. ojos, oídos, nariz y boca;
5. respiratorio;
6. cardiovascular;
7. abdomen;
8. genitourinario según indicación;
9. musculoesquelético;
10. neurológico;
11. desarrollo y función.

La secuencia puede modificarse para preservar cooperación.

---

# 16. Valoración funcional

Además del examen anatómico se pregunta:

- ¿qué puede hacer el niño normalmente?
- ¿qué dejó de poder hacer?
- ¿come y bebe?
- ¿camina o juega como antes?
- ¿duerme?
- ¿asiste a la escuela?
- ¿tolera actividad?
- ¿requiere ayuda para autocuidado?

La pérdida aguda de función puede ser más significativa que un hallazgo aislado.

---

# 17. Dolor como parte de la valoración

El dolor debe:

- evaluarse;
- documentarse;
- tratarse;
- reevaluarse.

La ausencia de verbalización no significa ausencia de dolor.

Se consideran:

- conducta;
- expresión facial;
- postura;
- llanto;
- signos fisiológicos;
- autoinforme cuando es posible.

---

# 18. Selección de escala de dolor

La herramienta depende de:

- edad;
- desarrollo;
- capacidad de comunicación;
- estado neurológico;
- contexto clínico.

Ejemplos:

- **FLACC**: observacional, útil cuando el niño no puede autoinformar adecuadamente;
- **caras de Wong-Baker**: herramienta de autoinforme para quien comprende su uso;
- **escala numérica**: en niños mayores/adolescentes capaces de cuantificar;
- escalas específicas de UCI/neonatología según institución.

No se debe “forzar” una escala inadecuada para la edad.

---

# 19. Nivel de conciencia

Puede describirse mediante:

- alerta;
- respuesta a voz;
- respuesta al dolor;
- no responde;

o mediante una escala neurológica apropiada.

Cambios de conducta, irritabilidad extrema, somnolencia progresiva o dificultad para despertar son signos de alarma.

---

# 20. Escala de Glasgow pediátrica

La escala de Glasgow puede adaptarse a la respuesta verbal/motora del niño pequeño.

Debe utilizarse junto con:

- pupilas;
- simetría motora;
- glucosa cuando corresponda;
- mecanismo de lesión;
- evolución.

Una disminución del estado de conciencia requiere evaluación prioritaria.

---

# 21. Signos vitales: regla central

Los signos vitales pediátricos son **dependientes de la edad**.

Nunca debe interpretarse:

- frecuencia cardiaca;
- frecuencia respiratoria;
- presión arterial;

usando rangos de adulto para todas las edades.

También cambian con:

- fiebre;
- llanto;
- dolor;
- actividad;
- medicamentos;
- sueño;
- hidratación.

---

# 22. Frecuencia respiratoria: técnica

Para mayor precisión:

- observar antes de manipular;
- contar con el niño tranquilo cuando sea posible;
- valorar un minuto completo en lactantes o respiración irregular;
- observar profundidad y patrón;
- correlacionar con esfuerzo respiratorio.

La frecuencia sola no define gravedad.

---

# 23. Frecuencia cardiaca: técnica

Puede medirse mediante:

- pulso apical;
- pulso periférico adecuado a la edad;
- monitor, verificando correlación clínica.

En lactantes y niños pequeños el pulso apical puede ser preferible cuando se requiere exactitud.

Registrar:

- frecuencia;
- ritmo;
- fuerza;
- condición del niño durante la medición.

---

# 24. Presión arterial: tamaño del manguito

Un manguito inadecuado altera la lectura.

Principios:

- elegir tamaño apropiado al brazo;
- colocar correctamente;
- mantener extremidad a nivel adecuado;
- repetir una lectura inesperada;
- interpretar por edad/talla/sexo y situación clínica cuando corresponda.

Un manguito demasiado pequeño tiende a sobreestimar la presión.

---

# 25. Hipotensión pediátrica

La hipotensión puede ser un signo tardío de shock en niños.

Por eso deben detectarse antes:

- taquicardia inapropiada;
- pulsos débiles;
- llenado capilar prolongado;
- piel fría/moteada;
- alteración de conciencia;
- oliguria;
- aumento del trabajo respiratorio.

No esperar hipotensión para reconocer mala perfusión.

---

# 26. Temperatura

La temperatura debe interpretarse con:

- edad;
- método de medición;
- ambiente;
- vacunación reciente;
- enfermedad;
- inmunocompromiso.

Los sitios y dispositivos aceptados dependen de edad y política institucional.

En lactantes pequeños, fiebre o hipotermia pueden requerir evaluación urgente.

---

# 27. Saturación de oxígeno

La pulsioximetría es útil, pero puede alterarse por:

- movimiento;
- mala perfusión;
- esmalte/artefacto según dispositivo;
- sensor incorrecto;
- posición inadecuada.

Siempre correlacionar con color, respiración, perfusión y condición clínica.

---

# 28. Tendencias y reevaluación

Una sola medición puede ser engañosa.

Ejemplo:

- HR alta por llanto que disminuye al calmarse;
- FR creciente a pesar de reposo;
- perfusión que empeora;
- presión arterial que desciende;
- dolor que no mejora.

La reevaluación convierte datos aislados en información clínica.

---

# 29. Antropometría: propósito

Permite valorar:

- crecimiento;
- estado nutricional;
- tendencia;
- respuesta a intervenciones;
- riesgo de malnutrición.

Incluye según edad:

- peso;
- longitud/talla;
- perímetro cefálico;
- IMC para la edad;
- otros indicadores específicos.

---

# 30. Peso: técnica

Principios:

- báscula calibrada;
- superficie estable;
- mínima ropa posible según edad/contexto;
- sin objetos adicionales;
- registrar unidad;
- comparar con mediciones previas.

En lactantes pequeños se utiliza balanza apropiada y seguridad constante.

---

# 31. Longitud y talla

**Longitud**: usualmente en menores de 2 años, en posición recumbente.

**Talla**: en niños capaces de mantenerse de pie correctamente.

Errores frecuentes:

- calzado;
- cabeza mal posicionada;
- rodillas flexionadas;
- talones separados;
- equipo no nivelado.

---

# 32. Perímetro cefálico

Especialmente relevante en lactantes y primeros años.

Se mide el máximo perímetro occipitofrontal con cinta no extensible.

Interpretar:

- tendencia;
- edad;
- sexo;
- contexto clínico.

Un único valor anormal debe confirmarse antes de concluir.

---

# 33. Patrones OMS 0–5 años

La OMS mantiene los **Patrones de Crecimiento Infantil 2006** para 0–5 años.

Incluyen:

- peso para edad;
- longitud/talla para edad;
- peso para longitud/talla;
- IMC para edad;
- perímetro cefálico para edad.

Describen cómo deberían crecer los niños bajo condiciones óptimas y pueden aplicarse internacionalmente.

---

# 34. Referencia OMS 5–19 años

Para 5–19 años, OMS utiliza la **Referencia de Crecimiento 2007**.

Indicadores disponibles:

- talla para edad;
- IMC para edad;
- peso para edad solo hasta los 10 años.

La OMS explica que peso-para-edad no se utiliza después de los 10 años porque durante el estirón puberal no distingue adecuadamente entre talla y masa corporal.

---

# 35. IMC pediátrico

Fórmula:

**IMC = peso (kg) / talla² (m²)**

En niños y adolescentes no debe interpretarse con los puntos de corte fijos de adultos.

Debe expresarse respecto de:

- edad;
- sexo;
- patrón/referencia seleccionada.

Para 5–19 años, OMS interpreta IMC-para-edad mediante puntuaciones Z.

---

# 36. Interpretación OMS del IMC 5–19 años

Referencia OMS:

- delgadez: < −2 DE;
- delgadez severa: < −3 DE;
- sobrepeso: > +1 DE;
- obesidad: > +2 DE.

Estas categorías son herramientas de valoración poblacional y clínica; el diagnóstico integral requiere historia, examen y contexto.

---

# 37. Curvas: interpretar trayectoria, no solo percentil

Una curva de crecimiento debe leerse longitudinalmente.

Alertas:

- cruce sostenido de canales;
- desaceleración;
- pérdida de peso;
- talla que deja de progresar;
- IMC que cambia rápidamente;
- discordancia entre parámetros.

No diagnosticar solo por una medición aislada.

---

# 38. Valoración nutricional integral

Incluye:

- antropometría;
- patrón de crecimiento;
- dieta habitual;
- apetito;
- dificultades de alimentación;
- alergias/intolerancias;
- síntomas gastrointestinales;
- condiciones crónicas;
- seguridad alimentaria;
- actividad física;
- sueño;
- contexto familiar.

---

# 39. Historia dietética

Preguntar de forma no juzgadora:

- qué come y bebe;
- horarios;
- tamaño aproximado de porciones;
- bebidas azucaradas;
- frutas y vegetales;
- proteínas;
- ultraprocesados;
- suplementos;
- comidas escolares;
- restricciones;
- dificultades económicas o de acceso.

---

# 40. Alimentación saludable 2026

La OMS 2026 resume cuatro principios de una alimentación saludable:

- adecuación;
- equilibrio;
- moderación;
- diversidad.

Los hábitos de infancia y adolescencia pueden persistir en la vida adulta.

La educación debe centrarse en patrones sostenibles, no en estigmatizar el peso.

---

# 41. Lactancia y alimentación complementaria

En lactantes:

- valorar lactancia;
- agarre y transferencia;
- frecuencia;
- crecimiento;
- hidratación;
- introducción de alimentación complementaria según edad.

La alimentación complementaria debe ser segura, suficiente, progresiva y culturalmente apropiada.

---

# 42. Malnutrición

Incluye:

- desnutrición;
- retraso de crecimiento;
- emaciación;
- deficiencias de micronutrientes;
- sobrepeso;
- obesidad.

Pueden coexistir deficiencias nutricionales con sobrepeso.

---

# 43. Signos clínicos de riesgo nutricional

Buscar:

- pérdida de peso;
- edema;
- debilidad;
- palidez;
- cambios de piel/cabello;
- retraso de crecimiento;
- dificultades de deglución;
- diarrea persistente;
- vómitos;
- baja ingesta;
- pubertad alterada;
- signos de trastorno de la conducta alimentaria.

---

# 44. Adolescente: valoración nutricional sensible

Evitar:

- comentarios estigmatizantes;
- suposiciones basadas solo en apariencia;
- pesar sin explicar;
- discutir peso delante de terceros sin necesidad.

Explorar:

- imagen corporal;
- restricción;
- atracones;
- purgas;
- ejercicio compulsivo;
- uso de suplementos;
- síntomas menstruales cuando corresponda.

---

# 45. Instrumentos de valoración: principio general

Una escala:

- estandariza observación;
- facilita comunicación;
- puede ayudar a detectar riesgo;
- permite seguimiento.

Pero **ninguna escala sustituye la valoración clínica ni la reevaluación**.

---

# 46. Escalas de dolor

La selección depende de capacidad del niño.

En preguntas de examen:

- no verbal / desarrollo limitado → escala observacional;
- niño capaz de señalar una representación de intensidad → escala de caras apropiada;
- adolescente capaz de cuantificar → escala numérica.

La herramienta debe explicarse antes de usarla.

---

# 47. Escalas de riesgo y deterioro

Los hospitales pueden utilizar sistemas de **Pediatric Early Warning Score/System (PEWS)**.

Los componentes suelen incluir variables como:

- conducta/estado neurológico;
- respiración;
- circulación;
- signos vitales.

No existe una única versión universal. El estudiante debe seguir la herramienta institucional y nunca retrasar respuesta clínica porque “el puntaje aún no es alto”.

---

# 48. Escalas de desarrollo

El tamizaje del desarrollo:

- identifica riesgo;
- no establece por sí solo diagnóstico;
- debe utilizar instrumentos validados para edad/población cuando estén disponibles;
- requiere referencia si es anormal o existen preocupaciones significativas.

La vigilancia clínica continúa aunque el tamizaje previo haya sido normal.

---

# 49. Valoración del riesgo de caídas

Debe considerar:

- edad;
- desarrollo;
- movilidad;
- medicamentos;
- estado neurológico;
- sedación;
- dispositivos;
- entorno.

La prevención se adapta al riesgo y a la participación familiar.

---

# 50. Riesgo de lesión por presión

Niños inmóviles o críticamente enfermos también pueden desarrollar lesiones por presión.

Valorar:

- movilidad;
- perfusión;
- humedad;
- dispositivos;
- nutrición;
- prominencias óseas;
- fijaciones.

Las escalas institucionales son apoyo, no sustituto de inspección frecuente.

---

# 51. Valoración familiar

La familia aporta información sobre:

- conducta habitual;
- alimentación;
- lenguaje;
- desarrollo;
- medicación;
- síntomas;
- respuesta previa a enfermedad.

Preguntar:

**“¿Qué es diferente hoy respecto a cómo es normalmente?”**

puede revelar deterioro temprano.

---

# 52. Cuidado centrado en niño y familia

Principios:

- respeto;
- información;
- participación;
- colaboración;
- decisiones compartidas apropiadas a edad;
- reconocimiento de fortalezas familiares.

La participación no significa transferir al familiar responsabilidades profesionales.

---

# 53. Presencia familiar durante procedimientos

Cuando sea seguro y apropiado:

- explicar el procedimiento;
- definir cómo puede ayudar;
- preparar emocionalmente;
- permitir acompañamiento;
- reevaluar si la presencia dificulta seguridad.

Nunca obligar a un familiar a participar en un procedimiento que no desea presenciar.

---

# 54. Hospitalización y respuesta del niño

Las respuestas varían con:

- edad;
- desarrollo;
- experiencias previas;
- dolor;
- separación;
- ambiente;
- apoyo familiar.

Pueden aparecer:

- regresión;
- miedo;
- irritabilidad;
- alteraciones del sueño;
- resistencia.

El cuidado debe minimizar trauma evitable.

---

# 55. Privacidad y dignidad

Durante examen y procedimientos:

- cubrir áreas no evaluadas;
- limitar exposición;
- explicar antes de tocar;
- pedir permiso/colaboración acorde al desarrollo;
- usar acompañante institucional cuando corresponda;
- respetar identidad y preferencias.

En adolescentes, la privacidad adquiere especial importancia.

---

# 56. Valoración psicosocial del adolescente

Además de lo físico, explorar apropiadamente:

- hogar;
- escuela;
- relaciones;
- actividad;
- sueño;
- alimentación;
- salud mental;
- consumo de sustancias;
- seguridad/violencia;
- sexualidad;
- redes sociales y entorno digital.

No convertir la entrevista en interrogatorio moral.

---

# 57. Seguridad y protección infantil

Hallazgos que pueden requerir activación de protocolos:

- lesiones incompatibles con el relato/desarrollo;
- múltiples lesiones de distintas edades;
- retraso inexplicable en buscar atención;
- miedo extremo al cuidador;
- abandono;
- violencia sexual;
- negligencia grave.

La prioridad es la seguridad del niño y el cumplimiento del marco legal/institucional.

---

# 58. Identificación de problemas prioritarios

Orden de prioridad:

1. amenaza inmediata a vía aérea;
2. respiración ineficaz;
3. perfusión/shock/hemorragia;
4. alteración neurológica;
5. seguridad;
6. dolor severo;
7. hidratación/nutrición;
8. necesidades no urgentes.

No priorizar por “diagnóstico más llamativo”, sino por riesgo fisiológico.

---

# 59. Signos generales de peligro

En un niño enfermo, son particularmente preocupantes:

- incapacidad para beber o alimentarse;
- vómitos persistentes de todo;
- convulsiones;
- letargo o inconsciencia;
- dificultad respiratoria grave;
- cianosis;
- mala perfusión;
- deshidratación grave.

El enfoque IMCI/AIEPI utiliza signos clínicos para reconocer necesidad de tratamiento y referencia.

---

# 60. Deshidratación: valoración

Evaluar:

- estado mental;
- sed;
- mucosas;
- lágrimas;
- ojos;
- llenado capilar;
- pulsos;
- diuresis;
- peso;
- historia de pérdidas;
- tolerancia oral.

En lactantes, la evolución puede ser rápida.

---

# 61. Perfusión y shock

Signos tempranos pueden incluir:

- taquicardia;
- extremidades frías;
- pulsos periféricos débiles;
- alteración de conciencia;
- llenado capilar prolongado;
- oliguria.

La presión arterial puede mantenerse hasta fases avanzadas.

---

# 62. Respiración: prioridad clínica

Un niño con:

- retracciones progresivas;
- agotamiento;
- disminución del nivel de conciencia;
- cianosis;
- “pecho silencioso”;
- apnea;

requiere respuesta inmediata, aunque una lectura aislada de saturación parezca aceptable.

---

# 63. Fiebre: valorar al niño, no solo el número

La gravedad depende de:

- edad;
- estado general;
- inmunización;
- comorbilidades;
- duración;
- foco;
- signos de sepsis.

Un niño activo y perfundido no se valora igual que uno letárgico y moteado con la misma temperatura.

---

# 64. Medicamentos: peso y seguridad

Antes de administrar:

- verificar peso actual en kg;
- indicación;
- dosis prescrita;
- concentración;
- cálculo;
- máximo permitido cuando aplique;
- alergias;
- vía;
- horario;
- doble verificación institucional para medicamentos de alto riesgo.

**Nunca calcular dosis pediátrica usando libras como si fueran kilogramos.**

---

# 65. Integración de hallazgos

La valoración debe terminar con una síntesis:

- problema principal;
- riesgos;
- datos que lo respaldan;
- prioridad;
- intervención;
- reevaluación;
- necesidad de escalar/referir.

Recolectar datos sin interpretarlos no completa el proceso enfermero.

---

# 66. Documentación

Registrar:

- hora;
- condición;
- signos vitales;
- dolor;
- antropometría;
- hallazgos;
- escala utilizada;
- intervención;
- respuesta;
- educación;
- comunicación con equipo/familia.

Evitar etiquetas vagas como “bien” o “mal” sin datos objetivos.

---

# 67. Errores frecuentes de examen

1. Usar rangos de adulto para un lactante.
2. Tomar signos vitales inmediatamente después del llanto y no reevaluar.
3. Medir presión con manguito demasiado pequeño.
4. Interpretar una curva de crecimiento con una sola medición.
5. Usar IMC adulto en niños.
6. Confundir tamizaje con diagnóstico.
7. Elegir una escala de dolor que el niño no comprende.
8. Esperar hipotensión para reconocer shock.
9. Ignorar la preocupación del cuidador.
10. Priorizar alimentación antes que vía aérea/respiración en un niño inestable.
11. Prometer confidencialidad absoluta al adolescente sin considerar riesgo.
12. Interpretar una puntuación de escala sin observar al paciente.

---

# 68. Situaciones originales tipo examen$$,
  1
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-2',
  $$Caso 1 — Niño que llora$$,
  $$Niño de 3 años llega llorando. La frecuencia cardiaca está elevada.

**Respuesta:** calmarlo cuando sea posible y repetir la medición; interpretar el valor en contexto.

**Razonamiento:** llanto, dolor y miedo pueden elevar la frecuencia.

---$$,
  2
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-3',
  $$Caso 2 — Manguito de presión$$,
  $$Escolar con presión inesperadamente elevada. El manguito utilizado es claramente pequeño.

**Respuesta:** repetir con manguito apropiado antes de interpretar el resultado.

---$$,
  3
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-4',
  $$Caso 3 — Dificultad respiratoria$$,
  $$Niño con retracciones intensas y agotamiento, pero saturación de 94 %.

**Respuesta:** priorizar evaluación y soporte respiratorio. La saturación aislada no descarta deterioro.

---$$,
  4
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-5',
  $$Caso 4 — Crecimiento$$,
  $$Un niño cruza progresivamente varios canales de peso hacia abajo.

**Respuesta:** requiere valoración nutricional y clínica; la tendencia es más importante que un percentil aislado.

---$$,
  5
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-6',
  $$Caso 5 — Adolescente$$,
  $$Adolescente de 15 años responde poco porque el cuidador contesta todo.

**Respuesta:** incluir al adolescente directamente y ofrecer espacio apropiado de entrevista privada conforme a política y seguridad.

---$$,
  6
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-7',
  $$Caso 6 — Dolor no verbal$$,
  $$Niño con discapacidad del desarrollo no puede usar escala numérica.

**Respuesta:** seleccionar una herramienta observacional apropiada y correlacionarla con conducta habitual y cuidador.

---$$,
  7
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-8',
  $$Caso 7 — Shock$$,
  $$Niño con taquicardia, extremidades frías, pulsos débiles y somnolencia, pero presión aún normal.

**Respuesta:** sospechar perfusión comprometida/shock compensado; no esperar hipotensión.

---$$,
  8
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-9',
  $$Caso 8 — Antropometría$$,
  $$Niña de 8 años se pesa con zapatos, mochila y abrigo.

**Respuesta:** la medición no es comparable; repetir con técnica estandarizada.

---$$,
  9
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-10',
  $$Caso 9 — IMC$$,
  $$Adolescente con IMC de 25 kg/m². Un estudiante lo clasifica usando categorías de adulto.

**Respuesta:** incorrecto. En pediatría debe interpretarse respecto a edad, sexo y referencia correspondiente.

---$$,
  10
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-11',
  $$Caso 10 — Familia$$,
  $$La madre dice “no está como siempre” aunque los signos vitales iniciales parecen aceptables.

**Respuesta:** tomar la preocupación seriamente, reevaluar y buscar cambios funcionales/conductuales.

---$$,
  11
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-12',
  $$Caso 11 — Tamizaje$$,
  $$Una escala de desarrollo resulta alterada.

**Respuesta:** indica riesgo y necesidad de evaluación/seguimiento; no equivale por sí sola a diagnóstico definitivo.

---$$,
  12
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-13',
  $$Caso 12 — Prioridad$$,
  $$Niño con vómitos, dolor abdominal y respiración trabajosa.

**Respuesta:** primero valorar ABC y estabilidad respiratoria/circulatoria antes de centrarse en el diagnóstico abdominal.

---$$,
  13
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-14',
  $$Caso 13 — Confidencialidad$$,
  $$Adolescente pregunta si todo lo que diga será secreto.

**Respuesta:** explicar privacidad y sus límites de manera clara, incluyendo situaciones de riesgo grave o deber de protección.

---$$,
  14
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-15',
  $$Caso 14 — Medicación$$,
  $$Prescripción en mg/kg. El peso está registrado solo en libras.

**Respuesta:** convertir/verificar correctamente el peso en kilogramos antes del cálculo y realizar las verificaciones de seguridad.

---

# 69. Fuentes y validación$$,
  15
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-16',
  $$Fuentes rectoras CICDE$$,
  $$1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen por Competencia de Profesionales de Enfermería*, tercera edición, Panamá, 2026.
2. **Hockenberry, M.; Rodgers, C.; Wilson, D.** *Wong. Enfermería Pediátrica*, 10.ª edición, Elsevier. Referente bibliográfico indicado por CICDE.
3. **Posada Díaz, A.; Gómez Ramírez, J.; Ramírez Gómez, H.** *El Niño Sano*. Editorial Médica Panamericana, 2005.$$,
  16
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-17',
  $$Panamá — fuentes oficiales$$,
  $$4. **MINSA. Resolución N.° 306 de 5 de junio de 2024.** Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años.  
   https://www.minsa.gob.pa/normatividad/resolucion-ndeg-306-de-miercoles-05-de-junio-de-2024-que-aprueba-las-normas-tecnicas-y

5. **MINSA. Resolución N.° 371 de 27 de junio de 2024.** Normas Técnicas y Administrativas del Programa Nacional de Salud Integral de Adolescentes.  
   https://www.minsa.gob.pa/normatividad/resolucion-ndeg-371-de-jueves-27-de-junio-de-2024-que-aprueba-las-normas-tecnicas-y

6. **MINSA. Sección de Salud Integral de Niñez y Adolescencia.**  
   https://www.minsa.gob.pa/programa/seccion-de-salud-integral-de-ninez-y-adolescencia$$,
  17
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-18',
  $$Fuentes internacionales complementarias$$,
  $$7. **WHO. Child growth standards.** Actualización informativa 2025.  
   https://www.who.int/news-room/questions-and-answers/item/child-growth-standards

8. **WHO. Growth reference data for 5–19 years.**  
   https://www.who.int/tools/growth-reference-data-for-5to19-years

9. **WHO. BMI-for-age 5–19 years.**  
   https://www.who.int/tools/growth-reference-data-for-5to19-years/indicators/bmi-for-age

10. **WHO. Healthy diet.** 26 enero 2026.  
    https://www.who.int/es/news-room/fact-sheets/detail/healthy-diet

11. **WHO. Global standards for quality health care services for adolescents.** 2025.  
    https://www.who.int/publications/i/item/9789240114012

12. **WHO. Competency and outcomes framework for adolescent health and well-being.** 2025.  
    https://www.who.int/publications/i/item/9789240115736

13. **WHO. Integrated Management of Childhood Illness (IMCI) — danger signs and case-management framework.**  
    https://www.who.int/publications/i/item/WHO-MCA-19.02

14. **American Heart Association. Pediatric Advanced Life Support Instructor Manual.** 2025.  
    https://www.heart.org/-/media/BEE8DC56E16B42B8A71CACEF03B052E1.pdf

15. **CDC. BMI-for-Age as a Screening Measure.** 2024–2025.  
    https://www.cdc.gov/growth-chart-training/hcp/using-bmi/screening-measure.html

---

# 70. Actualizaciones y límites de interpretación$$,
  18
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-19',
  $$Niñez vs adolescencia en Panamá$$,
  $$La regulación vigente se divide en:

- **Niñez 0–9 años:** Resolución 306 de 2024.
- **Adolescencia 10–19 años:** Resolución 371 de 2024.

El propio MINSA mantiene una Sección de Salud Integral de Niñez y Adolescencia que coordina la elaboración, actualización, supervisión y aplicación de estas normas.$$,
  19
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-20',
  $$Patrones de crecimiento$$,
  $$- 0–5 años: patrones OMS 2006.
- 5–19 años: referencia OMS 2007.
- peso-para-edad OMS está disponible para 5–10 años, no para todo el rango adolescente.

No mezclar automáticamente las curvas CDC de Estados Unidos con las referencias OMS utilizadas internacionalmente; en este paquete CDC se conserva solo como fuente complementaria para principios de IMC pediátrico.$$,
  20
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-03-21',
  $$Escalas$$,
  $$No existe una sola escala “correcta” para todos los niños. La selección depende de edad, capacidad de comunicación, problema clínico y política institucional.

---

# 71. Control de calidad

Este paquete fue construido con las siguientes reglas:

- alcance cotejado contra CICDE 2026;
- 7/7 subtemas explícitos cubiertos;
- normativa Panamá 2024 para niñez y adolescencia incorporada;
- referencias OMS actuales para crecimiento 0–5 y 5–19;
- nutrición actualizada a 2026;
- estándares OMS 2025 de atención adolescente incorporados;
- valoración inicial pediátrica complementada con AHA 2025;
- no se presentan escalas como sustituto del juicio clínico;
- no se inventan rangos universales de signos vitales;
- no se usan puntos de corte de IMC adulto para población pediátrica;
- situaciones tipo examen son originales;
- no se reproduce contenido propietario de escalas gráficas;
- no se declara revisión clínica humana inexistente.

---

# 72. Estado para integración

**Estado:** `REVIEW`

Motivo:

- alcance, contenido y fuentes fueron sometidos a revisión documental/académica;
- todavía no existe reviewer clínico humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` por revisión de IA.

**Cobertura CICDE PEDS-03: 7/7 subtemas explícitos.**

**Situaciones originales tipo examen: 14.**$$,
  21
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-1',
  $$Cuidados de enfermería en las principales alteraciones de salud pediátricas$$,
  $$**Área:** Enfermería Pediátrica  
**Código:** PEDS-04  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión documental:** 2026-09-11

---

# 1. Alcance oficial CICDE

El lineamiento CICDE 2026 incluye expresamente el tema **“Cuidados de enfermería en las principales alteraciones de salud pediátricas”** y exige estudiar:

1. Trastornos gastrointestinales y nutricionales: gastroenteritis, deshidratación, diarrea aguda, síndrome de mala absorción, parasitosis, hepatitis y problemas crónicos de alimentación.
2. Alteraciones del equilibrio hidroelectrolítico y ácido-base.
3. Enfermedades infecciosas y exantemáticas.
4. Procesos respiratorios agudos y crónicos.
5. Alteraciones endocrinas y metabólicas, incluyendo diabetes mellitus.
6. Enfermedades renales y urinarias.
7. Alteraciones neurológicas.
8. Enfermedades cardiovasculares y circulatorias.
9. Neoplasias pediátricas.
10. Patologías quirúrgicas frecuentes: hernias y apendicitis.
11. Urgencias pediátricas.

Este paquete desarrolla los once puntos completos, con énfasis en reconocimiento temprano, priorización, seguridad, cuidados de enfermería, educación familiar y criterios de referencia.

---

# 2. Objetivos de aprendizaje

Al finalizar el tema, el estudiante debe ser capaz de:

1. Reconocer signos de deterioro en un niño con enfermedad aguda o crónica.
2. Priorizar ABCDE antes del diagnóstico etiológico definitivo.
3. Identificar grados clínicos de deshidratación y necesidades de rehidratación.
4. Reconocer alteraciones hidroelectrolíticas y ácido-base frecuentes.
5. Distinguir signos de gravedad en infecciones comunes, dengue, meningitis y sepsis.
6. Valorar crisis asmática, bronquiolitis, neumonía y otras enfermedades respiratorias.
7. Identificar signos de descompensación de diabetes, incluyendo cetoacidosis e hipoglucemia.
8. Reconocer signos de infección urinaria, lesión renal y enfermedad renal crónica.
9. Aplicar medidas de seguridad durante convulsiones.
10. Reconocer signos de insuficiencia cardiaca y mala perfusión.
11. Identificar señales de alarma de cáncer pediátrico y necesidades de cuidado oncológico.
12. Reconocer abdomen agudo y complicaciones posoperatorias.
13. Aplicar una secuencia segura ante urgencias pediátricas.
14. Integrar a la familia sin transferirle responsabilidades profesionales.
15. Resolver situaciones tipo CICDE basadas en prioridades de enfermería.

---

# 3. Principio general: tratar primero la inestabilidad

En pediatría, el niño puede compensar y luego deteriorarse rápidamente.

Ante cualquier cuadro:

1. **A**: vía aérea.
2. **B**: respiración.
3. **C**: circulación/perfusión.
4. **D**: estado neurológico/glucosa si corresponde.
5. **E**: exposición completa, temperatura, lesiones, exantemas.

El diagnóstico definitivo puede esperar unos minutos; la hipoxia, el shock o una convulsión prolongada no.

---

# 4. Signos generales de alarma

Requieren evaluación urgente:

- incapacidad para beber o alimentarse;
- vómitos persistentes;
- dificultad respiratoria importante;
- apnea;
- cianosis;
- convulsiones;
- somnolencia extrema o inconsciencia;
- signos de shock;
- deshidratación grave;
- fiebre o hipotermia acompañada de mal estado general;
- sangrado significativo;
- dolor intenso de inicio súbito;
- petequias/púrpura con deterioro;
- oliguria marcada;
- preocupación seria del cuidador acompañada de cambio funcional.

---

# 5. Gastroenteritis y diarrea aguda

La OMS define diarrea como tres o más deposiciones sueltas/líquidas al día o una frecuencia mayor de la habitual para la persona.

Las causas pueden ser:

- virales;
- bacterianas;
- parasitarias;
- no infecciosas.

La prioridad no es identificar el microorganismo de inmediato, sino valorar:

- hidratación;
- perfusión;
- tolerancia oral;
- sangre en heces;
- duración;
- edad;
- estado nutricional;
- comorbilidades.

---

# 6. Tipos clínicos de diarrea

Según OMS:

- **acuosa aguda**: horas o días;
- **disentería**: diarrea aguda con sangre;
- **persistente**: 14 días o más.

Cada patrón orienta evaluación y referencia.

---

# 7. Deshidratación: valoración clínica

La OMS utiliza signos combinados.

**Deshidratación grave** puede incluir al menos dos:
- letargo/inconsciencia;
- ojos hundidos;
- incapacidad o gran dificultad para beber;
- pliegue cutáneo que retorna muy lentamente.

**Alguna deshidratación** puede incluir:
- irritabilidad/inquietud;
- ojos hundidos;
- sed intensa.

No depender de un único signo.

---

# 8. Rehidratación oral

La solución de rehidratación oral (SRO/ORS):

- repone agua y electrolitos;
- se absorbe por intestino aun durante diarrea;
- es tratamiento de primera línea en deshidratación leve/moderada si el niño puede beber.

Principios de enfermería:

- administrar en volúmenes pequeños y frecuentes;
- continuar lactancia;
- reevaluar vómitos, perfusión y diuresis;
- observar tolerancia;
- registrar ingesta y pérdidas.

---

# 9. Rehidratación intravenosa

Se requiere cuando existe, por ejemplo:

- shock;
- deshidratación grave;
- imposibilidad de beber;
- deterioro neurológico;
- fracaso de rehidratación oral.

La selección y velocidad del líquido deben seguir protocolo y reevaluación frecuente. En niños, errores de volumen pueden ser peligrosos.

---

# 10. Zinc y alimentación durante diarrea

La OMS recomienda zinc como complemento en diarrea infantil en los contextos apropiados y continuar alimentación nutritiva y lactancia.

No se debe mantener ayuno prolongado sin indicación.

La enfermería vigila:

- tolerancia;
- vómitos;
- peso;
- hidratación;
- frecuencia de evacuaciones;
- signos de empeoramiento.

---

# 11. Sangre en heces y diarrea persistente

Sangre visible, diarrea persistente o deterioro general requieren evaluación médica.

No asumir que toda diarrea necesita antibiótico.

La decisión antimicrobiana depende de etiología sospechada, gravedad y guías vigentes.

---

# 12. Síndrome de mala absorción

Puede manifestarse con:

- diarrea crónica;
- distensión abdominal;
- pérdida o falta de ganancia de peso;
- esteatorrea;
- anemia o deficiencias;
- retraso del crecimiento.

La enfermería registra patrón de heces, dieta, crecimiento y signos de déficit, y coordina estudios según orden médica.

---

# 13. Parasitosis intestinal

Factores relevantes:

- agua insegura;
- saneamiento deficiente;
- suelo contaminado;
- alimentos mal lavados;
- exposición epidemiológica.

Manifestaciones varían desde asintomáticas hasta:

- dolor abdominal;
- diarrea;
- anemia;
- pérdida de peso;
- prurito;
- desnutrición.

La prevención incluye higiene, agua segura, saneamiento y tratamiento conforme a diagnóstico/programa.

---

# 14. Hepatitis en pediatría

Puede ser viral, autoinmune, metabólica, medicamentosa u otra.

Signos posibles:

- fatiga;
- anorexia;
- náuseas;
- dolor abdominal;
- ictericia;
- coluria;
- hepatomegalia.

Signos de gravedad:
- alteración del estado mental;
- sangrado;
- hipoglucemia;
- vómitos persistentes;
- deterioro general.

---

# 15. Problemas crónicos de alimentación

Pueden asociarse a:

- alteraciones oromotoras;
- trastornos neurológicos;
- reflujo;
- aversión sensorial;
- condiciones estructurales;
- estrés familiar;
- trastornos de conducta alimentaria.

Evaluar:
- crecimiento;
- seguridad de deglución;
- duración de comidas;
- tos/atragantamiento;
- consistencias toleradas;
- estrés familiar.

---

# 16. Electrolitos: principio general

Alteraciones de sodio, potasio, calcio, glucosa y bicarbonato pueden producir:

- debilidad;
- alteración neurológica;
- arritmias;
- convulsiones;
- deshidratación;
- cambios respiratorios.

Nunca corregir electrolitos rápidamente sin protocolo; algunas correcciones demasiado rápidas pueden causar lesión neurológica.

---

# 17. Hiponatremia

Puede asociarse a:

- exceso relativo de agua;
- pérdidas gastrointestinales;
- enfermedad renal;
- SIADH;
- administración inadecuada de líquidos.

Manifestaciones graves:

- cefalea;
- vómitos;
- confusión;
- convulsiones.

La severidad depende tanto del valor como de la rapidez de caída.

---

# 18. Hipernatremia

Puede aparecer por:

- déficit de agua;
- pérdidas;
- ingesta de soluciones inadecuadas;
- problemas de lactancia/alimentación.

Riesgo:
- alteración neurológica;
- irritabilidad;
- letargo;
- convulsiones.

La corrección debe ser controlada, no abrupta.

---

# 19. Alteraciones de potasio

**Hipokalemia**
- debilidad;
- íleo;
- cambios ECG;
- arritmia.

**Hiperkalemia**
- debilidad;
- cambios ECG;
- arritmia potencialmente fatal.

Ante alteración significativa, priorizar monitorización y notificación rápida.

---

# 20. Equilibrio ácido-base

Cuatro trastornos principales:

- acidosis metabólica;
- alcalosis metabólica;
- acidosis respiratoria;
- alcalosis respiratoria.

Interpretar junto con:

- pH;
- CO₂;
- bicarbonato;
- cuadro clínico.

Ejemplos:
- diarrea intensa → pérdida de bicarbonato → acidosis metabólica;
- vómitos persistentes → pérdida de ácido → alcalosis metabólica;
- hipoventilación → acidosis respiratoria;
- hiperventilación → alcalosis respiratoria.

---

# 21. Enfermedades infecciosas: enfoque

Valorar:

- edad;
- estado de inmunización;
- fiebre;
- foco;
- hidratación;
- perfusión;
- estado mental;
- respiración;
- exantema;
- exposición;
- inmunosupresión.

La fiebre no define gravedad por sí sola.

---

# 22. Enfermedades exantemáticas

Un exantema puede deberse a:

- virus;
- bacterias;
- reacción medicamentosa;
- vasculitis;
- procesos inflamatorios.

Preguntar:
- inicio;
- distribución;
- fiebre;
- prurito;
- mucosas;
- medicamentos;
- contacto epidemiológico;
- vacunación.

---

# 23. Sarampión y enfermedades prevenibles por vacunas

La prevención mediante esquema de vacunación es fundamental.

Sospecha de enfermedad exantemática transmisible requiere:

- aislamiento según vía;
- notificación conforme a normativa;
- evaluación de contactos;
- cuidado de soporte;
- vigilancia de complicaciones.

No retrasar medidas de control mientras se espera confirmación cuando el protocolo exige actuación inmediata.

---

# 24. Dengue: reconocimiento

En Panamá, el dengue es epidemiológicamente relevante.

Manifestaciones posibles:

- fiebre;
- cefalea;
- mialgias;
- dolor retroocular;
- náuseas;
- exantema.

Lo más importante es reconocer **signos de alarma y progresión a enfermedad grave**, no solo confirmar fiebre.

---

# 25. Dengue: signos de alarma

Pueden incluir:

- dolor abdominal intenso;
- vómitos persistentes;
- sangrado;
- acumulación de líquidos;
- letargo/inquietud;
- hepatomegalia;
- deterioro clínico.

La fase crítica puede aparecer cuando la fiebre disminuye.

No asumir mejoría solo porque baja la temperatura.

---

# 26. Dengue: líquidos y seguridad

La guía OMS 2025 enfatiza:

- clasificación de gravedad;
- vigilancia;
- hidratación adecuada;
- referencia oportuna.

El exceso de líquidos también puede causar daño, especialmente durante la fase de recuperación.

No administrar AINE como ibuprofeno o aspirina en sospecha de dengue por riesgo de sangrado; seguir protocolo local.

---

# 27. Sepsis pediátrica

Sepsis es disfunción orgánica potencialmente mortal asociada a infección.

Sospechar ante:
- deterioro de conciencia;
- mala perfusión;
- dificultad respiratoria;
- oliguria;
- temperatura anormal;
- taquicardia inapropiada;
- hipotensión tardía;
- lactante hipoactivo.

La OMS destaca reconocimiento temprano, reanimación inicial, antimicrobianos dirigidos y control del foco.

---

# 28. Meningitis

Puede presentarse con:

- fiebre;
- cefalea;
- vómitos;
- rigidez de nuca;
- fotofobia;
- alteración de conciencia;
- convulsiones.

En lactantes:
- irritabilidad;
- rechazo al alimento;
- llanto anormal;
- fontanela abombada;
- hipoactividad.

La OMS publicó en 2025 directrices para diagnóstico, tratamiento y cuidados en niños mayores de 1 mes, adolescentes y adultos.

---

# 29. Aislamiento y prevención de infección

Aplicar según agente sospechado:

- precauciones estándar;
- contacto;
- gotas;
- aerosoles cuando corresponda;
- higiene de manos;
- equipo de protección;
- limpieza;
- educación familiar.

El aislamiento no debe convertirse en abandono emocional del niño.

---

# 30. Procesos respiratorios: valoración

Valorar:

- frecuencia;
- esfuerzo;
- retracciones;
- aleteo;
- quejido;
- estridor;
- sibilancias;
- entrada de aire;
- saturación;
- color;
- capacidad para hablar/comer;
- nivel de conciencia.

El agotamiento puede preceder insuficiencia respiratoria.

---

# 31. Neumonía pediátrica

La OMS reconoce como signos importantes en menores de 5 años:

- tos/dificultad respiratoria;
- respiración rápida;
- tiraje de pared torácica inferior.

Los casos graves pueden presentar:
- incapacidad para beber;
- alteración de conciencia;
- convulsiones;
- hipoxemia.

---

# 32. Cuidados de enfermería en neumonía

- monitorizar respiración y saturación;
- mantener posición de confort;
- administrar oxígeno si está indicado;
- favorecer hidratación;
- controlar fiebre/dolor;
- administrar antibióticos prescritos cuando corresponde;
- vigilar respuesta;
- educar sobre signos de alarma.

No todos los cuadros respiratorios requieren antibióticos.

---

# 33. Bronquiolitis

Afecta principalmente a lactantes y niños pequeños.

Puede producir:
- rinorrea inicial;
- tos;
- sibilancias/crepitantes;
- aumento de trabajo respiratorio;
- dificultad para alimentarse;
- apnea en lactantes pequeños.

La OMS publicó en mayo de 2026 directrices consolidadas para bronquiolitis y asma pediátrica.

---

# 34. Bronquiolitis: prioridades

El manejo es principalmente de soporte:

- oxigenación cuando está indicada;
- hidratación;
- limpieza nasal suave;
- alimentación segura;
- vigilancia de apnea y fatiga.

Evitar tratamientos rutinarios no recomendados por guías actuales solo porque “siempre se han usado”.

---

# 35. Asma pediátrica

OMS 2026 identifica el asma como la enfermedad crónica más común en la infancia.

Síntomas:
- tos;
- sibilancias;
- disnea;
- opresión torácica;
- variabilidad en el tiempo.

Desencadenantes:
- infecciones virales;
- humo;
- alérgenos;
- ejercicio;
- contaminación;
- cambios climáticos.

---

# 36. Crisis asmática: gravedad

Signos preocupantes:

- habla entrecortada;
- retracciones intensas;
- uso de músculos accesorios;
- agitación o somnolencia;
- entrada de aire muy reducida;
- cianosis;
- agotamiento.

Un “pecho silencioso” en un niño muy disneico puede indicar obstrucción extrema, no mejoría.

---

# 37. Inhaladores y cámara espaciadora

La OMS 2026 enfatiza que los inhaladores son esenciales y que una cámara espaciadora facilita la administración, especialmente en niños.

Enfermería:
- verifica técnica;
- adapta mascarilla/boquilla a edad;
- enseña a familia;
- evalúa respuesta;
- refuerza plan de acción.

---

# 38. Fibrosis quística y enfermedad respiratoria crónica

Puede producir:

- infecciones respiratorias recurrentes;
- tos crónica;
- malabsorción;
- bajo peso;
- secreciones espesas.

Cuidados:
- fisioterapia respiratoria prescrita;
- nutrición;
- enzimas si están indicadas;
- antibióticos según cultivo/protocolo;
- prevención de infección cruzada;
- apoyo familiar.

---

# 39. Oxigenoterapia pediátrica

Principios:

- oxígeno es un medicamento;
- usar dispositivo adecuado;
- monitorizar saturación y clínica;
- revisar fijación;
- proteger piel;
- humidificar según dispositivo;
- evitar desconexiones.

No “tratar el número” sin valorar al niño.

---

# 40. Diabetes mellitus pediátrica

La diabetes tipo 1 requiere insulina.

La diabetes tipo 2 también ocurre en adolescentes y se relaciona con múltiples factores metabólicos y sociales.

ISPAD mantiene guías específicas para:
- clasificación;
- insulina;
- monitoreo;
- hipoglucemia;
- cetoacidosis;
- ejercicio;
- escuela;
- adolescencia.

---

# 41. Hiperglucemia y síntomas clásicos

Pueden incluir:

- poliuria;
- polidipsia;
- pérdida de peso;
- nocturia/enuresis nueva;
- fatiga;
- visión borrosa.

En un niño con vómitos, respiración profunda y deshidratación, pensar en cetoacidosis.

---

# 42. Cetoacidosis diabética

Manifestaciones:

- hiperglucemia;
- cetosis;
- acidosis;
- deshidratación;
- vómitos;
- dolor abdominal;
- respiración de Kussmaul;
- alteración de conciencia.

Es una emergencia.

El tratamiento requiere:
- líquidos cuidadosamente calculados;
- insulina intravenosa según protocolo;
- control de potasio y otros electrolitos;
- vigilancia neurológica.

---

# 43. Edema cerebral en cetoacidosis

Complicación grave.

Signos:
- cefalea creciente;
- deterioro del estado mental;
- bradicardia;
- cambios de presión;
- vómitos;
- convulsiones.

Notificar y actuar inmediatamente según protocolo.

---

# 44. Hipoglucemia

Puede presentar:

- sudoración;
- temblor;
- hambre;
- irritabilidad;
- confusión;
- somnolencia;
- convulsiones.

Si el niño está consciente y puede tragar, seguir plan de carbohidrato de acción rápida según protocolo.

Si está inconsciente o no puede tragar:
- proteger vía aérea;
- no dar líquidos por boca;
- aplicar tratamiento de emergencia prescrito/protocolo.

---

# 45. Educación en diabetes

Incluye:

- insulina;
- monitoreo;
- conteo/plan de carbohidratos;
- ejercicio;
- enfermedad intercurrente;
- cetonas;
- hipoglucemia;
- almacenamiento de insulina;
- plan escolar;
- salud mental;
- transición del adolescente.

La autonomía se transfiere progresivamente, no de golpe.

---

# 46. Enfermedades renales y urinarias: enfoque

Valorar:

- diuresis;
- color y olor de orina;
- disuria;
- frecuencia;
- fiebre;
- edema;
- presión arterial;
- peso;
- hidratación;
- antecedentes urológicos;
- medicamentos nefrotóxicos.

---

# 47. Infección urinaria

Puede manifestarse en niños mayores con:

- disuria;
- frecuencia;
- urgencia;
- dolor abdominal/lumbar;
- fiebre.

En lactantes puede ser inespecífica:
- fiebre;
- irritabilidad;
- mala alimentación;
- vómitos;
- pobre ganancia de peso.

La toma de muestra debe minimizar contaminación.

---

# 48. Síndrome nefrótico

Se caracteriza típicamente por:

- proteinuria importante;
- hipoalbuminemia;
- edema;
- hiperlipidemia.

Cuidados:
- peso diario;
- edema;
- balance hídrico;
- piel;
- signos de infección;
- medicación;
- educación familiar.

---

# 49. Síndrome nefrítico / glomerulonefritis

Puede incluir:

- hematuria;
- edema;
- hipertensión;
- oliguria;
- proteinuria variable.

Prioridades:
- presión arterial;
- diuresis;
- balance;
- función renal;
- signos de sobrecarga.

---

# 50. Lesión renal aguda

Pensar ante:
- reducción de diuresis;
- aumento de creatinina;
- edema;
- alteraciones de electrolitos;
- exposición a nefrotóxicos;
- shock/sepsis.

KDIGO está actualizando su guía de AKI en 2026; el borrador no debe presentarse como norma final.

---

# 51. Enfermedad renal crónica pediátrica

KDIGO 2024 destaca particularidades en niños:

- causas congénitas/urológicas frecuentes;
- crecimiento;
- nutrición;
- neurodesarrollo;
- dosificación por peso/superficie corporal;
- apoyo escolar;
- transición a atención adulta.

El cuidado es familiar y longitudinal.

---

# 52. Convulsión: seguridad inmediata

Durante una convulsión:

- proteger de lesiones;
- colocar en superficie segura;
- lateralizar si es posible cuando no compromete seguridad;
- mantener vía aérea;
- no introducir objetos en la boca;
- no sujetar violentamente;
- medir duración;
- observar características;
- valorar glucosa cuando esté indicado.

---

# 53. Estado epiléptico

Una convulsión prolongada o repetida sin recuperación adecuada es una emergencia.

Acciones:
- ABC;
- oxígeno según necesidad;
- acceso vascular/intraóseo según protocolo;
- medicación anticonvulsivante prescrita;
- glucosa;
- temperatura;
- búsqueda de causa.

---

# 54. Epilepsia

OMS recuerda que una convulsión aislada no equivale automáticamente a epilepsia.

Enfermería trabaja en:
- adherencia;
- educación;
- seguridad;
- sueño;
- desencadenantes;
- estigma;
- plan escolar;
- prevención de lesiones.

---

# 55. Convulsión febril

Ocurre en un rango etario típico asociado a fiebre y sin infección del SNC.

Aunque muchas son benignas, deben valorarse:

- duración;
- focalidad;
- recurrencia;
- edad;
- recuperación;
- signos meníngeos.

Una primera convulsión siempre requiere valoración clínica.

---

# 56. Meningitis: cuidados de enfermería

- aislamiento según agente;
- monitorización neurológica;
- control de convulsiones;
- vía aérea;
- líquidos;
- antimicrobianos prescritos sin demoras evitables;
- control de fiebre/dolor;
- vigilancia de secuelas.

---

# 57. Traumatismo craneoencefálico

Signos de alarma:

- pérdida de conciencia;
- vómitos repetidos;
- cefalea progresiva;
- convulsión;
- déficit focal;
- alteración de pupilas;
- deterioro conductual;
- salida de líquido por nariz/oído;
- mecanismo de alta energía.

No dejar solo a un niño con deterioro neurológico.

---

# 58. Cardiopatías y alteraciones circulatorias

Pueden manifestarse con:

- taquipnea;
- fatiga;
- mala alimentación;
- sudoración;
- cianosis;
- baja ganancia de peso;
- edema;
- hepatomegalia;
- mala perfusión;
- síncope.

La valoración incluye pulsos y presión arterial cuando corresponde.

---

# 59. Insuficiencia cardiaca pediátrica

Cuidados:

- reposo relativo;
- reducir gasto energético durante alimentación;
- monitorizar respiración;
- peso;
- edema;
- diuresis;
- medicación;
- nutrición;
- signos de toxicidad farmacológica cuando corresponda.

---

# 60. Cardiopatías congénitas

OMS reconoce las cardiopatías como una de las malformaciones congénitas graves más comunes.

Un niño con cardiopatía puede requerir:
- seguimiento especializado;
- cirugía/intervención;
- control de crecimiento;
- prevención de infección;
- educación familiar;
- planificación de actividad.

---

# 61. Fiebre reumática y cardiopatía reumática

Puede seguir a infección por estreptococo del grupo A.

Prevención:
- reconocimiento y tratamiento apropiado de faringitis estreptocócica según guías;
- adherencia a profilaxis secundaria cuando está indicada;
- seguimiento cardiológico.

---

# 62. Hipertensión pediátrica

No utilizar puntos de corte adultos de forma automática.

La interpretación depende de:
- edad;
- sexo;
- talla;
- guías pediátricas;
- técnica correcta.

Ante cifra alta:
- verificar manguito;
- repetir;
- evaluar síntomas;
- buscar enfermedad renal/cardiovascular.

---

# 63. Neoplasias pediátricas

OMS 2026 identifica como frecuentes:

- leucemias;
- tumores cerebrales;
- neuroblastoma;
- tumor de Wilms;
- linfomas;
- tumores óseos en adolescentes.

La mayoría no tiene tamizaje poblacional efectivo.

La estrategia clave es diagnóstico temprano y tratamiento oportuno.

---

# 64. Signos de alarma de cáncer

Requieren evaluación persistente:

- palidez marcada;
- sangrado/petequias;
- fiebre prolongada;
- pérdida de peso;
- dolor óseo persistente;
- adenopatía progresiva;
- masa abdominal;
- cefalea matutina con vómito;
- cambios neurológicos;
- leucocoria;
- masa creciente.

Un signo aislado no confirma cáncer.

---

# 65. Leucemia

Puede presentarse con:

- anemia;
- infecciones;
- sangrado;
- dolor óseo;
- adenopatías;
- hepatoesplenomegalia.

Cuidados:
- prevenir infección;
- vigilar sangrado;
- fatiga;
- nutrición;
- dolor;
- efectos de quimioterapia.

---

# 66. Neutropenia febril

En un paciente oncológico, fiebre con neutropenia es una urgencia.

Prioridades:
- evaluación inmediata;
- cultivos según protocolo;
- antimicrobianos prescritos con rapidez;
- vigilancia de sepsis;
- evitar procedimientos rectales si están contraindicados;
- higiene estricta.

---

# 67. Trombocitopenia

Cuidados:
- observar petequias/sangrado;
- evitar inyecciones IM si protocolo lo contraindica;
- presión prolongada tras punciones;
- evitar traumatismos;
- vigilar mucosas;
- educación familiar.

---

# 68. Náuseas, mucositis y nutrición oncológica

La quimioterapia puede causar:

- náuseas;
- vómitos;
- mucositis;
- alteración del gusto;
- anorexia.

Cuidados:
- higiene oral suave;
- analgesia;
- antieméticos prescritos;
- alimentos tolerados;
- nutrición especializada;
- prevención de deshidratación.

---

# 69. Extravasación de quimioterapia

Es una urgencia de seguridad.

Ante sospecha:
- detener la infusión;
- mantener acceso según protocolo;
- no retirar automáticamente el catéter antes de aplicar procedimiento institucional;
- notificar;
- documentar;
- aplicar manejo específico del fármaco.

---

# 70. Cuidados paliativos pediátricos

La OMS considera los cuidados paliativos parte integral del cuidado oncológico.

Incluyen:
- control de dolor y síntomas;
- apoyo emocional;
- comunicación;
- apoyo espiritual/cultural;
- acompañamiento familiar;
- calidad de vida.

Pueden coexistir con tratamiento curativo.

---

# 71. Apendicitis

Manifestaciones típicas:
- dolor abdominal que puede migrar a cuadrante inferior derecho;
- anorexia;
- náuseas/vómitos;
- fiebre;
- sensibilidad.

En niños pequeños puede ser atípica.

No administrar alimentos por vía oral si existe sospecha quirúrgica hasta valoración y órdenes.

---

# 72. Apendicitis complicada

Pensar en perforación/peritonitis ante:

- dolor intenso generalizado;
- rigidez;
- fiebre alta;
- deterioro;
- taquicardia;
- signos de sepsis.

Requiere valoración quirúrgica urgente.

---

# 73. Hernias

Una hernia reducible puede ser indolora.

Urgencia si:
- dolor intenso;
- masa irreducible;
- vómitos;
- distensión;
- cambios de coloración;
- irritabilidad intensa.

Puede indicar incarceración o estrangulación.

---

# 74. Cuidado preoperatorio pediátrico

- identificación;
- consentimiento;
- ayuno según protocolo;
- alergias;
- medicación;
- signos vitales;
- apoyo emocional;
- explicar acorde a edad;
- verificar sitio/procedimiento.

---

# 75. Cuidado postoperatorio

Prioridades:

- vía aérea;
- respiración;
- dolor;
- náuseas;
- perfusión;
- herida;
- sangrado;
- líquidos;
- diuresis;
- movilidad;
- infección.

El dolor mal controlado afecta respiración y recuperación.

---

# 76. Urgencias: obstrucción de vía aérea

Si el niño no puede hablar/llorar/toser efectivamente:

- activar respuesta;
- aplicar maniobras de desobstrucción según edad y entrenamiento;
- iniciar RCP si pierde conciencia.

No realizar barrido digital a ciegas.

---

# 77. Anafilaxia

Manifestaciones:
- urticaria/angioedema;
- sibilancias;
- estridor;
- hipotensión;
- vómitos;
- deterioro rápido.

La **epinefrina intramuscular** es tratamiento de primera línea según protocolos de anafilaxia; no retrasarla esperando antihistamínicos.

---

# 78. Quemaduras

Prioridades:
- detener proceso de quemadura;
- ABC;
- enfriar adecuadamente con agua corriente fresca cuando corresponda;
- evitar hielo directo;
- cubrir;
- valorar extensión/profundidad;
- analgesia;
- prevenir hipotermia.

En quemaduras extensas, el niño pierde calor rápidamente.

---

# 79. Intoxicaciones

Principios:
- ABC;
- identificar sustancia;
- cantidad;
- hora;
- vía;
- traer envase si es seguro;
- contactar centro toxicológico/sistema de emergencias.

No inducir vómito de rutina.

---

# 80. Ahogamiento

Prioridades:
- extracción segura;
- ventilación/oxigenación;
- RCP si corresponde;
- prevenir hipotermia;
- monitorizar.

Un niño que parece recuperado puede requerir observación por compromiso respiratorio.

---

# 81. Trauma pediátrico

Considerar:
- mecanismo;
- cabeza proporcionalmente grande;
- riesgo cervical;
- hemorragia oculta;
- dolor;
- protección térmica.

La ausencia de lesión externa no excluye daño interno.

---

# 82. Urgencia metabólica: hipoglucemia

En cualquier niño con:
- alteración de conciencia;
- convulsión;
- debilidad súbita;
- diabetes;
- enfermedad prolongada;

considerar glucosa rápida si está disponible y actuar según protocolo.

---

# 83. Seguridad farmacológica en pediatría

Toda administración debe verificar:

- paciente;
- fármaco;
- dosis;
- vía;
- hora;
- indicación;
- alergias;
- peso actual en kg;
- concentración;
- dosis máxima;
- cálculo independiente cuando corresponda.

Los errores de decimal son especialmente peligrosos.

---

# 84. Familia y enfermedad crónica

En enfermedad crónica:

- enseñar señales de alarma;
- simplificar el plan;
- confirmar comprensión con teach-back;
- coordinar escuela;
- apoyar transición;
- evaluar carga del cuidador;
- promover autonomía progresiva.

---

# 85. Documentación y reevaluación

Registrar:

- valoración inicial;
- signos vitales;
- escala usada;
- intervención;
- medicación;
- respuesta;
- ingesta/pérdidas;
- educación;
- escalamiento.

La reevaluación es obligatoria después de una intervención significativa.

---

# 86. Errores frecuentes de examen

1. Priorizar el diagnóstico antes del ABC.
2. Dar antibióticos a toda diarrea.
3. Considerar fiebre descendente como mejoría automática en dengue.
4. Ignorar dificultad respiratoria si la saturación aún es “aceptable”.
5. Dar líquidos orales a un niño con alteración importante de conciencia.
6. Corregir sodio rápidamente sin protocolo.
7. Dar alimentos a un niño con sospecha de abdomen quirúrgico.
8. Introducir objetos en la boca durante convulsión.
9. Esperar hipotensión para reconocer shock.
10. Usar dosis adultas sin cálculo pediátrico.
11. Confundir una convulsión aislada con epilepsia.
12. Tratar asma sin revisar técnica inhalatoria.
13. Considerar fiebre neutropénica como “esperar y observar”.
14. Retirar de inmediato un acceso con extravasación sin seguir protocolo.
15. Tratar un resultado de escala sin valorar al niño.

---

# 87. Situaciones originales tipo examen$$,
  1
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-2',
  $$Caso 1 — Diarrea$$,
  $$Niño con diarrea, ojos hundidos, sed intensa e irritabilidad.

**Respuesta:** valorar como deshidratación y comenzar rehidratación según protocolo, con reevaluación frecuente.

---$$,
  2
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-3',
  $$Caso 2 — Shock$$,
  $$Niño con taquicardia, piel fría y somnolencia, pero presión normal.

**Respuesta:** posible shock compensado; actuar antes de que aparezca hipotensión.

---$$,
  3
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-4',
  $$Caso 3 — Dengue$$,
  $$Adolescente con dengue deja de tener fiebre pero desarrolla dolor abdominal intenso y vómitos.

**Respuesta:** no asumir mejoría. Son signos de alarma y requieren reevaluación urgente.

---$$,
  4
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-5',
  $$Caso 4 — Bronquiolitis$$,
  $$Lactante con bronquiolitis, retracciones leves y dificultad para alimentarse.

**Respuesta:** valorar respiración, oxigenación e hidratación; manejo principalmente de soporte.

---$$,
  5
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-6',
  $$Caso 5 — Asma$$,
  $$Escolar con sibilancias intensas y luego casi no se escuchan ruidos respiratorios, está somnoliento.

**Respuesta:** “pecho silencioso” con agotamiento es signo de obstrucción grave; emergencia.

---$$,
  6
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-7',
  $$Caso 6 — DKA$$,
  $$Adolescente con poliuria, pérdida de peso, vómitos y respiración profunda.

**Respuesta:** sospechar cetoacidosis diabética y activar evaluación urgente.

---$$,
  7
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-8',
  $$Caso 7 — Hipoglucemia$$,
  $$Niño con diabetes está inconsciente.

**Respuesta:** no dar líquidos por boca. Proteger vía aérea y aplicar tratamiento de emergencia según protocolo.

---$$,
  8
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-9',
  $$Caso 8 — UTI$$,
  $$Lactante con fiebre sin foco, vómitos e irritabilidad.

**Respuesta:** considerar infección urinaria entre diagnósticos y obtener muestra adecuada según indicación.

---$$,
  9
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-10',
  $$Caso 9 — Convulsión$$,
  $$Niño convulsiona en cama. Familiar intenta meter una cuchara en su boca.

**Respuesta:** impedir esa maniobra, proteger al niño, asegurar vía aérea y cronometrar la convulsión.

---$$,
  10
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-11',
  $$Caso 10 — Meningitis$$,
  $$Niño con fiebre, rigidez de nuca y somnolencia progresiva.

**Respuesta:** emergencia; aplicar aislamiento/protocolo, ABC, evaluación y tratamiento urgente.

---$$,
  11
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-12',
  $$Caso 11 — Leucemia$$,
  $$Niño en quimioterapia presenta fiebre.

**Respuesta:** valorar inmediatamente posible neutropenia febril; no manejar como fiebre rutinaria.

---$$,
  12
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-13',
  $$Caso 12 — Extravasación$$,
  $$Durante quimioterapia IV aparece dolor y edema en el sitio.

**Respuesta:** detener infusión y activar protocolo de extravasación; no retirar de forma automática el acceso antes de revisar la conducta específica.

---$$,
  13
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-14',
  $$Caso 13 — Apendicitis$$,
  $$Niño con dolor migratorio al cuadrante inferior derecho y vómitos.

**Respuesta:** mantener NPO si así lo indica el protocolo, valorar y preparar evaluación quirúrgica.

---$$,
  14
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-15',
  $$Caso 14 — Hernia$$,
  $$Lactante con masa inguinal dolorosa, irreducible y vómitos.

**Respuesta:** sospechar incarceración; valoración quirúrgica urgente.

---$$,
  15
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-16',
  $$Caso 15 — Anafilaxia$$,
  $$Niño tras alimento nuevo desarrolla ronchas, sibilancias y voz ronca.

**Respuesta:** anafilaxia probable; epinefrina IM según protocolo y manejo de vía aérea.

---$$,
  16
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-17',
  $$Caso 16 — Quemadura$$,
  $$Niño con quemadura extensa; familiar aplica hielo directamente.

**Respuesta:** retirar hielo, proteger ABC y temperatura, usar enfriamiento apropiado y activar atención especializada.

---

# 88. Fuentes y validación$$,
  17
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-18',
  $$Fuentes rectoras CICDE$$,
  $$1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen por Competencia de Profesionales de Enfermería*, tercera edición, Panamá, 2026.
2. **Hockenberry, M.; Rodgers, C.; Wilson, D.** *Wong. Enfermería Pediátrica*, 10.ª edición, Elsevier.
3. **MINSA.** *Manual de Normas y Procedimientos. Programa Ampliado de Inmunizaciones*, 2012, como bibliografía histórica CICDE.
4. **Posada Díaz, A.; Gómez Ramírez, J.; Ramírez Gómez, H.** *El Niño Sano*. Editorial Médica Panamericana.$$,
  18
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-19',
  $$Panamá — fuentes oficiales$$,
  $$5. **MINSA. Resolución N.° 306 de 5 de junio de 2024.** Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años.  
   https://www.minsa.gob.pa/normatividad/resolucion-ndeg-306-de-miercoles-05-de-junio-de-2024-que-aprueba-las-normas-tecnicas-y

6. **MINSA. Esquema Nacional de Vacunación 2026.**  
   https://minsa.gob.pa/sites/default/files/programas/esquema_nacional_de_vacunacion_2026_1.pdf$$,
  19
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-20',
  $$Fuentes internacionales complementarias$$,
  $$7. **WHO. Diarrhoeal disease.** 7 marzo 2024.  
   https://www.who.int/news-room/fact-sheets/detail/diarrhoeal-disease

8. **WHO. Guideline on management of pneumonia and diarrhoea in children up to 10 years of age.** 2024.  
   https://www.who.int/health-topics/pneumonia

9. **WHO. Pneumonia in children.**  
   https://www.who.int/news-room/fact-sheets/detail/pneumonia

10. **WHO. Consolidated guidelines for management of common childhood illness: asthma and bronchiolitis.** 7 mayo 2026.  
    https://www.who.int/publications/i/item/9789240122680

11. **WHO. Asthma fact sheet.** 28 abril 2026.  
    https://www.who.int/news-room/fact-sheets/detail/asthma

12. **WHO. Guidelines for clinical management of arboviral diseases: dengue, chikungunya, Zika and yellow fever.** 4 julio 2025.  
    https://www.who.int/publications/i/item/9789240111110

13. **WHO. Guidelines on meningitis diagnosis, treatment and care.** 10 abril 2025.  
    https://www.who.int/publications/i/item/9789240108042

14. **WHO. Guidelines on clinical management of sepsis — development/update page.** 2024.  
    https://www.who.int/news/item/30-01-2024-guidelines-on-the-clinical-management-of-sepsis

15. **WHO. Recommendations for management of serious bacterial infections in infants aged 0–59 days.** 2024/2025.  
    https://www.who.int/publications/i/item/9789240102903/

16. **WHO. Epilepsy.** 7 febrero 2024.  
    https://www.who.int/news-room/fact-sheets/detail/epilepsy

17. **ISPAD. Clinical Practice Consensus Guidelines 2024.**  
    https://www.ispad.org/resources/ispad-clinical-practice-consensus-guidelines/2024-cpcg.html

18. **KDIGO. 2024 Clinical Practice Guideline for Evaluation and Management of CKD.**  
    https://kdigo.org/guidelines/ckd-evaluation-and-management/

19. **KDIGO. AKI/AKD guideline update.** La actualización 2026 continúa como borrador/revisión pública y no se presenta como guía final.  
    https://kdigo.org/guidelines/acute-kidney-injury/

20. **WHO. Childhood cancer.** 10 marzo 2026.  
    https://www.who.int/news-room/fact-sheets/detail/cancer-in-children

21. **WHO. Congenital disorders.**  
    https://www.who.int/news-room/fact-sheets/detail/birth-defects

22. **WHO. World Patient Safety Day 2025 — safe care for newborns and children.**  
    https://www.who.int/campaigns/world-patient-safety-day/2025

---

# 89. Actualizaciones 2025–2026 relevantes$$,
  20
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-21',
  $$Respiratorio$$,
  $$En mayo de 2026 OMS publicó una guía consolidada específicamente para **asma en niños/adolescentes y bronquiolitis en lactantes/niños pequeños**. Este paquete prioriza esa guía frente a prácticas históricas no respaldadas.$$,
  21
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-22',
  $$Arbovirosis$$,
  $$La OMS publicó en 2025 una guía integrada para dengue, chikungunya, Zika y fiebre amarilla. Para fines CICDE, se enfatizan reconocimiento de gravedad, líquidos y referencia, sin sustituir protocolos nacionales.$$,
  22
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-23',
  $$Meningitis$$,
  $$La OMS publicó en 2025 sus primeras directrices globales de diagnóstico, tratamiento y cuidado de meningitis adquirida en comunidad para niños mayores de un mes, adolescentes y adultos.$$,
  23
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-24',
  $$Riñón$$,
  $$KDIGO 2024 es la referencia actual para enfermedad renal crónica. La actualización KDIGO 2026 de AKI/AKD estaba todavía en borrador/revisión pública al momento de esta revisión; por tanto, no se presenta como norma final.$$,
  24
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-04-25',
  $$Cáncer$$,
  $$OMS actualizó en marzo de 2026 su ficha global de cáncer infantil y mantiene como prioridad el diagnóstico temprano, tratamiento específico y cuidado de soporte.

---

# 90. Control de calidad

Este paquete fue construido con estas reglas:

- alcance cotejado contra CICDE 2026;
- 11/11 subtemas explícitos cubiertos;
- normativa nacional panameña incorporada cuando corresponde;
- no se usan dosis pediátricas específicas sin contexto/protocolo;
- no se recomienda antibiótico indiscriminadamente;
- no se confunde fiebre con gravedad por sí sola;
- no se presenta una guía en borrador como normativa definitiva;
- diabetes pediátrica se apoya en ISPAD 2024;
- asma/bronquiolitis se actualizan con OMS 2026;
- arbovirosis se actualiza con OMS 2025;
- meningitis con OMS 2025;
- CKD con KDIGO 2024;
- oncología pediátrica con OMS 2026;
- situaciones tipo examen son originales;
- no se declara revisión clínica humana inexistente.

---

# 91. Estado para integración

**Estado:** `REVIEW`

Motivo:

- alcance y contenido fueron sometidos a validación documental y académica;
- todavía no existe revisión clínica humana con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` por una revisión realizada por IA.

**Cobertura CICDE PEDS-04: 11/11 subtemas explícitos.**

**Situaciones originales tipo examen: 16.**$$,
  25
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-1',
  $$Cuidados especializados de enfermería pediátrica$$,
  $$**Área:** Enfermería Pediátrica  
**Código:** PEDS-05  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión documental:** 2026-09-11

---

# 1. Alcance oficial CICDE

El lineamiento CICDE 2026 incluye expresamente el tema **“Cuidados especializados de enfermería pediátrica”** y exige estudiar:

1. Atención de enfermería al paciente pediátrico preoperatorio y postoperatorio.
2. Cuidados paliativos pediátricos y acompañamiento al niño y su familia.
3. Principios de seguridad y calidad en el cuidado pediátrico.

Este paquete desarrolla íntegramente los tres puntos, con énfasis en seguridad, priorización, comunicación adaptada al desarrollo, manejo del dolor, prevención de eventos adversos, participación familiar y continuidad del cuidado.

---

# 2. Objetivos de aprendizaje

Al finalizar el tema, el estudiante debe poder:

1. Preparar de manera segura a un niño para cirugía.
2. Reconocer verificaciones preoperatorias críticas.
3. Priorizar la vigilancia respiratoria y hemodinámica en el postoperatorio.
4. Identificar complicaciones tempranas de cirugía/anestesia.
5. Valorar y tratar el dolor con herramientas apropiadas para edad y desarrollo.
6. Diferenciar cuidados paliativos de cuidados exclusivamente al final de la vida.
7. Explicar cómo se integran los cuidados paliativos con tratamientos dirigidos a la enfermedad.
8. Apoyar al niño y la familia durante enfermedad grave.
9. Aplicar principios de seguridad de medicamentos pediátricos.
10. Reconocer riesgos asociados a dispositivos, infecciones, caídas y deterioro clínico.
11. Utilizar comunicación estructurada y handoff seguro.
12. Promover participación familiar sin delegar responsabilidades profesionales.
13. Identificar situaciones que requieren escalamiento inmediato.
14. Integrar calidad, seguridad y derechos en el cuidado pediátrico.

---

# 3. Principio rector del cuidado especializado

El cuidado pediátrico especializado debe adaptarse a:

- edad;
- peso;
- etapa del desarrollo;
- capacidad de comunicación;
- condición clínica;
- contexto familiar;
- tecnología/dispositivos;
- riesgos específicos.

La OMS subrayó en 2025 que los niños **no son adultos pequeños** y que la atención segura debe ajustarse a su edad, tamaño, desarrollo, necesidades médicas y capacidad de comunicación.

---

# 4. Atención preoperatoria: objetivos

La fase preoperatoria busca:

- confirmar identidad;
- verificar procedimiento y sitio;
- detectar riesgos;
- asegurar preparación física;
- disminuir ansiedad;
- preparar al niño y familia;
- prevenir errores;
- garantizar continuidad de información.

La cirugía no comienza en el quirófano: la seguridad se construye desde la preparación.

---

# 5. Verificación preoperatoria esencial

Antes del traslado/procedimiento verificar:

- nombre e identificación;
- procedimiento planificado;
- sitio/lateralidad cuando corresponda;
- consentimiento según normativa;
- alergias;
- peso actual;
- ayuno según protocolo anestésico;
- medicamentos administrados/suspendidos;
- exámenes requeridos;
- acceso vascular si está indicado;
- antecedentes anestésicos;
- riesgo de sangrado;
- necesidades especiales.

No asumir que “alguien ya lo verificó”.

---

# 6. Consentimiento, asentimiento y participación

El consentimiento corresponde a quien legalmente pueda otorgarlo según edad y legislación.

Además:

- explicar al niño en lenguaje comprensible;
- permitir preguntas;
- buscar su cooperación;
- respetar su dignidad;
- incorporar su asentimiento cuando sea apropiado.

El hecho de que un adulto firme no elimina el deber de informar al niño.

---

# 7. Preparación psicológica

La preparación debe adaptarse a la edad.

Puede incluir:

- explicación simple;
- demostración con juego o muñecos;
- anticipar sensaciones esperadas;
- permitir objeto de apego;
- participación del cuidador;
- evitar amenazas o engaños.

Decir “no te va a doler nada” cuando no puede garantizarse puede disminuir la confianza.

---

# 8. Ansiedad preoperatoria

Manifestaciones:

- llanto;
- retraimiento;
- irritabilidad;
- resistencia;
- regresión;
- síntomas somáticos.

Intervenciones:

- ambiente calmado;
- información clara;
- distracción;
- presencia familiar cuando sea segura;
- preparación gradual;
- medicación prescrita si corresponde.

---

# 9. Ayuno preoperatorio

El objetivo es reducir riesgo de aspiración.

La duración depende de:

- tipo de ingesta;
- edad;
- procedimiento;
- anestesia;
- protocolo institucional.

No memorizar un único tiempo universal sin conocer el protocolo vigente. Enfermería confirma la última ingesta y la documenta.

---

# 10. Peso y seguridad anestésica

El peso pediátrico debe:

- ser reciente;
- estar en kilogramos;
- documentarse correctamente.

Se utiliza para:

- medicamentos;
- líquidos;
- equipos;
- estimación fisiológica.

Un error kg/lb puede generar sobredosis grave.

---

# 11. Medicamentos preoperatorios

Antes de administrar:

- verificar alergias;
- indicación;
- peso;
- dosis calculada;
- concentración;
- vía;
- hora;
- doble verificación si aplica;
- efecto esperado;
- posibles reacciones.

Medicamentos de alto riesgo requieren especial atención.

---

# 12. Sitio quirúrgico y prevención de error

Principios:

- confirmar paciente;
- confirmar procedimiento;
- confirmar sitio;
- marcar cuando corresponda;
- verificar documentación;
- participar en el “time out” institucional.

La Lista de Verificación de Seguridad Quirúrgica de la OMS estructura controles antes de la anestesia, antes de la incisión y antes de que el paciente abandone el quirófano.

---

# 13. Prevención de infección quirúrgica

Medidas:

- higiene de manos;
- preparación cutánea según protocolo;
- técnica aséptica;
- antibiótico profiláctico si está indicado;
- evitar rasurado innecesario/traumático;
- control de dispositivos;
- cuidado de herida.

La prevención depende del sistema completo, no de una sola intervención.

---

# 14. Traslado seguro a quirófano

Verificar:

- identificación;
- expediente/documentos;
- acceso;
- medicamentos;
- oxígeno si corresponde;
- barandas;
- acompañamiento;
- equipo necesario;
- comunicación del estado actual.

Los cambios clínicos de última hora deben comunicarse antes del procedimiento.

---

# 15. Handoff perioperatorio

El traspaso debe incluir:

- identidad;
- diagnóstico/procedimiento;
- alergias;
- peso;
- accesos;
- medicamentos;
- ayuno;
- riesgos;
- resultados críticos;
- necesidades especiales;
- condición actual.

Herramientas estructuradas como SBAR pueden reducir omisiones.

---

# 16. Principios de vigilancia postoperatoria

Al recibir al niño:

1. vía aérea;
2. respiración;
3. circulación;
4. estado neurológico;
5. dolor;
6. temperatura;
7. herida y drenajes;
8. líquidos y eliminación.

La prioridad inicial es fisiológica, no administrativa.

---

# 17. Vía aérea postoperatoria

Valorar:

- permeabilidad;
- ronquido/estridor;
- secreciones;
- posición;
- reflejos;
- nivel de conciencia.

Un niño somnoliento después de anestesia puede perder tono de vía aérea.

---

# 18. Respiración postoperatoria

Vigilar:

- frecuencia;
- profundidad;
- esfuerzo;
- saturación;
- expansión torácica;
- efectos de opioides/sedantes.

Signos de alarma:

- apnea;
- respiración superficial;
- desaturación persistente;
- estridor;
- retracciones;
- deterioro del nivel de conciencia.

---

# 19. Circulación y perfusión postoperatoria

Valorar:

- frecuencia cardiaca;
- presión;
- pulsos;
- llenado capilar;
- color;
- temperatura;
- sangrado;
- diuresis.

La hipotensión puede aparecer tarde en niños con pérdida circulatoria.

---

# 20. Nivel de conciencia

Valorar:

- despertar;
- orientación según edad;
- respuesta a voz;
- respuesta al dolor;
- pupilas cuando esté indicado.

Diferenciar sedación esperada de deterioro neurológico progresivo.

---

# 21. Dolor agudo postoperatorio

Debe evaluarse con una herramienta apropiada.

Opciones según capacidad:

- escalas observacionales;
- escalas de caras;
- escala numérica en niños mayores/adolescentes.

Siempre reevaluar después de la intervención.

---

# 22. Manejo multimodal del dolor

Puede incluir:

- medidas no farmacológicas;
- analgésicos no opioides;
- opioides cuando estén indicados;
- anestesia regional;
- apoyo psicológico.

El objetivo es analgesia suficiente con vigilancia de efectos adversos.

---

# 23. Medidas no farmacológicas

Ejemplos:

- presencia del cuidador;
- distracción;
- música;
- juego;
- respiración;
- posicionamiento;
- contacto;
- técnicas cognitivo-conductuales apropiadas.

Complementan, pero no reemplazan analgesia indicada.

---

# 24. Seguridad con opioides

Vigilar:

- frecuencia respiratoria;
- profundidad;
- sedación;
- saturación;
- respuesta;
- náuseas;
- prurito;
- retención urinaria.

La sedación progresiva puede preceder depresión respiratoria.

---

# 25. Náuseas y vómitos postoperatorios

Riesgos:

- aspiración;
- deshidratación;
- dolor;
- alteración de herida.

Intervenciones:

- posición segura;
- antiemético prescrito;
- líquidos;
- progresión de dieta;
- vigilar abdomen y tolerancia.

---

# 26. Líquidos y balance

Monitorizar:

- tipo/velocidad de IV;
- ingesta;
- diuresis;
- vómitos;
- drenajes;
- edema;
- peso cuando corresponda.

Los líquidos pediátricos requieren cálculo y reevaluación cuidadosa.

---

# 27. Herida quirúrgica

Observar:

- apósito;
- sangrado;
- drenaje;
- edema;
- eritema;
- dehiscencia;
- olor;
- dolor.

Marcar/registrar progresión del sangrado si el protocolo lo indica.

---

# 28. Drenajes, sondas y dispositivos

Verificar:

- fijación;
- permeabilidad;
- cantidad/características;
- conexiones;
- sitio;
- necesidad continua.

Nunca manipular un drenaje sin comprender su función y orden.

---

# 29. Retención urinaria y diuresis

Valorar:

- hora de última micción;
- volumen;
- dolor;
- distensión vesical;
- líquidos;
- anestesia/medicación.

La oliguria también puede indicar hipovolemia u otra complicación.

---

# 30. Temperatura postoperatoria

Hipotermia puede deberse a:

- quirófano frío;
- exposición;
- líquidos;
- anestesia.

Fiebre requiere contexto:
- tiempo desde cirugía;
- infección;
- inflamación;
- transfusión;
- atelectasia/otras causas.

---

# 31. Movilización y prevención de complicaciones

Cuando está permitido:

- movilización progresiva;
- ejercicios respiratorios apropiados;
- cambios de posición;
- hidratación;
- control de dolor.

Reducen complicaciones respiratorias y favorecen recuperación.

---

# 32. Deterioro postoperatorio: signos críticos

Escalar inmediatamente ante:

- obstrucción de vía aérea;
- apnea;
- desaturación;
- sangrado activo;
- mala perfusión;
- alteración progresiva de conciencia;
- dolor desproporcionado;
- abdomen agudo;
- convulsión;
- anafilaxia.

---

# 33. Alta postoperatoria

Antes del alta verificar:

- estabilidad;
- dolor controlado;
- tolerancia apropiada;
- instrucciones;
- medicamentos;
- cuidado de herida;
- actividad;
- citas;
- signos de alarma;
- comprensión familiar.

Usar teach-back cuando sea posible.

---

# 34. Cuidados paliativos pediátricos: definición

La OMS define los cuidados paliativos pediátricos como cuidado activo integral del:

- cuerpo;
- mente;
- espíritu del niño;
- y apoyo a la familia.

Comienzan desde el diagnóstico de una enfermedad que amenaza o limita la vida y pueden continuar aunque el niño reciba tratamiento dirigido a la enfermedad.

---

# 35. Paliativo no significa “dejar de tratar”

Puede coexistir con:

- quimioterapia;
- cirugía;
- ventilación;
- antibióticos;
- tratamientos dirigidos;
- rehabilitación.

El objetivo es reducir sufrimiento y mejorar calidad de vida.

---

# 36. Necesidades del niño en cuidados paliativos

Valorar:

- dolor;
- disnea;
- náuseas;
- fatiga;
- ansiedad;
- sueño;
- movilidad;
- alimentación;
- comunicación;
- juego;
- escuela;
- espiritualidad/cultura;
- relaciones.

La valoración debe ser repetida porque las necesidades cambian.

---

# 37. Control de síntomas

Principios:

- evaluar sistemáticamente;
- tratar causas reversibles cuando corresponda;
- aliviar síntomas;
- anticipar crisis;
- individualizar;
- reevaluar.

No esperar que el niño verbalice espontáneamente el sufrimiento.

---

# 38. Dolor crónico y paliativo

La OMS recomienda un enfoque centrado en niño/familia con intervenciones:

- físicas;
- psicológicas;
- farmacológicas.

El plan debe individualizar beneficios, riesgos y objetivos.

---

# 39. Comunicación de enfermedad grave

Debe ser:

- clara;
- honesta;
- gradual;
- apropiada a la edad;
- culturalmente sensible;
- coordinada con la familia/equipo.

No mentir al niño ni excluirlo automáticamente de toda conversación.

---

# 40. Preguntas difíciles del niño

Cuando pregunta sobre muerte o pronóstico:

- explorar qué entiende;
- preguntar qué desea saber;
- responder según desarrollo;
- coordinar con familia/equipo;
- evitar falsas promesas;
- permitir emociones.

Enfermería puede acompañar incluso cuando no tiene todas las respuestas.

---

# 41. Apoyo a la familia

Puede incluir:

- escucha;
- información;
- participación;
- descanso;
- recursos sociales;
- apoyo espiritual;
- preparación para cambios;
- orientación práctica.

La familia también puede experimentar ansiedad, culpa, duelo anticipado y agotamiento.

---

# 42. Hermanos y red familiar

Cuando sea apropiado:

- incluir hermanos;
- explicar en lenguaje acorde a edad;
- evitar secretos dañinos;
- facilitar contacto;
- apoyar rutinas.

Cada familia maneja la enfermedad de manera diferente.

---

# 43. Decisiones compartidas

El equipo debe:

- explicar opciones;
- aclarar objetivos;
- reconocer valores;
- escuchar preferencias;
- respetar el marco legal;
- incluir al niño según capacidad.

Las decisiones no deben recaer solo sobre la enfermera.

---

# 44. Final de vida

Cuando la muerte es esperada:

- priorizar confort;
- controlar síntomas;
- preservar dignidad;
- facilitar presencia familiar;
- respetar cultura/espiritualidad;
- evitar intervenciones no alineadas con objetivos acordados.

Los cuidados al final de la vida son una parte de los cuidados paliativos, no su totalidad.

---

# 45. Duelo y seguimiento

El apoyo puede continuar después de la muerte.

Incluye:

- presencia;
- respeto;
- recuerdos/rituales según familia;
- orientación;
- derivación si existe sufrimiento complicado.

No imponer frases de consuelo ni tiempos “correctos” para el duelo.

---

# 46. Seguridad y calidad pediátrica: por qué es diferente

La OMS 2025 identifica riesgos particulares porque el niño:

- cambia rápidamente;
- requiere cálculos por peso;
- usa equipos de diferentes tamaños;
- depende de cuidadores;
- puede no comunicar síntomas;
- es vulnerable a errores diagnósticos y farmacológicos.

La seguridad debe diseñarse específicamente para pediatría.

---

# 47. Metas OMS de seguridad infantil 2025

Las áreas prioritarias incluyen:

- involucrar niños, padres y familias;
- mejorar seguridad de medicamentos;
- mejorar seguridad diagnóstica;
- prevenir infecciones asociadas a la atención;
- reducir riesgos en recién nacidos pequeños/enfermos.

---

# 48. Seguridad de medicamentos

Medidas:

- peso en kg;
- alergias;
- cálculo independiente;
- concentración;
- límites de dosis;
- bombas correctamente programadas;
- etiquetado;
- conciliación;
- doble verificación según riesgo.

Evitar abreviaturas ambiguas y ceros decimales peligrosos.

---

# 49. Medicamentos de alto riesgo

Pueden requerir medidas reforzadas:

- insulina;
- opioides;
- anticoagulantes;
- electrolitos concentrados;
- quimioterapia;
- sedantes.

La lista exacta depende de la institución.

---

# 50. Bombas de infusión

Antes de iniciar:

- paciente;
- medicamento;
- concentración;
- dosis;
- peso;
- velocidad;
- límites;
- línea correcta.

Después:
- revisar respuesta;
- sitio;
- alarmas;
- volumen restante.

---

# 51. Prevención de infecciones asociadas a la atención

Incluye:

- higiene de manos;
- técnica aséptica;
- cuidado de catéteres;
- retiro de dispositivos innecesarios;
- limpieza;
- aislamiento;
- vacunación del personal/paciente según política.

Los dispositivos invasivos aumentan riesgo.

---

# 52. Seguridad de catéteres y líneas

Verificar:

- indicación;
- sitio;
- fijación;
- permeabilidad;
- signos de infección;
- extravasación;
- identificación de líneas.

Evitar conexiones erróneas y tracción.

---

# 53. Prevención de caídas

Evaluar:

- edad;
- desarrollo;
- sedación;
- movilidad;
- medicamentos;
- entorno.

Medidas:
- barandas;
- acompañamiento;
- calzado;
- educación;
- supervisión.

No confiar solo en una escala.

---

# 54. Lesiones por presión y dispositivos

Riesgos:

- inmovilidad;
- mala perfusión;
- sedación;
- nutrición deficiente;
- máscaras;
- tubos;
- férulas;
- catéteres.

Inspeccionar piel bajo dispositivos cuando sea seguro.

---

# 55. Seguridad diagnóstica

Evitar:

- atribuir deterioro solo a ansiedad;
- normalizar signos por edad sin reevaluar;
- sesgos;
- ignorar preocupación familiar;
- demora en resultados críticos.

Si el niño “no parece como siempre”, la preocupación merece atención.

---

# 56. Reconocimiento del deterioro

Herramientas como PEWS pueden ayudar, pero:

- no sustituyen juicio clínico;
- no deben retrasar respuesta;
- la tendencia importa;
- familia puede detectar cambios tempranos.

Escalar ante preocupación seria aun con puntaje bajo.

---

# 57. Comunicación segura

Usar comunicación estructurada:

- situación;
- antecedentes;
- valoración;
- recomendación.

Confirmar información crítica y órdenes verbales según política.

---

# 58. Participación familiar en seguridad

La familia puede:

- confirmar medicamentos;
- advertir cambios;
- hacer preguntas;
- participar en higiene;
- informar alergias;
- identificar errores potenciales.

Debe existir un ambiente donde preguntar sea seguro.

---

# 59. Derechos, dignidad y no discriminación

El cuidado debe respetar:

- privacidad;
- dignidad;
- edad;
- discapacidad;
- cultura;
- idioma;
- situación socioeconómica;
- género;
- necesidades familiares.

La seguridad también incluye evitar daño emocional y trato discriminatorio.

---

# 60. Reporte de incidentes

Ante evento o casi-evento:

- atender primero al paciente;
- notificar;
- documentar hechos;
- seguir sistema institucional;
- participar en aprendizaje.

No ocultar errores ni alterar registros.

---

# 61. Calidad: medir para mejorar

Indicadores pueden incluir:

- infecciones;
- caídas;
- errores de medicamentos;
- reingresos;
- dolor;
- cumplimiento de listas;
- deterioros no reconocidos;
- satisfacción/experiencia.

Medir no es culpar: es identificar oportunidades de mejora.

---

# 62. Cultura de seguridad

Características:

- comunicación abierta;
- liderazgo;
- aprendizaje;
- trabajo en equipo;
- reporte;
- responsabilidad justa;
- participación del paciente/familia.

La seguridad depende del sistema y del profesional.

---

# 63. Errores frecuentes de examen

1. Preparar cirugía sin confirmar identidad/procedimiento.
2. Prometer al niño que no sentirá dolor.
3. Interpretar somnolencia postanestésica progresiva como “normal”.
4. Administrar opioide sin vigilar respiración/sedación.
5. Dar alta sin enseñar signos de alarma.
6. Confundir cuidados paliativos con abandono del tratamiento.
7. Esperar fase terminal para iniciar paliativos.
8. Excluir siempre al niño de conversaciones.
9. Usar peso en libras para calcular medicamentos.
10. Confiar solo en un PEWS ante deterioro evidente.
11. Ignorar a la familia cuando reporta un cambio.
12. Mantener dispositivos invasivos sin reevaluar necesidad.
13. Omitir handoff estructurado.
14. Ocultar o borrar un incidente.

---

# 64. Situaciones originales tipo examen$$,
  1
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-2',
  $$Caso 1 — Identidad preoperatoria$$,
  $$Dos niños tienen apellidos similares. El brazalete de uno está ilegible.

**Respuesta:** detener el proceso y confirmar identidad antes de cualquier medicamento o traslado.

---$$,
  2
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-3',
  $$Caso 2 — Ayuno$$,
  $$La madre informa que el niño bebió recientemente, pero la hoja dice “NPO”.

**Respuesta:** no ignorar la información; verificar hora/tipo de ingesta y comunicar al equipo de anestesia.

---$$,
  3
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-4',
  $$Caso 3 — Ansiedad$$,
  $$Preescolar llora y pregunta si la cirugía “va a doler”.

**Respuesta:** usar lenguaje honesto y acorde a edad, explicar medidas para controlar molestias y evitar prometer ausencia total de dolor.

---$$,
  4
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-5',
  $$Caso 4 — Postoperatorio$$,
  $$Niño después de opioide está cada vez más somnoliento y respira superficialmente.

**Respuesta:** priorizar vía aérea/respiración, valorar depresión respiratoria y activar respuesta según protocolo.

---$$,
  5
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-6',
  $$Caso 5 — Sangrado$$,
  $$Apósitos se saturan rápidamente y el niño está pálido y taquicárdico.

**Respuesta:** sospechar hemorragia, priorizar ABC/perfusión y notificar/escalar inmediatamente.

---$$,
  6
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-7',
  $$Caso 6 — Dolor$$,
  $$Niño no verbal hace muecas, se protege el abdomen y llora con movilización.

**Respuesta:** utilizar escala observacional apropiada y tratar/revaluar dolor.

---$$,
  7
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-8',
  $$Caso 7 — Paliativos$$,
  $$Niño inicia quimioterapia y la familia pregunta si aceptar paliativos significa “rendirse”.

**Respuesta:** explicar que pueden comenzar desde el diagnóstico y coexistir con tratamiento dirigido a la enfermedad.

---$$,
  8
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-9',
  $$Caso 8 — Comunicación$$,
  $$Adolescente con enfermedad limitante pregunta directamente sobre lo que está pasando.

**Respuesta:** explorar qué entiende y qué desea saber, responder apropiadamente y coordinar con familia/equipo sin mentir.

---$$,
  9
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-10',
  $$Caso 9 — Infusión$$,
  $$Bomba de medicamento muestra una velocidad muy diferente de la calculada por peso.

**Respuesta:** detener/verificar antes de continuar; confirmar paciente, concentración, dosis, peso y programación.

---$$,
  10
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-11',
  $$Caso 10 — Deterioro$$,
  $$Madre insiste en que “algo está mal” aunque PEWS actual no es alto.

**Respuesta:** reevaluar al niño y escalar si la preocupación persiste; la herramienta no sustituye la valoración.

---$$,
  11
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-12',
  $$Caso 11 — Catéter$$,
  $$Sitio IV está edematizado y doloroso durante una infusión.

**Respuesta:** detener la infusión y valorar infiltración/extravasación; seguir protocolo específico.

---$$,
  12
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-13',
  $$Caso 12 — Handoff$$,
  $$Paciente vuelve de quirófano sin información clara sobre último opioide.

**Respuesta:** obtener/confirmar el dato antes de administrar otra dosis; un handoff incompleto es un riesgo.

---$$,
  13
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-14',
  $$Caso 13 — Caída$$,
  $$Niño sedado intenta levantarse solo.

**Respuesta:** aplicar medidas de prevención de caída y supervisión; la edad no elimina el riesgo.

---$$,
  14
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-15',
  $$Caso 14 — Incidente$$,
  $$Se detecta que casi se administra un medicamento al paciente equivocado, pero se corrige antes de darlo.

**Respuesta:** proteger al paciente y reportar el casi-evento según sistema institucional para aprendizaje.

---

# 65. Fuentes y validación$$,
  15
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-16',
  $$Fuentes rectoras CICDE$$,
  $$1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen por Competencia de Profesionales de Enfermería*, tercera edición, Panamá, 2026.
2. **Hockenberry, M.; Rodgers, C.; Wilson, D.** *Wong. Enfermería Pediátrica*, 10.ª edición, Elsevier.
3. **Posada Díaz, A.; Gómez Ramírez, J.; Ramírez Gómez, H.** *El Niño Sano*. Editorial Médica Panamericana, 2005.$$,
  16
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-17',
  $$Panamá — fuente oficial$$,
  $$4. **MINSA. Resolución N.° 306 de 5 de junio de 2024.** Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años.  
   https://www.minsa.gob.pa/normatividad/resolucion-ndeg-306-de-miercoles-05-de-junio-de-2024-que-aprueba-las-normas-tecnicas-y$$,
  17
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-18',
  $$Fuentes internacionales complementarias$$,
  $$5. **WHO. World Patient Safety Day 2025 — Safe care for every newborn and every child.**  
   https://www.who.int/campaigns/world-patient-safety-day/2025

6. **WHO. World Patient Safety Day Goals 2025.**  
   https://www.who.int/publications/b/80934

7. **WHO. Clinical checklists — Surgical Safety Checklist.**  
   https://www.who.int/tools/clinical-checklists

8. **WHO. Safer surgery — tools and resources.**  
   https://www.who.int/teams/integrated-health-services/quality-of-care-and-patient-safety/patient-safety-guidance-and-tools/safe-surgery/tool-and-resources

9. **WHO. Palliative care for children.**  
   https://www.who.int/europe/news-room/fact-sheets/item/palliative-care-for-children

10. **WHO. Guidelines on the management of chronic pain in children.**  
    https://www.who.int/publications/i/item/9789240017870

11. **WHO. Guidelines on the management of chronic pain in children: executive summary.**  
    https://www.who.int/publications/i/item/9789240021556

12. **WHO. Patient safety guidance and tools.**  
    https://www.who.int/teams/integrated-health-services/quality-of-care-and-patient-safety

---

# 66. Actualizaciones y límites$$,
  18
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-19',
  $$Seguridad pediátrica$$,
  $$La campaña OMS 2025 priorizó específicamente la seguridad de recién nacidos y niños y destacó como causas frecuentes de daño:

- errores de medicamentos;
- errores diagnósticos;
- infecciones asociadas a la atención;
- problemas con dispositivos/equipos;
- señales de deterioro no reconocidas.

Esto refuerza el enfoque de este tema.$$,
  19
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-20',
  $$Cirugía$$,
  $$La Lista de Verificación de Seguridad Quirúrgica OMS es una herramienta internacional de seguridad. Su aplicación concreta debe adaptarse al protocolo institucional.$$,
  20
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-21',
  $$Cuidados paliativos$$,
  $$Se presentan como cuidado activo integral que puede iniciar desde el diagnóstico y coexistir con tratamiento dirigido a la enfermedad. No se limita a los últimos días de vida.$$,
  21
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-05-22',
  $$Dolor$$,
  $$No se incluyen dosis analgésicas específicas fuera de protocolo. La selección y dosificación dependen de edad, peso, condición clínica y política institucional.

---

# 67. Control de calidad

- Alcance cotejado contra CICDE 2026.
- 3/3 subtemas explícitos cubiertos.
- Norma panameña infantil vigente incorporada.
- Seguridad pediátrica actualizada con OMS 2025.
- Seguridad quirúrgica basada en checklist OMS.
- Paliativos diferenciados de cuidado terminal.
- Manejo del dolor basado en enfoque OMS.
- No se reproducen escalas o checklists propietarios completos.
- No se presentan tiempos universales de ayuno sin protocolo.
- No se incluyen dosis farmacológicas descontextualizadas.
- Casos de examen originales.
- No se declara revisión clínica humana inexistente.

---

# 68. Estado para integración

**Estado:** `REVIEW`

Motivo:

- alcance, contenido y fuentes fueron sometidos a validación documental/académica;
- no existe todavía revisor clínico humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` por una revisión realizada por IA.

**Cobertura CICDE PEDS-05: 3/3 subtemas explícitos.**

**Situaciones originales tipo examen: 14.**$$,
  22
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-1',
  $$Metrología, administración farmacológica y Proceso de Atención de Enfermería$$,
  $$**Área:** Enfermería Pediátrica  
**Código:** PEDS-06  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión documental:** 2026-09-11

---

# 1. Alcance oficial CICDE

El lineamiento CICDE 2026 incluye expresamente el tema **“Metrología, administración farmacológica y Proceso de Atención de Enfermería”** y exige estudiar:

1. Sistemas de medidas y conversiones aplicadas a pediatría.
2. Cálculo y preparación de medicamentos según peso y edad.
3. Principios de seguridad en la administración farmacológica pediátrica.
4. Aplicación del Proceso de Atención de Enfermería en el niño y adolescente.
5. Valoración, diagnóstico, planificación, ejecución y evaluación de los cuidados.
6. Integración de la familia en el proceso de cuidado.

Este paquete conserva íntegramente esos seis puntos y enfatiza cálculo dimensional, prevención de errores, verificación independiente y razonamiento clínico.

> **Importante:** los ejemplos numéricos de este documento son ejercicios académicos. No constituyen prescripciones. Las dosis reales deben verificarse en la orden médica, formulario/fuente farmacológica institucional y protocolo vigente.

---

# 2. Objetivos de aprendizaje

Al finalizar el tema, el estudiante debe poder:

1. Convertir correctamente unidades métricas utilizadas en pediatría.
2. Trabajar siempre con peso en kilogramos para cálculos basados en peso.
3. Diferenciar `mg/kg/dosis` de `mg/kg/día`.
4. Calcular dosis totales diarias y dosis por administración.
5. Calcular volumen a administrar a partir de concentración disponible.
6. Calcular velocidades de infusión en mL/h y gtt/min.
7. Reconocer cuándo un resultado matemático es clínicamente improbable.
8. Verificar dosis mínima, máxima y límites institucionales cuando corresponda.
9. Aplicar principios de seguridad de medicamentos pediátricos.
10. Evitar errores de decimales, unidades, concentraciones y peso.
11. Explicar el PAE como proceso continuo y cíclico.
12. Diferenciar datos subjetivos y objetivos.
13. Formular problemas/prioridades de enfermería basados en la valoración.
14. Planificar resultados medibles e intervenciones seguras.
15. Ejecutar, documentar y reevaluar el cuidado.
16. Integrar a la familia sin sustituir el rol profesional.
17. Resolver problemas tipo CICDE paso a paso.

---

# 3. ¿Qué es metrología aplicada a enfermería?

En este contexto, metrología significa trabajar de forma segura y consistente con:

- peso;
- volumen;
- longitud;
- tiempo;
- concentración;
- velocidad de infusión;
- dosis por peso o superficie corporal.

En pediatría, un error pequeño de unidad puede producir un error grande de dosis.

---

# 4. Sistema métrico básico

Relaciones esenciales:

- 1 kilogramo (kg) = 1000 gramos (g)
- 1 gramo (g) = 1000 miligramos (mg)
- 1 miligramo (mg) = 1000 microgramos (mcg)
- 1 litro (L) = 1000 mililitros (mL)

Para administración de medicamentos, es preferible escribir **mL** y evitar abreviaturas ambiguas.

---

# 5. Conversión entre kg y g

Ejemplo:

Un lactante pesa 4.2 kg.

\[
4.2 \text{ kg} \times 1000 = 4200 \text{ g}
\]

Resultado: **4200 g**.

---

# 6. Conversión entre g, mg y mcg

Ejemplos:

\[
0.5 \text{ g} \times 1000 = 500 \text{ mg}
\]

\[
0.25 \text{ mg} \times 1000 = 250 \text{ mcg}
\]

Antes de calcular una dosis, todas las unidades deben ser compatibles.

---

# 7. Libras a kilogramos

Fórmula académica habitual:

\[
kg = \frac{lb}{2.2}
\]

Ejemplo:

\[
33 lb \div 2.2 = 15 kg
\]

**Resultado: 15 kg.**

En la práctica clínica, el peso pediátrico debe medirse y documentarse directamente en **kilogramos** siempre que sea posible, en lugar de depender de conversiones.

---

# 8. Kilogramos a libras

\[
lb = kg \times 2.2
\]

Ejemplo:

\[
12 kg \times 2.2 = 26.4 lb
\]

Para cálculo farmacológico se vuelve al valor en **kg**.

---

# 9. Volumen: L y mL

\[
1 L = 1000 mL
\]

Ejemplo:

\[
0.25 L \times 1000 = 250 mL
\]

Nunca confundir `0.25 L` con `0.25 mL`.

---

# 10. Concentración

Una concentración expresa cuánto fármaco existe en un volumen determinado.

Ejemplo:

`125 mg / 5 mL`

Significa que cada 5 mL contienen 125 mg.

También puede expresarse:

\[
125 mg \div 5 mL = 25 mg/mL
\]

---

# 11. Análisis dimensional

El análisis dimensional ayuda a comprobar que las unidades se cancelan correctamente.

Ejemplo:

\[
10 \frac{mg}{kg} \times 15 kg = 150 mg
\]

Los `kg` se cancelan y el resultado queda en `mg`.

Si al final quedan unidades incorrectas, el cálculo debe revisarse.

---

# 12. Diferencia crítica: mg/kg/dosis vs mg/kg/día

**mg/kg/dosis**
- el cálculo da la cantidad para **cada administración**.

**mg/kg/día**
- el cálculo da el **total de 24 horas**;
- luego debe dividirse entre el número de dosis diarias.

Confundirlos puede multiplicar la dosis.

---

# 13. Cálculo mg/kg/dosis

Ejercicio:

Orden académica: `10 mg/kg/dosis`  
Peso: `15 kg`

\[
10 \times 15 = 150 mg/dosis
\]

Resultado: **150 mg por dosis**.

Antes de administrar, todavía debe compararse con límites seguros y concentración disponible.

---

# 14. Cálculo mg/kg/día

Ejercicio:

Orden académica: `30 mg/kg/día`  
Peso: `20 kg`

\[
30 \times 20 = 600 mg/día
\]

Si se administra cada 8 horas:

24 h ÷ 8 h = 3 dosis/día.

\[
600 \div 3 = 200 mg/dosis
\]

Resultado: **200 mg por administración**.

---

# 15. Frecuencia y número de dosis

Relaciones:

- cada 24 h → 1 dosis/día
- cada 12 h → 2 dosis/día
- cada 8 h → 3 dosis/día
- cada 6 h → 4 dosis/día

No dividir una dosis que ya está prescrita como `mg/kg/dosis`.

---

# 16. Verificación de rango seguro

Proceso:

1. identificar peso en kg;
2. calcular límite inferior;
3. calcular límite superior;
4. calcular dosis ordenada;
5. comparar.

Ejemplo académico:

Rango: `5–10 mg/kg/dosis`  
Peso: `12 kg`

Mínimo:

\[
5 \times 12 = 60 mg
\]

Máximo:

\[
10 \times 12 = 120 mg
\]

Una orden de `90 mg/dosis` cae matemáticamente dentro del rango **60–120 mg/dosis**.

Esto no sustituye la verificación clínica del medicamento.

---

# 17. Dosis máxima

Algunos medicamentos tienen:

- límite por kg;
- límite máximo por dosis;
- límite máximo diario.

La enfermera debe verificar **ambos** cuando existan.

Una dosis calculada por peso no debe aceptarse automáticamente si excede el máximo establecido por la fuente institucional.

---

# 18. Fórmula “deseado/disponible × cantidad”

Para medicamentos líquidos o sólidos:

\[
Volumen = \frac{Dosis\ deseada}{Dosis\ disponible} \times Volumen\ disponible
\]

Ejemplo:

Orden: `150 mg`  
Disponible: `75 mg / 5 mL`

\[
\frac{150}{75} \times 5 = 10 mL
\]

Resultado: **10 mL**.

---

# 19. Cálculo con concentración mg/mL

Si el frasco contiene `25 mg/mL` y se requieren `100 mg`:

\[
100 mg \div 25 mg/mL = 4 mL
\]

Resultado: **4 mL**.

---

# 20. Tabletas

Ejemplo académico:

Orden: `250 mg`  
Disponible: `500 mg/tableta`

\[
250 \div 500 = 0.5\ tableta
\]

Solo puede administrarse media tableta si la formulación permite división segura y la orden/protocolo lo permite.

---

# 21. Medicamentos líquidos y jeringa oral

Para pequeños volúmenes, la jeringa oral suele permitir mayor precisión que vasos dosificadores.

No utilizar cucharas domésticas para medir medicamentos.

La unidad preferida es **mL**.

---

# 22. Reconstitución

Después de reconstituir un medicamento se debe verificar:

- diluyente correcto;
- volumen indicado;
- concentración final;
- estabilidad;
- almacenamiento;
- fecha/hora;
- vía;
- etiquetado.

Nunca calcular con la concentración previa a reconstitución si la concentración final es diferente.

---

# 23. Concentración después de reconstitución

Ejemplo académico:

Un vial reconstituido queda con `100 mg/mL`.

Se requieren `250 mg`.

\[
250 \div 100 = 2.5 mL
\]

Resultado: **2.5 mL**.

---

# 24. Infusión: mL por hora

\[
mL/h = \frac{Volumen\ total}{Horas}
\]

Ejemplo:

`360 mL` en `8 h`

\[
360 \div 8 = 45 mL/h
\]

Resultado: **45 mL/h**.

---

# 25. Tiempo de infusión

\[
Tiempo = \frac{Volumen}{mL/h}
\]

Ejemplo:

`240 mL` a `40 mL/h`

\[
240 \div 40 = 6 h
\]

Resultado: **6 horas**.

---

# 26. Goteo manual: gtt/min

\[
gtt/min = \frac{mL \times factor\ de\ goteo}{minutos}
\]

Ejemplo académico:

120 mL en 2 horas  
Factor: 20 gtt/mL

2 horas = 120 minutos

\[
\frac{120 \times 20}{120} = 20 gtt/min
\]

Resultado: **20 gtt/min**.

---

# 27. Microgotero

Un microgotero tradicional suele estar calibrado a `60 gtt/mL`.

Aun así, siempre debe verificarse el factor impreso en el equipo real.

No asumir el factor de goteo por memoria si puede comprobarse.

---

# 28. Velocidad basada en peso y tiempo

Ejercicio académico con “Medicamento X”:

Orden: `5 mcg/kg/min`  
Peso: `20 kg`

\[
5 \times 20 = 100 mcg/min
\]

Por hora:

\[
100 \times 60 = 6000 mcg/h = 6 mg/h
\]

Si la solución tiene `0.8 mg/mL`:

\[
6 mg/h \div 0.8 mg/mL = 7.5 mL/h
\]

Resultado matemático: **7.5 mL/h**.

Este tipo de infusión de alto riesgo requiere verificación independiente y protocolo.

---

# 29. Conversión mcg a mg en infusiones

\[
1000 mcg = 1 mg
\]

Ejemplo:

\[
6000 mcg = 6 mg
\]

No mover el punto decimal “de memoria”; escribir el factor de conversión reduce errores.

---

# 30. Unidades y mEq

Electrolitos pueden expresarse en:

- mmol;
- mEq;
- mg;
- mL.

No convertir entre estas unidades sin conocer la sustancia y su equivalencia específica.

**mEq no es intercambiable universalmente con mg.**

---

# 31. Insulina y “unidades”

Insulina se prescribe en **unidades**, no en mL como dosis primaria.

La concentración debe verificarse antes de convertir a volumen.

No abreviar “unidades” como `U` en órdenes escritas si la política de seguridad lo desaconseja, porque puede confundirse con un número.

---

# 32. Superficie corporal (BSA)

Algunos medicamentos, especialmente en oncología, pueden dosificarse por `mg/m²`.

Una fórmula conocida es Mosteller:

\[
BSA(m^2)=\sqrt{\frac{talla(cm)\times peso(kg)}{3600}}
\]

Debe utilizarse solo cuando la prescripción y protocolo indiquen dosificación por superficie corporal.

---

# 33. Ejemplo de BSA

Peso: `25 kg`  
Talla: `120 cm`

\[
BSA = \sqrt{\frac{25 \times 120}{3600}}
\]

\[
BSA = \sqrt{0.8333} \approx 0.91 m^2
\]

Si un ejercicio académico prescribe `80 mg/m²`:

\[
80 \times 0.91 \approx 72.8 mg
\]

Resultado aproximado: **73 mg**, sujeto a reglas institucionales de redondeo.

---

# 34. Limitaciones de la BSA

La fórmula de Mosteller es una estimación.

Un estudio pediátrico encontró buena correlación global, pero también desviaciones importantes, especialmente en neonatos y lactantes.

Por eso:

- usar la fórmula especificada por el protocolo;
- no intercambiar fórmulas sin autorización;
- verificar cálculos de medicamentos de índice terapéutico estrecho.

---

# 35. Redondeo

El redondeo depende de:

- dosis;
- volumen;
- precisión del dispositivo;
- política institucional;
- tipo de medicamento.

Regla de seguridad:

**no redondear prematuramente en pasos intermedios**.

Mantener suficientes decimales hasta el resultado final.

---

# 36. Cero a la izquierda

Correcto:

`0.5 mg`

Incorrecto:

`.5 mg`

El cero a la izquierda reduce el riesgo de leer `.5` como `5`.

---

# 37. Cero final innecesario

Correcto:

`5 mg`

Evitar:

`5.0 mg`

El decimal puede pasar inadvertido y transformarse visualmente en `50 mg`.

---

# 38. Espacio entre número y unidad

Preferir:

`10 mg`

y no:

`10mg`

Separar claramente cifra y unidad disminuye errores de lectura.

---

# 39. Peso pediátrico en kg

La Joint Commission recomienda que los pacientes pediátricos se pesen en **kilogramos** y que kg sea la nomenclatura estándar en registros, prescripciones y comunicación clínica.

Esto reduce errores de conversión libra/kg.

---

# 40. Peso medido vs estimado

Siempre que sea posible:

- medir peso real;
- usar equipo apropiado;
- registrar fecha/hora;
- confirmar si el peso cambió significativamente.

En emergencias puede ser necesario estimar, pero el método y limitación deben quedar claros.

---

# 41. Error clásico lb → kg

Si un niño pesa `22 lb` pero se registra erróneamente `22 kg`, la dosis por kg podría ser aproximadamente **2.2 veces mayor** de lo esperado.

Este es un error de sistema conocido en pediatría.

---

# 42. Derechos de administración de medicamentos

Las instituciones pueden utilizar diferentes listas de “derechos”.

Elementos esenciales suelen incluir:

- paciente correcto;
- medicamento correcto;
- dosis correcta;
- vía correcta;
- hora correcta;
- indicación correcta;
- documentación correcta;
- respuesta/evaluación;
- educación;
- derecho del paciente/familia a preguntar o rechazar conforme al contexto.

No memorizar un número fijo de “derechos” como si fuera universal.

---

# 43. Identificación del paciente

Utilizar identificadores institucionales adecuados.

No usar:

- número de habitación como único identificador;
- “el niño de la cama 3”;
- apariencia.

Verificar antes de administrar.

---

# 44. Alergias

Antes de administrar:

- revisar alergias documentadas;
- preguntar cuando sea posible;
- diferenciar alergia de efecto adverso/intolerancia;
- documentar reacción conocida;
- detener y escalar si aparece reacción grave.

---

# 45. Indicación

Preguntar:

**¿Por qué recibe este medicamento?**

Una dosis matemáticamente correcta puede ser inapropiada si:

- el fármaco es incorrecto;
- la indicación no corresponde;
- existe contraindicación;
- hay duplicación.

---

# 46. Conciliación de medicamentos

Especialmente importante al:

- ingreso;
- traslado;
- alta;
- cambio de servicio.

Comparar medicamentos domiciliarios, órdenes nuevas, dosis, horarios y duplicidades.

---

# 47. Medicamentos de alto riesgo

Pediatría es especialmente vulnerable a errores con medicamentos de alto riesgo.

Ejemplos institucionalmente frecuentes:

- insulina;
- opioides;
- anticoagulantes;
- electrolitos concentrados;
- quimioterapia;
- sedantes;
- infusiones vasoactivas.

La lista exacta depende de la institución.

---

# 48. Verificación independiente

Para medicamentos de alto riesgo puede requerirse que otro profesional verifique de forma independiente:

- peso;
- cálculo;
- concentración;
- dosis;
- velocidad;
- paciente;
- bomba.

Una segunda persona no debe simplemente aceptar el cálculo original.

---

# 49. Bombas de infusión

Antes de iniciar:

- verificar medicamento;
- concentración;
- peso;
- dosis;
- velocidad;
- línea;
- límites programados.

Después:

- comprobar respuesta;
- revisar alarmas;
- revisar sitio IV;
- registrar cambios.

Una “smart pump” no elimina la necesidad de razonamiento.

---

# 50. Código de barras

Puede reducir errores de identificación, pero:

- no reemplaza la verificación clínica;
- no debe “bypassearse” rutinariamente;
- un escaneo correcto no garantiza que una dosis calculada esté bien.

---

# 51. Administración oral

Confirmar:

- capacidad de deglución;
- formulación;
- volumen;
- sabor/tolerancia;
- posición segura.

Para líquidos:
- utilizar dispositivo de medición adecuado;
- administrar lentamente;
- evitar mezclar en gran volumen de alimento que el niño podría no consumir.

---

# 52. Sondas enterales

Antes de administrar:

- verificar ubicación/uso de la sonda según protocolo;
- compatibilidad del medicamento;
- si puede triturarse;
- necesidad de pausas de alimentación;
- lavado apropiado.

No triturar formulaciones de liberación modificada o recubrimiento especial sin verificar.

---

# 53. Administración IM y SC

La elección de:

- sitio;
- aguja;
- volumen;
- técnica

depende de edad, masa muscular, medicamento y protocolo.

Evitar memorizar un volumen universal para todos los niños.

---

# 54. Administración IV

Riesgos:

- velocidad excesiva;
- concentración incorrecta;
- incompatibilidad;
- infiltración/extravasación;
- sobrecarga de volumen;
- error de línea.

En lactantes, incluso el volumen de dilución y flush puede ser clínicamente relevante.

---

# 55. Compatibilidad

No mezclar medicamentos IV sin verificar compatibilidad.

Verificar:

- solución;
- concentración;
- vía;
- línea;
- secuencia;
- necesidad de lavado.

La precipitación visible es una señal de incompatibilidad, pero algunas incompatibilidades no son visibles.

---

# 56. Extravasación/infiltración

Ante dolor, edema, cambio de color o resistencia:

- detener la infusión;
- valorar;
- seguir protocolo;
- no retirar automáticamente el acceso si el protocolo de un medicamento vesicante requiere aspiración o antídoto;
- documentar y escalar.

---

# 57. Ejercicio integrado 1 — dosis y volumen

Peso: `18 kg`  
Orden académica: `12 mg/kg/dosis`  
Disponible: `108 mg/3 mL`

Paso 1:

\[
12 \times 18 = 216 mg/dosis
\]

Paso 2:

\[
108 mg / 3 mL = 36 mg/mL
\]

Paso 3:

\[
216 \div 36 = 6 mL
\]

**Resultado matemático: 216 mg = 6 mL por dosis.**

---

# 58. Ejercicio integrado 2 — dosis diaria

Peso: `24 kg`  
Orden académica: `40 mg/kg/día` dividida cada 6 h.

Total diario:

\[
40 \times 24 = 960 mg/día
\]

Cada 6 h = 4 dosis:

\[
960 \div 4 = 240 mg/dosis
\]

**Resultado: 240 mg por dosis.**

---

# 59. Ejercicio integrado 3 — infusión

Volumen: `500 mL`  
Tiempo: `10 h`

\[
500 \div 10 = 50 mL/h
\]

**Resultado: 50 mL/h.**

Siempre verificar si ese volumen total es clínicamente apropiado para el paciente; el ejercicio evalúa matemáticas, no prescripción.

---

# 60. Ejercicio integrado 4 — goteo

Volumen: `90 mL`  
Tiempo: `1.5 h = 90 min`  
Factor: `20 gtt/mL`

\[
\frac{90 \times 20}{90} = 20 gtt/min
\]

**Resultado: 20 gtt/min.**

---

# 61. Prueba de plausibilidad

Después de calcular, preguntar:

- ¿la unidad final es correcta?
- ¿el volumen cabe razonablemente en el dispositivo?
- ¿el resultado es 10 veces mayor o menor de lo esperado?
- ¿usé kg?
- ¿confundí mg con mcg?
- ¿confundí dosis diaria con dosis individual?
- ¿la concentración es la correcta?

La calculadora no detecta una premisa equivocada.

---

# 62. Proceso de Atención de Enfermería (PAE)

El PAE es un proceso sistemático para:

- valorar;
- identificar problemas/respuestas;
- planificar;
- ejecutar cuidados;
- evaluar resultados.

Es **continuo y cíclico**.

---

# 63. Las cinco etapas solicitadas por CICDE

CICDE enumera:

1. valoración;
2. diagnóstico;
3. planificación;
4. ejecución;
5. evaluación.

Algunos estándares profesionales separan además **identificación de resultados** como componente propio. Para el examen se conserva la estructura de cinco etapas solicitada por CICDE, integrando resultados dentro de la planificación.

---

# 64. Valoración

Recoger datos:

**Subjetivos**
- dolor referido;
- náuseas;
- percepción familiar;
- síntomas.

**Objetivos**
- signos vitales;
- peso;
- saturación;
- examen físico;
- laboratorio;
- ingesta/diuresis.

En pediatría, el cuidador es una fuente importante, pero no reemplaza la observación del niño.

---

# 65. Valoración pediátrica integral

Incluir:

- edad y desarrollo;
- antecedentes;
- estado inmunitario;
- alimentación;
- eliminación;
- dolor;
- respiración;
- hidratación;
- crecimiento;
- conducta;
- sueño;
- escuela;
- ambiente;
- seguridad;
- familia.

---

# 66. Agrupación de datos

Antes de formular problemas se agrupan señales relacionadas.

Ejemplo:

- diarrea;
- mucosas secas;
- taquicardia;
- poca orina;
- pérdida de peso.

Juntos orientan a un problema de **déficit/desequilibrio de volumen** más que a cinco problemas aislados.

---

# 67. Diagnóstico/problema de enfermería

Es un juicio clínico sobre respuestas o necesidades que enfermería puede abordar.

No debe confundirse con diagnóstico médico.

Ejemplo:

Diagnóstico médico: gastroenteritis.

Problema de enfermería:
- pérdida de líquidos;
- riesgo de deterioro de hidratación;
- conocimiento insuficiente de signos de alarma.

---

# 68. Priorización

Orden general:

1. vía aérea;
2. respiración;
3. circulación;
4. estado neurológico;
5. seguridad;
6. dolor y confort;
7. hidratación/nutrición;
8. educación/continuidad.

El problema “más largo” en el plan no necesariamente es el más urgente.

---

# 69. Planificación

Definir:

- problema prioritario;
- objetivo/resultado;
- tiempo;
- intervenciones;
- parámetros de evaluación.

El plan debe ser individualizado.

---

# 70. Resultados SMART

Un resultado útil debe ser:

- específico;
- medible;
- alcanzable;
- relevante;
- limitado en tiempo.

Ejemplo:

“Durante las próximas 4 horas, el niño mantendrá perfusión periférica adecuada y mostrará mejoría de los signos clínicos de hidratación.”

---

# 71. Intervenciones

Pueden ser:

- independientes;
- dependientes de prescripción;
- colaborativas.

Ejemplos:

- monitorizar;
- posicionar;
- educar;
- administrar tratamiento prescrito;
- coordinar nutrición;
- solicitar valoración del equipo.

---

# 72. Ejecución

Durante la ejecución:

- aplicar intervenciones;
- mantener seguridad;
- explicar;
- respetar dignidad;
- documentar;
- observar respuesta;
- detener/escalar si hay daño o deterioro.

---

# 73. Evaluación

Preguntar:

- ¿se alcanzó el resultado?
- ¿mejoró?
- ¿empeoró?
- ¿surgieron nuevos datos?
- ¿el plan debe continuar, modificarse o suspenderse?

La evaluación conduce de nuevo a valoración.

---

# 74. PAE como ciclo

Secuencia:

**Valorar → identificar problema → planificar → ejecutar → evaluar → volver a valorar**

No termina con “administrar el medicamento”.

La respuesta del niño determina el siguiente paso.

---

# 75. Integración de la familia

La familia participa en:

- historia;
- preferencias;
- metas;
- educación;
- cuidados apropiados;
- detección de cambios;
- preparación para alta.

La enfermera mantiene responsabilidad por valoración, juicio profesional, administración y evaluación dentro de su competencia.

---

# 76. Educación familiar

Usar:

- lenguaje claro;
- demostración;
- práctica supervisada;
- material escrito;
- teach-back.

En medicación domiciliaria:
- mostrar dispositivo;
- marcar volumen si es apropiado;
- confirmar frecuencia;
- enseñar almacenamiento;
- explicar signos de alarma.

---

# 77. Adolescente y autonomía progresiva

Involucrar al adolescente en:

- decisiones;
- medicación;
- autocuidado;
- metas;
- transición.

La autonomía aumenta según desarrollo, capacidad, seguridad y marco legal.

---

# 78. Documentación del PAE

Registrar:

- datos relevantes;
- problema;
- prioridades;
- intervenciones;
- educación;
- respuesta;
- reevaluación;
- comunicación con equipo.

No documentar una intervención antes de realizarla.

---

# 79. Reevaluación después de medicamentos

Reevaluar:

- efecto terapéutico;
- eventos adversos;
- signos vitales pertinentes;
- dolor;
- sedación;
- alergia;
- sitio IV;
- laboratorio cuando corresponda.

“Administrado” no significa “cuidado completado”.

---

# 80. PAE aplicado a deshidratación

**Valoración:** diarrea, sed, ojos hundidos, diuresis baja.  
**Problema:** déficit de líquidos/riesgo de hipoperfusión.  
**Plan:** mejorar hidratación y perfusión.  
**Ejecución:** SRO o terapia prescrita, balance, educación.  
**Evaluación:** estado mental, pulso, diuresis, tolerancia y signos clínicos.

---

# 81. PAE aplicado a asma

**Valoración:** sibilancias, retracciones, frecuencia respiratoria, saturación, capacidad de hablar.  
**Problema:** ventilación/respiración comprometida.  
**Plan:** disminuir trabajo respiratorio y mejorar oxigenación.  
**Ejecución:** posición, tratamiento inhalado/oxígeno prescrito, técnica correcta.  
**Evaluación:** esfuerzo, entrada de aire, saturación y respuesta clínica.

---

# 82. PAE aplicado a dolor postoperatorio

**Valoración:** escala apropiada, conducta, signos vitales.  
**Problema:** dolor agudo.  
**Plan:** reducir intensidad y facilitar respiración/movilidad.  
**Ejecución:** medidas no farmacológicas + analgésico prescrito.  
**Evaluación:** repetir la misma escala apropiada y observar efectos adversos.

---

# 83. PAE aplicado a administración farmacológica

Ejemplo:

**Valoración**
- peso 15 kg;
- alergias;
- función renal;
- vía disponible.

**Problema**
- necesidad terapéutica + riesgo de error por dosis pediátrica.

**Plan**
- calcular y verificar dosis/volumen.

**Ejecución**
- administrar tras verificaciones.

**Evaluación**
- respuesta y efectos adversos.

---

# 84. Delegación y responsabilidad

La delegación depende de:

- legislación;
- competencia;
- estabilidad del paciente;
- complejidad;
- supervisión.

No delegar una tarea si requiere juicio clínico que excede la competencia de quien la recibe.

---

# 85. Seguridad del sistema

Los errores farmacológicos no dependen solo de “tener cuidado”.

También influyen:

- etiquetado;
- concentraciones;
- bombas;
- software;
- interrupciones;
- fatiga;
- almacenamiento;
- comunicación.

La OMS considera los errores de medicación una causa importante de daño evitable y promueve sistemas que reduzcan riesgo.

---

# 86. Errores frecuentes de examen

1. Usar libras directamente en una fórmula `mg/kg`.
2. Confundir `mg/kg/día` con `mg/kg/dosis`.
3. No dividir la dosis diaria entre administraciones.
4. Convertir mg a mcg en la dirección incorrecta.
5. Calcular volumen con una concentración equivocada.
6. Redondear demasiado pronto.
7. Escribir `.5 mg` en vez de `0.5 mg`.
8. Escribir `5.0 mg` en vez de `5 mg`.
9. Aceptar un resultado sin verificar plausibilidad.
10. No comparar con dosis máxima.
11. Usar cucharas domésticas para medicamentos líquidos.
12. Confiar ciegamente en la bomba o calculadora.
13. Considerar el diagnóstico médico como diagnóstico de enfermería.
14. Ejecutar antes de valorar/priorizar.
15. No reevaluar después de una intervención.
16. Excluir a la familia.
17. Delegar juicio clínico inapropiadamente.

---

# 87. Estrategia para resolver cálculos CICDE

Escribir siempre:

**1. Datos**  
Peso, orden, concentración, tiempo.

**2. Convertir**  
kg, mg, mcg, mL, minutos.

**3. Fórmula**  
Sin saltarse unidades.

**4. Resolver**

**5. Comprobar unidad final**

**6. Verificar seguridad y plausibilidad**

No hacer todo mentalmente.

---

# 88. Situaciones originales tipo examen$$,
  1
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-2',
  $$Caso 1 — Libras$$,
  $$Niño pesa 44 lb. ¿Peso aproximado para cálculo?

\[
44 \div 2.2 = 20 kg
\]

**Respuesta: 20 kg.**

---$$,
  2
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-3',
  $$Caso 2 — mg/kg/dosis$$,
  $$Orden académica: `8 mg/kg/dosis`. Peso: `12 kg`.

\[
8 \times 12 = 96 mg
\]

**Respuesta matemática: 96 mg/dosis.**

---$$,
  3
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-4',
  $$Caso 3 — mg/kg/día$$,
  $$Orden académica: `24 mg/kg/día` para 25 kg, cada 8 h.

Total:

\[
24 \times 25 = 600 mg/día
\]

3 dosis:

\[
600 \div 3 = 200 mg/dosis
\]

**Respuesta: 200 mg/dosis.**

---$$,
  4
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-5',
  $$Caso 4 — líquido$$,
  $$Orden: 100 mg. Disponible: 50 mg/5 mL.

\[
100/50 \times 5 = 10 mL
\]

**Respuesta: 10 mL.**

---$$,
  5
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-6',
  $$Caso 5 — concentración$$,
  $$Disponible: 200 mg/4 mL.

\[
200 \div 4 = 50 mg/mL
\]

Si se requieren 125 mg:

\[
125 \div 50 = 2.5 mL
\]

**Respuesta: 2.5 mL.**

---$$,
  6
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-7',
  $$Caso 6 — mL/h$$,
  $$300 mL en 6 horas.

\[
300 \div 6 = 50 mL/h
\]

**Respuesta: 50 mL/h.**

---$$,
  7
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-8',
  $$Caso 7 — goteo$$,
  $$100 mL en 50 minutos, equipo 15 gtt/mL.

\[
100 \times 15 / 50 = 30 gtt/min
\]

**Respuesta: 30 gtt/min.**

---$$,
  8
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-9',
  $$Caso 8 — decimal$$,
  $$Orden escrita `.4 mg`.

**Respuesta:** debe aclararse/corregirse a `0.4 mg`; falta cero a la izquierda.

---$$,
  9
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-10',
  $$Caso 9 — cero final$$,
  $$Orden `4.0 mg`.

**Respuesta:** la notación es insegura; preferir `4 mg`.

---$$,
  10
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-11',
  $$Caso 10 — peso$$,
  $$Historia muestra peso 18 “sin unidad”.

**Respuesta:** no usarlo para calcular hasta confirmar si son kg o lb.

---$$,
  11
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-12',
  $$Caso 11 — dosis diaria$$,
  $$Estudiante calcula `20 mg/kg/día` y administra el total cada 8 horas.

**Respuesta:** error potencial grave; la dosis diaria debe dividirse entre las administraciones indicadas.

---$$,
  12
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-13',
  $$Caso 12 — familia$$,
  $$Padre mide medicamento con cuchara de cocina.

**Respuesta:** enseñar uso de dispositivo graduado en mL, preferentemente jeringa oral para volúmenes pequeños.

---$$,
  13
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-14',
  $$Caso 13 — PAE$$,
  $$Niño con dificultad respiratoria tiene además miedo a la hospitalización.

**Respuesta:** priorizar respiración; la ansiedad también se atiende, pero no antes del ABC.

---$$,
  14
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-15',
  $$Caso 14 — evaluación$$,
  $$Después de analgésico, la enfermera documenta “administrado” y no vuelve a valorar.

**Respuesta:** PAE incompleto; debe evaluar respuesta y efectos adversos.

---$$,
  15
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-16',
  $$Caso 15 — cálculo improbable$$,
  $$El cálculo arroja 75 mL de un medicamento oral para un lactante.

**Respuesta:** detenerse y verificar unidades, peso, concentración, dosis y máximo. Un resultado matemáticamente obtenido puede estar basado en datos erróneos.

---$$,
  16
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-17',
  $$Caso 16 — bomba$$,
  $$Smart pump acepta una velocidad, pero el cálculo independiente no coincide.

**Respuesta:** no iniciar hasta reconciliar la discrepancia.

---$$,
  17
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-18',
  $$Caso 17 — problema de enfermería$$,
  $$Diagnóstico médico: neumonía. Niño presenta respiración trabajosa y desaturación.

**Respuesta:** el PAE prioriza la respuesta respiratoria comprometida, no repetir “neumonía” como problema de enfermería.

---$$,
  18
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-19',
  $$Caso 18 — reevaluación$$,
  $$Tras intervención de rehidratación, ¿qué sigue?

**Respuesta:** reevaluar estado mental, perfusión, diuresis, tolerancia, signos vitales y ajustar el plan.

---

# 89. Fuentes y validación$$,
  19
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-20',
  $$Fuentes rectoras CICDE$$,
  $$1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen por Competencia de Profesionales de Enfermería*, tercera edición, Panamá, 2026.
2. **Hockenberry, M.; Rodgers, C.; Wilson, D.** *Wong. Enfermería Pediátrica*, 10.ª edición, Elsevier.
3. **Posada Díaz, A.; Gómez Ramírez, J.; Ramírez Gómez, H.** *El Niño Sano*. Editorial Médica Panamericana, 2005.$$,
  20
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-21',
  $$Panamá — fuente oficial$$,
  $$4. **MINSA. Resolución N.° 306 de 5 de junio de 2024.** Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años.  
   https://www.minsa.gob.pa/normatividad/resolucion-ndeg-306-de-miercoles-05-de-junio-de-2024-que-aprueba-las-normas-tecnicas-y$$,
  21
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-22',
  $$Seguridad farmacológica y pediátrica$$,
  $$5. **WHO. World Patient Safety Day 2025 — Safe care for every newborn and every child.**  
   https://www.who.int/campaigns/world-patient-safety-day/2025

6. **WHO. World Patient Safety Day Goals 2025.**  
   https://www.who.int/publications/b/80934

7. **WHO. Medication Without Harm.**  
   https://www.who.int/initiatives/medication-without-harm

8. **WHO. Medication without harm: Policy brief.** 2024.  
   https://www.who.int/publications/i/item/9789240062764/

9. **The Joint Commission. Sentinel Event Alert 39: Preventing pediatric medication errors.**  
   https://www.jointcommission.org/-/media/tjc/documents/resources/patient-safety-topics/sentinel-event/sea_39.pdf

10. **ISMP. Error-Prone Abbreviations, Symbols, and Dose Designations.** 2021.  
    https://www.ismp.org/system/files/resources/2021-02/Error%20Prone%20Abbreviations%202021_0.pdf

11. **ISMP. Measurement mishaps with liquid medicines.**  
    https://www.ismp.org/sites/default/files/attachments/2018-04/ismp201609.pdf

12. **AHRQ PSNet. Medication Administration Errors.**  
    https://psnet.ahrq.gov/primer/medication-administration-errors

13. **AHRQ PSNet. The effect of documenting patient weight in kilograms on pediatric medication dosing errors.**  
    https://psnet.ahrq.gov/issue/effect-documenting-patient-weight-kilograms-pediatric-medication-dosing-errors-emergency$$,
  22
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-23',
  $$Proceso de Atención de Enfermería$$,
  $$14. **NCBI Bookshelf / Open RN. Nursing Fundamentals — Nursing Process.**  
    https://www.ncbi.nlm.nih.gov/books/NBK610818/

15. **NCBI Bookshelf / Open RN. Nursing Health Promotion — NCSBN Clinical Judgment Model and Nursing Process.** 2025.  
    https://www.ncbi.nlm.nih.gov/books/NBK615357/table/ch2.tab1/$$,
  23
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-24',
  $$Superficie corporal$$,
  $$16. **Orimadegun AE, Omisanjo AO. Estimation of body surface area in various childhood ages — validation of the Mosteller formula.** *Acta Paediatrica*.  
    https://pubmed.ncbi.nlm.nih.gov/22211780/

---

# 90. Actualizaciones y decisiones de seguridad$$,
  24
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-25',
  $$Peso$$,
  $$Para dosificación pediátrica se prioriza **kg**. La Joint Commission recomienda documentar peso pediátrico en kg para prescripción, expediente y comunicación.$$,
  25
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-26',
  $$Decimales$$,
  $$Se mantiene la práctica de seguridad:

- `0.5 mg`, no `.5 mg`;
- `5 mg`, no `5.0 mg`.$$,
  26
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-27',
  $$Medicación líquida$$,
  $$Se prioriza medición en **mL** con dispositivo apropiado. Las jeringas orales reducen errores, especialmente en volúmenes pequeños.$$,
  27
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-28',
  $$Dosis por superficie corporal$$,
  $$Se enseña la fórmula de Mosteller como herramienta académica cuando una orden utiliza mg/m², pero se documentan sus limitaciones en pediatría, especialmente en neonatos/lactantes.$$,
  28
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT 
  l.id,
  'PEDS-06-29',
  $$PAE$$,
  $$CICDE usa cinco fases: valoración, diagnóstico, planificación, ejecución y evaluación. Algunas normas profesionales separan “identificación de resultados” como componente adicional; aquí se integra dentro de planificación para respetar el temario.

---

# 91. Control de calidad

- Alcance cotejado contra CICDE 2026.
- 6/6 subtemas explícitos cubiertos.
- Conversión kg/lb revisada.
- Diferencia mg/kg/dosis vs mg/kg/día explicitada.
- Cálculos revisados con análisis dimensional.
- Ejemplos de mL/h y gtt/min verificados.
- Uso de kg respaldado por seguridad pediátrica.
- Ceros decimales tratados conforme a prácticas de seguridad.
- No se incluyen tablas de dosis terapéuticas reales descontextualizadas.
- Las órdenes de ejemplo están marcadas como ejercicios académicos.
- PAE se presenta como proceso cíclico.
- Se evita reproducir taxonomías propietarias completas de diagnósticos.
- 18 situaciones tipo examen son originales.
- No se declara revisión clínica humana inexistente.

---

# 92. Estado para integración

**Estado:** `REVIEW`

Motivo:

- alcance, cálculos, contenido y fuentes fueron sometidos a validación documental/académica;
- no existe todavía revisor clínico humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` por revisión de IA.

**Cobertura CICDE PEDS-06: 6/6 subtemas explícitos.**

**Situaciones originales tipo examen: 18.**

**Con PEDS-06 se completa el bloque Enfermería Pediátrica: 6/6 temas CICDE.**$$,
  29
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code = 'PEDS-06';

-- ================================================================
-- INSERT LESSON_SOURCES
-- ================================================================

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-05'
  AND s.citation_text = 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'Wong. Enfermería Pediátrica';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Wong. Enfermería Pediátrica';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'Wong. Enfermería Pediátrica';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Wong. Enfermería Pediátrica';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-05'
  AND s.citation_text = 'Wong. Enfermería Pediátrica';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'Wong. Enfermería Pediátrica';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'El Niño Sano';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'El Niño Sano';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'El Niño Sano';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'El Niño Sano';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-05'
  AND s.citation_text = 'El Niño Sano';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'El Niño Sano';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'Sección de Salud Integral de Niñez y Adolescencia';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'Sección de Salud Integral de Niñez y Adolescencia';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'Minsa lanza la implementación del AIEPI Comunitario con apoyo de UNICEF para fortalecer la salud infantil';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'Minsa Panamá Este fortalece la atención integral de los adolescentes';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'WHO Child Growth Standards';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'Child growth standards: questions and answers';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'BMI-for-age (5-19 years)';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'Improving early childhood development: WHO guideline';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'Nurturing care for children with developmental delays and disabilities: thematic brief';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'Alimentación del lactante y del niño pequeño';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'WHO Guideline for complementary feeding of infants and young children 6-23 months of age';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'Salud del adolescente';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'Actividad física';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-01'
  AND s.citation_text = 'CDC Developmental Milestones / Learn the Signs. Act Early.';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Manual de Normas y Procedimientos. Programa Ampliado de Inmunizaciones';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Manual de Normas y Procedimientos. Programa Ampliado de Inmunizaciones';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Resolución N.° 306 de 5 de junio de 2024 — Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'Resolución N.° 306 de 5 de junio de 2024 — Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Resolución N.° 306 de 5 de junio de 2024 — Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-05'
  AND s.citation_text = 'Resolución N.° 306 de 5 de junio de 2024 — Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'Resolución N.° 306 de 5 de junio de 2024 — Normas Técnicas y Administrativas del Programa de Salud Integral del Niño y la Niña desde el nacimiento hasta los 9 años';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Esquema Nacional de Vacunación 2026';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Esquema Nacional de Vacunación 2026';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Programa Nacional de Tamizaje Neonatal';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Panamá fortalece la promoción de la lactancia materna para garantizar un mejor inicio de vida a la niñez';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Minsa inicia aplicación de anticuerpo monoclonal para fortalecer la protección de recién nacidos frente al VRS';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Decreto Ejecutivo N.° 24 de 13 de octubre de 2025';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Essential Newborn Care Course, second edition';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Essential newborn care';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'WHO recommendations for care of the preterm or low-birth-weight infant';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Kangaroo mother care: a clinical practice guide';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'WHO updated recommendations on HIV clinical management';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Clinical Screening and Diagnosis for Critical Congenital Heart Defects';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'The Apgar Score';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'Enfermedad hemolítica del recién nacido';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-02'
  AND s.citation_text = 'WHO announces the development of updated guidelines on newborn resuscitation at birth';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'Resolución N.° 371 de 27 de junio de 2024 — Normas Técnicas y Administrativas del Programa Nacional de Salud Integral de Adolescentes';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'Child growth standards';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'Growth reference data for 5–19 years';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'BMI-for-age (5–19 years)';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'Weight-for-age (5–10 years)';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'Alimentación saludable';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'Global standards for quality health care services for adolescents';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'Competency and outcomes framework for adolescent health and well-being';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'Exploratory meeting to review new evidence for IMCI danger signs';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'Pediatric Advanced Life Support Instructor Manual';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-03'
  AND s.citation_text = 'BMI-for-Age as a Screening Measure';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Diarrhoeal disease';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Guideline on management of pneumonia and diarrhoea in children up to 10 years of age';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Pneumonia in children';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'WHO consolidated guidelines for the management of common childhood illness: management of asthma in children and adolescents and bronchiolitis in infants and young children';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Asthma';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'WHO guidelines for clinical management of arboviral diseases';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'WHO guidelines on meningitis diagnosis, treatment and care';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Guidelines on the Clinical Management of Sepsis';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'WHO recommendations for management of serious bacterial infections in infants aged 0–59 days';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Epilepsy';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'ISPAD Clinical Practice Consensus Guidelines 2024';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'KDIGO 2024 Clinical Practice Guideline for the Evaluation and Management of Chronic Kidney Disease';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Acute Kidney Injury and Acute Kidney Disease guideline update';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Childhood cancer';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'Congenital disorders';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-04'
  AND s.citation_text = 'World Patient Safety Day 2025';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-05'
  AND s.citation_text = 'World Patient Safety Day 2025 — Safe care for every newborn and every child';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'World Patient Safety Day 2025 — Safe care for every newborn and every child';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-05'
  AND s.citation_text = 'World Patient Safety Day Goals 2025';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'World Patient Safety Day Goals 2025';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-05'
  AND s.citation_text = 'Clinical checklists — Surgical Safety Checklist';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-05'
  AND s.citation_text = 'Safer surgery — tools and resources';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-05'
  AND s.citation_text = 'Palliative care for children';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-05'
  AND s.citation_text = 'Guidelines on the management of chronic pain in children';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-05'
  AND s.citation_text = 'Guidelines on the management of chronic pain in children: executive summary';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-05'
  AND s.citation_text = 'Patient safety guidance and tools';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'Medication Without Harm';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'Medication without harm: Policy brief';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'Sentinel Event Alert 39: Preventing pediatric medication errors';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'Error-Prone Abbreviations, Symbols, and Dose Designations';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'Measurement mishaps with liquid medicines';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'Medication Administration Errors';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'The effect of documenting patient weight in kilograms on pediatric medication dosing errors';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'Nursing Fundamentals — Nursing Process';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'NCSBN Clinical Judgment Model and the Nursing Process';

INSERT INTO lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
SELECT 
  l.id,
  s.id,
  NULL,
  NULL,
  false
FROM lessons l
JOIN topics t ON t.id = l.topic_id
CROSS JOIN sources s
WHERE t.code = 'PEDS-06'
  AND s.citation_text = 'Estimation of body surface area in various childhood ages — validation of the Mosteller formula';

-- ================================================================
-- POSTCONDITIONS
-- ================================================================

DO $$
DECLARE
  topics_count INT;
  lessons_count INT;
  sections_count INT;
  empty_bodies INT;
  sources_count INT;
  lesson_sources_count INT;
  review_count INT;
  sv_count INT;
  verified_count INT;
  null_reviewed_at INT;
  null_reviewed_by INT;
BEGIN
  -- Verify topics
  SELECT COUNT(*) INTO topics_count
  FROM topics WHERE code LIKE 'PEDS-%';
  
  IF topics_count != 6 THEN
    RAISE EXCEPTION 'Expected 6 PEDS topics, found %', topics_count;
  END IF;
  
  -- Verify lessons
  SELECT COUNT(*) INTO lessons_count
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%';
  
  IF lessons_count != 6 THEN
    RAISE EXCEPTION 'Expected 6 PEDS lessons, found %', lessons_count;
  END IF;
  
  -- Verify sections
  SELECT COUNT(*) INTO sections_count
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%';
  
  IF sections_count != 163 THEN
    RAISE EXCEPTION 'Expected 163 PEDS sections, found %', sections_count;
  END IF;
  
  -- Verify no empty bodies
  SELECT COUNT(*) INTO empty_bodies
  FROM lesson_sections ls
  JOIN lessons l ON l.id = ls.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%'
    AND (ls.body IS NULL OR btrim(ls.body) = '');
  
  IF empty_bodies != 0 THEN
    RAISE EXCEPTION 'Expected 0 empty section bodies, found %', empty_bodies;
  END IF;
  
  -- Verify sources
  SELECT COUNT(DISTINCT s.id) INTO sources_count
  FROM sources s
  JOIN lesson_sources lsrc ON lsrc.source_id = s.id
  JOIN lessons l ON l.id = lsrc.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%';
  
  IF sources_count < 77 THEN
    RAISE EXCEPTION 'Expected at least 77 distinct PEDS sources, found %', sources_count;
  END IF;
  
  -- Note: May be more than 77 if sources are shared with other lessons
  
  -- Verify lesson_sources
  SELECT COUNT(*) INTO lesson_sources_count
  FROM lesson_sources lsrc
  JOIN lessons l ON l.id = lsrc.lesson_id
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%';
  
  IF lesson_sources_count != 101 THEN
    RAISE EXCEPTION 'Expected 101 PEDS lesson_sources, found %', lesson_sources_count;
  END IF;
  
  -- Verify status
  SELECT COUNT(*) INTO review_count
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%' AND l.status = 'REVIEW';
  
  IF review_count != 6 THEN
    RAISE EXCEPTION 'Expected 6 PEDS REVIEW lessons, found %', review_count;
  END IF;
  
  -- Verify baseline preserved
  SELECT COUNT(*) INTO sv_count
  FROM lessons WHERE status = 'SOURCE_VALIDATED';
  
  IF sv_count != 55 THEN
    RAISE EXCEPTION 'Expected 55 SOURCE_VALIDATED baseline preserved, found %', sv_count;
  END IF;
  
  SELECT COUNT(*) INTO verified_count
  FROM lessons WHERE status = 'VERIFIED';
  
  IF verified_count != 0 THEN
    RAISE EXCEPTION 'Expected 0 VERIFIED, found %', verified_count;
  END IF;
  
  -- Verify provenance
  SELECT COUNT(*) INTO null_reviewed_at
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%' AND l.reviewed_at IS NOT NULL;
  
  IF null_reviewed_at != 0 THEN
    RAISE EXCEPTION 'Expected 0 PEDS with reviewed_at set, found %', null_reviewed_at;
  END IF;
  
  SELECT COUNT(*) INTO null_reviewed_by
  FROM lessons l
  JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'PEDS-%' AND l.reviewed_by IS NOT NULL;
  
  IF null_reviewed_by != 0 THEN
    RAISE EXCEPTION 'Expected 0 PEDS with reviewed_by set, found %', null_reviewed_by;
  END IF;
  
  RAISE NOTICE 'Postconditions PASS';
  RAISE NOTICE 'Pediatrics integrated: 6 lessons, 163 sections, 77 sources, 101 lesson_sources';
  RAISE NOTICE 'Status: REVIEW (ready for documentary validation and promotion)';
END $$;

COMMIT;

-- ================================================================
-- Migration complete - ready for execution
-- ================================================================
