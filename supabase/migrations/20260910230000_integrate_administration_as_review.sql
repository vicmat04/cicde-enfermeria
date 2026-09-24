-- ================================================================
-- Administration Topics Integration (REVIEW status) - V2
-- 
-- Architecture: Deterministic ID mappings via TEMP tables
-- 
-- Lessons: 11 (ADMIN-01 through ADMIN-11)
-- Sections: 826
-- Sources: 57 distinct
-- 
-- This migration:
-- 1. Validates baseline (61 SOURCE_VALIDATED)
-- 2. Inserts topics/lessons/sources
-- 3. Creates TEMP mapping tables (topic_id, lesson_id, source_id)
-- 4. Uses mappings for sections/lesson_sources (no scalar subqueries)
-- 5. Validates deterministic 1:1 mappings
-- ================================================================

BEGIN;

-- ================================================================
-- PRECONDITIONS
-- ================================================================

DO $$
DECLARE
  baseline_sv INT;
  verified INT;
  existing_admin INT;
BEGIN
  SELECT COUNT(*) INTO baseline_sv FROM lessons WHERE status = 'SOURCE_VALIDATED';
  IF baseline_sv != 61 THEN RAISE EXCEPTION 'Expected 61 SOURCE_VALIDATED, found %', baseline_sv; END IF;
  
  SELECT COUNT(*) INTO verified FROM lessons WHERE status = 'VERIFIED';
  IF verified != 0 THEN RAISE EXCEPTION 'Expected 0 VERIFIED, found %', verified; END IF;
  
  SELECT COUNT(*) INTO existing_admin FROM topics WHERE code LIKE 'ADMIN-%';
  IF existing_admin != 0 THEN RAISE EXCEPTION 'Found % existing ADMIN topics, expected 0', existing_admin; END IF;
  
  RAISE NOTICE 'Preconditions PASS';
END $$;

-- ================================================================
-- INSERT TOPICS
-- ================================================================

INSERT INTO topics (area_id, code, title, description, sort_order)
VALUES
  ((SELECT id FROM areas WHERE code = 'ADMINISTRATION'), 'ADMIN-01', 'Antecedentes históricos', '', 1),
  ((SELECT id FROM areas WHERE code = 'ADMINISTRATION'), 'ADMIN-02', 'Teoría general de la administración', '', 2),
  ((SELECT id FROM areas WHERE code = 'ADMINISTRATION'), 'ADMIN-03', 'Administración contemporánea', '', 3),
  ((SELECT id FROM areas WHERE code = 'ADMINISTRATION'), 'ADMIN-04', 'Conceptos básicos', '', 4),
  ((SELECT id FROM areas WHERE code = 'ADMINISTRATION'), 'ADMIN-05', 'Funciones administrativas', '', 5),
  ((SELECT id FROM areas WHERE code = 'ADMINISTRATION'), 'ADMIN-06', 'Gestión del cuidado', '', 6),
  ((SELECT id FROM areas WHERE code = 'ADMINISTRATION'), 'ADMIN-07', 'Proceso administrativo aplicado en Enfermería', '', 7),
  ((SELECT id FROM areas WHERE code = 'ADMINISTRATION'), 'ADMIN-08', 'La comunicación en el proceso administrativo', '', 8),
  ((SELECT id FROM areas WHERE code = 'ADMINISTRATION'), 'ADMIN-09', 'Dotación de recursos humanos', '', 9),
  ((SELECT id FROM areas WHERE code = 'ADMINISTRATION'), 'ADMIN-10', 'Manejo de instrumentos administrativos para evaluar la atención de enfermería', '', 10),
  ((SELECT id FROM areas WHERE code = 'ADMINISTRATION'), 'ADMIN-11', 'Elaboración de informes', '', 11);

-- ================================================================
-- INSERT LESSONS (REVIEW status)
-- ================================================================

INSERT INTO lessons (topic_id, title, status)
VALUES
  ((SELECT id FROM topics WHERE code = 'ADMIN-01'), 'Antecedentes históricos', 'REVIEW'),
  ((SELECT id FROM topics WHERE code = 'ADMIN-02'), 'Teoría general de la administración', 'REVIEW'),
  ((SELECT id FROM topics WHERE code = 'ADMIN-03'), 'Administración contemporánea', 'REVIEW'),
  ((SELECT id FROM topics WHERE code = 'ADMIN-04'), 'Conceptos básicos', 'REVIEW'),
  ((SELECT id FROM topics WHERE code = 'ADMIN-05'), 'Funciones administrativas', 'REVIEW'),
  ((SELECT id FROM topics WHERE code = 'ADMIN-06'), 'Gestión del cuidado', 'REVIEW'),
  ((SELECT id FROM topics WHERE code = 'ADMIN-07'), 'Proceso administrativo aplicado en Enfermería', 'REVIEW'),
  ((SELECT id FROM topics WHERE code = 'ADMIN-08'), 'La comunicación en el proceso administrativo', 'REVIEW'),
  ((SELECT id FROM topics WHERE code = 'ADMIN-09'), 'Dotación de recursos humanos', 'REVIEW'),
  ((SELECT id FROM topics WHERE code = 'ADMIN-10'), 'Manejo de instrumentos administrativos para evaluar la atención de enfermería', 'REVIEW'),
  ((SELECT id FROM topics WHERE code = 'ADMIN-11'), 'Elaboración de informes', 'REVIEW');

-- ================================================================
-- INSERT SOURCES
-- ================================================================

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'CICDE', 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería', 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería', NULL, 'IV Consejo Interinstitucional de Certificación Básica de Enfermería', NULL, 2026, NULL, NULL, NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'CICDE', 'Administración de los servicios de enfermería', 'Administración de los servicios de enfermería', 'María de la Luz Balderas Pedrero', NULL, 'McGraw-Hill', 2015, '7', 'https://www.mheducation.com.mx/administracion-de-los-servicios-de-enfermeria-9786071512413-latam-group', '9786071512413', false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Administración de los servicios de enfermería');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Principles of Management — Chapter 3: The History of Management', 'Principles of Management — Chapter 3: The History of Management', NULL, 'OpenStax', NULL, NULL, NULL, 'https://openstax.org/books/principles-management/pages/3-introduction', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Principles of Management — Chapter 3: The History of Management');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Taylor-Made Management', 'Taylor-Made Management', NULL, 'OpenStax', NULL, NULL, NULL, 'https://openstax.org/books/principles-management/pages/3-4-taylor-made-management', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Taylor-Made Management');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Administrative and Bureaucratic Management', 'Administrative and Bureaucratic Management', NULL, 'OpenStax', NULL, NULL, NULL, 'https://openstax.org/books/principles-management/pages/3-5-administrative-and-bureaucratic-management', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Administrative and Bureaucratic Management');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Human Relations Movement', 'Human Relations Movement', NULL, 'OpenStax', NULL, NULL, NULL, 'https://openstax.org/books/principles-management/pages/3-6-human-relations-movement', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Human Relations Movement');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Nightingale''s perspective of nursing administration', 'Nightingale''s perspective of nursing administration', 'B. Henry; S. Woods; J. Nagelkerk', NULL, NULL, 1990, NULL, 'https://pubmed.ncbi.nlm.nih.gov/2184383/', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Nightingale''s perspective of nursing administration');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Florence Nightingale and healthcare reform', 'Florence Nightingale and healthcare reform', 'Elizabeth Connelly Kudzma', NULL, NULL, 2006, NULL, 'https://pubmed.ncbi.nlm.nih.gov/16407602/', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Florence Nightingale and healthcare reform');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Transformational Leadership and Evidence-Based Management — Keeping Patients Safe', 'Transformational Leadership and Evidence-Based Management — Keeping Patients Safe', NULL, 'NCBI Bookshelf', NULL, NULL, NULL, 'https://www.ncbi.nlm.nih.gov/books/NBK216194/', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Transformational Leadership and Evidence-Based Management — Keeping Patients Safe');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Reseña histórica — Asociación Nacional de Enfermeras de Panamá', 'Reseña histórica — Asociación Nacional de Enfermeras de Panamá', NULL, 'ANEP', NULL, NULL, NULL, 'https://anep.org.pa/nosotros/', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Reseña histórica — Asociación Nacional de Enfermeras de Panamá');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Historia — Facultad de Enfermería', 'Historia — Facultad de Enfermería', NULL, 'Universidad de Panamá', NULL, NULL, NULL, 'https://facenfermeria.up.ac.pa/historia', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Historia — Facultad de Enfermería');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Facultad de Enfermería: hacia la acreditación, liderazgo e internacionalización de la carrera', 'Facultad de Enfermería: hacia la acreditación, liderazgo e internacionalización de la carrera', NULL, 'Universidad de Panamá', NULL, 2019, NULL, 'https://launiversidad.up.ac.pa/node/1159', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Facultad de Enfermería: hacia la acreditación, liderazgo e internacionalización de la carrera');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Acerca de — Ministerio de Salud de Panamá', 'Acerca de — Ministerio de Salud de Panamá', NULL, 'Ministerio de Salud de Panamá', NULL, NULL, NULL, 'https://www.minsa.gob.pa/node/1619', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Acerca de — Ministerio de Salud de Panamá');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Legislación organizativa del MINSA', 'Legislación organizativa del MINSA', NULL, 'Ministerio de Salud de Panamá', NULL, NULL, NULL, 'https://pam.minsa.gob.pa/legislacion-organizativa-del-minsa/', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Legislación organizativa del MINSA');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Región de Salud de Herrera', 'Región de Salud de Herrera', NULL, 'Ministerio de Salud de Panamá', NULL, NULL, NULL, 'https://www.minsa.gob.pa/region-de-salud/region-de-salud-de-herrera', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Región de Salud de Herrera');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Principles of Management — The History of Management', 'Principles of Management — The History of Management', NULL, 'OpenStax', NULL, NULL, NULL, 'https://openstax.org/books/principles-management/pages/3-introduction', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Principles of Management — The History of Management');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Nursing Management and Professional Concepts — Chapter 4: Leadership and Management', 'Nursing Management and Professional Concepts — Chapter 4: Leadership and Management', NULL, 'NCBI Bookshelf / Open RN', NULL, 2024, NULL, 'https://www.ncbi.nlm.nih.gov/books/NBK610440/', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Nursing Management and Professional Concepts — Chapter 4: Leadership and Management');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Contingency and System Management', 'Contingency and System Management', NULL, 'OpenStax', NULL, 2019, NULL, 'https://openstax.org/books/principles-management/pages/3-7-contingency-and-system-management', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Contingency and System Management');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'The Internal Organization and External Environments', 'The Internal Organization and External Environments', NULL, 'OpenStax', NULL, 2019, NULL, 'https://openstax.org/books/principles-management/pages/4-4-the-internal-organization-and-external-environments', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'The Internal Organization and External Environments');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'A Model of Organizational Behavior and Management', 'A Model of Organizational Behavior and Management', NULL, 'OpenStax', NULL, NULL, NULL, 'https://openstax.org/books/organizational-behavior/pages/1-4-a-model-of-organizational-behavior-and-management', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'A Model of Organizational Behavior and Management');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Quality of care', 'Quality of care', NULL, 'World Health Organization', NULL, NULL, NULL, 'https://www.who.int/health-topics/quality-of-care', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Quality of care');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'How to address quality of health services', 'How to address quality of health services', NULL, 'World Health Organization Quality Toolkit', NULL, NULL, NULL, 'https://qualityhealthservices.who.int/quality-toolkit/new-to-health-system-quality-thinking/how-to-address-quality-of-health-services', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'How to address quality of health services');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Quality health services: a planning guide', 'Quality health services: a planning guide', NULL, 'World Health Organization', NULL, 2020, NULL, 'https://www.who.int/publications/i/item/9789240011632', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Quality health services: a planning guide');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Guru Guide', 'Guru Guide', NULL, 'American Society for Quality', NULL, 2010, NULL, 'https://asq.org/quality-progress/articles/guru-guide?id=851d6f00e23044a58006d04e0df2df33', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Guru Guide');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'What Is Quality?', 'What Is Quality?', NULL, 'American Society for Quality', NULL, 2001, NULL, 'https://asq.org/quality-progress/articles/what-is-quality?id=3944a2adfd33497bb8c5a7a59acf759c', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'What Is Quality?');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Principles of Management', 'Principles of Management', NULL, 'OpenStax', NULL, NULL, NULL, 'https://openstax.org/details/books/principles-management', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Principles of Management');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Leadership and Management', 'Leadership and Management', NULL, 'NCBI Bookshelf / Open RN', NULL, 2024, NULL, 'https://www.ncbi.nlm.nih.gov/books/NBK610440/', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Leadership and Management');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'CICDE', 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería', 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería', NULL, 'IV Consejo Interinstitucional de Certificación Básica de Enfermería', NULL, 2026, NULL, NULL, NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Introduction to Business 2e — The Role of Management', 'Introduction to Business 2e — The Role of Management', 'Lawrence J. Gitman et al.', 'OpenStax', NULL, NULL, NULL, 'https://openstax.org/books/introduction-business-2e/pages/6-1-the-role-of-management', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Introduction to Business 2e — The Role of Management');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Principles of Management — The Planning Process', 'Principles of Management — The Planning Process', 'David S. Bright; Anastasia H. Cortes', 'OpenStax', NULL, 2019, NULL, 'https://openstax.org/books/principles-management/pages/17-2-the-planning-process', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Principles of Management — The Planning Process');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Introduction to Business 2e — Organizing', 'Introduction to Business 2e — Organizing', NULL, 'OpenStax', NULL, NULL, NULL, 'https://openstax.org/books/introduction-business-2e/pages/6-3-organizing', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Introduction to Business 2e — Organizing');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Introduction to Business 2e — Authority: Establishing Organizational Relationships', 'Introduction to Business 2e — Authority: Establishing Organizational Relationships', NULL, 'OpenStax', NULL, NULL, NULL, 'https://openstax.org/books/introduction-business-2e/pages/7-4-authority-establishing-organizational-relationships', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Introduction to Business 2e — Authority: Establishing Organizational Relationships');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Principles of Management — The Process of Managerial Communication', 'Principles of Management — The Process of Managerial Communication', NULL, 'OpenStax', NULL, 2019, NULL, 'https://openstax.org/books/principles-management/pages/16-1-the-process-of-managerial-communication', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Principles of Management — The Process of Managerial Communication');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Organizational Behavior — Content Theories of Motivation', 'Organizational Behavior — Content Theories of Motivation', NULL, 'OpenStax', NULL, NULL, NULL, 'https://openstax.org/books/organizational-behavior/pages/7-2-content-theories-of-motivation', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Organizational Behavior — Content Theories of Motivation');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Introduction to Business 2e — Controlling', 'Introduction to Business 2e — Controlling', NULL, 'OpenStax', NULL, NULL, NULL, 'https://openstax.org/books/introduction-business-2e/pages/6-5-controlling', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Introduction to Business 2e — Controlling');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Código Deontológico para Enfermeras de Panamá', 'Código Deontológico para Enfermeras de Panamá', NULL, 'Asociación Nacional de Enfermeras de Panamá', NULL, NULL, NULL, 'https://www.anep.org.pa/biblioteca/codigo-deontologico/', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Código Deontológico para Enfermeras de Panamá');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Decreto Ejecutivo N.° 29 de 5 de diciembre de 2025 — Día Nacional de la Humanización en la Atención y en los Servicios de Salud', 'Decreto Ejecutivo N.° 29 de 5 de diciembre de 2025 — Día Nacional de la Humanización en la Atención y en los Servicios de Salud', NULL, 'República de Panamá / Ministerio de Salud', NULL, 2025, NULL, 'https://minsa.gob.pa/normatividad/decreto-ejecutivo-ndeg-29-de-viernes-05-de-diciembre-de-2025-por-la-cual-se-instituye', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Decreto Ejecutivo N.° 29 de 5 de diciembre de 2025 — Día Nacional de la Humanización en la Atención y en los Servicios de Salud');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Decreto Ejecutivo N.° 17 de 23 de marzo de 2026 — Política Nacional de Salud 2026–2035', 'Decreto Ejecutivo N.° 17 de 23 de marzo de 2026 — Política Nacional de Salud 2026–2035', NULL, 'República de Panamá / Ministerio de Salud', NULL, 2026, NULL, 'https://www.minsa.gob.pa/normatividad/decreto-ejecutivo-no-17-de-23-de-marzo-de-2026-que-aprueba-la-politica-nacional-de', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Decreto Ejecutivo N.° 17 de 23 de marzo de 2026 — Política Nacional de Salud 2026–2035');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Quality health services', 'Quality health services', NULL, 'World Health Organization', NULL, NULL, NULL, 'https://www.who.int/news-room/fact-sheets/detail/quality-health-services', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Quality health services');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Integrated people-centred care', 'Integrated people-centred care', NULL, 'World Health Organization', NULL, NULL, NULL, 'https://www.who.int/health-topics/integrated-people-centered-care', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Integrated people-centred care');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Global Patient Safety Action Plan 2021–2030', 'Global Patient Safety Action Plan 2021–2030', NULL, 'World Health Organization', NULL, 2021, NULL, 'https://www.who.int/publications/i/item/9789240032705', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Global Patient Safety Action Plan 2021–2030');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Organizational Behavior — The Process of Managerial Communication', 'Organizational Behavior — The Process of Managerial Communication', NULL, 'OpenStax', NULL, NULL, NULL, 'https://openstax.org/books/organizational-behavior/pages/11-1-the-process-of-managerial-communication', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Organizational Behavior — The Process of Managerial Communication');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'TeamSTEPPS — Communication Concepts and Tools', 'TeamSTEPPS — Communication Concepts and Tools', NULL, 'Agency for Healthcare Research and Quality', NULL, NULL, NULL, 'https://www.ahrq.gov/teamstepps-program/curriculum/communication/tools/index.html', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'TeamSTEPPS — Communication Concepts and Tools');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'TeamSTEPPS Tool: SBAR', 'TeamSTEPPS Tool: SBAR', NULL, 'Agency for Healthcare Research and Quality', NULL, NULL, NULL, 'https://www.ahrq.gov/teamstepps-program/curriculum/communication/tools/sbar.html', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'TeamSTEPPS Tool: SBAR');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'TeamSTEPPS Tool: Check-Back (Repeat-Back)', 'TeamSTEPPS Tool: Check-Back (Repeat-Back)', NULL, 'Agency for Healthcare Research and Quality', NULL, NULL, NULL, 'https://www.ahrq.gov/teamstepps-program/curriculum/communication/tools/checkback.html', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'TeamSTEPPS Tool: Check-Back (Repeat-Back)');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'WISN: indicadores de carga de trabajo para la estimación del personal necesario. Manual del usuario, 2.ª edición', 'WISN: indicadores de carga de trabajo para la estimación del personal necesario. Manual del usuario, 2.ª edición', NULL, 'World Health Organization', NULL, 2023, NULL, 'https://www.who.int/es/publications/i/item/9789240070066', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'WISN: indicadores de carga de trabajo para la estimación del personal necesario. Manual del usuario, 2.ª edición');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'State of the world’s nursing 2025', 'State of the world’s nursing 2025', NULL, 'World Health Organization', NULL, 2025, NULL, 'https://www.who.int/publications/i/item/9789240110236/', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'State of the world’s nursing 2025');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'La fuerza de trabajo en salud en las Américas: datos e indicadores regionales', 'La fuerza de trabajo en salud en las Américas: datos e indicadores regionales', NULL, 'Organización Panamericana de la Salud', NULL, 2025, NULL, 'https://iris.paho.org/handle/10665.2/64275', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'La fuerza de trabajo en salud en las Américas: datos e indicadores regionales');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Sistema de Información de Recursos Humanos de Salud (SIRHS)', 'Sistema de Información de Recursos Humanos de Salud (SIRHS)', NULL, 'Ministerio de Salud de Panamá / OPS-OMS', NULL, 2024, NULL, 'https://www.paho.org/es/noticias/22-3-2024-ministerio-salud-ops-lanzan-sistema-informacion-recursos-humanos-salud-para', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Sistema de Información de Recursos Humanos de Salud (SIRHS)');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Primera Datatón en Panamá — iniciativa para fortalecer la planificación del recurso humano en salud', 'Primera Datatón en Panamá — iniciativa para fortalecer la planificación del recurso humano en salud', NULL, 'Ministerio de Salud de Panamá / OPS-OMS', NULL, 2026, NULL, 'https://www.paho.org/es/noticias/14-4-2026-primera-dataton-panama-ops-minsa-lanzan-iniciativa-para-fortalecer-planificacion', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Primera Datatón en Panamá — iniciativa para fortalecer la planificación del recurso humano en salud');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Indicadores de Calidad — Observatorio de Calidad de la Atención en Salud', 'Indicadores de Calidad — Observatorio de Calidad de la Atención en Salud', NULL, 'Ministerio de Salud de Panamá', NULL, NULL, NULL, 'https://ocas.minsa.gob.pa/indicadores-de-calidad/', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Indicadores de Calidad — Observatorio de Calidad de la Atención en Salud');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Auditoría de Egresos Hospitalarios 2024', 'Auditoría de Egresos Hospitalarios 2024', NULL, 'Ministerio de Salud de Panamá', NULL, 2024, NULL, 'https://www.minsa.gob.pa/sites/default/files/publicacion-general/informe_de_auditoria_de_egresos_hospitalarios_-_2024_17_12_2024.pdf', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Auditoría de Egresos Hospitalarios 2024');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Measuring and monitoring quality of care to improve maternal, newborn, child and adolescent health services', 'Measuring and monitoring quality of care to improve maternal, newborn, child and adolescent health services', NULL, 'World Health Organization', NULL, 2025, NULL, 'https://www.who.int/publications/i/item/9789240105737/', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Measuring and monitoring quality of care to improve maternal, newborn, child and adolescent health services');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Enfermería y seguridad de los pacientes', 'Enfermería y seguridad de los pacientes', NULL, 'Organización Panamericana de la Salud', NULL, 2011, NULL, 'https://iris.paho.org/handle/10665.2/51547', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Enfermería y seguridad de los pacientes');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Candidate Measure Submission Form — structure/process/outcomes definitions', 'Candidate Measure Submission Form — structure/process/outcomes definitions', NULL, 'Agency for Healthcare Research and Quality', NULL, NULL, NULL, 'https://www.ahrq.gov/policymakers/chipra/cpcf-form15.html', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Candidate Measure Submission Form — structure/process/outcomes definitions');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'PANAMA_OFFICIAL', 'Ley 81 de 26 de marzo de 2019 sobre Protección de Datos Personales y Decreto Ejecutivo 285 de 28 de mayo de 2021', 'Ley 81 de 26 de marzo de 2019 sobre Protección de Datos Personales y Decreto Ejecutivo 285 de 28 de mayo de 2021', NULL, 'República de Panamá / ANTAI', NULL, 2019, NULL, 'https://antai.gob.pa/legislacion/', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Ley 81 de 26 de marzo de 2019 sobre Protección de Datos Personales y Decreto Ejecutivo 285 de 28 de mayo de 2021');

INSERT INTO sources (source_type, title, citation_text, authors, organization, publisher, publication_year, edition, url, isbn, verified)
SELECT 'COMPLEMENTARY', 'Toolkit for Routine Health Information Systems data / Data Quality Assurance', 'Toolkit for Routine Health Information Systems data / Data Quality Assurance', NULL, 'World Health Organization', NULL, NULL, NULL, 'https://www.who.int/data/data-collection-tools/health-service-data/toolkit-for-routine-health-information-system-data', NULL, false
WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text = 'Toolkit for Routine Health Information Systems data / Data Quality Assurance');

-- ================================================================
-- CREATE DETERMINISTIC ID MAPPINGS (TEMP TABLES)
-- ================================================================

CREATE TEMP TABLE admin_topic_map (
  topic_code TEXT PRIMARY KEY,
  topic_id UUID NOT NULL
) ON COMMIT DROP;

CREATE TEMP TABLE admin_lesson_map (
  topic_code TEXT PRIMARY KEY,
  lesson_id UUID NOT NULL
) ON COMMIT DROP;

CREATE TEMP TABLE admin_source_map (
  citation_text TEXT PRIMARY KEY,
  source_id UUID NOT NULL
) ON COMMIT DROP;

-- Populate topic map
INSERT INTO admin_topic_map (topic_code, topic_id)
SELECT code, id FROM topics WHERE code LIKE 'ADMIN-%';

-- Populate lesson map (via topics)
INSERT INTO admin_lesson_map (topic_code, lesson_id)
SELECT t.code, l.id
FROM lessons l
JOIN topics t ON t.id = l.topic_id
WHERE t.code LIKE 'ADMIN-%';

-- Populate source map (use DISTINCT ON to handle duplicate citation_text)
INSERT INTO admin_source_map (citation_text, source_id)
SELECT DISTINCT ON (citation_text) citation_text, id
FROM sources 
WHERE citation_text IN (
  'Lineamientos para el Examen por Competencia de Profesionales de Enfermería',
  'Administración de los servicios de enfermería',
  'Principles of Management — Chapter 3: The History of Management',
  'Taylor-Made Management',
  'Administrative and Bureaucratic Management',
  'Human Relations Movement',
  'Nightingale''s perspective of nursing administration',
  'Florence Nightingale and healthcare reform',
  'Transformational Leadership and Evidence-Based Management — Keeping Patients Safe',
  'Reseña histórica — Asociación Nacional de Enfermeras de Panamá',
  'Historia — Facultad de Enfermería',
  'Facultad de Enfermería: hacia la acreditación, liderazgo e internacionalización de la carrera',
  'Acerca de — Ministerio de Salud de Panamá',
  'Legislación organizativa del MINSA',
  'Región de Salud de Herrera',
  'Principles of Management — The History of Management',
  'Nursing Management and Professional Concepts — Chapter 4: Leadership and Management',
  'Contingency and System Management',
  'The Internal Organization and External Environments',
  'A Model of Organizational Behavior and Management',
  'Quality of care',
  'How to address quality of health services',
  'Quality health services: a planning guide',
  'Guru Guide',
  'What Is Quality?',
  'Principles of Management',
  'Leadership and Management',
  'Lineamientos para el Examen de Competencias de Profesionales de Enfermería',
  'Introduction to Business 2e — The Role of Management',
  'Principles of Management — The Planning Process',
  'Introduction to Business 2e — Organizing',
  'Introduction to Business 2e — Authority: Establishing Organizational Relationships',
  'Principles of Management — The Process of Managerial Communication',
  'Organizational Behavior — Content Theories of Motivation',
  'Introduction to Business 2e — Controlling',
  'Código Deontológico para Enfermeras de Panamá',
  'Decreto Ejecutivo N.° 29 de 5 de diciembre de 2025 — Día Nacional de la Humanización en la Atención y en los Servicios de Salud',
  'Decreto Ejecutivo N.° 17 de 23 de marzo de 2026 — Política Nacional de Salud 2026–2035',
  'Quality health services',
  'Integrated people-centred care',
  'Global Patient Safety Action Plan 2021–2030',
  'Organizational Behavior — The Process of Managerial Communication',
  'TeamSTEPPS — Communication Concepts and Tools',
  'TeamSTEPPS Tool: SBAR',
  'TeamSTEPPS Tool: Check-Back (Repeat-Back)',
  'WISN: indicadores de carga de trabajo para la estimación del personal necesario. Manual del usuario, 2.ª edición',
  'State of the world’s nursing 2025',
  'La fuerza de trabajo en salud en las Américas: datos e indicadores regionales',
  'Sistema de Información de Recursos Humanos de Salud (SIRHS)',
  'Primera Datatón en Panamá — iniciativa para fortalecer la planificación del recurso humano en salud',
  'Indicadores de Calidad — Observatorio de Calidad de la Atención en Salud',
  'Auditoría de Egresos Hospitalarios 2024',
  'Measuring and monitoring quality of care to improve maternal, newborn, child and adolescent health services',
  'Enfermería y seguridad de los pacientes',
  'Candidate Measure Submission Form — structure/process/outcomes definitions',
  'Ley 81 de 26 de marzo de 2019 sobre Protección de Datos Personales y Decreto Ejecutivo 285 de 28 de mayo de 2021',
  'Toolkit for Routine Health Information Systems data / Data Quality Assurance'
)
ORDER BY citation_text;

-- Validate mappings
DO $$
DECLARE
  topic_count INT;
  lesson_count INT;
  source_count INT;
BEGIN
  SELECT COUNT(*) INTO topic_count FROM admin_topic_map;
  IF topic_count != 11 THEN RAISE EXCEPTION 'Expected 11 topic mappings, found %', topic_count; END IF;
  
  SELECT COUNT(*) INTO lesson_count FROM admin_lesson_map;
  IF lesson_count != 11 THEN RAISE EXCEPTION 'Expected 11 lesson mappings, found %', lesson_count; END IF;
  
  SELECT COUNT(*) INTO source_count FROM admin_source_map;
  IF source_count != 57 THEN RAISE EXCEPTION 'Expected 57 source mappings, found %', source_count; END IF;
  
  RAISE NOTICE 'Mappings validated: % topics, % lessons, % sources', topic_count, lesson_count, source_count;
END $$;

-- ================================================================
-- INSERT SECTIONS (via deterministic mappings)
-- ================================================================

-- ADMIN-01: Antecedentes históricos (68 sections)

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'alcance_oficial_cicde_0', 'Alcance oficial CICDE', $BODY_1$El temario CICDE 2026 incluye dentro del área **Administración** el tema:

> **1. Antecedentes históricos**

El lineamiento no subdivide ADMIN-01 en subtemas explícitos. Para desarrollar el alcance sin inventar una estructura ajena, este material toma como referente principal la obra citada por CICDE:

**Balderas Pedrero, María de la Luz. _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015.**

La tabla de contenidos oficial de McGraw-Hill muestra que el capítulo **“Antecedentes históricos”** incluye, entre otros:

- administración empírica;
- origen y evolución;
- el hombre primitivo;
- sociedades egipcias;
- sociedades hebreas;
- aportaciones de los filósofos;
- cristianismo;
- organización militar;
- inicio de la teoría general de la administración;
- Revolución Industrial;
- aportaciones de los administradores;
- evolución de la administración en América Latina;
- administración en Panamá.

Este paquete desarrolla esos ejes en forma de material de estudio propio y no reproduce el texto del libro.

---$BODY_1$, 1
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_de_aprendizaje_1', 'Objetivos de aprendizaje', $BODY_2$Al finalizar el tema, el estudiante debe poder:

1. Explicar por qué la administración existe desde antes de convertirse en disciplina formal.
2. Diferenciar administración empírica de administración científica.
3. Identificar aportes administrativos de sociedades antiguas.
4. Reconocer la influencia de la organización militar, religiosa y estatal.
5. Explicar cómo la Revolución Industrial impulsó la administración moderna.
6. Ubicar históricamente a Taylor, Fayol, Weber, Gantt, los Gilbreth y Mayo.
7. Diferenciar los enfoques iniciales de eficiencia, estructura y relaciones humanas.
8. Relacionar la evolución de la administración con la organización de servicios de salud.
9. Reconocer hitos de la administración sanitaria y de enfermería en Panamá.
10. Relacionar el legado de Florence Nightingale con la administración de enfermería.
11. Comprender que las teorías administrativas se acumulan y complementan, no se sustituyen por completo.
12. Resolver preguntas tipo CICDE sobre secuencia histórica, autores y aportes.

---$BODY_2$, 2
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'concepto_hist_rico_de_administraci_n_2', 'Concepto histórico de administración', $BODY_3$La administración surge de una necesidad básica:

> **coordinar personas y recursos para alcanzar objetivos.**

Antes de existir escuelas administrativas ya había que:

- repartir tareas;
- organizar recursos;
- establecer autoridad;
- controlar resultados;
- resolver conflictos;
- mantener registros;
- coordinar grupos.

Por eso se habla de una etapa **empírica** antes de una etapa científica o teórica.

---$BODY_3$, 3
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'administraci_n_emp_rica_3', 'Administración empírica', $BODY_4$La administración empírica se basa en:

- experiencia;
- costumbre;
- prueba y error;
- tradición;
- observación práctica.

No significa ausencia de organización.

Significa que todavía no existía un cuerpo sistemático de teorías administrativas formuladas con intención científica.

---$BODY_4$, 4
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'del_empirismo_a_la_teor_a_4', 'Del empirismo a la teoría', $BODY_5$La evolución general puede representarse así:

```text
Necesidad de organizar
        ↓
Prácticas empíricas
        ↓
Especialización y jerarquías
        ↓
Grandes organizaciones
        ↓
Revolución Industrial
        ↓
Teoría administrativa formal
        ↓
Enfoques contemporáneos
```

---$BODY_5$, 5
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'el_ser_humano_primitivo_5', 'El ser humano primitivo', $BODY_6$Los grupos humanos tempranos necesitaron:

- distribuir funciones;
- organizar alimentación;
- proteger al grupo;
- asignar tareas;
- coordinar caza y recolección;
- tomar decisiones.

La división del trabajo surgió mucho antes que la empresa moderna.

### Idea de examen

La administración no nació con las fábricas: **la fábrica impulsó su formalización científica**, pero la práctica administrativa es mucho más antigua.

---$BODY_6$, 6
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'divisi_n_del_trabajo_6', 'División del trabajo', $BODY_7$La división del trabajo significa separar actividades entre personas o grupos.

Sus beneficios históricos incluyen:

- especialización;
- repetición;
- desarrollo de destrezas;
- coordinación;
- mayor capacidad para realizar tareas complejas.

En salud actual se observa en:

- enfermería;
- medicina;
- farmacia;
- laboratorio;
- administración;
- servicios auxiliares.

---$BODY_7$, 7
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'autoridad_y_coordinaci_n_7', 'Autoridad y coordinación', $BODY_8$Cuando un grupo crece, aumenta la necesidad de:

- definir quién decide;
- asignar responsabilidades;
- coordinar actividades;
- establecer reglas.

Estos conceptos reaparecerán posteriormente en Fayol, Weber y la administración moderna.

---$BODY_8$, 8
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'primeros_registros_administrativos_8', 'Primeros registros administrativos', $BODY_9$La escritura permitió mejorar:

- inventarios;
- impuestos;
- comercio;
- propiedad;
- trabajo;
- obligaciones.

La administración se volvió más compleja cuando las sociedades necesitaron registrar operaciones en lugar de depender solo de memoria y tradición oral.

---$BODY_9$, 9
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'mesopotamia_y_el_c_digo_de_hammurabi_9', 'Mesopotamia y el Código de Hammurabi', $BODY_10$El Código de Hammurabi es un ejemplo histórico de:

- reglas escritas;
- responsabilidades;
- transacciones;
- sanciones;
- regulación de conductas.

OpenStax identifica el Código de Hammurabi como un antecedente temprano de normas que regulaban actividades comerciales, relaciones y responsabilidades.

### Clave

Su importancia administrativa está en la **formalización de reglas**.

---$BODY_10$, 10
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'egipto_antiguo_10', 'Egipto antiguo', $BODY_11$La construcción y mantenimiento de grandes obras exigieron:

- planificación;
- recursos;
- supervisión;
- división del trabajo;
- registros;
- autoridad central.

No se debe afirmar que los egipcios tenían “administración moderna”; se reconoce que utilizaron prácticas organizativas complejas.

---$BODY_11$, 11
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'sociedades_hebreas_11', 'Sociedades hebreas', $BODY_12$Las tradiciones hebreas se han usado históricamente en textos administrativos para ilustrar:

- delegación;
- autoridad;
- organización por niveles;
- normas;
- responsabilidad.

Uno de los ejemplos clásicos es la necesidad de distribuir decisiones entre responsables de diferentes niveles para evitar que una sola persona concentre todo el trabajo.

---$BODY_12$, 12
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'grecia_y_pensamiento_racional_12', 'Grecia y pensamiento racional', $BODY_13$Los filósofos griegos aportaron ideas relacionadas con:

- organización del Estado;
- división de funciones;
- ética;
- autoridad;
- formas de gobierno;
- razonamiento sistemático.

Aunque no crearon la administración moderna, ayudaron a desarrollar formas racionales de analizar la organización humana.

---$BODY_13$, 13
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 's_crates_plat_n_y_arist_teles_13', 'Sócrates, Platón y Aristóteles', $BODY_14$En la historia del pensamiento administrativo suelen relacionarse con:

- **Sócrates:** reflexión sobre conocimiento y capacidad para dirigir;
- **Platón:** especialización y organización social;
- **Aristóteles:** análisis de formas de gobierno y organización política.

Estas referencias deben entenderse como **antecedentes intelectuales**, no como teorías administrativas modernas.

---$BODY_14$, 14
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'roma_14', 'Roma', $BODY_15$La expansión romana requirió:

- administración territorial;
- jerarquías;
- normas;
- recaudación;
- logística;
- organización militar;
- comunicación.

La administración pública y militar romana mostró la importancia de coordinar organizaciones de gran escala.

---$BODY_15$, 15
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cristianismo_y_organizaci_n_institucional_15', 'Cristianismo y organización institucional', $BODY_16$Las organizaciones religiosas desarrollaron durante siglos:

- jerarquías;
- autoridad definida;
- reglas;
- administración territorial;
- continuidad institucional;
- comunicación vertical.

Su estudio histórico suele relacionarse con la evolución de estructuras administrativas duraderas.

---$BODY_16$, 16
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_militar_16', 'Organización militar', $BODY_17$La organización militar aportó conceptos que luego aparecen en administración:

- jerarquía;
- cadena de mando;
- disciplina;
- unidad de dirección;
- estrategia;
- logística;
- delegación;
- coordinación.

### Aplicación en enfermería

Los servicios de enfermería también necesitan líneas claras de responsabilidad, aunque la gestión actual no debe confundirse con un modelo autoritario rígido.

---$BODY_17$, 17
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cadena_de_mando_17', 'Cadena de mando', $BODY_18$La cadena de mando define:

- quién reporta a quién;
- quién supervisa;
- quién tiene autoridad;
- cómo fluye la comunicación formal.

En organizaciones de salud ayuda a evitar:

- órdenes contradictorias;
- duplicidad;
- falta de responsabilidad.

---$BODY_18$, 18
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'renacimiento_y_expansi_n_comercial_18', 'Renacimiento y expansión comercial', $BODY_19$El crecimiento del comercio europeo favoreció:

- contabilidad;
- asociaciones comerciales;
- banca;
- contratos;
- administración de empresas;
- registro sistemático.

La complejidad económica creó nuevas necesidades administrativas.

---$BODY_19$, 19
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'revoluci_n_industrial_19', 'Revolución Industrial', $BODY_20$La Revolución Industrial transformó:

- producción;
- tamaño de las organizaciones;
- relación trabajador-empresa;
- tecnología;
- supervisión;
- disciplina laboral;
- concentración de mano de obra.

OpenStax ubica la Revolución Industrial aproximadamente entre 1760 y 1900 y la relaciona con el surgimiento de la fábrica moderna.

---$BODY_20$, 20
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, '_por_qu_la_revoluci_n_industrial_es_decisiva__20', '¿Por qué la Revolución Industrial es decisiva?', $BODY_21$Porque las fábricas reunieron:

- grandes grupos de trabajadores;
- maquinaria;
- capital;
- procesos repetitivos;
- horarios;
- supervisores;
- objetivos de producción.

Esto hizo evidente la necesidad de estudiar sistemáticamente cómo organizar el trabajo.

---$BODY_21$, 21
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'problemas_de_las_primeras_f_bricas_21', 'Problemas de las primeras fábricas', $BODY_22$Entre los problemas administrativos estaban:

- baja coordinación;
- desperdicio;
- métodos variables;
- disciplina;
- selección de trabajadores;
- supervisión;
- conflictos laborales;
- costos.

La búsqueda de eficiencia impulsó las primeras teorías formales.

---$BODY_22$, 22
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'inicio_de_la_teor_a_general_de_la_administraci_n_22', 'Inicio de la teoría general de la administración', $BODY_23$A finales del siglo XIX y comienzos del XX aparecen intentos sistemáticos de explicar:

- cómo organizar el trabajo;
- cómo dirigir;
- cómo controlar;
- cómo estructurar organizaciones;
- cómo aumentar eficiencia.

De esta etapa surgen las escuelas clásica y científica.

---$BODY_23$, 23
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'frederick_winslow_taylor_23', 'Frederick Winslow Taylor', $BODY_24$Frederick Winslow Taylor es asociado con la **administración científica**.

OpenStax lo identifica como una figura central en el uso de métodos científicos para estudiar el trabajo.

Su atención se centró especialmente en:

- tareas;
- métodos;
- tiempos;
- productividad;
- selección y entrenamiento;
- cooperación entre trabajador y administración.

---$BODY_24$, 24
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'los_cuatro_principios_de_taylor_24', 'Los cuatro principios de Taylor', $BODY_25$En términos resumidos:

1. desarrollar un método científico para cada trabajo;
2. seleccionar y entrenar trabajadores de manera sistemática;
3. promover cooperación entre dirección y trabajadores;
4. distribuir responsabilidades entre administración y trabajadores.

### Clave de examen

Taylor = **eficiencia del trabajo y administración científica**.

---$BODY_25$, 25
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estudios_de_tiempos_25', 'Estudios de tiempos', $BODY_26$Taylor buscó analizar:

- cuánto tiempo toma una tarea;
- qué método es más eficiente;
- cómo estandarizar trabajo;
- cómo planificar y controlar.

La intención era reemplazar decisiones basadas exclusivamente en costumbre por análisis sistemático.

---$BODY_26$, 26
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'aporte_y_l_mite_del_taylorismo_26', 'Aporte y límite del taylorismo', $BODY_27$**Aporte**
- medición;
- eficiencia;
- estandarización;
- planificación del trabajo.

**Límite**
- puede reducir al trabajador a una función productiva si se aplica de manera rígida.

La administración posterior incorporó factores humanos, sociales y psicológicos.

---$BODY_27$, 27
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'frank_y_lillian_gilbreth_27', 'Frank y Lillian Gilbreth', $BODY_28$Se relacionan con:

- estudios de movimientos;
- reducción de movimientos innecesarios;
- eficiencia;
- diseño del trabajo.

OpenStax reconoce los estudios de movimientos como su aporte característico.

---$BODY_28$, 28
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'henry_gantt_28', 'Henry Gantt', $BODY_29$Henry Gantt desarrolló herramientas para:

- programar actividades;
- visualizar avance;
- comparar trabajo planificado y realizado.

El **diagrama de Gantt** continúa utilizándose en gestión de proyectos.

---$BODY_29$, 29
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'henri_fayol_29', 'Henri Fayol', $BODY_30$Henri Fayol desarrolló una visión administrativa orientada a la **organización completa**, no solo a la tarea individual.

OpenStax contrasta:

- Taylor → nivel operativo;
- Fayol → dirección y organización global.

### Clave

Fayol = **teoría administrativa / organización y funciones gerenciales**.

---$BODY_30$, 30
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'funciones_administrativas_de_fayol_30', 'Funciones administrativas de Fayol', $BODY_31$En formulaciones históricas asociadas a Fayol aparecen funciones como:

- planificar;
- organizar;
- dirigir;
- coordinar/controlar.

Las traducciones y agrupaciones varían entre textos.

El temario CICDE posteriormente trabajará funciones administrativas de manera específica en ADMIN-05 y ADMIN-07.

---$BODY_31$, 31
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'principios_de_fayol_31', 'Principios de Fayol', $BODY_32$Entre sus conceptos se encuentran:

- división del trabajo;
- autoridad y responsabilidad;
- disciplina;
- unidad de mando;
- unidad de dirección;
- orden;
- equidad;
- estabilidad;
- iniciativa;
- espíritu de equipo.

No deben memorizarse sin comprender su propósito organizativo.

---$BODY_32$, 32
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'taylor_vs_fayol_32', 'Taylor vs Fayol', $BODY_33$| Taylor | Fayol |
|---|---|
| Se concentra más en la tarea y nivel operativo | Se concentra más en la organización global |
| Administración científica | Teoría administrativa |
| Métodos y eficiencia del trabajo | Funciones y principios de administración |
| Productividad operativa | Dirección y coordinación |

Ambos pertenecen al desarrollo clásico de la administración.

---$BODY_33$, 33
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'max_weber_33', 'Max Weber', $BODY_34$Max Weber se relaciona con el modelo de **burocracia racional-legal**.

OpenStax resume que defendía organizaciones formalizadas, reglas y decisiones basadas en autoridad legal y conocimiento más que en privilegios personales.

---$BODY_34$, 34
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'caracter_sticas_de_la_burocracia_34', 'Características de la burocracia', $BODY_35$En términos generales:

- reglas formales;
- funciones definidas;
- jerarquía;
- especialización;
- autoridad legítima;
- procedimientos;
- selección basada en competencia.

### Ventaja

Previsibilidad y consistencia.

### Riesgo

Exceso de formalismo, lentitud y rigidez.

---$BODY_35$, 35
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'burocracia_no_significa_simplemente_papeleo__35', 'Burocracia no significa simplemente “papeleo”', $BODY_36$En teoría administrativa, burocracia se refiere a un modelo racional de organización.

El uso cotidiano de “burocracia” como sinónimo de trámites lentos no expresa todo el concepto de Weber.

---$BODY_36$, 36
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'elton_mayo_y_relaciones_humanas_36', 'Elton Mayo y relaciones humanas', $BODY_37$El movimiento de relaciones humanas enfatizó que el desempeño no depende solamente de:

- salario;
- método;
- estructura.

También influyen:

- relaciones sociales;
- percepción;
- grupo;
- supervisión;
- motivación;
- comunicación.

---$BODY_37$, 37
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estudios_de_hawthorne_37', 'Estudios de Hawthorne', $BODY_38$Los estudios realizados en la planta Hawthorne se desarrollaron entre 1924 y 1932.

OpenStax advierte que suelen simplificarse en exceso y que Elton Mayo no inició los experimentos; se incorporó posteriormente.

Su importancia histórica está en que ayudaron a dirigir atención hacia el **componente humano y social del trabajo**.

---$BODY_38$, 38
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'lecci_n_de_hawthorne_38', 'Lección de Hawthorne', $BODY_39$La productividad puede estar influida por:

- atención;
- relaciones;
- grupo;
- supervisión;
- sentido de pertenencia;
- condiciones de trabajo;
- remuneración.

No existe una única causa universal de motivación.

---$BODY_39$, 39
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'de_tarea_a_persona__39', 'De “tarea” a “persona”', $BODY_40$La evolución histórica puede resumirse:

```text
Eficiencia de tarea
      ↓
Estructura organizativa
      ↓
Reglas y autoridad
      ↓
Relaciones humanas
      ↓
Sistemas, contingencia y enfoques contemporáneos
```

Cada etapa añadió nuevas variables.

---$BODY_40$, 40
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'administraci_n_y_enfermer_a_40', 'Administración y enfermería', $BODY_41$La enfermería necesita administración porque debe coordinar:

- personas;
- turnos;
- pacientes;
- insumos;
- tiempo;
- procedimientos;
- información;
- calidad;
- seguridad.

El cuidado clínico y la administración no son ámbitos separados: la organización influye directamente en la calidad del cuidado.

---$BODY_41$, 41
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'florence_nightingale_como_administradora_41', 'Florence Nightingale como administradora', $BODY_42$Florence Nightingale es conocida por su trabajo clínico y sanitario, pero la literatura histórica también la reconoce como una figura importante de **administración y liderazgo de enfermería**.

Un artículo histórico indexado en PubMed señala que muchas de sus ideas administrativas siguen siendo relevantes para:

- liderazgo;
- gestión de personal;
- estándares;
- calidad.

---$BODY_42$, 42
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'nightingale_y_uso_de_datos_42', 'Nightingale y uso de datos', $BODY_43$Nightingale utilizó:

- observación;
- estadísticas;
- organización;
- evidencia;
- reforma institucional.

Su trabajo con datos apoyó cambios en higiene, organización hospitalaria y gestión del entorno.

### Importancia

Relaciona administración con **resultados de salud**.

---$BODY_43$, 43
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'nightingale_y_estructura_hospitalaria_43', 'Nightingale y estructura hospitalaria', $BODY_44$Fuentes de historia de la gestión de enfermería describen su interés por:

- liderazgo de enfermería;
- autoridad profesional;
- organización de hospitales;
- formación;
- estándares.

Su legado ayuda a entender por qué la enfermería necesita participación en decisiones administrativas.

---$BODY_44$, 44
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'enfermer_a_como_profesi_n_organizada_44', 'Enfermería como profesión organizada', $BODY_45$La profesionalización implicó:

- formación formal;
- estándares;
- asociaciones;
- regulación;
- liderazgo;
- estructuras administrativas.

La administración de enfermería dejó de ser solamente supervisión práctica y evolucionó hacia gestión profesional.

---$BODY_45$, 45
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'am_rica_latina_45', 'América Latina', $BODY_46$Balderas dedica parte del capítulo histórico a la evolución administrativa en América Latina y presenta ejemplos nacionales.

Para fines CICDE interesa comprender que la administración en la región se desarrolló bajo influencia de:

- modelos europeos;
- industrialización;
- Estado;
- instituciones públicas;
- sistemas de salud;
- educación profesional.

No debe asumirse que todos los países evolucionaron de manera idéntica.

---$BODY_46$, 46
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'administraci_n_en_panam_contexto_46', 'Administración en Panamá: contexto', $BODY_47$La séptima edición de Balderas incluye expresamente un apartado **“Administración en Panamá”** dentro del capítulo de antecedentes históricos.

Para complementar ese eje se utilizan fuentes oficiales panameñas de salud y enfermería.

---$BODY_47$, 47
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'anep_organizaci_n_profesional_47', 'ANEP: organización profesional', $BODY_48$La Asociación Nacional de Enfermeras de Panamá informa que:

- fue fundada el **20 de agosto de 1925**;
- inicialmente se llamó **Asociación de Enfermeras Graduadas del Hospital Santo Tomás**;
- en 1945 se reorganizó como Sociedad Nacional de Enfermeras;
- en 1956 adoptó el nombre Asociación Nacional de Enfermeras de Panamá.

Esto muestra la evolución organizativa del gremio profesional.

---$BODY_48$, 48
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'formaci_n_universitaria_de_enfermer_a_en_panam__48', 'Formación universitaria de enfermería en Panamá', $BODY_49$Fuentes de la Universidad de Panamá indican:

- **1963:** Departamento de Estudios Avanzados de Enfermería y programa complementario;
- **1965:** creación de la Escuela de Enfermería;
- **1967:** inicio del programa básico de licenciatura;
- **1985:** creación de la Facultad de Enfermería.

La profesionalización universitaria amplió también las capacidades de liderazgo, docencia, investigación y administración.

---$BODY_49$, 49
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'creaci_n_del_ministerio_de_salud_de_panam__49', 'Creación del Ministerio de Salud de Panamá', $BODY_50$MINSA fue creado mediante:

- **Decreto de Gabinete N.° 1 del 15 de enero de 1969**.

El Estatuto Orgánico fue establecido mediante:

- **Decreto Ejecutivo N.° 75 del 27 de febrero de 1969**.

Estos hitos consolidaron una estructura nacional de conducción sanitaria.

---$BODY_50$, 50
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_regional_sanitaria_50', 'Organización regional sanitaria', $BODY_51$La creación del MINSA fortaleció la organización mediante:

- regiones;
- áreas médico-sanitarias;
- coordinación de programas;
- estructuras territoriales.

La administración sanitaria deja de ser únicamente hospitalaria y se extiende a redes y comunidades.

---$BODY_51$, 51
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'participaci_n_comunitaria_51', 'Participación comunitaria', $BODY_52$MINSA identifica como hito:

- **Decreto N.° 401 de 29 de diciembre de 1970**, asociado a la organización de Comités de Salud.

Esto incorporó participación comunitaria organizada en la solución de problemas de salud.

---$BODY_52$, 52
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'integraci_n_de_servicios_en_panam__52', 'Integración de servicios en Panamá', $BODY_53$Fuentes oficiales describen procesos históricos de integración entre MINSA y CSS.

En Azuero, la Región de Salud de Herrera señala que:

- en 1975 se estableció el Sistema Integrado de Salud de Azuero para Herrera y Los Santos;
- en 1995 se separaron las regiones de Herrera y Los Santos.

Este dato es útil como ejemplo de evolución organizacional de servicios sanitarios.

---$BODY_53$, 53
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'administraci_n_sanitaria_vs_administraci_n_de_enfe_53', 'Administración sanitaria vs administración de enfermería', $BODY_54$**Administración sanitaria**
- sistema;
- instituciones;
- políticas;
- redes;
- recursos poblacionales.

**Administración de enfermería**
- servicio de enfermería;
- personal;
- cuidado;
- turnos;
- recursos;
- calidad;
- supervisión.

Se relacionan, pero no son idénticas.

---$BODY_54$, 54
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'influencia_de_los_modelos_cl_sicos_en_salud_54', 'Influencia de los modelos clásicos en salud', $BODY_55$Ejemplos:

**Taylor**
- tiempos;
- procesos;
- estandarización.

**Fayol**
- planificación;
- organización;
- dirección;
- control.

**Weber**
- estructura;
- reglas;
- funciones;
- jerarquía.

**Relaciones humanas**
- motivación;
- comunicación;
- liderazgo;
- clima laboral.

---$BODY_55$, 55
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'qu_permanece_vigente_55', 'Qué permanece vigente', $BODY_56$Aunque surgieron hace décadas, todavía se observan:

- organigramas;
- procedimientos;
- protocolos;
- división del trabajo;
- cadenas de mando;
- supervisión;
- indicadores;
- programación;
- gestión de personal.

La administración contemporánea combina elementos de diferentes escuelas.

---$BODY_56$, 56
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'qu_cambi__56', 'Qué cambió', $BODY_57$La gestión actual da mayor importancia a:

- participación;
- liderazgo;
- equipos;
- calidad;
- seguridad;
- evidencia;
- ética;
- derechos;
- tecnología;
- sistemas complejos.

Por eso no debe aplicarse literalmente una teoría histórica fuera de contexto.

---$BODY_57$, 57
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'l_nea_de_tiempo_resumida_57', 'Línea de tiempo resumida', $BODY_58$```text
Sociedades antiguas
  ↓
Reglas, jerarquías, división de trabajo
  ↓
Organización religiosa y militar
  ↓
Expansión comercial
  ↓
Revolución Industrial (aprox. 1760–1900)
  ↓
Taylor — administración científica
  ↓
Fayol — teoría administrativa
  ↓
Weber — burocracia racional
  ↓
Gantt / Gilbreth — programación y movimientos
  ↓
Hawthorne / relaciones humanas
  ↓
Enfoques contemporáneos
```

---$BODY_58$, 58
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'l_nea_de_tiempo_paname_a_resumida_58', 'Línea de tiempo panameña resumida', $BODY_59$```text
1925  Organización profesional precursora de ANEP
1945  Reorganización gremial
1956  Nombre Asociación Nacional de Enfermeras de Panamá
1963  Estudios avanzados universitarios de enfermería
1965  Escuela de Enfermería — Universidad de Panamá
1967  Programa básico de licenciatura
1969  Creación del Ministerio de Salud
1970  Comités de Salud
1975  Sistema Integrado de Salud de Azuero
1985  Facultad de Enfermería — Universidad de Panamá
1995  Separación de regiones de salud Herrera y Los Santos
```

---$BODY_59$, 59
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'relaci_n_historia_pr_ctica_de_enfermer_a_59', 'Relación historia → práctica de enfermería', $BODY_60$La historia explica por qué hoy existen:

- jefaturas;
- departamentos;
- protocolos;
- indicadores;
- turnos;
- supervisión;
- planificación;
- comités;
- organigramas;
- evaluación.

Muchos instrumentos actuales son versiones evolucionadas de necesidades administrativas antiguas.

---$BODY_60$, 60
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'diferencias_que_deben_memorizarse_60', 'Diferencias que deben memorizarse', $BODY_61$| Autor/enfoque | Asociación principal |
|---|---|
| Taylor | Administración científica / eficiencia |
| Fayol | Teoría administrativa / funciones y principios |
| Weber | Burocracia racional-legal |
| Gantt | Programación y control mediante gráfica |
| Frank y Lillian Gilbreth | Estudios de movimientos |
| Mayo / relaciones humanas | Factores sociales y humanos |
| Nightingale | Liderazgo, organización y administración de enfermería |

---$BODY_61$, 61
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_examen_61', 'Errores frecuentes de examen', $BODY_62$1. Decir que la administración nació con Taylor.
2. Confundir Taylor con Fayol.
3. Atribuir la burocracia a Taylor.
4. Atribuir el diagrama de Gantt a Fayol.
5. Reducir Hawthorne a “la luz aumentó la productividad”.
6. Creer que administración empírica significa ausencia de organización.
7. Suponer que la Revolución Industrial creó la división del trabajo desde cero.
8. Confundir administración sanitaria con administración de enfermería.
9. Tratar la burocracia de Weber solo como “papeleo”.
10. Ignorar el componente humano de la gestión.
11. Reducir a Nightingale solamente al cuidado a pie de cama.
12. Confundir la creación del MINSA con la creación de la Facultad de Enfermería.

---$BODY_62$, 62
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estrategia_cicde_para_admin_01_62', 'Estrategia CICDE para ADMIN-01', $BODY_63$Ante una pregunta histórica:

**Paso 1:** identificar el periodo.  
**Paso 2:** identificar si pregunta por tarea, estructura, reglas o factor humano.  
**Paso 3:** asociar autor/enfoque.  
**Paso 4:** descartar anacronismos.  
**Paso 5:** relacionar con gestión de enfermería si el caso lo pide.

---$BODY_63$, 63
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'situaciones_originales_tipo_examen_63', 'Situaciones originales tipo examen', $BODY_64$## Caso 1 — Administración antes de la teoría
Un estudiante afirma que antes de Taylor no existía administración.

**Respuesta:** incorrecto. Existían prácticas administrativas empíricas; Taylor contribuyó a su sistematización científica.

---

## Caso 2 — Eficiencia de tareas
Una organización analiza tiempos y estandariza cada tarea para encontrar el método más eficiente.

**Respuesta:** corresponde al enfoque de administración científica asociado a Taylor.

---

## Caso 3 — Organización completa
Una pregunta se centra en planificación, organización y dirección de toda la institución.

**Respuesta:** se relaciona más con Fayol que con Taylor.

---

## Caso 4 — Reglas formales
La institución enfatiza cargos definidos, jerarquía y reglas impersonales.

**Respuesta:** modelo burocrático asociado a Weber.

---

## Caso 5 — Programación
Una jefa utiliza una gráfica para visualizar actividades programadas y avance.

**Respuesta:** herramienta asociada históricamente a Henry Gantt.

---

## Caso 6 — Movimientos
Se estudian movimientos innecesarios durante una tarea para reducir esfuerzo.

**Respuesta:** aporte asociado a Frank y Lillian Gilbreth.

---

## Caso 7 — Factores sociales
La productividad cambia después de mejorar relaciones con supervisores y equipo.

**Respuesta:** enfoque de relaciones humanas.

---

## Caso 8 — Hawthorne
Un estudiante dice: “Hawthorne demostró que cualquier aumento de iluminación mejora productividad”.

**Respuesta:** simplificación incorrecta. Los estudios fueron más complejos y ayudaron a resaltar factores sociales, supervisión y atención.

---

## Caso 9 — Administración de enfermería
Una jefa coordina personal, turnos, recursos y calidad del cuidado.

**Respuesta:** está aplicando administración de servicios de enfermería.

---

## Caso 10 — Nightingale
Se pregunta por una figura histórica que integró liderazgo, datos y reforma hospitalaria en enfermería.

**Respuesta:** Florence Nightingale.

---

## Caso 11 — Panamá
¿Qué institución sanitaria nacional fue creada en 1969?

**Respuesta:** Ministerio de Salud de Panamá.

---

## Caso 12 — Gremio
¿Cuál es un antecedente organizativo del gremio de enfermería panameño?

**Respuesta:** la asociación fundada en 1925 que evolucionó posteriormente hasta la ANEP.

---

## Caso 13 — Universidad
¿Qué hito corresponde a 1985 en la Universidad de Panamá?

**Respuesta:** creación de la Facultad de Enfermería.

---

## Caso 14 — Azuero
Un caso pregunta por integración histórica de servicios de salud en Herrera y Los Santos.

**Respuesta:** el Sistema Integrado de Salud de Azuero se estableció en 1975 según la historia oficial de la Región de Salud de Herrera.

---$BODY_64$, 64
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preguntas_r_pidas_de_repaso_64', 'Preguntas rápidas de repaso', $BODY_65$**1. ¿Qué precede a la administración científica?**  
Administración empírica.

**2. ¿Qué fenómeno favoreció la formalización de la administración?**  
La Revolución Industrial.

**3. ¿Quién se asocia con administración científica?**  
Frederick W. Taylor.

**4. ¿Quién se asocia con teoría administrativa?**  
Henri Fayol.

**5. ¿Quién se asocia con burocracia racional?**  
Max Weber.

**6. ¿Quién desarrolló el diagrama de Gantt?**  
Henry Gantt.

**7. ¿Quiénes estudiaron movimientos?**  
Frank y Lillian Gilbreth.

**8. ¿Qué enfoque destacó factores sociales del trabajo?**  
Relaciones humanas.

**9. ¿Qué figura de enfermería tuvo también un fuerte papel administrativo?**  
Florence Nightingale.

**10. ¿En qué año se creó MINSA Panamá?**  
1969.

---$BODY_65$, 65
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fuentes_y_validaci_n_65', 'Fuentes y validación', $BODY_66$## Fuente rectora CICDE

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** _Lineamientos para el Examen por Competencia de Profesionales de Enfermería_. Tercera edición. Panamá, 2026.  
   El área 2.6 enumera 11 temas de Administración y coloca “Antecedentes históricos” como el primero.

## Bibliografía principal indicada por CICDE

2. **Balderas Pedrero, María de la Luz.** _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015. ISBN 9786071512413.  
   Página oficial del editor:  
   https://www.mheducation.com.mx/administracion-de-los-servicios-de-enfermeria-9786071512413-latam-group

   La ficha oficial confirma que el Capítulo 1 “Antecedentes históricos” abarca administración empírica, origen/evolución, sociedades antiguas, filósofos, cristianismo, organización militar, Revolución Industrial, aportes administrativos y evolución en América Latina, incluida Panamá.

## Fuentes complementarias de historia administrativa

3. **OpenStax. _Principles of Management_. Chapter 3: The History of Management.**  
   https://openstax.org/books/principles-management/pages/3-introduction

4. **OpenStax. Taylor-Made Management.**  
   https://openstax.org/books/principles-management/pages/3-4-taylor-made-management

5. **OpenStax. Administrative and Bureaucratic Management.**  
   https://openstax.org/books/principles-management/pages/3-5-administrative-and-bureaucratic-management

6. **OpenStax. Human Relations Movement.**  
   https://openstax.org/books/principles-management/pages/3-6-human-relations-movement

## Historia de administración y liderazgo de enfermería

7. **Henry B, Woods S, Nagelkerk J.** Nightingale's perspective of nursing administration. _Nurs Health Care_. 1990;11(4):201-206. PMID 2184383.  
   https://pubmed.ncbi.nlm.nih.gov/2184383/

8. **Kudzma EC.** Florence Nightingale and healthcare reform. _Nurs Sci Q_. 2006;19(1):61-64.  
   https://pubmed.ncbi.nlm.nih.gov/16407602/

9. **NCBI Bookshelf.** Transformational Leadership and Evidence-Based Management — _Keeping Patients Safe_.  
   https://www.ncbi.nlm.nih.gov/books/NBK216194/

## Panamá — fuentes oficiales/institucionales

10. **Asociación Nacional de Enfermeras de Panamá (ANEP). Reseña histórica.**  
    https://anep.org.pa/nosotros/

11. **Universidad de Panamá — Facultad de Enfermería. Historia institucional.**  
    https://facenfermeria.up.ac.pa/historia

12. **Universidad de Panamá. Facultad de Enfermería: hacia la acreditación, liderazgo e internacionalización de la carrera.**  
    https://launiversidad.up.ac.pa/node/1159

13. **Ministerio de Salud de Panamá. Acerca de — historia del MINSA.**  
    https://www.minsa.gob.pa/node/1619

14. **Ministerio de Salud de Panamá. Legislación organizativa del MINSA.**  
    https://pam.minsa.gob.pa/legislacion-organizativa-del-minsa/

15. **Ministerio de Salud de Panamá — Región de Salud de Herrera.** Historia regional e integración de servicios en Azuero.  
    https://www.minsa.gob.pa/region-de-salud/region-de-salud-de-herrera

---$BODY_66$, 66
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_de_calidad_66', 'Control de calidad', $BODY_67$Este paquete fue elaborado con las siguientes reglas:

- alcance cotejado contra CICDE 2026;
- ADMIN-01 no tiene subtemas explícitos en el lineamiento, por lo que no se inventó una lista CICDE inexistente;
- la expansión temática se basó en la tabla de contenidos oficial de la obra de Balderas citada por CICDE;
- la ficha de McGraw-Hill confirma 7.ª edición, 2015 e ISBN 9786071512413;
- historia administrativa general contrastada con OpenStax;
- Taylor, Fayol, Weber, Gantt, Gilbreth y relaciones humanas diferenciados;
- Hawthorne se presenta sin la simplificación histórica habitual;
- Nightingale se reconoce también como administradora/líder con respaldo de literatura histórica indexada;
- hitos panameños se apoyan en ANEP, Universidad de Panamá y MINSA;
- se distingue historia administrativa general de historia sanitaria panameña;
- preguntas y situaciones son originales;
- no se reproduce texto protegido de Balderas;
- no se declara revisión humana inexistente.

---$BODY_67$, 67
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estado_para_integraci_n_67', 'Estado para integración', $BODY_68$**Estado:** `REVIEW`

Motivo:

- alcance y contenido fueron sometidos a validación documental/académica;
- no existe todavía revisor humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` por una revisión realizada por IA.

**Cobertura CICDE ADMIN-01: tema principal cubierto completamente conforme al alcance disponible.**

**Situaciones originales tipo examen: 14.**$BODY_68$, 68
FROM admin_lesson_map WHERE topic_code = 'ADMIN-01';

-- ADMIN-02: Teoría general de la administración (73 sections)

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'alcance_oficial_cicde_0', 'Alcance oficial CICDE', $BODY_69$El temario CICDE 2026 incluye como segundo tema del área de Administración:

> **2. Teoría general de la administración**

CICDE no enumera subtemas específicos para ADMIN-02. Para desarrollar el tema sin inventar un alcance ajeno se toma como referencia principal la obra que el propio lineamiento recomienda:

**Balderas Pedrero, María de la Luz. _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015.**

La tabla de contenidos oficial de McGraw-Hill muestra que el capítulo **“Teoría general de la Administración”** incluye:

- paradigma clásico;
- teoría clásica de Henri Fayol;
- administración científica de Taylor;
- seguidores de Taylor;
- Henry Laurence Gantt;
- Frank B. Gilbreth;
- Elton Mayo;
- Douglas McGregor;
- período neoclásico de la administración;
- teóricos sobresalientes;
- influencia del modelo neoclásico en la organización;
- tipos de departamentalización.

Este paquete desarrolla esos ejes con ejemplos propios aplicados a enfermería.

---$BODY_69$, 1
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_de_aprendizaje_1', 'Objetivos de aprendizaje', $BODY_70$Al finalizar el tema, el estudiante debe poder:

1. Definir teoría general de la administración.
2. Explicar qué caracteriza al paradigma clásico.
3. Diferenciar teoría clásica y administración científica.
4. Asociar correctamente a Fayol, Taylor, Gantt, Gilbreth, Mayo y McGregor con sus principales aportes.
5. Explicar los principios administrativos de Fayol sin confundirlos con funciones.
6. Reconocer fortalezas y limitaciones de los enfoques clásicos.
7. Comprender el paso hacia relaciones humanas y enfoques neoclásicos.
8. Diferenciar Teoría X y Teoría Y de McGregor.
9. Explicar el concepto de departamentalización.
10. Identificar formas frecuentes de departamentalización.
11. Aplicar las teorías administrativas a situaciones de servicios de enfermería.
12. Distinguir administración de liderazgo, aunque ambos se relacionen.
13. Resolver situaciones tipo CICDE sobre autores, escuelas y organización.

---$BODY_70$, 2
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, '_qu_es_la_teor_a_general_de_la_administraci_n__2', '¿Qué es la teoría general de la administración?', $BODY_71$La teoría general de la administración reúne conceptos, principios y enfoques desarrollados para comprender cómo funcionan las organizaciones y cómo se pueden:

- planificar;
- organizar;
- dirigir;
- coordinar;
- controlar;
- utilizar recursos;
- alcanzar objetivos.

No existe una sola teoría que explique toda organización.

---$BODY_71$, 3
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'evoluci_n_acumulativa_de_las_teor_as_3', 'Evolución acumulativa de las teorías', $BODY_72$Las teorías administrativas no deben estudiarse como una lista aislada.

La evolución puede verse así:

```text
Administración empírica
        ↓
Paradigma clásico
        ↓
Administración científica
        ↓
Teoría administrativa
        ↓
Relaciones humanas
        ↓
Neoclasicismo
        ↓
Enfoques contemporáneos
```

Las ideas posteriores suelen corregir, ampliar o reinterpretar las anteriores.

---$BODY_72$, 4
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'paradigma_cl_sico_4', 'Paradigma clásico', $BODY_73$El paradigma clásico se desarrolló principalmente a finales del siglo XIX y comienzos del XX.

Su interés central fue lograr:

- eficiencia;
- orden;
- productividad;
- estructura;
- coordinación;
- autoridad definida.

Dentro de este periodo sobresalen Taylor y Fayol.

---$BODY_73$, 5
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'diferencia_esencial_taylor_y_fayol_5', 'Diferencia esencial: Taylor y Fayol', $BODY_74$**Taylor**
- parte principalmente del trabajo operativo;
- estudia métodos, tareas y productividad;
- administración científica.

**Fayol**
- analiza la organización desde la dirección;
- estudia funciones y principios generales;
- teoría clásica o administrativa.

### Clave CICDE

Taylor pregunta: **¿cómo realizar mejor el trabajo?**

Fayol pregunta: **¿cómo administrar mejor la organización?**

---$BODY_74$, 6
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'henri_fayol_6', 'Henri Fayol', $BODY_75$Fayol fue un ingeniero y administrador francés asociado con la teoría clásica de la administración.

Su aporte consistió en proponer que administrar es una actividad que puede:

- analizarse;
- enseñarse;
- organizarse mediante principios.

Su enfoque se dirige al conjunto de la organización.

---$BODY_75$, 7
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'funciones_administrativas_de_fayol_7', 'Funciones administrativas de Fayol', $BODY_76$Históricamente se relacionan con:

- prever/planear;
- organizar;
- mandar/dirigir;
- coordinar;
- controlar.

Las traducciones varían entre textos.

En administración moderna suelen reagruparse en funciones como:

- planificación;
- organización;
- dirección;
- control.

---$BODY_76$, 8
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'planificaci_n_8', 'Planificación', $BODY_77$Consiste en decidir anticipadamente:

- qué se quiere lograr;
- cómo;
- cuándo;
- con qué recursos;
- quién participará.

Ejemplo en enfermería:

planificar dotación y actividades para un turno con alta demanda.

---$BODY_77$, 9
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_9', 'Organización', $BODY_78$Consiste en estructurar:

- tareas;
- responsabilidades;
- recursos;
- autoridad;
- relaciones de trabajo.

Ejemplo:

definir qué funciones corresponden a cada miembro del equipo.

---$BODY_78$, 10
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'direcci_n_10', 'Dirección', $BODY_79$Incluye acciones como:

- comunicar;
- orientar;
- liderar;
- coordinar;
- motivar;
- tomar decisiones.

No es sinónimo de “dar órdenes”.

---$BODY_79$, 11
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_11', 'Control', $BODY_80$Consiste en comparar:

- lo planificado;
- lo ejecutado;
- los resultados.

Permite detectar desviaciones y aplicar correcciones.

Ejemplo:

comparar indicadores de caídas antes y después de una intervención.

---$BODY_80$, 12
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'principios_de_fayol_12', 'Principios de Fayol', $BODY_81$Entre los principios históricamente asociados a Fayol se encuentran:

- división del trabajo;
- autoridad y responsabilidad;
- disciplina;
- unidad de mando;
- unidad de dirección;
- subordinación del interés individual al general;
- remuneración;
- centralización;
- cadena escalar;
- orden;
- equidad;
- estabilidad del personal;
- iniciativa;
- espíritu de equipo.

No deben aplicarse mecánicamente fuera de contexto.

---$BODY_81$, 13
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'divisi_n_del_trabajo_13', 'División del trabajo', $BODY_82$Busca especialización para mejorar:

- destreza;
- eficiencia;
- claridad de funciones.

En enfermería:

- asignación por pacientes;
- funciones específicas;
- especialidades;
- coordinación interdisciplinaria.

---$BODY_82$, 14
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'autoridad_y_responsabilidad_14', 'Autoridad y responsabilidad', $BODY_83$Quien tiene autoridad para tomar una decisión también debe asumir responsabilidad por ella.

Un sistema donde existe responsabilidad sin autoridad suficiente genera problemas de gestión.

---$BODY_83$, 15
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'unidad_de_mando_15', 'Unidad de mando', $BODY_84$Principio histórico:

una persona debería recibir instrucciones principales de una autoridad claramente definida para evitar órdenes contradictorias.

En instituciones modernas puede haber estructuras matriciales, pero debe mantenerse claridad de responsabilidad.

---$BODY_84$, 16
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'unidad_de_direcci_n_16', 'Unidad de dirección', $BODY_85$Actividades con un mismo objetivo deberían coordinarse bajo un plan común.

Ejemplo:

un programa hospitalario de prevención de infecciones requiere objetivos y coordinación compartidos.

---$BODY_85$, 17
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cadena_escalar_17', 'Cadena escalar', $BODY_86$Representa la línea formal de autoridad desde niveles superiores hasta inferiores.

En salud:

- dirección;
- jefaturas;
- supervisión;
- personal operativo.

No debe impedir comunicación rápida cuando la seguridad del paciente exige escalar.

---$BODY_86$, 18
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'equidad_y_estabilidad_18', 'Equidad y estabilidad', $BODY_87$Fayol también reconoció la importancia de:

- trato justo;
- estabilidad del personal;
- iniciativa;
- cohesión del grupo.

Esto muestra que la teoría clásica no se limitó exclusivamente a estructura rígida.

---$BODY_87$, 19
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'frederick_winslow_taylor_19', 'Frederick Winslow Taylor', $BODY_88$Taylor es la figura central de la **administración científica**.

Su propósito fue sustituir métodos improvisados por:

- observación;
- medición;
- análisis;
- estandarización.

Su interés principal estaba en la eficiencia del trabajo.

---$BODY_88$, 20
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'principios_de_la_administraci_n_cient_fica_20', 'Principios de la administración científica', $BODY_89$En forma resumida:

1. estudiar científicamente el trabajo;
2. seleccionar y entrenar al trabajador;
3. promover cooperación entre administración y trabajador;
4. distribuir responsabilidades de manera racional.

---$BODY_89$, 21
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estudios_de_tiempo_21', 'Estudios de tiempo', $BODY_90$Consisten en analizar:

- cuánto tarda una tarea;
- qué pasos consume;
- qué método produce mejor resultado;
- cómo reducir desperdicio.

Aplicación moderna:

análisis de flujos, tiempos de espera y procesos clínicos.

---$BODY_90$, 22
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estandarizaci_n_22', 'Estandarización', $BODY_91$Taylor promovió procedimientos más uniformes.

En salud, la estandarización puede apoyar:

- seguridad;
- calidad;
- consistencia.

Pero no debe eliminar el juicio clínico ni la individualización del paciente.

---$BODY_91$, 23
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'incentivos_y_productividad_23', 'Incentivos y productividad', $BODY_92$La administración científica también relacionó productividad con incentivos.

Limitación:

la motivación humana no depende únicamente de compensación económica.

Esto sería desarrollado posteriormente por relaciones humanas y teorías motivacionales.

---$BODY_92$, 24
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'seguidores_de_taylor_24', 'Seguidores de Taylor', $BODY_93$Balderas incluye dentro del capítulo a autores que ampliaron o complementaron el enfoque científico.

Entre ellos:

- Henry Laurence Gantt;
- Frank B. Gilbreth.

---$BODY_93$, 25
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'henry_laurence_gantt_25', 'Henry Laurence Gantt', $BODY_94$Su aporte más conocido es el **diagrama de Gantt**.

Permite representar:

- tareas;
- duración;
- secuencia;
- avance;
- calendario.

Continúa utilizándose en proyectos y planificación.

---$BODY_94$, 26
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'aplicaci_n_del_gantt_en_enfermer_a_26', 'Aplicación del Gantt en enfermería', $BODY_95$Puede utilizarse para:

- implementación de protocolos;
- campañas;
- capacitación;
- auditorías;
- proyectos de calidad;
- cronogramas.

Ejemplo:

planificar durante ocho semanas la implementación de un nuevo protocolo de prevención de caídas.

---$BODY_95$, 27
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'frank_b_gilbreth_27', 'Frank B. Gilbreth', $BODY_96$Se asocia con estudios de movimientos.

Buscó:

- identificar movimientos innecesarios;
- simplificar tareas;
- disminuir fatiga;
- mejorar eficiencia.

---$BODY_96$, 28
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'gilbreth_aplicado_a_salud_28', 'Gilbreth aplicado a salud', $BODY_97$Ejemplo moderno:

analizar la disposición de materiales en un carro de curaciones para reducir:

- pasos;
- búsquedas;
- interrupciones.

La meta no es “trabajar más rápido” a cualquier costo, sino mejorar el proceso.

---$BODY_97$, 29
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'taylor_gantt_y_gilbreth_29', 'Taylor, Gantt y Gilbreth', $BODY_98$| Autor | Asociación principal |
|---|---|
| Taylor | Administración científica |
| Gantt | Programación y control |
| Gilbreth | Estudio de movimientos |

---$BODY_98$, 30
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'l_mites_del_paradigma_cl_sico_30', 'Límites del paradigma clásico', $BODY_99$Las críticas principales incluyen:

- visión mecanicista;
- exceso de énfasis en eficiencia;
- menor atención inicial a relaciones sociales;
- rigidez;
- supuesto de que existe una mejor forma universal.

Estas limitaciones favorecieron nuevos enfoques.

---$BODY_99$, 31
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'elton_mayo_31', 'Elton Mayo', $BODY_100$Mayo se asocia con el movimiento de **relaciones humanas**.

Este enfoque reconoció que el desempeño laboral también depende de:

- relaciones;
- grupo;
- comunicación;
- supervisión;
- percepción;
- motivación.

---$BODY_100$, 32
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'hawthorne_32', 'Hawthorne', $BODY_101$Los estudios de Hawthorne se realizaron entre 1924 y 1932.

Su interpretación histórica debe ser prudente:

- no demostraron una regla simple;
- Mayo no inició todos los experimentos;
- ayudaron a aumentar el interés por factores sociales en el trabajo.

---$BODY_101$, 33
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'relaciones_humanas_vs_enfoque_cient_fico_33', 'Relaciones humanas vs enfoque científico', $BODY_102$**Administración científica**
- tarea;
- método;
- productividad;
- eficiencia.

**Relaciones humanas**
- persona;
- grupo;
- motivación;
- comunicación.

No son necesariamente incompatibles; pueden complementarse.

---$BODY_102$, 34
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'grupos_informales_34', 'Grupos informales', $BODY_103$Las organizaciones no funcionan únicamente mediante:

- organigramas;
- políticas;
- cargos.

También existen:

- relaciones informales;
- líderes no oficiales;
- normas de grupo;
- redes de apoyo.

Estas pueden favorecer o dificultar el trabajo.

---$BODY_103$, 35
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'motivaci_n_35', 'Motivación', $BODY_104$La productividad y desempeño pueden depender de:

- reconocimiento;
- participación;
- autonomía;
- relaciones;
- propósito;
- condiciones de trabajo;
- remuneración.

No existe una única fuente de motivación.

---$BODY_104$, 36
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'douglas_mcgregor_36', 'Douglas McGregor', $BODY_105$McGregor desarrolló las conocidas **Teoría X y Teoría Y**.

No son dos tipos fijos de trabajadores.

Representan supuestos que los administradores pueden tener sobre las personas.

---$BODY_105$, 37
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'teor_a_x_37', 'Teoría X', $BODY_106$Supuestos típicos:

- las personas evitan el trabajo;
- necesitan control;
- requieren dirección estrecha;
- deben ser presionadas para cumplir.

Un gerente con estos supuestos tiende a usar más control externo.

---$BODY_106$, 38
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'teor_a_y_38', 'Teoría Y', $BODY_107$Supuestos típicos:

- el trabajo puede ser natural;
- las personas pueden autodirigirse;
- pueden asumir responsabilidad;
- pueden aportar creatividad;
- el compromiso puede favorecer desempeño.

Favorece participación y desarrollo.

---$BODY_107$, 39
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'x_y_y_error_frecuente_39', 'X y Y: error frecuente', $BODY_108$Incorrecto:

> “Los empleados X son malos y los Y son buenos.”

Correcto:

> X y Y describen **supuestos gerenciales** sobre la naturaleza y motivación del trabajador.

---$BODY_108$, 40
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'aplicaci_n_de_mcgregor_en_enfermer_a_40', 'Aplicación de McGregor en enfermería', $BODY_109$Ejemplo X:

supervisor que controla cada tarea porque supone que nadie cumplirá sin vigilancia.

Ejemplo Y:

jefa que establece objetivos claros, permite participación y espera responsabilidad profesional.

El contexto puede exigir diferentes grados de dirección.

---$BODY_109$, 41
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'per_odo_neocl_sico_41', 'Período neoclásico', $BODY_110$Balderas incluye un **período neoclásico de la administración** después de los autores clásicos y de relaciones humanas.

En términos generales, el neoclasicismo:

- retoma principios clásicos;
- los adapta;
- enfatiza resultados;
- objetivos;
- estructura práctica;
- funciones administrativas.

---$BODY_110$, 42
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'administraci_n_por_objetivos_42', 'Administración por objetivos', $BODY_111$Un concepto asociado al enfoque neoclásico es administrar mediante objetivos definidos.

La lógica es:

1. establecer objetivos;
2. asignar responsabilidades;
3. medir resultados;
4. comparar;
5. corregir.

Esto favorece enfoque en resultados, no solo actividades.

---$BODY_111$, 43
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_en_enfermer_a_43', 'Objetivos en enfermería', $BODY_112$Ejemplo:

Objetivo débil:

> “Mejorar las caídas.”

Objetivo más útil:

> “Reducir la tasa de caídas del servicio mediante intervenciones específicas y seguimiento de indicadores.”

Los objetivos deben permitir evaluación.

---$BODY_112$, 44
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'eficacia_y_eficiencia_44', 'Eficacia y eficiencia', $BODY_113$**Eficacia**
- alcanzar el objetivo.

**Eficiencia**
- utilizar adecuadamente los recursos para alcanzarlo.

Un servicio puede ser eficaz pero ineficiente, o eficiente en una actividad que no logra el resultado esperado.

---$BODY_113$, 45
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'efectividad_45', 'Efectividad', $BODY_114$En salud suele utilizarse para referirse al logro de resultados en condiciones reales.

Debe diferenciarse de:

- eficacia;
- eficiencia.

El uso exacto puede variar según la disciplina.

---$BODY_114$, 46
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estructura_organizacional_46', 'Estructura organizacional', $BODY_115$La estructura define:

- cargos;
- autoridad;
- relaciones;
- comunicación;
- división del trabajo;
- agrupación de actividades.

Se representa frecuentemente mediante organigramas.

---$BODY_115$, 47
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'departamentalizaci_n_47', 'Departamentalización', $BODY_116$Consiste en agrupar actividades y puestos según un criterio.

Puede facilitar:

- especialización;
- supervisión;
- coordinación;
- responsabilidad.

---$BODY_116$, 48
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'departamentalizaci_n_funcional_48', 'Departamentalización funcional', $BODY_117$Agrupa por función.

Ejemplo hospitalario:

- enfermería;
- farmacia;
- laboratorio;
- radiología;
- finanzas.

Ventaja:
- especialización.

Riesgo:
- crear “silos” entre departamentos.

---$BODY_117$, 49
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'departamentalizaci_n_geogr_fica_49', 'Departamentalización geográfica', $BODY_118$Agrupa por territorio.

Ejemplos:

- regiones de salud;
- áreas;
- provincias;
- zonas.

Favorece adaptación a necesidades locales.

---$BODY_118$, 50
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'departamentalizaci_n_por_servicio_o_producto_50', 'Departamentalización por servicio o producto', $BODY_119$Agrupa según servicio ofrecido.

Ejemplo:

- cirugía;
- medicina;
- pediatría;
- obstetricia.

Puede mejorar enfoque especializado.

---$BODY_119$, 51
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'departamentalizaci_n_por_cliente_paciente_51', 'Departamentalización por cliente/paciente', $BODY_120$Agrupa según población atendida.

Ejemplos:

- adultos;
- pediatría;
- salud mental;
- maternidad.

Es muy visible en servicios de salud.

---$BODY_120$, 52
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'departamentalizaci_n_por_proceso_52', 'Departamentalización por proceso', $BODY_121$Agrupa según etapa o proceso.

Ejemplo:

- admisión;
- diagnóstico;
- tratamiento;
- recuperación;
- seguimiento.

Puede facilitar continuidad del flujo.

---$BODY_121$, 53
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estructura_matricial_53', 'Estructura matricial', $BODY_122$Combina dos dimensiones, por ejemplo:

- función;
- proyecto/servicio.

Ventaja:
- flexibilidad.

Riesgo:
- doble autoridad y conflictos si responsabilidades no están claras.

---$BODY_122$, 54
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'centralizaci_n_54', 'Centralización', $BODY_123$Las decisiones se concentran en niveles superiores.

Puede favorecer:

- uniformidad;
- control.

Pero puede:

- enlentecer decisiones;
- limitar participación.

---$BODY_123$, 55
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'descentralizaci_n_55', 'Descentralización', $BODY_124$Distribuye decisiones hacia niveles inferiores.

Puede favorecer:

- rapidez;
- autonomía;
- adaptación local.

Requiere:

- competencias;
- responsabilidad;
- información.

---$BODY_124$, 56
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'span_of_control_amplitud_de_control_56', 'Span of control / amplitud de control', $BODY_125$Se refiere al número de personas o unidades bajo supervisión directa de un jefe.

Una amplitud muy grande puede dificultar:

- seguimiento;
- comunicación;
- supervisión.

Una muy estrecha puede generar exceso de niveles jerárquicos.

---$BODY_125$, 57
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'autoridad_formal_e_influencia_57', 'Autoridad formal e influencia', $BODY_126$**Autoridad formal**
- proviene del cargo.

**Influencia**
- puede provenir de experiencia, confianza, conocimiento o liderazgo.

Una enfermera sin cargo directivo puede ejercer fuerte liderazgo clínico.

---$BODY_126$, 58
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'administraci_n_y_liderazgo_58', 'Administración y liderazgo', $BODY_127$NCBI/Open RN diferencia:

**Management**
- planificación;
- organización;
- presupuesto;
- dotación;
- coordinación;
- resolución de problemas.

**Leadership**
- dirección;
- influencia;
- motivación;
- cambio.

Se superponen, pero no son idénticos.

---$BODY_127$, 59
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'enfermera_gestora_59', 'Enfermera gestora', $BODY_128$Una enfermera gestora puede:

- organizar turnos;
- asignar recursos;
- supervisar;
- controlar indicadores;
- resolver problemas;
- gestionar conflictos;
- apoyar calidad.

Estas actividades combinan teoría administrativa y liderazgo.

---$BODY_128$, 60
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'aplicaci_n_de_taylor_en_enfermer_a_60', 'Aplicación de Taylor en enfermería', $BODY_129$Ejemplos:

- tiempos de proceso;
- estandarización de procedimientos;
- análisis de flujo;
- reducción de pasos innecesarios.

Riesgo:

convertir la atención en una secuencia rígida sin considerar necesidades individuales.

---$BODY_129$, 61
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'aplicaci_n_de_fayol_en_enfermer_a_61', 'Aplicación de Fayol en enfermería', $BODY_130$Ejemplos:

- planificación del servicio;
- estructura;
- autoridad;
- coordinación;
- control de calidad.

Su influencia se observa directamente en funciones administrativas modernas.

---$BODY_130$, 62
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'aplicaci_n_de_relaciones_humanas_62', 'Aplicación de relaciones humanas', $BODY_131$Ejemplos:

- reuniones de equipo;
- escucha;
- reconocimiento;
- clima laboral;
- resolución de conflictos;
- participación.

Un equipo técnicamente competente puede rendir mal si existe un entorno laboral disfuncional.

---$BODY_131$, 63
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'aplicaci_n_neocl_sica_63', 'Aplicación neoclásica', $BODY_132$Ejemplos:

- objetivos;
- indicadores;
- evaluación;
- resultados;
- delegación;
- estructura flexible.

Se busca combinar principios administrativos con necesidades reales de la organización.

---$BODY_132$, 64
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'no_existe_una_teor_a_universal_perfecta_64', 'No existe una teoría universal perfecta', $BODY_133$Un hospital es:

- técnico;
- humano;
- regulado;
- complejo;
- cambiante.

Por eso la gestión actual utiliza múltiples enfoques.

---$BODY_133$, 65
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'mapa_de_autores_65', 'Mapa de autores', $BODY_134$```text
FAYOL
→ organización completa
→ funciones
→ principios

TAYLOR
→ tarea
→ método
→ eficiencia

GANTT
→ cronograma
→ seguimiento

GILBRETH
→ movimientos
→ simplificación

MAYO
→ relaciones humanas
→ factores sociales

McGREGOR
→ Teoría X / Teoría Y
→ supuestos gerenciales
```

---$BODY_134$, 66
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_examen_66', 'Errores frecuentes de examen', $BODY_135$1. Confundir Taylor con Fayol.
2. Decir que Fayol creó el diagrama de Gantt.
3. Asociar Gilbreth con Teoría X/Y.
4. Considerar Hawthorne una demostración simple sobre iluminación.
5. Decir que McGregor clasificó personas definitivamente en X o Y.
6. Confundir eficiencia con eficacia.
7. Suponer que división del trabajo elimina necesidad de coordinación.
8. Confundir unidad de mando con unidad de dirección.
9. Creer que centralización siempre es mejor.
10. Confundir autoridad formal con liderazgo.
11. Pensar que relaciones humanas elimina necesidad de estructura.
12. Considerar que una teoría histórica debe aplicarse literalmente.

---$BODY_135$, 67
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estrategia_de_respuesta_cicde_67', 'Estrategia de respuesta CICDE', $BODY_136$Ante una pregunta:

### Si habla de…
- **tiempos/métodos/eficiencia** → Taylor.
- **movimientos** → Gilbreth.
- **cronogramas** → Gantt.
- **funciones/principios/organización global** → Fayol.
- **grupo/motivación/relaciones** → Mayo.
- **supuestos sobre trabajadores** → McGregor.
- **objetivos/resultados** → neoclásico/APO.
- **agrupar unidades** → departamentalización.

---$BODY_136$, 68
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'situaciones_originales_tipo_examen_68', 'Situaciones originales tipo examen', $BODY_137$## Caso 1 — Taylor
Una jefa estudia cuánto tarda cada paso de un proceso para reducir demoras.

**Respuesta:** administración científica/Taylor.

---

## Caso 2 — Fayol
El director revisa planificación, organización, dirección y control.

**Respuesta:** enfoque administrativo asociado a Fayol.

---

## Caso 3 — Gantt
Se necesita visualizar actividades de un proyecto durante seis meses.

**Respuesta:** diagrama de Gantt.

---

## Caso 4 — Gilbreth
Se reorganiza un puesto para eliminar movimientos innecesarios.

**Respuesta:** estudios de movimientos, asociados a Gilbreth.

---

## Caso 5 — Mayo
Una unidad tiene alta rotación pese a salario adecuado; se estudia clima y relaciones.

**Respuesta:** enfoque de relaciones humanas.

---

## Caso 6 — McGregor X
Supervisor cree que el personal evitará trabajar si no se controla permanentemente.

**Respuesta:** supuesto compatible con Teoría X.

---

## Caso 7 — McGregor Y
Jefa permite participación y confía en responsabilidad profesional.

**Respuesta:** supuesto compatible con Teoría Y.

---

## Caso 8 — Unidad de mando
Una enfermera recibe órdenes incompatibles de dos supervisores.

**Respuesta:** existe conflicto con el principio de unidad de mando.

---

## Caso 9 — Unidad de dirección
Dos equipos trabajan el mismo programa con objetivos contradictorios.

**Respuesta:** falta coordinación bajo una dirección/plan común.

---

## Caso 10 — Eficiencia
Un servicio usa menos recursos, pero no logra el resultado clínico esperado.

**Respuesta:** puede haber eficiencia operativa sin eficacia suficiente.

---

## Caso 11 — Departamentalización funcional
Hospital organiza áreas en Enfermería, Farmacia, Laboratorio y Finanzas.

**Respuesta:** departamentalización funcional.

---

## Caso 12 — Departamentalización por paciente
Hospital divide unidades en Pediatría, Adultos y Maternidad.

**Respuesta:** agrupación por tipo de paciente/servicio.

---

## Caso 13 — Centralización
Toda decisión requiere autorización de la dirección general.

**Respuesta:** alto grado de centralización.

---

## Caso 14 — Descentralización
Jefaturas locales pueden adaptar ciertos procesos dentro de políticas generales.

**Respuesta:** descentralización controlada.

---

## Caso 15 — Liderazgo vs administración
Una enfermera sin cargo inspira al equipo para adoptar una práctica basada en evidencia.

**Respuesta:** ejerce liderazgo aunque no tenga autoridad administrativa formal.

---

## Caso 16 — Resultado
Una unidad fija una meta mensurable y evalúa periódicamente si se alcanza.

**Respuesta:** orientación por objetivos/resultados compatible con enfoque neoclásico.

---$BODY_137$, 69
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preguntas_r_pidas_69', 'Preguntas rápidas', $BODY_138$**1. ¿Quién se asocia con administración científica?**  
Taylor.

**2. ¿Quién se asocia con teoría clásica/administrativa?**  
Fayol.

**3. ¿Quién se asocia con estudios de movimientos?**  
Gilbreth.

**4. ¿Quién desarrolló la gráfica de Gantt?**  
Henry Gantt.

**5. ¿Quién se asocia con relaciones humanas?**  
Elton Mayo.

**6. ¿Quién desarrolló Teoría X y Y?**  
Douglas McGregor.

**7. ¿Qué es departamentalización?**  
Agrupar actividades y puestos mediante un criterio organizativo.

**8. ¿Qué es eficacia?**  
Lograr el objetivo.

**9. ¿Qué es eficiencia?**  
Usar adecuadamente los recursos para lograrlo.

**10. ¿Liderazgo y administración son idénticos?**  
No. Se superponen, pero cumplen funciones distintas.

---$BODY_138$, 70
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fuentes_y_validaci_n_70', 'Fuentes y validación', $BODY_139$## Fuente rectora CICDE

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** _Lineamientos para el Examen por Competencia de Profesionales de Enfermería_. Tercera edición, Panamá, 2026.

## Bibliografía principal CICDE

2. **Balderas Pedrero, María de la Luz.** _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015. ISBN 9786071512413.  
   https://www.mheducation.com.mx/administracion-de-los-servicios-de-enfermeria-9786071512413-latam-group

   La tabla de contenidos oficial confirma que el capítulo 2 incluye: paradigma clásico, Fayol, Taylor, seguidores, Gantt, Gilbreth, Elton Mayo, Douglas McGregor, período neoclásico, teóricos sobresalientes, influencia del modelo neoclásico y tipos de departamentalización.

## Historia y teoría administrativa complementaria

3. **OpenStax. Principles of Management — The History of Management.**  
   https://openstax.org/books/principles-management/pages/3-introduction

4. **OpenStax. Taylor-Made Management.**  
   https://openstax.org/books/principles-management/pages/3-4-taylor-made-management

5. **OpenStax. Administrative and Bureaucratic Management.**  
   https://openstax.org/books/principles-management/pages/3-5-administrative-and-bureaucratic-management

6. **OpenStax. Human Relations Movement.**  
   https://openstax.org/books/principles-management/pages/3-6-human-relations-movement

## Aplicación a enfermería

7. **Open RN / NCBI Bookshelf. Nursing Management and Professional Concepts, 2nd edition (2024), Chapter 4: Leadership and Management.**  
   https://www.ncbi.nlm.nih.gov/books/NBK610440/

   Se utiliza para distinguir gestión de liderazgo y para relacionar planificación, organización, dotación, coordinación, influencia y motivación con el trabajo de enfermería.

---$BODY_139$, 71
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_de_calidad_71', 'Control de calidad', $BODY_140$- Alcance cotejado contra CICDE 2026.
- CICDE no define subtemas explícitos para ADMIN-02.
- Expansión guiada por el índice oficial de Balderas 7.ª edición.
- Fayol y Taylor diferenciados.
- Gantt y Gilbreth diferenciados.
- Mayo/Hawthorne presentados sin simplificaciones históricas.
- Teoría X/Y presentada como supuestos gerenciales, no como clasificación rígida de personas.
- Período neoclásico y departamentalización incluidos.
- Eficacia y eficiencia diferenciadas.
- Aplicación a enfermería añadida con fuente abierta contemporánea.
- No se reproduce texto protegido de Balderas.
- Situaciones de examen originales.
- No se declara revisión humana inexistente.

---$BODY_140$, 72
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estado_para_integraci_n_72', 'Estado para integración', $BODY_141$**Estado:** `REVIEW`

Motivo:

- contenido y fuentes fueron sometidos a validación documental/académica;
- no existe revisor humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` por revisión de IA.

**Cobertura CICDE ADMIN-02: tema principal cubierto según el alcance disponible y el capítulo de referencia señalado por CICDE.**

**Situaciones originales tipo examen: 16.**$BODY_141$, 73
FROM admin_lesson_map WHERE topic_code = 'ADMIN-02';

-- ADMIN-03: Administración contemporánea (93 sections)

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'alcance_oficial_cicde_0', 'Alcance oficial CICDE', $BODY_142$El temario CICDE 2026 incluye como tercer tema del área de Administración:

> **3. Administración contemporánea**

CICDE no enumera subtemas explícitos para ADMIN-03. Para desarrollar el alcance sin inventar una estructura ajena, este material sigue el **Capítulo 3: Administración contemporánea** de la bibliografía principal recomendada por CICDE:

**Balderas Pedrero, María de la Luz. _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015.**

La tabla de contenidos oficial de McGraw-Hill incluye en este capítulo:

- enfoque global de la administración;
- enfoque estructuralista;
- modelo burocrático de organización;
- enfoque del comportamiento;
- teoría y desarrollo organizacional;
- concepto y características del desarrollo organizacional;
- enfoque de sistemas;
- concepto de sistema;
- enfoque de la toma de decisiones;
- enfoque de contingencias;
- enfoque de calidad;
- escuela asiática y calidad;
- actitudes de las personas en las organizaciones;
- administración de calidad;
- evolución de la empresa;
- historia del control de calidad total;
- globalización;
- desarrollo sustentable;
- pioneros de la calidad;
- Peter Drucker;
- W. Edwards Deming;
- Walter A. Shewhart;
- Joseph M. Juran;
- Kaoru Ishikawa;
- Philip Crosby;
- Michael Hammer y James Champy;
- administración del conocimiento;
- organizaciones federales;
- teoría del trébol;
- reingeniería;
- gerencia de procesos.

Este paquete desarrolla esos ejes en lenguaje propio y con aplicación a enfermería.

---$BODY_142$, 1
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_de_aprendizaje_1', 'Objetivos de aprendizaje', $BODY_143$Al finalizar el tema, el estudiante debe poder:

1. Explicar qué caracteriza a la administración contemporánea.
2. Diferenciar los enfoques estructuralista, conductual, de sistemas, decisiones, contingencias y calidad.
3. Describir una organización como sistema abierto.
4. Explicar entradas, procesos, salidas, retroalimentación y entorno.
5. Distinguir estructura formal de comportamiento organizacional.
6. Comprender el desarrollo organizacional como proceso planificado de cambio.
7. Aplicar principios de toma de decisiones en enfermería.
8. Explicar por qué el enfoque de contingencia rechaza una única solución universal.
9. Diferenciar control de calidad, aseguramiento y mejora de la calidad.
10. Reconocer los aportes de Deming, Shewhart, Juran, Ishikawa y Crosby.
11. Explicar la contribución de Drucker a la gestión moderna.
12. Describir globalización y desarrollo sustentable en relación con servicios de salud.
13. Comprender reingeniería y gestión por procesos.
14. Aplicar pensamiento sistémico a problemas de enfermería.
15. Resolver situaciones tipo CICDE sobre administración contemporánea.

---$BODY_143$, 2
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, '_qu_significa_administraci_n_contempor_nea__2', '¿Qué significa administración contemporánea?', $BODY_144$La administración contemporánea integra múltiples escuelas y reconoce que las organizaciones son:

- complejas;
- abiertas;
- dinámicas;
- humanas;
- tecnológicas;
- interdependientes;
- influenciadas por el entorno.

No busca una sola “mejor manera” de administrar en todas las situaciones.

---$BODY_144$, 3
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'del_enfoque_cl_sico_al_contempor_neo_3', 'Del enfoque clásico al contemporáneo', $BODY_145$La evolución puede resumirse así:

```text
Tarea y eficiencia
      ↓
Estructura y autoridad
      ↓
Relaciones humanas
      ↓
Comportamiento organizacional
      ↓
Sistemas
      ↓
Contingencias
      ↓
Calidad
      ↓
Procesos, conocimiento y mejora continua
```

Los enfoques nuevos no eliminan necesariamente a los anteriores; los integran o limitan según el contexto.

---$BODY_145$, 4
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'enfoque_global_de_la_administraci_n_4', 'Enfoque global de la administración', $BODY_146$El enfoque global analiza la organización como un todo.

Considera simultáneamente:

- personas;
- estructura;
- tecnología;
- procesos;
- ambiente;
- información;
- resultados.

Un problema en una parte puede producir consecuencias en otras.

---$BODY_146$, 5
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'complejidad_organizacional_5', 'Complejidad organizacional', $BODY_147$Una institución de salud combina:

- múltiples profesiones;
- alta regulación;
- riesgo clínico;
- tecnología;
- recursos limitados;
- necesidades humanas;
- urgencias;
- información sensible.

Por ello, la gestión no puede reducirse únicamente a jerarquía o productividad.

---$BODY_147$, 6
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'enfoque_estructuralista_6', 'Enfoque estructuralista', $BODY_148$El enfoque estructuralista estudia la organización considerando:

- estructura formal;
- relaciones informales;
- autoridad;
- poder;
- conflicto;
- objetivos;
- ambiente.

Intenta superar una visión excesivamente rígida de la organización.

---$BODY_148$, 7
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_formal_e_informal_7', 'Organización formal e informal', $BODY_149$**Formal**
- cargos;
- normas;
- organigrama;
- autoridad;
- procedimientos.

**Informal**
- relaciones espontáneas;
- afinidades;
- líderes no oficiales;
- redes de comunicación.

Ambas coexisten.

---$BODY_149$, 8
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'conflicto_organizacional_8', 'Conflicto organizacional', $BODY_150$El conflicto puede surgir por:

- recursos;
- funciones;
- prioridades;
- valores;
- comunicación;
- poder;
- cambios.

No todo conflicto es negativo.

Puede revelar problemas reales y conducir a mejoras si se maneja adecuadamente.

---$BODY_150$, 9
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'modelo_burocr_tico_9', 'Modelo burocrático', $BODY_151$El modelo burocrático se relaciona históricamente con Max Weber.

Sus características incluyen:

- reglas;
- funciones definidas;
- jerarquía;
- especialización;
- autoridad racional-legal;
- procedimientos;
- documentación.

---$BODY_151$, 10
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ventajas_del_modelo_burocr_tico_10', 'Ventajas del modelo burocrático', $BODY_152$Puede favorecer:

- consistencia;
- previsibilidad;
- trazabilidad;
- responsabilidad;
- estandarización.

En salud, los protocolos y registros pueden proteger al paciente cuando se utilizan correctamente.

---$BODY_152$, 11
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'riesgos_de_la_burocracia_11', 'Riesgos de la burocracia', $BODY_153$Puede producir:

- rigidez;
- lentitud;
- exceso de trámites;
- fragmentación;
- pérdida de enfoque en la persona.

La gestión contemporánea busca conservar estructura sin convertirla en un fin en sí misma.

---$BODY_153$, 12
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'enfoque_del_comportamiento_12', 'Enfoque del comportamiento', $BODY_154$Se interesa en comprender:

- motivación;
- percepción;
- actitudes;
- liderazgo;
- grupos;
- comunicación;
- toma de decisiones.

La organización funciona a través de personas, no únicamente mediante normas.

---$BODY_154$, 13
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'conducta_individual_13', 'Conducta individual', $BODY_155$Puede estar influida por:

- personalidad;
- experiencia;
- valores;
- motivación;
- aprendizaje;
- estrés;
- ambiente;
- percepción de justicia.

Dos personas pueden responder de manera diferente a la misma situación.

---$BODY_155$, 14
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'conducta_grupal_14', 'Conducta grupal', $BODY_156$Los equipos desarrollan:

- normas;
- roles;
- cohesión;
- liderazgo;
- conflictos;
- expectativas.

Un grupo formal puede tener dinámicas informales que cambian su desempeño.

---$BODY_156$, 15
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'motivaci_n_contempor_nea_15', 'Motivación contemporánea', $BODY_157$La motivación no depende de una única variable.

Puede relacionarse con:

- propósito;
- autonomía;
- reconocimiento;
- justicia;
- oportunidades;
- seguridad;
- relaciones;
- condiciones de trabajo.

El salario es importante, pero no explica todo el comportamiento organizacional.

---$BODY_157$, 16
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'desarrollo_organizacional_do__16', 'Desarrollo Organizacional (DO)', $BODY_158$El desarrollo organizacional es un proceso planificado de cambio dirigido a mejorar:

- funcionamiento;
- adaptación;
- cultura;
- relaciones;
- capacidad de resolver problemas.

No consiste simplemente en impartir un curso.

---$BODY_158$, 17
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'caracter_sticas_del_do_17', 'Características del DO', $BODY_159$Suele incluir:

- diagnóstico;
- participación;
- cambio planificado;
- intervención;
- evaluación;
- aprendizaje;
- trabajo en equipo;
- perspectiva sistémica.

---$BODY_159$, 18
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cultura_organizacional_18', 'Cultura organizacional', $BODY_160$La cultura incluye:

- valores compartidos;
- normas;
- hábitos;
- símbolos;
- formas de comunicación;
- expectativas.

Puede apoyar o sabotear una política formal.

---$BODY_160$, 19
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cambio_organizacional_19', 'Cambio organizacional', $BODY_161$Las razones para cambiar pueden incluir:

- nueva evidencia;
- tecnología;
- normativa;
- eventos adversos;
- expectativas sociales;
- costos;
- crisis;
- necesidades del paciente.

---$BODY_161$, 20
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'resistencia_al_cambio_20', 'Resistencia al cambio', $BODY_162$Puede aparecer por:

- miedo;
- incertidumbre;
- pérdida de control;
- experiencias previas;
- falta de información;
- sobrecarga;
- percepción de injusticia.

La resistencia no debe interpretarse automáticamente como mala actitud.

---$BODY_162$, 21
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'manejo_del_cambio_21', 'Manejo del cambio', $BODY_163$Estrategias útiles:

- comunicar el propósito;
- involucrar al personal;
- capacitar;
- escuchar barreras;
- proporcionar recursos;
- implementar por etapas;
- medir;
- ajustar.

---$BODY_163$, 22
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'enfoque_de_sistemas_22', 'Enfoque de sistemas', $BODY_164$La teoría de sistemas ve la organización como un conjunto de elementos interrelacionados.

OpenStax describe a las organizaciones como **sistemas abiertos** que intercambian recursos e información con su entorno.

---$BODY_164$, 23
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'concepto_de_sistema_23', 'Concepto de sistema', $BODY_165$Un sistema incluye:

- elementos;
- relaciones;
- propósito;
- límites;
- ambiente;
- entradas;
- procesos;
- salidas;
- retroalimentación.

---$BODY_165$, 24
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'entradas_proceso_y_salidas_24', 'Entradas, proceso y salidas', $BODY_166$Ejemplo hospitalario:

**Entradas**
- personal;
- pacientes;
- información;
- medicamentos;
- equipos.

**Proceso**
- valoración;
- diagnóstico;
- cuidado;
- coordinación;
- tratamiento.

**Salidas**
- resultados clínicos;
- experiencia;
- altas;
- indicadores;
- costos.

---$BODY_166$, 25
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'retroalimentaci_n_25', 'Retroalimentación', $BODY_167$La retroalimentación permite comparar resultados con objetivos.

Ejemplos:

- tasa de caídas;
- infecciones;
- errores de medicación;
- satisfacción;
- reingresos.

Sin retroalimentación, el sistema aprende menos.

---$BODY_167$, 26
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'sistema_abierto_26', 'Sistema abierto', $BODY_168$Una organización abierta recibe influencia de:

- legislación;
- economía;
- tecnología;
- población;
- cultura;
- proveedores;
- profesionales;
- políticas sanitarias.

Un hospital no opera aislado de su entorno.

---$BODY_168$, 27
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'subsistemas_27', 'Subsistemas', $BODY_169$Dentro de un hospital existen subsistemas:

- enfermería;
- farmacia;
- laboratorio;
- informática;
- finanzas;
- recursos humanos.

Una decisión local puede afectar otros subsistemas.

---$BODY_169$, 28
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'interdependencia_28', 'Interdependencia', $BODY_170$Ejemplo:

falta de insumos en farmacia puede producir:

- retrasos;
- mayor tiempo de enfermería;
- cambios en tratamiento;
- insatisfacción;
- riesgo clínico.

Este es pensamiento sistémico.

---$BODY_170$, 29
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'enfoque_de_toma_de_decisiones_29', 'Enfoque de toma de decisiones', $BODY_171$Administrar implica elegir entre alternativas.

El proceso racional básico incluye:

1. definir problema;
2. reunir información;
3. identificar alternativas;
4. comparar consecuencias;
5. seleccionar;
6. ejecutar;
7. evaluar.

---$BODY_171$, 30
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'problema_vs_s_ntoma_30', 'Problema vs síntoma', $BODY_172$Ejemplo:

**Síntoma:** retrasos frecuentes en administración de medicamentos.

Posibles problemas:
- dotación;
- flujo;
- farmacia;
- tecnología;
- interrupciones;
- capacitación.

Corregir solo el síntoma puede no resolver la causa.

---$BODY_172$, 31
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'decisiones_programadas_31', 'Decisiones programadas', $BODY_173$Son decisiones repetitivas con:

- reglas;
- procedimientos;
- criterios establecidos.

Ejemplo:
proceso rutinario de solicitud de insumos.

---$BODY_173$, 32
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'decisiones_no_programadas_32', 'Decisiones no programadas', $BODY_174$Son nuevas, complejas o poco estructuradas.

Ejemplo:
reorganizar una unidad durante una emergencia.

Requieren más juicio y análisis.

---$BODY_174$, 33
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informaci_n_y_decisi_n_33', 'Información y decisión', $BODY_175$Una buena decisión necesita información:

- suficiente;
- relevante;
- oportuna;
- confiable.

Más información no siempre significa mejor decisión si llega tarde o es irrelevante.

---$BODY_175$, 34
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'sesgos_en_decisiones_34', 'Sesgos en decisiones', $BODY_176$Pueden incluir:

- confirmación;
- exceso de confianza;
- anclaje;
- disponibilidad;
- presión de grupo.

La gestión contemporánea intenta reducirlos mediante datos, participación y revisión crítica.

---$BODY_176$, 35
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'decisi_n_basada_en_evidencia_35', 'Decisión basada en evidencia', $BODY_177$Combina:

- investigación;
- datos locales;
- experiencia;
- contexto;
- necesidades de las personas.

No significa aplicar automáticamente un estudio sin considerar la situación local.

---$BODY_177$, 36
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'enfoque_de_contingencias_36', 'Enfoque de contingencias', $BODY_178$El principio central es:

> **la mejor respuesta depende de la situación.**

OpenStax señala que la escuela de contingencias rechazó la idea de reglas universales para toda organización.

---$BODY_178$, 37
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'variables_de_contingencia_37', 'Variables de contingencia', $BODY_179$Pueden incluir:

- tamaño;
- tecnología;
- entorno;
- riesgo;
- urgencia;
- competencias;
- recursos;
- cultura.

---$BODY_179$, 38
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ejemplo_de_contingencia_en_enfermer_a_38', 'Ejemplo de contingencia en enfermería', $BODY_180$Un estilo participativo puede funcionar bien en:

- mejora de procesos;
- planificación;
- proyectos.

En una emergencia inmediata puede requerirse una dirección más rápida y clara.

La situación modifica la respuesta apropiada.

---$BODY_180$, 39
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'contingencia_no_significa_improvisaci_n_39', 'Contingencia no significa improvisación', $BODY_181$Significa:

- analizar condiciones;
- adaptar;
- decidir con criterio.

No significa administrar sin normas ni planificación.

---$BODY_181$, 40
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'enfoque_de_calidad_40', 'Enfoque de calidad', $BODY_182$La calidad busca que los servicios alcancen resultados deseados de forma consistente y segura.

La OMS define servicios de calidad como:

- efectivos;
- seguros;
- centrados en las personas;
- oportunos;
- equitativos;
- integrados;
- eficientes.

---$BODY_182$, 41
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_aseguramiento_y_mejora_41', 'Control, aseguramiento y mejora', $BODY_183$**Control de calidad**
- detecta si se cumplen requisitos.

**Aseguramiento**
- crea procesos para asegurar cumplimiento.

**Mejora de calidad**
- modifica procesos de forma continua para obtener mejores resultados.

---$BODY_183$, 42
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estructura_proceso_y_resultado_42', 'Estructura, proceso y resultado', $BODY_184$Modelo de Donabedian:

**Estructura**
- instalaciones;
- personal;
- equipos.

**Proceso**
- cómo se brinda la atención.

**Resultado**
- efecto sobre salud y experiencia.

La OMS utiliza esta estructura dentro de su toolkit de calidad.

---$BODY_184$, 43
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'mejora_continua_43', 'Mejora continua', $BODY_185$Implica:

1. identificar problema;
2. medir;
3. cambiar;
4. evaluar;
5. aprender;
6. repetir.

La calidad no es una actividad de una sola vez.

---$BODY_185$, 44
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'walter_a_shewhart_44', 'Walter A. Shewhart', $BODY_186$Se asocia con:

- control estadístico de procesos;
- variación;
- mejora basada en datos.

Su trabajo fue fundamental para la disciplina de calidad.

---$BODY_186$, 45
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'w_edwards_deming_45', 'W. Edwards Deming', $BODY_187$Deming enfatizó:

- mejora del sistema;
- liderazgo;
- reducción de variación;
- aprendizaje;
- calidad como responsabilidad de la organización.

No debe reducirse a “inspeccionar más”.

---$BODY_187$, 46
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ciclo_pdsa_46', 'Ciclo PDSA', $BODY_188$Relacionado con la tradición Shewhart-Deming:

- Plan;
- Do;
- Study;
- Act.

Se utiliza para probar cambios y aprender de resultados.

---$BODY_188$, 47
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'joseph_m_juran_47', 'Joseph M. Juran', $BODY_189$Juran se relaciona con:

- planificación de la calidad;
- control de la calidad;
- mejora de la calidad.

Esta combinación suele denominarse **Trilogía de Juran**.

---$BODY_189$, 48
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'kaoru_ishikawa_48', 'Kaoru Ishikawa', $BODY_190$Se asocia con:

- círculos de calidad;
- participación;
- análisis causa-efecto.

El diagrama de causa-efecto ayuda a organizar posibles causas de un problema.

---$BODY_190$, 49
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'diagrama_de_ishikawa_49', 'Diagrama de Ishikawa', $BODY_191$Categoriza causas potenciales.

En un problema clínico puede analizar:

- personas;
- procesos;
- materiales;
- equipos;
- ambiente;
- métodos.

No demuestra causalidad por sí solo.

---$BODY_191$, 50
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'philip_crosby_50', 'Philip Crosby', $BODY_192$Se relaciona con:

- prevención;
- conformidad con requisitos;
- concepto de cero defectos.

La idea central es evitar errores en lugar de depender únicamente de detectarlos después.

---$BODY_192$, 51
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'calidad_autores_clave_51', 'Calidad: autores clave', $BODY_193$| Autor | Asociación principal |
|---|---|
| Shewhart | Variación y control estadístico |
| Deming | Mejora del sistema |
| Juran | Planificación, control y mejora |
| Ishikawa | Causa-efecto y círculos de calidad |
| Crosby | Prevención / cero defectos |

---$BODY_193$, 52
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'peter_drucker_52', 'Peter Drucker', $BODY_194$Drucker influyó en la administración moderna mediante ideas sobre:

- objetivos;
- responsabilidad;
- conocimiento;
- descentralización;
- gestión.

Balderas lo incluye entre los pioneros del enfoque contemporáneo de calidad/gestión.

---$BODY_194$, 53
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'trabajador_del_conocimiento_53', 'Trabajador del conocimiento', $BODY_195$En organizaciones modernas el valor depende cada vez más de:

- conocimiento;
- juicio;
- información;
- aprendizaje.

La enfermería es un ejemplo claro de trabajo intensivo en conocimiento.

---$BODY_195$, 54
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'administraci_n_del_conocimiento_54', 'Administración del conocimiento', $BODY_196$Busca:

- crear;
- compartir;
- conservar;
- aplicar conocimiento.

Herramientas:

- protocolos;
- capacitación;
- bases de conocimiento;
- reuniones;
- revisión de casos;
- sistemas de información.

---$BODY_196$, 55
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'riesgo_del_conocimiento_aislado_55', 'Riesgo del conocimiento aislado', $BODY_197$Si el conocimiento depende de una sola persona:

- se pierde cuando se retira;
- aumenta variabilidad;
- dificulta continuidad.

La organización debe transformar conocimiento individual en aprendizaje colectivo.

---$BODY_197$, 56
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'escuela_asi_tica_y_gesti_n_de_calidad_56', 'Escuela asiática y gestión de calidad', $BODY_198$El desarrollo de calidad en Japón integró:

- estadística;
- participación;
- mejora continua;
- prevención;
- trabajo en equipo.

Autores como Deming, Juran e Ishikawa tuvieron gran influencia.

---$BODY_198$, 57
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'calidad_total_57', 'Calidad total', $BODY_199$La gestión de calidad total busca que la calidad sea responsabilidad de:

- dirección;
- personal;
- procesos;
- proveedores;
- toda la organización.

No corresponde solamente a un “departamento de calidad”.

---$BODY_199$, 58
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'orientaci_n_al_usuario_58', 'Orientación al usuario', $BODY_200$En servicios de salud, calidad debe considerar:

- necesidad clínica;
- seguridad;
- experiencia;
- dignidad;
- oportunidad;
- continuidad.

El usuario no es simplemente un consumidor comercial.

---$BODY_200$, 59
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'globalizaci_n_59', 'Globalización', $BODY_201$La globalización aumenta:

- intercambio de conocimiento;
- movilidad;
- competencia;
- estándares;
- dependencia entre sistemas;
- difusión tecnológica.

También puede ampliar desigualdades.

---$BODY_201$, 60
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'globalizaci_n_en_salud_60', 'Globalización en salud', $BODY_202$Ejemplos:

- guías internacionales;
- pandemias;
- cadenas de suministro;
- migración de profesionales;
- telemedicina;
- información global.

La administración sanitaria debe considerar fenómenos que trascienden fronteras.

---$BODY_202$, 61
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'desarrollo_sustentable_61', 'Desarrollo sustentable', $BODY_203$Busca satisfacer necesidades presentes sin comprometer las futuras.

En administración puede involucrar:

- uso responsable de recursos;
- eficiencia energética;
- reducción de desperdicio;
- compras sostenibles;
- resiliencia.

---$BODY_203$, 62
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'sustentabilidad_en_servicios_de_salud_62', 'Sustentabilidad en servicios de salud', $BODY_204$Ejemplos:

- manejo racional de insumos;
- reducción de residuos;
- eficiencia energética;
- compras responsables;
- continuidad ante eventos climáticos.

La sustentabilidad no debe comprometer seguridad del paciente.

---$BODY_204$, 63
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'triple_perspectiva_de_sustentabilidad_63', 'Triple perspectiva de sustentabilidad', $BODY_205$Puede analizarse desde:

- dimensión social;
- dimensión ambiental;
- dimensión económica.

Una organización sostenible debe equilibrar estas dimensiones.

---$BODY_205$, 64
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'reingenier_a_64', 'Reingeniería', $BODY_206$Hammer y Champy popularizaron la reingeniería de procesos.

Consiste en rediseñar de manera profunda procesos importantes cuando pequeñas mejoras no son suficientes.

---$BODY_206$, 65
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'reingenier_a_vs_mejora_continua_65', 'Reingeniería vs mejora continua', $BODY_207$**Mejora continua**
- cambios pequeños y repetidos.

**Reingeniería**
- rediseño más radical.

No todo problema requiere reingeniería.

---$BODY_207$, 66
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'riesgos_de_la_reingenier_a_66', 'Riesgos de la reingeniería', $BODY_208$Puede fracasar si:

- se centra solo en costos;
- ignora personas;
- no entiende el proceso;
- carece de liderazgo;
- implementa cambios sin medir riesgos.

En salud, ningún rediseño debe sacrificar seguridad.

---$BODY_208$, 67
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'gerencia_de_procesos_67', 'Gerencia de procesos', $BODY_209$Un proceso transforma entradas en resultados.

La gestión por procesos pregunta:

- ¿quién recibe el resultado?
- ¿qué pasos agregan valor?
- ¿dónde hay retrasos?
- ¿dónde ocurren errores?
- ¿cómo medir?

---$BODY_209$, 68
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'proceso_cl_nico_68', 'Proceso clínico', $BODY_210$Ejemplo:

```text
Ingreso
  ↓
Valoración
  ↓
Plan
  ↓
Intervención
  ↓
Evaluación
  ↓
Alta/seguimiento
```

Cada transición puede generar riesgos si existe mala comunicación.

---$BODY_210$, 69
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'mapeo_de_procesos_69', 'Mapeo de procesos', $BODY_211$Permite visualizar:

- secuencia;
- decisiones;
- responsables;
- esperas;
- duplicaciones.

Ayuda a identificar oportunidades de mejora.

---$BODY_211$, 70
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cuello_de_botella_70', 'Cuello de botella', $BODY_212$Es un punto que limita el rendimiento del proceso.

Ejemplo:

si laboratorio tarda demasiado, puede retrasar:

- diagnóstico;
- medicación;
- alta;
- flujo de camas.

---$BODY_212$, 71
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'valor_agregado_71', 'Valor agregado', $BODY_213$Una actividad agrega valor cuando contribuye de manera relevante al resultado.

Actividades sin valor pueden incluir:

- duplicar registros;
- buscar insumos repetidamente;
- esperar autorizaciones innecesarias.

---$BODY_213$, 72
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'indicadores_72', 'Indicadores', $BODY_214$Los indicadores convierten desempeño en información.

Pueden medir:

- estructura;
- proceso;
- resultado.

Ejemplo:
- disponibilidad de personal;
- cumplimiento de higiene de manos;
- tasa de infección.

---$BODY_214$, 73
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'indicador_no_es_objetivo_73', 'Indicador no es objetivo', $BODY_215$**Objetivo:** reducir infecciones.

**Indicador:** tasa de infecciones por unidad de exposición.

El indicador ayuda a saber si se avanza hacia el objetivo.

---$BODY_215$, 74
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'datos_para_administrar_74', 'Datos para administrar', $BODY_216$Una organización contemporánea utiliza datos para:

- decidir;
- priorizar;
- asignar recursos;
- evaluar;
- aprender.

Pero los datos deben tener contexto y calidad.

---$BODY_216$, 75
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informaci_n_y_tecnolog_a_75', 'Información y tecnología', $BODY_217$La tecnología puede mejorar:

- comunicación;
- registros;
- alertas;
- trazabilidad;
- análisis.

También introduce riesgos:

- dependencia;
- errores de configuración;
- fatiga por alertas;
- ciberseguridad.

---$BODY_217$, 76
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'innovaci_n_76', 'Innovación', $BODY_218$Innovar no significa usar tecnología por moda.

Una innovación debe:

- resolver un problema;
- aportar valor;
- ser segura;
- ser viable;
- evaluarse.

---$BODY_218$, 77
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_que_aprende_77', 'Organización que aprende', $BODY_219$Características:

- analiza errores;
- comparte conocimiento;
- adapta procesos;
- mide resultados;
- favorece aprendizaje.

El objetivo no es castigar cada falla, sino evitar su repetición sin eliminar responsabilidad.

---$BODY_219$, 78
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'seguridad_psicol_gica_78', 'Seguridad psicológica', $BODY_220$Un equipo necesita poder:

- preguntar;
- reportar riesgos;
- admitir dudas;
- señalar problemas.

Sin temor excesivo a represalias.

Esto favorece aprendizaje y seguridad.

---$BODY_220$, 79
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'pensamiento_sist_mico_en_enfermer_a_79', 'Pensamiento sistémico en enfermería', $BODY_221$Ante un error, preguntar:

- ¿qué ocurrió?
- ¿qué condiciones lo facilitaron?
- ¿qué barreras fallaron?
- ¿cómo evitar repetición?

No limitarse automáticamente a “quién tuvo la culpa”.

---$BODY_221$, 80
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ejemplo_sist_mico_medicamento_tard_o_80', 'Ejemplo sistémico: medicamento tardío', $BODY_222$Problema:

medicaciones tardías frecuentes.

Análisis sistémico:

- dotación;
- horarios;
- farmacia;
- ubicación;
- software;
- interrupciones;
- carga de trabajo;
- comunicación.

Puede requerir varias intervenciones.

---$BODY_222$, 81
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'calidad_en_servicios_de_salud_81', 'Calidad en servicios de salud', $BODY_223$La OMS señala que la calidad debe ser:

- efectiva;
- segura;
- centrada en las personas;
- oportuna;
- equitativa;
- integrada;
- eficiente.

Estos dominios son útiles para evaluar decisiones administrativas.

---$BODY_223$, 82
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'calidad_y_enfermer_a_82', 'Calidad y enfermería', $BODY_224$La gestión de enfermería influye en:

- seguridad;
- continuidad;
- experiencia;
- tiempos;
- adherencia a prácticas;
- documentación;
- resultados.

La calidad no es independiente del trabajo administrativo.

---$BODY_224$, 83
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'teor_a_vs_herramienta_83', 'Teoría vs herramienta', $BODY_225$**Teoría**
- explica cómo funciona una organización.

**Herramienta**
- ayuda a actuar o medir.

Ejemplo:
- enfoque de sistemas = perspectiva teórica;
- diagrama de Ishikawa = herramienta de análisis.

---$BODY_225$, 84
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comparaci_n_de_enfoques_84', 'Comparación de enfoques', $BODY_226$| Enfoque | Pregunta principal |
|---|---|
| Estructuralista | ¿Cómo se relacionan estructura y organización? |
| Comportamiento | ¿Cómo actúan las personas y grupos? |
| DO | ¿Cómo cambiar planificadamente? |
| Sistemas | ¿Cómo interactúan las partes y el entorno? |
| Decisiones | ¿Cómo elegir entre alternativas? |
| Contingencias | ¿Qué respuesta sirve en esta situación? |
| Calidad | ¿Cómo mejorar resultados y procesos? |
| Procesos | ¿Cómo fluye el trabajo de principio a fin? |

---$BODY_226$, 85
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_examen_85', 'Errores frecuentes de examen', $BODY_227$1. Pensar que la administración contemporánea elimina las teorías clásicas.
2. Confundir sistema abierto con organización sin reglas.
3. Tratar una causa local sin analizar interdependencias.
4. Confundir síntoma con problema.
5. Creer que contingencia significa improvisar.
6. Confundir control de calidad con mejora continua.
7. Pensar que calidad corresponde solo al departamento de calidad.
8. Confundir estructura con proceso.
9. Confundir indicador con objetivo.
10. Reducir Ishikawa al dibujo del “pez” sin análisis de causas.
11. Creer que Deming promovía únicamente inspección.
12. Usar reingeniería para cualquier problema pequeño.
13. Suponer que tecnología siempre mejora un proceso.
14. Ignorar la cultura organizacional.
15. Culpar a una persona sin analizar el sistema.

---$BODY_227$, 86
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estrategia_cicde_para_admin_03_86', 'Estrategia CICDE para ADMIN-03', $BODY_228$Si la pregunta habla de:

- **organización como conjunto interdependiente** → sistemas.
- **adaptar la solución al contexto** → contingencias.
- **personas, actitudes y grupos** → comportamiento.
- **cambio planificado** → desarrollo organizacional.
- **elección entre alternativas** → toma de decisiones.
- **variación/proceso/calidad** → enfoque de calidad.
- **causas posibles de un problema** → Ishikawa.
- **cambios pequeños repetidos** → mejora continua.
- **rediseño radical** → reingeniería.
- **flujo de principio a fin** → gerencia de procesos.

---$BODY_228$, 87
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'situaciones_originales_tipo_examen_87', 'Situaciones originales tipo examen', $BODY_229$## Caso 1 — Sistema
Farmacia cambia su horario y aumentan retrasos en administración de medicamentos.

**Respuesta:** analizar el problema como interacción entre subsistemas, no solo como falla de enfermería.

---

## Caso 2 — Contingencia
Una estrategia de liderazgo funciona en una unidad estable pero falla durante una emergencia.

**Respuesta:** enfoque de contingencia; la respuesta adecuada depende de la situación.

---

## Caso 3 — DO
Hospital realiza diagnóstico de cultura, involucra al personal, implementa cambios y evalúa resultados.

**Respuesta:** desarrollo organizacional.

---

## Caso 4 — Decisiones
Antes de reorganizar turnos, la jefa compara datos, alternativas y consecuencias.

**Respuesta:** enfoque de toma de decisiones.

---

## Caso 5 — Calidad
La unidad detecta aumento de caídas y prueba cambios pequeños, mide y ajusta.

**Respuesta:** mejora continua; puede utilizar PDSA.

---

## Caso 6 — Ishikawa
El equipo organiza causas posibles de errores por personal, equipos, proceso y ambiente.

**Respuesta:** diagrama causa-efecto de Ishikawa.

---

## Caso 7 — Donabedian
Número de enfermeras disponibles corresponde a:

**Respuesta:** estructura.

---

## Caso 8 — Donabedian
Cumplimiento del protocolo de valoración corresponde a:

**Respuesta:** proceso.

---

## Caso 9 — Donabedian
Tasa de infección posterior a intervención corresponde a:

**Respuesta:** resultado.

---

## Caso 10 — Reingeniería
Un proceso completo de alta se rediseña desde cero porque el modelo actual genera retrasos graves.

**Respuesta:** reingeniería.

---

## Caso 11 — Mejora continua
Se prueba una pequeña modificación semanal y se evalúa cada ciclo.

**Respuesta:** mejora continua.

---

## Caso 12 — Sistema abierto
Cambio en legislación obliga al hospital a modificar procedimientos.

**Respuesta:** demuestra interacción de la organización con el entorno.

---

## Caso 13 — Síntoma
Se culpa al personal por demoras sin revisar fallos del sistema de información.

**Respuesta:** el análisis es incompleto; debe investigarse la causa del problema.

---

## Caso 14 — Indicador
Una unidad desea reducir infecciones y mide la tasa mensual.

**Respuesta:** reducir infecciones es objetivo; la tasa es indicador.

---

## Caso 15 — Cultura
Existe protocolo para reportar errores, pero el personal teme represalias.

**Respuesta:** la estructura formal existe, pero la cultura dificulta su funcionamiento.

---

## Caso 16 — Drucker
Una organización busca convertir conocimiento individual en aprendizaje institucional.

**Respuesta:** se relaciona con administración del conocimiento.

---$BODY_229$, 88
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preguntas_r_pidas_88', 'Preguntas rápidas', $BODY_230$**1. ¿Qué estudia el enfoque de sistemas?**  
Las relaciones entre partes y entorno.

**2. ¿Qué afirma el enfoque de contingencia?**  
No existe una única solución universal; depende del contexto.

**3. ¿Qué es DO?**  
Cambio organizacional planificado orientado a mejorar funcionamiento y adaptación.

**4. ¿Qué diferencia control de mejora?**  
El control verifica requisitos; la mejora modifica procesos para obtener mejores resultados.

**5. ¿Qué tres elementos usa Donabedian?**  
Estructura, proceso y resultado.

**6. ¿A qué se asocia Shewhart?**  
Variación y control estadístico.

**7. ¿A qué se asocia Deming?**  
Mejora del sistema y calidad.

**8. ¿A qué se asocia Juran?**  
Planificación, control y mejora de calidad.

**9. ¿A qué se asocia Ishikawa?**  
Causa-efecto y círculos de calidad.

**10. ¿A qué se asocia Crosby?**  
Prevención y cero defectos.

**11. ¿Qué es reingeniería?**  
Rediseño profundo de procesos.

**12. ¿Qué es gerencia de procesos?**  
Administrar el flujo completo que transforma entradas en resultados.

---$BODY_230$, 89
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fuentes_y_validaci_n_89', 'Fuentes y validación', $BODY_231$## Fuente rectora CICDE

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** _Lineamientos para el Examen por Competencia de Profesionales de Enfermería_. Tercera edición. Panamá, 2026.

## Bibliografía principal indicada por CICDE

2. **Balderas Pedrero, María de la Luz.** _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015. ISBN 9786071512413.  
   https://www.mheducation.com.mx/administracion-de-los-servicios-de-enfermeria-9786071512413-latam-group

La tabla oficial de contenidos del capítulo 3 confirma el alcance utilizado en este paquete: estructuralismo, burocracia, comportamiento, desarrollo organizacional, sistemas, decisiones, contingencias, calidad, globalización, sustentabilidad, pioneros de calidad, conocimiento, reingeniería y procesos.

## Sistemas, contingencias y comportamiento

3. **OpenStax. Principles of Management — Contingency and System Management.**  
   https://openstax.org/books/principles-management/pages/3-7-contingency-and-system-management

4. **OpenStax. The Internal Organization and External Environments.**  
   https://openstax.org/books/principles-management/pages/4-4-the-internal-organization-and-external-environments

5. **OpenStax. Organizational Behavior — A Model of Organizational Behavior and Management.**  
   https://openstax.org/books/organizational-behavior/pages/1-4-a-model-of-organizational-behavior-and-management

## Calidad

6. **World Health Organization. Quality of care.**  
   https://www.who.int/health-topics/quality-of-care

7. **WHO Quality Toolkit — How to address quality of health services.**  
   https://qualityhealthservices.who.int/quality-toolkit/new-to-health-system-quality-thinking/how-to-address-quality-of-health-services

8. **WHO. Quality health services: a planning guide.** 2020.  
   https://www.who.int/publications/i/item/9789240011632

9. **American Society for Quality. Guru Guide.**  
   https://asq.org/quality-progress/articles/guru-guide?id=851d6f00e23044a58006d04e0df2df33

10. **American Society for Quality. What Is Quality?**  
    https://asq.org/quality-progress/articles/what-is-quality?id=3944a2adfd33497bb8c5a7a59acf759c

---$BODY_231$, 90
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'notas_de_interpretaci_n_90', 'Notas de interpretación', $BODY_232$## Balderas vs terminología actual

El capítulo de Balderas refleja vocabulario administrativo utilizado en 2015. Este material conserva el alcance de esa obra, pero explica los conceptos con terminología actual cuando es necesario.

## Kaoru Ishikawa

La tabla de contenidos oficial presenta el nombre como “Kaouru Ishikawa”. En este material se usa la grafía ampliamente aceptada **Kaoru Ishikawa**.

## Calidad en salud

El contenido contemporáneo de calidad se complementa con OMS para evitar tratar calidad únicamente desde el ámbito industrial. La OMS identifica siete dominios de servicios de calidad: efectivos, seguros, centrados en las personas, oportunos, equitativos, integrados y eficientes.

## Sustentabilidad

Se aborda como principio de gestión. No se convierte en una norma clínica específica.

---$BODY_232$, 91
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_de_calidad_91', 'Control de calidad', $BODY_233$- Alcance cotejado contra CICDE 2026.
- CICDE no define subtemas explícitos para ADMIN-03.
- Expansión guiada por la tabla oficial del capítulo 3 de Balderas 7.ª.
- Estructuralismo, burocracia y comportamiento diferenciados.
- Desarrollo organizacional incluido como cambio planificado.
- Enfoque de sistemas explicado con entradas, procesos, salidas y retroalimentación.
- Toma de decisiones y contingencias diferenciadas.
- Calidad complementada con marco OMS.
- Donabedian incluido como estructura/proceso/resultado.
- Shewhart, Deming, Juran, Ishikawa y Crosby diferenciados.
- Drucker y conocimiento incorporados.
- Globalización y sustentabilidad incluidos.
- Reingeniería diferenciada de mejora continua.
- Gerencia de procesos incluida.
- 16 situaciones tipo examen originales.
- No se reproduce texto protegido de Balderas.
- No se declara revisión humana inexistente.

---$BODY_233$, 92
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estado_para_integraci_n_92', 'Estado para integración', $BODY_234$**Estado:** `REVIEW`

Motivo:

- alcance y contenido fueron sometidos a validación documental/académica;
- no existe todavía revisor humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` por revisión de IA.

**Cobertura CICDE ADMIN-03: tema principal cubierto según el alcance disponible y el capítulo de referencia señalado por CICDE.**

**Situaciones originales tipo examen: 16.**$BODY_234$, 93
FROM admin_lesson_map WHERE topic_code = 'ADMIN-03';

-- ADMIN-04: Conceptos básicos (87 sections)

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'alcance_oficial_cicde_0', 'Alcance oficial CICDE', $BODY_235$El temario CICDE 2026 incluye como cuarto tema del área de Administración:

> **4. Conceptos básicos**

CICDE no enumera subtemas explícitos para ADMIN-04. Para desarrollar el contenido sin crear un alcance arbitrario, este paquete sigue el **Capítulo 4: Conceptos básicos** de la obra recomendada por el propio CICDE:

**Balderas Pedrero, María de la Luz. _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015.**

La tabla de contenidos oficial de McGraw-Hill incluye en este capítulo:

- variables administrativas;
- estructura de la organización;
- organización científica;
- organización formal;
- división del trabajo;
- productividad;
- ambiente;
- tecnología y tipos de tecnología;
- concepto del individuo según los modelos de administración;
- filosofía de la administración;
- organizaciones humanas;
- objetivos y necesidades de las personas;
- objetivos organizacionales;
- importancia y tipos de objetivos;
- objetivos de servicio, sociales y económicos;
- características de la administración;
- universalidad;
- especificidad;
- unidad temporal;
- unidad jerárquica;
- campos de acción de la administración;
- administración como ciencia social;
- conceptos e importancia de la administración;
- perfil del administrador;
- perfil del administrador en enfermería.

Este material desarrolla esos ejes en lenguaje propio y los relaciona con servicios de enfermería.

---$BODY_235$, 1
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_de_aprendizaje_1', 'Objetivos de aprendizaje', $BODY_236$Al finalizar el tema, el estudiante debe poder:

1. Definir administración en términos operativos.
2. Identificar las variables administrativas descritas por Balderas.
3. Explicar qué es estructura organizacional.
4. Diferenciar organización formal e informal.
5. Explicar la división del trabajo y sus riesgos.
6. Diferenciar productividad, eficacia y eficiencia.
7. Reconocer la influencia del ambiente externo.
8. Explicar el papel de la tecnología en una organización.
9. Identificar cómo distintos modelos administrativos conciben al trabajador.
10. Explicar la relación entre objetivos individuales y organizacionales.
11. Diferenciar objetivos de servicio, sociales y económicos.
12. Describir universalidad, especificidad, unidad temporal y unidad jerárquica.
13. Explicar por qué la administración se estudia como ciencia social aplicada.
14. Reconocer campos de acción de la administración.
15. Describir competencias básicas de un administrador.
16. Aplicar esos conceptos al perfil de quien administra servicios de enfermería.

---$BODY_236$, 2
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'concepto_operativo_de_administraci_n_2', 'Concepto operativo de administración', $BODY_237$Administrar implica coordinar recursos y actividades para alcanzar objetivos.

Incluye trabajar con:

- personas;
- información;
- tiempo;
- recursos materiales;
- tecnología;
- presupuesto;
- procesos.

Una definición útil para examen:

> **Administración es el proceso de coordinar recursos y esfuerzos para alcanzar objetivos organizacionales de manera ordenada y responsable.**

---$BODY_237$, 3
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'administraci_n_como_proceso_3', 'Administración como proceso', $BODY_238$La administración no es una acción aislada.

Integra actividades como:

- planear;
- organizar;
- dirigir;
- coordinar;
- controlar;
- evaluar.

Estas funciones ocurren de forma relacionada.

---$BODY_238$, 4
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'finalidad_de_la_administraci_n_4', 'Finalidad de la administración', $BODY_239$Busca:

- alcanzar objetivos;
- organizar el trabajo;
- aprovechar recursos;
- coordinar personas;
- responder al entorno;
- evaluar resultados;
- mejorar.

En salud debe añadirse una condición esencial: **la eficiencia nunca debe desplazar la seguridad ni la calidad del cuidado**.

---$BODY_239$, 5
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'variables_administrativas_5', 'Variables administrativas', $BODY_240$Balderas identifica cinco variables centrales:

1. estructura;
2. división del trabajo;
3. productividad;
4. ambiente;
5. tecnología.

Estas variables interactúan entre sí.

---$BODY_240$, 6
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'la_administraci_n_como_sistema_de_variables_6', 'La administración como sistema de variables', $BODY_241$Ejemplo:

Una nueva tecnología puede:

- cambiar la estructura;
- modificar funciones;
- alterar productividad;
- requerir capacitación;
- generar nuevas relaciones con el ambiente.

Por eso ninguna variable debe estudiarse completamente aislada.

---$BODY_241$, 7
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estructura_de_la_organizaci_n_7', 'Estructura de la organización', $BODY_242$La estructura define cómo se distribuyen:

- cargos;
- responsabilidades;
- autoridad;
- comunicación;
- tareas;
- relaciones.

Responde preguntas como:

- ¿quién hace qué?
- ¿quién decide?
- ¿quién supervisa?
- ¿quién informa a quién?

---$BODY_242$, 8
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'componentes_de_una_estructura_8', 'Componentes de una estructura', $BODY_243$Pueden incluir:

- niveles jerárquicos;
- departamentos;
- puestos;
- líneas de autoridad;
- canales formales de comunicación;
- mecanismos de coordinación.

---$BODY_243$, 9
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estructura_no_equivale_a_edificio_9', 'Estructura no equivale a edificio', $BODY_244$La estructura organizacional no es la planta física.

Es el **patrón de relaciones y responsabilidades** mediante el cual funciona la organización.

---$BODY_244$, 10
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estructura_y_estrategia_10', 'Estructura y estrategia', $BODY_245$La estructura debe apoyar los objetivos.

Si una organización cambia su estrategia pero mantiene una estructura incompatible, puede aparecer:

- duplicidad;
- retraso;
- conflicto;
- pérdida de responsabilidad.

---$BODY_245$, 11
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_cient_fica_11', 'Organización científica', $BODY_246$El capítulo de Balderas utiliza la expresión **organización científica** dentro de las variables administrativas.

En términos de estudio, se relaciona con la búsqueda sistemática de:

- métodos;
- orden;
- estandarización;
- análisis del trabajo;
- distribución racional de tareas.

Se conecta históricamente con la administración científica.

---$BODY_246$, 12
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_formal_12', 'Organización formal', $BODY_247$Es la estructura oficialmente definida.

Incluye:

- puestos;
- organigramas;
- normas;
- políticas;
- procedimientos;
- autoridad.

---$BODY_247$, 13
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_informal_13', 'Organización informal', $BODY_248$Surge de las relaciones espontáneas entre personas.

Incluye:

- amistades;
- confianza;
- líderes informales;
- redes de comunicación;
- grupos de apoyo.

Puede beneficiar o dificultar los objetivos formales.

---$BODY_248$, 14
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'formal_e_informal_coexisten_14', 'Formal e informal coexisten', $BODY_249$Ejemplo:

Formalmente una supervisora es la responsable del turno.

Informalmente una enfermera experimentada puede ser la persona a quien todos consultan.

Ambas formas de influencia pueden coexistir.

---$BODY_249$, 15
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'divisi_n_del_trabajo_15', 'División del trabajo', $BODY_250$Consiste en distribuir actividades entre personas o unidades.

Busca favorecer:

- especialización;
- experiencia;
- coordinación;
- eficiencia.

---$BODY_250$, 16
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'especializaci_n_16', 'Especialización', $BODY_251$La especialización permite desarrollar competencias específicas.

Ejemplos en salud:

- cuidados intensivos;
- pediatría;
- cirugía;
- salud mental;
- epidemiología.

Pero requiere coordinación para evitar fragmentación.

---$BODY_251$, 17
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'riesgos_de_una_divisi_n_excesiva_17', 'Riesgos de una división excesiva', $BODY_252$Puede producir:

- pérdida de continuidad;
- duplicación;
- visión fragmentada;
- fallos de comunicación;
- sensación de que “nadie es responsable del conjunto”.

---$BODY_252$, 18
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'coordinaci_n_18', 'Coordinación', $BODY_253$La división del trabajo solo funciona cuando existe coordinación.

Coordinar significa alinear:

- tareas;
- tiempos;
- personas;
- recursos;
- información.

---$BODY_253$, 19
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'productividad_19', 'Productividad', $BODY_254$La productividad relaciona resultados obtenidos con recursos utilizados.

Puede expresarse de distintas maneras según el contexto.

No debe confundirse con “hacer más a cualquier costo”.

---$BODY_254$, 20
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'productividad_en_salud_20', 'Productividad en salud', $BODY_255$Un servicio puede aumentar actividad y, aun así, empeorar:

- seguridad;
- calidad;
- experiencia;
- continuidad.

Por eso la productividad debe interpretarse junto con resultados de cuidado.

---$BODY_255$, 21
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'eficacia_21', 'Eficacia', $BODY_256$**Eficacia** significa alcanzar el objetivo previsto.

Ejemplo:

si el objetivo era implementar una valoración obligatoria y se logra de manera consistente, existe eficacia respecto a ese objetivo.

---$BODY_256$, 22
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'eficiencia_22', 'Eficiencia', $BODY_257$**Eficiencia** significa utilizar adecuadamente los recursos para alcanzar el objetivo.

No equivale simplemente a gastar menos.

---$BODY_257$, 23
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'eficacia_vs_eficiencia_23', 'Eficacia vs eficiencia', $BODY_258$Un servicio puede:

- ser eficaz pero usar demasiados recursos;
- ser eficiente en un proceso que no logra el objetivo correcto.

La buena administración busca ambas sin comprometer calidad.

---$BODY_258$, 24
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ambiente_organizacional_24', 'Ambiente organizacional', $BODY_259$El ambiente comprende condiciones externas que influyen en la organización.

Ejemplos:

- legislación;
- economía;
- población;
- cultura;
- tecnología;
- proveedores;
- políticas públicas;
- mercado laboral.

---$BODY_259$, 25
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ambiente_interno_y_externo_25', 'Ambiente interno y externo', $BODY_260$**Interno**
- cultura;
- personal;
- procesos;
- recursos;
- liderazgo.

**Externo**
- leyes;
- economía;
- cambios demográficos;
- nuevas tecnologías;
- expectativas sociales.

---$BODY_260$, 26
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_como_sistema_abierto_26', 'Organización como sistema abierto', $BODY_261$Las organizaciones reciben del ambiente:

- recursos;
- información;
- personas;
- demandas.

Y devuelven:

- productos;
- servicios;
- resultados;
- información.

Por eso deben adaptarse.

---$BODY_261$, 27
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'incertidumbre_ambiental_27', 'Incertidumbre ambiental', $BODY_262$Cuando el entorno cambia con rapidez aumenta la necesidad de:

- información;
- flexibilidad;
- planificación;
- aprendizaje;
- adaptación.

---$BODY_262$, 28
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tecnolog_a_28', 'Tecnología', $BODY_263$Tecnología no significa únicamente computadoras.

Incluye conocimientos, métodos, equipos y procesos utilizados para transformar recursos en resultados.

---$BODY_263$, 29
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tecnolog_a_en_enfermer_a_29', 'Tecnología en enfermería', $BODY_264$Ejemplos:

- expediente electrónico;
- bombas de infusión;
- telemedicina;
- sistemas de turnos;
- equipos de monitoreo;
- protocolos digitales.

---$BODY_264$, 30
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tecnolog_a_y_estructura_30', 'Tecnología y estructura', $BODY_265$Una tecnología nueva puede cambiar:

- tareas;
- capacitación;
- supervisión;
- responsabilidad;
- comunicación.

La tecnología debe integrarse al sistema de trabajo.

---$BODY_265$, 31
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tecnolog_a_y_riesgo_31', 'Tecnología y riesgo', $BODY_266$La tecnología puede:

- reducir errores;
- generar nuevos errores;
- automatizar;
- aumentar dependencia;
- crear fatiga por alertas.

No debe asumirse que toda innovación es automáticamente segura.

---$BODY_266$, 32
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tipos_de_tecnolog_a_32', 'Tipos de tecnología', $BODY_267$Las clasificaciones pueden variar según autor.

Para estudiar el concepto conviene reconocer tecnologías orientadas a:

- producción/operación;
- información;
- comunicación;
- diagnóstico;
- apoyo administrativo.

El criterio exacto debe seguir la fuente o contexto de la pregunta.

---$BODY_267$, 33
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'concepto_del_individuo_seg_n_modelos_administrativ_33', 'Concepto del individuo según modelos administrativos', $BODY_268$Las teorías administrativas han descrito al trabajador de maneras distintas.

Algunas enfatizaron:

- incentivo económico;
- disciplina;
- control.

Otras:

- necesidades sociales;
- motivación;
- participación;
- conocimiento;
- autonomía.

---$BODY_268$, 34
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'individuo_econ_mico_34', 'Individuo económico', $BODY_269$En los primeros enfoques se prestó mucha atención a:

- remuneración;
- productividad;
- incentivos;
- control.

Este modelo es limitado si se utiliza como explicación única de la conducta.

---$BODY_269$, 35
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'individuo_social_35', 'Individuo social', $BODY_270$Los enfoques de relaciones humanas mostraron que también importan:

- pertenencia;
- grupo;
- reconocimiento;
- relaciones;
- supervisión.

---$BODY_270$, 36
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'individuo_complejo_36', 'Individuo complejo', $BODY_271$La administración contemporánea reconoce que una persona puede estar influida simultáneamente por:

- valores;
- dinero;
- familia;
- propósito;
- carrera;
- cultura;
- salud;
- relaciones.

No existe una motivación única universal.

---$BODY_271$, 37
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'profesional_del_conocimiento_37', 'Profesional del conocimiento', $BODY_272$En profesiones como enfermería, el trabajo requiere:

- conocimiento;
- juicio;
- autonomía profesional;
- actualización;
- toma de decisiones.

Una gestión excesivamente mecánica puede desaprovechar estas capacidades.

---$BODY_272$, 38
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'filosof_a_de_la_administraci_n_38', 'Filosofía de la administración', $BODY_273$La filosofía administrativa expresa ideas sobre:

- propósito;
- personas;
- autoridad;
- responsabilidad;
- calidad;
- servicio;
- ética.

Orienta la manera en que se toman decisiones.

---$BODY_273$, 39
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'filosof_a_y_pr_ctica_39', 'Filosofía y práctica', $BODY_274$Una organización puede declarar que “el paciente es el centro”.

Para que esa filosofía sea real debe reflejarse en:

- políticas;
- recursos;
- horarios;
- procesos;
- indicadores;
- decisiones.

---$BODY_274$, 40
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaciones_humanas_40', 'Organizaciones humanas', $BODY_275$Una organización no es solo:

- estructura;
- tecnología;
- presupuesto.

Está compuesta por personas con:

- necesidades;
- expectativas;
- valores;
- capacidades.

---$BODY_275$, 41
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_y_necesidades_de_las_personas_41', 'Objetivos y necesidades de las personas', $BODY_276$Los trabajadores pueden buscar:

- seguridad;
- reconocimiento;
- ingreso;
- desarrollo;
- pertenencia;
- autonomía;
- propósito.

La organización busca que los objetivos individuales y colectivos puedan coexistir de forma razonable.

---$BODY_276$, 42
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'conflicto_de_objetivos_42', 'Conflicto de objetivos', $BODY_277$Puede ocurrir cuando:

- metas institucionales;
- necesidades del personal;
- prioridades del paciente

entran en tensión.

La función administrativa incluye reconocer y manejar esas tensiones.

---$BODY_277$, 43
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_organizacionales_43', 'Objetivos organizacionales', $BODY_278$Son resultados que la organización desea alcanzar.

Deben orientar:

- decisiones;
- recursos;
- actividades;
- evaluación.

---$BODY_278$, 44
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'importancia_de_los_objetivos_44', 'Importancia de los objetivos', $BODY_279$Sin objetivos claros es difícil saber:

- qué priorizar;
- qué medir;
- qué corregir;
- si se logró el resultado.

---$BODY_279$, 45
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'caracter_sticas_de_un_buen_objetivo_45', 'Características de un buen objetivo', $BODY_280$Debe ser:

- claro;
- relevante;
- comprensible;
- evaluable;
- coherente con la misión.

Cuando sea posible, también debe ser medible y tener horizonte temporal.

---$BODY_280$, 46
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tipos_de_objetivos_46', 'Tipos de objetivos', $BODY_281$Balderas distingue:

- objetivos de servicio;
- objetivos sociales;
- objetivos económicos.

Una institución puede perseguir varios simultáneamente.

---$BODY_281$, 47
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_de_servicio_47', 'Objetivos de servicio', $BODY_282$Se relacionan con el valor que la organización entrega.

En salud:

- atención segura;
- acceso;
- continuidad;
- calidad;
- satisfacción de necesidades sanitarias.

---$BODY_282$, 48
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_sociales_48', 'Objetivos sociales', $BODY_283$Pueden incluir:

- responsabilidad con la comunidad;
- empleo;
- equidad;
- desarrollo profesional;
- bienestar social.

---$BODY_283$, 49
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_econ_micos_49', 'Objetivos económicos', $BODY_284$Se relacionan con sostenibilidad financiera y uso responsable de recursos.

Incluso una institución pública necesita administrar:

- presupuesto;
- costos;
- insumos;
- tiempo.

---$BODY_284$, 50
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'equilibrio_entre_objetivos_50', 'Equilibrio entre objetivos', $BODY_285$En salud no debe buscarse un objetivo económico sacrificando:

- seguridad;
- ética;
- calidad;
- derechos.

La administración debe equilibrar dimensiones.

---$BODY_285$, 51
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'caracter_sticas_de_la_administraci_n_51', 'Características de la administración', $BODY_286$Balderas incluye cuatro características:

1. universalidad;
2. especificidad;
3. unidad temporal;
4. unidad jerárquica.

---$BODY_286$, 52
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'universalidad_52', 'Universalidad', $BODY_287$La administración aparece en distintos tipos de organizaciones:

- hospitales;
- escuelas;
- empresas;
- gobiernos;
- asociaciones.

Cambian los fines, pero existe necesidad de organizar recursos y personas.

---$BODY_287$, 53
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'especificidad_53', 'Especificidad', $BODY_288$La administración posee conceptos y técnicas propias.

Aunque se relaciona con:

- economía;
- psicología;
- sociología;
- derecho;
- estadística,

no se reduce a ninguna de ellas.

---$BODY_288$, 54
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'unidad_temporal_54', 'Unidad temporal', $BODY_289$Las funciones administrativas se separan para estudiarlas, pero en la práctica ocurren de manera continua e interrelacionada.

Mientras se ejecuta, también puede:

- evaluarse;
- reorganizarse;
- replantearse.

---$BODY_289$, 55
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'unidad_jer_rquica_55', 'Unidad jerárquica', $BODY_290$La administración ocurre en distintos niveles de la organización.

La intensidad y alcance cambian según:

- dirección;
- jefatura;
- supervisión;
- operación.

---$BODY_290$, 56
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'niveles_administrativos_56', 'Niveles administrativos', $BODY_291$Una división útil:

**Estratégico**
- dirección global;
- largo plazo.

**Táctico**
- áreas/departamentos;
- mediano plazo.

**Operativo**
- actividades inmediatas.

---$BODY_291$, 57
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ejemplo_en_enfermer_a_57', 'Ejemplo en enfermería', $BODY_292$**Estratégico:** dirección de enfermería define prioridades institucionales.

**Táctico:** jefatura de servicio organiza recursos.

**Operativo:** responsable de turno distribuye actividades y responde a cambios.

---$BODY_292$, 58
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'campos_de_acci_n_de_la_administraci_n_58', 'Campos de acción de la administración', $BODY_293$Puede aplicarse a:

- organizaciones públicas;
- privadas;
- sociales;
- sanitarias;
- educativas;
- productivas;
- servicios.

---$BODY_293$, 59
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'administraci_n_en_salud_59', 'Administración en salud', $BODY_294$Incluye gestionar:

- recursos humanos;
- materiales;
- infraestructura;
- información;
- calidad;
- procesos;
- presupuesto.

---$BODY_294$, 60
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'administraci_n_de_enfermer_a_60', 'Administración de enfermería', $BODY_295$Se enfoca en organizar recursos y trabajo de enfermería para asegurar continuidad y calidad del cuidado.

Puede incluir:

- personal;
- turnos;
- asignaciones;
- insumos;
- capacitación;
- supervisión;
- indicadores;
- seguridad.

---$BODY_295$, 61
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'administraci_n_como_ciencia_social_61', 'Administración como ciencia social', $BODY_296$Se estudia como ciencia social porque analiza organizaciones formadas por personas y relaciones humanas.

Su objeto incluye fenómenos que no son completamente predecibles como una ecuación física.

---$BODY_296$, 62
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'campo_de_estudio_delimitado_62', 'Campo de estudio delimitado', $BODY_297$La administración posee un campo propio relacionado con:

- organizaciones;
- coordinación;
- recursos;
- objetivos;
- decisiones;
- procesos.

---$BODY_297$, 63
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'conocimiento_sistematizado_63', 'Conocimiento sistematizado', $BODY_298$Las teorías, principios, modelos e investigaciones administrativas conforman conocimiento organizado que puede:

- enseñarse;
- analizarse;
- contrastarse;
- aplicarse.

---$BODY_298$, 64
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 't_cnica_de_aplicaci_n_64', 'Técnica de aplicación', $BODY_299$La administración utiliza herramientas como:

- presupuestos;
- organigramas;
- indicadores;
- cronogramas;
- políticas;
- procedimientos;
- evaluación.

La teoría orienta; las técnicas ayudan a ejecutar.

---$BODY_299$, 65
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'administraci_n_ciencia_t_cnica_y_pr_ctica_65', 'Administración: ciencia, técnica y práctica', $BODY_300$Puede entenderse simultáneamente como:

- campo de conocimiento;
- conjunto de técnicas;
- práctica profesional.

No es necesario reducirla a una sola categoría.

---$BODY_300$, 66
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'importancia_de_la_administraci_n_66', 'Importancia de la administración', $BODY_301$Permite:

- coordinar esfuerzos;
- reducir desperdicio;
- aclarar responsabilidades;
- mejorar continuidad;
- responder a cambios;
- evaluar resultados.

En enfermería influye directamente sobre el cuidado.

---$BODY_301$, 67
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'perfil_del_administrador_67', 'Perfil del administrador', $BODY_302$Un administrador necesita combinar:

- conocimientos;
- habilidades;
- actitudes;
- ética.

No basta con autoridad formal.

---$BODY_302$, 68
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'competencias_conceptuales_68', 'Competencias conceptuales', $BODY_303$Incluyen:

- visión global;
- pensamiento crítico;
- análisis;
- comprensión de sistemas;
- planificación;
- toma de decisiones.

---$BODY_303$, 69
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'competencias_humanas_69', 'Competencias humanas', $BODY_304$Incluyen:

- comunicación;
- trabajo en equipo;
- manejo de conflictos;
- motivación;
- respeto;
- negociación.

---$BODY_304$, 70
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'competencias_t_cnicas_70', 'Competencias técnicas', $BODY_305$Incluyen conocimientos específicos necesarios para administrar el área.

En enfermería:

- procesos de cuidado;
- seguridad;
- calidad;
- recursos;
- normativa;
- documentación.

---$BODY_305$, 71
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'perfil_del_administrador_en_enfermer_a_71', 'Perfil del administrador en enfermería', $BODY_306$Debe integrar:

- conocimiento clínico;
- capacidad administrativa;
- liderazgo;
- comunicación;
- ética;
- seguridad;
- gestión de recursos;
- desarrollo del personal.

---$BODY_306$, 72
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'administrar_no_es_solo_supervisar_72', 'Administrar no es solo supervisar', $BODY_307$Una jefatura de enfermería también debe:

- planificar;
- resolver problemas;
- analizar indicadores;
- coordinar;
- educar;
- gestionar cambios;
- apoyar al equipo.

---$BODY_307$, 73
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'autoridad_y_responsabilidad_profesional_73', 'Autoridad y responsabilidad profesional', $BODY_308$El administrador de enfermería debe ejercer autoridad dentro de:

- competencias;
- normas;
- ética;
- estructura institucional.

La autoridad no elimina la responsabilidad por las decisiones.

---$BODY_308$, 74
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'gesti_n_y_liderazgo_74', 'Gestión y liderazgo', $BODY_309$Open RN distingue ambos conceptos:

**Gestión**
- planificación;
- organización;
- priorización;
- presupuesto;
- dotación;
- coordinación.

**Liderazgo**
- dirección;
- influencia;
- motivación;
- cambio.

Una buena jefatura suele necesitar ambos.

---$BODY_309$, 75
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'pensamiento_cr_tico_administrativo_75', 'Pensamiento crítico administrativo', $BODY_310$Antes de decidir:

- identificar problema;
- buscar datos;
- considerar alternativas;
- analizar riesgos;
- decidir;
- evaluar resultado.

---$BODY_310$, 76
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'problema_vs_soluci_n_autom_tica_76', 'Problema vs solución automática', $BODY_311$Ejemplo:

“Falta personal” no siempre se resuelve únicamente contratando.

También deben analizarse:

- demanda;
- distribución;
- ausentismo;
- procesos;
- horarios;
- competencias.

---$BODY_311$, 77
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'prioridad_administrativa_77', 'Prioridad administrativa', $BODY_312$En servicios de salud, una decisión debe considerar primero:

- seguridad;
- riesgo;
- continuidad;
- necesidades del paciente.

Después se ponderan conveniencia y costo.

---$BODY_312$, 78
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'relaci_n_entre_variables_78', 'Relación entre variables', $BODY_313$Ejemplo completo:

Se implementa un expediente electrónico.

**Tecnología:** nuevo sistema.  
**Estructura:** cambia flujo de información.  
**División del trabajo:** cambian responsabilidades.  
**Productividad:** puede mejorar o disminuir al inicio.  
**Ambiente:** normativa y expectativas digitales influyen.

---$BODY_313$, 79
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_examen_79', 'Errores frecuentes de examen', $BODY_314$1. Confundir estructura organizacional con infraestructura física.
2. Creer que organización formal e informal son excluyentes.
3. Pensar que productividad equivale solo a hacer más.
4. Confundir eficacia y eficiencia.
5. Considerar tecnología únicamente como computadoras.
6. Suponer que el ambiente externo no afecta la organización.
7. Creer que todos los trabajadores se motivan igual.
8. Confundir objetivos organizacionales con actividades.
9. Tratar universalidad como “todas las organizaciones son iguales”.
10. Interpretar unidad temporal como que cada función ocurre por separado.
11. Pensar que solo la alta dirección administra.
12. Reducir administración de enfermería a elaborar horarios.
13. Confundir autoridad con liderazgo.
14. Buscar ahorro sacrificando seguridad o calidad.

---$BODY_314$, 80
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estrategia_cicde_para_admin_04_80', 'Estrategia CICDE para ADMIN-04', $BODY_315$Si la pregunta habla de:

- **cargos, líneas de autoridad** → estructura.
- **repartición de tareas** → división del trabajo.
- **resultado respecto a recursos** → productividad/eficiencia.
- **leyes, economía, población** → ambiente.
- **métodos/equipos/conocimiento aplicado** → tecnología.
- **alcanzar el objetivo** → eficacia.
- **usar bien recursos** → eficiencia.
- **aplicación a cualquier organización** → universalidad.
- **funciones simultáneas e interrelacionadas** → unidad temporal.
- **administración en todos los niveles** → unidad jerárquica.

---$BODY_315$, 81
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'situaciones_originales_tipo_examen_81', 'Situaciones originales tipo examen', $BODY_316$## Caso 1 — Estructura
Una unidad no sabe quién autoriza cambios de turno.

**Respuesta:** existe un problema de estructura/claridad de autoridad.

---

## Caso 2 — Organización informal
Aunque no tiene cargo, una enfermera experimentada es referente del equipo.

**Respuesta:** ejemplo de influencia dentro de la organización informal.

---

## Caso 3 — División del trabajo
Cada miembro realiza una parte del cuidado, pero nadie coordina el plan completo.

**Respuesta:** la especialización está produciendo fragmentación por falta de coordinación.

---

## Caso 4 — Productividad
Un servicio atiende más pacientes pero aumenta los eventos adversos.

**Respuesta:** mayor volumen no demuestra buena productividad ni buena gestión si se deteriora la calidad.

---

## Caso 5 — Eficacia
El servicio logra el objetivo previsto.

**Respuesta:** eficacia.

---

## Caso 6 — Eficiencia
Dos unidades alcanzan el mismo resultado; una utiliza menos recursos sin reducir calidad.

**Respuesta:** mayor eficiencia.

---

## Caso 7 — Ambiente
Una nueva ley obliga a cambiar documentación institucional.

**Respuesta:** influencia del ambiente externo.

---

## Caso 8 — Tecnología
Se instala un nuevo sistema electrónico y cambian roles, flujos y tiempos.

**Respuesta:** la tecnología interactúa con otras variables administrativas.

---

## Caso 9 — Objetivo de servicio
La meta es disminuir tiempo de espera y mejorar continuidad.

**Respuesta:** objetivo principalmente de servicio.

---

## Caso 10 — Objetivo social
El hospital desarrolla un programa de acceso para una población vulnerable.

**Respuesta:** objetivo social.

---

## Caso 11 — Objetivo económico
La unidad busca disminuir desperdicio sin afectar seguridad.

**Respuesta:** objetivo económico compatible con gestión responsable.

---

## Caso 12 — Universalidad
Se aplican principios administrativos tanto en un hospital como en una universidad.

**Respuesta:** universalidad.

---

## Caso 13 — Unidad temporal
Mientras ejecuta un plan, la jefa evalúa resultados y modifica recursos.

**Respuesta:** unidad temporal; las funciones administrativas se superponen.

---

## Caso 14 — Unidad jerárquica
Dirección, jefatura y responsable de turno toman decisiones de diferente alcance.

**Respuesta:** administración en distintos niveles jerárquicos.

---

## Caso 15 — Perfil
Una jefa domina procesos clínicos pero tiene graves dificultades de comunicación y coordinación.

**Respuesta:** el perfil administrativo requiere también habilidades humanas y de gestión.

---

## Caso 16 — Prioridad
Dos opciones ahorran dinero, pero una aumenta riesgo del paciente.

**Respuesta:** debe descartarse la opción insegura; eficiencia no justifica comprometer la calidad del cuidado.

---$BODY_316$, 82
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preguntas_r_pidas_82', 'Preguntas rápidas', $BODY_317$**1. ¿Cuáles son las cinco variables administrativas de Balderas?**  
Estructura, división del trabajo, productividad, ambiente y tecnología.

**2. ¿Qué es estructura?**  
Distribución de responsabilidades, autoridad y relaciones.

**3. ¿Qué es organización formal?**  
La estructura oficialmente establecida.

**4. ¿Qué es organización informal?**  
Relaciones espontáneas que surgen entre personas.

**5. ¿Qué es eficacia?**  
Alcanzar el objetivo.

**6. ¿Qué es eficiencia?**  
Usar adecuadamente los recursos para alcanzarlo.

**7. ¿Qué es universalidad?**  
La administración aparece en diversos tipos de organizaciones.

**8. ¿Qué es unidad temporal?**  
Las funciones administrativas ocurren de forma interrelacionada y continua.

**9. ¿Qué es unidad jerárquica?**  
La administración existe en varios niveles de la organización.

**10. ¿Qué necesita un administrador de enfermería?**  
Conocimiento técnico, habilidades humanas, pensamiento conceptual, ética, gestión y liderazgo.

---$BODY_317$, 83
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fuentes_y_validaci_n_83', 'Fuentes y validación', $BODY_318$## Fuente rectora CICDE

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** _Lineamientos para el Examen por Competencia de Profesionales de Enfermería_. Tercera edición. Panamá, 2026.

## Bibliografía principal indicada por CICDE

2. **Balderas Pedrero, María de la Luz.** _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015. ISBN 9786071512413.  
   https://www.mheducation.com.mx/administracion-de-los-servicios-de-enfermeria-9786071512413-latam-group

La tabla oficial de contenidos confirma que el Capítulo 4 incluye variables administrativas, estructura, organización formal, división del trabajo, productividad, ambiente, tecnología, modelos de individuo, filosofía administrativa, objetivos, características de la administración, administración como ciencia social y perfil del administrador/enfermería.

## Administración y organizaciones

3. **OpenStax. _Principles of Management_.**  
   https://openstax.org/details/books/principles-management

4. **OpenStax. The Internal Organization and External Environments.**  
   https://openstax.org/books/principles-management/pages/4-4-the-internal-organization-and-external-environments

## Aplicación a enfermería

5. **Open RN / NCBI Bookshelf. _Nursing Management and Professional Concepts_, 2nd edition. Chapter 4: Leadership and Management.** 2024.  
   https://www.ncbi.nlm.nih.gov/books/NBK610440/

Esta fuente se usa como complemento contemporáneo para distinguir funciones de gestión y liderazgo en enfermería.

---$BODY_318$, 84
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'notas_de_interpretaci_n_84', 'Notas de interpretación', $BODY_319$## Terminología de Balderas

El capítulo utiliza categorías propias de su marco teórico. Este paquete conserva sus ejes de estudio pero evita tratar cada clasificación como una definición universal válida para todos los autores.

## Productividad

Se presenta como relación entre resultados y recursos, pero en servicios de salud siempre debe analizarse junto con seguridad, calidad y resultados.

## Perfil del administrador

No se presenta una lista legal de funciones para Panamá. Se describe un perfil académico general de gestión de enfermería. Las competencias y atribuciones reales dependen de normativa, institución y cargo.

---$BODY_319$, 85
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_de_calidad_85', 'Control de calidad', $BODY_320$- Alcance cotejado contra CICDE 2026.
- CICDE no enumera subtemas explícitos para ADMIN-04.
- Expansión guiada por el índice oficial del Capítulo 4 de Balderas.
- Incluidas las cinco variables administrativas.
- Estructura formal e informal diferenciadas.
- Productividad, eficacia y eficiencia diferenciadas.
- Ambiente y tecnología tratados como variables interdependientes.
- Objetivos de servicio, sociales y económicos incluidos.
- Universalidad, especificidad, unidad temporal y unidad jerárquica incluidas.
- Administración como ciencia social tratada sin afirmaciones absolutas.
- Perfil del administrador de enfermería actualizado con fuente abierta de enfermería.
- 16 situaciones tipo examen originales.
- No se reproduce texto protegido de Balderas.
- No se declara revisión humana inexistente.

---$BODY_320$, 86
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estado_para_integraci_n_86', 'Estado para integración', $BODY_321$**Estado:** `REVIEW`

Motivo:

- contenido y fuentes fueron sometidos a validación documental/académica;
- no existe revisor humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` por revisión de IA.

**Cobertura CICDE ADMIN-04: tema principal cubierto según el alcance disponible y el capítulo de referencia señalado por CICDE.**

**Situaciones originales tipo examen: 16.**$BODY_321$, 87
FROM admin_lesson_map WHERE topic_code = 'ADMIN-04';

-- ADMIN-05: Funciones administrativas (73 sections)

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'alcance_oficial_cicde_0', 'Alcance oficial CICDE', $BODY_322$El temario CICDE 2026 incluye dentro del área **Administración** el tema:

> **5. Funciones administrativas**

El lineamiento no enumera subtemas explícitos para ADMIN-05.

Para expandir el tema sin atribuir al CICDE una lista que no aparece literalmente en el documento rector, este paquete utiliza como referencia principal la bibliografía indicada por CICDE:

**Balderas Pedrero, María de la Luz. _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015.**

La tabla de contenidos oficial del editor confirma que el capítulo **“Funciones administrativas”** aborda, entre otros ejes:

- planeación;
- pasos, niveles e instrumentos de planeación;
- organización formal e informal;
- organigramas, normas, reglas, manuales y puestos;
- dirección y liderazgo;
- teorías de motivación;
- comunicación;
- delegación;
- dirección de personal;
- incorporación y desarrollo de recursos;
- control;
- supervisión;
- evaluación;
- informes, archivo y auditoría.

Este material desarrolla esos ejes con lenguaje propio y apoyo de fuentes abiertas de administración. **No se asume acceso integral al texto completo del capítulo de Balderas ni se reproduce contenido protegido.**

---$BODY_322$, 1
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'l_mite_de_este_tema_admin_05_vs_admin_07_1', 'Límite de este tema: ADMIN-05 vs ADMIN-07', $BODY_323$Es importante no fusionar dos temas distintos del temario CICDE:

## ADMIN-05 — Funciones administrativas

Busca comprender **qué hace cada función administrativa**, cómo se relacionan y qué herramientas generales utiliza el administrador.

En este módulo se estudian principalmente:

- planeación;
- organización;
- dirección/liderazgo;
- comunicación;
- motivación;
- delegación;
- dirección de personal;
- control.

## ADMIN-07 — Proceso administrativo aplicado en Enfermería

El CICDE lo presenta posteriormente como:

- planeación;
- organización;
- dirección, incluyendo liderazgo y toma de decisiones;
- control, incluyendo supervisión.

ADMIN-07 deberá integrar estas funciones **en un proceso aplicado específicamente al servicio y cuidado de enfermería**.

### Regla de estudio

En ADMIN-05 hay que poder **reconocer y diferenciar las funciones**.

En ADMIN-07 habrá que poder **aplicarlas secuencialmente a situaciones de enfermería**.

---$BODY_323$, 2
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_de_aprendizaje_2', 'Objetivos de aprendizaje', $BODY_324$Al finalizar este tema, el estudiante debe ser capaz de:

1. Explicar por qué las funciones administrativas forman un sistema integrado.
2. Diferenciar planeación, organización, dirección y control.
3. Reconocer la relación entre objetivos, recursos, personal, ejecución y resultados.
4. Describir los pasos generales de la planeación.
5. Diferenciar niveles de planeación.
6. Reconocer los principales instrumentos de organización.
7. Explicar autoridad, responsabilidad, delegación y rendición de cuentas.
8. Diferenciar organización formal e informal.
9. Relacionar liderazgo, motivación y comunicación con la función de dirección.
10. Reconocer principios básicos de dirección de personal.
11. Explicar el propósito del control administrativo.
12. Diferenciar supervisión, evaluación, informe y auditoría.
13. Relacionar planeación y control mediante retroalimentación.
14. Aplicar pensamiento crítico a situaciones administrativas de enfermería.
15. Evitar errores frecuentes de examen, como confundir liderazgo con autoridad o control con castigo.
16. Resolver situaciones tipo CICDE identificando la función administrativa predominante.

---$BODY_324$, 3
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'mapa_de_las_funciones_administrativas_3', 'Mapa de las funciones administrativas', $BODY_325$Una forma sencilla de visualizar las funciones es:

```text
¿QUÉ se quiere lograr y cómo?
        ↓
   PLANEACIÓN
        ↓
¿QUIÉN hará qué y con qué recursos?
        ↓
  ORGANIZACIÓN
        ↓
¿Cómo se moviliza al equipo para ejecutar?
        ↓
DIRECCIÓN / LIDERAZGO
        ↓
¿Se logró lo esperado?
        ↓
     CONTROL
        ↓
Retroalimentación y ajustes
        ↺
```

Las cuatro funciones se estudian por separado para comprenderlas mejor, pero en la práctica se superponen.

---$BODY_325$, 4
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'las_funciones_como_sistema_integrado_4', 'Las funciones como sistema integrado', $BODY_326$OpenStax resume la gestión contemporánea alrededor de cuatro funciones centrales:

- planear;
- organizar;
- liderar/dirigir;
- controlar.

No deben imaginarse como compartimentos cerrados.

Una jefa de enfermería puede, en una misma mañana:

- revisar indicadores del turno anterior (**control**);
- modificar una distribución de personal (**organización**);
- comunicar nuevas prioridades (**dirección**);
- preparar cobertura para el fin de semana (**planeación**).

### Clave

Las funciones administrativas son **interdependientes**.

---$BODY_326$, 5
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'planeaci_n_concepto_5', 'Planeación: concepto', $BODY_327$La planeación responde principalmente a preguntas como:

- ¿qué queremos lograr?
- ¿dónde estamos ahora?
- ¿qué recursos tenemos?
- ¿qué alternativas existen?
- ¿qué acciones deben realizarse?
- ¿quién debe realizarlas?
- ¿cuándo deben realizarse?
- ¿cómo sabremos si funcionaron?

Planear significa **pensar antes de actuar** y seleccionar un curso de acción orientado a objetivos.

---$BODY_327$, 6
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'por_qu_la_planeaci_n_antecede_a_la_acci_n_6', 'Por qué la planeación antecede a la acción', $BODY_328$Sin planeación, una organización corre mayor riesgo de:

- improvisar;
- duplicar esfuerzos;
- desperdiciar recursos;
- responder tarde a problemas previsibles;
- trabajar sin prioridades claras;
- evaluar resultados sin criterios definidos.

La planeación no elimina la incertidumbre, pero ayuda a manejarla.

### Ejemplo de enfermería

Si una unidad sabe que aumentará la demanda quirúrgica durante una semana, esperar a que falte personal para actuar sería una respuesta reactiva.

Planear implica anticipar:

- número probable de pacientes;
- personal disponible;
- insumos;
- camas;
- necesidades de coordinación.

---$BODY_328$, 7
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'pasos_de_la_planeaci_n_7', 'Pasos de la planeación', $BODY_329$Las formulaciones varían entre autores, pero el razonamiento general incluye:

1. **Conocer la situación actual.**
2. **Definir objetivos o resultados esperados.**
3. **Recolectar y analizar información relevante.**
4. **Identificar alternativas.**
5. **Comparar alternativas.**
6. **Seleccionar una decisión o curso de acción.**
7. **Desarrollar acciones de apoyo.**
8. **Implementar y posteriormente controlar.**

### Clave de examen

La planeación no consiste únicamente en “tener una idea”.

Debe traducirse en objetivos y acciones.

---$BODY_329$, 8
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_bien_formulados_8', 'Objetivos bien formulados', $BODY_330$Un objetivo administrativo orienta esfuerzos y permite evaluar resultados.

Un buen objetivo debe ser suficientemente claro para responder:

- ¿qué se pretende lograr?
- ¿en quién o en qué área?
- ¿en qué periodo?
- ¿cómo se reconocerá el cumplimiento?

### Débil

> Mejorar la puntualidad.

### Más útil

> Reducir durante el próximo trimestre la frecuencia de inicio tardío del pase de turno mediante revisión de horarios y seguimiento mensual.

La segunda formulación facilita organización y control.

---$BODY_330$, 9
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'investigaci_n_y_diagn_stico_administrativo_9', 'Investigación y diagnóstico administrativo', $BODY_331$Antes de decidir, el administrador necesita información.

Puede revisar:

- demanda;
- carga de trabajo;
- ausentismo;
- incidentes;
- recursos disponibles;
- tiempos de proceso;
- quejas;
- indicadores de calidad;
- competencias del personal;
- restricciones normativas o institucionales.

### Error frecuente

Decidir primero y buscar datos después para justificar la decisión.

---$BODY_331$, 10
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'alternativas_y_toma_de_decisiones_10', 'Alternativas y toma de decisiones', $BODY_332$Planear implica elegir entre cursos de acción.

Una decisión administrativa debe considerar, según el problema:

- beneficio esperado;
- seguridad;
- recursos;
- costos;
- tiempo;
- personal disponible;
- factibilidad;
- consecuencias previsibles;
- impacto sobre usuarios y equipo.

### En enfermería

Una solución administrativamente cómoda no es adecuada si compromete seguridad del paciente.

---$BODY_332$, 11
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'niveles_de_planeaci_n_11', 'Niveles de planeación', $BODY_333$La literatura administrativa suele distinguir niveles como:

## Estratégica

- largo alcance;
- dirección general de la organización;
- misión, visión y grandes objetivos;
- decisiones amplias.

## Táctica

- traduce estrategias en planes de áreas o departamentos;
- horizonte intermedio;
- mayor especificidad.

## Operativa

- actividades concretas;
- procedimientos;
- horarios;
- asignaciones;
- metas de corto plazo.

### Ejemplo

**Estratégica:** fortalecer seguridad del paciente institucional.  
**Táctica:** programa del departamento de enfermería para reducir eventos relacionados con medicamentos.  
**Operativa:** doble verificación definida para determinados medicamentos en cada turno.

---$BODY_333$, 12
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'instrumentos_de_planeaci_n_12', 'Instrumentos de planeación', $BODY_334$Los instrumentos ayudan a convertir un plan en algo ejecutable.

Pueden incluir:

- objetivos;
- políticas;
- programas;
- presupuestos;
- cronogramas;
- calendarios;
- rutas de actividades;
- procedimientos de seguimiento.

Balderas incluye dentro de este capítulo referencia a **PERT y CPM**.

Otros instrumentos administrativos se desarrollan con mayor detalle posteriormente en el temario del área, por lo que aquí se estudian de manera introductoria.

---$BODY_334$, 13
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'pert_y_cpm_enfoque_de_examen_13', 'PERT y CPM: enfoque de examen', $BODY_335$PERT y CPM son técnicas de planificación y programación de proyectos que ayudan a ordenar actividades y relaciones entre ellas.

Para ADMIN-05 interesa reconocer la idea general:

- un proyecto puede dividirse en actividades;
- algunas actividades dependen de otras;
- ciertas actividades condicionan la duración total;
- planificar ayuda a identificar secuencias y tiempos.

### No confundir

PERT/CPM no son organigramas.

Un organigrama representa principalmente **estructura organizacional**.

---$BODY_335$, 14
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'principios_pr_cticos_de_planeaci_n_14', 'Principios prácticos de planeación', $BODY_336$Una planeación útil debe procurar:

- orientación a objetivos;
- coherencia;
- flexibilidad;
- realismo;
- continuidad;
- participación cuando corresponda;
- uso de información;
- posibilidad de evaluación.

### Flexibilidad no significa improvisación

Significa poder modificar un plan cuando cambian condiciones relevantes.

---$BODY_336$, 15
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_concepto_15', 'Organización: concepto', $BODY_337$Organizar significa estructurar y coordinar recursos para ejecutar los planes.

Incluye decisiones sobre:

- actividades;
- puestos;
- responsabilidades;
- autoridad;
- recursos;
- relaciones;
- comunicación;
- coordinación.

OpenStax resume la organización como coordinación y asignación de recursos para llevar a cabo los planes.

---$BODY_337$, 16
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_formal_16', 'Organización formal', $BODY_338$La organización formal es la estructura establecida oficialmente.

Puede reflejarse en:

- organigramas;
- puestos;
- departamentos;
- líneas de autoridad;
- políticas;
- manuales;
- procedimientos.

### Ejemplo

```text
Dirección de Enfermería
       ↓
Supervisión
       ↓
Jefatura de unidad
       ↓
Personal de enfermería
```

La estructura real puede ser más compleja, pero el ejemplo muestra relaciones formales.

---$BODY_338$, 17
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_informal_17', 'Organización informal', $BODY_339$La organización informal surge de las relaciones espontáneas entre personas.

Puede incluir:

- redes de apoyo;
- líderes informales;
- grupos de afinidad;
- canales no oficiales de información;
- costumbres del equipo.

No es necesariamente negativa.

Puede facilitar cooperación, pero también puede difundir rumores o resistencias.

### Clave

**Formal** = estructura oficial.  
**Informal** = relaciones que emergen entre personas.

---$BODY_339$, 18
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'divisi_n_del_trabajo_y_departamentalizaci_n_18', 'División del trabajo y departamentalización', $BODY_340$Organizar exige distribuir el trabajo.

La división del trabajo busca que diferentes personas o unidades asuman actividades definidas.

La departamentalización agrupa tareas o funciones relacionadas.

En salud pueden existir áreas como:

- urgencias;
- hospitalización;
- quirófano;
- pediatría;
- cuidados intensivos;
- educación;
- calidad.

La división debe facilitar coordinación, no fragmentar innecesariamente el cuidado.

---$BODY_340$, 19
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'autoridad_responsabilidad_y_rendici_n_de_cuentas_19', 'Autoridad, responsabilidad y rendición de cuentas', $BODY_341$## Autoridad

Capacidad legítima que el puesto otorga para tomar determinadas decisiones o solicitar acciones.

## Responsabilidad

Obligación vinculada con las tareas asignadas.

## Rendición de cuentas

Deber de responder por resultados, decisiones o actuaciones dentro del rol.

### Clave

Recibir autoridad no elimina responsabilidad.

Delegar una tarea tampoco significa que desaparezca toda responsabilidad de supervisión del nivel que delega.

---$BODY_341$, 20
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cadena_de_mando_y_unidad_de_mando_20', 'Cadena de mando y unidad de mando', $BODY_342$## Cadena de mando

Línea formal que permite conocer:

- quién reporta a quién;
- quién supervisa;
- por qué vía se escalan asuntos.

## Unidad de mando

Principio clásico según el cual una persona debe tener claridad respecto de su jefatura directa.

### Problema de examen

Órdenes contradictorias provenientes de múltiples superiores sin coordinación pueden generar:

- confusión;
- duplicación;
- retrasos;
- errores.

---$BODY_342$, 21
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tramo_de_control_21', 'Tramo de control', $BODY_343$El tramo o amplitud de control se refiere al número de personas que un responsable supervisa directamente.

No existe una cifra universal apropiada para todos los servicios.

Depende de factores como:

- complejidad del trabajo;
- experiencia del personal;
- estabilidad del entorno;
- dispersión geográfica;
- cantidad de coordinación necesaria;
- capacidad del supervisor.

### En enfermería

Un servicio de alta complejidad puede requerir supervisión distinta a un equipo pequeño y estable.

---$BODY_343$, 22
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'centralizaci_n_y_descentralizaci_n_22', 'Centralización y descentralización', $BODY_344$## Centralización

Mayor concentración de decisiones en niveles superiores.

## Descentralización

Mayor distribución de capacidad decisoria hacia niveles inferiores o locales.

Ninguna es automáticamente mejor.

La decisión depende de:

- riesgo;
- competencia del personal;
- necesidad de respuesta rápida;
- tamaño de la organización;
- necesidad de uniformidad.

### Ejemplo

Una política institucional puede ser centralizada, mientras ciertas decisiones operativas del turno se resuelven localmente.

---$BODY_344$, 23
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'instrumentos_de_organizaci_n_23', 'Instrumentos de organización', $BODY_345$Balderas incluye entre los instrumentos organizativos:

- organigramas;
- normas;
- reglas;
- manuales;
- análisis de puestos;
- descripción de puestos;
- valoración de puestos.

Cada instrumento responde a una necesidad distinta.

---$BODY_345$, 24
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organigrama_24', 'Organigrama', $BODY_346$El organigrama representa gráficamente la estructura formal.

Puede ayudar a visualizar:

- niveles;
- departamentos;
- relaciones jerárquicas;
- dependencia formal.

### No muestra necesariamente

- calidad real del liderazgo;
- relaciones informales;
- clima laboral;
- competencia individual;
- todos los flujos de comunicación reales.

### Error de examen

Un organigrama no es un cronograma.

---$BODY_346$, 25
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'normas_reglas_y_manuales_25', 'Normas, reglas y manuales', $BODY_347$## Norma

Establece criterios o lineamientos que orientan comportamiento o funcionamiento.

## Regla

Suele expresar una instrucción concreta de cumplimiento definido.

## Manual

Reúne información organizada para orientar funciones, procedimientos, puestos o políticas.

### Utilidad

Estos instrumentos ayudan a reducir variabilidad, aclarar responsabilidades y facilitar continuidad.

---$BODY_347$, 26
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'an_lisis_descripci_n_y_valoraci_n_de_puestos_26', 'Análisis, descripción y valoración de puestos', $BODY_348$## Análisis de puesto

Estudia qué exige un puesto:

- tareas;
- responsabilidades;
- conocimientos;
- competencias;
- condiciones de trabajo.

## Descripción de puesto

Documenta de forma organizada esas funciones y responsabilidades.

## Valoración de puesto

Compara el valor relativo de puestos dentro de la organización según criterios establecidos.

### Clave

No son sinónimos.

---$BODY_348$, 27
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'se_ales_de_una_organizaci_n_deficiente_27', 'Señales de una organización deficiente', $BODY_349$Pueden incluir:

- funciones duplicadas;
- tareas que nadie asume;
- órdenes contradictorias;
- exceso de niveles sin utilidad;
- personal sin claridad de funciones;
- recursos mal distribuidos;
- problemas repetidos de coordinación;
- responsabilidades sin autoridad suficiente;
- autoridad sin rendición de cuentas.

### Enfermería

Si nadie sabe quién debe reponer un insumo crítico y el problema se repite, no es solamente un problema individual: puede existir una falla organizativa.

---$BODY_349$, 28
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'principios_pr_cticos_de_organizaci_n_28', 'Principios prácticos de organización', $BODY_350$Una organización eficaz busca:

- claridad de funciones;
- coordinación;
- autoridad proporcional a responsabilidades;
- líneas de comunicación conocidas;
- evitar duplicidad;
- continuidad;
- uso racional de recursos;
- adaptación a necesidades.

---$BODY_350$, 29
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'direcci_n_y_liderazgo_29', 'Dirección y liderazgo', $BODY_351$La dirección moviliza personas para ejecutar los planes y alcanzar objetivos.

Incluye:

- liderazgo;
- comunicación;
- motivación;
- coordinación;
- delegación;
- toma de decisiones;
- manejo de conflictos;
- orientación del personal.

### Clave

La planeación puede ser excelente, pero fracasar si nadie logra conducir su ejecución.

---$BODY_351$, 30
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'autoridad_formal_no_es_igual_a_liderazgo_30', 'Autoridad formal no es igual a liderazgo', $BODY_352$Una persona puede tener autoridad por el cargo, pero poca capacidad de influencia.

También puede existir una persona sin cargo directivo que influya fuertemente en el equipo.

### Autoridad

Proviene del puesto formal.

### Liderazgo

Se relaciona con la capacidad de influir, orientar y movilizar a otros.

Idealmente, un administrador utiliza la autoridad de forma legítima y además desarrolla liderazgo efectivo.

---$BODY_352$, 31
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'enfoques_de_liderazgo_31', 'Enfoques de liderazgo', $BODY_353$Balderas incluye dentro de este capítulo referencias a:

- rasgos;
- estilos de liderazgo;
- teorías situacionales.

Para el examen interesa reconocer que no existe un único estilo apropiado para todas las circunstancias.

La conducción puede requerir ajustes según:

- experiencia del equipo;
- gravedad del problema;
- urgencia;
- autonomía necesaria;
- conflicto;
- complejidad.

### Ejemplo

Una emergencia clínica requiere dirección más inmediata que una reunión de mejora de procesos, donde puede ser útil mayor participación.

---$BODY_353$, 32
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'motivaci_n_como_funci_n_directiva_32', 'Motivación como función directiva', $BODY_354$Motivar no significa simplemente “animar”.

En administración implica comprender factores que influyen en:

- esfuerzo;
- persistencia;
- compromiso;
- satisfacción;
- desempeño.

Balderas incluye varias teorías clásicas de motivación dentro del capítulo de funciones administrativas.

---$BODY_354$, 33
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'maslow_jerarqu_a_de_necesidades_33', 'Maslow: jerarquía de necesidades', $BODY_355$Maslow propuso una jerarquía de necesidades frecuentemente presentada como:

1. fisiológicas;
2. seguridad;
3. afiliación/sociales;
4. estima;
5. autorrealización.

### Aplicación administrativa clásica

Un trabajador preocupado por seguridad, estabilidad o necesidades básicas puede responder de manera diferente a incentivos de reconocimiento o desarrollo.

### Importante

La teoría es influyente, pero la investigación no respalda una progresión rígida universal en cinco niveles.

No debe utilizarse como una “ley” que predice exactamente a todas las personas.

---$BODY_355$, 34
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'herzberg_factores_higi_nicos_y_motivadores_34', 'Herzberg: factores higiénicos y motivadores', $BODY_356$Herzberg distinguió:

## Factores higiénicos

Relacionados con el contexto de trabajo, por ejemplo:

- condiciones;
- supervisión;
- seguridad;
- salario;
- políticas.

Su deficiencia puede producir insatisfacción.

## Motivadores

Relacionados con el contenido del trabajo, por ejemplo:

- logro;
- reconocimiento;
- responsabilidad;
- crecimiento.

### Clave

Eliminar una condición que causa insatisfacción no garantiza por sí solo alta motivación.

---$BODY_356$, 35
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'teor_a_de_la_expectativa_35', 'Teoría de la expectativa', $BODY_357$La teoría de la expectativa se concentra en la relación entre:

- esfuerzo;
- desempeño;
- resultados esperados;
- valor que la persona atribuye a esos resultados.

Una persona puede disminuir esfuerzo si piensa que:

- su esfuerzo no cambiará el resultado;
- el buen desempeño no será reconocido;
- el resultado ofrecido no tiene valor para ella.

### Aplicación

Un incentivo administrativo funciona mejor cuando el trabajador percibe una relación realista entre esfuerzo, desempeño y consecuencia.

---$BODY_357$, 36
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'mcclelland_logro_afiliaci_n_y_poder_36', 'McClelland: logro, afiliación y poder', $BODY_358$McClelland estudió tres necesidades aprendidas:

## Logro

Deseo de alcanzar resultados y superar retos.

## Afiliación

Deseo de pertenecer y mantener relaciones.

## Poder

Deseo de influir.

OpenStax distingue además entre el poder orientado al beneficio personal y el poder social orientado al logro del grupo u organización.

### En liderazgo

Influir para alcanzar objetivos colectivos es distinto de utilizar autoridad para dominar.

---$BODY_358$, 37
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'c_mo_usar_las_teor_as_de_motivaci_n_con_criterio_37', 'Cómo usar las teorías de motivación con criterio', $BODY_359$No utilizar teorías de motivación como etiquetas rígidas.

Evitar frases como:

> “Esta enfermera está en el nivel 3 de Maslow, por eso actuará así.”

La motivación real puede depender de:

- carga laboral;
- relaciones;
- percepción de justicia;
- liderazgo;
- seguridad;
- reconocimiento;
- oportunidades;
- valores personales;
- condiciones externas.

Las teorías ayudan a pensar; no reemplazan valoración del contexto.

---$BODY_359$, 38
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_administrativa_38', 'Comunicación administrativa', $BODY_360$La comunicación permite:

- transmitir objetivos;
- coordinar trabajo;
- recibir información;
- resolver problemas;
- dar retroalimentación;
- gestionar cambios;
- mantener continuidad.

Una estructura formal sin buena comunicación puede funcionar mal.

---$BODY_360$, 39
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'elementos_de_la_comunicaci_n_39', 'Elementos de la comunicación', $BODY_361$Un esquema básico incluye:

- emisor;
- mensaje;
- canal;
- receptor;
- retroalimentación;
- contexto;
- posibles interferencias o ruido.

### En administración

No basta con “enviar” un mensaje.

Hay que verificar comprensión cuando la información sea relevante para seguridad o funcionamiento.

---$BODY_361$, 40
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tipos_de_comunicaci_n_administrativa_40', 'Tipos de comunicación administrativa', $BODY_362$## Descendente

De niveles superiores hacia inferiores.

Ejemplos:

- instrucciones;
- políticas;
- prioridades.

## Ascendente

Desde niveles operativos hacia superiores.

Ejemplos:

- informes;
- incidentes;
- necesidades;
- sugerencias.

## Horizontal

Entre personas o unidades de nivel similar.

Ejemplos:

- coordinación entre servicios;
- continuidad entre equipos.

### Clave

Un sistema sano necesita comunicación en más de una dirección.

---$BODY_362$, 41
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'barreras_de_comunicaci_n_41', 'Barreras de comunicación', $BODY_363$Balderas incluye barreras como falta de claridad, redacción deficiente, no escuchar y omisiones.

En la práctica también pueden interferir:

- ruido;
- jerarquía intimidante;
- exceso de información;
- lenguaje ambiguo;
- suposiciones;
- falta de oportunidad;
- canales inadecuados;
- diferencias culturales o lingüísticas.

### Ejemplo de seguridad

Una instrucción verbal ambigua sobre un medicamento de alto riesgo no debe interpretarse por suposición.

Debe aclararse.

---$BODY_363$, 42
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'delegaci_n_42', 'Delegación', $BODY_364$Delegar significa asignar a otra persona determinadas tareas y el grado de autoridad necesario para realizarlas dentro de límites definidos.

La delegación puede:

- distribuir trabajo;
- desarrollar al personal;
- mejorar oportunidad;
- permitir que el responsable concentre atención en tareas de mayor complejidad.

### Pero

Delegar no es “desentenderse”.

---$BODY_364$, 43
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'principios_de_delegaci_n_43', 'Principios de delegación', $BODY_365$Antes de delegar deben considerarse:

- competencia de la persona;
- complejidad de la tarea;
- claridad de la instrucción;
- recursos;
- límites de autoridad;
- supervisión requerida;
- retroalimentación;
- responsabilidad profesional.

### En enfermería

Nunca debe utilizarse la delegación para asignar una actividad a alguien que no posee la preparación o autorización necesaria.

---$BODY_365$, 44
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'direcci_n_de_personal_44', 'Dirección de personal', $BODY_366$La dirección de personal incluye procesos que permiten incorporar y desarrollar personas para cumplir funciones organizativas.

Balderas incluye dentro del capítulo:

- reclutamiento;
- selección;
- orientación;
- adiestramiento;
- desarrollo de liderazgo;
- educación continuada.

Cada etapa responde a una necesidad diferente.

---$BODY_366$, 45
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'reclutamiento_y_selecci_n_45', 'Reclutamiento y selección', $BODY_367$## Reclutamiento

Busca atraer candidatos potencialmente adecuados.

## Selección

Busca valorar candidatos y escoger a quien mejor se ajuste al puesto según criterios legítimos.

### Error frecuente

Reclutamiento y selección no son sinónimos.

El primero genera candidatos; el segundo elige entre ellos.

---$BODY_367$, 46
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'orientaci_n_adiestramiento_y_desarrollo_46', 'Orientación, adiestramiento y desarrollo', $BODY_368$## Orientación

Ayuda a la persona a conocer:

- institución;
- servicio;
- normas;
- responsabilidades;
- equipo;
- funcionamiento.

## Adiestramiento/capacitación

Desarrolla habilidades para realizar tareas específicas.

## Desarrollo

Busca crecimiento más amplio y preparación para responsabilidades futuras.

### Ejemplo

Explicar políticas del servicio = orientación.  
Practicar manejo de un equipo nuevo = capacitación.  
Preparar a una enfermera para asumir liderazgo = desarrollo.

---$BODY_368$, 47
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'educaci_n_continuada_47', 'Educación continuada', $BODY_369$La competencia profesional necesita actualización.

La educación continuada puede responder a:

- nuevos equipos;
- procedimientos;
- incidentes;
- cambios normativos;
- necesidades detectadas;
- desarrollo profesional.

### Clave

Capacitar sin evaluar necesidades puede consumir recursos sin resolver problemas reales.

---$BODY_369$, 48
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'recursos_materiales_y_continuidad_operativa_48', 'Recursos materiales y continuidad operativa', $BODY_370$La función directiva y organizativa también requiere que los recursos materiales estén disponibles y sean utilizados adecuadamente.

En enfermería pueden incluir:

- insumos;
- equipos;
- medicamentos dentro de los sistemas institucionales correspondientes;
- material de protección;
- dispositivos clínicos.

El administrador debe coordinar disponibilidad, uso racional, reposición y comunicación de fallas con las áreas responsables.

### Seguridad

Un recurso disponible pero defectuoso no es un recurso utilizable.

---$BODY_370$, 49
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_concepto_49', 'Control: concepto', $BODY_371$Controlar significa verificar si la ejecución y los resultados se aproximan a lo planeado y actuar cuando existen desviaciones importantes.

No debe confundirse con vigilancia punitiva.

El control administrativo busca responder:

- ¿qué debía ocurrir?
- ¿qué ocurrió realmente?
- ¿qué diferencia existe?
- ¿por qué ocurrió?
- ¿qué debe corregirse o mantenerse?

---$BODY_371$, 50
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'prop_sitos_del_control_50', 'Propósitos del control', $BODY_372$El control ayuda a:

- medir desempeño;
- detectar desviaciones;
- identificar problemas;
- corregir procesos;
- proteger recursos;
- apoyar calidad;
- aportar información para nueva planeación.

### Clave

Sin estándares previos, controlar se vuelve subjetivo.

---$BODY_372$, 51
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'est_ndares_medici_n_y_comparaci_n_51', 'Estándares, medición y comparación', $BODY_373$El control requiere comparar realidad con un criterio.

Proceso básico:

1. definir estándar o resultado esperado;
2. medir lo ocurrido;
3. comparar;
4. analizar la diferencia;
5. actuar cuando corresponda.

### Ejemplo

Si existe una meta de completar determinada verificación antes de un procedimiento, primero debe definirse claramente qué significa cumplimiento antes de auditarlo.

---$BODY_373$, 52
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'supervisi_n_52', 'Supervisión', $BODY_374$La supervisión permite observar, orientar y dar seguimiento al trabajo.

Una supervisión efectiva puede incluir:

- acompañamiento;
- detección de necesidades;
- retroalimentación;
- apoyo;
- verificación de estándares;
- corrección oportuna.

### No debe reducirse a

“buscar errores”.

La supervisión también tiene función educativa y preventiva.

---$BODY_374$, 53
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'evaluaci_n_53', 'Evaluación', $BODY_375$Evaluar implica valorar resultados utilizando criterios definidos.

Puede orientarse a:

- desempeño;
- programas;
- procesos;
- calidad;
- cumplimiento de objetivos.

### Diferencia general

**Supervisión:** seguimiento cercano de ejecución.  
**Evaluación:** valoración sistemática de desempeño o resultados.

Pueden relacionarse, pero no son idénticas.

---$BODY_375$, 54
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'm_todos_y_t_cnicas_de_control_54', 'Métodos y técnicas de control', $BODY_376$Balderas incluye dentro del capítulo diversos mecanismos como:

- supervisión;
- evaluación;
- informes;
- archivo;
- auditoría.

En administración moderna también pueden utilizarse:

- indicadores;
- listas de verificación;
- tableros de seguimiento;
- análisis de incidentes;
- revisiones de cumplimiento.

La herramienta debe corresponder al objetivo que se quiere controlar.

---$BODY_376$, 55
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informes_archivo_y_auditor_a_55', 'Informes, archivo y auditoría', $BODY_377$## Informe

Comunica datos, hallazgos, actividades o resultados.

## Archivo/registro

Permite conservar información y trazabilidad.

## Auditoría

Examina sistemáticamente información o procesos frente a criterios establecidos.

### Clave

Un informe describe o comunica; una auditoría examina cumplimiento de manera estructurada.

---$BODY_377$, 56
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'pasos_del_control_56', 'Pasos del control', $BODY_378$Una secuencia útil es:

1. establecer criterios o estándares;
2. obtener información;
3. medir desempeño o resultado;
4. comparar con lo esperado;
5. identificar desviaciones relevantes;
6. analizar causas;
7. implementar acciones;
8. reevaluar.

El último paso es importante: corregir sin comprobar el efecto deja el ciclo incompleto.

---$BODY_378$, 57
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'acci_n_correctiva_y_retroalimentaci_n_57', 'Acción correctiva y retroalimentación', $BODY_379$La acción correctiva debe responder a la causa del problema.

Ejemplo:

Si existen retrasos porque un formulario es confuso, simplemente exigir “más rapidez” puede no resolver nada.

Puede ser necesario:

- rediseñar el formulario;
- aclarar responsabilidades;
- capacitar;
- modificar flujo;
- ajustar recursos.

### Retroalimentación

Los resultados del control alimentan nueva planeación.

---$BODY_379$, 58
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'principios_pr_cticos_de_control_58', 'Principios prácticos de control', $BODY_380$El control debe procurar ser:

- oportuno;
- objetivo;
- relacionado con metas;
- comprensible;
- proporcional al riesgo;
- orientado a mejora;
- capaz de generar acción.

### Error frecuente

Medir muchos datos sin utilizarlos no equivale a control efectivo.

---$BODY_380$, 59
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'relaci_n_planeaci_n_control_59', 'Relación planeación-control', $BODY_381$Planeación y control son funciones estrechamente relacionadas.

```text
PLANEAR
  ↓
Definir objetivo y estándar
  ↓
EJECUTAR
  ↓
CONTROLAR
  ↓
Comparar resultado
  ↓
AJUSTAR
  ↓
Nueva planeación
```

OpenStax destaca esta relación: la planeación establece criterios y el control aporta información para ciclos posteriores.

### Clave de examen

No puede existir buen control si nunca se definió qué se esperaba lograr.

---$BODY_381$, 60
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'la_toma_de_decisiones_atraviesa_todas_las_funcione_60', 'La toma de decisiones atraviesa todas las funciones', $BODY_382$Aunque suele destacarse dentro de planeación y dirección, decidir ocurre en todo el proceso.

## Planeación

Elegir objetivos y alternativas.

## Organización

Distribuir funciones y recursos.

## Dirección

Resolver prioridades y conducir personas.

## Control

Decidir cuándo una desviación necesita corrección.

### Competencia CICDE

El lineamiento enfatiza integrar conocimientos teórico-prácticos en solución de problemas y toma de decisiones.

---$BODY_382$, 61
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'seguridad_calidad_y_tica_administrativa_en_enferme_61', 'Seguridad, calidad y ética administrativa en enfermería', $BODY_383$La administración en enfermería no puede evaluarse solo por productividad.

También debe considerar:

- seguridad del paciente;
- calidad del cuidado;
- dignidad;
- confidencialidad;
- bioseguridad;
- uso responsable de recursos;
- comunicación profesional;
- competencia del personal.

### Ejemplo

Una reorganización que reduzca costos pero deje una unidad sin cobertura segura no es una buena decisión administrativa.

---$BODY_383$, 62
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'aplicaci_n_introductoria_a_enfermer_a_62', 'Aplicación introductoria a enfermería', $BODY_384$ADMIN-05 debe permitir reconocer las funciones en situaciones de enfermería sin desarrollar todavía todo ADMIN-07.

### Planeación

La jefa anticipa necesidad de personal para una jornada de alta demanda.

### Organización

Distribuye responsabilidades y recursos por áreas.

### Dirección

Comunica prioridades, resuelve dudas y orienta al equipo.

### Control

Revisa resultados, incidentes y cumplimiento para decidir ajustes.

Estas mismas funciones serán retomadas posteriormente de manera integrada en el proceso administrativo aplicado en enfermería.

---$BODY_384$, 63
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tabla_comparativa_de_funciones_63', 'Tabla comparativa de funciones', $BODY_385$| Función | Pregunta central | Acciones típicas | Ejemplo de enfermería |
|---|---|---|---|
| Planeación | ¿Qué queremos lograr y cómo? | Objetivos, alternativas, cronograma, recursos | Preparar cobertura para aumento de demanda |
| Organización | ¿Quién hará qué y con qué recursos? | Estructura, responsabilidades, autoridad | Distribuir personal y responsabilidades |
| Dirección | ¿Cómo movilizamos al equipo? | Liderazgo, comunicación, motivación, delegación | Comunicar prioridades y coordinar ejecución |
| Control | ¿Se logró lo esperado? | Medición, comparación, supervisión, corrección | Revisar indicadores y corregir desviaciones |

---$BODY_385$, 64
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'diferencias_que_deben_memorizarse_64', 'Diferencias que deben memorizarse', $BODY_386$| Concepto | Diferencia clave |
|---|---|
| Planeación | Decide objetivos y curso de acción |
| Organización | Estructura recursos y responsabilidades |
| Dirección | Conduce personas durante la ejecución |
| Control | Compara resultados con lo esperado |
| Autoridad | Poder legítimo del puesto |
| Liderazgo | Capacidad de influir y orientar |
| Reclutamiento | Atraer candidatos |
| Selección | Elegir candidato adecuado |
| Organización formal | Estructura oficial |
| Organización informal | Relaciones espontáneas |
| Supervisión | Seguimiento de ejecución |
| Evaluación | Valoración sistemática de resultados/desempeño |
| Informe | Comunica información |
| Auditoría | Examina cumplimiento con criterios |
| Organigrama | Representa estructura |
| Cronograma | Representa actividades en el tiempo |

---$BODY_386$, 65
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_examen_65', 'Errores frecuentes de examen', $BODY_387$1. Pensar que las funciones administrativas ocurren una sola vez y en secuencia rígida.
2. Confundir planeación con ejecución.
3. Creer que organizar significa únicamente hacer un organigrama.
4. Confundir autoridad con liderazgo.
5. Considerar organización informal siempre negativa.
6. Delegar sin valorar competencia.
7. Pensar que delegar elimina responsabilidad de supervisión.
8. Confundir reclutamiento con selección.
9. Usar Maslow como una ley rígida universal.
10. Creer que mejorar salario garantiza automáticamente motivación según Herzberg.
11. Confundir comunicación enviada con comunicación comprendida.
12. Considerar control como castigo.
13. Esperar al final para controlar sin seguimiento intermedio.
14. Medir sin estándares previos.
15. Confundir supervisión con auditoría.
16. Resolver problemas administrativos sin analizar causa.
17. Priorizar eficiencia sobre seguridad del paciente.
18. Confundir ADMIN-05 con ADMIN-07 y responder con aplicación demasiado específica cuando solo se pregunta por la función.

---$BODY_387$, 66
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estrategia_cicde_para_admin_05_66', 'Estrategia CICDE para ADMIN-05', $BODY_388$Ante una situación administrativa:

## Paso 1 — Identificar la pregunta

¿Se está hablando de:

- futuro y objetivos?
- estructura y recursos?
- conducción de personas?
- comparación de resultados?

## Paso 2 — Asociar la función

- futuro/objetivos → **planeación**;
- estructura/funciones → **organización**;
- liderazgo/comunicación/motivación → **dirección**;
- medición/desviación/corrección → **control**.

## Paso 3 — Buscar palabras clave secundarias

- organigrama → organización;
- delegación → dirección/organización según contexto;
- reclutamiento/selección → dirección de personal;
- supervisión/evaluación → control;
- objetivo/alternativa → planeación.

## Paso 4 — Priorizar seguridad

En enfermería, una alternativa administrativamente eficiente no debe elegirse si crea riesgo injustificado.

---$BODY_388$, 67
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'situaciones_originales_tipo_examen_67', 'Situaciones originales tipo examen', $BODY_389$## Caso 1 — Objetivo

La jefa define que en tres meses quiere disminuir retrasos en el pase de turno y establece una meta medible.

**Función predominante:** planeación.

**Razonamiento:** está definiendo un resultado esperado antes de actuar.

---

## Caso 2 — Datos antes de decidir

Antes de modificar horarios, la supervisora revisa ausentismo, carga de trabajo y demanda por turno.

**Función predominante:** planeación.

**Razonamiento:** está investigando la situación para apoyar una decisión.

---

## Caso 3 — Alternativas

Existen tres formas posibles de cubrir una semana de alta demanda. La jefa compara disponibilidad, costo y seguridad antes de elegir.

**Función predominante:** planeación/toma de decisiones.

---

## Caso 4 — Organigrama

El hospital quiere mostrar formalmente quién reporta a quién dentro del departamento de enfermería.

**Instrumento:** organigrama.

**Función predominante:** organización.

---

## Caso 5 — Duplicidad

Dos personas creen que ambas son responsables de la misma tarea, mientras otra actividad crítica no tiene responsable.

**Problema principal:** organización deficiente.

---

## Caso 6 — Líder informal

Una enfermera sin cargo de jefatura influye fuertemente en la actitud del equipo.

**Interpretación:** existe liderazgo/influencia informal; autoridad formal y liderazgo no son idénticos.

---

## Caso 7 — Delegación insegura

Una jefa asigna una actividad compleja a una persona que no ha demostrado competencia y no establece supervisión.

**Conducta administrativa:** delegación inadecuada.

**Prioridad:** corregir la asignación y proteger la seguridad.

---

## Caso 8 — Comunicación

Se envía por mensajería una instrucción ambigua sobre un cambio importante, pero nadie verifica que el equipo la comprendió.

**Problema:** falla de comunicación y retroalimentación.

---

## Caso 9 — Reclutamiento

El departamento publica una convocatoria para atraer candidatos a varias vacantes.

**Proceso:** reclutamiento.

---

## Caso 10 — Selección

Después de entrevistar candidatos y revisar competencias, se elige a quien cumple mejor el perfil.

**Proceso:** selección.

---

## Caso 11 — Orientación

Una enfermera nueva recibe explicación sobre políticas, estructura, turnos y canales de comunicación del servicio.

**Proceso:** orientación.

---

## Caso 12 — Motivación

Un equipo tiene salario estable, pero manifiesta poca oportunidad de reconocimiento y desarrollo. La jefa analiza contenido del trabajo y crecimiento profesional.

**Teoría útil para interpretar:** Herzberg.

---

## Caso 13 — Supervisión

La supervisora observa la ejecución de un procedimiento, ofrece retroalimentación inmediata y detecta necesidad de capacitación.

**Función predominante:** control mediante supervisión.

---

## Caso 14 — Auditoría

Un equipo revisa sistemáticamente registros para comprobar cumplimiento de un criterio institucional.

**Técnica:** auditoría.

---

## Caso 15 — Desviación

El indicador real está por debajo de la meta. La jefa identifica la causa, cambia el proceso y vuelve a medir.

**Función predominante:** control con acción correctiva y retroalimentación.

---

## Caso 16 — Seguridad frente a eficiencia

Una propuesta reduce costos, pero deja varios turnos con cobertura insuficiente para la complejidad de los pacientes.

**Mejor decisión:** no aprobarla en esa forma; revisar alternativas que protejan seguridad y calidad.

**Razonamiento:** la gestión de enfermería no puede separar eficiencia de seguridad del paciente.

---$BODY_389$, 68
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preguntas_r_pidas_de_repaso_68', 'Preguntas rápidas de repaso', $BODY_390$**1. ¿Cuál es la función que define objetivos y cursos de acción?**  
Planeación.

**2. ¿Cuál estructura personas, tareas y recursos?**  
Organización.

**3. ¿Cuál moviliza y orienta personas para ejecutar?**  
Dirección.

**4. ¿Cuál compara resultados con lo esperado?**  
Control.

**5. ¿Qué representa un organigrama?**  
La estructura formal de la organización.

**6. ¿Autoridad y liderazgo son iguales?**  
No. La autoridad proviene del puesto; el liderazgo implica influencia.

**7. ¿Delegar significa eliminar responsabilidad?**  
No.

**8. ¿Reclutar es seleccionar?**  
No. Reclutar atrae candidatos; seleccionar elige.

**9. ¿Qué teoría diferencia factores higiénicos y motivadores?**  
Herzberg.

**10. ¿Qué tres necesidades estudia McClelland?**  
Logro, afiliación y poder.

**11. ¿Qué función incluye supervisión y evaluación?**  
Control.

**12. ¿Qué relación existe entre planeación y control?**  
La planeación establece metas/estándares y el control aporta retroalimentación para ajustar futuros planes.

---$BODY_390$, 69
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fuentes_y_validaci_n_69', 'Fuentes y validación', $BODY_391$## Fuente rectora CICDE

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** _Lineamientos para el Examen de Competencias de Profesionales de Enfermería_. Tercera edición. Panamá, 2026.  
   Define `ADMIN-05` como **“Funciones administrativas”** y separa posteriormente `ADMIN-07` como **“Proceso administrativo aplicado en Enfermería”**.

## Bibliografía principal indicada por CICDE

2. **Balderas Pedrero, María de la Luz.** _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015. ISBN 9786071512413.  
   Página oficial del editor:  
   https://www.mheducation.com.mx/administracion-de-los-servicios-de-enfermeria-9786071512413-latam-group

   La tabla de contenidos oficial confirma el capítulo **“Funciones administrativas”** y sus ejes de planeación, organización, dirección/liderazgo, motivación, comunicación, delegación, dirección de personal y control.

   **Límite de uso:** este paquete utiliza la tabla de contenidos oficial para delimitar el alcance. No se afirma haber consultado íntegramente el capítulo ni se atribuyen páginas específicas no verificadas.

## Fuentes complementarias abiertas

3. **OpenStax. _Introduction to Business 2e — The Role of Management_.**  
   https://openstax.org/books/introduction-business-2e/pages/6-1-the-role-of-management

4. **OpenStax. _Principles of Management — The Planning Process_.**  
   https://openstax.org/books/principles-management/pages/17-2-the-planning-process

5. **OpenStax. _Introduction to Business 2e — Organizing_.**  
   https://openstax.org/books/introduction-business-2e/pages/6-3-organizing

6. **OpenStax. _Introduction to Business 2e — Authority: Establishing Organizational Relationships_.**  
   https://openstax.org/books/introduction-business-2e/pages/7-4-authority-establishing-organizational-relationships

7. **OpenStax. _Principles of Management — The Process of Managerial Communication_.**  
   https://openstax.org/books/principles-management/pages/16-1-the-process-of-managerial-communication

8. **OpenStax. _Organizational Behavior — Content Theories of Motivation_.**  
   https://openstax.org/books/organizational-behavior/pages/7-2-content-theories-of-motivation

9. **OpenStax. _Introduction to Business 2e — Controlling_.**  
   https://openstax.org/books/introduction-business-2e/pages/6-5-controlling

---$BODY_391$, 70
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'actualizaciones_y_l_mites_de_interpretaci_n_70', 'Actualizaciones y límites de interpretación', $BODY_392$## Sobre Balderas

La obra de Balderas es la referencia bibliográfica CICDE principal para Administración y su 7.ª edición está verificada bibliográficamente en McGraw-Hill.

Este paquete **no presenta como lectura directa del libro aquello que solo se confirmó mediante tabla de contenidos**.

## Sobre teorías de motivación

Maslow, Herzberg, McClelland y expectativa son marcos históricos y administrativos útiles, pero no deben utilizarse como reglas deterministas para predecir comportamiento individual.

## Sobre aplicación clínica

Este módulo utiliza ejemplos de enfermería para facilitar aprendizaje, pero reserva la integración formal del proceso administrativo aplicado a enfermería para ADMIN-07.

## Sobre instrumentos

Los instrumentos administrativos específicos de evaluación, dotación, informes y otros temas reaparecen en módulos posteriores del temario. Aquí se introducen solo cuando son necesarios para comprender la función correspondiente.

---$BODY_392$, 71
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_de_calidad_71', 'Control de calidad', $BODY_393$Este paquete fue elaborado con las siguientes reglas:

- alcance contrastado contra `CICDE_MASTER_SPEC.json`;
- `ADMIN-05` no tiene subtemas explícitos en CICDE, por lo que no se atribuyó una lista inventada al documento rector;
- expansión temática alineada con la tabla de contenidos oficial del capítulo 5 de Balderas 7.ª ed.;
- no se asumió acceso integral al texto de Balderas;
- funciones administrativas contrastadas con OpenStax;
- planeación y control presentados como ciclo con retroalimentación;
- organización formal e informal diferenciadas;
- autoridad, liderazgo, responsabilidad y delegación diferenciados;
- teorías de motivación presentadas sin convertirlas en reglas absolutas;
- control no se presenta como castigo, sino como medición, comparación y mejora;
- se mantuvo separación pedagógica entre ADMIN-05 y ADMIN-07;
- se incorporó aplicación introductoria a enfermería sin reemplazar el módulo posterior;
- se integraron seguridad, calidad y toma de decisiones como competencias transversales;
- las 16 situaciones tipo examen son originales;
- no se presentan como preguntas oficiales CICDE;
- no se declara revisión humana inexistente.

---$BODY_393$, 72
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estado_para_integraci_n_72', 'Estado para integración', $BODY_394$**Estado recomendado:** `REVIEW`

Motivo:

- alcance y fuentes fueron sometidos a revisión documental/académica;
- no existe todavía revisor humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` únicamente por revisión de IA.

**Cobertura CICDE ADMIN-05:** tema principal cubierto conforme al alcance disponible y delimitado con la bibliografía oficial indicada por CICDE.

**Situaciones originales tipo examen:** 16.$BODY_394$, 73
FROM admin_lesson_map WHERE topic_code = 'ADMIN-05';

-- ADMIN-06: Gestión del cuidado (71 sections)

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'alcance_oficial_cicde_0', 'Alcance oficial CICDE', $BODY_395$El temario CICDE 2026 incluye dentro del área **Administración** el tema:

> **Gestión del cuidado**

con dos subtemas explícitos que deben cubrirse íntegramente:

1. **Atención humanizada y de calidad.**
2. **Reunión de Planeación del Cuidado.**

Por tratarse de subtemas escritos expresamente en el lineamiento, este paquete no los sustituye por categorías creadas por el autor ni los diluye dentro de administración general.

La bibliografía base indicada por CICDE para Administración es **María de la Luz Balderas Pedrero, _Administración de los servicios de enfermería_, 7.ª edición, McGraw-Hill, 2015**. La tabla de contenidos oficial de la obra organiza la administración aplicada a enfermería alrededor de los servicios, los recursos humanos y la atención de enfermería; además incluye calidad de la atención, teorías de enfermería, proceso enfermero y proceso administrativo aplicado a la atención.

Para la actualización panameña se incorporan el **Código Deontológico para Enfermeras de Panamá**, la **Política Nacional de Salud 2026–2035** aprobada por Decreto Ejecutivo N.° 17 de 23 de marzo de 2026 y el **Decreto Ejecutivo N.° 29 de 5 de diciembre de 2025**, que instituyó el 2 de febrero como Día Nacional de la Humanización en la Atención y en los Servicios de Salud.

---$BODY_395$, 1
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_de_aprendizaje_1', 'Objetivos de aprendizaje', $BODY_396$Al finalizar el tema, el estudiante debe poder:

1. Explicar qué significa gestionar el cuidado de enfermería.
2. Diferenciar gestión del cuidado de la simple ejecución de tareas.
3. Relacionar gestión, proceso enfermero, calidad, seguridad y continuidad asistencial.
4. Reconocer los elementos de una atención humanizada y centrada en la persona.
5. Aplicar criterios de calidad a situaciones de enfermería.
6. Integrar dignidad, autonomía, privacidad, comunicación y participación familiar al cuidado.
7. Identificar riesgos organizativos que pueden deteriorar la calidad o seguridad.
8. Priorizar necesidades y problemas de cuidado según riesgo y condición del paciente.
9. Comprender el propósito de una Reunión de Planeación del Cuidado.
10. Organizar la información necesaria para una reunión de planeación.
11. Formular prioridades, objetivos, intervenciones, responsables y mecanismos de seguimiento.
12. Diferenciar una reunión de planeación del pase de turno, la ronda clínica o una simple presentación de caso.
13. Resolver situaciones tipo CICDE relacionadas con humanización, calidad y coordinación del cuidado.

---$BODY_396$, 2
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'concepto_de_gesti_n_del_cuidado_2', 'Concepto de gestión del cuidado', $BODY_397$La **gestión del cuidado** puede entenderse como la organización deliberada de conocimientos, decisiones, personas, tiempo, recursos e intervenciones para proporcionar cuidados de enfermería **seguros, integrales, continuos, oportunos y centrados en la persona**.

No se limita a ocupar un cargo administrativo. Una enfermera gestiona cuidado cuando:

- identifica necesidades;
- establece prioridades;
- planifica intervenciones;
- coordina recursos;
- comunica información relevante;
- delega de forma segura;
- supervisa;
- evalúa resultados;
- modifica el plan cuando la condición cambia.

La gestión convierte información clínica en un plan organizado de cuidado.

---$BODY_397$, 3
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'gestionar_el_cuidado_no_es_solamente_hacer_procedi_3', 'Gestionar el cuidado no es solamente “hacer procedimientos”', $BODY_398$Una lista de tareas completadas no garantiza un cuidado bien gestionado.

Ejemplo: dos pacientes pueden recibir sus medicamentos a la hora indicada, pero existir diferencias importantes en la calidad si en uno de ellos no se detectó deterioro respiratorio, no se verificó una alergia o no se coordinó una necesidad urgente.

Gestionar implica preguntarse continuamente:

- ¿qué necesita esta persona ahora?;
- ¿qué riesgo tiene?;
- ¿qué debe hacerse primero?;
- ¿quién puede hacerlo de forma segura?;
- ¿qué recursos se requieren?;
- ¿qué debe comunicarse?;
- ¿qué resultado esperamos?;
- ¿cómo sabremos si funcionó?

---$BODY_398$, 4
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'finalidad_de_la_gesti_n_del_cuidado_4', 'Finalidad de la gestión del cuidado', $BODY_399$La finalidad es favorecer resultados de salud y bienestar mediante una atención organizada y profesional.

En términos prácticos busca:

- proteger la vida y seguridad;
- mantener continuidad;
- disminuir omisiones y duplicaciones;
- utilizar razonablemente los recursos;
- coordinar al equipo;
- respetar derechos y preferencias;
- prevenir complicaciones;
- evaluar resultados;
- sostener la calidad incluso cuando el servicio tiene alta demanda.

---$BODY_399$, 5
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'principios_transversales_5', 'Principios transversales', $BODY_400$La gestión del cuidado debe integrar:

- enfoque centrado en la persona;
- seguridad del paciente;
- evidencia y juicio clínico;
- continuidad;
- comunicación efectiva;
- responsabilidad profesional;
- equidad;
- ética;
- trabajo interdisciplinario;
- uso responsable de recursos;
- evaluación y mejora continua.

Una decisión administrativamente cómoda no es necesariamente una decisión de cuidado correcta.

---$BODY_400$, 6
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'atenci_n_humanizada_concepto_pr_ctico_6', 'Atención humanizada: concepto práctico', $BODY_401$La humanización reconoce al paciente como **persona**, no como diagnóstico, cama, procedimiento o número de expediente.

Se expresa en acciones observables:

- presentarse e identificar al paciente correctamente;
- explicar antes de actuar;
- escuchar;
- preservar intimidad;
- controlar dolor y molestias;
- adaptar la comunicación;
- permitir participación;
- respetar valores y preferencias;
- evitar trato despectivo o infantilizante;
- acompañar situaciones de vulnerabilidad;
- coordinar para evitar abandono o fragmentación del cuidado.

Humanizar no significa abandonar normas técnicas. El cuidado humanizado debe ser también seguro y competente.

---$BODY_401$, 7
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'humanizaci_n_en_panam_contexto_2026_7', 'Humanización en Panamá: contexto 2026', $BODY_402$Panamá reforzó institucionalmente este enfoque mediante el **Decreto Ejecutivo N.° 29 de 5 de diciembre de 2025**, que instituyó el **2 de febrero como Día Nacional de la Humanización en la Atención y en los Servicios de Salud**.

El MINSA ha señalado que la humanización debe reflejarse en los distintos puntos de contacto con pacientes y familias y vincularse con dignidad, respeto, empatía, ética, comunicación efectiva y trato digno.

Para CICDE, el valor de este contexto no está en memorizar una fecha aislada, sino en comprender que en Panamá la humanización forma parte de una orientación vigente de los servicios de salud.

---$BODY_402$, 8
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'dignidad_8', 'Dignidad', $BODY_403$La dignidad implica reconocer valor propio a cada persona independientemente de:

- edad;
- diagnóstico;
- nivel educativo;
- condición económica;
- dependencia;
- conducta;
- origen;
- discapacidad;
- pronóstico.

Aplicaciones de enfermería:

- cubrir al paciente durante procedimientos;
- evitar comentarios humillantes;
- hablar con la persona y no solo sobre ella;
- respetar necesidades básicas;
- no normalizar esperas o molestias evitables;
- proporcionar cuidado respetuoso aun cuando el paciente no pueda expresarse.

---$BODY_403$, 9
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cuidado_centrado_en_la_persona_9', 'Cuidado centrado en la persona', $BODY_404$La calidad contemporánea incluye atención **centrada en la persona**: el cuidado responde a necesidades, valores y preferencias individuales y no únicamente a rutinas institucionales.

Esto supone:

- individualizar;
- informar;
- escuchar objetivos del paciente;
- considerar capacidades de autocuidado;
- reconocer a la familia cuando corresponde;
- coordinar el cuidado alrededor de necesidades reales.

Centrar el cuidado en la persona no significa aceptar una intervención insegura; implica dialogar, explicar riesgos y buscar decisiones compatibles con seguridad y derechos.

---$BODY_404$, 10
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'autonom_a_y_participaci_n_10', 'Autonomía y participación', $BODY_405$Una gestión humanizada favorece que la persona participe en su cuidado en la medida de sus capacidades.

La enfermera puede:

- ofrecer información comprensible dentro de su ámbito profesional;
- confirmar comprensión;
- preguntar preferencias;
- respetar decisiones válidas;
- facilitar preguntas;
- identificar barreras de comunicación;
- incorporar metas del paciente al plan cuando sea clínicamente posible.

La participación mejora la pertinencia del cuidado y reduce la tendencia a tratar a la persona como receptora pasiva.

---$BODY_405$, 11
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_humanizada_11', 'Comunicación humanizada', $BODY_406$La comunicación debe ser clara, respetuosa y ajustada a la condición de la persona.

Incluye:

- contacto apropiado;
- tono profesional;
- lenguaje comprensible;
- escucha activa;
- verificación de comprensión;
- oportunidad para preguntas;
- comunicación de cambios relevantes al equipo.

Una explicación apresurada, técnicamente correcta pero incomprensible, no cumple plenamente el propósito de la comunicación clínica.

---$BODY_406$, 12
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'familia_y_red_de_apoyo_12', 'Familia y red de apoyo', $BODY_407$La familia puede ser:

- fuente de información;
- apoyo emocional;
- participante de educación;
- colaboradora en continuidad del cuidado.

Su participación debe respetar:

- voluntad del paciente;
- privacidad;
- capacidad y límites del familiar;
- seguridad;
- normas institucionales.

No debe transferirse a la familia una responsabilidad que corresponde al profesional.

---$BODY_407$, 13
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'privacidad_y_confidencialidad_13', 'Privacidad y confidencialidad', $BODY_408$La humanización incluye proteger información y espacio personal.

La gestión del servicio debe reducir riesgos como:

- discutir información clínica en áreas públicas;
- dejar expedientes o pantallas expuestos;
- realizar procedimientos sin cubrir al paciente;
- compartir información con personas no autorizadas;
- usar fotografías o mensajería sin controles apropiados.

La privacidad no es un detalle de cortesía: forma parte de derechos y ética profesional.

---$BODY_408$, 14
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cultura_espiritualidad_y_preferencias_14', 'Cultura, espiritualidad y preferencias', $BODY_409$El cuidado integral considera dimensiones culturales, sociales y espirituales cuando son relevantes para la persona.

La enfermera debe evitar dos extremos:

- ignorarlas por considerarlas “no clínicas”;
- aceptar prácticas que generen un riesgo grave sin explicar o intervenir.

La conducta profesional es explorar, dialogar, respetar cuando sea posible y buscar alternativas seguras.

---$BODY_409$, 15
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'empat_a_y_l_mites_profesionales_15', 'Empatía y límites profesionales', $BODY_410$Empatía es comprender y responder de forma sensible a la experiencia de otra persona.

No equivale a:

- prometer resultados imposibles;
- involucrarse de manera que se pierda juicio profesional;
- aceptar abuso o violencia;
- ocultar información clínica relevante;
- sustituir decisiones de la persona.

La relación terapéutica combina cercanía humana con límites profesionales.

---$BODY_410$, 16
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'confort_dolor_y_necesidades_b_sicas_16', 'Confort, dolor y necesidades básicas', $BODY_411$La humanización también se demuestra atendiendo necesidades aparentemente sencillas:

- dolor;
- posición;
- higiene;
- eliminación;
- descanso;
- sed o alimentación cuando estén permitidas;
- temperatura;
- ansiedad;
- necesidad de información.

Una organización que cumple procedimientos complejos pero deja necesidades básicas desatendidas presenta una brecha de calidad del cuidado.

---$BODY_411$, 17
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'calidad_concepto_17', 'Calidad: concepto', $BODY_412$La OMS define la calidad de la atención como el grado en que los servicios de salud aumentan la probabilidad de obtener resultados deseados y son coherentes con el conocimiento profesional basado en evidencia.

En enfermería, calidad significa proporcionar cuidados que sean técnicamente correctos y, al mismo tiempo, seguros, oportunos, humanos y evaluables.

La calidad no se presume: debe observarse, medirse y mejorarse.

---$BODY_412$, 18
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'dimensiones_de_calidad_18', 'Dimensiones de calidad', $BODY_413$La OMS señala que los servicios de calidad deben ser:

1. **eficaces**;
2. **seguros**;
3. **centrados en la persona**;
4. **oportunos**;
5. **equitativos**;
6. **integrados**;
7. **eficientes**.

Estas dimensiones ayudan a analizar problemas administrativos y clínicos sin reducir calidad a “ser amable” o “seguir protocolos”.

---$BODY_413$, 19
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'eficacia_19', 'Eficacia', $BODY_414$Cuidado eficaz = intervención apropiada, basada en conocimiento profesional y dirigida a una necesidad real.

Ejemplo: repetir rutinariamente una intervención sin indicación actual no mejora calidad aunque esté bien ejecutada.

Para examen, pregunte:

> ¿La intervención elegida tiene relación con el problema y el resultado esperado?

---$BODY_414$, 20
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'seguridad_20', 'Seguridad', $BODY_415$Cuidado seguro busca evitar daño prevenible.

Incluye:

- identificación correcta;
- administración segura de medicamentos;
- prevención de caídas y lesiones;
- control de infecciones;
- vigilancia de deterioro;
- equipos funcionales;
- comunicación de órdenes dudosas;
- supervisión de tareas delegadas.

La seguridad tiene prioridad cuando existe riesgo inmediato.

---$BODY_415$, 21
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'oportunidad_21', 'Oportunidad', $BODY_416$Una atención puede ser correcta pero llegar demasiado tarde.

Ejemplos de retrasos perjudiciales:

- no escalar un deterioro;
- posponer analgesia sin razón;
- retrasar una intervención prioritaria por completar trámites;
- esperar el final del turno para comunicar un cambio significativo.

Oportunidad = hacer lo correcto en el momento necesario.

---$BODY_416$, 22
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'equidad_22', 'Equidad', $BODY_417$La calidad no debe disminuir por características personales o sociales.

La gestión debe identificar barreras relacionadas con:

- idioma;
- discapacidad;
- ubicación;
- pobreza;
- edad;
- estigma;
- dependencia.

Equidad no significa dar exactamente lo mismo a todos; implica responder justamente a necesidades diferentes.

---$BODY_417$, 23
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'integraci_n_y_continuidad_23', 'Integración y continuidad', $BODY_418$La atención integrada evita que cada profesional actúe como una isla.

Requiere:

- información compartida de manera segura;
- objetivos compatibles;
- coordinación entre turnos y servicios;
- referencias claras;
- continuidad al egreso;
- seguimiento de problemas pendientes.

La fragmentación aumenta riesgo de omisiones y duplicaciones.

---$BODY_418$, 24
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'eficiencia_24', 'Eficiencia', $BODY_419$Eficiencia busca el mejor uso de los recursos disponibles evitando desperdicio.

No significa reducir recursos de forma indiscriminada.

Una medida es ineficiente si ahorra material o tiempo a corto plazo pero incrementa complicaciones, repeticiones, eventos adversos o estancia innecesaria.

En enfermería, eficiencia siempre debe evaluarse junto con seguridad y calidad.

---$BODY_419$, 25
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'calidad_seg_n_el_c_digo_deontol_gico_de_anep_25', 'Calidad según el Código Deontológico de ANEP', $BODY_420$El Código Deontológico para Enfermeras de Panamá vincula calidad con ayuda eficiente y efectiva a la persona, familia y comunidad, sustentada en valores y estándares técnico-científicos, sociales, humanos y éticos.

Esto refuerza una idea central del tema:

> **calidad técnica y humanización no son competidoras; forman parte del mismo cuidado profesional.**

---$BODY_420$, 26
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'humanizaci_n_calidad_y_seguridad_relaci_n_26', 'Humanización, calidad y seguridad: relación', $BODY_421$Pueden diferenciarse, pero deben coexistir.

- **Humanización:** cómo se reconoce y trata a la persona.
- **Calidad:** qué tan apropiado y consistente es el servicio para alcanzar resultados deseados.
- **Seguridad:** prevención del daño asociado a la atención.

Un cuidado amable pero inseguro no es de calidad.

Un cuidado técnicamente correcto pero humillante tampoco representa una atención integral de calidad.

---$BODY_421$, 27
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'seguridad_del_paciente_como_componente_de_gesti_n_27', 'Seguridad del paciente como componente de gestión', $BODY_422$La OMS mantiene la seguridad del paciente como componente fundamental de la atención de calidad.

Desde gestión del cuidado, la enfermera debe anticipar riesgos y crear barreras de protección:

- comprobar;
- estandarizar cuando sea útil;
- comunicar;
- reevaluar;
- registrar;
- supervisar;
- reportar eventos conforme a política;
- aprender de fallas.

La seguridad se gestiona antes, durante y después de una intervención.

---$BODY_422$, 28
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'priorizaci_n_cl_nica_28', 'Priorización clínica', $BODY_423$Gestionar implica decidir qué necesita atención primero.

Criterios frecuentes:

1. amenaza a vida o función;
2. riesgo de deterioro;
3. seguridad;
4. necesidades fisiológicas urgentes;
5. dolor o sufrimiento importante;
6. intervenciones tiempo-dependientes;
7. educación y necesidades no urgentes.

La prioridad no siempre coincide con el orden en que aparecieron las tareas.

---$BODY_423$, 29
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'distribuci_n_de_recursos_29', 'Distribución de recursos', $BODY_424$La asignación de personal, tiempo, materiales y equipos debe considerar:

- complejidad del paciente;
- dependencia;
- carga de trabajo;
- competencias del personal;
- procedimientos programados;
- aislamiento o vigilancia especial;
- cambios esperados durante el turno.

Repartir el mismo número de pacientes a cada persona sin analizar complejidad puede ser aparentemente “igual” pero poco seguro.

---$BODY_424$, 30
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'delegaci_n_y_asignaci_n_segura_30', 'Delegación y asignación segura', $BODY_425$Antes de asignar o delegar una actividad se valora:

- condición del paciente;
- complejidad de la tarea;
- competencia de quien la realizará;
- claridad de instrucciones;
- posibilidad de supervisión;
- resultado esperado.

La responsabilidad profesional no desaparece por delegar.

Si el paciente se inestabiliza o la tarea supera la competencia disponible, debe reevaluarse la asignación.

---$BODY_425$, 31
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'supervisi_n_31', 'Supervisión', $BODY_426$Supervisar no significa vigilar para castigar.

Una supervisión orientada a calidad busca:

- confirmar que el cuidado se realiza;
- identificar dificultades;
- corregir prácticas inseguras;
- apoyar al personal;
- evaluar resultados;
- detectar necesidades de capacitación.

La supervisión efectiva produce información para mejorar el servicio.

---$BODY_426$, 32
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'documentaci_n_32', 'Documentación', $BODY_427$La documentación sostiene continuidad, seguridad y responsabilidad profesional.

Debe reflejar:

- valoración relevante;
- problemas/prioridades;
- intervenciones;
- respuesta;
- educación;
- comunicación importante;
- cambios del plan.

Registrar una intervención que no se realizó o documentar de manera vaga deteriora calidad y trazabilidad.

---$BODY_427$, 33
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'indicadores_y_resultados_33', 'Indicadores y resultados', $BODY_428$La gestión requiere observar resultados, no solamente actividades.

Ejemplos de áreas que pueden medirse:

- caídas;
- lesiones por presión;
- errores de medicación;
- infecciones asociadas a atención;
- cumplimiento de valoraciones;
- dolor reevaluado;
- satisfacción/experiencia del usuario;
- continuidad de educación;
- tiempos de respuesta.

Un indicador aislado debe interpretarse en contexto y utilizarse para mejora, no solo para producir estadísticas.

---$BODY_428$, 34
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'mejora_continua_34', 'Mejora continua', $BODY_429$La calidad no es un estado permanente.

Proceso básico:

```text
Identificar problema
      ↓
Analizar causas
      ↓
Diseñar cambio
      ↓
Implementar
      ↓
Medir resultado
      ↓
Ajustar / sostener
```

La mejora continua transforma errores, indicadores y observaciones del servicio en oportunidades de aprendizaje.

---$BODY_429$, 35
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'eventos_incidentes_y_aprendizaje_35', 'Eventos, incidentes y aprendizaje', $BODY_430$Cuando ocurre un evento adverso o un error, la prioridad inmediata es la seguridad del paciente.

Después corresponde:

- comunicar según canales clínicos;
- documentar de forma veraz;
- aplicar el sistema institucional de reporte;
- analizar causas;
- introducir medidas preventivas.

Una cultura que castiga automáticamente todo reporte puede favorecer ocultamiento; una cultura de aprendizaje no elimina la responsabilidad individual ante conductas imprudentes o deliberadas.

---$BODY_430$, 36
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'pae_y_gesti_n_del_cuidado_36', 'PAE y gestión del cuidado', $BODY_431$El **Proceso de Atención de Enfermería** proporciona una estructura clínica para gestionar cuidado:

- valoración;
- diagnóstico/juicio de enfermería;
- planificación;
- ejecución;
- evaluación.

La gestión agrega la dimensión organizativa necesaria para hacer posible el plan: personal, tiempo, coordinación, recursos, comunicación y seguimiento.

Por ello PAE y administración no deben estudiarse como mundos separados.

---$BODY_431$, 37
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'plan_de_cuidados_individualizado_37', 'Plan de cuidados individualizado', $BODY_432$Un buen plan responde a la persona concreta.

Debe relacionar:

```text
Datos → problema/necesidad → prioridad → objetivo → intervención → evaluación
```

Errores frecuentes:

- copiar planes sin adaptar;
- listar intervenciones sin objetivo;
- formular objetivos imposibles de medir;
- no modificar el plan cuando la condición cambia.

---$BODY_432$, 38
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'continuidad_entre_turnos_y_servicios_38', 'Continuidad entre turnos y servicios', $BODY_433$Una transición insegura puede perder información crítica.

Al cambiar turno, unidad o nivel de atención deben quedar claros:

- situación actual;
- riesgos;
- intervenciones pendientes;
- respuesta a tratamientos;
- dispositivos;
- alergias;
- precauciones;
- educación pendiente;
- necesidad de seguimiento.

La continuidad es responsabilidad compartida, pero requiere comunicación estructurada.

---$BODY_433$, 39
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'coordinaci_n_interprofesional_39', 'Coordinación interprofesional', $BODY_434$La gestión del cuidado exige reconocer cuándo un problema necesita participación de otros profesionales.

Ejemplos:

- nutrición;
- fisioterapia;
- trabajo social;
- farmacia;
- salud mental;
- medicina;
- terapia respiratoria.

Coordinar no significa transferir el problema y olvidarlo. Enfermería mantiene seguimiento de cómo esa intervención se integra al cuidado global.

---$BODY_434$, 40
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'reuni_n_de_planeaci_n_del_cuidado_concepto_40', 'Reunión de Planeación del Cuidado: concepto', $BODY_435$El CICDE menciona explícitamente **“Reunión de Planeación del Cuidado”** dentro de Gestión del cuidado.

Para este paquete se entiende como una actividad organizada en la que se **presenta, analiza y coordina el cuidado de una persona**, utilizando datos de valoración y razonamiento de enfermería para establecer prioridades, objetivos, intervenciones, responsables y seguimiento.

No se identificó en las fuentes oficiales consultadas una norma nacional única que imponga un formato, duración o secuencia universal para esta reunión. Por ello, este material enseña sus **principios funcionales** y evita presentar una plantilla local específica como regla CICDE.

---$BODY_435$, 41
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'qu_es_y_qu_no_es_la_reuni_n_de_planeaci_n_41', 'Qué es y qué no es la reunión de planeación', $BODY_436$**Es:**

- análisis organizado del caso;
- priorización;
- planificación;
- coordinación;
- distribución de actividades;
- anticipación de riesgos;
- seguimiento.

**No es solamente:**

- leer el expediente;
- recitar el diagnóstico médico;
- enumerar medicamentos;
- exponer teoría sin relacionarla con el paciente;
- repetir todo lo ocurrido sin tomar decisiones.

La reunión debe terminar con un **plan claro**.

---$BODY_436$, 42
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'prop_sitos_de_la_reuni_n_42', 'Propósitos de la reunión', $BODY_437$Puede utilizarse para:

- compartir información relevante;
- identificar necesidades;
- establecer prioridades;
- coordinar cuidados;
- anticipar complicaciones;
- distribuir responsabilidades;
- organizar tiempos;
- integrar educación;
- favorecer continuidad;
- evaluar avances del plan.

Su valor está en transformar información dispersa en acción coordinada.

---$BODY_437$, 43
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'participantes_43', 'Participantes', $BODY_438$Los participantes dependen del contexto.

Pueden incluir:

- enfermera responsable;
- jefatura/supervisión;
- personal de enfermería involucrado;
- estudiantes bajo supervisión;
- otros profesionales cuando el problema requiere coordinación;
- paciente y familia en componentes apropiados del plan.

No todos necesitan estar físicamente presentes en todas las reuniones. Lo esencial es que las decisiones relevantes se comuniquen a quienes deben ejecutarlas.

---$BODY_438$, 44
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preparaci_n_de_la_reuni_n_44', 'Preparación de la reunión', $BODY_439$Antes de reunirse debe organizarse información suficiente:

- identificación del paciente;
- motivo de atención;
- diagnósticos relevantes;
- antecedentes;
- alergias;
- valoración actual;
- signos vitales/tendencias;
- resultados importantes;
- medicamentos o terapias críticas;
- dispositivos;
- riesgos;
- respuesta al cuidado;
- educación y necesidades sociales.

La preparación evita una reunión larga pero improductiva.

---$BODY_439$, 45
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'presentaci_n_sint_tica_del_paciente_45', 'Presentación sintética del paciente', $BODY_440$La presentación debe resaltar lo que influye en decisiones de cuidado.

Ejemplo de lógica:

```text
Quién es → por qué está aquí → situación actual → riesgos → necesidades → prioridades
```

Una historia cronológica exhaustiva puede ocultar el problema principal.

Para examen, la capacidad de **sintetizar** es una competencia: separar datos relevantes de datos secundarios.

---$BODY_440$, 46
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'identificaci_n_de_necesidades_y_problemas_46', 'Identificación de necesidades y problemas', $BODY_441$Después de presentar datos se identifican necesidades reales y riesgos potenciales.

Pueden ser:

- respiratorias;
- circulatorias;
- dolor;
- movilidad;
- nutrición;
- eliminación;
- integridad cutánea;
- seguridad;
- ansiedad;
- conocimiento;
- autocuidado;
- apoyo familiar/social.

No todas tienen la misma prioridad.

---$BODY_441$, 47
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'priorizaci_n_en_la_reuni_n_47', 'Priorización en la reunión', $BODY_442$La reunión debe responder:

> **¿Qué requiere atención primero y por qué?**

Criterios útiles:

- amenaza inmediata;
- posibilidad de deterioro;
- gravedad;
- seguridad;
- tiempo-dependencia;
- necesidades expresadas por el paciente;
- recursos disponibles.

Un problema crónico importante puede quedar temporalmente después de una amenaza respiratoria aguda.

---$BODY_442$, 48
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'diagn_sticos_y_juicios_de_enfermer_a_48', 'Diagnósticos y juicios de enfermería', $BODY_443$El plan debe basarse en respuestas humanas y necesidades identificadas, no limitarse al diagnóstico médico.

Ejemplo:

**Diagnóstico médico:** neumonía.

**Problemas de cuidado posibles:**

- dificultad respiratoria;
- intolerancia a actividad;
- secreciones;
- fiebre;
- hidratación;
- ansiedad;
- educación.

La gestión se organiza alrededor de las necesidades concretas que enfermería debe vigilar e intervenir.

---$BODY_443$, 49
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_y_resultados_esperados_49', 'Objetivos y resultados esperados', $BODY_444$Cada prioridad debe vincularse con un resultado esperado.

Los objetivos deben ser:

- claros;
- pertinentes;
- observables o medibles cuando sea posible;
- realistas;
- relacionados con un tiempo razonable.

Ejemplo débil:

> “Paciente mejorará.”

Ejemplo más útil:

> “Mantendrá saturación y trabajo respiratorio dentro del objetivo clínico establecido durante el turno y no presentará signos de deterioro.”

---$BODY_444$, 50
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'selecci_n_de_intervenciones_50', 'Selección de intervenciones', $BODY_445$Las intervenciones se eligen según:

- prioridad;
- evidencia y normas;
- prescripciones aplicables;
- ámbito profesional;
- condición del paciente;
- recursos;
- preferencias y educación.

La reunión debe evitar listas genéricas de cuidados que no guardan relación con el problema identificado.

---$BODY_445$, 51
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'asignaci_n_de_responsabilidades_51', 'Asignación de responsabilidades', $BODY_446$Un plan incompleto dice **qué hacer** pero no deja claro **quién lo hará**.

La coordinación puede especificar:

- responsable principal;
- actividad delegada;
- supervisión requerida;
- momento esperado;
- comunicación del resultado.

La asignación debe respetar competencias y condición del paciente.

---$BODY_446$, 52
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tiempo_y_recursos_52', 'Tiempo y recursos', $BODY_447$La planeación también requiere determinar:

- qué intervención es inmediata;
- qué puede programarse;
- qué equipo se necesita;
- qué recurso humano se requiere;
- qué actividad depende de otra;
- qué retraso sería peligroso.

Administrar tiempo no es llenar cada minuto de actividades: es proteger las prioridades.

---$BODY_447$, 53
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'participaci_n_del_paciente_y_familia_en_la_planeac_53', 'Participación del paciente y familia en la planeación', $BODY_448$Cuando la condición lo permite, el plan mejora si incorpora:

- metas del paciente;
- preferencias;
- barreras;
- capacidad de autocuidado;
- recursos familiares;
- necesidades de educación.

Ejemplo: un plan de alta que ignora que el paciente no comprende el régimen terapéutico o no tiene acceso a recursos puede ser técnicamente completo pero poco viable.

---$BODY_448$, 54
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_durante_la_reuni_n_54', 'Comunicación durante la reunión', $BODY_449$La reunión debe favorecer:

- presentación ordenada;
- lenguaje profesional;
- preguntas pertinentes;
- aclaración de discrepancias;
- respeto entre participantes;
- foco en soluciones;
- protección de confidencialidad.

Discutir culpas personales sin analizar riesgos o soluciones reduce el valor de la reunión.

---$BODY_449$, 55
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cierre_y_documentaci_n_de_acuerdos_55', 'Cierre y documentación de acuerdos', $BODY_450$Al terminar deben quedar claros:

- problemas prioritarios;
- objetivos;
- intervenciones;
- responsables;
- pendientes;
- cuándo reevaluar;
- qué cambios requieren escalar.

Los acuerdos relevantes deben trasladarse al sistema formal de documentación y comunicación del servicio según corresponda.

La reunión no sustituye el registro clínico.

---$BODY_450$, 56
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'seguimiento_y_evaluaci_n_56', 'Seguimiento y evaluación', $BODY_451$La planeación no termina cuando concluye la reunión.

Se evalúa:

- ¿se realizaron las intervenciones?;
- ¿el paciente respondió?;
- ¿aparecieron nuevos datos?;
- ¿cambió la prioridad?;
- ¿es necesario modificar el plan?;
- ¿hay actividades pendientes?

Un plan que no se reevalúa se vuelve rápidamente obsoleto en pacientes cambiantes.

---$BODY_451$, 57
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_en_una_reuni_n_de_planeaci_n_57', 'Errores frecuentes en una reunión de planeación', $BODY_452$1. Presentar datos sin priorizar.
2. Leer literalmente el expediente.
3. Centrarse solo en el diagnóstico médico.
4. Formular un plan sin participación del equipo que lo ejecutará.
5. No considerar preferencias del paciente.
6. Proponer intervenciones sin objetivo.
7. No asignar responsables.
8. Ignorar recursos o tiempos.
9. Omitir riesgos potenciales.
10. Terminar sin plan de reevaluación.
11. Convertir la reunión en sesión de culpabilización.
12. Compartir información clínica fuera de un contexto autorizado.

---$BODY_452$, 58
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'diferencia_con_otras_actividades_cl_nicas_58', 'Diferencia con otras actividades clínicas', $BODY_453$### Pase de turno
Transfiere responsabilidad e información entre turnos. Puede incluir planificación, pero su propósito central es continuidad inmediata.

### Ronda clínica
Implica revisión del paciente, frecuentemente al lado de la cama, para valorar evolución y decisiones.

### Conferencia de caso
Puede tener finalidad docente, diagnóstica o interdisciplinaria más amplia.

### Reunión de Planeación del Cuidado
Se centra en **organizar el cuidado**: prioridades, objetivos, intervenciones, responsables y seguimiento.

En la práctica pueden superponerse, pero conceptualmente no son idénticas.

---$BODY_453$, 59
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'relaci_n_con_admin_05_y_admin_07_59', 'Relación con ADMIN-05 y ADMIN-07', $BODY_454$Para evitar duplicaciones:

- **ADMIN-05 — Funciones administrativas:** estudia planeación, organización, dirección y control como funciones de administración.
- **ADMIN-06 — Gestión del cuidado:** aplica organización y coordinación al cuidado humanizado, de calidad y a la reunión de planeación.
- **ADMIN-07 — Proceso administrativo aplicado en Enfermería:** integrará explícitamente planeación, organización, dirección/liderazgo, toma de decisiones y control/supervisión como proceso administrativo aplicado.

ADMIN-06 funciona como puente entre teoría administrativa y cuidado clínico organizado.

---$BODY_454$, 60
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'marco_tico_y_profesional_60', 'Marco ético y profesional', $BODY_455$El Código Deontológico de ANEP establece responsabilidades que se relacionan directamente con gestión del cuidado:

- proteger bienestar y dignidad;
- promover autonomía;
- proteger privacidad;
- reconocer derechos;
- intervenir ante prácticas que amenacen salud o seguridad;
- anteponer bienestar del paciente a intereses personales;
- proporcionar cuidados con calidad.

Por ello la gestión no es solo eficiencia operativa: incluye responsabilidad ética.

---$BODY_455$, 61
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'pol_tica_nacional_de_salud_panam_2026_2035_61', 'Política Nacional de Salud Panamá 2026–2035', $BODY_456$La Política Nacional de Salud 2026–2035, aprobada por Decreto Ejecutivo N.° 17 de 23 de marzo de 2026, orienta el sistema hacia el derecho a la salud, equidad y calidad.

Para ADMIN-06 sirve como contexto actual de Panamá:

- la calidad no es solamente una meta de cada sala;
- forma parte de la dirección estratégica del sistema;
- la atención debe vincular organización, derechos, equidad y resultados.

No se utiliza esta política para atribuirle subtemas CICDE que no aparecen en el lineamiento; se incorpora como actualización oficial del contexto de gestión sanitaria.

---$BODY_456$, 62
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estrategia_cicde_para_admin_06_62', 'Estrategia CICDE para ADMIN-06', $BODY_457$Ante una situación de examen:

**Paso 1:** identificar si el problema principal es humanización, calidad, seguridad o coordinación.

**Paso 2:** buscar primero amenazas inmediatas a seguridad.

**Paso 3:** identificar qué necesita la persona, no solo qué tarea está pendiente.

**Paso 4:** decidir prioridad y resultado esperado.

**Paso 5:** organizar intervención, responsable y seguimiento.

**Paso 6:** proteger dignidad, comunicación y participación.

**Paso 7:** reevaluar.

La mejor respuesta suele ser la que combina seguridad clínica con organización y trato profesional.

---$BODY_457$, 63
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'diferencias_que_deben_memorizarse_63', 'Diferencias que deben memorizarse', $BODY_458$| Concepto | Pregunta central |
|---|---|
| Humanización | ¿La persona es tratada con dignidad, respeto y sensibilidad? |
| Calidad | ¿El cuidado aumenta la probabilidad de buenos resultados y cumple estándares profesionales? |
| Seguridad | ¿Se previene daño asociado a la atención? |
| Eficiencia | ¿Se usan responsablemente los recursos sin comprometer calidad? |
| Continuidad | ¿El cuidado se mantiene coordinado entre personas, turnos y servicios? |
| Planeación del cuidado | ¿Qué problemas atenderemos, con qué objetivos, intervenciones y responsables? |
| Supervisión | ¿Se verifica ejecución, seguridad y resultado? |

---$BODY_458$, 64
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_examen_64', 'Errores frecuentes de examen', $BODY_459$1. Confundir humanización con ser “amable” solamente.
2. Suponer que calidad significa ausencia de quejas.
3. Ahorrar recursos aunque aumente el riesgo del paciente.
4. Priorizar una rutina sobre un deterioro clínico.
5. Repartir pacientes solo por cantidad sin valorar complejidad.
6. Delegar una tarea sin verificar competencia.
7. Considerar que la reunión de planeación es solo una exposición de caso.
8. Formular intervenciones sin objetivos.
9. No reevaluar el plan.
10. Ignorar preferencias del paciente competente.
11. Compartir información con familiares sin considerar autorización.
12. Registrar antes de realizar una intervención.
13. Confundir rapidez con oportunidad: una acción rápida pero equivocada no es calidad.
14. Creer que un cuidado técnico correcto puede considerarse plenamente de calidad aunque sea inseguro o degradante.

---$BODY_459$, 65
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'situaciones_originales_tipo_examen_65', 'Situaciones originales tipo examen', $BODY_460$## Caso 1 — Rutina vs deterioro
Una enfermera debe completar baños programados, pero uno de sus pacientes presenta aumento del trabajo respiratorio y somnolencia.

**Prioridad:** valorar y atender el deterioro respiratorio antes de continuar la rutina.

**Fundamento:** seguridad y priorización clínica.

---

## Caso 2 — Cuidado técnicamente correcto pero deshumanizado
Durante un procedimiento el equipo expone innecesariamente al paciente y conversa sobre asuntos ajenos sin explicarle qué realiza.

**Problema principal:** falta de privacidad, dignidad y comunicación; el procedimiento técnicamente correcto no basta para hablar de cuidado de calidad integral.

---

## Caso 3 — Distribución de pacientes
La jefa asigna el mismo número de pacientes a cada enfermera, aunque una recibe varios pacientes inestables.

**Mejor acción:** redistribuir considerando complejidad, dependencia y competencias, no solo cantidad.

---

## Caso 4 — Familiar solicita información
Un familiar exige detalles clínicos de un adulto competente que no autorizó compartirlos.

**Conducta:** proteger confidencialidad y verificar autorización.

---

## Caso 5 — Reunión sin prioridades
Durante la reunión se presentan veinte datos del paciente, pero nadie identifica qué debe atenderse primero.

**Corrección:** sintetizar datos y establecer prioridades según riesgo.

---

## Caso 6 — Plan sin responsable
El equipo decide movilizar al paciente cada cierto tiempo, pero no define quién realizará ni verificará la intervención.

**Problema:** falta de asignación y seguimiento; el plan no está operacionalizado.

---

## Caso 7 — Delegación
Se asigna una actividad compleja a una persona que no ha demostrado competencia.

**Mejor conducta:** reasignar o asegurar competencia/supervisión antes de proceder.

---

## Caso 8 — Dolor ignorado por alta carga laboral
Un paciente refiere dolor intenso, pero el personal decide esperar varias horas porque “hay demasiado trabajo”.

**Conducta:** valorar el dolor y priorizar respuesta oportuna según condición; la carga de trabajo no elimina la necesidad de gestionar prioridades.

---

## Caso 9 — Cambio de turno
La enfermera saliente omite comunicar que el paciente tuvo episodios recientes de hipotensión.

**Riesgo:** falla de continuidad y seguridad.

---

## Caso 10 — Educación de alta
El plan de alta está completo, pero el paciente no comprende cómo usar su medicación.

**Mejor acción:** reevaluar comprensión y adaptar educación antes del egreso.

---

## Caso 11 — Reunión centrada en diagnóstico médico
El equipo habla únicamente de “insuficiencia cardiaca” y no analiza disnea, tolerancia a actividad, edema, seguridad ni educación.

**Corrección:** convertir el diagnóstico médico en necesidades y problemas concretos de cuidado.

---

## Caso 12 — Recurso escaso
Solo hay un equipo disponible y dos pacientes lo requieren; uno está inestable y el otro estable.

**Conducta:** priorizar según riesgo clínico, buscar alternativa segura para el segundo paciente y comunicar la limitación.

---

## Caso 13 — Error detectado
La enfermera descubre un error de medicación.

**Prioridad:** valorar/proteger al paciente, comunicar clínicamente y activar los procesos de documentación/reporte correspondientes; no ocultar.

---

## Caso 14 — Paciente quiere participar
Un paciente competente pregunta si puede opinar sobre el horario de ciertas actividades de cuidado.

**Respuesta:** incorporar preferencias cuando sean compatibles con seguridad y tratamiento; el cuidado centrado en la persona favorece participación.

---

## Caso 15 — Reunión finaliza sin reevaluación
Se establecen intervenciones pero no se determina cuándo revisar la respuesta del paciente.

**Problema:** planeación incompleta; todo plan necesita evaluación y posibilidad de ajuste.

---

## Caso 16 — Calidad vs eficiencia mal entendida
Una unidad reduce una verificación de seguridad para “ahorrar tiempo”.

**Respuesta:** incorrecto si aumenta riesgo. La eficiencia no justifica sacrificar seguridad ni calidad.

---$BODY_460$, 66
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preguntas_r_pidas_de_repaso_66', 'Preguntas rápidas de repaso', $BODY_461$**1. ¿Qué define el alcance de ADMIN-06?**  
Gestión del cuidado, con atención humanizada y de calidad y Reunión de Planeación del Cuidado.

**2. ¿Gestionar cuidado es lo mismo que ejecutar procedimientos?**  
No. Incluye priorizar, planificar, coordinar, asignar, supervisar y evaluar.

**3. ¿Humanización significa solo amabilidad?**  
No. Incluye dignidad, privacidad, comunicación, autonomía, confort y cuidado centrado en la persona.

**4. ¿Cuáles son las siete dimensiones de calidad destacadas por OMS?**  
Eficacia, seguridad, atención centrada en la persona, oportunidad, equidad, integración y eficiencia.

**5. ¿Qué debe producir una reunión de planeación?**  
Un plan claro con prioridades, objetivos, intervenciones, responsables y seguimiento.

**6. ¿El diagnóstico médico basta para planificar cuidado?**  
No. Deben identificarse respuestas humanas, necesidades y riesgos de enfermería.

**7. ¿Qué ocurre si un plan no se reevalúa?**  
Puede quedar desactualizado y perder seguridad o pertinencia.

**8. ¿La eficiencia permite omitir una medida de seguridad?**  
No.

**9. ¿Qué política vigente contextualiza calidad en Panamá?**  
Política Nacional de Salud 2026–2035.

**10. ¿Qué decreto instituyó el Día Nacional de la Humanización?**  
Decreto Ejecutivo N.° 29 de 5 de diciembre de 2025.

---$BODY_461$, 67
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fuentes_y_validaci_n_67', 'Fuentes y validación', $BODY_462$## Fuente rectora CICDE

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** _Lineamientos para el Examen de Competencias de Profesionales de Enfermería_. Tercera edición. Panamá, 2026.  
   Define **ADMIN-06 — Gestión del cuidado** y sus dos subtemas explícitos: **Atención humanizada y de calidad** y **Reunión de Planeación del Cuidado**.

## Bibliografía principal indicada por CICDE

2. **Balderas Pedrero, María de la Luz.** _Administración de los servicios de enfermería_. 7.ª ed. McGraw-Hill, 2015. ISBN 9786071512413.  
   Ficha oficial: https://www.mheducation.com.mx/administracion-de-los-servicios-de-enfermeria-9786071512413-latam-group  
   La tabla de contenidos oficial confirma secciones sobre servicios de enfermería, calidad de la atención, teorías de enfermería, proceso enfermero y proceso administrativo aplicado a la atención.

## Panamá — fuentes oficiales/profesionales

3. **Asociación Nacional de Enfermeras de Panamá (ANEP).** _Código Deontológico para Enfermeras de Panamá_.  
   https://www.anep.org.pa/biblioteca/codigo-deontologico/  
   Sustenta dignidad, autonomía, privacidad, seguridad, responsabilidad y concepto profesional de calidad.

4. **República de Panamá / Ministerio de Salud. Decreto Ejecutivo N.° 29 de 5 de diciembre de 2025.** Instituye el 2 de febrero como Día Nacional de la Humanización en la Atención y en los Servicios de Salud.  
   https://minsa.gob.pa/normatividad/decreto-ejecutivo-ndeg-29-de-viernes-05-de-diciembre-de-2025-por-la-cual-se-instituye

5. **República de Panamá / Ministerio de Salud. Decreto Ejecutivo N.° 17 de 23 de marzo de 2026.** Aprueba la Política Nacional de Salud, sus objetivos estratégicos y líneas de acción 2026–2035.  
   https://www.minsa.gob.pa/normatividad/decreto-ejecutivo-no-17-de-23-de-marzo-de-2026-que-aprueba-la-politica-nacional-de

## Fuentes internacionales complementarias

6. **World Health Organization.** _Quality health services_.  
   https://www.who.int/news-room/fact-sheets/detail/quality-health-services  
   Marco de calidad: eficaz, segura, centrada en la persona, oportuna, equitativa, integrada y eficiente.

7. **World Health Organization.** _Integrated people-centred care_.  
   https://www.who.int/health-topics/integrated-people-centered-care  
   Sustenta coordinación, participación y organización de servicios alrededor de necesidades de las personas.

8. **World Health Organization.** _Global Patient Safety Action Plan 2021–2030_.  
   https://www.who.int/publications/i/item/9789240032705  
   Marco internacional de seguridad del paciente y eliminación del daño evitable.

## Evidencia académica panameña complementaria

9. **Universidad de Panamá — Repositorio Institucional.** Trabajos académicos sobre proceso administrativo, supervisión de calidad y cuidado integral/humanizado en enfermería se utilizaron únicamente para contextualizar la tradición académica panameña del área, no como sustituto del lineamiento CICDE ni como norma clínica nacional.

---$BODY_462$, 68
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'actualizaciones_y_l_mites_de_interpretaci_n_68', 'Actualizaciones y límites de interpretación', $BODY_463$### Reunión de Planeación del Cuidado

El término aparece **expresamente en CICDE 2026**, pero en las fuentes oficiales consultadas no se identificó un procedimiento nacional único que defina obligatoriamente su duración, participantes exactos, formato o lista de cotejo.

Por esta razón:

- se enseñan principios universales de planeación y coordinación;
- no se presenta una plantilla estudiantil o institucional como regla CICDE;
- si posteriormente se obtiene una guía oficial de la Facultad de Enfermería, MINSA, CSS o institución autorizada, debe añadirse como fuente y documentarse la actualización.

### Humanización

El contexto panameño cambió recientemente: el Decreto Ejecutivo N.° 29 fue emitido en diciembre de 2025 y su implementación pública se reforzó en 2026. Esta actualización se incorpora porque ADMIN-06 exige atención humanizada.

### Calidad

Las dimensiones OMS se utilizan como marco complementario actual y no se atribuyen a Balderas ni al documento CICDE.

---$BODY_463$, 69
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_de_calidad_69', 'Control de calidad', $BODY_464$Este paquete fue construido con las siguientes reglas:

- alcance cotejado contra CICDE 2026;
- 2/2 subtemas explícitos cubiertos;
- no se inventaron subtemas CICDE adicionales;
- Balderas 7.ª edición se mantiene como bibliografía principal del área de Administración;
- la tabla de contenidos oficial de McGraw-Hill fue comprobada;
- humanización se actualizó con fuente oficial panameña 2025–2026;
- calidad se contextualizó con la Política Nacional de Salud 2026–2035;
- Código Deontológico de ANEP utilizado para dignidad, responsabilidad y calidad profesional;
- OMS utilizada como fuente complementaria para dimensiones actuales de calidad y seguridad;
- no se presentó una plantilla local de Reunión de Planeación como si fuera norma CICDE;
- la diferencia con ADMIN-05 y ADMIN-07 se documentó para evitar duplicación;
- situaciones tipo examen son originales;
- no se declara revisión humana inexistente;
- el paquete se mantiene en `REVIEW`.

---$BODY_464$, 70
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estado_para_integraci_n_70', 'Estado para integración', $BODY_465$**Estado recomendado:** `REVIEW`

Motivo:

- alcance y fuentes fueron revisados documentalmente;
- no existe todavía revisor humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` únicamente por revisión de IA.

**Cobertura CICDE ADMIN-06: 2/2 subtemas explícitos.**

- Atención humanizada y de calidad: **cubierta**.
- Reunión de Planeación del Cuidado: **cubierta**, con límite documental explícito respecto de formatos locales no oficiales.

**Situaciones originales tipo examen: 16.**

---$BODY_465$, 71
FROM admin_lesson_map WHERE topic_code = 'ADMIN-06';

-- ADMIN-07: Proceso administrativo aplicado en Enfermería (75 sections)

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'alcance_oficial_cicde_0', 'Alcance oficial CICDE', $BODY_466$El temario CICDE 2026 incluye dentro del área **Administración** el tema:

> **Proceso administrativo aplicado en Enfermería**

con el subtema explícito:

> **Planeación, organización, dirección (liderazgo y toma de decisiones), control (supervisión).**

Este paquete conserva literalmente ese alcance. La expansión didáctica explica cómo esas etapas se relacionan entre sí y cómo se aplican al trabajo de enfermería en servicios, turnos, equipos y situaciones de cuidado.

La bibliografía principal indicada por CICDE para Administración es **María de la Luz Balderas Pedrero, _Administración de los servicios de enfermería_, 7.ª edición, McGraw-Hill, 2015**. La tabla de contenidos oficial de la obra contiene un capítulo específico denominado **“El proceso administrativo aplicado a la atención de enfermería”**, organizado en planeación, organización, dirección y control.

ADMIN-07 no sustituye ADMIN-05. En ADMIN-05 se estudiaron las **funciones administrativas** de manera conceptual; aquí se estudia cómo se **integran como un proceso continuo aplicado a Enfermería**.

---$BODY_466$, 1
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_de_aprendizaje_1', 'Objetivos de aprendizaje', $BODY_467$Al finalizar el tema, el estudiante debe poder:

1. Explicar el proceso administrativo aplicado a enfermería.
2. Diferenciar función administrativa de proceso administrativo.
3. Relacionar planeación, organización, dirección y control como etapas interdependientes.
4. Aplicar la planeación a necesidades de pacientes, personal, tiempo, recursos y seguridad.
5. Organizar responsabilidades y recursos de forma coherente con prioridades.
6. Reconocer el papel del liderazgo en la dirección del equipo.
7. Utilizar un proceso lógico para tomar decisiones administrativas.
8. Distinguir autoridad, responsabilidad, delegación y rendición de cuentas.
9. Comprender la supervisión como parte del control y apoyo al desempeño.
10. Utilizar indicadores, observación, registros e informes para evaluar resultados.
11. Identificar desviaciones y proponer acciones correctivas.
12. Integrar seguridad del paciente, ética, comunicación y calidad durante todo el proceso.
13. Diferenciar proceso administrativo de Proceso de Atención de Enfermería (PAE), reconociendo sus puntos de interacción.
14. Resolver situaciones tipo CICDE en las que deba identificar la etapa administrativa o la mejor acción de gestión.

---$BODY_467$, 2
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'concepto_de_proceso_administrativo_2', 'Concepto de proceso administrativo', $BODY_468$El **proceso administrativo** es una secuencia organizada de actividades que permite transformar objetivos y necesidades en acciones coordinadas y resultados evaluables.

Para este tema se estudia mediante cuatro componentes centrales:

```text
Planeación
    ↓
Organización
    ↓
Dirección
    ↓
Control
    ↺
Retroalimentación hacia nueva planeación
```

No debe interpretarse como una cadena rígida que termina definitivamente. En la práctica, las etapas se superponen y los resultados del control modifican la planeación siguiente.

---$BODY_468$, 3
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'el_proceso_es_din_mico_y_continuo_3', 'El proceso es dinámico y continuo', $BODY_469$Una jefa de enfermería puede haber planificado un turno y organizado el personal, pero una emergencia, una ausencia inesperada o el deterioro de un paciente obliga a reorganizar.

Por eso el proceso administrativo es:

- dinámico;
- continuo;
- interdependiente;
- adaptable;
- orientado a objetivos;
- evaluable.

La administración efectiva no consiste en seguir un plan aunque la realidad haya cambiado. Consiste en mantener el objetivo y ajustar los medios de forma segura y razonada.

---$BODY_469$, 4
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'admin_05_vs_admin_07_4', 'ADMIN-05 vs ADMIN-07', $BODY_470$**ADMIN-05 — Funciones administrativas** responde principalmente:

- ¿qué es planear?;
- ¿qué es organizar?;
- ¿qué implica dirigir?;
- ¿qué significa controlar?;
- ¿qué conceptos se relacionan con cada función?

**ADMIN-07 — Proceso administrativo aplicado en Enfermería** responde:

- ¿cómo se integran esas funciones en una situación real?;
- ¿qué se hace primero?;
- ¿cómo se asignan recursos?;
- ¿cómo se dirige al equipo?;
- ¿cómo se evalúa si el plan funcionó?;
- ¿qué se modifica cuando hay desviaciones?

La diferencia principal es **integración y aplicación**.

---$BODY_470$, 5
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'proceso_administrativo_vs_proceso_de_atenci_n_de_e_5', 'Proceso administrativo vs Proceso de Atención de Enfermería', $BODY_471$No son lo mismo.

| Proceso administrativo | Proceso de Atención de Enfermería (PAE) |
|---|---|
| Organiza personas, recursos, actividades y resultados | Organiza el cuidado profesional de una persona, familia o comunidad |
| Planeación, organización, dirección y control | Valoración, diagnóstico, planificación, ejecución y evaluación |
| Puede aplicarse a servicio, unidad, turno o institución | Se centra en necesidades de cuidado |
| Incluye liderazgo, recursos, supervisión y control | Incluye juicios de enfermería e intervenciones de cuidado |

Se relacionan porque el cuidado necesita organización administrativa para ejecutarse de forma segura.

---$BODY_471$, 6
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'c_mo_se_relacionan_ambos_procesos_6', 'Cómo se relacionan ambos procesos', $BODY_472$Ejemplo: un paciente requiere vigilancia frecuente por riesgo de deterioro.

**PAE:**
- identifica el problema y riesgo;
- establece objetivos;
- planifica intervenciones;
- ejecuta y evalúa el cuidado.

**Proceso administrativo:**
- determina disponibilidad de personal;
- organiza asignaciones;
- asegura recursos;
- comunica prioridades;
- supervisa cumplimiento;
- evalúa resultados operativos y corrige fallas.

El PAE dice **qué cuidado necesita el paciente**; la administración ayuda a crear las condiciones para que ese cuidado pueda realizarse.

---$BODY_472$, 7
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'el_ciclo_administrativo_7', 'El ciclo administrativo', $BODY_473$El ciclo puede resumirse con cuatro preguntas:

1. **Planeación:** ¿qué queremos lograr y qué necesitamos?
2. **Organización:** ¿cómo distribuiremos personas, recursos y responsabilidades?
3. **Dirección:** ¿cómo movilizaremos al equipo para ejecutar lo planificado?
4. **Control:** ¿qué ocurrió, cómo se compara con lo esperado y qué debemos corregir?

Una buena respuesta tipo examen suele identificar primero **qué pregunta está intentando resolver la situación**.

---$BODY_473$, 8
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'niveles_de_aplicaci_n_en_enfermer_a_8', 'Niveles de aplicación en enfermería', $BODY_474$El proceso administrativo puede aplicarse en diferentes niveles:

- institución;
- dirección o departamento de enfermería;
- unidad clínica;
- turno;
- programa;
- proyecto;
- actividad específica.

Ejemplo:

- un plan anual de capacitación tiene alcance amplio;
- la distribución de personal para el turno nocturno tiene alcance operativo inmediato.

El principio administrativo es el mismo; cambia la escala.

---$BODY_474$, 9
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'planeaci_n_concepto_aplicado_9', 'Planeación: concepto aplicado', $BODY_475$La **planeación** define anticipadamente qué se pretende lograr, qué problemas deben resolverse, qué prioridades existen y qué recursos serán necesarios.

En enfermería puede incluir:

- necesidades de pacientes;
- dotación de personal;
- materiales;
- equipos;
- tiempos;
- actividades;
- educación;
- seguridad;
- contingencias;
- resultados esperados.

Planear reduce improvisación, aunque nunca elimina la necesidad de adaptarse.

---$BODY_475$, 10
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preguntas_esenciales_de_la_planeaci_n_10', 'Preguntas esenciales de la planeación', $BODY_476$Antes de actuar, la enfermera gestora debe aclarar:

- ¿qué situación existe?;
- ¿qué debe lograrse?;
- ¿qué es prioritario?;
- ¿qué recursos tenemos?;
- ¿qué recursos faltan?;
- ¿quiénes participarán?;
- ¿cuándo debe realizarse?;
- ¿qué riesgos debemos anticipar?;
- ¿cómo evaluaremos el resultado?

Una acción sin objetivo claro es difícil de controlar posteriormente.

---$BODY_476$, 11
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'an_lisis_de_la_situaci_n_11', 'Análisis de la situación', $BODY_477$Planear exige conocer la situación real.

En una unidad de enfermería pueden revisarse:

- número y complejidad de pacientes;
- necesidades de vigilancia;
- dependencia para actividades básicas;
- procedimientos programados;
- ingresos y egresos previstos;
- personal disponible;
- competencias del personal;
- equipos y suministros;
- incidentes previos;
- carga de trabajo;
- riesgos específicos.

Planear con información incompleta aumenta la probabilidad de una distribución insegura.

---$BODY_477$, 12
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_administrativos_12', 'Objetivos administrativos', $BODY_478$Un objetivo describe el resultado que se pretende alcanzar.

Debe ser suficientemente claro para orientar decisiones y permitir evaluación.

Ejemplos:

- garantizar cobertura segura del turno;
- reducir omisiones en un procedimiento;
- mejorar cumplimiento de una medida de seguridad;
- organizar capacitación para una nueva práctica;
- asegurar continuidad durante una transición de servicio.

El objetivo no debe confundirse con una actividad. **“Capacitar al personal”** es una actividad si el resultado real buscado es mejorar competencia o cumplimiento.

---$BODY_478$, 13
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'priorizaci_n_en_la_planeaci_n_13', 'Priorización en la planeación', $BODY_479$No todas las necesidades tienen el mismo peso.

En enfermería suelen priorizarse:

1. riesgos inmediatos para vida y seguridad;
2. necesidades críticas de cuidado;
3. continuidad de intervenciones esenciales;
4. recursos indispensables;
5. actividades programadas que pueden reorganizarse;
6. tareas administrativas no urgentes.

Una planificación correcta evita que actividades rutinarias desplacen necesidades clínicas críticas.

---$BODY_479$, 14
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'planes_pol_ticas_programas_y_procedimientos_14', 'Planes, políticas, programas y procedimientos', $BODY_480$Estos términos no son equivalentes.

**Plan:** organiza acciones para alcanzar un objetivo.

**Política:** orienta decisiones dentro de un marco institucional.

**Programa:** integra actividades coordinadas dirigidas a un propósito determinado.

**Procedimiento:** describe una secuencia establecida para realizar una actividad.

En una pregunta CICDE debe identificarse qué función cumple cada instrumento, no memorizar términos sin contexto.

---$BODY_480$, 15
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'previsi_n_de_recursos_15', 'Previsión de recursos', $BODY_481$La planeación administrativa considera si existen recursos suficientes para realizar lo esperado.

Puede incluir:

- personal;
- tiempo;
- camas;
- medicamentos;
- material de curación;
- equipos;
- transporte;
- documentación;
- apoyo diagnóstico;
- espacios físicos.

Planificar no significa disponer de recursos ilimitados; significa anticipar necesidades y utilizar de forma responsable los disponibles.

---$BODY_481$, 16
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'planeaci_n_de_personal_16', 'Planeación de personal', $BODY_482$La necesidad de personal no depende únicamente del número de pacientes.

Debe considerar también:

- complejidad;
- dependencia;
- riesgo;
- procedimientos;
- ingresos/egresos;
- experiencia del equipo;
- competencias específicas;
- continuidad requerida.

Dos unidades con el mismo número de pacientes pueden requerir organización distinta si la complejidad clínica es diferente.

---$BODY_482$, 17
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'planeaci_n_del_turno_17', 'Planeación del turno', $BODY_483$Antes o al inicio de un turno se revisan:

- censo;
- condición de pacientes;
- prioridades;
- personal presente;
- restricciones o competencias;
- actividades programadas;
- pendientes críticos;
- recursos disponibles.

La planeación inicial debe actualizarse si cambian las condiciones.

---$BODY_483$, 18
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'planeaci_n_de_contingencias_18', 'Planeación de contingencias', $BODY_484$Una contingencia es una situación que puede alterar el plan esperado.

Ejemplos:

- ausencia de personal;
- falla de equipo;
- aumento repentino de pacientes;
- emergencia;
- interrupción de suministro;
- traslado urgente.

La planeación responsable anticipa respuestas alternativas en lugar de depender exclusivamente de improvisación.

---$BODY_484$, 19
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'planeaci_n_y_seguridad_19', 'Planeación y seguridad', $BODY_485$La seguridad debe incorporarse desde el diseño del plan.

Ejemplos:

- prever doble verificación cuando corresponda;
- evitar asignaciones que excedan competencias;
- asegurar equipo necesario antes de un procedimiento;
- prever cobertura durante traslados;
- identificar pacientes de mayor riesgo;
- programar seguimiento de intervenciones críticas.

La seguridad no es una etapa posterior: debe estar presente desde la planeación.

---$BODY_485$, 20
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_planeaci_n_20', 'Errores frecuentes de planeación', $BODY_486$1. Planear sin revisar la situación actual.
2. Confundir deseo con objetivo operativo.
3. Ignorar recursos disponibles.
4. No establecer prioridades.
5. Asumir que todos los pacientes requieren la misma carga de trabajo.
6. Elaborar un plan sin responsables.
7. No prever contingencias.
8. Mantener el plan aunque la condición haya cambiado.
9. No definir cómo se evaluará el resultado.

---$BODY_486$, 21
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_concepto_aplicado_21', 'Organización: concepto aplicado', $BODY_487$La **organización** convierte el plan en una estructura de trabajo.

Responde a preguntas como:

- ¿quién hará qué?;
- ¿con qué recursos?;
- ¿cómo se agruparán las actividades?;
- ¿quién supervisará?;
- ¿cómo se coordinarán las tareas?;
- ¿por qué canal se comunicarán cambios?

La organización distribuye responsabilidades y recursos para hacer ejecutable la planeación.

---$BODY_487$, 22
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estructura_y_distribuci_n_del_trabajo_22', 'Estructura y distribución del trabajo', $BODY_488$Organizar implica definir cómo se reparte el trabajo evitando:

- duplicaciones;
- omisiones;
- responsabilidades ambiguas;
- sobrecarga desigual;
- tareas asignadas a personal no competente.

En una unidad, la estructura debe facilitar tanto la eficiencia como la seguridad del paciente.

---$BODY_488$, 23
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'divisi_n_del_trabajo_23', 'División del trabajo', $BODY_489$La división del trabajo permite distribuir actividades según:

- funciones;
- competencias;
- complejidad;
- experiencia;
- prioridades.

No debe convertirse en fragmentación del cuidado. Aunque distintos profesionales realicen tareas diferentes, alguien debe mantener una visión integral del paciente y asegurar continuidad.

---$BODY_489$, 24
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'asignaci_n_de_pacientes_y_actividades_24', 'Asignación de pacientes y actividades', $BODY_490$Una asignación segura considera:

- condición del paciente;
- riesgo;
- nivel de dependencia;
- tratamientos;
- habilidades del profesional;
- carga global;
- continuidad.

Asignar por número de camas sin valorar complejidad puede ser administrativamente simple pero clínicamente inadecuado.

---$BODY_490$, 25
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'autoridad_y_responsabilidad_25', 'Autoridad y responsabilidad', $BODY_491$**Autoridad** es la facultad legítima para tomar determinadas decisiones dentro de un rol.

**Responsabilidad** implica responder por las funciones y decisiones correspondientes al cargo o tarea.

Una estructura efectiva debe evitar dos extremos:

- responsabilidad sin autoridad suficiente para actuar;
- autoridad sin mecanismos de responsabilidad y rendición de cuentas.

---$BODY_491$, 26
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'delegaci_n_dentro_de_la_organizaci_n_26', 'Delegación dentro de la organización', $BODY_492$Delegar consiste en encomendar una actividad a otra persona con capacidad apropiada, dentro del marco permitido.

Antes de delegar se valora:

- tarea;
- condición del paciente;
- competencia de la persona;
- instrucciones necesarias;
- nivel de supervisión;
- resultado esperado.

Delegar no significa abandonar la necesidad de seguimiento.

---$BODY_492$, 27
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'coordinaci_n_27', 'Coordinación', $BODY_493$La coordinación conecta actividades que dependen unas de otras.

Ejemplos:

- preparación preoperatoria y traslado;
- administración de tratamientos y monitoreo;
- alta y educación;
- laboratorio y decisiones posteriores;
- cuidados entre turnos.

Cuando falla la coordinación pueden aparecer retrasos, duplicaciones u omisiones.

---$BODY_493$, 28
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cadena_de_mando_28', 'Cadena de mando', $BODY_494$La cadena de mando ayuda a definir:

- a quién reportar;
- quién supervisa;
- cómo escalar un problema;
- quién posee autoridad para determinadas decisiones.

No debe utilizarse como excusa para retrasar una intervención urgente de seguridad. En situaciones críticas se protege primero al paciente y simultáneamente se activa la comunicación apropiada.

---$BODY_494$, 29
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_de_recursos_materiales_29', 'Organización de recursos materiales', $BODY_495$Además del personal, deben organizarse:

- equipos;
- insumos;
- documentación;
- espacios;
- medicamentos;
- material estéril;
- dispositivos de seguridad.

Una unidad puede tener suficiente personal y aun así presentar riesgo si los recursos críticos no están disponibles, accesibles o funcionales.

---$BODY_495$, 30
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'organizaci_n_durante_un_cambio_inesperado_30', 'Organización durante un cambio inesperado', $BODY_496$Si aumenta la demanda o disminuyen los recursos, la organización debe modificarse.

Ejemplo:

- reevaluar prioridades;
- redistribuir pacientes;
- solicitar apoyo;
- posponer tareas no críticas;
- concentrar vigilancia en pacientes de mayor riesgo;
- comunicar el nuevo plan.

Reorganizar no significa improvisar sin criterio: es adaptar la estructura a una situación nueva.

---$BODY_496$, 31
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_organizaci_n_31', 'Errores frecuentes de organización', $BODY_497$1. Distribuir solo por cantidad y no por complejidad.
2. Asignar tareas sin verificar competencia.
3. No definir responsabilidades.
4. Duplicar actividades.
5. Dejar actividades esenciales sin responsable.
6. No prever quién sustituye a una persona ausente.
7. Ignorar disponibilidad de equipos.
8. Fragmentar el cuidado sin coordinación.

---$BODY_497$, 32
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'direcci_n_concepto_aplicado_32', 'Dirección: concepto aplicado', $BODY_498$La **dirección** moviliza a las personas para ejecutar lo planificado y organizado.

Incluye especialmente:

- liderazgo;
- comunicación;
- orientación;
- motivación;
- coordinación humana;
- manejo de conflictos;
- toma de decisiones;
- seguimiento del trabajo.

Una estructura puede estar bien diseñada y aun así fracasar si no existe dirección efectiva.

---$BODY_498$, 33
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'liderazgo_en_enfermer_a_33', 'Liderazgo en enfermería', $BODY_499$Liderar implica influir y orientar al equipo hacia objetivos de cuidado y servicio.

En enfermería el liderazgo debe favorecer:

- seguridad;
- claridad;
- cooperación;
- comunicación;
- respeto;
- responsabilidad;
- resolución de problemas;
- adaptación al cambio.

El liderazgo no depende únicamente del cargo; profesionales sin jefatura formal pueden ejercer liderazgo clínico dentro de su ámbito.

---$BODY_499$, 34
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'liderazgo_no_es_autoritarismo_34', 'Liderazgo no es autoritarismo', $BODY_500$Dirigir no significa simplemente dar órdenes.

Una dirección efectiva:

- comunica expectativas;
- escucha información del equipo;
- explica prioridades;
- toma decisiones oportunas;
- corrige de forma profesional;
- reconoce límites;
- promueve participación cuando es apropiado.

La autoridad formal puede obligar al cumplimiento, pero no sustituye las habilidades de liderazgo.

---$BODY_500$, 35
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_en_la_direcci_n_35', 'Comunicación en la dirección', $BODY_501$La dirección depende de información clara.

Una indicación debe especificar, cuando sea necesario:

- qué debe hacerse;
- para quién;
- cuándo;
- prioridad;
- resultado esperado;
- qué cambios deben comunicarse.

La comunicación ambigua favorece errores. La retroalimentación permite confirmar comprensión.

---$BODY_501$, 36
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'motivaci_n_y_desempe_o_36', 'Motivación y desempeño', $BODY_502$El desempeño del personal puede verse influido por múltiples factores:

- claridad del rol;
- recursos;
- competencia;
- reconocimiento;
- relaciones;
- carga de trabajo;
- liderazgo;
- condiciones laborales;
- oportunidades de desarrollo.

No debe asumirse automáticamente que un incumplimiento se debe a “falta de interés”. Primero se analiza la causa.

---$BODY_502$, 37
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'orientaci_n_del_personal_37', 'Orientación del personal', $BODY_503$Cuando una persona se incorpora a una unidad o actividad nueva necesita orientación sobre:

- funciones;
- normas;
- procedimientos;
- canales de comunicación;
- riesgos;
- equipos;
- responsabilidades;
- mecanismos de apoyo.

La orientación adecuada forma parte de una dirección segura.

---$BODY_503$, 38
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'manejo_de_conflictos_38', 'Manejo de conflictos', $BODY_504$Los conflictos pueden surgir por:

- prioridades diferentes;
- carga de trabajo;
- comunicación deficiente;
- roles poco claros;
- recursos escasos;
- relaciones interpersonales.

La dirección debe distinguir entre desacuerdo profesional útil y conducta que pone en riesgo al equipo o al paciente.

El objetivo no es “ganar” el conflicto, sino resolver el problema de forma compatible con seguridad y funcionamiento del servicio.

---$BODY_504$, 39
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'toma_de_decisiones_39', 'Toma de decisiones', $BODY_505$CICDE incluye expresamente **toma de decisiones** dentro de la dirección.

Tomar decisiones implica seleccionar una alternativa entre varias posibilidades con base en:

- problema identificado;
- información disponible;
- objetivos;
- riesgos;
- recursos;
- consecuencias previsibles;
- normas;
- principios éticos.

En enfermería algunas decisiones deben tomarse rápidamente, pero rapidez no significa actuar sin razonamiento.

---$BODY_505$, 40
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'proceso_pr_ctico_para_tomar_decisiones_40', 'Proceso práctico para tomar decisiones', $BODY_506$Una secuencia útil es:

1. identificar el problema;
2. recopilar información relevante;
3. aclarar el objetivo;
4. generar alternativas;
5. valorar riesgos, beneficios y recursos;
6. seleccionar una alternativa;
7. ejecutarla;
8. evaluar el resultado.

Si el resultado no es adecuado, la decisión debe reevaluarse.

---$BODY_506$, 41
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'decisiones_programadas_y_no_programadas_41', 'Decisiones programadas y no programadas', $BODY_507$Algunas decisiones son repetitivas y pueden guiarse por procedimientos establecidos.

Ejemplos:

- distribución rutinaria de ciertas actividades;
- procesos institucionales estandarizados.

Otras requieren mayor análisis porque son nuevas, complejas o inesperadas.

Ejemplos:

- déficit súbito de personal con varios pacientes críticos;
- falla simultánea de recursos esenciales.

La existencia de un procedimiento no elimina el juicio profesional cuando la situación se aparta de lo habitual.

---$BODY_507$, 42
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'resoluci_n_de_problemas_42', 'Resolución de problemas', $BODY_508$Resolver un problema no es lo mismo que ocultar su consecuencia inmediata.

Ejemplo: si se repiten retrasos en un procedimiento, puede ser insuficiente recordar diariamente al personal “que debe hacerlo a tiempo”.

Debe investigarse:

- carga de trabajo;
- claridad del proceso;
- disponibilidad de insumos;
- competencia;
- comunicación;
- distribución de responsabilidades.

La solución debe dirigirse a la causa cuando sea posible.

---$BODY_508$, 43
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'direcci_n_durante_el_cambio_43', 'Dirección durante el cambio', $BODY_509$Cambios en equipos, procedimientos, sistemas de registro o políticas requieren dirección activa.

Es útil:

- explicar la razón del cambio;
- capacitar;
- escuchar dificultades;
- aclarar responsabilidades;
- supervisar la implementación;
- evaluar resultados.

Imponer un cambio sin preparación puede generar errores incluso si el cambio es técnicamente correcto.

---$BODY_509$, 44
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_direcci_n_44', 'Errores frecuentes de dirección', $BODY_510$1. Confundir liderazgo con autoridad rígida.
2. Dar instrucciones ambiguas.
3. No comprobar comprensión.
4. Tomar decisiones sin información esencial.
5. Ignorar alertas del equipo.
6. Resolver conflictos mediante humillación.
7. Suponer que todo problema de desempeño es falta de motivación.
8. Introducir cambios sin capacitación ni seguimiento.

---$BODY_510$, 45
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_concepto_aplicado_45', 'Control: concepto aplicado', $BODY_511$El **control** verifica si lo realizado corresponde con lo planificado y si los resultados son aceptables.

Incluye:

- establecer criterios;
- observar o medir;
- comparar;
- identificar desviaciones;
- corregir;
- dar seguimiento.

Controlar no es vigilar por desconfianza. Es conocer si el sistema funciona y actuar ante diferencias relevantes.

---$BODY_511$, 46
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'supervisi_n_46', 'Supervisión', $BODY_512$CICDE incluye expresamente **supervisión** dentro del control.

La supervisión permite:

- orientar;
- observar desempeño;
- detectar necesidades de apoyo;
- verificar seguridad;
- reforzar buenas prácticas;
- corregir desviaciones;
- identificar necesidades de capacitación.

Debe ser proporcional al riesgo, complejidad y competencia de la persona supervisada.

---$BODY_512$, 47
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'supervisi_n_no_es_castigo_47', 'Supervisión no es castigo', $BODY_513$Una visión exclusivamente punitiva puede provocar:

- ocultamiento de errores;
- miedo a comunicar problemas;
- deterioro de relaciones;
- pérdida de oportunidades de aprendizaje.

La supervisión profesional combina responsabilidad con apoyo y corrección.

Cuando existe conducta deliberadamente insegura o incumplimiento grave deben activarse los mecanismos institucionales correspondientes, pero eso no convierte toda supervisión en disciplina.

---$BODY_513$, 48
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'est_ndares_y_criterios_de_control_48', 'Estándares y criterios de control', $BODY_514$Para controlar se necesita saber qué se esperaba.

Los criterios pueden provenir de:

- objetivos;
- normas;
- procedimientos;
- estándares profesionales;
- indicadores;
- políticas institucionales;
- resultados clínicos esperados.

Sin criterio de comparación, el control se vuelve subjetivo.

---$BODY_514$, 49
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'medici_n_y_observaci_n_49', 'Medición y observación', $BODY_515$El control puede utilizar:

- observación directa;
- registros;
- listas de verificación;
- indicadores;
- auditorías;
- informes;
- incidentes;
- resultados de pacientes;
- retroalimentación del equipo y usuarios.

Ninguna fuente de información debe interpretarse de forma aislada cuando el problema es complejo.

---$BODY_515$, 50
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comparaci_n_con_lo_esperado_50', 'Comparación con lo esperado', $BODY_516$Después de obtener información se pregunta:

- ¿se alcanzó el objetivo?;
- ¿se realizó la actividad según lo previsto?;
- ¿hubo desviaciones?;
- ¿la desviación tuvo consecuencias?;
- ¿es aislada o repetitiva?;
- ¿qué la explica?

No toda diferencia requiere la misma respuesta.

---$BODY_516$, 51
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'acci_n_correctiva_51', 'Acción correctiva', $BODY_517$Una acción correctiva intenta reducir la brecha entre lo esperado y lo observado.

Puede incluir:

- aclarar una instrucción;
- reorganizar recursos;
- capacitar;
- modificar un procedimiento;
- reparar o sustituir equipo;
- aumentar supervisión;
- corregir una asignación;
- revisar un plan.

Corregir únicamente a la persona puede ser insuficiente si la causa principal está en el sistema.

---$BODY_517$, 52
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'indicadores_52', 'Indicadores', $BODY_518$Un indicador resume información útil sobre estructura, proceso o resultado.

En enfermería pueden utilizarse indicadores relacionados con:

- cumplimiento de procedimientos;
- eventos adversos;
- calidad de registros;
- continuidad;
- satisfacción;
- tiempos;
- resultados específicos del servicio.

El indicador señala una situación que requiere interpretación; no explica por sí solo la causa.

---$BODY_518$, 53
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_de_calidad_en_enfermer_a_53', 'Control de calidad en enfermería', $BODY_519$El control de calidad busca verificar si la atención cumple criterios esperados y si existen oportunidades de mejora.

Debe orientarse a:

- seguridad;
- efectividad;
- oportunidad;
- continuidad;
- cumplimiento profesional;
- resultados.

La calidad no debe reducirse a llenar formularios. El registro es útil cuando permite conocer y mejorar la atención.

---$BODY_519$, 54
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informes_registros_y_auditor_a_54', 'Informes, registros y auditoría', $BODY_520$Los registros administrativos y clínicos pueden ayudar a:

- demostrar qué ocurrió;
- identificar tendencias;
- comunicar problemas;
- evaluar cumplimiento;
- apoyar decisiones;
- mantener trazabilidad.

Una auditoría examina información de manera sistemática para valorar cumplimiento o desempeño según criterios establecidos.

Los datos deben utilizarse para aprender y mejorar, no solo para archivar.

---$BODY_520$, 55
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'supervisi_n_directa_e_indirecta_55', 'Supervisión directa e indirecta', $BODY_521$La supervisión puede incluir:

**Directa:**
- observación del trabajo;
- acompañamiento;
- demostración;
- retroalimentación inmediata.

**Indirecta:**
- revisión de registros;
- análisis de indicadores;
- informes;
- resultados;
- seguimiento posterior.

La elección depende de la actividad y del riesgo.

---$BODY_521$, 56
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'retroalimentaci_n_56', 'Retroalimentación', $BODY_522$La retroalimentación efectiva debe ser:

- específica;
- respetuosa;
- relacionada con conductas observables;
- oportuna;
- orientada a mejora.

Ejemplo poco útil:

> “Trabajas mal.”

Ejemplo más útil:

> “En tres registros faltó documentar la reevaluación posterior a la intervención; revisemos cómo asegurar que se complete.”

---$BODY_522$, 57
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'seguimiento_57', 'Seguimiento', $BODY_523$Una acción correctiva no termina cuando se comunica.

Debe verificarse posteriormente:

- si se implementó;
- si produjo mejora;
- si aparecieron nuevos problemas;
- si requiere ajuste.

Sin seguimiento, el control queda incompleto.

---$BODY_523$, 58
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_y_nueva_planeaci_n_58', 'Control y nueva planeación', $BODY_524$El resultado del control alimenta una nueva planeación.

Ejemplo:

```text
Se detectan omisiones repetidas
        ↓
Se analiza la causa
        ↓
Se modifica el plan
        ↓
Se reorganiza el trabajo
        ↓
Se orienta al equipo
        ↓
Se supervisa nuevamente
        ↓
Se compara el resultado
```

Por eso el proceso administrativo es cíclico.

---$BODY_524$, 59
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_control_59', 'Errores frecuentes de control', $BODY_525$1. Controlar sin criterios claros.
2. Confundir supervisión con castigo.
3. Revisar solo documentos y no resultados.
4. Corregir sin investigar causas.
5. Obtener datos pero no utilizarlos.
6. Aplicar una corrección y no darle seguimiento.
7. Buscar culpables antes de proteger al paciente.
8. Ignorar patrones repetitivos.

---$BODY_525$, 60
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'integraci_n_de_las_cuatro_etapas_60', 'Integración de las cuatro etapas', $BODY_526$Ejemplo: una unidad tendrá varios pacientes con alta dependencia.

**Planeación**
- identifica carga y necesidades;
- define prioridades y recursos.

**Organización**
- distribuye pacientes y actividades según competencia.

**Dirección**
- comunica prioridades, lidera, resuelve dudas y toma decisiones durante el turno.

**Control**
- supervisa, revisa resultados y corrige desviaciones.

Si el control detecta sobrecarga o riesgo, la siguiente acción puede regresar a planeación y organización.

---$BODY_526$, 61
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ejemplo_integrado_ausencia_inesperada_de_personal_61', 'Ejemplo integrado: ausencia inesperada de personal', $BODY_527$Una enfermera informa que no podrá cubrir el turno.

**Planeación:** reevaluar necesidades y riesgos del servicio.

**Organización:** redistribuir asignaciones o solicitar apoyo disponible.

**Dirección:** comunicar el nuevo plan, aclarar prioridades y apoyar al equipo.

**Control:** observar carga, seguridad, pendientes y resultados durante el turno.

La respuesta correcta no es simplemente “repartir los pacientes restantes por igual”.

---$BODY_527$, 62
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ejemplo_integrado_aumento_de_errores_en_un_procedi_62', 'Ejemplo integrado: aumento de errores en un procedimiento', $BODY_528$**Planeación:** definir objetivo de reducción del problema y analizar causas.

**Organización:** asegurar insumos, responsabilidades y proceso claro.

**Dirección:** orientar/capacitar y comunicar expectativas.

**Control:** medir cumplimiento, revisar eventos y evaluar si la intervención produjo mejora.

Si no mejora, debe replantearse la causa y el plan.

---$BODY_528$, 63
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'proceso_administrativo_y_seguridad_del_paciente_63', 'Proceso administrativo y seguridad del paciente', $BODY_529$La seguridad atraviesa todo el proceso:

**Planeación:** anticipar riesgos.

**Organización:** asignar personal competente y recursos adecuados.

**Dirección:** comunicar prioridades y actuar ante cambios.

**Control:** detectar desviaciones, incidentes y necesidad de mejora.

Un fallo administrativo puede convertirse en un problema clínico cuando altera la atención.

---$BODY_529$, 64
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, '_tica_y_responsabilidad_profesional_64', 'Ética y responsabilidad profesional', $BODY_530$El Código Deontológico de la ANEP vincula el ejercicio de enfermería con responsabilidad, protección del paciente, competencia y deberes profesionales.

La administración no suspende esas obligaciones.

Una decisión de gestión debe considerar:

- seguridad;
- dignidad;
- equidad;
- competencia;
- confidencialidad;
- uso responsable de recursos;
- deber de actuar ante riesgos.

La conveniencia administrativa nunca justifica de forma automática una práctica insegura.

---$BODY_530$, 65
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'lo_que_debe_memorizarse_65', 'Lo que debe memorizarse', $BODY_531$- **Planeación:** qué se quiere lograr y qué se necesita.
- **Organización:** quién hace qué, con qué recursos y bajo qué estructura.
- **Dirección:** movilizar al equipo mediante liderazgo, comunicación y decisiones.
- **Control:** comparar resultados con lo esperado y corregir.
- **Supervisión:** forma parte del control.
- **Liderazgo y toma de decisiones:** CICDE los incluye dentro de dirección.
- El proceso administrativo es **cíclico**, no lineal rígido.
- Control genera información para nueva planeación.
- Proceso administrativo ≠ PAE, aunque ambos se relacionan.
- Delegar una actividad no elimina la necesidad de supervisión apropiada.

---$BODY_531$, 66
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'diferencias_clave_para_examen_66', 'Diferencias clave para examen', $BODY_532$| Situación | Etapa predominante |
|---|---|
| Definir objetivos | Planeación |
| Anticipar recursos | Planeación |
| Priorizar necesidades | Planeación |
| Distribuir funciones | Organización |
| Asignar personal | Organización |
| Definir responsabilidades | Organización |
| Liderar al equipo | Dirección |
| Comunicar instrucciones | Dirección |
| Tomar decisiones | Dirección |
| Observar cumplimiento | Control |
| Supervisar | Control |
| Comparar resultados | Control |
| Aplicar acción correctiva | Control |

La palabra aislada no siempre decide la respuesta; debe interpretarse el propósito de la acción.

---$BODY_532$, 67
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_en_preguntas_cicde_67', 'Errores frecuentes en preguntas CICDE', $BODY_533$1. Confundir planeación con organización.
2. Pensar que asignar personal es dirección cuando el propósito principal es estructurar el trabajo.
3. Confundir liderazgo con autoritarismo.
4. Colocar supervisión en planeación.
5. Creer que control ocurre solo al final.
6. Confundir PAE con proceso administrativo.
7. Pensar que delegación elimina responsabilidad de seguimiento.
8. Corregir a una persona sin analizar una falla del sistema.
9. Mantener un plan aunque cambie la condición.
10. Distribuir pacientes únicamente por cantidad.
11. Utilizar indicadores como explicación automática de la causa.
12. Confundir auditoría con castigo.

---$BODY_533$, 68
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estrategia_cicde_para_admin_07_68', 'Estrategia CICDE para ADMIN-07', $BODY_534$Ante una situación administrativa:

**Paso 1:** identificar el problema central.

**Paso 2:** preguntar si la acción busca anticipar, estructurar, movilizar o verificar.

- anticipar → planeación;
- estructurar → organización;
- movilizar/decidir → dirección;
- verificar/corregir → control.

**Paso 3:** identificar riesgos para el paciente.

**Paso 4:** elegir la alternativa que combine seguridad, competencia, comunicación y continuidad.

**Paso 5:** recordar que una acción correctiva puede iniciar un nuevo ciclo de planeación.

---$BODY_534$, 69
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'situaciones_originales_tipo_examen_69', 'Situaciones originales tipo examen', $BODY_535$## Caso 1 — Definir prioridades

Antes del turno, la jefa revisa condición de pacientes, procedimientos y personal disponible para decidir prioridades.

**Etapa predominante:** planeación.

**Razonamiento:** analiza la situación y anticipa lo que debe realizarse.

---

## Caso 2 — Distribuir pacientes

Después de identificar prioridades, distribuye pacientes según complejidad y competencia del personal.

**Etapa predominante:** organización.

---

## Caso 3 — Liderazgo

Durante el turno, explica una nueva prioridad, escucha dificultades y coordina al equipo para cumplirla.

**Etapa predominante:** dirección.

---

## Caso 4 — Supervisión

La jefa observa la ejecución de un procedimiento y ofrece retroalimentación inmediata.

**Etapa predominante:** control.

---

## Caso 5 — Personal insuficiente

Una enfermera falta inesperadamente y quedan varios pacientes de alta dependencia.

**Mejor conducta inicial:** reevaluar necesidades y riesgos antes de redistribuir el trabajo.

**Fundamento:** primero actualizar la planeación; luego reorganizar.

---

## Caso 6 — Asignación insegura

Se pretende asignar un procedimiento complejo a una persona sin competencia demostrada.

**Mejor conducta:** reorganizar la asignación y asegurar personal competente/supervisión adecuada.

---

## Caso 7 — Instrucción poco clara

Dos miembros del equipo interpretan de forma diferente una indicación administrativa.

**Mejor conducta:** aclarar la comunicación y confirmar comprensión.

**Etapa predominante:** dirección.

---

## Caso 8 — Problema repetitivo

Un indicador muestra aumento de omisiones. La jefa reprende al equipo sin investigar causas.

**Problema:** control incompleto.

**Mejor enfoque:** analizar causas, aplicar acción correctiva y dar seguimiento.

---

## Caso 9 — Indicador mejora

Después de capacitación y reorganización, la jefa compara datos previos y posteriores.

**Etapa predominante:** control.

---

## Caso 10 — Tarea vs objetivo

La jefa escribe como objetivo: “Realizar una charla”.

**Problema:** describe una actividad, no necesariamente el resultado que se desea conseguir.

---

## Caso 11 — Igual número de pacientes

Se asignan cuatro pacientes a cada enfermera sin considerar que una recibirá tres pacientes inestables.

**Problema principal:** organización inadecuada por no considerar complejidad y riesgo.

---

## Caso 12 — Cambio de equipo

Se introduce un nuevo dispositivo sin orientación y empiezan a aparecer errores de uso.

**Mejor respuesta administrativa:** organizar capacitación, orientar, supervisar la implementación y evaluar resultados.

---

## Caso 13 — Conflicto

Dos profesionales discuten por responsabilidades poco claras.

**Primera acción útil:** aclarar funciones y analizar la causa del conflicto en lugar de limitarse a sancionar.

---

## Caso 14 — Delegación

Una jefa delega una actividad, pero nunca verifica el resultado.

**Problema:** falta seguimiento/supervisión apropiada.

---

## Caso 15 — Equipo defectuoso

Se detecta un equipo esencial defectuoso durante el control del servicio.

**Mejor acción:** proteger al paciente, retirar/gestionar el equipo según procedimiento y reorganizar los recursos necesarios.

---

## Caso 16 — Auditoría

Una revisión identifica documentación incompleta de forma repetitiva.

**Siguiente paso:** analizar causas y diseñar una intervención; la auditoría por sí sola no corrige el problema.

---

## Caso 17 — Plan que ya no sirve

El plan del turno se elaboró correctamente, pero dos pacientes se deterioran.

**Mejor conducta:** actualizar prioridades y reorganizar el trabajo.

**Clave:** el plan no debe mantenerse rígidamente cuando cambian las condiciones.

---

## Caso 18 — PAE vs administración

La enfermera formula un diagnóstico de enfermería y establece resultados para un paciente.

**Proceso predominante:** PAE.

Luego la jefa redistribuye personal para garantizar las intervenciones necesarias.

**Proceso predominante:** administrativo.

---$BODY_535$, 70
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preguntas_r_pidas_de_repaso_70', 'Preguntas rápidas de repaso', $BODY_536$**1. ¿Cuáles son las cuatro etapas centrales de ADMIN-07?**  
Planeación, organización, dirección y control.

**2. ¿Dónde coloca CICDE liderazgo y toma de decisiones?**  
Dentro de dirección.

**3. ¿Dónde coloca CICDE supervisión?**  
Dentro de control.

**4. ¿Qué etapa define objetivos y prioridades?**  
Planeación.

**5. ¿Qué etapa distribuye funciones y recursos?**  
Organización.

**6. ¿Qué etapa moviliza al equipo?**  
Dirección.

**7. ¿Qué etapa compara resultados con lo esperado?**  
Control.

**8. ¿El control termina el proceso?**  
No. Produce retroalimentación para nueva planeación.

**9. ¿Proceso administrativo y PAE son equivalentes?**  
No.

**10. ¿La supervisión debe entenderse principalmente como castigo?**  
No. Es un mecanismo de orientación, verificación y mejora, aunque pueden existir consecuencias formales cuando corresponda.

---$BODY_536$, 71
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fuentes_y_validaci_n_71', 'Fuentes y validación', $BODY_537$## Fuente rectora CICDE

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** _Lineamientos para el Examen de Competencias de Profesionales de Enfermería_. Tercera edición. Panamá, 2026.  
   Define **ADMIN-07 — Proceso administrativo aplicado en Enfermería** y explicita: planeación, organización, dirección (liderazgo y toma de decisiones) y control (supervisión).

## Bibliografía principal indicada por CICDE

2. **Balderas Pedrero, María de la Luz.** _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015. ISBN 9786071512413.  
   Página oficial del editor:  
   https://www.mheducation.com.mx/administracion-de-los-servicios-de-enfermeria-9786071512413-latam-group

   La tabla de contenidos oficial confirma el capítulo **“El proceso administrativo aplicado a la atención de enfermería”**, con los apartados **Planeación, Organización, Dirección y Control**. La misma obra desarrolla previamente supervisión, evaluación, métodos de control, auditoría, informes y otros instrumentos administrativos.

## Fuente profesional panameña

3. **Asociación Nacional de Enfermeras de Panamá (ANEP). Código Deontológico para Enfermeras de Panamá.**  
   https://www.anep.org.pa/biblioteca/codigo-deontologico/

   Se utiliza como marco profesional para responsabilidad, competencia, deberes hacia el paciente y conducta ética en la toma de decisiones y administración del cuidado.

---$BODY_537$, 72
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'l_mites_de_interpretaci_n_y_relaci_n_con_otros_tem_72', 'Límites de interpretación y relación con otros temas', $BODY_538$- CICDE enumera para ADMIN-07 una sola línea de subtema que contiene las cuatro etapas y sus énfasis; este paquete no presenta las subsecciones didácticas como si fueran subtemas oficiales adicionales.
- ADMIN-05 estudia las funciones administrativas como conceptos; ADMIN-07 las integra como proceso aplicado.
- ADMIN-06 estudia gestión del cuidado, humanización, calidad y Reunión de Planeación del Cuidado; ADMIN-07 aporta el marco administrativo que ayuda a organizar esa gestión.
- ADMIN-08 desarrollará específicamente la comunicación en el proceso administrativo, por lo que aquí la comunicación se aborda solo en la profundidad necesaria para comprender dirección.
- ADMIN-09 desarrollará dotación de recursos humanos; aquí se aborda personal solo como recurso dentro de planeación y organización, sin sustituir ese módulo.
- ADMIN-10 desarrollará instrumentos administrativos de evaluación; aquí indicadores, informes y auditoría se introducen como herramientas de control sin agotar el tema posterior.
- ADMIN-11 desarrollará elaboración de informes; aquí se explica solamente su papel en control y trazabilidad.

---$BODY_538$, 73
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_de_calidad_73', 'Control de calidad', $BODY_539$Este paquete fue construido con las siguientes reglas:

- alcance cotejado contra CICDE 2026;
- subtema explícito conservado sin sustitución;
- planeación, organización, dirección y control cubiertos;
- liderazgo y toma de decisiones ubicados dentro de dirección conforme al texto CICDE;
- supervisión ubicada dentro de control conforme al texto CICDE;
- aplicación orientada a servicios y cuidado de enfermería;
- proceso administrativo diferenciado del PAE;
- relación con ADMIN-05 y ADMIN-06 delimitada para evitar repetición;
- referencias a ADMIN-08, ADMIN-09, ADMIN-10 y ADMIN-11 limitadas para preservar su alcance futuro;
- capítulo correspondiente de Balderas verificado en la tabla de contenidos oficial de McGraw-Hill;
- marco de responsabilidad profesional apoyado en ANEP;
- situaciones tipo examen son originales;
- no se reproducen páginas ni contenido protegido de Balderas;
- no se declara revisión humana inexistente.

---$BODY_539$, 74
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estado_para_integraci_n_74', 'Estado para integración', $BODY_540$**Estado:** `REVIEW`

Motivo:

- alcance y contenido fueron sometidos a revisión documental/académica;
- todavía no existe revisor humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` únicamente por una revisión realizada por IA.

**Cobertura CICDE ADMIN-07:** planeación, organización, dirección (liderazgo y toma de decisiones) y control (supervisión) cubiertos íntegramente.

**Situaciones originales tipo examen:** 18.$BODY_540$, 75
FROM admin_lesson_map WHERE topic_code = 'ADMIN-07';

-- ADMIN-08: La comunicación en el proceso administrativo (69 sections)

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'alcance_oficial_cicde_0', 'Alcance oficial CICDE', $BODY_541$El temario CICDE 2026 incluye dentro del área **Administración** el tema:

> **La comunicación en el proceso administrativo**

El lineamiento no enumera subtemas explícitos para ADMIN-08. Por ello, este material no presenta una lista inventada de “subtemas CICDE”. La expansión se apoya principalmente en la obra indicada por CICDE:

**Balderas Pedrero, María de la Luz. _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015.**

La tabla de contenidos oficial del editor incluye dentro de **Funciones administrativas** una sección de **Comunicación** que desarrolla: propósitos, elementos, conceptos, métodos, tipos de comunicación administrativa, barreras, principios y medios de comunicación.

Este paquete aplica esos fundamentos a la administración de enfermería y los complementa con herramientas de comunicación segura utilizadas en equipos de salud. Las herramientas complementarias no se presentan como subtemas oficiales del CICDE.$BODY_541$, 1
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_de_aprendizaje_1', 'Objetivos de aprendizaje', $BODY_542$Al finalizar el tema, el estudiante debe poder:

1. Explicar por qué la comunicación es indispensable en el proceso administrativo.
2. Identificar los elementos básicos del proceso comunicativo.
3. Diferenciar comunicación formal e informal.
4. Reconocer comunicación descendente, ascendente, horizontal y diagonal.
5. Seleccionar un medio apropiado según urgencia, complejidad, confidencialidad y necesidad de trazabilidad.
6. Reconocer barreras frecuentes de comunicación administrativa.
7. Aplicar claridad, precisión, oportunidad, escucha y retroalimentación.
8. Relacionar comunicación con liderazgo, toma de decisiones, delegación y supervisión.
9. Utilizar principios de comunicación segura para coordinar el cuidado.
10. Reconocer cuándo una información crítica debe escalarse sin demora.
11. Diferenciar comunicación administrativa de comunicación terapéutica y de elaboración formal de informes.
12. Resolver situaciones tipo CICDE donde una falla de comunicación afecta organización, seguridad o calidad.$BODY_542$, 2
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_como_funci_n_administrativa_2', 'Comunicación como función administrativa', $BODY_543$Administrar requiere coordinar personas, información y acciones.

Sin comunicación no puede ejecutarse adecuadamente:

- planeación;
- organización;
- dirección;
- delegación;
- supervisión;
- control;
- evaluación;
- coordinación del cuidado.

Una decisión administrativa solo produce resultados cuando se comunica de forma que las personas responsables sepan **qué se espera, por qué, cuándo, cómo y con qué recursos**.$BODY_543$, 3
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'prop_sitos_de_la_comunicaci_n_3', 'Propósitos de la comunicación', $BODY_544$En administración, la comunicación puede servir para:

- informar;
- coordinar;
- orientar;
- asignar responsabilidades;
- transmitir decisiones;
- solicitar información;
- retroalimentar;
- motivar;
- resolver problemas;
- gestionar cambios;
- prevenir errores;
- documentar acuerdos;
- favorecer control y seguimiento.

Una misma comunicación puede cumplir varios propósitos.$BODY_544$, 4
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'elementos_del_proceso_comunicativo_4', 'Elementos del proceso comunicativo', $BODY_545$Un modelo básico incluye:

```text
Emisor → codificación → mensaje → canal → receptor → decodificación
   ↑                                                     ↓
   └──────────────── retroalimentación ──────────────────┘
```

Todo el proceso ocurre dentro de un **contexto** y puede verse afectado por **ruido**.$BODY_545$, 5
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'emisor_y_codificaci_n_5', 'Emisor y codificación', $BODY_546$El emisor transforma una idea en un mensaje comprensible.

Antes de comunicar debe preguntarse:

- ¿qué necesito que la otra persona sepa?
- ¿qué acción espero?
- ¿qué información es esencial?
- ¿qué lenguaje será comprendido?
- ¿qué medio es más apropiado?

Una idea correcta puede fracasar si se codifica de forma ambigua.$BODY_546$, 6
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'mensaje_6', 'Mensaje', $BODY_547$El mensaje debe corresponder con el propósito.

Un buen mensaje administrativo suele ser:

- claro;
- específico;
- relevante;
- suficiente;
- oportuno;
- coherente.

Demasiada información puede ocultar lo importante; demasiado poca puede generar decisiones inseguras.$BODY_547$, 7
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'canal_o_medio_7', 'Canal o medio', $BODY_548$El canal es el medio utilizado para transmitir el mensaje.

Ejemplos:

- conversación directa;
- reunión;
- llamada;
- documento;
- correo institucional;
- sistema electrónico;
- registro clínico o administrativo autorizado.

El medio debe elegirse según la naturaleza del mensaje.$BODY_548$, 8
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'receptor_y_decodificaci_n_8', 'Receptor y decodificación', $BODY_549$El receptor interpreta el mensaje según:

- conocimiento;
- experiencia;
- contexto;
- expectativas;
- lenguaje;
- estado emocional;
- carga de trabajo.

Que un mensaje haya sido enviado no significa que haya sido entendido.$BODY_549$, 9
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'retroalimentaci_n_9', 'Retroalimentación', $BODY_550$La retroalimentación permite comprobar si el mensaje fue comprendido.

Puede incluir:

- respuesta verbal;
- pregunta;
- repetición de la instrucción;
- confirmación escrita;
- demostración de una acción;
- resultado observado.

En comunicación administrativa, la retroalimentación transforma un envío unilateral en un proceso verificable.$BODY_550$, 10
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ruido_y_contexto_10', 'Ruido y contexto', $BODY_551$El ruido es cualquier factor que distorsiona la comunicación.

Puede ser:

- físico: ruido ambiental, interrupciones;
- semántico: términos confusos;
- organizacional: demasiados niveles jerárquicos;
- tecnológico: sistema caído;
- emocional: enojo o ansiedad;
- cognitivo: sobrecarga o fatiga.

El contexto modifica cómo se interpreta el mensaje.$BODY_551$, 11
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_formal_11', 'Comunicación formal', $BODY_552$Es la que utiliza canales reconocidos por la organización.

Ejemplos:

- instrucciones de jefatura;
- reuniones programadas;
- circulares;
- políticas;
- reportes;
- registros oficiales;
- comunicación por sistemas institucionales.

Ventaja: facilita trazabilidad y responsabilidad.$BODY_552$, 12
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_informal_12', 'Comunicación informal', $BODY_553$Surge de las interacciones cotidianas entre las personas.

Puede:

- acelerar intercambio de información;
- fortalecer relaciones;
- facilitar cooperación.

Pero también puede generar:

- rumores;
- distorsiones;
- información incompleta.

La comunicación informal no sustituye la comunicación formal cuando la información exige registro o responsabilidad institucional.$BODY_553$, 13
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_descendente_13', 'Comunicación descendente', $BODY_554$Fluye desde niveles de mayor autoridad hacia niveles operativos.

Ejemplos:

- políticas;
- instrucciones;
- asignaciones;
- prioridades;
- cambios de procedimiento.

Riesgo: convertirse en comunicación unidireccional sin oportunidad de aclaración.$BODY_554$, 14
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_ascendente_14', 'Comunicación ascendente', $BODY_555$Fluye desde niveles operativos hacia supervisión o dirección.

Ejemplos:

- reportar un riesgo;
- informar resultados;
- comunicar necesidades de recursos;
- plantear problemas;
- proponer mejoras.

Una organización segura necesita que el personal pueda comunicar preocupaciones sin temor indebido.$BODY_555$, 15
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_horizontal_15', 'Comunicación horizontal', $BODY_556$Ocurre entre personas o unidades de nivel organizativo similar.

Ejemplos:

- coordinación entre enfermería y farmacia;
- coordinación entre dos unidades;
- intercambio entre supervisores.

Favorece continuidad y evita duplicidad.$BODY_556$, 16
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_diagonal_16', 'Comunicación diagonal', $BODY_557$Cruza áreas y niveles jerárquicos distintos.

Puede ser útil cuando un proceso requiere coordinación rápida entre servicios diferentes.

Debe respetar responsabilidades y canales institucionales sin crear confusión sobre autoridad.$BODY_557$, 17
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_oral_17', 'Comunicación oral', $BODY_558$Ventajas:

- rapidez;
- posibilidad de aclaración inmediata;
- adaptación al receptor.

Limitaciones:

- puede olvidarse;
- puede distorsionarse;
- puede carecer de trazabilidad.

La información de alto riesgo puede requerir confirmación y registro posterior.$BODY_558$, 18
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_escrita_18', 'Comunicación escrita', $BODY_559$Ventajas:

- deja evidencia;
- favorece uniformidad;
- permite consulta posterior.

Riesgos:

- redacción ambigua;
- exceso de extensión;
- desactualización;
- demora en lectura.

Una comunicación escrita no es efectiva solamente por existir.$BODY_559$, 19
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_electr_nica_19', 'Comunicación electrónica', $BODY_560$Incluye sistemas institucionales digitales.

Debe considerar:

- seguridad;
- confidencialidad;
- destinatario correcto;
- trazabilidad;
- urgencia;
- riesgo de mensajes no leídos.

Un canal electrónico asincrónico no es apropiado para una emergencia que requiere respuesta inmediata.$BODY_560$, 20
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'selecci_n_del_medio_20', 'Selección del medio', $BODY_561$Preguntas útiles:

1. ¿Es urgente?
2. ¿Es confidencial?
3. ¿Es complejo?
4. ¿Necesita explicación?
5. ¿Requiere registro?
6. ¿Quién debe recibirlo?
7. ¿Necesito verificar comprensión?

La combinación de medios puede ser necesaria.$BODY_561$, 21
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'principios_de_comunicaci_n_administrativa_21', 'Principios de comunicación administrativa', $BODY_562$Un mensaje administrativo efectivo debe buscar:

- claridad;
- precisión;
- oportunidad;
- coherencia;
- suficiencia;
- respeto;
- retroalimentación;
- confidencialidad cuando corresponda.$BODY_562$, 22
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'claridad_22', 'Claridad', $BODY_563$Evitar expresiones vagas como:

- “hazlo pronto”;
- “vigílalo bien”;
- “resuelve eso”.

Es preferible indicar:

- qué se espera;
- cuándo;
- quién es responsable;
- qué debe reportarse.$BODY_563$, 23
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'precisi_n_y_brevedad_23', 'Precisión y brevedad', $BODY_564$Brevedad no significa omitir datos esenciales.

Precisión significa comunicar exactamente lo necesario para que la acción sea correcta.

En situaciones críticas, los mensajes extensos y desordenados pueden retrasar decisiones.$BODY_564$, 24
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'oportunidad_24', 'Oportunidad', $BODY_565$La información correcta comunicada demasiado tarde puede perder utilidad.

Ejemplos:

- deterioro de un paciente;
- falta de personal;
- equipo defectuoso;
- error detectado;
- cambio urgente de prioridad.$BODY_565$, 25
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'coherencia_y_congruencia_25', 'Coherencia y congruencia', $BODY_566$El contenido verbal, el tono, la conducta y la intención deben ser compatibles.

Una jefatura que dice promover participación, pero castiga toda discrepancia, genera incongruencia comunicativa.$BODY_566$, 26
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'completitud_y_relevancia_26', 'Completitud y relevancia', $BODY_567$El mensaje debe contener la información necesaria para actuar, sin ocultar lo importante entre datos irrelevantes.

Antes de comunicar:

- priorizar;
- ordenar;
- sintetizar.$BODY_567$, 27
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'respeto_y_profesionalismo_27', 'Respeto y profesionalismo', $BODY_568$El respeto facilita intercambio de información y seguridad psicológica.

No significa evitar desacuerdos.

Es posible cuestionar una decisión de forma profesional cuando existe una preocupación fundada.$BODY_568$, 28
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'confidencialidad_y_necesidad_de_saber_28', 'Confidencialidad y necesidad de saber', $BODY_569$No toda información debe circular a toda la organización.

Compartir información debe responder a:

- función;
- necesidad legítima;
- cuidado;
- seguridad;
- obligación legal o institucional.

La curiosidad no constituye necesidad de saber.$BODY_569$, 29
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'escucha_activa_29', 'Escucha activa', $BODY_570$Escuchar implica más que permanecer en silencio.

Incluye:

- prestar atención;
- no interrumpir innecesariamente;
- identificar la idea central;
- aclarar dudas;
- verificar comprensión;
- reconocer información no verbal relevante.

Una jefatura que no escucha pierde datos operativos importantes.$BODY_570$, 30
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preguntas_y_aclaraci_n_30', 'Preguntas y aclaración', $BODY_571$Preguntar es una herramienta de seguridad.

Cuando una instrucción es ambigua:

> aclarar antes de asumir.

Preguntas útiles:

- “¿Cuál es la prioridad?”
- “¿Quién queda responsable?”
- “¿A qué hora debe completarse?”
- “¿Qué debo hacer si ocurre X?”$BODY_571$, 31
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'barreras_de_comunicaci_n_31', 'Barreras de comunicación', $BODY_572$Balderas incluye barreras como:

- incongruencia entre contenido e intención;
- deficiente redacción;
- falta de claridad;
- no saber escuchar;
- descuidos y omisiones.

En servicios modernos también pueden observarse sobrecarga, jerarquía rígida, fallas tecnológicas, interrupciones y exceso de canales.$BODY_572$, 32
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'incongruencia_entre_contenido_e_intenci_n_32', 'Incongruencia entre contenido e intención', $BODY_573$Ocurre cuando el mensaje expresa una cosa pero la conducta comunica otra.

Ejemplo:

“Puedes decirme cualquier problema”, acompañado de represalias cuando alguien reporta una falla.

Consecuencia: disminuye la confianza.$BODY_573$, 33
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'deficiente_redacci_n_33', 'Deficiente redacción', $BODY_574$Problemas frecuentes:

- frases ambiguas;
- abreviaturas no estandarizadas;
- falta de estructura;
- instrucciones contradictorias;
- omisión de fecha, responsable o plazo.$BODY_574$, 34
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'falta_de_claridad_34', 'Falta de claridad', $BODY_575$La persona receptora no debería tener que adivinar:

- qué se solicita;
- cuál es la prioridad;
- cuándo debe actuar;
- qué resultado se espera.$BODY_575$, 35
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'no_saber_escuchar_35', 'No saber escuchar', $BODY_576$Interrumpir, prejuzgar o responder antes de comprender puede hacer que se pierda información crítica.

Escuchar es especialmente importante cuando el personal operativo reporta un riesgo que todavía no aparece en los indicadores formales.$BODY_576$, 36
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'descuidos_y_omisiones_36', 'Descuidos y omisiones', $BODY_577$Una omisión puede ser tan peligrosa como un dato incorrecto.

Ejemplos:

- no informar una alergia;
- no comunicar que un equipo está fuera de servicio;
- no informar una ausencia inesperada;
- omitir una tarea pendiente durante relevo.$BODY_577$, 37
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'jerarqu_a_y_miedo_a_hablar_37', 'Jerarquía y miedo a hablar', $BODY_578$Una estructura excesivamente punitiva puede inhibir la comunicación ascendente.

Consecuencia:

- problemas ocultos;
- errores no reportados;
- decisiones basadas en información incompleta.

La autoridad administrativa debe facilitar comunicación responsable, no silenciarla.$BODY_578$, 38
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'sobrecarga_de_informaci_n_38', 'Sobrecarga de información', $BODY_579$Demasiados mensajes, avisos o grupos pueden producir:

- fatiga;
- omisiones;
- pérdida de prioridad;
- retrasos.

Una organización debe diferenciar información rutinaria de información crítica.$BODY_579$, 39
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'suposiciones_tecnicismos_y_jergas_39', 'Suposiciones, tecnicismos y jergas', $BODY_580$No asumir que todas las personas interpretan un término igual.

Las abreviaturas o jergas pueden generar confusión entre servicios diferentes.$BODY_580$, 40
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'emociones_y_conflictos_40', 'Emociones y conflictos', $BODY_581$En situaciones de tensión:

- separar hechos de interpretaciones;
- evitar ataques personales;
- centrarse en el problema;
- definir acciones concretas.

El conflicto no se resuelve elevando el volumen de voz.$BODY_581$, 41
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fallas_tecnol_gicas_y_del_canal_41', 'Fallas tecnológicas y del canal', $BODY_582$Si el canal falla, debe existir alternativa.

Ejemplo:

si el sistema electrónico no funciona y hay información urgente, no esperar pasivamente a que vuelva el sistema.

La contingencia comunicativa también forma parte de la gestión.$BODY_582$, 42
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_y_liderazgo_42', 'Comunicación y liderazgo', $BODY_583$El liderazgo administrativo se ejerce en gran medida mediante comunicación.

Un líder necesita:

- explicar prioridades;
- escuchar;
- dar retroalimentación;
- reconocer problemas;
- facilitar coordinación;
- comunicar decisiones difíciles.$BODY_583$, 43
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_y_toma_de_decisiones_43', 'Comunicación y toma de decisiones', $BODY_584$La calidad de una decisión depende de la calidad de la información disponible.

Problemas frecuentes:

- información incompleta;
- datos tardíos;
- sesgos;
- falta de consulta a quienes ejecutan el proceso.$BODY_584$, 44
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_y_delegaci_n_44', 'Comunicación y delegación', $BODY_585$Una delegación segura debe comunicar:

- tarea;
- objetivo;
- límites;
- plazo;
- circunstancias que deben reportarse;
- nivel de supervisión.

Delegar con una frase vaga como “encárgate de todo” favorece errores.$BODY_585$, 45
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_y_supervisi_n_45', 'Comunicación y supervisión', $BODY_586$Supervisar incluye:

- observar;
- orientar;
- corregir;
- reforzar;
- documentar cuando corresponda;
- reevaluar.

La retroalimentación debe ser específica y orientada a mejorar desempeño.$BODY_586$, 46
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_y_coordinaci_n_del_cuidado_46', 'Comunicación y coordinación del cuidado', $BODY_587$La continuidad depende de que información relevante pase correctamente entre:

- turnos;
- unidades;
- disciplinas;
- niveles de atención.

Una falla de coordinación puede duplicar intervenciones o dejar tareas sin realizar.$BODY_587$, 47
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_interprofesional_47', 'Comunicación interprofesional', $BODY_588$Debe favorecer:

- objetivos compartidos;
- lenguaje comprensible;
- respeto por roles;
- identificación de prioridades;
- resolución rápida de discrepancias relevantes.

La jerarquía profesional no debe impedir comunicar un riesgo clínico.$BODY_588$, 48
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_en_el_cambio_de_turno_48', 'Comunicación en el cambio de turno', $BODY_589$El relevo debe transferir información necesaria para la continuidad.

Debe evitar:

- datos irrelevantes;
- omisiones críticas;
- interrupciones;
- suposiciones.

El formato exacto depende de la institución; este material no presenta un formato único como norma CICDE.$BODY_589$, 49
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_en_reuniones_49', 'Comunicación en reuniones', $BODY_590$Una reunión administrativa debe tener:

- propósito;
- participantes pertinentes;
- información previa cuando sea necesaria;
- agenda o problema definido;
- acuerdos;
- responsables;
- seguimiento.

Reunirse sin propósito claro consume recursos sin mejorar gestión.$BODY_590$, 50
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'brief_huddle_y_debrief_50', 'Brief, huddle y debrief', $BODY_591$TeamSTEPPS utiliza herramientas de coordinación como:

- **brief:** anticipar el plan;
- **huddle:** ajustar el plan cuando cambia la situación;
- **debrief:** revisar desempeño y aprender después.

Son ejemplos complementarios de cómo la comunicación apoya coordinación y aprendizaje de equipo.$BODY_591$, 51
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'sbar_como_herramienta_estructurada_51', 'SBAR como herramienta estructurada', $BODY_592$SBAR organiza una comunicación en:

- **S — Situation:** qué ocurre ahora;
- **B — Background:** antecedentes relevantes;
- **A — Assessment:** valoración de la situación;
- **R — Recommendation/Request:** qué se recomienda o solicita.

AHRQ lo utiliza como marco para comunicar información crítica de forma concisa.

### Regla
SBAR es una herramienta complementaria de comunicación en salud; **no es un subtema textual del CICDE para ADMIN-08**.$BODY_592$, 52
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_de_circuito_cerrado_52', 'Comunicación de circuito cerrado', $BODY_593$Principio:

```text
Emisor comunica → receptor confirma/repite → emisor verifica
```

Es especialmente útil cuando:

- hay riesgo;
- el ambiente es ruidoso;
- se transmiten instrucciones críticas;
- existe posibilidad de confusión.$BODY_593$, 53
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informaci_n_cr_tica_y_escalamiento_53', 'Información crítica y escalamiento', $BODY_594$Cuando una información puede afectar seguridad o continuidad, no basta con “haberla enviado”.

Debe asegurarse:

- receptor apropiado;
- oportunidad;
- confirmación;
- escalamiento si no hay respuesta.$BODY_594$, 54
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_de_incidentes_y_riesgos_54', 'Comunicación de incidentes y riesgos', $BODY_595$Ante un evento o riesgo:

1. proteger primero al paciente cuando corresponda;
2. comunicar a quien deba intervenir;
3. documentar según política;
4. facilitar análisis y prevención.

Ocultar información para evitar consecuencias personales perjudica la seguridad.$BODY_595$, 55
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'paciente_y_familia_relaci_n_con_el_proceso_adminis_55', 'Paciente y familia: relación con el proceso administrativo', $BODY_596$ADMIN-08 no sustituye el estudio de comunicación terapéutica.

Sin embargo, la administración influye en:

- canales de información;
- continuidad;
- coordinación;
- quejas;
- educación organizada;
- participación del paciente y familia.

La comunicación con pacientes debe respetar derechos, privacidad y competencia profesional.$BODY_596$, 56
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_y_cultura_organizacional_56', 'Comunicación y cultura organizacional', $BODY_597$La cultura determina qué ocurre cuando alguien:

- pregunta;
- discrepa;
- informa un error;
- solicita ayuda;
- reporta un riesgo.

Una cultura segura favorece aprendizaje y comunicación abierta con responsabilidad.$BODY_597$, 57
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'rumores_y_redes_informales_57', 'Rumores y redes informales', $BODY_598$Los rumores aumentan cuando existe:

- incertidumbre;
- ausencia de información oficial;
- cambios sin explicación;
- desconfianza.

La respuesta administrativa apropiada es comunicar información verificable y oportuna, no alimentar especulación.$BODY_598$, 58
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'reuniones_administrativas_efectivas_58', 'Reuniones administrativas efectivas', $BODY_599$Antes:
- objetivo;
- participantes;
- datos.

Durante:
- mantener foco;
- escuchar;
- distinguir hechos de opiniones;
- definir decisiones.

Después:
- acuerdos;
- responsables;
- plazos;
- seguimiento.$BODY_599$, 59
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'registro_y_trazabilidad_59', 'Registro y trazabilidad', $BODY_600$Cuando una comunicación produce una decisión relevante, debe conservarse la trazabilidad correspondiente.

La forma depende de la institución y del tipo de información.

La trazabilidad permite responder:

- qué se decidió;
- quién fue informado;
- quién quedó responsable;
- cuándo debía cumplirse.$BODY_600$, 60
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'diferencia_entre_admin_08_y_admin_11_60', 'Diferencia entre ADMIN-08 y ADMIN-11', $BODY_601$**ADMIN-08 — Comunicación en el proceso administrativo**
- proceso comunicativo;
- flujos;
- barreras;
- medios;
- retroalimentación;
- coordinación.

**ADMIN-11 — Elaboración de informes**
- se centrará específicamente en estructurar y producir informes administrativos.

No deben estudiarse como el mismo tema.$BODY_601$, 61
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_examen_61', 'Errores frecuentes de examen', $BODY_602$1. Creer que comunicar equivale a enviar un mensaje.
2. No comprobar comprensión.
3. Utilizar un canal lento para una urgencia.
4. Confundir comunicación informal con documentación oficial.
5. Pensar que comunicación descendente es la única válida.
6. Castigar la comunicación ascendente de riesgos.
7. Delegar sin especificar tarea, límites y seguimiento.
8. Suponer que más información siempre significa mejor comunicación.
9. Usar tecnicismos innecesarios.
10. Omitir información crítica durante un relevo.
11. Confundir SBAR con una norma textual del CICDE.
12. Confundir comunicación administrativa con comunicación terapéutica.
13. Creer que un correo enviado garantiza recepción.
14. Documentar información confidencial en canales no autorizados.
15. Realizar reuniones sin decisiones ni seguimiento.
16. Confundir ADMIN-08 con elaboración de informes de ADMIN-11.$BODY_602$, 62
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estrategia_cicde_para_admin_08_62', 'Estrategia CICDE para ADMIN-08', $BODY_603$Ante una situación de comunicación:

**Paso 1:** identificar qué información necesita transmitirse.  
**Paso 2:** reconocer quién debe recibirla.  
**Paso 3:** valorar urgencia y riesgo.  
**Paso 4:** seleccionar canal adecuado.  
**Paso 5:** comunicar con claridad.  
**Paso 6:** verificar comprensión.  
**Paso 7:** documentar o escalar cuando corresponda.$BODY_603$, 63
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'situaciones_originales_tipo_examen_63', 'Situaciones originales tipo examen', $BODY_604$## Caso 1 — Instrucción ambigua
Una supervisora dice: “Resuelvan rápidamente los pendientes”, sin indicar prioridades ni responsables.

**Mejor acción:** aclarar tareas, prioridades, responsables y plazo.

## Caso 2 — Información urgente por correo
Una enfermera detecta un riesgo inmediato y envía un correo a la jefatura esperando que lo lea.

**Mejor acción:** utilizar un canal inmediato y verificar recepción; luego documentar según corresponda.

## Caso 3 — Comunicación ascendente
Una enfermera identifica falta de insumos críticos pero teme reportarlo porque la jefatura suele reaccionar mal.

**Interpretación:** existe una barrera jerárquica que puede comprometer seguridad y toma de decisiones.

## Caso 4 — Delegación
La jefa dice a una colaboradora: “encárgate de la unidad”.

**Problema:** la instrucción no define tarea, límites, prioridad ni seguimiento.

## Caso 5 — Relevo
Durante el cambio de turno se omite que un paciente requiere vigilancia frecuente.

**Riesgo:** pérdida de continuidad por omisión de información crítica.

## Caso 6 — Mensaje contradictorio
La jefatura pide “comunicación abierta”, pero ridiculiza a quien cuestiona un procedimiento inseguro.

**Problema:** incongruencia entre contenido e intención/conducta.

## Caso 7 — Canal inadecuado
Se utiliza un grupo informal de mensajería para enviar información confidencial de pacientes.

**Conducta correcta:** usar canales institucionales autorizados y proteger confidencialidad.

## Caso 8 — Sobrecarga
El personal recibe decenas de avisos sin clasificación de prioridad.

**Problema:** sobrecarga informativa que favorece omisiones.

## Caso 9 — Comunicación horizontal
Enfermería coordina directamente con farmacia para resolver un problema de disponibilidad.

**Interpretación:** comunicación horizontal/interdepartamental orientada a coordinación.

## Caso 10 — SBAR
Una enfermera necesita comunicar un deterioro rápidamente y organiza situación, antecedentes, valoración y solicitud.

**Herramienta:** SBAR.

## Caso 11 — Circuito cerrado
Durante una situación crítica se indica una acción; quien la recibe la repite y el emisor confirma.

**Interpretación:** comunicación de circuito cerrado.

## Caso 12 — Rumor
Circula información no confirmada sobre cambios de turnos.

**Mejor conducta administrativa:** emitir información oficial verificable y evitar alimentar especulación.

## Caso 13 — Reunión sin seguimiento
Una reunión identifica problemas, pero no define responsables ni fechas.

**Problema:** comunicación sin cierre operativo ni seguimiento.

## Caso 14 — Supervisor que no escucha
El personal intenta explicar una falla recurrente y el supervisor interrumpe antes de conocer los datos.

**Barrera:** no saber escuchar.

## Caso 15 — Información crítica sin respuesta
Se comunica un riesgo a la persona responsable, pero no responde.

**Mejor acción:** escalar por el canal correspondiente; no asumir que “ya se informó”.

## Caso 16 — Informe vs comunicación
Una pregunta pide el principio administrativo que permite coordinar instrucciones y retroalimentación, no la estructura de un documento formal.

**Respuesta:** comunicación administrativa; la elaboración de informes corresponde a ADMIN-11.$BODY_604$, 64
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preguntas_r_pidas_de_repaso_64', 'Preguntas rápidas de repaso', $BODY_605$**1. ¿Qué completa el proceso de comunicación?**  
La retroalimentación que permite verificar comprensión.

**2. ¿Qué comunicación va de jefatura a personal operativo?**  
Descendente.

**3. ¿Qué comunicación lleva problemas desde el nivel operativo hacia dirección?**  
Ascendente.

**4. ¿Qué tipo ocurre entre áreas o profesionales de nivel similar?**  
Horizontal.

**5. ¿Qué barrera aparece cuando el mensaje y la conducta no coinciden?**  
Incongruencia entre contenido e intención.

**6. ¿Qué debe hacerse con una instrucción ambigua?**  
Aclararla antes de actuar.

**7. ¿Un correo enviado garantiza que el mensaje fue recibido?**  
No.

**8. ¿Qué herramienta organiza Situation, Background, Assessment y Recommendation?**  
SBAR.

**9. ¿Qué estrategia confirma el mensaje mediante repetición y verificación?**  
Comunicación de circuito cerrado/check-back.

**10. ¿ADMIN-08 y ADMIN-11 son el mismo tema?**  
No. ADMIN-08 estudia el proceso comunicativo; ADMIN-11 se enfoca en elaboración de informes.$BODY_605$, 65
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fuentes_y_validaci_n_65', 'Fuentes y validación', $BODY_606$## Fuente rectora

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** _Lineamientos para el Examen de Competencias de Profesionales de Enfermería_. Tercera edición. Panamá, 2026.  
   Define ADMIN-08: “La comunicación en el proceso administrativo”.

## Bibliografía principal indicada por CICDE

2. **Balderas Pedrero, María de la Luz.** _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015. ISBN 9786071512413.  
   La tabla de contenidos oficial del editor incluye, dentro de Funciones administrativas: Comunicación, propósitos, elementos, conceptos, métodos, tipos de comunicación administrativa, barreras, principios y medios.

## Fuentes complementarias

3. **OpenStax.** _Organizational Behavior — The Process of Managerial Communication_.  
   Complementa proceso comunicativo, retroalimentación y ruido.

4. **Agency for Healthcare Research and Quality (AHRQ).** _TeamSTEPPS — Communication Concepts and Tools_.  
   Complementa la aplicación de comunicación segura en equipos de salud.

5. **AHRQ.** _TeamSTEPPS Tool: SBAR_.  
   Marco estructurado para intercambio de información crítica.

6. **AHRQ.** _TeamSTEPPS Tool: Check-Back (Repeat-Back)_.  
   Comunicación de circuito cerrado para verificar el mensaje.$BODY_606$, 66
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'actualizaciones_y_l_mites_de_interpretaci_n_66', 'Actualizaciones y límites de interpretación', $BODY_607$- CICDE no enumera subtemas específicos para ADMIN-08.
- La expansión se deriva principalmente de la estructura bibliográfica de Balderas citada por CICDE.
- SBAR, check-back, brief, huddle y debrief son herramientas complementarias de comunicación en salud; no se presentan como contenido textual del lineamiento CICDE.
- Los canales electrónicos concretos dependen de cada institución; no se declara una plataforma específica como norma nacional.
- ADMIN-08 no sustituye comunicación terapéutica ni el desarrollo detallado de informes de ADMIN-11.$BODY_607$, 67
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_de_calidad_67', 'Control de calidad', $BODY_608$Este paquete fue elaborado con estas reglas:

- alcance cotejado contra CICDE 2026;
- no se inventaron subtemas CICDE;
- expansión principal apoyada en la tabla de contenidos oficial de Balderas 7.ª edición;
- se cubren propósitos, elementos, métodos, tipos, barreras, principios y medios;
- se distingue comunicación formal de informal;
- se distinguen flujos descendente, ascendente, horizontal y diagonal;
- se integra retroalimentación y escucha;
- se aplica el tema a liderazgo, delegación, supervisión y coordinación del cuidado;
- herramientas AHRQ se presentan como complementarias;
- no se presenta un formato institucional específico como regla universal;
- se mantiene separación con ADMIN-11;
- situaciones tipo examen son originales;
- no se declara revisión humana inexistente.$BODY_608$, 68
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estado_para_integraci_n_68', 'Estado para integración', $BODY_609$**Estado:** `REVIEW`

Motivo:

- alcance y contenido fueron sometidos a revisión documental/académica;
- no existe todavía revisor humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` por revisión de IA.

**Cobertura CICDE ADMIN-08: tema principal cubierto conforme al alcance disponible.**

**Situaciones originales tipo examen: 16.**$BODY_609$, 69
FROM admin_lesson_map WHERE topic_code = 'ADMIN-08';

-- ADMIN-09: Dotación de recursos humanos (74 sections)

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'alcance_oficial_cicde_0', 'Alcance oficial CICDE', $BODY_610$El temario CICDE 2026 incluye dentro del área **Administración** el tema:

> **Dotación de recursos humanos**

El lineamiento no enumera subtemas explícitos para ADMIN-09.

Para desarrollar el tema sin atribuir al CICDE una estructura que no aparece en el documento rector, este paquete utiliza como bibliografía principal la obra indicada por CICDE:

**Balderas Pedrero, María de la Luz. _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015.**

La tabla de contenidos oficial del editor incluye, dentro de la administración aplicada a enfermería:

- cálculo de personal de enfermería;
- indicadores;
- procedimiento;
- factores que afectan la dotación de personal;
- cálculo y clasificación del ausentismo;
- administración e integración de recursos humanos de enfermería.

Este paquete se concentra en **cómo estimar, distribuir, programar y ajustar el personal necesario para prestar cuidados seguros y continuos**, sin convertir una razón fija de enfermeras/pacientes o una fórmula local en regla universal del CICDE.$BODY_610$, 1
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_de_aprendizaje_1', 'Objetivos de aprendizaje', $BODY_611$Al finalizar el tema, el estudiante debe ser capaz de:

1. Explicar qué significa dotación de recursos humanos en enfermería.
2. Diferenciar dotación, asignación de pacientes e integración de recursos humanos.
3. Identificar los factores que modifican la necesidad de personal.
4. Relacionar carga de trabajo, complejidad del paciente, competencias y cobertura horaria con la dotación.
5. Reconocer por qué el número de camas o pacientes, por sí solo, no determina una dotación segura.
6. Interpretar el propósito de indicadores de personal, ausentismo y cobertura.
7. Comprender que los métodos de cálculo requieren datos y parámetros institucionales verificables.
8. Reconocer el enfoque basado en carga de trabajo de la metodología WISN de la OMS.
9. Aplicar principios de distribución equitativa del personal entre servicios y turnos.
10. Identificar riesgos relacionados con déficit, exceso o distribución inadecuada del personal.
11. Integrar competencias, experiencia y supervisión al decidir asignaciones.
12. Ajustar la dotación ante cambios de censo, gravedad, ausencias o emergencias.
13. Relacionar dotación con calidad, seguridad, continuidad y bienestar del personal.
14. Resolver situaciones tipo CICDE sobre planificación y redistribución de recursos humanos.$BODY_611$, 2
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'concepto_de_dotaci_n_de_recursos_humanos_2', 'Concepto de dotación de recursos humanos', $BODY_612$En administración de enfermería, **dotar** significa determinar y disponer del personal necesario para responder a las necesidades del servicio.

No es solamente preguntar:

> “¿Cuántas enfermeras hay?”

También implica valorar:

- cuántas personas se requieren;
- qué competencias deben tener;
- en qué turno o área deben estar;
- qué carga de trabajo existe;
- qué nivel de supervisión se necesita;
- cómo se mantendrá la continuidad del servicio.$BODY_612$, 3
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'por_qu_la_dotaci_n_es_una_decisi_n_de_cuidado_3', 'Por qué la dotación es una decisión de cuidado', $BODY_613$La dotación tiene consecuencias directas sobre:

- oportunidad de la atención;
- vigilancia del paciente;
- administración segura de medicamentos;
- respuesta ante deterioro;
- prevención de eventos adversos;
- educación del paciente;
- continuidad del cuidado;
- carga laboral del equipo.

Por eso no debe entenderse como una decisión exclusivamente presupuestaria.$BODY_613$, 4
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'dotaci_n_no_es_lo_mismo_que_asignaci_n_4', 'Dotación no es lo mismo que asignación', $BODY_614$**Dotación** responde principalmente:

> ¿Cuánto personal y qué combinación de personal necesita el servicio?

**Asignación** responde:

> ¿Qué pacientes, actividades o responsabilidades tendrá cada integrante durante un turno determinado?

Puede existir un número aparentemente suficiente de personas y aun así una asignación insegura si la distribución de pacientes complejos es inadecuada.$BODY_614$, 5
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'dotaci_n_no_es_lo_mismo_que_reclutamiento_y_selecc_5', 'Dotación no es lo mismo que reclutamiento y selección', $BODY_615$Reclutamiento, selección, contratación, orientación y desarrollo forman parte de la administración de recursos humanos.

La **dotación**, en sentido operativo, se concentra en determinar necesidades y asegurar cobertura apropiada.

Una vacante puede ser problema de contratación; la forma en que esa vacante afecta turnos y carga de trabajo es problema de dotación.$BODY_615$, 6
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'datos_que_deben_preceder_una_decisi_n_de_dotaci_n_6', 'Datos que deben preceder una decisión de dotación', $BODY_616$Antes de decidir cuántas personas necesita un servicio deben conocerse, según el contexto:

- demanda de atención;
- número y tipo de pacientes/usuarios;
- complejidad o dependencia;
- actividades requeridas;
- volumen de procedimientos;
- horarios de mayor demanda;
- competencias disponibles;
- ausencias previsibles e imprevistas;
- organización física del servicio;
- recursos tecnológicos y auxiliares;
- normas y políticas institucionales.$BODY_616$, 7
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'demanda_del_servicio_7', 'Demanda del servicio', $BODY_617$La necesidad de personal cambia con la demanda.

Ejemplos:

- mayor número de consultas;
- aumento de ingresos hospitalarios;
- apertura de nuevas camas;
- campañas de vacunación;
- brotes;
- ampliación de cartera de servicios;
- incremento de cirugías o procedimientos.

La dotación debe responder a la actividad real y prevista.$BODY_617$, 8
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'carga_de_trabajo_8', 'Carga de trabajo', $BODY_618$La carga de trabajo incluye el volumen de actividades y el tiempo/esfuerzo que requiere realizarlas.

Dos unidades con el mismo número de pacientes pueden tener cargas de trabajo muy diferentes.

Por ejemplo, una unidad con pacientes estables y otra con pacientes dependientes, múltiples tratamientos y vigilancia frecuente no requieren necesariamente la misma combinación de personal.$BODY_618$, 9
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'complejidad_dependencia_y_acuidad_9', 'Complejidad, dependencia y acuidad', $BODY_619$Para dotación interesa conocer cuánto cuidado necesita cada paciente.

Factores que pueden aumentar demanda de enfermería:

- inestabilidad clínica;
- dependencia para actividades básicas;
- vigilancia frecuente;
- múltiples medicamentos o terapias;
- aislamiento;
- riesgo de caídas;
- alteración cognitiva;
- procedimientos complejos;
- educación intensiva;
- necesidades psicosociales importantes.

La clasificación específica depende de las herramientas institucionales disponibles.$BODY_619$, 10
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tipo_de_servicio_10', 'Tipo de servicio', $BODY_620$No se dota del mismo modo:

- consulta externa;
- atención primaria;
- hospitalización;
- urgencias;
- quirófano;
- cuidados intensivos;
- salud mental;
- pediatría;
- obstetricia;
- comunidad.

Cada servicio presenta actividades, ritmos y requerimientos diferentes.$BODY_620$, 11
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cobertura_de_24_horas_11', 'Cobertura de 24 horas', $BODY_621$Los servicios continuos requieren planificación para cubrir:

- turno diurno;
- turno vespertino cuando exista;
- turno nocturno;
- fines de semana;
- feriados;
- relevo entre turnos;
- ausencias.

La cantidad de trabajadores contratados no equivale automáticamente a la cantidad disponible simultáneamente.$BODY_621$, 12
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'mezcla_de_competencias_12', 'Mezcla de competencias', $BODY_622$La dotación no debe basarse solamente en “cabezas”.

También debe considerar la **mezcla de competencias** del equipo:

- formación;
- experiencia;
- certificaciones o entrenamiento requerido;
- capacidad para procedimientos específicos;
- capacidad de supervisión;
- competencias de liderazgo.

Cinco personas no son intercambiables si sus competencias son distintas.$BODY_622$, 13
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'competencia_y_experiencia_13', 'Competencia y experiencia', $BODY_623$Una unidad con personal mayoritariamente nuevo puede requerir:

- mayor supervisión;
- asignaciones progresivas;
- apoyo de personal experimentado;
- orientación estructurada.

La seguridad depende de **cantidad + competencia + apoyo**.$BODY_623$, 14
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'distribuci_n_f_sica_del_servicio_14', 'Distribución física del servicio', $BODY_624$La arquitectura influye en la carga administrativa y asistencial.

Ejemplos:

- habitaciones muy separadas;
- varias plantas;
- áreas de aislamiento;
- grandes distancias hasta insumos;
- unidades dispersas.

La distribución física puede aumentar tiempos de desplazamiento y vigilancia.$BODY_624$, 15
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tecnolog_a_y_personal_de_apoyo_15', 'Tecnología y personal de apoyo', $BODY_625$La tecnología puede modificar el trabajo, pero no siempre lo reduce.

Deben considerarse:

- sistemas de información;
- bombas de infusión;
- monitorización;
- transporte interno;
- farmacia;
- apoyo administrativo;
- auxiliares y técnicos según organización.

Una tecnología nueva también puede crear necesidades de capacitación y verificación.$BODY_625$, 16
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'normas_y_pol_ticas_institucionales_16', 'Normas y políticas institucionales', $BODY_626$La programación de personal debe respetar:

- legislación laboral aplicable;
- perfiles y ámbitos de práctica;
- políticas de jornada y descanso;
- requerimientos de supervisión;
- normas de seguridad;
- criterios institucionales de cobertura.

No deben inventarse límites o proporciones que no estén respaldados por la norma o institución correspondiente.$BODY_626$, 17
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'presupuesto_y_disponibilidad_real_17', 'Presupuesto y disponibilidad real', $BODY_627$La planificación ocurre dentro de recursos finitos.

El responsable administrativo debe equilibrar:

- necesidad asistencial;
- disponibilidad presupuestaria;
- plazas existentes;
- personal disponible;
- seguridad del paciente.

La restricción presupuestaria es un dato administrativo, pero no convierte automáticamente una dotación insuficiente en segura.$BODY_627$, 18
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ausencias_previsibles_18', 'Ausencias previsibles', $BODY_628$Existen ausencias que pueden anticiparse en la programación:

- vacaciones;
- capacitación autorizada;
- licencias planificadas;
- permisos programados.

Estas deben incorporarse al plan antes de construir la cobertura final.$BODY_628$, 19
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ausencias_imprevistas_19', 'Ausencias imprevistas', $BODY_629$Pueden ocurrir por:

- enfermedad;
- emergencia familiar;
- incapacidad inesperada;
- otros eventos no previstos.

La administración debe contar con mecanismos de contingencia y no depender exclusivamente de improvisación.$BODY_629$, 20
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'vacantes_y_rotaci_n_20', 'Vacantes y rotación', $BODY_630$Una plantilla aprobada puede no representar la dotación real si existen:

- puestos vacantes;
- renuncias;
- jubilaciones;
- traslados;
- rotación frecuente.

Debe distinguirse entre **puestos autorizados** y **personal efectivamente disponible**.$BODY_630$, 21
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'personal_en_orientaci_n_21', 'Personal en orientación', $BODY_631$Una persona recién incorporada no siempre puede asumir inmediatamente la misma carga que alguien plenamente orientado.

Durante la incorporación deben considerarse:

- conocimiento del servicio;
- competencias demostradas;
- supervisión;
- progresión de responsabilidades.$BODY_631$, 22
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'personal_flotante_o_de_apoyo_22', 'Personal flotante o de apoyo', $BODY_632$Mover personal entre unidades puede ayudar a cubrir necesidades, pero la decisión debe considerar:

- competencia para el área receptora;
- familiaridad con procedimientos;
- complejidad de pacientes;
- supervisión disponible;
- alcance de práctica.

“Hay una persona disponible” no significa necesariamente “es la persona adecuada para esa unidad”.$BODY_632$, 23
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'el_censo_por_s_solo_es_insuficiente_23', 'El censo por sí solo es insuficiente', $BODY_633$Contar pacientes es útil, pero no describe completamente el trabajo.

Ejemplo:

- 20 pacientes estables ≠ 20 pacientes con alta dependencia y múltiples intervenciones.

La dotación debe interpretar el **tipo de demanda**, no solamente el número.$BODY_633$, 24
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ocupaci_n_de_camas_24', 'Ocupación de camas', $BODY_634$La ocupación ayuda a valorar utilización del servicio, pero debe analizarse junto con:

- gravedad;
- ingresos;
- egresos;
- traslados;
- procedimientos;
- rotación de camas.

Una unidad puede tener ocupación moderada y, sin embargo, alta carga por gran movimiento de pacientes.$BODY_634$, 25
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ingresos_egresos_y_traslados_25', 'Ingresos, egresos y traslados', $BODY_635$Estos eventos generan trabajo adicional:

- valoración inicial;
- conciliación de información;
- documentación;
- educación;
- coordinación;
- preparación del paciente;
- comunicación entre servicios.

Por eso el flujo de pacientes modifica la carga aunque el censo final parezca estable.$BODY_635$, 26
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'picos_de_demanda_26', 'Picos de demanda', $BODY_636$La demanda no siempre es uniforme durante el día.

Pueden existir picos asociados a:

- rondas;
- administración de medicamentos;
- procedimientos;
- ingresos programados;
- horarios de consulta;
- cirugías;
- campañas;
- emergencias.

Una dotación promedio puede ocultar periodos de sobrecarga.$BODY_636$, 27
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'trabajo_indirecto_y_no_asistencial_27', 'Trabajo indirecto y no asistencial', $BODY_637$Enfermería también utiliza tiempo en:

- documentación;
- coordinación;
- reuniones;
- preparación de equipos;
- supervisión;
- educación;
- control de inventarios;
- actividades administrativas.

Ignorar estas tareas subestima la carga real.$BODY_637$, 28
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'continuidad_del_cuidado_28', 'Continuidad del cuidado', $BODY_638$Una programación adecuada busca evitar que la cobertura dependa de soluciones improvisadas constantes.

La continuidad se favorece cuando existen:

- horarios previsibles;
- relevo suficiente;
- competencias disponibles;
- comunicación entre turnos;
- planes para ausencias.$BODY_638$, 29
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'c_lculo_de_personal_en_balderas_29', 'Cálculo de personal en Balderas', $BODY_639$La tabla de contenidos oficial de Balderas incluye específicamente:

- **Cálculo de personal de enfermería**;
- **Indicadores**;
- **Procedimiento**;
- **Factores que afectan la dotación de personal**;
- **Cálculo de ausentismo**.

Esto confirma que ADMIN-09 debe preparar al estudiante para comprender la lógica del cálculo y los factores que lo modifican.

Este paquete **no reproduce una fórmula del libro** porque no se cuenta aquí con autorización ni verificación de texto completo suficiente para atribuir una fórmula específica a esa edición.$BODY_639$, 30
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'indicadores_para_dotaci_n_30', 'Indicadores para dotación', $BODY_640$Un indicador transforma datos del servicio en información útil para decidir.

Pueden utilizarse, según institución:

- demanda de pacientes;
- horas de cuidado;
- cobertura por turno;
- ausentismo;
- vacantes;
- rotación;
- horas extraordinarias;
- productividad;
- eventos de seguridad;
- resultados del servicio.

El indicador debe interpretarse, no obedecerse mecánicamente.$BODY_640$, 31
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'procedimiento_de_c_lculo_principio_general_31', 'Procedimiento de cálculo: principio general', $BODY_641$Un cálculo serio necesita como mínimo:

1. definir el servicio y la población;
2. identificar actividades/carga;
3. conocer tiempo disponible del personal;
4. considerar ausencias y actividades no asistenciales;
5. determinar competencias requeridas;
6. comparar necesidad con disponibilidad;
7. validar contra realidad operativa;
8. revisar periódicamente.

La fórmula exacta dependerá del método institucional o normativo utilizado.$BODY_641$, 32
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'no_inventar_razones_universales_32', 'No inventar razones universales', $BODY_642$No existe una única razón enfermera/paciente aplicable sin contexto a todos los países, servicios y niveles de atención.

Una pregunta de examen puede presentar datos institucionales específicos. En ese caso deben utilizarse esos datos.

Si no se proporciona una norma o parámetro, no debe inventarse.$BODY_642$, 33
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'planificaci_n_basada_en_carga_de_trabajo_33', 'Planificación basada en carga de trabajo', $BODY_643$Los métodos modernos de planificación buscan relacionar personal con el trabajo que realmente debe realizarse.

La OMS destaca que las necesidades dependen de:

- número de trabajadores;
- competencias;
- disponibilidad;
- organización;
- distribución;
- demanda de servicios.

Esto evita asumir que una simple razón poblacional describe toda la necesidad operativa.$BODY_643$, 34
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'metodolog_a_wisn_34', 'Metodología WISN', $BODY_644$La OMS utiliza **Workload Indicators of Staffing Need (WISN)** como metodología para estimar necesidades de personal a partir de carga de trabajo y estándares de tiempo por actividad.

La idea central es:

> estimar personal desde lo que el servicio realmente hace y el tiempo disponible para hacerlo.

WISN es una herramienta de planificación de recursos humanos; no es un subtema explícito del CICDE ni una fórmula obligatoria para todas las instituciones panameñas.$BODY_644$, 35
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'qu_aporta_wisn_al_razonamiento_administrativo_35', 'Qué aporta WISN al razonamiento administrativo', $BODY_645$WISN ayuda a comprender que:

- dos establecimientos similares pueden tener cargas diferentes;
- la demanda local importa;
- debe conocerse el tiempo laboral disponible;
- las actividades asistenciales y de apoyo consumen tiempo;
- los resultados pueden mostrar déficit, equilibrio o excedente relativo respecto a la carga estimada.

Su aplicación formal requiere datos válidos y metodología completa.$BODY_645$, 36
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'limitaciones_de_cualquier_m_todo_de_c_lculo_36', 'Limitaciones de cualquier método de cálculo', $BODY_646$Un número calculado puede perder validez si cambian:

- cartera de servicios;
- volumen de pacientes;
- complejidad;
- tecnología;
- procesos;
- jornada laboral;
- ausentismo;
- competencias del equipo.

Por eso la dotación debe reevaluarse periódicamente.$BODY_646$, 37
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'panam_sistema_de_informaci_n_de_recursos_humanos_d_37', 'Panamá: Sistema de Información de Recursos Humanos de Salud', $BODY_647$Panamá implementa el **Sistema de Información de Recursos Humanos de Salud (SIRHS)** con apoyo de OPS/OMS.

El sistema busca fortalecer:

- registro del personal;
- planificación estratégica;
- administración de recursos humanos;
- identificación de brechas;
- distribución más adecuada;
- respuesta ante emergencias.

Para ADMIN-09 es un ejemplo actual de **planificación de personal basada en datos**.$BODY_647$, 38
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'panam_2026_integraci_n_y_validaci_n_de_datos_38', 'Panamá 2026: integración y validación de datos', $BODY_648$En abril de 2026, OPS/OMS y MINSA realizaron una Datatón para fortalecer el SIRHS.

La iniciativa informó la integración y validación de un gran volumen de datos de funcionarios de varias instituciones públicas con el propósito de apoyar una distribución más equitativa del personal y mejorar decisiones en áreas de mayor necesidad.

Este dato describe contexto nacional de planificación; no define una razón fija de dotación para enfermería.$BODY_648$, 39
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'distribuci_n_equitativa_del_personal_39', 'Distribución equitativa del personal', $BODY_649$Una fuerza laboral suficiente a nivel nacional puede estar mal distribuida.

Debe analizarse:

- región;
- área urbana/rural;
- nivel de atención;
- tipo de servicio;
- población atendida;
- demanda real.

Equidad significa asignar recursos según necesidades, no repartir el mismo número a todos los lugares.$BODY_649$, 40
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'programaci_n_de_turnos_40', 'Programación de turnos', $BODY_650$Una vez estimada la dotación se debe traducir en un horario operativo.

La programación debe considerar:

- cobertura necesaria;
- descansos;
- continuidad;
- competencias;
- ausencias;
- carga prevista;
- normativa laboral/institucional.$BODY_650$, 41
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cobertura_por_turno_41', 'Cobertura por turno', $BODY_651$La distribución puede variar entre turnos según:

- actividad programada;
- volumen esperado;
- apoyo disponible;
- procedimientos;
- gravedad;
- ingreso/egreso esperado.

No debe asumirse que todos los turnos necesitan exactamente el mismo número de personas.$BODY_651$, 42
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'noches_fines_de_semana_y_feriados_42', 'Noches, fines de semana y feriados', $BODY_652$Aunque algunos servicios tengan menor actividad programada, deben mantenerse capacidades para:

- vigilancia;
- respuesta a deterioro;
- emergencias;
- continuidad de tratamientos;
- cobertura mínima segura según política institucional.

La menor actividad administrativa no significa ausencia de necesidad clínica.$BODY_652$, 43
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'plan_de_contingencia_43', 'Plan de contingencia', $BODY_653$Una dotación responsable anticipa escenarios como:

- ausencia simultánea de personal;
- aumento brusco de pacientes;
- desastre;
- brote;
- falla de infraestructura;
- apertura temporal de camas.

El plan debe indicar cómo escalar recursos y quién toma decisiones.$BODY_653$, 44
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ausentismo_como_variable_administrativa_44', 'Ausentismo como variable administrativa', $BODY_654$Balderas incluye cálculo y clasificación del ausentismo dentro del análisis de dotación.

Para examen interesa entender que el ausentismo:

- reduce disponibilidad real;
- debe medirse;
- puede mostrar patrones;
- influye en programación;
- puede requerir acciones preventivas y de gestión.

No debe tratarse únicamente como problema disciplinario.$BODY_654$, 45
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'horas_extraordinarias_45', 'Horas extraordinarias', $BODY_655$Las horas extra pueden resolver una necesidad puntual, pero su uso repetido puede indicar:

- déficit estructural;
- mala programación;
- alta rotación;
- ausentismo elevado;
- aumento sostenido de demanda.

También deben considerarse fatiga y seguridad.$BODY_655$, 46
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fatiga_y_seguridad_46', 'Fatiga y seguridad', $BODY_656$Una estrategia de cobertura no es adecuada si depende continuamente de personal fatigado.

La administración debe considerar:

- duración de jornada;
- descansos;
- acumulación de turnos;
- carga física y mental;
- riesgos de error.

Las reglas concretas de jornada dependen de la normativa aplicable.$BODY_656$, 47
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'carga_segura_de_trabajo_47', 'Carga segura de trabajo', $BODY_657$“Más productividad” no significa simplemente asignar más pacientes por persona.

Una carga segura permite realizar:

- valoración;
- intervenciones;
- vigilancia;
- documentación;
- educación;
- comunicación;
- reevaluación.

Si actividades esenciales se omiten sistemáticamente, la dotación o la organización deben reevaluarse.$BODY_657$, 48
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'asignaci_n_seg_n_competencias_48', 'Asignación según competencias', $BODY_658$Una jefatura no distribuye solo cantidades; distribuye responsabilidad.

Antes de asignar debe valorar:

- estabilidad del paciente;
- procedimientos requeridos;
- experiencia del profesional;
- carga total;
- apoyo disponible.$BODY_658$, 49
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'asignaci_n_equilibrada_de_pacientes_49', 'Asignación equilibrada de pacientes', $BODY_659$Repartir “el mismo número de pacientes” puede ser inequitativo.

La asignación debe equilibrar:

- complejidad;
- dependencia;
- procedimientos;
- admisiones/egresos;
- necesidades educativas;
- vigilancia.$BODY_659$, 50
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'delegaci_n_y_dotaci_n_50', 'Delegación y dotación', $BODY_660$La falta de personal no autoriza delegar una actividad a alguien que no tiene competencia o autorización para realizarla.

La delegación segura requiere:

- tarea apropiada;
- persona competente;
- instrucciones claras;
- supervisión;
- evaluación del resultado.$BODY_660$, 51
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'supervisi_n_51', 'Supervisión', $BODY_661$Cuando aumenta la proporción de personal nuevo, flotante o en orientación, puede aumentar también la necesidad de supervisión.

La supervisión debe incluir:

- disponibilidad para resolver dudas;
- observación del desempeño;
- apoyo en prioridades;
- intervención ante riesgo.$BODY_661$, 52
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'papel_de_la_jefatura_de_enfermer_a_52', 'Papel de la jefatura de enfermería', $BODY_662$La jefatura participa en:

- estimar necesidades;
- elaborar horarios;
- revisar competencias;
- distribuir cargas;
- gestionar ausencias;
- solicitar refuerzos;
- monitorizar indicadores;
- documentar brechas;
- comunicar necesidades a niveles superiores.$BODY_662$, 53
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'redistribuci_n_durante_el_turno_53', 'Redistribución durante el turno', $BODY_663$La dotación no termina cuando se publica el horario.

Durante el turno puede ser necesario redistribuir porque:

- un paciente se deteriora;
- ingresan casos complejos;
- ocurre una emergencia;
- disminuye inesperadamente el personal;
- cambia la actividad.

La reevaluación debe ser continua.$BODY_663$, 54
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'escalamiento_cuando_la_dotaci_n_es_insuficiente_54', 'Escalamiento cuando la dotación es insuficiente', $BODY_664$Ante una brecha relevante, la respuesta administrativa puede incluir:

- priorizar cuidados esenciales;
- solicitar refuerzo;
- redistribuir personal competente;
- limitar actividades no urgentes cuando corresponda;
- comunicar riesgo;
- activar contingencia;
- documentar la situación.

Nunca debe ocultarse un riesgo de seguridad generado por cobertura insuficiente.$BODY_664$, 55
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'dotaci_n_en_atenci_n_primaria_y_comunidad_55', 'Dotación en atención primaria y comunidad', $BODY_665$La planificación debe considerar:

- población adscrita;
- dispersión geográfica;
- programas;
- visitas domiciliarias;
- promoción y prevención;
- campañas;
- tiempo de desplazamiento;
- accesibilidad.

El número de camas no es un indicador útil para todos los contextos.$BODY_665$, 56
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'dotaci_n_en_hospitalizaci_n_56', 'Dotación en hospitalización', $BODY_666$En hospitalización suelen influir:

- ocupación;
- dependencia;
- rotación;
- tratamientos;
- procedimientos;
- vigilancia;
- altas e ingresos;
- continuidad 24 horas.$BODY_666$, 57
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'dotaci_n_en_reas_de_alta_complejidad_57', 'Dotación en áreas de alta complejidad', $BODY_667$Unidades críticas o de alta complejidad requieren especial atención a:

- competencias específicas;
- vigilancia continua;
- respuesta rápida;
- tecnología;
- entrenamiento;
- supervisión.

No debe extrapolarse automáticamente un criterio de unidad general a un área crítica.$BODY_667$, 58
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'indicadores_de_seguimiento_58', 'Indicadores de seguimiento', $BODY_668$Después de implementar una programación deben revisarse datos como:

- ausentismo;
- horas extra;
- vacantes;
- rotación;
- cumplimiento de cobertura;
- demanda;
- eventos de seguridad;
- tiempos de respuesta;
- resultados de calidad.

La dotación es un proceso de mejora continua.$BODY_668$, 59
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'resultados_del_paciente_y_calidad_59', 'Resultados del paciente y calidad', $BODY_669$La evaluación de dotación debe mirar más allá del número de empleados.

Debe preguntarse:

- ¿se brinda atención a tiempo?
- ¿se completan cuidados esenciales?
- ¿hay retrasos repetidos?
- ¿existen incidentes relacionados con sobrecarga?
- ¿se mantiene continuidad?$BODY_669$, 60
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'se_ales_operativas_de_una_posible_brecha_60', 'Señales operativas de una posible brecha', $BODY_670$Pueden sugerir necesidad de revisión:

- llamadas frecuentes a personal extra;
- horas extraordinarias persistentes;
- omisión recurrente de cuidados;
- retrasos;
- dificultad para cubrir descansos;
- eventos asociados a vigilancia insuficiente;
- alta rotación;
- agotamiento del equipo.

No demuestran por sí solas una causa única, pero requieren análisis.$BODY_670$, 61
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'bienestar_del_personal_61', 'Bienestar del personal', $BODY_671$La OMS destaca que una fuerza laboral suficiente y apoyada es esencial para sistemas de salud resilientes.

La planificación debe considerar que condiciones laborales deficientes pueden afectar:

- retención;
- motivación;
- salud mental;
- seguridad;
- continuidad de los equipos.$BODY_671$, 62
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'productividad_y_calidad_62', 'Productividad y calidad', $BODY_672$Una dotación eficiente busca utilizar bien los recursos **sin sacrificar calidad ni seguridad**.

Productividad administrativa no debe confundirse con:

- trabajar sin descansos;
- aumentar indiscriminadamente cargas;
- omitir cuidados;
- sustituir competencias sin evaluación.$BODY_672$, 63
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, '_tica_y_equidad_en_la_dotaci_n_63', 'Ética y equidad en la dotación', $BODY_673$Las decisiones de personal distribuyen un recurso limitado.

Deben considerar:

- necesidad clínica;
- justicia;
- seguridad;
- vulnerabilidad;
- acceso equitativo;
- transparencia de criterios.

Favorecer sistemáticamente un área por conveniencia y dejar otra en riesgo es una mala decisión administrativa.$BODY_673$, 64
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_de_cambios_de_dotaci_n_64', 'Comunicación de cambios de dotación', $BODY_674$Los cambios deben comunicarse con claridad:

- quién cambia de área;
- por cuánto tiempo;
- qué responsabilidad asume;
- a quién reporta;
- qué apoyo tendrá;
- qué riesgo motivó la decisión.

Esto conecta ADMIN-09 con ADMIN-08 sin convertirlo en un tema de comunicación general.$BODY_674$, 65
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'relaci_n_con_admin_05_y_admin_07_65', 'Relación con ADMIN-05 y ADMIN-07', $BODY_675$**ADMIN-05 — Funciones administrativas** explica las funciones como conceptos.

**ADMIN-07 — Proceso administrativo aplicado en Enfermería** integra planeación, organización, dirección y control.

**ADMIN-09 — Dotación de recursos humanos** aplica esas funciones a una pregunta concreta:

> ¿Qué personal necesita el servicio, cómo debe distribuirse y cómo se ajusta ante cambios?$BODY_675$, 66
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_examen_66', 'Errores frecuentes de examen', $BODY_676$1. Creer que dotación significa únicamente contratar personal.
2. Usar número de camas como único criterio.
3. Repartir pacientes solo por cantidad sin considerar complejidad.
4. Suponer que todas las personas del equipo son intercambiables.
5. Utilizar una razón enfermera/paciente sin verificar su contexto.
6. Ignorar ausencias programadas al elaborar turnos.
7. Considerar a personal en orientación como completamente autónomo desde el primer día.
8. Trasladar personal a un área especializada sin valorar competencia.
9. Resolver déficit crónico únicamente con horas extra.
10. Esperar al inicio del turno para descubrir vacaciones ya programadas.
11. Confundir puestos autorizados con personas realmente disponibles.
12. Creer que una dotación adecuada al inicio del turno no necesita reevaluación.
13. Ignorar trabajo indirecto y documentación.
14. Priorizar igualdad numérica sobre equidad según necesidad.
15. Ocultar una brecha que amenaza la seguridad.$BODY_676$, 67
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estrategia_cicde_para_admin_09_67', 'Estrategia CICDE para ADMIN-09', $BODY_677$Ante una situación de dotación:

**Paso 1:** identificar demanda y gravedad.  
**Paso 2:** revisar cantidad **y competencias** disponibles.  
**Paso 3:** identificar ausencias, vacantes o cambios de actividad.  
**Paso 4:** valorar si la distribución actual es segura.  
**Paso 5:** redistribuir o escalar usando criterios objetivos.  
**Paso 6:** comunicar y documentar.  
**Paso 7:** reevaluar resultados.

En preguntas con varias opciones plausibles suele ser mejor la que utiliza datos de carga y seguridad en lugar de una regla numérica arbitraria.$BODY_677$, 68
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'situaciones_originales_tipo_examen_68', 'Situaciones originales tipo examen', $BODY_678$## Caso 1 — Igual número, diferente complejidad
Dos salas tienen 20 pacientes. Una concentra pacientes dependientes y con tratamientos frecuentes.

**Mejor decisión:** no asignar automáticamente igual dotación; valorar carga y complejidad.

## Caso 2 — Vacaciones conocidas
El horario se publica sin considerar tres vacaciones previamente aprobadas.

**Problema:** falla de planeación; las ausencias previsibles deben incorporarse antes de cerrar la programación.

## Caso 3 — Ausencia inesperada
Dos integrantes llaman enfermos antes del turno.

**Mejor conducta:** activar contingencia, reevaluar carga y solicitar/redistribuir personal competente según necesidad.

## Caso 4 — Personal nuevo
Una unidad tiene cinco enfermeras, pero cuatro están en orientación.

**Interpretación:** la cantidad bruta no refleja la misma capacidad operativa que cinco profesionales plenamente orientados.

## Caso 5 — Unidad crítica
Se propone trasladar a una enfermera sin experiencia en el área para cubrir una vacante en una unidad de alta complejidad.

**Prioridad:** valorar competencia, orientación y supervisión antes de asignarla.

## Caso 6 — Censo bajo, alta rotación
Una unidad mantiene pocas camas ocupadas, pero recibe numerosos ingresos y egresos durante el turno.

**Interpretación:** el censo final puede subestimar carga de trabajo.

## Caso 7 — Igualdad numérica
Una jefa reparte seis pacientes a cada enfermera aunque algunos requieren vigilancia continua.

**Problema:** distribución por número y no por complejidad/carga.

## Caso 8 — Horas extra permanentes
Cada semana se cubren vacantes con horas extraordinarias.

**Interpretación:** puede existir una brecha estructural que requiere análisis, no solo solución diaria.

## Caso 9 — Cálculo sin parámetros
Una pregunta no ofrece norma institucional ni datos suficientes, y una opción afirma una razón fija universal de pacientes por enfermera.

**Mejor razonamiento:** no asumir una razón universal no proporcionada.

## Caso 10 — WISN
Un gestor desea estimar personal utilizando volumen real de actividades y tiempo requerido por actividad.

**Método complementario apropiado:** enfoque WISN basado en carga de trabajo.

## Caso 11 — Reasignación durante el turno
La sala A se estabiliza mientras la sala B recibe varios pacientes complejos.

**Mejor conducta:** reevaluar y, si es seguro, redistribuir recursos según competencia y necesidad.

## Caso 12 — Atención primaria
Un centro rural tiene pocos pacientes simultáneos pero requiere visitas domiciliarias largas y desplazamientos extensos.

**Interpretación:** la dotación debe considerar territorio y tiempo de actividad, no solo consultas presentes.

## Caso 13 — Ausentismo creciente
El servicio registra aumento sostenido de ausencias.

**Mejor acción administrativa:** medir el patrón, investigar factores y ajustar planificación; no reducirlo automáticamente a indisciplina.

## Caso 14 — Personal flotante
Una enfermera de otra área llega como apoyo.

**Primera decisión:** identificar competencias y asignarle responsabilidades compatibles con experiencia y supervisión disponible.

## Caso 15 — Riesgo no comunicado
La jefatura sabe que la cobertura es insuficiente pero decide no informar para evitar conflictos.

**Problema:** compromete seguridad y trazabilidad administrativa; la brecha debe escalarse por los canales correspondientes.

## Caso 16 — Presupuesto
El presupuesto limita nuevas contrataciones aunque la demanda aumentó.

**Mejor respuesta:** documentar la brecha con datos, optimizar distribución y escalar la necesidad; no declarar segura la situación solo porque no hay presupuesto.

## Caso 17 — Competencias
Hay suficiente número de trabajadores, pero nadie del turno posee entrenamiento requerido para una terapia especializada.

**Interpretación:** existe una brecha de competencias aunque el número total parezca adecuado.

## Caso 18 — Indicadores
Después de un cambio de horario aumentan horas extra y retrasos.

**Mejor conducta:** revisar los indicadores y reevaluar la programación; el control retroalimenta la planeación.$BODY_678$, 69
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preguntas_r_pidas_de_repaso_69', 'Preguntas rápidas de repaso', $BODY_679$**1. ¿Qué busca la dotación?**  
Disponer cantidad, competencias y distribución de personal acordes con la necesidad del servicio.

**2. ¿Dotación y asignación son lo mismo?**  
No. Dotación estima/distribuye personal; asignación distribuye pacientes o tareas entre ese personal.

**3. ¿El número de camas basta para calcular personal?**  
No.

**4. ¿Qué factor modifica fuertemente la necesidad de personal además del censo?**  
Carga de trabajo y complejidad/dependencia de los pacientes.

**5. ¿Qué debe considerarse junto al número de trabajadores?**  
Competencias, experiencia y disponibilidad real.

**6. ¿Qué variable reduce disponibilidad real aunque la plantilla aprobada no cambie?**  
Ausencias, vacantes y otras indisponibilidades.

**7. ¿Qué método OMS estima personal a partir de carga de trabajo?**  
WISN.

**8. ¿Una razón enfermera/paciente es universal?**  
No; depende del contexto y de la norma/método aplicable.

**9. ¿Qué sistema usa Panamá para fortalecer información y planificación de recursos humanos en salud?**  
SIRHS.

**10. ¿La dotación debe reevaluarse durante el turno?**  
Sí, cuando cambia la demanda o disponibilidad.$BODY_679$, 70
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fuentes_y_validaci_n_70', 'Fuentes y validación', $BODY_680$## Fuente rectora

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** _Lineamientos para el Examen de Competencias de Profesionales de Enfermería_. Tercera edición. Panamá, 2026.  
   Define ADMIN-09: **“Dotación de recursos humanos”**.

## Bibliografía principal indicada por CICDE

2. **Balderas Pedrero, María de la Luz.** _Administración de los servicios de enfermería_. 7.ª edición. McGraw-Hill, 2015. ISBN 9786071512413.  
   La tabla de contenidos oficial incluye cálculo de personal de enfermería, indicadores, procedimiento, factores que afectan la dotación y cálculo/clasificación del ausentismo; también desarrolla integración de recursos humanos de enfermería.

## Fuentes complementarias actuales

3. **World Health Organization.** _WISN: indicadores de carga de trabajo para la estimación del personal necesario. Manual del usuario, 2.ª edición_. 2023.  
   Complementa planificación de personal basada en carga real de trabajo y tiempo disponible.

4. **World Health Organization.** _State of the world's nursing 2025_. 2025.  
   Contextualiza disponibilidad, distribución, empleo, condiciones laborales y planificación de la fuerza de trabajo de enfermería.

5. **Organización Panamericana de la Salud.** _La fuerza de trabajo en salud en las Américas: datos e indicadores regionales_. 2025.  
   Complementa análisis de disponibilidad, distribución y características del personal sanitario.

## Panamá

6. **OPS/OMS y Ministerio de Salud de Panamá.** _Sistema de Información de Recursos Humanos de Salud (SIRHS)_. Implementación nacional desde 2024 y fortalecimiento continuo.  
   Herramienta para planificación, administración y monitoreo de la fuerza laboral.

7. **OPS/OMS Panamá.** _Primera Datatón en Panamá — iniciativa para fortalecer la planificación del recurso humano en salud_. 14–15 abril de 2026.  
   Ejemplo reciente de integración y validación de datos para apoyar distribución equitativa del personal.$BODY_680$, 71
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'actualizaciones_y_l_mites_de_interpretaci_n_71', 'Actualizaciones y límites de interpretación', $BODY_681$- CICDE no enumera subtemas específicos para ADMIN-09.
- La expansión principal se apoya en la estructura bibliográfica de Balderas citada por CICDE.
- La tabla de contenidos de Balderas confirma que existen métodos de cálculo, indicadores, factores y ausentismo, pero **este paquete no atribuye fórmulas o coeficientes específicos al libro sin texto completo verificado**.
- WISN se utiliza como marco complementario vigente de la OMS; no se presenta como método obligatorio del CICDE ni como norma panameña universal.
- No se establece una razón única enfermera/paciente para Panamá porque las necesidades varían por servicio, competencia, carga y normativa institucional.
- SIRHS se utiliza como contexto actual de planificación nacional de recursos humanos, no como herramienta específica de cálculo de dotación por turno.
- Las reglas de jornada, descansos, perfiles y sustituciones deben comprobarse en la legislación y políticas institucionales aplicables cuando una pregunta dependa de ellas.$BODY_681$, 72
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_de_calidad_72', 'Control de calidad', $BODY_682$Este paquete fue elaborado con las siguientes reglas:

- alcance cotejado contra CICDE 2026;
- no se inventaron subtemas CICDE;
- bibliografía principal de Balderas confirmada mediante ficha y tabla de contenidos oficial de McGraw-Hill;
- se cubren cálculo conceptual de personal, indicadores, factores de dotación y ausentismo;
- no se inventan fórmulas, coeficientes ni razones universales;
- se diferencia dotación de asignación, reclutamiento y selección;
- se integra cantidad, competencia, disponibilidad y carga de trabajo;
- se incorpora WISN como metodología complementaria actual y correctamente rotulada;
- se incorpora SIRHS como contexto panameño actual de planificación basada en datos;
- se relaciona dotación con calidad, seguridad, equidad y bienestar del personal;
- situaciones tipo examen son originales;
- no se declara revisión humana inexistente.$BODY_682$, 73
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estado_para_integraci_n_73', 'Estado para integración', $BODY_683$**Estado:** `REVIEW`

Motivo:

- alcance y contenido fueron sometidos a revisión documental/académica;
- no existe todavía revisor humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` únicamente por revisión de IA.

**Cobertura CICDE ADMIN-09: tema principal cubierto conforme al alcance disponible.**

**Situaciones originales tipo examen: 18.**$BODY_683$, 74
FROM admin_lesson_map WHERE topic_code = 'ADMIN-09';

-- ADMIN-10: Manejo de instrumentos administrativos para evaluar la atención de enfermería (72 sections)

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'alcance_oficial_cicde_0', 'Alcance oficial CICDE', $BODY_684$El temario CICDE 2026 incluye dentro del área **Administración** el tema **“Manejo de instrumentos administrativos para evaluar la atención de enfermería”** (`ADMIN-10`). El lineamiento no enumera subtemas explícitos para este tema.

Por ello, este paquete no presenta una lista inventada de “subtemas CICDE”. La expansión académica se apoya principalmente en la bibliografía de Administración indicada por CICDE —**Balderas Pedrero, *Administración de los servicios de enfermería*, 7.ª edición**— y se complementa con fuentes oficiales de calidad de la atención y seguridad del paciente.

El objetivo no es memorizar formularios aislados, sino aprender a **seleccionar, aplicar, interpretar y utilizar instrumentos administrativos para evaluar la calidad y seguridad de la atención de enfermería y orientar acciones de mejora**.$BODY_684$, 1
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_de_aprendizaje_1', 'Objetivos de aprendizaje', $BODY_685$Al finalizar el tema, el estudiante debe poder:

1. Explicar la finalidad administrativa de evaluar la atención de enfermería.
2. Diferenciar estándar, criterio, instrumento, indicador, evidencia y resultado.
3. Seleccionar instrumentos según el objetivo de evaluación.
4. Aplicar listas de cotejo, observación, revisión de registros, auditoría e indicadores sin confundir sus funciones.
5. Diferenciar indicadores de estructura, proceso y resultado.
6. Interpretar porcentajes y tendencias sin inventar umbrales de calidad.
7. Utilizar histogramas, Pareto, causa-efecto y FODA como herramientas de análisis cuando correspondan.
8. Reconocer el valor administrativo de los registros operativos de enfermería.
9. Identificar problemas de validez, confiabilidad, sesgo y calidad de datos.
10. Integrar evaluación, supervisión, control y mejora continua.
11. Proteger confidencialidad y evitar uso punitivo improcedente de los datos.
12. Resolver situaciones tipo CICDE vinculadas con evaluación de la atención.$BODY_685$, 2
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, '_qu_significa_evaluar_la_atenci_n_de_enfermer_a__2', '¿Qué significa evaluar la atención de enfermería?', $BODY_686$Evaluar implica **comparar información obtenida de manera sistemática con criterios previamente definidos** para determinar grado de cumplimiento, identificar brechas y orientar decisiones.

En enfermería puede evaluarse, entre otros aspectos:
- disponibilidad de recursos necesarios;
- cumplimiento de procedimientos y normas;
- calidad de registros;
- continuidad del cuidado;
- seguridad del paciente;
- resultados sensibles a la atención;
- experiencia y participación de usuarios.

La evaluación administrativa no sustituye el juicio clínico. Lo organiza y lo convierte en información útil para gestionar el servicio.$BODY_686$, 3
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'por_qu_se_necesitan_instrumentos_3', 'Por qué se necesitan instrumentos', $BODY_687$Sin instrumentos definidos, la evaluación puede depender de impresiones personales. Un instrumento bien diseñado permite:
- recolectar información de forma consistente;
- disminuir variación entre evaluadores;
- documentar hallazgos;
- comparar períodos o unidades;
- detectar tendencias;
- priorizar problemas;
- comprobar si una intervención mejoró el desempeño.

**Clave:** el instrumento no mejora por sí solo la atención. Su valor depende de que los datos obtenidos conduzcan a análisis, decisiones y seguimiento.$BODY_687$, 4
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'est_ndar_criterio_instrumento_e_indicador_4', 'Estándar, criterio, instrumento e indicador', $BODY_688$**Estándar:** nivel o condición esperada de desempeño o calidad.

**Criterio:** característica concreta que se observa o verifica para juzgar cumplimiento.

**Instrumento:** medio estructurado usado para recolectar, organizar o analizar información.

**Indicador:** medida que resume un aspecto del desempeño o resultado y permite seguimiento.

**Evidencia:** dato o registro verificable que respalda la evaluación.

Confundir estos conceptos produce instrumentos débiles. Una lista de cotejo, por ejemplo, es el instrumento; cada ítem puede representar un criterio; el porcentaje de cumplimiento obtenido puede convertirse en un indicador.$BODY_688$, 5
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'un_instrumento_no_es_solamente_un_formulario_5', 'Un instrumento no es solamente un formulario', $BODY_689$En administración de enfermería, “instrumento” puede referirse a herramientas de:
- **recolección**: lista de cotejo, guía de observación, encuesta, revisión de registros;
- **medición**: indicadores, tasas, porcentajes de cumplimiento;
- **clasificación/análisis**: histogramas, Pareto, causa-efecto, FODA;
- **control y seguimiento**: auditorías, tableros, reportes periódicos;
- **operación**: censos, hojas de registros, balances y otros documentos que generan datos administrativos.

La selección depende de la pregunta que la jefatura necesita responder.$BODY_689$, 6
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'dimensiones_de_calidad_de_la_atenci_n_6', 'Dimensiones de calidad de la atención', $BODY_690$La OMS describe servicios de calidad como **efectivos, seguros y centrados en las personas**, y además oportunos, equitativos, integrados y eficientes.

Estas dimensiones ayudan a preguntar:
- ¿la atención logra lo que debe lograr?;
- ¿evita daño prevenible?;
- ¿responde a necesidades y preferencias?;
- ¿ocurre a tiempo?;
- ¿es equitativa?;
- ¿está coordinada?;
- ¿utiliza adecuadamente los recursos?

Un solo indicador rara vez representa toda la calidad de una unidad.$BODY_690$, 7
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estructura_proceso_y_resultado_7', 'Estructura, proceso y resultado', $BODY_691$Un marco clásico de evaluación distingue:

**Estructura:** capacidad y recursos disponibles para prestar atención. Ej.: personal competente, equipos, insumos, organización.

**Proceso:** lo que se hace durante la atención. Ej.: valoración, administración segura, educación, documentación, cumplimiento de procedimientos.

**Resultado:** efecto observado en paciente o servicio. Ej.: eventos adversos, evolución de determinados resultados, satisfacción, continuidad.

La interpretación es más sólida cuando se relacionan las tres dimensiones. Un resultado desfavorable no siempre prueba por sí solo una falla de enfermería.$BODY_691$, 8
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ciclo_administrativo_de_evaluaci_n_8', 'Ciclo administrativo de evaluación', $BODY_692$Una secuencia práctica es:

```text
Definir qué se quiere evaluar
        ↓
Establecer estándar/criterios
        ↓
Seleccionar instrumento y fuente de datos
        ↓
Recolectar información
        ↓
Verificar calidad de los datos
        ↓
Comparar con el criterio
        ↓
Analizar causas y prioridades
        ↓
Definir acciones
        ↓
Reevaluar
```

La evaluación pierde valor si termina en “medir y archivar”.$BODY_692$, 9
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'planificar_antes_de_medir_9', 'Planificar antes de medir', $BODY_693$Antes de aplicar un instrumento debe definirse:
- problema o pregunta;
- población o proceso evaluado;
- quién recolectará los datos;
- período;
- fuente de información;
- frecuencia;
- método de análisis;
- responsable de actuar sobre los resultados.

Medir “todo” consume recursos y puede producir grandes volúmenes de información sin utilidad administrativa.$BODY_693$, 10
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'definir_el_objetivo_de_evaluaci_n_10', 'Definir el objetivo de evaluación', $BODY_694$Un objetivo útil es específico.

**Débil:** “evaluar enfermería”.

**Mejor:** “determinar el cumplimiento del procedimiento institucional de identificación del paciente durante administración de medicamentos en el turno matutino durante una semana”.

El objetivo define qué instrumento resulta adecuado y qué datos son pertinentes.$BODY_694$, 11
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'delimitar_el_alcance_11', 'Delimitar el alcance', $BODY_695$La evaluación puede dirigirse a:
- una unidad;
- un turno;
- un procedimiento;
- una población;
- una etapa del cuidado;
- un tipo de registro;
- un evento de seguridad;
- un servicio completo.

Un alcance excesivamente amplio dificulta interpretar causas y asignar responsabilidades de mejora.$BODY_695$, 12
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'criterios_claros_y_observables_12', 'Criterios claros y observables', $BODY_696$Los criterios deben redactarse de forma que dos evaluadores comprendan qué observar.

Evitar expresiones vagas como:
- “atiende bien”;
- “documenta correctamente”;
- “es responsable”.

Preferir criterios observables y verificables, por ejemplo:
- identifica al paciente usando los elementos exigidos por el procedimiento institucional;
- documenta la intervención y respuesta dentro del período definido;
- realiza la verificación prescrita antes del procedimiento.

El criterio debe provenir de una norma, procedimiento, estándar o requisito válido, no de preferencias personales.$BODY_696$, 13
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'definiciones_operativas_13', 'Definiciones operativas', $BODY_697$Una definición operativa especifica **cómo se reconocerá el cumplimiento**.

Debe aclarar, cuando corresponda:
- qué cuenta como cumplimiento;
- qué cuenta como incumplimiento;
- qué se considera “no aplica”;
- período de observación;
- fuente válida de evidencia.

Esto mejora consistencia y evita que cada evaluador interprete el criterio de manera distinta.$BODY_697$, 14
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'universo_muestra_y_oportunidades_14', 'Universo, muestra y oportunidades', $BODY_698$No siempre es posible revisar todos los pacientes o registros.

Debe distinguirse:
- **universo:** conjunto total de unidades que podrían evaluarse;
- **muestra:** subconjunto revisado;
- **oportunidad:** ocasión en que un criterio debía cumplirse.

Una muestra pequeña o sesgada puede producir conclusiones engañosas. El estudiante debe interpretar el resultado dentro del alcance real de la medición.$BODY_698$, 15
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fuentes_de_datos_15', 'Fuentes de datos', $BODY_699$Pueden utilizarse:
- observación directa;
- expediente clínico;
- registros de enfermería;
- sistemas electrónicos;
- censo de pacientes;
- reportes de incidentes;
- inventarios;
- encuestas;
- entrevistas;
- informes administrativos;
- bases de datos institucionales.

Cada fuente tiene fortalezas y limitaciones. **No registrado** no siempre equivale a **no realizado**, pero desde el punto de vista de trazabilidad, una intervención no documentada no puede comprobarse mediante revisión documental.$BODY_699$, 16
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'validez_confiabilidad_y_sesgo_16', 'Validez, confiabilidad y sesgo', $BODY_700$Un instrumento debe medir razonablemente lo que pretende medir.

**Validez:** grado en que la herramienta representa el fenómeno de interés.

**Confiabilidad/consistencia:** grado en que produce resultados comparables cuando se aplica de forma equivalente.

Sesgos frecuentes:
- observar solo turnos “fáciles”;
- excluir casos problemáticos;
- cambiar criterios durante la medición;
- evaluar con conocimiento previo de quién será observado;
- registrar solo datos favorables.

La transparencia metodológica es parte de la calidad administrativa.$BODY_700$, 17
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'lista_de_cotejo_17', 'Lista de cotejo', $BODY_701$Balderas incluye expresamente la **lista de cotejo** entre los instrumentos para recolectar información.

Una lista de cotejo permite verificar presencia, ausencia o cumplimiento de criterios predeterminados.

Es útil para:
- procedimientos;
- documentación;
- disponibilidad de insumos;
- medidas de seguridad;
- cumplimiento de pasos críticos.

No debe convertirse en un ejercicio mecánico que ignore la situación clínica.$BODY_701$, 18
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'c_mo_elaborar_una_lista_de_cotejo_18', 'Cómo elaborar una lista de cotejo', $BODY_702$Secuencia práctica:
1. definir el objetivo;
2. identificar fuente normativa o estándar;
3. seleccionar criterios esenciales;
4. redactar cada ítem en forma observable;
5. definir opciones de respuesta;
6. incluir “no aplica” cuando sea necesario;
7. definir instrucciones;
8. probar el instrumento;
9. corregir ambigüedades;
10. capacitar a evaluadores.

Una lista excesivamente larga puede disminuir calidad de la observación.$BODY_702$, 19
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'gu_a_de_observaci_n_19', 'Guía de observación', $BODY_703$La observación directa permite evaluar conductas y procesos que no siempre quedan reflejados completamente en un registro.

Ejemplos:
- técnica de identificación;
- comunicación durante un procedimiento;
- higiene de manos;
- preparación del entorno;
- cumplimiento de una secuencia segura.

Debe minimizarse el sesgo del observador y evitar interferir innecesariamente con la atención.$BODY_703$, 20
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'revisi_n_de_registros_20', 'Revisión de registros', $BODY_704$La revisión documental examina si la información requerida está presente, es coherente y permite reconstruir el cuidado.

Puede valorar:
- valoración de enfermería;
- planes e intervenciones;
- respuesta del paciente;
- educación;
- balance;
- administración y tratamiento;
- continuidad entre turnos;
- firmas, fechas y horas según reglas institucionales.

La calidad del registro es un componente importante de continuidad, seguridad y responsabilidad profesional.$BODY_704$, 21
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'auditor_a_21', 'Auditoría', $BODY_705$Balderas ubica la **auditoría** dentro de los métodos de control. Administrativamente, una auditoría es una revisión sistemática de información o práctica frente a criterios definidos.

Puede utilizarse para:
- expedientes;
- procesos;
- cumplimiento de procedimientos;
- recursos;
- documentación;
- calidad y seguridad.

El objetivo debe ser conocer desempeño y orientar mejora, no “buscar culpables”.$BODY_705$, 22
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tipos_y_momentos_de_auditor_a_22', 'Tipos y momentos de auditoría', $BODY_706$Según el propósito institucional, una auditoría puede realizarse:
- durante la atención o proceso;
- retrospectivamente mediante registros;
- internamente;
- por evaluadores externos.

No existe una clasificación única que deba memorizarse como norma CICDE. Para examen importa reconocer que la auditoría compara evidencia con criterios y genera hallazgos que requieren análisis y seguimiento.$BODY_706$, 23
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'supervisi_n_como_fuente_de_evaluaci_n_23', 'Supervisión como fuente de evaluación', $BODY_707$La supervisión permite acompañar, observar, orientar y verificar el trabajo.

Una supervisión efectiva:
- tiene criterios conocidos;
- observa hechos;
- ofrece retroalimentación;
- corrige riesgos inmediatos;
- identifica necesidades educativas;
- documenta aspectos relevantes;
- realiza seguimiento.

**ADMIN-07** aborda la supervisión como función de control; en ADMIN-10 interesa especialmente el uso de instrumentos que hacen esa supervisión objetiva y trazable.$BODY_707$, 24
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'evaluaci_n_no_es_igual_a_medici_n_24', 'Evaluación no es igual a medición', $BODY_708$**Medir** produce un valor o dato.

**Evaluar** interpreta ese dato frente a un criterio, contexto y objetivo.

Ejemplo:
- “82 % de cumplimiento” = medición.
- “el resultado muestra una brecha concentrada en dos pasos críticos, requiere intervención y reevaluación” = evaluación.

Una cifra aislada no explica por qué ocurrió el problema.$BODY_708$, 25
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'indicadores_25', 'Indicadores', $BODY_709$Un indicador resume un aspecto del desempeño y permite seguimiento.

Un buen indicador necesita:
- nombre claro;
- propósito;
- definición;
- numerador;
- denominador cuando corresponda;
- fuente de datos;
- frecuencia;
- responsable;
- interpretación;
- límites o exclusiones.

El Observatorio de Calidad de MINSA Panamá contempla indicadores y cuadros de mando de calidad de la atención en salud, reforzando el valor de medir y analizar desempeño.$BODY_709$, 26
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'ficha_t_cnica_de_un_indicador_26', 'Ficha técnica de un indicador', $BODY_710$Una ficha técnica evita que un indicador cambie de significado con el tiempo.

Debe aclarar:
- qué mide;
- por qué importa;
- fórmula;
- unidad;
- población incluida/excluida;
- fuente;
- periodicidad;
- meta o estándar si existe oficialmente;
- responsable de cálculo;
- forma de reporte.

**Regla:** no inventar metas institucionales ni porcentajes “aceptables” si la fuente no los establece.$BODY_710$, 27
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'numerador_y_denominador_27', 'Numerador y denominador', $BODY_711$Ejemplo genérico de cumplimiento:

**Cumplimiento (%) = criterios/oportunidades cumplidas ÷ oportunidades evaluables × 100**

El denominador debe representar correctamente las oportunidades en que el criterio aplicaba.

Errores comunes:
- incluir casos “no aplica” en el denominador;
- mezclar períodos;
- cambiar definiciones;
- comparar unidades que miden de forma diferente.$BODY_711$, 28
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tipos_de_indicadores_28', 'Tipos de indicadores', $BODY_712$Los indicadores pueden organizarse según lo que miden:
- estructura;
- proceso;
- resultado.

También pueden medir volumen, oportunidad, cumplimiento, eventos, experiencia o uso de recursos.

La clasificación sirve para evitar una visión estrecha. Medir solo resultados finales puede ocultar problemas del proceso; medir solo procesos puede ignorar el efecto sobre el paciente.$BODY_712$, 29
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'indicadores_de_estructura_29', 'Indicadores de estructura', $BODY_713$Evalúan capacidad disponible para prestar atención.

Ejemplos conceptuales:
- disponibilidad de equipo esencial;
- cobertura de personal según planificación institucional;
- acceso a insumos;
- existencia de procedimientos vigentes;
- personal con formación requerida.

Tener buena estructura favorece la atención, pero no garantiza por sí sola un proceso correcto.$BODY_713$, 30
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'indicadores_de_proceso_30', 'Indicadores de proceso', $BODY_714$Evalúan si las acciones esperadas se realizaron.

Ejemplos conceptuales:
- cumplimiento de una verificación de seguridad;
- documentación de valoración;
- educación al alta;
- reevaluación posterior a una intervención;
- adherencia a procedimiento.

Son especialmente útiles para detectar dónde intervenir.$BODY_714$, 31
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'indicadores_de_resultado_31', 'Indicadores de resultado', $BODY_715$Evalúan efectos del cuidado o del sistema.

Pueden incluir resultados clínicos, seguridad, experiencia o continuidad.

Debe evitarse atribuir automáticamente todo resultado a una sola persona o profesión. Los resultados suelen depender de múltiples factores: condición del paciente, complejidad, recursos, procesos y trabajo interdisciplinario.$BODY_715$, 32
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tablero_o_cuadro_de_mando_32', 'Tablero o cuadro de mando', $BODY_716$Un tablero reúne indicadores prioritarios para facilitar seguimiento.

Debe permitir:
- visualizar tendencia;
- comparar con meta o referencia válida;
- detectar variaciones;
- identificar áreas prioritarias;
- orientar decisiones.

Más indicadores no significa mejor gestión. Un tablero debe concentrarse en información accionable.$BODY_716$, 33
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'registros_como_instrumentos_operativos_33', 'Registros como instrumentos operativos', $BODY_717$Balderas incluye dentro de los instrumentos operativos de enfermería diversos documentos que generan información para administrar y evaluar servicios.

Estos registros permiten:
- conocer actividad;
- documentar atención;
- coordinar turnos;
- calcular necesidades;
- auditar procesos;
- analizar tendencias.

El instrumento operativo puede convertirse en fuente de datos para evaluación, siempre que su información sea completa y confiable.$BODY_717$, 34
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'hoja_de_enfermer_a_y_registros_cl_nicos_34', 'Hoja de enfermería y registros clínicos', $BODY_718$Los registros clínicos de enfermería permiten reconstruir:
- valoración;
- intervenciones;
- vigilancia;
- respuesta;
- tratamientos;
- educación;
- continuidad.

En Panamá, auditorías oficiales de egresos hospitalarios del MINSA han incluido el **manejo de los registros clínicos de enfermería** como una dimensión de calidad evaluada. Esto demuestra su uso real como fuente de auditoría administrativa y clínica.$BODY_718$, 35
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'censo_diario_de_pacientes_35', 'Censo diario de pacientes', $BODY_719$El censo diario aporta información sobre:
- ocupación;
- ingresos;
- egresos;
- movimientos;
- carga general del servicio.

Puede apoyar decisiones de dotación y distribución de recursos, pero el número de pacientes por sí solo no describe completamente la complejidad ni dependencia.$BODY_719$, 36
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'hoja_de_balance_de_l_quidos_36', 'Hoja de balance de líquidos', $BODY_720$Es principalmente un registro clínico, pero también puede ser auditado para evaluar:
- oportunidad del registro;
- coherencia entre ingresos y egresos;
- continuidad;
- seguimiento del plan de cuidado.

No debe evaluarse solo “si la hoja está llena”; importa si la información es clínicamente útil y correcta.$BODY_720$, 37
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informe_diario_del_estado_de_los_pacientes_37', 'Informe diario del estado de los pacientes', $BODY_721$Balderas incluye el informe diario del estado de salud de los pacientes entre los instrumentos operativos.

Puede apoyar:
- continuidad;
- priorización;
- coordinación;
- identificación de cambios relevantes;
- gestión de recursos.

ADMIN-11 profundizará en la elaboración de informes; aquí se considera principalmente su valor como fuente de evaluación y control.$BODY_721$, 38
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'solicitudes_vales_y_trazabilidad_de_recursos_38', 'Solicitudes, vales y trazabilidad de recursos', $BODY_722$Registros de medicamentos, equipos o materiales pueden aportar información administrativa sobre:
- consumo;
- disponibilidad;
- faltantes;
- pérdidas;
- tiempos de reposición;
- correspondencia con actividad asistencial.

No deben confundirse con indicadores de calidad clínica, aunque problemas persistentes de recursos pueden afectar estructura y seguridad.$BODY_722$, 39
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'encuestas_y_experiencia_del_usuario_39', 'Encuestas y experiencia del usuario', $BODY_723$La percepción de pacientes y familias aporta información que otros registros no captan.

Puede explorarse:
- comunicación;
- respeto;
- participación;
- oportunidad;
- comprensión de indicaciones;
- continuidad percibida.

La satisfacción no es sinónimo de calidad total. Un usuario puede estar satisfecho con una práctica que no cumple estándares clínicos, por lo que debe combinarse con otras medidas.$BODY_723$, 40
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'quejas_reclamos_y_sugerencias_40', 'Quejas, reclamos y sugerencias', $BODY_724$Son fuentes de información sobre fallas o experiencias repetidas.

Administrativamente deben:
- registrarse;
- clasificarse;
- analizarse;
- investigarse cuando corresponda;
- generar respuesta;
- alimentar mejora.

Una queja aislada no prueba automáticamente una falla sistémica, pero tampoco debe descartarse sin evaluación.$BODY_724$, 41
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'evaluar_la_atenci_n_no_es_igual_a_evaluar_al_traba_41', 'Evaluar la atención no es igual a evaluar al trabajador', $BODY_725$ADMIN-10 se centra en **evaluar la atención de enfermería**.

La evaluación del desempeño individual puede formar parte de la gestión de recursos humanos, pero no debe confundirse con evaluación de calidad del cuidado.

Un problema puede deberse a:
- falta de insumos;
- diseño deficiente del proceso;
- carga excesiva;
- comunicación;
- capacitación;
- supervisión;
- conducta individual.

Antes de atribuir culpa debe analizarse el sistema.$BODY_725$, 42
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'histograma_42', 'Histograma', $BODY_726$Balderas incluye el **histograma** como instrumento para clasificar información.

Permite visualizar distribución de datos cuantitativos agrupados.

Puede ayudar a observar:
- concentración;
- dispersión;
- valores frecuentes;
- posibles extremos.

No explica causas; solamente ayuda a ver el comportamiento de los datos.$BODY_726$, 43
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'diagrama_de_pareto_43', 'Diagrama de Pareto', $BODY_727$El análisis de Pareto ayuda a ordenar categorías de problemas desde las más frecuentes o de mayor impacto hacia las menos frecuentes.

Uso administrativo:
1. clasificar eventos o fallas;
2. contar frecuencia o impacto;
3. ordenar categorías;
4. priorizar las que concentran mayor carga;
5. investigar causas.

**Error:** asumir que la categoría más frecuente siempre es la más peligrosa. Frecuencia y gravedad son dimensiones diferentes.$BODY_727$, 44
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'diagrama_causa_efecto_de_ishikawa_44', 'Diagrama causa-efecto de Ishikawa', $BODY_728$Balderas incluye el diagrama causa-efecto como herramienta de análisis.

Se utiliza para explorar posibles causas de un problema agrupándolas de manera estructurada.

En enfermería pueden considerarse categorías como:
- personas;
- métodos;
- equipos;
- materiales;
- ambiente;
- organización;
- comunicación.

El diagrama genera hipótesis de causas; no demuestra causalidad por sí solo.$BODY_728$, 45
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'an_lisis_foda_45', 'Análisis FODA', $BODY_729$El FODA organiza:
- fortalezas;
- oportunidades;
- debilidades;
- amenazas.

Puede utilizarse para analizar un servicio o proyecto de mejora.

Debe diferenciarse:
- factores **internos**: fortalezas y debilidades;
- factores **externos**: oportunidades y amenazas.

No sustituye medición cuantitativa cuando esta es necesaria.$BODY_729$, 46
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tendencias_en_el_tiempo_46', 'Tendencias en el tiempo', $BODY_730$Comparar el mismo indicador a través del tiempo puede ser más informativo que un valor aislado.

Preguntas útiles:
- ¿mejora o empeora?;
- ¿hay variación estacional?;
- ¿cambió después de una intervención?;
- ¿el cambio se mantiene?;

No atribuir automáticamente una mejoría a una intervención sin considerar otros cambios simultáneos.$BODY_730$, 47
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comparaci_n_y_benchmarking_47', 'Comparación y benchmarking', $BODY_731$Comparar resultados puede ayudar a identificar oportunidades, pero solo si las mediciones son comparables.

Antes de comparar unidades verificar:
- definiciones iguales;
- población similar;
- período equivalente;
- método de recolección compatible;
- ajuste por complejidad cuando corresponda.

Comparar cifras incompatibles puede producir decisiones injustas o erróneas.$BODY_731$, 48
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'eventos_adversos_como_fuente_de_aprendizaje_48', 'Eventos adversos como fuente de aprendizaje', $BODY_732$Los eventos adversos y casi eventos pueden revelar debilidades de procesos.

El sistema debe favorecer:
- identificación;
- reporte;
- análisis;
- aprendizaje;
- acciones preventivas.

La OMS destaca la importancia de los sistemas de reporte y aprendizaje dentro de la medición y mejora de calidad.$BODY_732$, 49
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'reporte_de_incidentes_49', 'Reporte de incidentes', $BODY_733$Un reporte de incidente debe recoger hechos relevantes de forma objetiva conforme a políticas institucionales.

Administrativamente permite:
- clasificar tipos de eventos;
- observar tendencias;
- identificar procesos vulnerables;
- orientar acciones preventivas.

No reemplaza el registro clínico que corresponda ni debe utilizarse para ocultar información del expediente.$BODY_733$, 50
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'calidad_de_los_datos_50', 'Calidad de los datos', $BODY_734$Antes de interpretar resultados preguntar:
- ¿los datos están completos?;
- ¿se recolectaron igual en todos los casos?;
- ¿hay duplicados?;
- ¿faltan períodos?;
- ¿la definición cambió?;
- ¿existen errores de digitación?;
- ¿el denominador es correcto?

Una decisión basada en datos defectuosos puede ser peor que no medir.$BODY_734$, 51
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'confidencialidad_y_acceso_a_informaci_n_51', 'Confidencialidad y acceso a información', $BODY_735$Los instrumentos de evaluación pueden contener información sensible de pacientes y trabajadores.

La gestión debe aplicar:
- acceso según necesidad y función;
- protección de identificadores;
- almacenamiento seguro;
- uso legítimo;
- divulgación limitada;
- cumplimiento de normativa y políticas institucionales.

La mejora de calidad no elimina el deber de confidencialidad.$BODY_735$, 52
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'documentaci_n_del_proceso_de_evaluaci_n_52', 'Documentación del proceso de evaluación', $BODY_736$Debe conservarse trazabilidad de:
- instrumento utilizado;
- versión;
- criterios;
- período;
- evaluadores;
- muestra;
- resultados;
- análisis;
- acciones acordadas;
- seguimiento.

Sin trazabilidad es difícil reproducir o comparar una evaluación posterior.$BODY_736$, 53
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'interpretaci_n_de_resultados_53', 'Interpretación de resultados', $BODY_737$Al interpretar un hallazgo considerar:
- magnitud;
- frecuencia;
- gravedad;
- tendencia;
- confiabilidad de los datos;
- contexto;
- posibles causas;
- capacidad de intervención.

**Prioridad administrativa ≠ problema más numeroso siempre.** Un evento poco frecuente pero de alta gravedad puede exigir acción inmediata.$BODY_737$, 54
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'evitar_el_uso_punitivo_simplista_54', 'Evitar el uso punitivo simplista', $BODY_738$La evaluación de calidad debe distinguir:
- error humano;
- conducta de riesgo;
- incumplimiento deliberado;
- falla del sistema;
- ausencia de recursos;
- procedimiento mal diseñado.

Culpar automáticamente a la persona impide aprender del sistema. Esto no significa ignorar responsabilidad profesional cuando existe conducta inapropiada.$BODY_738$, 55
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'retroalimentaci_n_de_resultados_55', 'Retroalimentación de resultados', $BODY_739$Los resultados deben regresar a quienes pueden mejorar el proceso.

Una buena retroalimentación es:
- oportuna;
- basada en datos;
- específica;
- respetuosa;
- orientada a acciones;
- acompañada de seguimiento.

Publicar una cifra sin explicación puede generar resistencia y no produce mejora.$BODY_739$, 56
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'plan_de_mejora_56', 'Plan de mejora', $BODY_740$Después de identificar una brecha debe definirse:
- problema priorizado;
- causa probable;
- acción;
- responsable;
- recursos;
- fecha;
- indicador de seguimiento;
- momento de reevaluación.

Las acciones pueden incluir educación, rediseño de proceso, ajuste de recursos, actualización de instrumentos o cambios de supervisión.$BODY_740$, 57
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'reevaluaci_n_57', 'Reevaluación', $BODY_741$La reevaluación responde:
- ¿la acción se implementó?;
- ¿mejoró el indicador?;
- ¿aparecieron efectos no deseados?;
- ¿la mejoría se mantiene?;
- ¿debe modificarse el plan?

Sin reevaluación, el ciclo de control queda incompleto.$BODY_741$, 58
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'panam_observatorio_de_calidad_58', 'Panamá: Observatorio de Calidad', $BODY_742$El **Observatorio de Calidad de la Atención en Salud de MINSA Panamá** mantiene un espacio para indicadores y cuadro de mando de calidad.

Para el estudiante, el mensaje clave es que la evaluación de servicios en Panamá utiliza **indicadores con fichas técnicas y análisis de comportamiento**, no solamente opiniones informales.

No se deben inventar valores meta nacionales cuando la ficha oficial correspondiente no haya sido consultada.$BODY_742$, 59
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'panam_auditor_a_de_egresos_hospitalarios_59', 'Panamá: auditoría de egresos hospitalarios', $BODY_743$El informe oficial de **Auditoría de Egresos Hospitalarios 2024 de MINSA** evaluó historias clínicas en hospitales y contempló dimensiones específicas, entre ellas el **manejo de los registros clínicos de enfermería**.

Este ejemplo demuestra cómo:
- el expediente se convierte en fuente de datos;
- existen criterios de auditoría;
- se obtienen índices de calidad;
- se comparan instalaciones y dimensiones;
- los resultados sirven para orientar mejora.

No es necesario memorizar los puntajes de 2024; importa comprender el método administrativo.$BODY_743$, 60
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'seguridad_del_paciente_y_enfermer_a_60', 'Seguridad del paciente y enfermería', $BODY_744$OPS destaca que la organización de servicios y la vigilancia continua de calidad son fundamentales para seguridad del paciente, y que enfermería ocupa una posición especialmente relevante por su presencia continua en la atención.

Instrumentos administrativos bien utilizados pueden ayudar a detectar:
- omisiones;
- variaciones;
- fallas de comunicación;
- problemas de documentación;
- riesgos repetidos.

La evaluación debe traducirse en prevención.$BODY_744$, 61
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'relaci_n_con_el_pae_61', 'Relación con el PAE', $BODY_745$El PAE evalúa la respuesta del paciente al plan de cuidados; ADMIN-10 se ocupa principalmente de **evaluación administrativa de la atención y del servicio**.

Se relacionan porque los registros del PAE pueden convertirse en evidencia para auditoría de:
- valoración;
- diagnóstico/juicio enfermero cuando corresponda;
- planificación;
- ejecución;
- evaluación.

No deben confundirse los dos niveles de análisis.$BODY_745$, 62
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'relaci_n_con_otros_temas_admin_62', 'Relación con otros temas ADMIN', $BODY_746$**ADMIN-05:** explica funciones administrativas y control.

**ADMIN-07:** integra el proceso administrativo aplicado en enfermería, incluida supervisión.

**ADMIN-09:** profundiza dotación de recursos humanos.

**ADMIN-10:** profundiza **instrumentos y métodos para evaluar la atención**.

**ADMIN-11:** profundizará **elaboración de informes**.

La separación evita repetir el mismo contenido con títulos distintos.$BODY_746$, 63
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_examen_63', 'Errores frecuentes de examen', $BODY_747$1. Confundir instrumento con indicador.
2. Usar un formulario sin criterios definidos.
3. Evaluar una intervención solo por satisfacción del usuario.
4. Suponer que “no documentado” prueba siempre que “no se hizo”.
5. Incluir “no aplica” como incumplimiento sin justificación.
6. Comparar unidades con definiciones distintas.
7. Inventar un porcentaje universal de “calidad aceptable”.
8. Usar auditoría solo para sancionar.
9. Pensar que un histograma explica causas.
10. Pensar que Pareto mide gravedad automáticamente.
11. Considerar Ishikawa como prueba de causalidad.
12. Atribuir un resultado adverso a una persona sin analizar el sistema.
13. Recoger datos sin plan de acción.
14. Medir una vez y no reevaluar.
15. Confundir evaluación administrativa con PAE.
16. Confundir evaluación de la atención con evaluación individual del trabajador.$BODY_747$, 64
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'qu_memorizar_para_cicde_64', 'Qué memorizar para CICDE', $BODY_748$- Evaluar = comparar evidencia con criterios para tomar decisiones.
- Estándar = nivel esperado.
- Criterio = aspecto verificable.
- Instrumento = herramienta para obtener/organizar información.
- Indicador = medida resumida para seguimiento.
- Lista de cotejo = verifica criterios predeterminados.
- Auditoría = revisión sistemática frente a criterios.
- Indicadores pueden ser de estructura, proceso o resultado.
- Histograma = distribución.
- Pareto = prioriza categorías por frecuencia/impacto seleccionado.
- Ishikawa = explora posibles causas.
- FODA = fortalezas, oportunidades, debilidades y amenazas.
- Medir sin analizar ni actuar no completa la evaluación.
- Reevaluar cierra el ciclo de mejora.$BODY_748$, 65
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estrategia_cicde_para_admin_10_65', 'Estrategia CICDE para ADMIN-10', $BODY_749$Ante una pregunta:

**Paso 1:** identifique qué se quiere conocer.

**Paso 2:** determine si se necesita recolectar, medir, analizar o controlar.

**Paso 3:** elija el instrumento que responde mejor al objetivo.

**Paso 4:** verifique que exista criterio/estándar válido.

**Paso 5:** interprete el dato en contexto.

**Paso 6:** priorice la acción y el seguimiento.

Si dos respuestas parecen correctas, suele ser mejor la que **usa datos objetivos, protege seguridad, evita conclusiones apresuradas y cierra el ciclo con mejora y reevaluación**.$BODY_749$, 66
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'situaciones_originales_tipo_examen_66', 'Situaciones originales tipo examen', $BODY_750$### Caso 1 — Lista de cotejo
La supervisora quiere verificar si se cumplen pasos críticos de un procedimiento.

**Mejor instrumento:** lista de cotejo basada en criterios válidos.

### Caso 2 — Indicador sin denominador correcto
Un servicio informa 20 incumplimientos, pero no conoce cuántas oportunidades fueron evaluadas.

**Problema:** no puede estimarse adecuadamente la proporción de cumplimiento/incumplimiento.

### Caso 3 — Comparación injusta
Dos unidades comparan porcentajes, pero una excluye casos “no aplica” y la otra los cuenta como fallas.

**Conducta:** estandarizar definiciones antes de comparar.

### Caso 4 — Causa de un problema
Los errores se concentran en un proceso, pero no se conoce por qué ocurren.

**Herramienta útil:** diagrama causa-efecto para organizar hipótesis, seguido de verificación.

### Caso 5 — Priorizar categorías
Se tienen diez tipos de fallas y se quiere identificar cuáles concentran la mayoría de reportes.

**Herramienta:** Pareto.

### Caso 6 — Distribución de tiempos
La jefatura desea visualizar cómo se distribuyen los tiempos de espera registrados.

**Herramienta:** histograma.

### Caso 7 — Auditoría punitiva
La jefa anuncia que la auditoría servirá únicamente para encontrar a quién sancionar.

**Problema:** limita aprendizaje y análisis de sistema; la auditoría debe identificar brechas y orientar mejora, sin excluir responsabilidad cuando corresponda.

### Caso 8 — Resultado adverso aislado
Ocurre un evento adverso y se atribuye inmediatamente a la enfermera sin revisar recursos ni proceso.

**Mejor conducta:** proteger al paciente, investigar hechos y analizar factores del sistema antes de concluir causa.

### Caso 9 — Registro incompleto
Una auditoría encuentra que una intervención no está documentada.

**Interpretación:** existe una brecha de documentación y no puede verificarse mediante el expediente que se realizó; no debe inventarse evidencia.

### Caso 10 — Satisfacción alta
Los usuarios están satisfechos, pero la auditoría muestra incumplimientos de seguridad.

**Conclusión:** satisfacción no sustituye medidas de seguridad y efectividad.

### Caso 11 — Muchos indicadores
Una unidad recopila 80 indicadores pero nadie revisa resultados.

**Problema:** medición sin uso; priorizar indicadores accionables y responsables de seguimiento.

### Caso 12 — Mejora sin reevaluación
Después de una capacitación se asume que el problema quedó resuelto.

**Conducta:** repetir medición comparable para comprobar cambio.

### Caso 13 — Gravedad vs frecuencia
Una falla poco frecuente puede causar daño grave, mientras otra frecuente es de bajo riesgo.

**Prioridad:** considerar frecuencia y gravedad; no usar frecuencia como único criterio.

### Caso 14 — Instrumento ambiguo
Dos supervisores califican de manera opuesta el mismo ítem “brinda buena atención”.

**Problema:** criterio no operativo; debe redactarse de forma observable.

### Caso 15 — Datos incompletos
Faltan registros de tres días, pero se presenta el indicador como si representara todo el mes.

**Conducta:** reconocer limitación y corregir calidad de datos antes de concluir.

### Caso 16 — Registro clínico
MINSA audita historias clínicas y revisa registros de enfermería.

**Interpretación:** el expediente es una fuente de evidencia para evaluar calidad documental y continuidad.

### Caso 17 — Confidencialidad
Se comparte por mensajería informal una hoja de auditoría con nombres de pacientes.

**Conducta:** detener la divulgación y utilizar mecanismos institucionales seguros.

### Caso 18 — Plan de mejora
Se identifica bajo cumplimiento en un paso crítico.

**Siguiente acción:** analizar causa, definir intervención, responsable e indicador y programar reevaluación.$BODY_750$, 67
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preguntas_r_pidas_de_repaso_67', 'Preguntas rápidas de repaso', $BODY_751$**1. ¿Qué hace una lista de cotejo?** Verifica criterios predeterminados.

**2. ¿Qué diferencia un indicador de un instrumento?** El indicador resume una medida; el instrumento obtiene u organiza información.

**3. ¿Qué herramienta muestra distribución?** Histograma.

**4. ¿Qué herramienta ayuda a priorizar categorías?** Pareto.

**5. ¿Qué herramienta organiza posibles causas?** Ishikawa.

**6. ¿Qué compara una auditoría?** Evidencia frente a criterios definidos.

**7. ¿Qué tres grandes clases de indicadores deben reconocerse?** Estructura, proceso y resultado.

**8. ¿Una cifra aislada es una evaluación completa?** No; requiere criterio, contexto e interpretación.

**9. ¿Qué debe ocurrir después de una acción de mejora?** Reevaluación.

**10. ¿El expediente puede ser instrumento de evaluación?** Es principalmente fuente documental; puede revisarse mediante instrumentos de auditoría.$BODY_751$, 68
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fuentes_y_validaci_n_68', 'Fuentes y validación', $BODY_752$## Fuente rectora CICDE
1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen de Competencias de Profesionales de Enfermería*, tercera edición, Panamá, 2026. Define `ADMIN-10` como “Manejo de instrumentos administrativos para evaluar la atención de enfermería”.

## Bibliografía principal indicada por CICDE
2. **Balderas Pedrero, María de la Luz.** *Administración de los servicios de enfermería*. 7.ª ed. McGraw-Hill, 2015. ISBN 9786071512413. La tabla de contenidos oficial confirma secciones sobre control, supervisión, evaluación, auditoría e informes; instrumentos para recolectar información; lista de cotejo; histograma; Pareto; Ishikawa; FODA; indicadores; y diversos instrumentos operativos de enfermería.

https://www.mheducation.com.mx/administracion-de-los-servicios-de-enfermeria-9786071512413-latam-group

## Panamá — fuentes oficiales
3. **Ministerio de Salud de Panamá. Observatorio de Calidad de la Atención en Salud — Indicadores de Calidad.** Presenta indicadores y cuadro de mando de calidad con fichas técnicas y análisis.

https://ocas.minsa.gob.pa/indicadores-de-calidad/

4. **Ministerio de Salud de Panamá. Auditoría de Egresos Hospitalarios 2024.** Documento oficial que incluye evaluación del manejo de registros clínicos de enfermería dentro de las dimensiones de calidad.

https://www.minsa.gob.pa/sites/default/files/publicacion-general/informe_de_auditoria_de_egresos_hospitalarios_-_2024_17_12_2024.pdf

## Fuentes complementarias
5. **World Health Organization. Quality of care / Quality health services.** Marco de calidad: atención efectiva, segura, centrada en las personas, oportuna, equitativa, integrada y eficiente.

https://www.who.int/health-topics/quality-of-care

6. **World Health Organization. Measuring and monitoring quality of care to improve maternal, newborn, child and adolescent health services.** 2025. Guía para selección, seguimiento y análisis de indicadores de calidad.

https://www.who.int/publications/i/item/9789240105737/

7. **Organización Panamericana de la Salud.** *Enfermería y seguridad de los pacientes*. OPS, 2011. Relevancia de la organización de servicios y vigilancia continua de calidad para seguridad del paciente.

https://iris.paho.org/handle/10665.2/51547

8. **AHRQ.** Definiciones de medidas de estructura y modelo estructura–proceso–resultados como marco clásico de evaluación de calidad.

https://www.ahrq.gov/policymakers/chipra/cpcf-form15.html$BODY_752$, 69
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'actualizaciones_y_l_mites_de_interpretaci_n_69', 'Actualizaciones y límites de interpretación', $BODY_753$- CICDE no enumera subtemas explícitos para ADMIN-10; la estructura de este paquete es una expansión pedagógica, no una reescritura del lineamiento.
- La tabla de contenidos oficial de Balderas fue verificada; este paquete **no afirma acceso integral ni reproduce el texto del capítulo**.
- No existe un único instrumento universal para evaluar toda la atención de enfermería.
- Los formatos, metas, umbrales, escalas y responsables dependen de normativa y políticas institucionales.
- No se inventaron porcentajes de cumplimiento “aceptables”.
- Las cifras del informe MINSA 2024 se consideran ejemplo documental; no son valores que deban memorizarse como estándar nacional permanente.
- Herramientas como Pareto, Ishikawa y FODA apoyan análisis, pero no sustituyen investigación de causas ni juicio profesional.$BODY_753$, 70
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_de_calidad_del_paquete_70', 'Control de calidad del paquete', $BODY_754$Este paquete fue construido con las siguientes reglas:
- alcance cotejado contra CICDE 2026;
- se preservó literalmente `ADMIN-10` sin inventar subtemas oficiales;
- expansión basada en contenidos verificables de la tabla de contenidos oficial de Balderas 7.ª ed.;
- se distinguieron estándar, criterio, instrumento, indicador y evidencia;
- se incluyeron instrumentos de recolección, medición, análisis y control;
- se incorporó contexto panameño oficial mediante Observatorio de Calidad y auditoría MINSA;
- se incorporó marco OMS para calidad y medición;
- no se establecieron umbrales universales sin fuente;
- se diferenció evaluación de la atención de evaluación individual del trabajador;
- se diferenció evaluación administrativa del PAE;
- se preservó la frontera con ADMIN-11;
- las 18 situaciones tipo examen son originales;
- no se declara revisión humana inexistente.$BODY_754$, 71
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estado_para_integraci_n_71', 'Estado para integración', $BODY_755$**Estado recomendado:** `REVIEW`.

Motivo:
- el alcance y las fuentes fueron revisados documentalmente;
- aún no existe revisor humano con provenance registrado;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` únicamente por revisión realizada por IA.

**Cobertura CICDE ADMIN-10:** tema principal cubierto de acuerdo con el alcance disponible.

**Situaciones originales tipo examen:** 18.$BODY_755$, 72
FROM admin_lesson_map WHERE topic_code = 'ADMIN-10';

-- ADMIN-11: Elaboración de informes (71 sections)

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'alcance_oficial_cicde_0', 'Alcance oficial CICDE', $BODY_756$El temario CICDE 2026 incluye dentro del área **Administración** el tema **“Elaboración de informes”** (`ADMIN-11`). El lineamiento no enumera subtemas explícitos para este tema.

Por ello, este paquete no presenta una lista inventada de “subtemas CICDE”. La expansión académica se apoya principalmente en la bibliografía de Administración indicada por CICDE —**Balderas Pedrero, _Administración de los servicios de enfermería_, 7.ª edición**— cuya tabla de contenidos oficial incluye **informes** dentro de las técnicas de control y también documentos operativos de enfermería como el **informe diario del estado de salud de los pacientes**.

El objetivo es que el estudiante aprenda a transformar datos y hallazgos del servicio en información **clara, verificable, oportuna y útil para decidir**, sin confundir el informe administrativo con la nota clínica, el reporte inmediato de una emergencia o el informe de investigación.$BODY_756$, 1
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'objetivos_de_aprendizaje_1', 'Objetivos de aprendizaje', $BODY_757$Al finalizar el tema, el estudiante debe poder:

1. Explicar la finalidad administrativa de un informe de enfermería.
2. Diferenciar informe administrativo, registro clínico, comunicación verbal, notificación de incidente e informe de investigación.
3. Identificar destinatario, objetivo, período y alcance antes de redactar.
4. Seleccionar el tipo de informe según la necesidad administrativa.
5. Organizar un informe con identificación, fuente de datos, hallazgos, análisis, conclusiones y acciones cuando correspondan.
6. Distinguir datos, indicadores, interpretación y conclusión.
7. Redactar de forma objetiva, precisa, breve y trazable.
8. Reconocer errores de datos, sesgos y conclusiones que exceden la evidencia.
9. Proteger confidencialidad y datos personales.
10. Utilizar informes para supervisión, control, toma de decisiones y mejora continua.
11. Saber cuándo un riesgo debe comunicarse de inmediato y no esperar al informe periódico.
12. Resolver situaciones tipo CICDE relacionadas con elaboración y uso de informes.$BODY_757$, 2
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'concepto_de_informe_administrativo_2', 'Concepto de informe administrativo', $BODY_758$Un **informe administrativo** es una comunicación estructurada que presenta información relevante sobre una situación, período, actividad, resultado o problema para facilitar control, rendición de cuentas, coordinación y toma de decisiones.

En enfermería puede resumir, por ejemplo:
- actividad de una unidad;
- disponibilidad de personal y recursos;
- cumplimiento de objetivos;
- hallazgos de supervisión;
- resultados de indicadores;
- incidentes o problemas recurrentes;
- necesidades y acciones de mejora.

El informe no es un fin en sí mismo. Su valor depende de que permita comprender qué ocurrió, qué significa y qué acción administrativa se requiere.$BODY_758$, 3
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'por_qu_los_informes_importan_3', 'Por qué los informes importan', $BODY_759$Los informes permiten convertir la experiencia diaria del servicio en información organizada. Ayudan a:
- dar continuidad a la gestión;
- comparar períodos;
- identificar desviaciones;
- justificar necesidades;
- documentar decisiones;
- comunicar resultados;
- orientar recursos;
- evaluar planes de mejora;
- dejar trazabilidad institucional.

Sin informes confiables, la administración puede depender de memoria, impresiones o datos fragmentados.$BODY_759$, 4
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'el_informe_como_t_cnica_de_control_4', 'El informe como técnica de control', $BODY_760$Balderas ubica los **informes** dentro de las técnicas de control. Esto significa que un informe puede ayudar a comparar lo realizado con lo esperado y a decidir si deben mantenerse, corregirse o rediseñarse acciones.

Un informe útil para control responde preguntas como:
- ¿qué estaba planificado?;
- ¿qué ocurrió realmente?;
- ¿qué diferencias existen?;
- ¿qué factores ayudan a explicarlas?;
- ¿qué acción se recomienda?;
- ¿quién debe dar seguimiento?$BODY_760$, 5
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informe_administrativo_vs_otros_documentos_5', 'Informe administrativo vs otros documentos', $BODY_761$No todo documento generado por enfermería es un informe administrativo.

**Registro clínico:** documenta valoración, intervenciones y respuesta del paciente en su expediente.

**Comunicación verbal:** transmite información en tiempo real, por ejemplo durante un cambio de turno o escalamiento urgente.

**Notificación de incidente:** registra un evento de seguridad según el sistema institucional.

**Informe administrativo:** integra información para gestión, evaluación o decisión.

**Informe de investigación:** responde a una metodología científica y pertenece principalmente al área de Investigación.

Confundir estos documentos puede provocar omisiones, duplicación o uso incorrecto de información.$BODY_761$, 6
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'primero_objetivo_y_destinatario_6', 'Primero: objetivo y destinatario', $BODY_762$Antes de escribir, deben definirse dos cosas:

1. **Objetivo:** qué necesita conocer o decidir la organización.
2. **Destinatario:** quién utilizará la información.

Un informe para una jefatura de enfermería puede requerir un nivel de detalle distinto de uno dirigido a dirección médica, calidad, recursos humanos o un comité institucional.

**Regla:** no empezar acumulando datos sin saber qué pregunta administrativa se intenta responder.$BODY_762$, 7
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'delimitar_per_odo_y_alcance_7', 'Delimitar período y alcance', $BODY_763$El informe debe indicar claramente:
- unidad o servicio;
- período cubierto;
- turno si aplica;
- población o proceso incluido;
- exclusiones relevantes;
- responsable de elaboración.

Un informe que mezcla períodos o unidades sin explicarlo puede producir comparaciones engañosas.$BODY_763$, 8
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tipos_de_informes_administrativos_8', 'Tipos de informes administrativos', $BODY_764$No existe una única clasificación universal. Según finalidad y contexto, pueden existir:
- informes diarios o de turno;
- semanales, mensuales o trimestrales;
- informes de gestión;
- informes de supervisión;
- informes de auditoría o evaluación;
- informes de productividad/actividad;
- informes de dotación o ausentismo;
- informes de recursos, insumos o equipos;
- informes extraordinarios ante situaciones específicas.

La institución define formatos y periodicidad. El estudiante debe comprender la **función** del informe, no memorizar un formato único inexistente.$BODY_764$, 9
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informes_peri_dicos_9', 'Informes periódicos', $BODY_765$Los informes periódicos resumen actividad y desempeño en intervalos definidos.

Pueden incluir:
- volumen de actividad;
- indicadores;
- personal disponible;
- ausentismo;
- eventos relevantes;
- recursos críticos;
- cumplimiento de metas;
- acciones ejecutadas y pendientes.

Su fortaleza principal es permitir observar **tendencias** y comparar períodos con criterios consistentes.$BODY_765$, 10
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informes_extraordinarios_10', 'Informes extraordinarios', $BODY_766$Se elaboran cuando ocurre una situación que requiere análisis o comunicación fuera del ciclo ordinario.

Ejemplos:
- interrupción relevante de un servicio;
- problema grave de abastecimiento;
- situación de seguridad que requiere revisión administrativa;
- contingencia que afectó operación;
- hallazgo excepcional de supervisión.

Un informe extraordinario **no debe retrasar la respuesta inmediata** necesaria para proteger al paciente o al personal.$BODY_766$, 11
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informe_diario_del_estado_de_salud_de_los_paciente_11', 'Informe diario del estado de salud de los pacientes', $BODY_767$La tabla de contenidos de Balderas incluye el **informe diario del estado de salud de los pacientes** entre instrumentos operativos.

Administrativamente, este tipo de informe puede apoyar visión global de la unidad y continuidad del servicio, pero no sustituye:
- expediente clínico;
- nota de enfermería;
- cambio de turno seguro;
- comunicación inmediata de deterioro.

Debe utilizar únicamente la información necesaria y respetar confidencialidad.$BODY_767$, 12
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informe_de_supervisi_n_12', 'Informe de supervisión', $BODY_768$Resume hallazgos obtenidos durante supervisión y puede contener:
- objetivo de la supervisión;
- área observada;
- criterios utilizados;
- fortalezas;
- brechas;
- riesgos;
- acciones inmediatas realizadas;
- recomendaciones;
- seguimiento requerido.

Debe distinguir hechos observados de interpretaciones. Una supervisión no debe convertirse en una lista de opiniones personales.$BODY_768$, 13
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informe_de_evaluaci_n_o_auditor_a_13', 'Informe de evaluación o auditoría', $BODY_769$Cuando proviene de una evaluación o auditoría, el informe debe preservar trazabilidad entre:

```text
criterio → evidencia → hallazgo → interpretación → acción
```

Debe indicar método y alcance suficientes para que el lector entienda qué fue evaluado y qué no. Una conclusión no puede exceder la evidencia disponible.$BODY_769$, 14
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informe_de_dotaci_n_y_personal_14', 'Informe de dotación y personal', $BODY_770$Puede utilizarse para comunicar:
- cobertura por turno;
- vacantes;
- ausentismo;
- horas adicionales;
- redistribuciones;
- mezcla de competencias;
- necesidad de refuerzo.

Debe relacionarse con carga de trabajo y necesidades del servicio. Contar personas sin contexto no demuestra por sí solo suficiencia o insuficiencia de dotación.$BODY_770$, 15
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informe_de_recursos_material_y_equipo_15', 'Informe de recursos, material y equipo', $BODY_771$Puede documentar:
- disponibilidad;
- consumo;
- faltantes;
- equipos fuera de servicio;
- necesidades de reposición;
- riesgos asociados.

Los datos deben ser verificables. Expresiones como “siempre falta de todo” deben sustituirse por cantidades, fechas, frecuencia y efecto operativo cuando estén disponibles.$BODY_771$, 16
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informe_de_gesti_n_16', 'Informe de gestión', $BODY_772$Un informe de gestión resume el desempeño de una jefatura, programa o servicio durante un período.

Puede integrar:
- objetivos planificados;
- actividades realizadas;
- resultados;
- indicadores;
- uso de recursos;
- dificultades;
- acciones correctivas;
- logros;
- pendientes;
- prioridades siguientes.

Debe evitar convertirse en una simple lista cronológica de actividades sin análisis.$BODY_772$, 17
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estructura_general_de_un_informe_17', 'Estructura general de un informe', $BODY_773$La estructura depende de la institución, pero un informe administrativo suele necesitar, según el caso:
1. identificación;
2. objetivo y alcance;
3. período;
4. fuente/método de obtención de datos;
5. resultados o hallazgos;
6. análisis;
7. conclusiones;
8. recomendaciones o plan de acción;
9. responsable y fecha;
10. anexos cuando correspondan.

No todos los informes necesitan cada componente, pero la ausencia debe responder a la finalidad del documento y no a un olvido.$BODY_773$, 18
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'identificaci_n_del_informe_18', 'Identificación del informe', $BODY_774$Debe permitir reconocer sin ambigüedad:
- título;
- unidad/servicio;
- período;
- fecha de elaboración;
- autor o responsable;
- versión cuando aplique.

Una identificación clara facilita archivo, recuperación y comparación histórica.$BODY_774$, 19
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'resumen_ejecutivo_19', 'Resumen ejecutivo', $BODY_775$En informes extensos puede utilizarse un resumen ejecutivo que comunique:
- problema o propósito;
- hallazgos principales;
- implicación administrativa;
- decisiones o acciones prioritarias.

Debe reflejar fielmente el informe completo. No debe contener conclusiones que no aparezcan sustentadas en el cuerpo del documento.$BODY_775$, 20
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'm_todo_y_fuentes_de_datos_20', 'Método y fuentes de datos', $BODY_776$Cuando la interpretación depende de cómo se obtuvieron los datos, debe indicarse:
- fuente;
- período;
- método de recolección;
- población/muestra si aplica;
- definiciones importantes;
- limitaciones relevantes.

Esto permite al lector valorar qué tan comparables y confiables son los resultados.$BODY_776$, 21
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'presentaci_n_de_hallazgos_21', 'Presentación de hallazgos', $BODY_777$Los hallazgos deben presentarse de manera ordenada y directamente vinculada al objetivo.

Puede utilizarse:
- texto breve;
- tablas;
- indicadores;
- gráficos;
- tendencias;
- comparaciones.

Evitar incluir datos solo porque están disponibles. La información irrelevante puede ocultar lo importante.$BODY_777$, 22
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'dato_indicador_interpretaci_n_y_conclusi_n_22', 'Dato, indicador, interpretación y conclusión', $BODY_778$**Dato:** valor observado o registrado.

**Indicador:** medida construida para resumir desempeño.

**Interpretación:** explicación razonada de lo que el dato puede significar en su contexto.

**Conclusión:** síntesis respaldada por la evidencia presentada.

Ejemplo: 12 ausencias es un dato. El porcentaje de ausentismo requiere un denominador adecuado. Decir que el ausentismo explica una caída de productividad es una interpretación que necesita evidencia adicional.$BODY_778$, 23
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'tablas_y_gr_ficos_23', 'Tablas y gráficos', $BODY_779$Una tabla o gráfico debe:
- tener título claro;
- indicar unidad de medida;
- usar categorías consistentes;
- mostrar período;
- evitar escalas engañosas;
- identificar fuente cuando corresponda.

Un gráfico llamativo no corrige datos deficientes. La visualización debe ayudar a comprender, no a exagerar.$BODY_779$, 24
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comparaciones_v_lidas_24', 'Comparaciones válidas', $BODY_780$Antes de comparar unidades o períodos verificar:
- misma definición del indicador;
- mismo denominador;
- período comparable;
- población semejante;
- cambios de método;
- datos completos.

Una diferencia aparente puede deberse a una modificación del registro y no a un cambio real del desempeño.$BODY_780$, 25
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'uso_de_tendencias_25', 'Uso de tendencias', $BODY_781$Las tendencias permiten observar dirección y persistencia del cambio.

Un solo mes puede ser atípico. Cuando sea posible, comparar varios períodos ayuda a distinguir:
- variación aleatoria;
- deterioro persistente;
- mejora sostenida;
- efecto temporal de una contingencia.

No toda variación requiere la misma respuesta.$BODY_781$, 26
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'cuidado_al_atribuir_causas_26', 'Cuidado al atribuir causas', $BODY_782$Un informe puede mostrar asociación entre hechos, pero no debe afirmar causalidad sin evidencia suficiente.

**Ejemplo:** aumento de eventos durante un mes con alta ocupación no demuestra automáticamente que la ocupación causó todos los eventos. Puede justificar análisis adicional.

Lenguaje prudente:
- “se observó coincidencia”;
- “podría contribuir”;
- “requiere análisis”;

en lugar de afirmar causas no demostradas.$BODY_782$, 27
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'conclusiones_27', 'Conclusiones', $BODY_783$Las conclusiones deben responder al objetivo inicial y derivarse de los hallazgos.

Una buena conclusión:
- sintetiza;
- no introduce datos nuevos;
- diferencia hechos de interpretación;
- reconoce límites;
- orienta decisión.

Una conclusión extensa que repite todo el informe pierde utilidad.$BODY_783$, 28
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'recomendaciones_28', 'Recomendaciones', $BODY_784$Las recomendaciones deben ser:
- pertinentes;
- factibles;
- relacionadas con hallazgos;
- priorizadas por riesgo/impacto;
- suficientemente específicas.

**Débil:** “mejorar la comunicación”.

**Mejor:** “estandarizar el cambio de turno con la herramienta institucional, capacitar al personal y reevaluar cumplimiento en cuatro semanas”, si esa intervención corresponde al problema demostrado.$BODY_784$, 29
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'del_informe_al_plan_de_acci_n_29', 'Del informe al plan de acción', $BODY_785$Cuando el informe identifica una brecha, conviene convertir la recomendación en un plan con:
- acción;
- responsable;
- fecha/plazo;
- recursos;
- indicador de seguimiento;
- momento de reevaluación.

Sin responsable y seguimiento, muchas recomendaciones quedan archivadas sin cambio real.$BODY_785$, 30
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'anexos_y_evidencia_30', 'Anexos y evidencia', $BODY_786$Los anexos pueden incluir:
- tablas detalladas;
- instrumentos utilizados;
- definiciones;
- listados agregados;
- documentos de respaldo permitidos.

No deben incorporarse datos personales innecesarios. El anexo también está sujeto a confidencialidad y control de acceso.$BODY_786$, 31
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'calidad_de_los_datos_31', 'Calidad de los datos', $BODY_787$La OMS destaca dimensiones de calidad de datos como **completitud, oportunidad, consistencia y exactitud**.

Un informe confiable requiere revisar si:
- se recibieron los datos esperados;
- llegaron a tiempo;
- son internamente coherentes;
- reflejan razonablemente la actividad real.

La calidad del informe nunca puede superar la calidad de los datos de origen.$BODY_787$, 32
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'completitud_32', 'Completitud', $BODY_788$Debe verificarse si faltan:
- turnos;
- días;
- unidades;
- formularios;
- variables críticas.

Presentar un mes como completo cuando faltan varios días puede inducir decisiones incorrectas. Si existen faltantes, deben declararse.$BODY_788$, 33
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'oportunidad_de_los_datos_y_del_informe_33', 'Oportunidad de los datos y del informe', $BODY_789$Un dato puede ser correcto y aun así perder utilidad si llega demasiado tarde.

La oportunidad implica:
- registrar a tiempo;
- consolidar según calendario;
- entregar el informe dentro del plazo;
- escalar antes cualquier riesgo que no pueda esperar.

**Clave de examen:** un informe mensual no sustituye una alerta inmediata.$BODY_789$, 34
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'consistencia_34', 'Consistencia', $BODY_790$La consistencia implica usar las mismas definiciones, categorías y métodos a lo largo del tiempo, salvo que el cambio esté documentado.

Si un servicio cambia la definición de “incumplimiento”, debe anotarlo antes de comparar con meses anteriores.$BODY_790$, 35
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'exactitud_y_verificaci_n_35', 'Exactitud y verificación', $BODY_791$La exactitud requiere que los datos representen lo ocurrido.

Prácticas útiles:
- revisar sumas;
- confirmar valores extremos;
- comparar con fuente primaria cuando sea necesario;
- verificar denominadores;
- evitar duplicados;
- corregir errores de transcripción.

Nunca modificar un dato solo porque “no parece conveniente”.$BODY_791$, 36
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'datos_cuantitativos_y_cualitativos_36', 'Datos cuantitativos y cualitativos', $BODY_792$Los informes pueden combinar:

**Cuantitativos:** frecuencias, tasas, porcentajes, tiempos, consumo.

**Cualitativos:** observaciones, causas percibidas, barreras, comentarios categorizados.

Los datos cualitativos pueden explicar contexto, pero deben presentarse de manera estructurada y no como rumores.$BODY_792$, 37
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'numeradores_y_denominadores_37', 'Numeradores y denominadores', $BODY_793$Cuando se reportan porcentajes o tasas debe conocerse qué representan.

Ejemplo:

```text
Cumplimiento (%) = oportunidades cumplidas / oportunidades evaluadas × 100
```

El denominador incorrecto puede cambiar totalmente la interpretación. Cuando hay “no aplica”, la regla de cálculo debe estar definida.$BODY_793$, 38
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'redacci_n_objetiva_38', 'Redacción objetiva', $BODY_794$La redacción debe describir hechos verificables.

**Evitar:** “el turno nocturno es irresponsable”.

**Preferir:** “en 7 de 20 registros revisados del turno nocturno faltó la firma requerida según el criterio institucional”.

La segunda formulación puede verificarse, cuantificarse y discutirse sin etiquetar personas.$BODY_794$, 39
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'claridad_concisi_n_y_precisi_n_39', 'Claridad, concisión y precisión', $BODY_795$Un informe administrativo debe ser comprensible para su destinatario.

Buenas prácticas:
- oraciones directas;
- términos definidos;
- datos relevantes;
- evitar redundancia;
- explicar siglas;
- usar unidades consistentes;
- separar hallazgo de recomendación.

Conciso no significa incompleto; significa eliminar contenido que no aporta a la decisión.$BODY_795$, 40
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'lenguaje_profesional_40', 'Lenguaje profesional', $BODY_796$Evitar:
- burlas;
- acusaciones sin evidencia;
- etiquetas despectivas;
- especulación presentada como hecho;
- lenguaje emocional innecesario.

El informe puede señalar incumplimientos importantes con firmeza y objetividad sin perder profesionalismo.$BODY_796$, 41
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'confidencialidad_41', 'Confidencialidad', $BODY_797$El Código Deontológico de la ANEP exige proteger información confidencial conocida durante el ejercicio profesional y compartir con el equipo solo lo necesario.

En informes administrativos esto implica:
- usar datos agregados cuando sea suficiente;
- limitar identificadores personales;
- enviar por canales autorizados;
- evitar copias innecesarias;
- controlar quién puede acceder.$BODY_797$, 42
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'protecci_n_de_datos_personales_en_panam__42', 'Protección de datos personales en Panamá', $BODY_798$La **Ley 81 de 2019** establece el régimen general de protección de datos personales en Panamá y fue reglamentada por el **Decreto Ejecutivo 285 de 28 de mayo de 2021**.

Para fines administrativos, el estudiante debe comprender el principio práctico: **tener acceso a información no autoriza a divulgarla libremente**. Los informes deben tratar datos personales con la finalidad, seguridad, confidencialidad y acceso correspondientes.

Este paquete no sustituye asesoría legal ni políticas institucionales específicas.$BODY_798$, 43
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'minimizaci_n_de_datos_43', 'Minimización de datos', $BODY_799$Antes de incluir nombres, números de historia, identificadores u otros datos personales debe preguntarse:

> ¿Es realmente necesario para el objetivo del informe?

Cuando el análisis puede realizarse con datos agregados o anonimizados, se reduce exposición innecesaria.$BODY_799$, 44
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'custodia_y_control_de_acceso_44', 'Custodia y control de acceso', $BODY_800$Los informes pueden contener información sensible de pacientes, personal o institución.

Deben respetarse:
- permisos;
- ubicación segura;
- credenciales;
- restricciones de impresión/reenviado cuando existan;
- conservación y archivo según política;
- destrucción segura cuando corresponda.

No utilizar mensajería personal o cuentas no autorizadas para documentos sensibles.$BODY_800$, 45
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'versiones_firma_y_trazabilidad_45', 'Versiones, firma y trazabilidad', $BODY_801$Cuando un informe puede modificarse, conviene identificar:
- versión;
- fecha;
- responsable;
- aprobación si aplica;
- cambios relevantes.

Esto evita que circulen simultáneamente varias versiones con resultados diferentes.$BODY_801$, 46
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'correcciones_y_enmiendas_46', 'Correcciones y enmiendas', $BODY_802$Si se detecta un error después de emitir un informe:
- no ocultarlo;
- identificar el dato incorrecto;
- verificar la fuente;
- emitir corrección o versión actualizada según política;
- informar a quienes recibieron la versión previa cuando el error pueda cambiar decisiones.

La transparencia preserva confiabilidad.$BODY_802$, 47
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'archivo_y_recuperaci_n_47', 'Archivo y recuperación', $BODY_803$Balderas incluye el **archivo** dentro de métodos de control cercanos a auditoría e informes.

Administrativamente, archivar permite:
- recuperar antecedentes;
- comparar períodos;
- demostrar seguimiento;
- apoyar auditorías;
- mantener memoria institucional.

El archivo debe seguir reglas de conservación, seguridad y acceso.$BODY_803$, 48
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'presentaci_n_del_informe_48', 'Presentación del informe', $BODY_804$Algunos informes se entregan por escrito y además se presentan en reunión.

Durante la presentación conviene destacar:
1. objetivo;
2. 3–5 hallazgos prioritarios;
3. riesgos;
4. decisiones necesarias;
5. responsables y plazos.

Leer cada línea del informe suele ser menos útil que explicar lo que requiere decisión.$BODY_804$, 49
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'comunicaci_n_urgente_vs_informe_49', 'Comunicación urgente vs informe', $BODY_805$Un hallazgo crítico debe comunicarse **inmediatamente** por el canal correspondiente.

Ejemplo: falta de oxígeno que compromete atención actual.

Conducta correcta:
1. proteger/activar respuesta inmediata;
2. comunicar y escalar;
3. documentar según corresponda;
4. posteriormente incluirlo en el informe administrativo si es pertinente.

Nunca esperar a “terminar el informe” para actuar ante riesgo inmediato.$BODY_805$, 50
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informe_y_toma_de_decisiones_50', 'Informe y toma de decisiones', $BODY_806$Un buen informe reduce incertidumbre para decidir.

Puede apoyar decisiones sobre:
- redistribución de personal;
- compra de insumos;
- capacitación;
- revisión de procesos;
- refuerzo de supervisión;
- mantenimiento;
- cambios en programación;
- prioridades de mejora.

La decisión debe ser proporcional a la evidencia y al riesgo.$BODY_806$, 51
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informe_dentro_del_ciclo_de_control_51', 'Informe dentro del ciclo de control', $BODY_807$El informe se integra al proceso administrativo:

```text
Planificar
   ↓
Ejecutar
   ↓
Medir / supervisar
   ↓
Informar resultados
   ↓
Decidir acciones
   ↓
Corregir / mejorar
   ↓
Reevaluar
```

Por eso ADMIN-11 se relaciona directamente con ADMIN-07 y ADMIN-10.$BODY_807$, 52
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'informe_y_mejora_continua_52', 'Informe y mejora continua', $BODY_808$Un informe orientado a mejora debe cerrar con seguimiento.

Ejemplo:
- hallazgo: baja adherencia a un procedimiento;
- análisis: identificar barreras;
- acción: capacitación + ajuste de proceso;
- seguimiento: repetir medición comparable;
- nuevo informe: determinar si hubo mejora.

Sin reevaluación, no puede saberse si la acción produjo el cambio esperado.$BODY_808$, 53
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'retroalimentaci_n_al_equipo_53', 'Retroalimentación al equipo', $BODY_809$Los resultados relevantes deben retroalimentarse a quienes participan en el proceso.

La retroalimentación debe:
- centrarse en hechos;
- reconocer fortalezas;
- explicar brechas;
- relacionar cambios con seguridad/calidad;
- permitir preguntas;
- aclarar responsables.

Ocultar los resultados al equipo reduce oportunidad de aprendizaje.$BODY_809$, 54
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'aprendizaje_responsabilidad_y_uso_no_punitivo_54', 'Aprendizaje, responsabilidad y uso no punitivo', $BODY_810$Los informes de calidad y seguridad deben favorecer identificación de problemas del sistema y mejora.

Esto no significa eliminar responsabilidad profesional. Cuando existe conducta intencional, negligencia u otra situación que requiere investigación formal, deben seguirse los procedimientos correspondientes.

**Clave:** analizar el sistema y los hechos antes de culpar automáticamente a una persona.$BODY_810$, 55
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'sesgos_frecuentes_en_informes_55', 'Sesgos frecuentes en informes', $BODY_811$Pueden aparecer sesgos por:
- seleccionar solo datos favorables;
- excluir períodos problemáticos sin explicarlo;
- usar muestras convenientes;
- entrevistar solo a un grupo;
- cambiar definiciones;
- destacar porcentajes sin denominador;
- confundir correlación con causalidad.

Un informe profesional reconoce limitaciones en lugar de ocultarlas.$BODY_811$, 56
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_de_interpretaci_n_56', 'Errores de interpretación', $BODY_812$Errores comunes:
1. asumir que aumento de reportes significa necesariamente aumento real de eventos;
2. comparar tasas con denominadores diferentes;
3. usar un promedio que oculta valores extremos importantes;
4. concluir causa sin investigación;
5. extrapolar una muestra pequeña a todo el hospital;
6. ignorar datos faltantes.

El examen puede presentar cifras correctas pero interpretación incorrecta.$BODY_812$, 57
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'diferencia_entre_admin_10_y_admin_11_57', 'Diferencia entre ADMIN-10 y ADMIN-11', $BODY_813$**ADMIN-10:** enseña a seleccionar y utilizar **instrumentos para evaluar** la atención.

**ADMIN-11:** enseña a **organizar y comunicar los resultados** mediante informes administrativos.

Ejemplo:
- lista de cotejo = instrumento de ADMIN-10;
- hallazgos obtenidos = datos;
- informe de resultados y plan de acción = ADMIN-11.

Los temas se conectan, pero no son equivalentes.$BODY_813$, 58
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'relaci_n_con_admin_08_comunicaci_n_58', 'Relación con ADMIN-08 — Comunicación', $BODY_814$El informe es un medio de comunicación administrativa, pero ADMIN-08 estudia el proceso comunicativo de forma más amplia.

ADMIN-11 se concentra en comunicación **documentada y estructurada de resultados, hallazgos y decisiones**.$BODY_814$, 59
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'relaci_n_con_admin_09_dotaci_n_de_recursos_humanos_59', 'Relación con ADMIN-09 — Dotación de recursos humanos', $BODY_815$Los datos de dotación pueden formar parte de un informe, por ejemplo:
- ausentismo;
- cobertura;
- vacantes;
- horas adicionales;
- carga de trabajo.

ADMIN-09 enseña a analizar necesidades de personal. ADMIN-11 enseña a presentar esa información para decisión.$BODY_815$, 60
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'relaci_n_con_el_registro_cl_nico_y_el_pae_60', 'Relación con el registro clínico y el PAE', $BODY_816$El informe administrativo no sustituye la documentación del PAE.

Si una intervención de enfermería se realizó, debe registrarse donde corresponde clínicamente. Incluirla después en un informe agregado no corrige una omisión del expediente.

**Regla:** documentación clínica y documentación administrativa tienen finalidades distintas y ambas pueden ser necesarias.$BODY_816$, 61
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'contexto_profesional_paname_o_61', 'Contexto profesional panameño', $BODY_817$El Código Deontológico de ANEP establece responsabilidad profesional, supervisión al delegar y deber de confidencialidad. Estos principios también orientan la elaboración de informes: la enfermera debe presentar información responsable, proteger datos y no ocultar errores.

La normativa general panameña de protección de datos refuerza el deber de manejar información personal con seguridad y confidencialidad.$BODY_817$, 62
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'qu_memorizar_para_cicde_62', 'Qué memorizar para CICDE', $BODY_818$- Informe administrativo = información estructurada para gestión y decisión.
- Primero se define objetivo, destinatario, período y alcance.
- Dato ≠ indicador ≠ interpretación ≠ conclusión.
- Un informe debe ser objetivo, claro, preciso, oportuno y trazable.
- Las conclusiones deben derivarse de los hallazgos.
- Una recomendación útil debe conducir a acción y seguimiento.
- Datos de calidad: completos, oportunos, consistentes y exactos.
- La confidencialidad se mantiene también en informes administrativos.
- Riesgo inmediato se comunica de inmediato; no espera al informe periódico.
- ADMIN-10 evalúa con instrumentos; ADMIN-11 comunica resultados mediante informes.$BODY_818$, 63
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'errores_frecuentes_de_examen_63', 'Errores frecuentes de examen', $BODY_819$1. Confundir informe administrativo con nota clínica.
2. Elaborar un informe sin objetivo definido.
3. Presentar porcentajes sin denominador.
4. Ocultar datos faltantes.
5. Escribir opiniones personales como hechos.
6. Atribuir causa sin evidencia.
7. Incluir identificadores personales innecesarios.
8. Esperar al informe mensual para comunicar un riesgo urgente.
9. Hacer recomendaciones sin responsable ni seguimiento.
10. Comparar períodos con definiciones diferentes.
11. Modificar datos para que “se vean mejor”.
12. Creer que más páginas significa mejor informe.
13. Confundir hallazgo con conclusión.
14. Suponer que el informe sustituye supervisión o acción correctiva.$BODY_819$, 64
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estrategia_cicde_para_admin_11_64', 'Estrategia CICDE para ADMIN-11', $BODY_820$Ante una pregunta sobre informes:

**Paso 1:** identifique qué información necesita la administración.

**Paso 2:** determine si la situación exige comunicación inmediata o puede esperar un informe.

**Paso 3:** separe dato, interpretación y conclusión.

**Paso 4:** verifique fuente y calidad de datos.

**Paso 5:** proteja confidencialidad.

**Paso 6:** elija la acción que convierte la información en decisión y seguimiento.

Si dos opciones parecen correctas, suele ser mejor la que **documenta objetivamente, comunica a tiempo, protege datos y facilita una acción verificable**.$BODY_820$, 65
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'situaciones_originales_tipo_examen_65', 'Situaciones originales tipo examen', $BODY_821$### Caso 1 — Hallazgo urgente
Durante la preparación del informe mensual se detecta que un equipo crítico está fuera de servicio y afecta atención actual.

**Prioridad:** comunicar y escalar inmediatamente; no esperar a finalizar el informe.

### Caso 2 — Opinión vs hecho
La supervisora escribe: “el personal nocturno es descuidado”.

**Mejor redacción:** describir criterios, registros revisados y hallazgos observables.

### Caso 3 — Datos incompletos
Faltan cinco días de datos, pero el informe presenta el total mensual como completo.

**Conducta:** declarar la incompletitud y evitar conclusiones que excedan la información disponible.

### Caso 4 — Porcentaje sin denominador
Se informa “15 % de incumplimiento” sin explicar cuántas oportunidades se evaluaron.

**Problema:** el lector no puede interpretar adecuadamente la medida.

### Caso 5 — Causa no demostrada
Aumentaron eventos y también ausentismo. La jefa concluye que el ausentismo causó todos los eventos.

**Conducta:** presentarlo como relación que requiere análisis, no causalidad demostrada.

### Caso 6 — Confidencialidad
Un informe de calidad con nombres de pacientes se envía a un grupo de mensajería personal.

**Conducta:** detener la divulgación y utilizar canales institucionales seguros; incluir solo datos necesarios.

### Caso 7 — Recomendación vaga
El informe concluye: “hay que mejorar”.

**Mejor opción:** definir acción, responsable, plazo e indicador de seguimiento.

### Caso 8 — Comparación inconsistente
Este mes se define “ausencia” de forma distinta al mes anterior.

**Conducta:** documentar el cambio y evitar comparación directa sin ajuste.

### Caso 9 — Informe de dotación
La jefa reporta que hay ocho enfermeras, pero no menciona carga ni complejidad.

**Problema:** el número aislado no demuestra suficiencia de dotación.

### Caso 10 — Registro clínico omitido
Una intervención no se documentó en el expediente, pero aparece después en el informe mensual.

**Interpretación:** el informe administrativo no corrige la omisión del registro clínico.

### Caso 11 — Corrección de error
Después de enviar el informe se descubre un error que cambia el resultado principal.

**Conducta:** verificar, corregir formalmente e informar a los destinatarios afectados.

### Caso 12 — Muchas páginas
Un informe contiene 50 páginas de datos sin conclusión ni prioridades.

**Problema:** información abundante sin análisis no facilita decisión.

### Caso 13 — Tendencia
Un indicador empeora un mes después de mantenerse estable durante un año.

**Conducta:** investigar contexto antes de afirmar deterioro permanente.

### Caso 14 — Informe de supervisión
Se identifican tres incumplimientos críticos.

**Informe adecuado:** criterio, evidencia, riesgo, acciones inmediatas, recomendación y seguimiento.

### Caso 15 — Datos favorables solamente
La jefatura elimina del informe los resultados negativos para “proteger al servicio”.

**Problema:** compromete integridad, toma de decisiones y responsabilidad profesional.

### Caso 16 — Destinatario
Se prepara un informe técnico muy extenso para una reunión donde la dirección necesita decidir una compra urgente.

**Mejor enfoque:** resumen ejecutivo con hallazgos, impacto, necesidad y decisión solicitada, manteniendo anexos de respaldo.

### Caso 17 — Informe y mejora
Tras un informe de auditoría se ejecuta capacitación, pero nunca se vuelve a medir.

**Problema:** no se comprobó efectividad de la acción.

### Caso 18 — Datos personales
Para demostrar ausentismo se adjunta al informe general una lista con diagnósticos médicos del personal.

**Conducta:** utilizar solo la información necesaria y autorizada; evitar divulgar datos sensibles que no son pertinentes al objetivo.$BODY_821$, 66
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'preguntas_r_pidas_de_repaso_66', 'Preguntas rápidas de repaso', $BODY_822$**1. ¿Para qué sirve un informe administrativo?** Para organizar y comunicar información útil para gestión, control y decisión.

**2. ¿Qué se define antes de redactar?** Objetivo, destinatario, período y alcance.

**3. ¿Dato e indicador son iguales?** No.

**4. ¿Un informe sustituye la nota clínica?** No.

**5. ¿Qué debe hacerse ante un riesgo inmediato?** Comunicar/escalar de inmediato y actuar; el informe puede venir después.

**6. ¿Qué cuatro dimensiones de calidad de datos deben recordarse?** Completitud, oportunidad, consistencia y exactitud.

**7. ¿Puede una conclusión introducir datos nuevos?** No debería; debe derivarse de los hallazgos.

**8. ¿Qué convierte una recomendación en seguimiento real?** Acción, responsable, plazo e indicador/reevaluación.

**9. ¿Se pueden incluir datos personales porque el informe es interno?** Solo los necesarios y conforme a acceso autorizado y normativa.

**10. ¿Cuál es la relación con ADMIN-10?** ADMIN-10 obtiene/evalúa información; ADMIN-11 la organiza y comunica mediante informes.$BODY_822$, 67
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'fuentes_y_validaci_n_67', 'Fuentes y validación', $BODY_823$## Fuente rectora CICDE
1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** _Lineamientos para el Examen de Competencias de Profesionales de Enfermería_, tercera edición, Panamá, 2026. Define `ADMIN-11` como **“Elaboración de informes”**.

## Bibliografía principal indicada por CICDE
2. **Balderas Pedrero, María de la Luz.** _Administración de los servicios de enfermería_. 7.ª ed. McGraw-Hill, 2015. ISBN 9786071512413. La tabla de contenidos oficial incluye **Informes** dentro del control y **Informe diario del estado de salud de los pacientes** entre instrumentos operativos.

https://www.mheducation.com.mx/administracion-de-los-servicios-de-enfermeria-9786071512413-latam-group

## Panamá — fuentes oficiales/profesionales
3. **Asociación Nacional de Enfermeras de Panamá (ANEP). Código Deontológico para Enfermeras de Panamá.** Sustenta responsabilidad profesional y deber de proteger información confidencial.

https://www.anep.org.pa/books/CODIGO%20DEONTOLOGICO%20NUEVO.pdf

4. **República de Panamá. Ley 81 de 26 de marzo de 2019 sobre Protección de Datos Personales**, reglamentada por el **Decreto Ejecutivo N.° 285 de 28 de mayo de 2021**. Marco general para tratamiento y confidencialidad de datos personales.

https://antai.gob.pa/legislacion/

## Fuente complementaria
5. **World Health Organization. Toolkit for Routine Health Information Systems data / Data Quality Assurance.** Marco para recolección, análisis, presentación, uso y revisión de calidad de datos rutinarios; destaca completitud, oportunidad, consistencia y exactitud.

https://www.who.int/data/data-collection-tools/health-service-data/toolkit-for-routine-health-information-system-data

https://www.who.int/data/data-collection-tools/health-service-data/data-quality-assurance-dqa$BODY_823$, 68
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'actualizaciones_y_l_mites_de_interpretaci_n_68', 'Actualizaciones y límites de interpretación', $BODY_824$- CICDE no enumera subtemas explícitos para ADMIN-11; la estructura de este paquete es expansión pedagógica.
- La tabla de contenidos oficial de Balderas fue verificada; este material no afirma acceso integral ni reproduce el capítulo.
- No existe un formato universal de informe aplicable a todos los hospitales o servicios.
- Nombres, periodicidad, firmas, rutas y conservación dependen de políticas institucionales y normativa aplicable.
- El informe diario de estado de pacientes citado por Balderas se presenta como instrumento operativo, no como sustituto del expediente o del pase de turno.
- La Ley 81 y su reglamentación se incorporan como marco general de protección de datos; la institución puede tener reglas adicionales.
- Este paquete no establece plazos legales específicos de conservación documental que no hayan sido verificados para el tipo concreto de informe.$BODY_824$, 69
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'control_de_calidad_del_paquete_69', 'Control de calidad del paquete', $BODY_825$Este paquete fue construido con las siguientes reglas:
- alcance cotejado contra CICDE 2026;
- se preservó literalmente `ADMIN-11 = Elaboración de informes`;
- no se inventaron subtemas CICDE;
- expansión apoyada en la tabla de contenidos oficial de Balderas;
- se diferenció informe administrativo de registro clínico, comunicación inmediata e informe de investigación;
- se integró calidad de datos con fuente OMS;
- se incorporaron confidencialidad profesional ANEP y protección general de datos en Panamá;
- no se inventó un formato institucional universal;
- no se inventaron plazos de entrega o conservación;
- se preservó frontera con ADMIN-08 y ADMIN-10;
- las 18 situaciones tipo examen son originales;
- no se declara revisión humana inexistente.$BODY_825$, 70
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

INSERT INTO lesson_sections (lesson_id, section_key, title, body, sort_order)
SELECT lesson_id, 'estado_para_integraci_n_70', 'Estado para integración', $BODY_826$**Estado recomendado:** `REVIEW`.

Motivo:
- alcance y fuentes revisados documentalmente;
- aún no existe revisor humano con provenance registrado;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` únicamente por revisión realizada por IA.

**Cobertura CICDE ADMIN-11:** tema principal cubierto de acuerdo con el alcance disponible.

**Situaciones originales tipo examen:** 18.

Con este paquete queda cubierta la secuencia `ADMIN-01` a `ADMIN-11` en el temario maestro, sujeta a la auditoría integral final del área antes de considerarla lista para simulacro.$BODY_826$, 71
FROM admin_lesson_map WHERE topic_code = 'ADMIN-11';

-- ================================================================
-- INSERT LESSON_SOURCES (via deterministic mappings)
-- ================================================================

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, true
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Administración de los servicios de enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Principles of Management — Chapter 3: The History of Management'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Taylor-Made Management'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Administrative and Bureaucratic Management'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Human Relations Movement'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Nightingale''s perspective of nursing administration'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Florence Nightingale and healthcare reform'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Transformational Leadership and Evidence-Based Management — Keeping Patients Safe'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Reseña histórica — Asociación Nacional de Enfermeras de Panamá'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Historia — Facultad de Enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Facultad de Enfermería: hacia la acreditación, liderazgo e internacionalización de la carrera'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Acerca de — Ministerio de Salud de Panamá'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Legislación organizativa del MINSA'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-01'
  AND s.citation_text = 'Región de Salud de Herrera'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, true
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-02'
  AND s.citation_text = 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-02'
  AND s.citation_text = 'Administración de los servicios de enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-02'
  AND s.citation_text = 'Principles of Management — The History of Management'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-02'
  AND s.citation_text = 'Taylor-Made Management'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-02'
  AND s.citation_text = 'Administrative and Bureaucratic Management'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-02'
  AND s.citation_text = 'Human Relations Movement'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-02'
  AND s.citation_text = 'Nursing Management and Professional Concepts — Chapter 4: Leadership and Management'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, true
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-03'
  AND s.citation_text = 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-03'
  AND s.citation_text = 'Administración de los servicios de enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-03'
  AND s.citation_text = 'Contingency and System Management'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-03'
  AND s.citation_text = 'The Internal Organization and External Environments'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-03'
  AND s.citation_text = 'A Model of Organizational Behavior and Management'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-03'
  AND s.citation_text = 'Quality of care'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-03'
  AND s.citation_text = 'How to address quality of health services'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-03'
  AND s.citation_text = 'Quality health services: a planning guide'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-03'
  AND s.citation_text = 'Guru Guide'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-03'
  AND s.citation_text = 'What Is Quality?'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, true
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-04'
  AND s.citation_text = 'Lineamientos para el Examen por Competencia de Profesionales de Enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-04'
  AND s.citation_text = 'Administración de los servicios de enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-04'
  AND s.citation_text = 'Principles of Management'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-04'
  AND s.citation_text = 'The Internal Organization and External Environments'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-04'
  AND s.citation_text = 'Leadership and Management'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, true
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-05'
  AND s.citation_text = 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-05'
  AND s.citation_text = 'Administración de los servicios de enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-05'
  AND s.citation_text = 'Introduction to Business 2e — The Role of Management'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-05'
  AND s.citation_text = 'Principles of Management — The Planning Process'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-05'
  AND s.citation_text = 'Introduction to Business 2e — Organizing'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-05'
  AND s.citation_text = 'Introduction to Business 2e — Authority: Establishing Organizational Relationships'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-05'
  AND s.citation_text = 'Principles of Management — The Process of Managerial Communication'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-05'
  AND s.citation_text = 'Organizational Behavior — Content Theories of Motivation'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-05'
  AND s.citation_text = 'Introduction to Business 2e — Controlling'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, true
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-06'
  AND s.citation_text = 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-06'
  AND s.citation_text = 'Administración de los servicios de enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-06'
  AND s.citation_text = 'Código Deontológico para Enfermeras de Panamá'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-06'
  AND s.citation_text = 'Decreto Ejecutivo N.° 29 de 5 de diciembre de 2025 — Día Nacional de la Humanización en la Atención y en los Servicios de Salud'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-06'
  AND s.citation_text = 'Decreto Ejecutivo N.° 17 de 23 de marzo de 2026 — Política Nacional de Salud 2026–2035'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-06'
  AND s.citation_text = 'Quality health services'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-06'
  AND s.citation_text = 'Integrated people-centred care'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-06'
  AND s.citation_text = 'Global Patient Safety Action Plan 2021–2030'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, true
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-07'
  AND s.citation_text = 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-07'
  AND s.citation_text = 'Administración de los servicios de enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-07'
  AND s.citation_text = 'Código Deontológico para Enfermeras de Panamá'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, true
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-08'
  AND s.citation_text = 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-08'
  AND s.citation_text = 'Administración de los servicios de enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-08'
  AND s.citation_text = 'Organizational Behavior — The Process of Managerial Communication'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-08'
  AND s.citation_text = 'TeamSTEPPS — Communication Concepts and Tools'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-08'
  AND s.citation_text = 'TeamSTEPPS Tool: SBAR'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-08'
  AND s.citation_text = 'TeamSTEPPS Tool: Check-Back (Repeat-Back)'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, true
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-09'
  AND s.citation_text = 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-09'
  AND s.citation_text = 'Administración de los servicios de enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-09'
  AND s.citation_text = 'WISN: indicadores de carga de trabajo para la estimación del personal necesario. Manual del usuario, 2.ª edición'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-09'
  AND s.citation_text = 'State of the world’s nursing 2025'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-09'
  AND s.citation_text = 'La fuerza de trabajo en salud en las Américas: datos e indicadores regionales'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-09'
  AND s.citation_text = 'Sistema de Información de Recursos Humanos de Salud (SIRHS)'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-09'
  AND s.citation_text = 'Primera Datatón en Panamá — iniciativa para fortalecer la planificación del recurso humano en salud'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, true
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-10'
  AND s.citation_text = 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-10'
  AND s.citation_text = 'Administración de los servicios de enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-10'
  AND s.citation_text = 'Indicadores de Calidad — Observatorio de Calidad de la Atención en Salud'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-10'
  AND s.citation_text = 'Auditoría de Egresos Hospitalarios 2024'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-10'
  AND s.citation_text = 'Quality of care'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-10'
  AND s.citation_text = 'Measuring and monitoring quality of care to improve maternal, newborn, child and adolescent health services'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-10'
  AND s.citation_text = 'Enfermería y seguridad de los pacientes'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-10'
  AND s.citation_text = 'Candidate Measure Submission Form — structure/process/outcomes definitions'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, true
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-11'
  AND s.citation_text = 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-11'
  AND s.citation_text = 'Administración de los servicios de enfermería'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-11'
  AND s.citation_text = 'Código Deontológico para Enfermeras de Panamá'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-11'
  AND s.citation_text = 'Ley 81 de 26 de marzo de 2019 sobre Protección de Datos Personales y Decreto Ejecutivo 285 de 28 de mayo de 2021'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

INSERT INTO lesson_sources (lesson_id, source_id, is_primary)
SELECT l.lesson_id, s.source_id, false
FROM admin_lesson_map l, admin_source_map s
WHERE l.topic_code = 'ADMIN-11'
  AND s.citation_text = 'Toolkit for Routine Health Information Systems data / Data Quality Assurance'
  AND NOT EXISTS (
    SELECT 1 FROM lesson_sources ls
    WHERE ls.lesson_id = l.lesson_id AND ls.source_id = s.source_id
  );

-- ================================================================
-- POSTCONDITIONS
-- ================================================================

DO $$
DECLARE
  admin_topics INT;
  admin_lessons INT;
  admin_review INT;
  admin_sections INT;
  admin_lesson_sources INT;
  baseline_sv INT;
  verified INT;
BEGIN
  SELECT COUNT(*) INTO admin_topics FROM topics WHERE code LIKE 'ADMIN-%';
  IF admin_topics != 11 THEN RAISE EXCEPTION 'Expected 11 topics, found %', admin_topics; END IF;
  
  SELECT COUNT(*) INTO admin_lessons
  FROM lessons l JOIN topics t ON t.id = l.topic_id WHERE t.code LIKE 'ADMIN-%';
  IF admin_lessons != 11 THEN RAISE EXCEPTION 'Expected 11 lessons, found %', admin_lessons; END IF;
  
  SELECT COUNT(*) INTO admin_review
  FROM lessons l JOIN topics t ON t.id = l.topic_id WHERE t.code LIKE 'ADMIN-%' AND l.status = 'REVIEW';
  IF admin_review != 11 THEN RAISE EXCEPTION 'Expected 11 REVIEW, found %', admin_review; END IF;
  
  SELECT COUNT(*) INTO admin_sections
  FROM lesson_sections ls JOIN lessons l ON l.id = ls.lesson_id JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'ADMIN-%';
  IF admin_sections != 826 THEN RAISE EXCEPTION 'Expected 826 sections, found %', admin_sections; END IF;
  
  SELECT COUNT(*) INTO admin_lesson_sources
  FROM lesson_sources lsrc JOIN lessons l ON l.id = lsrc.lesson_id JOIN topics t ON t.id = l.topic_id
  WHERE t.code LIKE 'ADMIN-%';
  IF admin_lesson_sources < 83 THEN RAISE EXCEPTION 'Expected >=83 lesson_sources, found %', admin_lesson_sources; END IF;
  
  SELECT COUNT(*) INTO baseline_sv FROM lessons WHERE status = 'SOURCE_VALIDATED';
  IF baseline_sv != 61 THEN RAISE EXCEPTION 'Expected 61 SOURCE_VALIDATED, found %', baseline_sv; END IF;
  
  SELECT COUNT(*) INTO verified FROM lessons WHERE status = 'VERIFIED';
  IF verified != 0 THEN RAISE EXCEPTION 'Expected 0 VERIFIED, found %', verified; END IF;
  
  RAISE NOTICE 'Postconditions PASS';
  RAISE NOTICE 'Administration: % topics, % lessons (REVIEW), % sections, % lesson_sources', admin_topics, admin_lessons, admin_sections, admin_lesson_sources;
END $$;

COMMIT;

-- TEMP tables dropped automatically on COMMIT
-- ================================================================
-- Administration integration complete (REVIEW status)
-- ================================================================
