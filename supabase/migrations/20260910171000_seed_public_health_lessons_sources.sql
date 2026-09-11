-- CICDE Enfermeria 2026
-- Auto-generated migration for PUBLIC_HEALTH lessons, sections, and sources
BEGIN;

-- 1. Insert globally deduplicated sources. All source verification provenance is NULL.
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('f6a33c85-e780-5680-a23d-f8bdff804d56', 'CICDE', 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería', NULL, 'IV CICDE', NULL, 2026, NULL, NULL, 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('dbaaa09a-8ed1-535a-8a28-178534e7432c', 'CICDE', 'Salud pública: introducción y generalidades', 'C. M. Ríos González', NULL, 'Servilibro S.R.L.', 2022, NULL, NULL, 'Salud pública: introducción y generalidades', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('7fe36274-9698-5be3-ba6d-bd00442bca16', 'CICDE', 'Ecología humana: el impacto de la actividad humana en el medio ambiente', 'O. Sala; M. Albaladejo', NULL, NULL, 2020, NULL, NULL, 'Ecología humana: el impacto de la actividad humana en el medio ambiente', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('3d272be7-05b5-51c9-85c2-d27fdbc7e2d1', 'COMPLEMENTARY', 'Climate change and health', NULL, 'World Health Organization', NULL, NULL, NULL, NULL, 'Climate change and health', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('c2ffce81-e399-518c-9358-db25f35ad5fa', 'COMPLEMENTARY', 'One Health / Una sola salud', NULL, 'World Health Organization', NULL, 2026, NULL, NULL, 'One Health / Una sola salud', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('8fab4086-7dae-5f32-aa46-2d6c51658c9f', 'COMPLEMENTARY', 'Climate Change and Health', NULL, 'Pan American Health Organization', NULL, NULL, NULL, NULL, 'Climate Change and Health', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('c63442be-16de-558f-8ec9-96512fdb8063', 'COMPLEMENTARY', 'Public Health Situation Analysis: El Niño in the Americas, 2026–2027', NULL, 'Pan American Health Organization', NULL, 2026, NULL, NULL, 'Public Health Situation Analysis: El Niño in the Americas, 2026–2027', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('3b633e82-19f1-5069-8f2d-526171bea8ba', 'PANAMA_OFFICIAL', 'Vulnerabilidad al Cambio Climático en la República de Panamá y su Repercusión en la Salud', NULL, 'Ministerio de Salud de Panamá', NULL, 2021, NULL, NULL, 'Vulnerabilidad al Cambio Climático en la República de Panamá y su Repercusión en la Salud', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('6272b064-2692-5324-9cc2-b6f87efa22cb', 'PANAMA_OFFICIAL', 'Metas de Cambio Climático 2024–2028 — Salud Pública', NULL, 'Ministerio de Ambiente de Panamá', NULL, NULL, NULL, NULL, 'Metas de Cambio Climático 2024–2028 — Salud Pública', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('24f37161-bffc-5ab1-82f3-14999c4f4957', 'COMPLEMENTARY', 'A health perspective on the role of the environment in One Health', NULL, 'World Health Organization', NULL, 2022, NULL, NULL, 'A health perspective on the role of the environment in One Health', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('68a86fca-2e4d-5344-bdfa-17079e2861aa', 'COMPLEMENTARY', 'Monitoring and evaluation for effective management of zoonotic diseases', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'Monitoring and evaluation for effective management of zoonotic diseases', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('445cfccd-2a4a-5149-ae11-42247d6d5bf4', 'PANAMA_OFFICIAL', 'Jornada Epidemiológica Nacional sobre Vigilancia Basada en Eventos y Preparación Comunitaria ante Virus con Potencial Pandémico', NULL, 'Ministerio de Salud de Panamá', NULL, 2025, NULL, NULL, 'Jornada Epidemiológica Nacional sobre Vigilancia Basada en Eventos y Preparación Comunitaria ante Virus con Potencial Pandémico', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('9ecc1347-f200-5676-a413-e625bc86d8a5', 'PANAMA_OFFICIAL', 'Primera cumbre de biovigilancia fuera de EE. UU. coloca a Panamá en el centro de la seguridad sanitaria regional', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Primera cumbre de biovigilancia fuera de EE. UU. coloca a Panamá en el centro de la seguridad sanitaria regional', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('14f67239-8757-501c-ad27-6e4d1ac0362b', 'COMPLEMENTARY', 'Urban health', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'Urban health', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('302610c7-0e0f-55bd-8f92-eaece9b812ee', 'COMPLEMENTARY', 'Green spaces: sectoral solutions for air pollution and health', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'Green spaces: sectoral solutions for air pollution and health', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('5499683b-7d19-5a7e-89d8-7167647d3a7a', 'COMPLEMENTARY', 'WHO Housing and health guidelines', NULL, 'World Health Organization', NULL, 2018, NULL, NULL, 'WHO Housing and health guidelines', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('39f940cd-a6d5-54c1-a1b4-abbc687024bd', 'COMPLEMENTARY', 'Urban Health Initiative', NULL, 'World Health Organization', NULL, NULL, NULL, NULL, 'Urban Health Initiative', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('cc1b39b0-1f16-5f1b-9b31-82ac6e0908b3', 'COMPLEMENTARY', 'State of systems for drinking-water, sanitation and hygiene: global update 2025', NULL, 'World Health Organization', NULL, 2026, NULL, NULL, 'State of systems for drinking-water, sanitation and hygiene: global update 2025', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('dc798b1b-2030-5032-b97b-b64ac1c3a411', 'COMPLEMENTARY', 'Agua, Saneamiento e Higiene (WASH)', NULL, 'Pan American Health Organization', NULL, NULL, NULL, NULL, 'Agua, Saneamiento e Higiene (WASH)', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('451b48d2-845d-56fa-ac1c-68b0fd5cb211', 'COMPLEMENTARY', 'Inocuidad de los alimentos', NULL, 'World Health Organization', NULL, 2026, NULL, NULL, 'Inocuidad de los alimentos', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('87249c8f-a504-5617-83c2-299d688b0bf0', 'COMPLEMENTARY', 'Keeping the vector out - Housing improvements for vector control and sustainable development', NULL, 'World Health Organization', NULL, 2017, NULL, NULL, 'Keeping the vector out - Housing improvements for vector control and sustainable development', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('5e2646b2-96dd-5bb4-bee1-bc1caf849fe5', 'PANAMA_OFFICIAL', 'Región de Salud de Herrera reitera medidas sanitarias ante situación del agua potable', NULL, 'Ministerio de Salud de Panamá', NULL, 2025, NULL, NULL, 'Región de Salud de Herrera reitera medidas sanitarias ante situación del agua potable', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('8b2f61a0-756b-55fd-a5d1-1a18e441c38f', 'PANAMA_OFFICIAL', 'Región de Salud en Panamá Este activa medidas de control y prevención en comunidades', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Región de Salud en Panamá Este activa medidas de control y prevención en comunidades', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('027a41cf-d3c6-5710-b470-bca9bb965ee5', 'PANAMA_OFFICIAL', 'Dirección Nacional de Control de Alimentos y Vigilancia Veterinaria realiza operativos por Fiestas Patronales de Santiago 2026', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Dirección Nacional de Control de Alimentos y Vigilancia Veterinaria realiza operativos por Fiestas Patronales de Santiago 2026', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('32022cde-afed-5c5f-b045-c39bfa53e9ba', 'PANAMA_OFFICIAL', 'Salud refuerza acciones de control de roedores en Belisario Frías', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Salud refuerza acciones de control de roedores en Belisario Frías', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('a5b09d12-a9eb-5738-9aa1-0f25c7091de4', 'COMPLEMENTARY', 'Universal health coverage (UHC)', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'Universal health coverage (UHC)', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('8e21951d-cdf1-5a42-bdb0-b8eb22c5437a', 'COMPLEMENTARY', 'International Health Regulations', NULL, 'World Health Organization', NULL, NULL, NULL, NULL, 'International Health Regulations', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('2b337a96-99fa-54cc-9fe1-a15ae864c84b', 'COMPLEMENTARY', 'Amended International Health Regulations enter into force', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'Amended International Health Regulations enter into force', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('d3bd7f6e-6809-52ed-9ca3-76878d6817bd', 'COMPLEMENTARY', 'WHO Pandemic Agreement', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'WHO Pandemic Agreement', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('56c17f75-3ceb-5068-ab3a-01de4bf69825', 'COMPLEMENTARY', 'Primary health care', NULL, 'World Health Organization', NULL, NULL, NULL, NULL, 'Primary health care', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('63bc66f1-5750-5060-a0ac-044ed9f5804c', 'COMPLEMENTARY', 'Sustainable Development Goal 3', NULL, 'United Nations', NULL, NULL, NULL, NULL, 'Sustainable Development Goal 3', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('7cf8b622-08bf-5e2c-85c3-d9f7b54a15de', 'COMPLEMENTARY', 'Health in All Policies', NULL, 'Pan American Health Organization', NULL, NULL, NULL, NULL, 'Health in All Policies', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('920524a0-04ed-50c3-a0a1-9b5a7e82c35b', 'COMPLEMENTARY', 'Seventy-ninth World Health Assembly – Daily update: 19 May 2026', NULL, 'World Health Organization', NULL, 2026, NULL, NULL, 'Seventy-ninth World Health Assembly – Daily update: 19 May 2026', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('6075bd5c-3625-5d7b-a43c-cbf4f16cda3b', 'COMPLEMENTARY', 'WHO Member States continue negotiations on the Pathogen Access and Benefit Sharing Annex', NULL, 'World Health Organization', NULL, 2026, NULL, NULL, 'WHO Member States continue negotiations on the Pathogen Access and Benefit Sharing Annex', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('6d9f12d5-4fea-5052-a405-b7054b6f96ce', 'COMPLEMENTARY', 'Las funciones esenciales de la salud pública en las Américas. Una renovación para el siglo XXI. Marco conceptual y descripción', NULL, 'Pan American Health Organization', NULL, 2020, NULL, NULL, 'Las funciones esenciales de la salud pública en las Américas. Una renovación para el siglo XXI. Marco conceptual y descripción', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('8bba6a04-f4ad-5eeb-9ae7-bcba6c0886f4', 'COMPLEMENTARY', 'Funciones esenciales de salud pública', NULL, 'Pan American Health Organization', NULL, NULL, NULL, NULL, 'Funciones esenciales de salud pública', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('84b84750-d043-54ff-896a-f5d1d71c0b49', 'COMPLEMENTARY', 'Implementación de las Funciones Esenciales de Salud Pública en las Américas: Evaluación y fortalecimiento de capacidades', NULL, 'Pan American Health Organization', NULL, 2025, NULL, NULL, 'Implementación de las Funciones Esenciales de Salud Pública en las Américas: Evaluación y fortalecimiento de capacidades', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('959f533a-286b-5df9-b24b-cc09e6746de7', 'COMPLEMENTARY', 'RedFESP pone en marcha el primer eje estratégico de su Plan de Trabajo 2026', NULL, 'Pan American Health Organization', NULL, 2026, NULL, NULL, 'RedFESP pone en marcha el primer eje estratégico de su Plan de Trabajo 2026', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('246d8818-2cdf-597b-8c5d-d9e9d542474b', 'COMPLEMENTARY', 'Determinantes sociales de la salud', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'Determinantes sociales de la salud', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('a0c668ee-4042-5d55-a699-59bbc30f31be', 'COMPLEMENTARY', 'Determinantes sociales de la salud', NULL, 'Pan American Health Organization', NULL, NULL, NULL, NULL, 'Determinantes sociales de la salud', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('26b48a50-bf05-52da-b4e3-2108577bebd0', 'COMPLEMENTARY', 'Marco operacional para la inclusión del enfoque de equidad, determinantes sociales y promoción de la salud en la atención primaria de salud', NULL, 'Pan American Health Organization', NULL, 2026, NULL, NULL, 'Marco operacional para la inclusión del enfoque de equidad, determinantes sociales y promoción de la salud en la atención primaria de salud', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('c9994b94-7d09-538b-8fce-c297c44331ff', 'PANAMA_OFFICIAL', 'Decreto Ejecutivo No. 17 de 23 de marzo de 2026 - Política Nacional de Salud 2026-2035', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Decreto Ejecutivo No. 17 de 23 de marzo de 2026 - Política Nacional de Salud 2026-2035', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('1512781f-d722-5d5c-956f-b66cc44153d7', 'COMPLEMENTARY', 'Principles of Epidemiology in Public Health Practice', NULL, 'Centers for Disease Control and Prevention', NULL, NULL, NULL, NULL, 'Principles of Epidemiology in Public Health Practice', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('f0a7a34f-bd9f-5117-89d8-ea379a42b451', 'COMPLEMENTARY', 'Chain of Infection Components', NULL, 'Centers for Disease Control and Prevention', NULL, NULL, NULL, NULL, 'Chain of Infection Components', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('5e037af4-7d41-5fe6-a915-7271c8b34148', 'PANAMA_OFFICIAL', 'Política Nacional de Salud, sus objetivos estratégicos y líneas de acción para el periodo 2026-2035', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Política Nacional de Salud, sus objetivos estratégicos y líneas de acción para el periodo 2026-2035', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('4a085252-d9cd-591c-9175-e5a48eda5a41', 'PANAMA_OFFICIAL', 'Indicadores de Salud', NULL, 'Ministerio de Salud de Panamá', NULL, NULL, NULL, NULL, 'Indicadores de Salud', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('d37dbb11-2a0c-5336-8bb7-8b861f78cb03', 'PANAMA_OFFICIAL', 'Programas', NULL, 'Ministerio de Salud de Panamá', NULL, NULL, NULL, NULL, 'Programas', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('c0d9e7b6-69fb-5973-8287-1ea8ca2b2ed8', 'PANAMA_OFFICIAL', 'Cartera de servicio por nivel de atención', NULL, 'Ministerio de Salud de Panamá', NULL, NULL, NULL, NULL, 'Cartera de servicio por nivel de atención', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('417b2cb9-efcf-5a66-a50e-3d0d0a24b055', 'PANAMA_OFFICIAL', 'Enfermería: Pilar fundamental en la salud pública', NULL, 'Ministerio de Salud de Panamá', NULL, 2025, NULL, NULL, 'Enfermería: Pilar fundamental en la salud pública', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('5fcb8e50-6bef-50a0-9722-cb3e175f8048', 'PANAMA_OFFICIAL', 'Instalan Comisión para la Integración de los servicios de salud entre Minsa-CSS', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Instalan Comisión para la Integración de los servicios de salud entre Minsa-CSS', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('41b3ebfc-251f-5da7-bf42-9073b074eb74', 'PANAMA_OFFICIAL', 'Integración del sistema público de salud avanza en Chiriquí y Bocas del Toro', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Integración del sistema público de salud avanza en Chiriquí y Bocas del Toro', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('bec8859d-41fc-5f45-a2e3-16b9b290746c', 'PANAMA_OFFICIAL', 'Equipo de Salud de Pueblo Nuevo fortalece la atención integral con visitas domiciliarias', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Equipo de Salud de Pueblo Nuevo fortalece la atención integral con visitas domiciliarias', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('e9a78751-6d6a-5404-83a1-915b2bb13129', 'PANAMA_OFFICIAL', 'Orientaciones técnicas sobre la visita domiciliaria', NULL, 'Ministerio de Salud de Panamá', NULL, 2011, NULL, NULL, 'Orientaciones técnicas sobre la visita domiciliaria', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('84cc3bc6-4885-58c6-88d1-f56f0110b127', 'PANAMA_OFFICIAL', 'Decreto de Gabinete No. 1 de 15 de enero de 1969 - creación, estructura y funciones del Ministerio de Salud', NULL, 'Ministerio de Salud de Panamá', NULL, 1969, NULL, NULL, 'Decreto de Gabinete No. 1 de 15 de enero de 1969 - creación, estructura y funciones del Ministerio de Salud', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('75c70d26-2486-5245-a08f-e02b44c0c880', 'PANAMA_OFFICIAL', 'Texto Único de la Ley 51 de 2005, Orgánica de la Caja de Seguro Social, con reformas vigentes incluida la Ley 462 de 2025', NULL, 'Caja de Seguro Social', NULL, 2025, NULL, NULL, 'Texto Único de la Ley 51 de 2005, Orgánica de la Caja de Seguro Social, con reformas vigentes incluida la Ley 462 de 2025', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('ee8f25cf-1b4d-5a3c-a12a-f65df62675f5', 'PANAMA_OFFICIAL', 'Decreto Ejecutivo No. 26 de 26 de noviembre de 2025 - crea la Comisión de Integración de los Servicios Públicos de Salud', NULL, 'Ministerio de Salud de Panamá', NULL, 2025, NULL, NULL, 'Decreto Ejecutivo No. 26 de 26 de noviembre de 2025 - crea la Comisión de Integración de los Servicios Públicos de Salud', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('fab5da01-70e5-50d2-8995-8415c4e31e80', 'CICDE', 'Plan Nacional de Promoción de la Salud 2016-2025', NULL, 'Ministerio de Salud de Panamá', NULL, 2017, NULL, NULL, 'Plan Nacional de Promoción de la Salud 2016-2025', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('f64f1de9-c396-5318-95c0-c2fc3fe0aa4d', 'COMPLEMENTARY', 'Ottawa Charter for Health Promotion', NULL, 'World Health Organization', NULL, 1986, NULL, NULL, 'Ottawa Charter for Health Promotion', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('071e4be2-3686-584a-bfab-e6804b401834', 'COMPLEMENTARY', 'Health Promotion', NULL, 'World Health Organization', NULL, NULL, NULL, NULL, 'Health Promotion', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('c6363926-0c88-5ea6-bd61-baf0a818ad4e', 'COMPLEMENTARY', 'Geneva Charter for Well-being', NULL, 'World Health Organization', NULL, 2021, NULL, NULL, 'Geneva Charter for Well-being', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('d211a825-3795-5338-a5c2-75cc2d2b179a', 'COMPLEMENTARY', 'Health Promotion', NULL, 'Pan American Health Organization', NULL, NULL, NULL, NULL, 'Health Promotion', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('6220b898-c458-573f-b89f-95abd2f42f96', 'PANAMA_OFFICIAL', 'Política Nacional de Salud 2026-2035', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Política Nacional de Salud 2026-2035', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('aae18d5b-9eb2-59f0-84c2-5396be1426d8', 'PANAMA_OFFICIAL', 'Cuida tu corazón 2026', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Cuida tu corazón 2026', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('f68b39e2-985d-5471-a249-885d875d17af', 'COMPLEMENTARY', 'Health promotion and disease prevention', NULL, 'Pan American Health Organization', NULL, NULL, NULL, NULL, 'Health promotion and disease prevention', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('0ab90cab-0fe5-53a6-8629-f9d592811585', 'PANAMA_OFFICIAL', 'Ley No. 522 de 12 de mayo de 2026 - marco legal para la prevención, diagnóstico y control de las enfermedades no transmisibles', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Ley No. 522 de 12 de mayo de 2026 - marco legal para la prevención, diagnóstico y control de las enfermedades no transmisibles', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('6925d41c-b8a3-51d3-8473-d7adf6843a42', 'PANAMA_OFFICIAL', 'Prevención y autocuidado claves para evitar enfermedades prevenibles', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Prevención y autocuidado claves para evitar enfermedades prevenibles', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('9be316cd-4955-5dfe-a51f-8e842f7a03ee', 'PANAMA_OFFICIAL', 'Esquema Nacional de Vacunación 2026', NULL, 'Ministerio de Salud de Panamá - Programa Ampliado de Inmunización', NULL, 2026, NULL, NULL, 'Esquema Nacional de Vacunación 2026', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('ec67fd4f-c4df-54a7-bad1-c4fdaff74646', 'PANAMA_OFFICIAL', 'Panamá tiene su esquema de vacunación garantizado', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Panamá tiene su esquema de vacunación garantizado', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('a6e62671-69ac-5660-9fb4-5335b2d06ef0', 'PANAMA_OFFICIAL', 'Refuerzan actualización en vacunas para prevenir brotes y fortalecer cobertura nacional', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Refuerzan actualización en vacunas para prevenir brotes y fortalecer cobertura nacional', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('b6f19ef8-ba37-50da-9d80-752b952a80db', 'PANAMA_OFFICIAL', 'Vacunación protege la salud y fortalece la prevención en la población panameña', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Vacunación protege la salud y fortalece la prevención en la población panameña', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('697e31d2-4e2d-51a7-994a-e1839ce1da84', 'PANAMA_OFFICIAL', 'Minsa refuerza vigilancia epidemiológica y exhorta a completar la vacunación para prevenir la tos ferina', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Minsa refuerza vigilancia epidemiológica y exhorta a completar la vacunación para prevenir la tos ferina', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('cf1dc5f0-de6c-58cd-bb69-194224ff271b', 'COMPLEMENTARY', 'Vaccines and immunization: Vaccine safety', NULL, 'World Health Organization', NULL, NULL, NULL, NULL, 'Vaccines and immunization: Vaccine safety', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('8c733e3d-801e-5ce1-b721-697b60ab573f', 'COMPLEMENTARY', 'Controlled temperature chain', NULL, 'World Health Organization', NULL, NULL, NULL, NULL, 'Controlled temperature chain', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('5904be2d-d4b5-5e17-8364-fdb97fdf6488', 'COMPLEMENTARY', 'Vaccine management guidance', NULL, 'World Health Organization', NULL, NULL, NULL, NULL, 'Vaccine management guidance', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('c9574fc4-056b-58a1-9413-0e4d1f07e20c', 'PANAMA_OFFICIAL', 'Minsa inicia aplicación de anticuerpo monoclonal para fortalecer la protección de recién nacidos frente al VRS', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Minsa inicia aplicación de anticuerpo monoclonal para fortalecer la protección de recién nacidos frente al VRS', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('c4cbc6d0-da37-5b4a-b2de-db4f8fe9b174', 'COMPLEMENTARY', 'What is Primary Health Care?', NULL, 'World Health Organization', NULL, NULL, NULL, NULL, 'What is Primary Health Care?', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('17aa81aa-4c8f-5a6e-9f23-8055e0a96b21', 'COMPLEMENTARY', 'Primary Health Care', NULL, 'Pan American Health Organization', NULL, NULL, NULL, NULL, 'Primary Health Care', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('d711bc45-20c7-56ea-91d2-ce4a12c358fd', 'COMPLEMENTARY', 'Expanding the Roles of Nurses in Primary Health Care', NULL, 'Pan American Health Organization', NULL, 2018, NULL, NULL, 'Expanding the Roles of Nurses in Primary Health Care', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('07fe5f27-a0ff-5615-a34d-c49cd620ef22', 'COMPLEMENTARY', 'Strategic Directions for Nursing in the Region of the Americas', NULL, 'Pan American Health Organization', NULL, 2019, NULL, NULL, 'Strategic Directions for Nursing in the Region of the Americas', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('40dd91e6-de23-58be-8325-567278fa296e', 'PANAMA_OFFICIAL', 'Guía para la elaboración del Análisis de Situación de Salud (ASIS)', NULL, 'Ministerio de Salud de Panamá', NULL, NULL, NULL, NULL, 'Guía para la elaboración del Análisis de Situación de Salud (ASIS)', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('04167052-4d7f-56e3-851b-10607497be85', 'PANAMA_OFFICIAL', 'Análisis de Situación de Salud (ASIS)', NULL, 'Ministerio de Salud de Panamá', NULL, NULL, NULL, NULL, 'Análisis de Situación de Salud (ASIS)', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('bfc2dede-4deb-5ac2-a7e6-56096c992104', 'PANAMA_OFFICIAL', 'Estadísticas de Salud', NULL, 'Ministerio de Salud de Panamá', NULL, NULL, NULL, NULL, 'Estadísticas de Salud', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('05aed0dd-23f3-5b61-9b73-3eef769d61fe', 'PANAMA_OFFICIAL', 'Minsa impulsa la transformación digital de las estadísticas de salud para fortalecer la toma de decisiones', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Minsa impulsa la transformación digital de las estadísticas de salud para fortalecer la toma de decisiones', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('c1044e2b-79e2-5210-b276-11690e41cc1b', 'PANAMA_OFFICIAL', 'Resolución No. 112 de 25 de febrero de 2026 - Lineamientos Operacionales para la Participación de los Agentes Comunitarios en la Eliminación de la Malaria en Panamá', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Resolución No. 112 de 25 de febrero de 2026 - Lineamientos Operacionales para la Participación de los Agentes Comunitarios en la Eliminación de la Malaria en Panamá', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('907a13c4-9003-5c8b-bc4b-0306e8c2ebd2', 'COMPLEMENTARY', 'Primary health care measurement framework and indicators: monitoring health systems through a primary health care lens', NULL, 'World Health Organization & UNICEF', NULL, 2022, NULL, NULL, 'Primary health care measurement framework and indicators: monitoring health systems through a primary health care lens', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('7ebe624c-8feb-59bb-b862-c47621be23f2', 'COMPLEMENTARY', 'Social participation for universal health coverage: technical paper', NULL, 'World Health Organization', NULL, 2023, NULL, NULL, 'Social participation for universal health coverage: technical paper', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('4f70d564-ab95-5ce5-b204-7efaedef89b3', 'COMPLEMENTARY', 'Indicadores de Salud: elementos básicos para el análisis de situación de salud', NULL, 'Pan American Health Organization', NULL, 2001, NULL, NULL, 'Indicadores de Salud: elementos básicos para el análisis de situación de salud', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 2. Insert REVIEW lessons with null reviewer provenance.
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', id, 'Interacción entre el Ser Humano y su Entorno', 'Ecología, ambiente, ecosistemas y salud, con contaminación, cambio climático, enfermedades respiratorias/vectoriales y rol de enfermería.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = 'PUBLIC-01'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT '0eccfab6-0acf-5322-8274-a6a24050deb6', id, 'Enfermedades Zoonóticas y Ecología', 'Zoonosis y ecología desde Una Salud, con alteración de hábitat, rutas de transmisión, vigilancia, prevención y contexto panameño.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = 'PUBLIC-02'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT '11597845-086e-5ecf-98ca-a3c952827eee', id, 'Urbanización y Salud', 'Efectos de la urbanización sobre salud pública, contaminación, acceso a servicios, espacios verdes, vivienda, escuelas, comunidad y equidad.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = 'PUBLIC-03'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT '1a9a8bad-ed40-5c53-a662-72b6aa13426d', id, 'Riesgos para la salud del individuo y el medio ambiente', 'Riesgos sanitarios relacionados con agua, vivienda, inocuidad alimentaria, excretas, artrópodos y roedores, con enfoque de prevención y saneamiento ambiental.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = 'PUBLIC-04'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', id, 'Políticas de Salud Pública globales', 'Marcos globales de salud pública: derecho a la salud, ODS, cobertura universal, APS, Salud en Todas las Políticas, RSI y Acuerdo de la OMS sobre Pandemias.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = 'PUBLIC-05'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT '8c6dcac8-91ee-589d-904d-8798fc58c2cc', id, 'Las funciones esenciales de salud pública', 'Marco renovado OPS de las 11 Funciones Esenciales de Salud Pública, organizado en evaluación, desarrollo de políticas, asignación de recursos y acceso.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = 'PUBLIC-06'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT 'cc1640c4-15b5-5416-aa80-67ecb7610f45', id, 'Los determinantes de la salud', 'Determinantes sociales y estructurales de la salud, inequidades, gradiente social, acción intersectorial y aplicación al contexto panameño 2026–2035.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = 'PUBLIC-07'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT 'bed0e240-be6f-521a-8733-05dc084c041f', id, 'Enfermería en Salud Pública', 'Fundamentos de enfermería en salud pública, indicadores, tríada y cadena epidemiológica, sistema de salud panameño, política 2026–2035, programas, rol de enfermería y visita domiciliaria.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = 'PUBLIC-08'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT 'a1c66bde-690a-5d66-ac0e-1177382a549e', id, 'Promoción de la Salud', 'Promoción de la salud y educación sanitaria: Carta de Ottawa, equidad, entornos saludables, participación comunitaria, alfabetización en salud y rol de enfermería.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = 'PUBLIC-09'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT '655815c1-f66b-5ca8-a236-114b88a8c543', id, 'Prevención de la Enfermedad', 'Prevención primaria, secundaria y terciaria, tamizaje, detección temprana, rehabilitación y papel de enfermería, con contexto panameño 2026.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = 'PUBLIC-10'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', id, 'Programa ampliado de inmunización', 'Vacunas, inmunidad, tipos de vacunas, cadena de frío, eventos adversos, enfermedades prevenibles y Esquema Nacional de Vacunación de Panamá 2026.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = 'PUBLIC-11'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT '6e4a7814-0f74-5ef9-9dad-59eae4423b49', id, 'Concepto, estructura y tipos de familias', 'Familia como unidad de cuidado: concepto, estructura, tipos, funciones, roles, ciclo vital, genograma, ecomapa y valoración de enfermería.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = 'PUBLIC-12'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT '3fe4a301-8705-5637-ad05-8473c2aa9cc4', id, 'Diagnóstico integral de salud', 'Diagnóstico integral y ASIS: investigación en salud, participación comunitaria, indicadores, recolección de datos, priorización, planeación, implementación y evaluación.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics
WHERE code = 'PUBLIC-13'
ON CONFLICT (topic_id, version) DO NOTHING;

-- 3. Insert all Markdown sections in source order.
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('243a3816-b1b9-59d3-b0f6-bedb4522de70', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_1', 'Interacción entre el Ser Humano y su Entorno', '**Área:** Salud Pública
**Código:** PUBLIC-01
**area_code:** `PUBLIC_HEALTH`
**Estado académico:** `REVIEW`
**Versión:** 1
**Revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('52065870-f060-54bb-ae6b-a3177478cd5e', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_2', '1. Alcance oficial CICDE', 'El CICDE 2026 incluye **“Interacción entre el Ser Humano y su Entorno”** y exige:

- Conceptos de Ecología, Ecología Humana, Ambiente, Ecosistema, Salud y Biosistema.
- Efectos del deterioro ambiental y consecuencias en salud humana, incluyendo contaminación de aire y agua.
- Efectos del cambio climático en seres humanos, animales y medio ambiente.
- Enfermedades relacionadas con el clima, especialmente respiratorias y transmitidas por vectores.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f2560f6b-f564-59be-9f2c-e1e667f6b7b9', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_3', '2. Objetivos', 'El estudiante debe poder:

1. Definir ecología, ecología humana, ambiente, ecosistema, salud y biosistema.
2. Explicar cómo el ambiente influye en el proceso salud-enfermedad.
3. Identificar actividades humanas que deterioran el ambiente.
4. Relacionar contaminación del aire y agua con riesgos sanitarios.
5. Explicar vías directas e indirectas del cambio climático sobre la salud.
6. Reconocer grupos vulnerables.
7. Relacionar clima con enfermedades respiratorias y vectoriales.
8. Explicar impactos de calor, inundaciones, sequías e incendios.
9. Reconocer el papel de vigilancia integrada clima-salud.
10. Aplicar intervenciones de enfermería y salud pública.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6e0320b7-37ec-59ed-880a-e48574a10157', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_4', '3. Ecología', 'La **ecología** estudia las relaciones entre los seres vivos y el ambiente.

Incluye interacciones entre organismos, poblaciones, comunidades y factores como aire, agua, suelo, clima, recursos y energía.', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3fdb61e7-1d35-5c92-bb08-8fcacf354a56', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_5', 'Clave', 'En salud pública, la enfermedad no depende únicamente del individuo; también depende de exposiciones y condiciones ambientales.

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('46cb25bf-f591-53ea-b9cd-4fe8fd6008ce', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_6', '4. Ecología humana', 'La **ecología humana** analiza las relaciones entre personas, poblaciones y su ambiente físico, biológico, social y construido.

Incluye:

- vivienda;
- saneamiento;
- trabajo;
- transporte;
- urbanización;
- contaminación;
- alimentación;
- relaciones sociales;
- disponibilidad de recursos.

Dos comunidades expuestas al mismo peligro pueden tener resultados de salud diferentes por variaciones en vulnerabilidad y capacidad de respuesta.

---', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3b14b8de-e823-5e17-baad-6498a8241ceb', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_7', '5. Ambiente', 'El ambiente puede comprender:', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cecdfd37-c36b-5171-916f-fe146be19eab', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_8', 'Factores físicos', '- aire;
- agua;
- temperatura;
- radiación;
- ruido.', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('974c69a5-cf26-52c6-ab1d-a6e2f079acdd', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_9', 'Factores biológicos', '- animales;
- plantas;
- microorganismos;
- vectores.', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('586e09ef-f7cb-5fe7-90ad-635c8a7f7656', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_10', 'Factores sociales', '- pobreza;
- educación;
- trabajo;
- cultura;
- organización comunitaria.', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('71032915-8cfb-5cc8-877b-79f4986b80a4', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_11', 'Ambiente construido', '- viviendas;
- carreteras;
- escuelas;
- sistemas de agua;
- servicios sanitarios.

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('76d7f85d-82b3-5e7f-a234-60aa9668ee15', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_12', '6. Ecosistema', 'Un **ecosistema** está formado por componentes vivos y no vivos que interactúan en un espacio.

Las alteraciones del ecosistema pueden cambiar:

- distribución de vectores;
- calidad del agua;
- disponibilidad de alimentos;
- exposición a contaminantes;
- contacto entre humanos y animales.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ff16a55d-f3ae-55fe-8030-1eba3e25bcad', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_13', '7. Biosistema', 'Para el alcance CICDE, **biosistema** puede entenderse como un sistema biológico organizado cuyos componentes interactúan entre sí y con el ambiente.

Puede estudiarse a escala de:

- organismo;
- población;
- comunidad;
- ecosistema.', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('acc78ee2-b567-5b5c-a8a7-c67e03510bed', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_14', 'Nota académica', 'El uso exacto del término varía según el texto, por lo que se conserva la terminología CICDE sin imponer una definición excesivamente rígida.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c65de1a2-da55-599f-901b-31137665a5f5', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_15', '8. Salud y ambiente', 'La salud está vinculada con:

- aire limpio;
- agua segura;
- saneamiento;
- alimentos inocuos;
- vivienda;
- seguridad;
- clima;
- acceso a servicios.

La OMS reconoce que el cambio climático afecta determinantes ambientales y sociales de la salud y puede comprometer los sistemas sanitarios.

---', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dffbd48b-d73d-5f40-ae2d-5195796ff738', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_16', '9. Deterioro ambiental por actividades humanas', 'Ejemplos:

- quema de combustibles fósiles;
- deforestación;
- urbanización no planificada;
- manejo inadecuado de residuos;
- contaminación industrial;
- actividades extractivas;
- vertido de aguas residuales;
- sobreexplotación de recursos.

El efecto sanitario depende de magnitud, duración, vía de exposición, vulnerabilidad y respuesta disponible.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('38bb6042-b920-5bf9-9637-bd9a8334ca63', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_17', '10. Contaminación del aire', 'Fuentes frecuentes:

- tráfico;
- industrias;
- quema de residuos;
- incendios;
- combustibles domésticos;
- polvo;
- humo de tabaco.

Puede relacionarse con:

- irritación respiratoria;
- exacerbación de asma y EPOC;
- enfermedad cardiovascular;
- otros efectos respiratorios y sistémicos.

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d4678749-6356-52f0-8584-a0a115f846bd', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_18', '11. Material particulado y humo', 'Las partículas finas pueden penetrar profundamente en el aparato respiratorio.

Durante episodios de humo o mala calidad del aire, enfermería puede:

- educar sobre reducción de exposición;
- identificar grupos vulnerables;
- asegurar continuidad de medicamentos;
- reconocer signos de alarma;
- derivar cuando corresponda.

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ce6e0e20-f7b9-5219-8af9-ed2ee3528eed', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_19', '12. Contaminación del agua', 'El agua puede contaminarse por:

- microorganismos;
- aguas residuales;
- productos químicos;
- metales;
- escorrentía agrícola;
- residuos.', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('39caa028-858a-5749-b94f-d8469049415f', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_20', 'Clave de examen', '**Agua transparente no significa necesariamente agua microbiológicamente segura.**

---', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6cebc901-ec97-53f7-8331-77cf237e94e8', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_21', '13. Saneamiento', 'Incluye medidas relacionadas con:

- disposición segura de excretas;
- aguas residuales;
- residuos;
- higiene;
- control de contaminación.

El saneamiento deficiente facilita transmisión de enfermedades.

---', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0b13ac00-a8c3-5d99-b787-88f96e3686e2', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_22', '14. Cambio climático y salud', 'La OMS considera el cambio climático una amenaza fundamental para la salud.', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('811b81a8-f313-5228-9e1c-521591b24376', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_23', 'Vías directas', '- calor extremo;
- tormentas;
- inundaciones;
- incendios;
- lesiones.', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1efe368d-9f49-5c0d-a053-3a7abe748b17', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_24', 'Vías indirectas', '- vectores;
- agua;
- alimentos;
- calidad del aire;
- desplazamiento;
- inseguridad alimentaria;
- interrupción de servicios.

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8a66e420-804f-521f-a66c-499a229fc378', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_25', '15. Cambio climático como multiplicador de riesgo', 'Puede agravar riesgos existentes:

- calor + enfermedad cardiovascular o renal;
- sequía + inseguridad hídrica;
- lluvias intensas + inundaciones;
- cambios de temperatura y precipitación + modificación de vectores;
- incendios + contaminación del aire.', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('690673c1-810e-5e64-a716-c0aa07d005cd', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_26', 'Importante', 'El clima puede modificar exposición y probabilidad, pero no debe enseñarse como causa única de todos los eventos de enfermedad.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eae4365d-6ae6-5331-afce-bdc9430f6de3', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_27', '16. Vulnerabilidad', 'El riesgo depende de:

- amenaza;
- exposición;
- vulnerabilidad;
- capacidad de adaptación.

Grupos potencialmente más vulnerables:

- niños;
- personas mayores;
- embarazadas;
- personas con enfermedades crónicas;
- trabajadores al aire libre;
- personas en pobreza;
- comunidades con acceso limitado a agua o atención.

---', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fb998b7d-3ef6-51b7-86a3-3f30a38477ed', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_28', '17. Calor extremo', 'Puede producir:

- deshidratación;
- agotamiento por calor;
- golpe de calor;
- descompensaciones cardiovasculares;
- afectación renal.', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f45b3166-bb5c-5241-8bf4-fd6221361e83', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_29', 'Alarma', 'Alteración del estado mental + hipertermia + exposición a calor puede indicar golpe de calor y requiere atención urgente.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('563ad56a-fe3c-560f-b740-04232fc8aa29', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_30', '18. Clima y enfermedades respiratorias', 'El clima puede influir indirectamente por:

- incendios y humo;
- polvo;
- ozono;
- alérgenos;
- humedad;
- contaminación.

La OPS reconoce impactos respiratorios por contaminación y eventos climáticos.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bf470a61-e26c-56f1-8372-70d04b7d1453', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_31', '19. Incendios forestales', 'El humo puede causar o agravar:

- tos;
- irritación;
- disnea;
- asma;
- enfermedad pulmonar crónica.

Intervenciones comunitarias:

- alertas;
- reducción de exposición;
- protección de grupos de riesgo;
- continuidad de medicamentos;
- referencia por dificultad respiratoria.

---', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9f7b488a-b377-5094-9173-f0a64e915993', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_32', '20. Enfermedades transmitidas por vectores', 'Temperatura, precipitación, humedad y disponibilidad de agua pueden modificar:

- reproducción del vector;
- hábitat;
- distribución;
- contacto con personas.

Ejemplos relevantes en las Américas:

- dengue;
- malaria;
- chikunguña;
- Zika.

Existen además múltiples determinantes no climáticos.

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('896ad25e-fe9a-573a-94b3-ac97651213b2', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_33', '21. El Niño 2026–2027', 'La OPS publicó en junio de 2026 un análisis regional sobre El Niño 2026–2027.

Identificó riesgos potenciales relacionados con:

- enfermedades vectoriales;
- enfermedades por agua y alimentos;
- calor;
- humo de incendios;
- inseguridad alimentaria;
- desplazamiento;
- interrupciones de servicios.

Es un ejemplo contemporáneo de interacción clima-salud.

---', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('918a0295-08fa-5617-bc9d-960be4f9d439', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_34', '22. Inundaciones', 'Pueden producir:

- traumatismos;
- contaminación de agua;
- desplazamiento;
- pérdida de medicamentos;
- alteración de servicios;
- condiciones favorables para algunos vectores.

Enfermería participa en:

- educación;
- agua segura;
- vigilancia;
- continuidad de cuidados;
- detección de signos de alarma.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e6f63f5b-5d57-5caa-8443-6c3e05540b55', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_35', '23. Sequías', 'Pueden afectar:

- disponibilidad de agua;
- higiene;
- agricultura;
- alimentación;
- economía;
- calidad del aire por polvo o incendios.

---', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4a972e5c-fb0f-5571-a181-9964193e6a8e', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_36', '24. Seguridad alimentaria', 'El cambio climático puede afectar:

- producción;
- acceso;
- estabilidad de suministros;
- calidad de alimentos.

La consecuencia puede incluir inseguridad alimentaria y malnutrición.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b5268442-a34b-51d0-ac68-e64a1158bd52', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_37', '25. Salud mental y eventos ambientales', 'Los eventos extremos pueden relacionarse con:

- estrés;
- ansiedad;
- duelo;
- desplazamiento;
- pérdida de vivienda;
- síntomas postraumáticos.

La respuesta sanitaria debe integrar componentes físicos y psicosociales.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('199eb6d5-cabb-56da-9519-c6e647a11fb8', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_38', '26. Una Salud', 'La OMS actualizó en mayo de 2026 su marco informativo de **Una Salud**.

Integra:

- salud humana;
- salud animal;
- salud vegetal;
- ecosistemas.

Esto es especialmente pertinente porque CICDE pide estudiar efectos sobre seres humanos, animales y ambiente.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9109413b-98a8-5421-94e9-819e74bca1b5', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_39', '27. Vigilancia clima-salud', 'La vigilancia puede integrar datos:

- epidemiológicos;
- meteorológicos;
- ambientales;
- vectoriales.

La OPS reporta que varios países de las Américas incorporan datos meteorológicos en sistemas de vigilancia para riesgos vectoriales, respiratorios y relacionados con agua.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9c83fb61-fc07-551c-8633-6c4c2e9309f3', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_40', '28. Panamá: metas de salud pública y clima', 'MiAmbiente publica metas de cambio climático 2024–2028.

Para 2026 se plantean, entre otras:

- fortalecer el sistema de información y vigilancia epidemiológica con variables e indicadores de cambio climático;
- fortalecer promoción y prevención con variables e indicadores de cambio climático.', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5d9cd30b-23d5-5fc1-b644-15a5977474e0', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_41', 'Precaución', 'Son **metas programáticas**, no prueba automática de cumplimiento total.

---', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6a19dae6-20da-54f7-858b-f50d3cd7b32a', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_42', '29. Panamá: vulnerabilidad climática', 'MINSA dispone de la publicación:

**“Vulnerabilidad al Cambio Climático en la República de Panamá y su Repercusión en la Salud”.**

Esto documenta formalmente la relación cambio climático-salud dentro de la agenda sanitaria panameña.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('060dd2c4-f6ce-5a2f-ac26-917ea0672e76', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_43', '30. Rol de enfermería', 'Puede incluir:

- educación;
- vigilancia;
- detección temprana;
- identificación de grupos vulnerables;
- prevención;
- respuesta comunitaria;
- continuidad de tratamientos;
- recopilación de datos;
- coordinación.

---', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5b12ee83-d325-51ae-82a4-b24838f3bda0', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_44', '31. Educación comunitaria', 'Los mensajes deben ser:

- claros;
- específicos;
- culturalmente apropiados;
- accionables.

Ejemplos:

- hidratación ante calor;
- agua segura después de inundaciones;
- control de criaderos;
- reducción de exposición a humo;
- identificación de signos de alarma.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('10c2f040-4c90-55d0-8181-6d815d77c454', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_45', '32. PAE / proceso comunitario', '', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bf46d74f-63aa-508c-ad79-c405571dcfdf', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_46', 'Valoración', '- amenazas;
- exposición;
- vulnerabilidad;
- recursos;
- servicios;
- indicadores.', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('76684392-4b29-5792-a3bb-7ffdcf904631', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_47', 'Priorización', '- riesgo ambiental;
- población vulnerable;
- impacto potencial.', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('703e6881-ed85-59de-99cb-4293569d369c', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_48', 'Planificación', '- objetivos;
- responsables;
- recursos;
- indicadores.', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f67e7ddb-c50b-592d-ba9c-82dff3cb0125', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_49', 'Implementación', '- educación;
- vigilancia;
- prevención;
- coordinación.', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1770fce5-a17a-5099-8574-93ed88f9a01c', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_50', 'Evaluación', '- cobertura;
- exposición;
- eventos de salud;
- continuidad;
- resultados.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1cdc9896-6917-59c8-bb5f-60380fe0144c', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_51', '33. Situaciones tipo examen', '', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0f13c5bc-3dc2-58a7-a387-8189afb973aa', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_52', 'Caso 1', 'Comunidad almacena agua que luce limpia pero no está tratada.

**Respuesta:** el aspecto no garantiza seguridad microbiológica.', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('14c74a32-d032-5a6b-895f-db3d214cffb2', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_53', 'Caso 2', 'Persona con asma se expone a humo intenso de incendio.

**Prioridad:** reducir exposición, vigilar síntomas y asegurar tratamiento.', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c4949caf-0233-57f0-b697-77c0caf3cc07', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_54', 'Caso 3', 'Adulto mayor está confuso después de exposición prolongada a calor.

**Prioridad:** posible golpe de calor; atención urgente.', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a331a7db-e2f3-583c-a81d-28f96611ba18', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_55', 'Caso 4', 'Tras lluvias intensas aumentan recipientes con agua estancada.

**Riesgo:** criaderos de mosquitos.', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('97d75f93-e995-53a8-997e-e680c947b32f', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_56', 'Caso 5', 'Se atribuyen todos los casos de dengue únicamente al cambio climático.

**Error:** el clima influye, pero existen múltiples determinantes.', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('960ecb69-73ae-56a8-a918-b7254f58fe01', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_57', 'Caso 6', 'Una inundación contamina la fuente comunitaria.

**Prioridad:** agua segura, educación y vigilancia.', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('798d04ac-c2dc-5284-9009-cd29c1181942', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_58', 'Caso 7', 'Trabajadores permanecen a la intemperie bajo calor extremo.

**Intervención:** hidratación, sombra, pausas y vigilancia.', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d5297afb-aa3b-585b-9154-9a35e5077fdb', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_59', 'Caso 8', 'Una sequía afecta cultivos de una comunidad.

**Impacto:** posible inseguridad alimentaria y vulnerabilidad social.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cddb2d90-ec3b-5a02-a5ef-1f1d9e3134f5', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_60', 'Caso 9', 'Paciente con EPOC empeora durante episodio de humo.

**Interpretación:** contaminación ambiental puede exacerbar enfermedad respiratoria.', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('72f48a7d-c450-5b8b-bd2c-199883730da1', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_61', 'Caso 10', 'Programa combina datos meteorológicos y vigilancia de dengue.

**Interpretación:** vigilancia integrada clima-salud.', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('86f56a8c-c3fa-5426-b712-ea4ffdcba134', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_62', 'Caso 11', 'Una meta nacional plantea agregar indicadores climáticos a vigilancia epidemiológica.

**Interpretación:** medida de adaptación del sistema sanitario.', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('38225f97-0c4b-585b-b518-52f607e26a00', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_63', 'Caso 12', 'Una intervención excluye salud animal y ambiente.

**Limitación:** pierde la perspectiva integral de Una Salud.

---', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fd1d7df0-024d-58b3-82c8-b5c5bd0520bc', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_64', '34. Errores frecuentes', '1. Confundir ambiente con únicamente naturaleza.
2. Pensar que ecología estudia solo animales.
3. Creer que agua clara siempre es segura.
4. Reducir cambio climático solamente a calor.
5. Ignorar inundaciones, sequías e incendios.
6. Tratar el clima como causa única.
7. Ignorar determinantes sociales de vulnerabilidad.
8. Olvidar grupos vulnerables.
9. Excluir salud animal y ambiental.
10. Ignorar vigilancia epidemiológica.
11. Presentar metas programáticas como logros confirmados.
12. Reducir enfermería al tratamiento individual.

---', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c71e1b81-7fbc-5ad7-8324-586f0267e514', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_65', '35. Qué memorizar', '**Ecología = relaciones entre seres vivos y ambiente.**

**Ecología humana = personas/poblaciones + ambiente físico, biológico, social y construido.**

**Ecosistema = componentes vivos + no vivos que interactúan.**

**Cambio climático → efectos directos + indirectos.**

**Calor + inundaciones + sequías + incendios + vectores = riesgos clave.**

**Clima puede modificar enfermedades vectoriales y respiratorias, pero no es causa única.**

**Una Salud = humanos + animales + plantas + ecosistemas.**

**Enfermería = educación + vigilancia + prevención + respuesta + comunidad.**

---', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2d4301da-112f-5192-afad-d16b7febbb87', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_66', '36. Fuentes', '', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dc0055fb-e8c7-59c5-ae87-c54199bbc5c6', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_67', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('81458b2b-d05b-59c7-9c62-a2145e252630', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_68', 'Bibliografía CICDE', '**Ríos González, C. M. (ed.). Salud pública: introducción y generalidades. Servilibro, 2022. ISBN 978-99925-16-26-3.**

**Sala, O. & Albaladejo, M. Ecología humana: el impacto de la actividad humana en el medio ambiente. 2020.**  
Esta referencia se conserva porque aparece en la bibliografía CICDE suministrada, pero **no se logró corroborar de forma independiente su ficha editorial exacta**. No se utiliza como soporte único de afirmaciones clínicas o normativas.', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('07bfa896-139f-5e90-b1a2-9c70d6ef011d', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_69', 'Complementarias', '**World Health Organization. Climate change and health.**

**World Health Organization. One Health / Una sola salud. Actualizado 8 de mayo de 2026.**

**Pan American Health Organization. Climate Change and Health.**

**PAHO. Public Health Situation Analysis: El Niño in the Americas, 2026–2027. 26 de junio de 2026.**', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c5daada6-fcbd-5904-aa2d-3ee1c5db3d3b', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_70', 'Panamá', '**MINSA. Vulnerabilidad al Cambio Climático en la República de Panamá y su Repercusión en la Salud. Documento elaborado en 2021 y publicado por MINSA en 2022.**

**MiAmbiente. Metas de Cambio Climático 2024–2028 — Salud Pública.**

---', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e0c33ba1-ee66-5364-80b1-090dc0be3616', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_71', '37. Control de calidad', '- Alcance CICDE cubierto.
- `area_code` verificado contra CICDE_MASTER_SPEC: `PUBLIC_HEALTH`.
- Integra contaminación de aire y agua.
- Integra cambio climático, salud respiratoria y vectores.
- Usa contexto OPS 2026.
- Panamá se presenta con lenguaje conservador.
- 12 casos originales.
- Sin dosis ni protocolos inventados.

---', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e1f74c8d-d5c3-5b53-b221-2de65115978e', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_72', '38. Estado', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- revisión humana;
- confirmar metadatos bibliográficos CICDE;
- comprobar versión nacional más reciente de planes sectoriales clima-salud;
- enlazar PUBLIC-02, PUBLIC-03, PUBLIC-04 y PUBLIC-08.', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ef3bdf17-b7bd-5834-8cae-38aaf05e17be', '9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'sec_73', 'Auditoría documental 2026-09-10', 'Se reconfirmaron las fuentes OMS/OPS sobre Una sola salud y El Niño 2026–2027, las metas climáticas de MiAmbiente 2024–2028 y el documento MINSA de vulnerabilidad climática. También se completó la ficha editorial de *Salud pública: introducción y generalidades*. La referencia Sala/Albaladejo permanece identificada como bibliografía CICDE con metadatos editoriales no corroborados. El contenido permanece en `REVIEW`.', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2e4c7d30-496a-520a-91f1-947d555dffa8', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_1', 'Enfermedades Zoonóticas y Ecología', '**Área:** Salud Pública
**Código:** PUBLIC-02
**area_code:** `PUBLIC_HEALTH`
**Estado académico:** `REVIEW`
**Versión:** 1
**Revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('468fd7fa-b3dc-528a-a4ab-8c50305b4e3e', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_2', '1. Alcance oficial CICDE', 'El CICDE 2026 incluye:

**“Enfermedades Zoonóticas y Ecología”.**

Subtema:

- **Alteración del hábitat animal y la transmisión de enfermedades zoonóticas.**

Este módulo desarrolla esa relación desde el enfoque contemporáneo de **Una Salud (One Health)**.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1f1a3ce8-3e60-53da-8489-c9cfa384bab1', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_3', '2. Objetivos', 'El estudiante debe poder:

1. Definir zoonosis y transmisión zoonótica.
2. Relacionar alteración de hábitat con cambios en contacto humano-animal.
3. Identificar factores ecológicos que favorecen emergencia de zoonosis.
4. Explicar el enfoque Una Salud.
5. Diferenciar reservorio, huésped y vector.
6. Reconocer rutas generales de transmisión.
7. Identificar riesgos asociados a animales domésticos, silvestres y de producción.
8. Comprender la importancia de vigilancia integrada.
9. Aplicar medidas generales de prevención.
10. Reconocer el rol de enfermería.
11. Identificar exposiciones que requieren atención rápida.
12. Evitar respuestas estigmatizantes o indiscriminadas.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('504745df-20c3-5ac2-93cf-768ac068a5e7', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_4', '3. Zoonosis', 'Una **zoonosis** es una enfermedad o infección que puede transmitirse naturalmente entre animales vertebrados y seres humanos.

Los agentes pueden ser:

- virus;
- bacterias;
- parásitos;
- hongos;
- otros agentes infecciosos.

Ejemplos:

- rabia;
- leptospirosis;
- algunas salmonelosis;
- influenza aviar zoonótica;
- hantavirus;
- otras según región y exposición.

---', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ffa5c2c8-6b67-5bfd-a514-4d181053ac25', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_5', '4. Transmisión zoonótica', 'Puede ocurrir mediante:

- contacto directo;
- mordeduras o arañazos;
- secreciones;
- alimentos;
- agua;
- superficies o suelo contaminado;
- vectores;
- inhalación en determinados agentes.', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9affbfc6-f952-541a-acaa-78fc234d7751', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_6', 'Clave', 'La ruta depende del agente específico.

No existe una sola vía común a todas las zoonosis.

---', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('308ffac3-df53-5f6c-8ca9-f5efc4a3e5a6', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_7', '5. Una Salud', 'La OMS define **Una Salud** como un enfoque integrado y unificador para equilibrar y optimizar la salud de:

- personas;
- animales;
- plantas;
- ecosistemas.

Requiere colaboración entre múltiples sectores.

---', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('480692bc-d989-5d18-a879-80c11780f1e5', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_8', '6. Importancia actual', 'La OMS actualizó su ficha de Una Salud el **8 de mayo de 2026**.

Señala que alrededor del **60 % de las enfermedades infecciosas nuevas reportadas globalmente proceden de animales**, silvestres o domésticos.', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8bcaa77d-7ba0-54f9-bde9-bee8ea8c0f2c', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_9', 'Precisión', 'No significa que 60 % de todas las enfermedades humanas sean zoonóticas.

La cifra se refiere a enfermedades infecciosas nuevas o emergentes notificadas.

---', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e54d1694-528b-5610-8992-a4832195be0c', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_10', '7. Interfaz humano-animal-ambiente', 'El riesgo cambia cuando cambian las relaciones entre:

- personas;
- animales domésticos;
- ganado;
- fauna silvestre;
- vectores;
- ecosistemas.

Ejemplos de factores:

- urbanización;
- agricultura;
- comercio de animales;
- cambio climático;
- actividades extractivas;
- fragmentación de hábitat.

---', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('68c41bbd-c04c-56c2-bd9c-24888a972e36', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_11', '8. Alteración del hábitat', 'Puede incluir:

- deforestación;
- fragmentación;
- invasión de zonas silvestres;
- pérdida de biodiversidad;
- expansión urbana;
- agricultura intensiva;
- actividades extractivas.

Puede modificar:

- movimiento de animales;
- densidad de especies;
- contactos entre especies;
- contacto con personas;
- distribución de vectores.

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eac5c602-2d48-5e4c-8521-7df6fb0fc88c', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_12', '9. Fragmentación del hábitat', 'Cuando un hábitat se divide:

- algunas especies se desplazan;
- aumentan los bordes de contacto;
- cambian recursos y refugio;
- animales pueden acercarse a viviendas y cultivos.', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c0ddcde6-760b-59f3-bc28-24fe9c9c89b7', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_13', 'Salud pública', 'Esto puede crear oportunidades nuevas de exposición a agentes zoonóticos.

No significa que toda fragmentación produzca necesariamente un brote.

---', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d23e8323-bc65-548b-8a27-a8cdadd04c3a', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_14', '10. Pérdida de biodiversidad', 'La pérdida de biodiversidad puede alterar:

- abundancia de especies;
- competencia;
- reservorios;
- vectores;
- rutas de exposición.

La OMS reconoce la pérdida de biodiversidad, el cambio de uso del suelo, la contaminación y el cambio climático como factores relevantes en la interfaz Una Salud.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('46b6f73b-c5ae-598e-9dcd-9aab72023239', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_15', '11. Urbanización', 'Puede incrementar riesgo cuando:

- ciudades avanzan hacia hábitats;
- se acumulan residuos;
- proliferan roedores;
- hay agua estancada;
- existe control sanitario insuficiente.

También puede disminuir riesgos si mejora:

- saneamiento;
- agua;
- gestión de residuos;
- vigilancia;
- servicios.

---', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('530f1382-9fdc-51b3-a403-c19f14abf47c', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_16', '12. Agricultura y ganadería', 'Factores relevantes:

- densidad animal;
- bioseguridad;
- higiene;
- contacto ocupacional;
- manejo de estiércol;
- transporte;
- control veterinario;
- uso responsable de antimicrobianos.

El enfoque Una Salud coordina salud humana, animal, ambiental y producción alimentaria.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5c0502bf-e202-58c4-b79f-ace1d564f9ac', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_17', '13. Comercio de animales y fauna silvestre', 'El transporte, comercio y concentración de animales pueden:

- mezclar especies;
- aumentar contactos;
- facilitar dispersión geográfica de agentes.

La OMS incluye el comercio de animales entre los factores que pueden favorecer emergencia y propagación de enfermedades.

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e4288de7-fb02-5e55-999e-30364d7482e0', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_18', '14. Cambio climático y zoonosis', 'Los cambios de:

- temperatura;
- precipitación;
- humedad;
- distribución de especies;

pueden modificar:

- vectores;
- reservorios;
- temporadas;
- contactos entre especies.', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('88022b5a-c5b2-5db1-9241-06f991f61aa0', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_19', 'Importante', 'El clima es un factor dentro de un sistema multicausal.

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('79bf57e9-af74-5d64-adc3-2b3ccefde219', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_20', '15. Reservorio', 'Un **reservorio** es el hábitat en el que un agente infeccioso normalmente vive, se mantiene o se multiplica.

Puede ser:

- animal;
- humano;
- ambiental, según el agente.', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('84ceb290-fd77-52f8-b477-c9f08f10adc2', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_21', 'Clave', '**Reservorio ≠ vector.**

---', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f739c700-5b51-503f-9356-f643e2184e89', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_22', '16. Huésped', 'El **huésped** es un organismo que alberga un agente.

La susceptibilidad puede depender de:

- inmunidad;
- edad;
- salud;
- genética;
- exposición;
- ambiente.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2eaabef5-47bb-55b2-adf3-f2ca0c5cb0fd', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_23', '17. Vector', 'Un **vector** puede transmitir un agente entre huéspedes.

Ejemplos:

- mosquitos;
- garrapatas;
- pulgas.', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('063ef14d-60b4-5cf7-85a2-647220bd21bf', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_24', 'Clave', 'La ecología de cada enfermedad debe estudiarse según el agente concreto.

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('52d198df-732e-5f0e-822f-cf4189e1d765', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_25', '18. Contacto directo con animales', 'Riesgos pueden aumentar por:

- mordeduras;
- arañazos;
- manipulación de tejidos;
- contacto con secreciones;
- asistencia de partos animales;
- manejo de animales enfermos.

Medidas generales:

- higiene;
- PPE cuando corresponda;
- atención de heridas;
- vacunación cuando exista;
- evaluación postexposición.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('56e0f2d2-4712-5b0d-833c-fa7aafe4dac2', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_26', '19. Mordeduras', 'Prioridades generales:

- lavado inmediato y abundante con agua y jabón;
- valorar profundidad y daño;
- evaluar riesgo infeccioso;
- identificar al animal cuando sea seguro;
- solicitar atención para profilaxis específica según riesgo.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fc6d0303-2b1a-514c-b14e-b2b6aa98a60a', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_27', '20. Rabia como ejemplo zoonótico', 'La rabia suele transmitirse por saliva de animales infectados, especialmente mediante mordedura.', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('72f99e9b-554a-5e90-97e7-7269efff011f', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_28', 'Prioridad', 'Una exposición potencial a rabia requiere evaluación rápida para profilaxis postexposición según normas vigentes.

La enfermedad clínica es casi siempre mortal una vez aparecen síntomas, mientras que la profilaxis postexposición oportuna puede prevenirla.

---', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1dd539ad-2bc3-51c3-b190-bf5a9cdb4b0f', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_29', '21. Alimentos de origen animal', 'Algunas zoonosis pueden transmitirse por:

- carne insuficientemente cocida;
- leche no pasteurizada;
- huevos o alimentos contaminados;
- contaminación cruzada.

Prevención:

- cocción adecuada;
- refrigeración;
- higiene;
- separación de alimentos crudos y cocidos;
- control sanitario.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('14321662-a080-5b4e-9400-269f9c1f6267', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_30', '22. Agua y ambiente', 'Algunos agentes pueden llegar a:

- agua;
- suelo;
- alimentos;
- superficies.

La historia de exposición ambiental es clave.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('88498db5-00f5-5041-8b57-3a2ad55b3826', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_31', '23. Leptospirosis como ejemplo ecológico', 'Puede asociarse con contacto con agua o suelo contaminado por orina de animales infectados.

Factores de riesgo posibles:

- inundaciones;
- presencia de roedores;
- trabajo con animales;
- saneamiento deficiente.', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('79910abf-64ae-5d24-8612-220ef08f5995', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_32', 'Valor didáctico', 'Integra:
**animal + agua + ambiente + persona.**

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('635dc9ea-22a0-5f26-ae02-4b355dcc7e3e', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_33', '24. Influenza aviar zoonótica', 'Algunos virus de influenza animal pueden infectar humanos en determinadas circunstancias.

Exposiciones de mayor interés:

- aves enfermas;
- granjas;
- sacrificio;
- manipulación sin protección.

Prevención:

- bioseguridad;
- PPE;
- vigilancia;
- notificación;
- coordinación intersectorial.

---', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ae7dfd56-3605-56b4-9780-7bfdda7497f4', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_34', '25. Roedores', 'Pueden participar como:

- reservorios;
- fuentes de contaminación;
- huéspedes de vectores.

El riesgo puede aumentar con:

- basura;
- alimentos expuestos;
- viviendas deterioradas;
- inundaciones;
- saneamiento deficiente.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f10c8239-b75b-57fb-9e77-cad870ccd57e', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_35', '26. Animales domésticos', 'La convivencia puede ser beneficiosa, pero requiere:

- vacunación veterinaria;
- control de parásitos;
- higiene;
- atención de mordeduras;
- manejo seguro de excretas;
- supervisión de niños.', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('86812124-4b2e-53a2-83fc-31161b5600e4', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_36', 'Error', 'Promover abandono indiscriminado de animales por miedo a zoonosis.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b6dff32e-afe7-5c84-abdc-9c8590d433bb', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_37', '27. Ocupaciones de riesgo', 'Pueden incluir:

- veterinaria;
- agricultura;
- ganadería;
- mataderos;
- laboratorios;
- manejo de fauna;
- control de vectores;
- rescate animal.

Prevención:

- capacitación;
- PPE;
- vacunación cuando corresponda;
- protocolos de exposición;
- vigilancia.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('16310473-3af7-51ff-a574-9c6fe3ebda11', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_38', '28. Vigilancia epidemiológica', 'Debe detectar:

- casos;
- exposiciones;
- agrupamientos;
- cambios inusuales;
- vínculos con animales;
- vínculos ambientales.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aa8e2c3c-0bf3-5946-a04e-0b82c526abd7', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_39', '29. Vigilancia integrada', 'Una respuesta Una Salud puede integrar:

- salud humana;
- veterinaria;
- laboratorio;
- ambiente;
- agricultura;
- epidemiología.

Beneficios:

- detección temprana;
- investigación;
- prevención;
- respuesta coordinada.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('07f72469-857f-55f5-b076-9e0e8e516b54', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_40', '30. Panamá: vigilancia Una Salud 2025', 'En noviembre de 2025, MINSA realizó una jornada nacional de vigilancia basada en eventos y preparación comunitaria ante virus con potencial pandémico.

Participaron:

- MINSA;
- CSS;
- epidemiología;
- enfermería de epidemiología;
- PAI;
- MIDA/Salud Animal;
- MiAmbiente;
- OPS.

MINSA señaló explícitamente el enfoque **Una Salud**.

---', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5fb20965-f014-5e13-a3b2-54d44172bbea', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_41', '31. Panamá: biovigilancia 2026', 'En mayo de 2026 Panamá fue sede de una conferencia regional de biovigilancia.

MINSA destacó:

- cooperación;
- seguridad sanitaria;
- amenazas biológicas emergentes;
- integración de Una Salud;
- sistemas modernos de biovigilancia.

---', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('323b6ed8-0d96-5849-be77-05746516041c', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_42', '32. Prevención comunitaria', 'Puede incluir:

- agua segura;
- saneamiento;
- gestión de residuos;
- vacunación animal o humana cuando corresponda;
- control vectorial;
- inocuidad alimentaria;
- educación;
- manejo responsable de animales;
- vigilancia.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4c891222-d667-53f2-b65d-ffd8deb9b53b', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_43', '33. Rol de enfermería', 'Enfermería puede:

- identificar exposiciones;
- detectar signos y síntomas;
- educar;
- notificar según normativa;
- participar en vigilancia;
- coordinar referencia;
- promover vacunación;
- apoyar investigación de brotes;
- trabajar con la comunidad.

---', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('554a882a-a2ae-59b0-a1e3-c570094c921e', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_44', '34. Historia epidemiológica', 'Preguntar por:

- contacto con animales;
- mordeduras;
- ocupación;
- viajes;
- inundaciones;
- agua;
- alimentos;
- fauna silvestre;
- roedores;
- fecha de exposición;
- síntomas en otros humanos o animales.', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2f32af63-1cfd-5d71-b146-9e20c096d597', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_45', 'Clave', 'La exposición puede orientar la sospecha diagnóstica y la intervención.

---', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('488ec857-0981-582a-8124-1260bf47fb57', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_46', '35. Educación sin estigma', 'Evitar:

- culpar comunidades rurales;
- llamar “sucios” a propietarios;
- demonizar especies;
- promover sacrificio sin base sanitaria.

Comunicar:

- riesgo real;
- vías de transmisión;
- medidas concretas;
- signos de alarma;
- cuándo consultar.

---', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f903b68f-8434-5223-b31f-1493afbdcfd7', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_47', '36. Investigación de brotes', 'Pasos generales pueden incluir:

1. confirmar el evento;
2. definir casos;
3. describir tiempo, lugar y persona;
4. identificar exposiciones;
5. formular hipótesis;
6. coordinar laboratorio;
7. implementar medidas;
8. comunicar;
9. evaluar.

En zoonosis puede requerirse participación veterinaria y ambiental.

---', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3d5fd375-37ea-54f4-86fc-a245fd022261', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_48', '37. PAE / proceso comunitario', '', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('48f2e861-7e83-501d-8142-bd2423d4189a', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_49', 'Valoración', '- animales/reservorios;
- vectores;
- ambiente;
- exposiciones;
- población;
- casos;
- recursos.', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0e49a488-e8dc-5f8f-aa30-d4509387e10d', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_50', 'Priorización', '- exposición;
- riesgo zoonótico;
- saneamiento;
- bioseguridad.', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8ffc0d16-bc67-514c-8fee-b649e082ed16', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_51', 'Planificación', '- educación;
- vigilancia;
- control;
- coordinación.', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('585e03d9-e1ea-5a3b-acd6-1ab5728762c4', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_52', 'Implementación', '- medidas preventivas;
- referencia;
- notificación;
- intervención intersectorial.', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d196eb3d-37f5-5d22-8a3e-485effacf541', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_53', 'Evaluación', '- nuevos casos;
- exposiciones;
- cobertura;
- conocimiento;
- cumplimiento.

---', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('84dc8b85-0a33-5910-9c7c-80fec5724331', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_54', '38. Situaciones tipo examen', '', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('78bf2005-9b20-560d-a6c0-1da7a89d9051', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_55', 'Caso 1', 'Una comunidad deforesta una zona y aumenta el contacto con fauna.

**Interpretación:** el cambio de hábitat puede modificar el riesgo de transmisión zoonótica.', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('19a14326-bcea-5d8f-8907-df5601778b17', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_56', 'Caso 2', 'Una enfermera afirma que cualquier animal silvestre transmite enfermedad.

**Error:** el riesgo depende del agente y exposición específica.', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4fdb301b-f463-5bf3-9c8d-ebee1bf88245', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_57', 'Caso 3', 'Persona fue mordida por animal potencialmente rabioso.

**Prioridad:** lavado inmediato + evaluación urgente de profilaxis.', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0fb84a9a-7154-5908-9db5-4834ec4412da', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_58', 'Caso 4', 'Trabajador manipula aves enfermas sin protección.

**Riesgo:** exposición ocupacional zoonótica.', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('77063b90-9a74-54b4-9d0b-662b70ae968a', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_59', 'Caso 5', 'Familia consume leche no pasteurizada.

**Riesgo:** algunas zoonosis pueden transmitirse por alimentos.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d2380899-743b-5cdc-96d3-530f790e39bd', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_60', 'Caso 6', 'Después de inundación aparecen casos febriles en personas expuestas a agua con roedores.

**Considerar:** exposición ambiental zoonótica, incluida leptospirosis.', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ba3713f4-33b2-5857-b691-5903336b00c2', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_61', 'Caso 7', 'Programa vigila casos humanos pero nunca coordina con salud animal.

**Limitación:** vigilancia fragmentada.', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('daf3a7d5-6454-5151-a358-b2acf2d04ae0', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_62', 'Caso 8', 'Ciudad acumula basura y aumenta la población de roedores.

**Interpretación:** el ambiente construido modifica riesgos.', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5e2d2209-11a5-57e5-acbc-68b9855b7dd1', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_63', 'Caso 9', 'Cambios ambientales amplían distribución de un vector.

**Interpretación:** ecología y clima pueden influir en transmisión.', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7fa265af-52a9-5681-8477-af12a717d2b3', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_64', 'Caso 10', 'Comunidad quiere eliminar todos los perros después de un caso sospechoso.

**Respuesta:** medidas de control basadas en riesgo y autoridad sanitaria, no acciones indiscriminadas.', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ca0a15dc-ba12-558d-95e8-f065a4e3eab3', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_65', 'Caso 11', 'Enfermera pregunta por fiebre pero no por ocupación ni animales.

**Falta:** historia epidemiológica de exposición.', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cbc8e7ce-0b0c-5037-931f-5228d22eda89', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_66', 'Caso 12', 'MINSA, MIDA, MiAmbiente y vigilancia humana coordinan un evento.

**Interpretación:** enfoque Una Salud.

---', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f4d20870-88e4-53d0-9113-3ec97731c10e', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_67', '39. Errores frecuentes', '1. Confundir zoonosis con cualquier infección.
2. Confundir reservorio con vector.
3. Pensar que todo animal transmite enfermedad.
4. Reducir zoonosis a mordeduras.
5. Ignorar alimentos y agua.
6. Ignorar ocupación.
7. Ignorar cambios de uso del suelo.
8. Presentar clima como causa única.
9. Trabajar solo desde salud humana.
10. Estigmatizar animales o comunidades.
11. Retrasar evaluación de exposición a rabia.
12. No integrar vigilancia animal y ambiental.

---', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f180eedc-512d-5260-a096-dfa47facf9fb', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_68', '40. Qué memorizar', '**Zoonosis = infección transmisible naturalmente entre animales vertebrados y humanos.**

**Una Salud = personas + animales + plantas + ecosistemas.**

**Alteración de hábitat → cambia contacto entre especies y puede modificar riesgo.**

**Fragmentación + urbanización + agricultura + comercio animal + clima = factores ecológicos relevantes.**

**Reservorio ≠ vector.**

**Mordedura con riesgo de rabia → lavado + evaluación urgente.**

**Leptospirosis = ejemplo de animal + agua + ambiente + humano.**

**Vigilancia zoonótica = intersectorial.**

**Enfermería = historia de exposición + educación + vigilancia + referencia + notificación.**

---', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('572c2053-bb0e-54ad-9466-8e0b70fbe755', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_69', '41. Fuentes', '', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5ad2614a-0a40-53ea-bee5-f2f99b05a1bb', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_70', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8cc4e38c-8cea-5c8c-ba83-e147e1db3b3c', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_71', 'Bibliografía CICDE', '**Ríos González, C. M. (ed.). Salud pública: introducción y generalidades. Servilibro, 2022. ISBN 978-99925-16-26-3.**', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7c36bb9f-98c5-5302-8c5f-1a9912fd0760', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_72', 'Complementarias', '**World Health Organization. One Health / Una sola salud. Actualizado 8 de mayo de 2026.**

**World Health Organization. A health perspective on the role of the environment in One Health. 2022.**

**World Health Organization. Monitoring and evaluation for effective management of zoonotic diseases. 2025.**', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0973a2cf-c34a-5ff0-ac00-d27a6a06d964', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_73', 'Panamá', '**MINSA. Jornada Epidemiológica Nacional sobre Vigilancia Basada en Eventos y Preparación Comunitaria ante Virus con Potencial Pandémico. 24 de noviembre de 2025.**

**MINSA. Primera cumbre de biovigilancia fuera de EE. UU. coloca a Panamá en el centro de la seguridad sanitaria regional. 13 de mayo de 2026.**

---', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3343d16c-6900-59a6-908a-1bb4921eebf1', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_74', '42. Control de calidad', '- Alcance CICDE cubierto.
- `area_code` verificado contra CICDE_MASTER_SPEC: `PUBLIC_HEALTH`.
- Alteración del hábitat desarrollada.
- Integra Una Salud OMS 2026.
- Distingue reservorio, huésped y vector.
- Incorpora vigilancia y prevención.
- Incluye contexto Panamá 2025–2026.
- 12 casos originales.
- No incluye esquemas farmacológicos o dosis no validadas.

---', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('41466da8-7cb4-5dae-9e19-34c35aae5478', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_75', '43. Estado', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- revisión humana;
- enlazar normativa panameña específica cuando se desarrollen protocolos;
- validar profilaxis y esquemas nacionales antes de preguntas de dosis;
- enlazar PUBLIC-01, PUBLIC-03, PUBLIC-04 y PUBLIC-08.', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9137032f-f05b-573f-a9d9-cf56cca60ddb', '0eccfab6-0acf-5322-8274-a6a24050deb6', 'sec_76', 'Auditoría documental 2026-09-10', 'Se reconfirmó la actualización OMS de Una sola salud del 8 de mayo de 2026: alrededor del 60 % de las enfermedades infecciosas nuevas registradas globalmente proceden de animales. El módulo mantiene correctamente esa cifra limitada a enfermedades infecciosas nuevas/emergentes. También se verificaron las referencias panameñas de vigilancia 2025 y biovigilancia 2026. El contenido permanece en `REVIEW`.', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ff510191-f618-56a5-a0c3-1cfe4dee05e6', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_1', 'Urbanización y Salud', '**Área:** Salud Pública  
**Código:** PUBLIC-03  
**area_code:** `PUBLIC_HEALTH`  
**Estado académico:** `REVIEW`  
**Versión:** 1  
**Revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5c339f84-c207-55a6-a27d-9b05fa16268b', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_2', '1. Alcance oficial CICDE', 'El CICDE 2026 incluye:

**“Urbanización y Salud”.**

Subtemas expresos:

- Efectos de la urbanización en la salud pública (contaminación, acceso a servicios, espacios verdes).
- Importancia de educar a las comunidades sobre la relación entre ecología y salud.
- Ambientes donde se desarrolla el ser humano (vivienda, escuelas, comunidad).

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('04d7917a-2561-5cc4-9a0c-d893fe5171d3', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_3', '2. Objetivos', 'El estudiante debe poder:

1. Definir urbanización y salud urbana.
2. Reconocer beneficios y riesgos sanitarios de la urbanización.
3. Relacionar diseño urbano con enfermedades transmisibles y no transmisibles.
4. Explicar la relación entre contaminación, transporte y salud.
5. Reconocer la importancia de agua, saneamiento y gestión de residuos.
6. Explicar el papel protector de los espacios verdes.
7. Relacionar vivienda y hacinamiento con riesgo sanitario.
8. Reconocer escuelas y comunidades como entornos de promoción.
9. Identificar inequidades urbanas.
10. Reconocer el efecto de islas de calor y cambio climático.
11. Diseñar educación comunitaria básica sobre ecología y salud.
12. Aplicar intervenciones de enfermería en entornos urbanos.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('29a6a7a1-8227-53fa-a37a-0eb7487f7659', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_4', '3. Urbanización', 'La **urbanización** es el proceso por el cual aumenta la proporción de personas que viven en áreas urbanas y se transforman los asentamientos humanos.

Puede acompañarse de:

- crecimiento poblacional;
- expansión de vivienda;
- transporte;
- comercio;
- servicios;
- infraestructura;
- cambios de uso del suelo.', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f2d4c347-83c6-5b1b-9a44-44e2473612b9', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_5', 'Clave', 'Urbanización no es sinónimo de mala salud.

Los resultados dependen de cómo se planifiquen y distribuyan recursos, servicios y oportunidades.

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9ee4bc51-2615-5724-b0cf-298b6ae4d27b', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_6', '4. Salud urbana', 'La salud urbana estudia cómo las características de las ciudades afectan:

- salud física;
- salud mental;
- seguridad;
- exposición ambiental;
- acceso a servicios;
- conducta;
- equidad.

La OMS señala que más de la mitad de la población mundial vive en zonas urbanas y que esa proporción seguirá aumentando.

---', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('561f773e-e797-5a90-bf0b-e7c72064c650', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_7', '5. Beneficios potenciales de la urbanización', 'Una ciudad bien planificada puede facilitar:

- servicios de salud;
- educación;
- empleo;
- agua segura;
- saneamiento;
- transporte;
- actividad física;
- conectividad social;
- acceso a alimentos;
- respuesta a emergencias.', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e9292e69-8762-5078-9181-7690cf70e61e', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_8', 'Clave', 'El problema no es “la ciudad” en sí, sino la calidad del entorno urbano y la distribución de beneficios.

---', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eb44df6f-b7ae-5f46-86e4-8e8a849896be', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_9', '6. Riesgos de urbanización no planificada', 'Puede relacionarse con:

- hacinamiento;
- contaminación;
- asentamientos inseguros;
- déficit de saneamiento;
- residuos;
- tráfico;
- ruido;
- falta de áreas verdes;
- calor urbano;
- dificultad de acceso a servicios;
- violencia y lesiones.

---', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('51dc1b74-52a0-5b0c-befa-a0672305d1ed', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_10', '7. Triple carga sanitaria urbana', 'La OMS describe que las ciudades enfrentan simultáneamente:

- enfermedades transmisibles;
- enfermedades no transmisibles;
- lesiones y violencia.

Ejemplos:', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('80323bd0-428f-5600-9521-2f90931bc3be', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_11', 'Transmisibles', '- tuberculosis;
- dengue;
- diarreas;
- infecciones respiratorias.', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4c2e15dd-36e7-52f8-80a7-b10f49b96450', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_12', 'No transmisibles', '- cardiopatías;
- diabetes;
- asma;
- cáncer;
- problemas de salud mental.', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8e02c967-6e70-5813-b4f2-a77cc130559d', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_13', 'Lesiones', '- tránsito;
- violencia interpersonal;
- riesgos laborales.

---', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1ed65e2f-0427-50e7-a299-12b72077392f', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_14', '8. Contaminación del aire urbano', 'Fuentes:

- tráfico;
- industrias;
- combustión;
- construcción;
- quema de residuos;
- humo.

Puede contribuir a:

- enfermedad respiratoria;
- exacerbación de asma;
- enfermedad cardiovascular;
- mortalidad prematura.', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('46a4592a-fd56-5918-8ea7-5151992fb3b0', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_15', 'Enfermería', '- educación;
- identificación de grupos vulnerables;
- control de síntomas;
- promoción de políticas saludables.

---', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5740a366-b972-5bcb-90b0-ac6463a24dda', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_16', '9. Ruido', 'El ruido urbano puede provenir de:

- tránsito;
- industria;
- construcción;
- ocio.

Puede afectar:

- sueño;
- estrés;
- concentración;
- bienestar;
- riesgo cardiovascular en exposiciones crónicas.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('478442b3-6433-5b90-90fb-b82f8b7475b4', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_17', '10. Transporte y salud', 'Un sistema urbano mal diseñado puede aumentar:

- lesiones de tránsito;
- contaminación;
- ruido;
- sedentarismo;
- inequidad.

Un sistema más saludable puede favorecer:

- caminar;
- bicicleta;
- transporte público;
- seguridad vial;
- actividad física.

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5dafd639-99fc-5de8-b5a0-354e5ab9b6fd', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_18', '11. Caminabilidad', 'Un entorno caminable facilita:

- actividad física;
- interacción social;
- movilidad independiente;
- acceso a servicios.

Debe considerar:

- aceras;
- cruces seguros;
- iluminación;
- accesibilidad;
- sombra;
- seguridad.

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8f73c792-b3f9-5134-93a4-4a2d6df88c8c', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_19', '12. Islas de calor urbanas', 'Las áreas urbanas pueden retener más calor por:

- concreto;
- asfalto;
- baja cobertura vegetal;
- densidad edificada.

Esto aumenta riesgo durante olas de calor, especialmente para:

- personas mayores;
- niños;
- personas con enfermedad crónica;
- trabajadores al aire libre.

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('78819b74-34b4-5145-b9a2-4ad3dc6b246b', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_20', '13. Espacios verdes', 'La OMS reconoce beneficios asociados con espacios verdes:

- actividad física;
- relajación;
- salud mental;
- interacción social;
- reducción de exposición a algunos contaminantes;
- enfriamiento urbano.', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('19992767-a8bb-57c8-b1eb-5f8092fcc30f', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_21', 'Importante', 'La calidad, seguridad y accesibilidad del espacio importan tanto como su existencia.

---', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('acda8128-7b8e-5d1b-bbcd-0a05634c02ea', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_22', '14. Espacios azules', 'Ríos, lagos y otros espacios acuáticos urbanos pueden contribuir a:

- recreación;
- enfriamiento;
- bienestar.

Deben mantenerse seguros y sin contaminación.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1cefae4d-30d7-5311-9feb-e505d7c36bab', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_23', '15. Agua y saneamiento urbano', 'La urbanización puede superar la capacidad de:

- acueductos;
- alcantarillados;
- drenajes;
- recolección de residuos.

El déficit de servicios puede aumentar:

- enfermedades diarreicas;
- criaderos de vectores;
- exposición a aguas residuales.

---', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('539207e1-a1f2-57b3-9866-4d40b784abd0', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_24', '16. Gestión de residuos', 'La acumulación de residuos puede favorecer:

- roedores;
- mosquitos;
- contaminación;
- malos olores;
- lesiones;
- degradación de espacios públicos.

La solución requiere:

- recolección;
- disposición adecuada;
- educación;
- participación comunitaria;
- coordinación intersectorial.

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b18264ec-7af1-5659-bc7f-0e35060cf376', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_25', '17. Vivienda', 'La vivienda influye en:

- exposición a calor/frío;
- humedad;
- ventilación;
- seguridad;
- hacinamiento;
- vectores;
- salud mental.

La OMS reconoce la vivienda como determinante importante de salud.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3debcd77-ea04-5465-abb3-ce3d785c912a', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_26', '18. Hacinamiento', 'Puede facilitar:

- transmisión respiratoria;
- estrés;
- falta de privacidad;
- alteraciones del sueño;
- conflictos.', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1acfed3a-bdce-5390-9efe-a53af87f2838', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_27', 'Clave', 'El hacinamiento es un factor de riesgo social y ambiental, no una característica moral de las familias.

---', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('389f2207-0261-566f-baad-d7cbb66c6048', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_28', '19. Ventilación', 'Una ventilación adecuada ayuda a:

- mejorar calidad del aire interior;
- disminuir acumulación de contaminantes;
- reducir riesgo de transmisión aérea en determinados contextos.

Debe equilibrarse con:
- clima;
- seguridad;
- contaminación exterior;
- diseño.

---', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9ca06bd0-87ba-5083-8276-93cf031b2db1', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_29', '20. Escuelas como entorno de salud', 'La escuela influye en:

- aprendizaje;
- alimentación;
- actividad física;
- salud mental;
- prevención de violencia;
- higiene;
- vacunación y promoción.

Enfermería y salud pública pueden trabajar con:
- estudiantes;
- docentes;
- familias;
- autoridades.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9c2d1177-0424-5a9a-81f6-203b725e0b96', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_30', '21. Comunidad como entorno', 'La comunidad integra:

- vivienda;
- servicios;
- redes;
- espacios públicos;
- cultura;
- organizaciones.

La promoción funciona mejor cuando existe participación comunitaria y no únicamente instrucciones externas.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e40630f4-9c11-5d8d-9ded-a97959459d7c', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_31', '22. Acceso a servicios', 'La cercanía física no garantiza acceso.

Barreras:

- costo;
- horarios;
- transporte;
- idioma;
- discapacidad;
- documentación;
- estigma;
- saturación.', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9079e6bd-0d3e-55ef-934d-2bd058b92b51', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_32', 'Enfermería', 'Debe explorar barreras reales.

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9058aa73-c158-50dc-a28c-757698e91f9b', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_33', '23. Inequidades urbanas', 'Dentro de una misma ciudad pueden existir grandes diferencias en:

- esperanza de vida;
- exposición ambiental;
- acceso a agua;
- transporte;
- áreas verdes;
- servicios;
- seguridad.', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3f9811ed-c342-573d-8366-1a889a9f5f63', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_34', 'Clave', 'Promedio urbano ≠ experiencia de todos los barrios.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0b1f16c3-f4c2-5b25-9e12-ff26c4a1eec9', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_35', '24. Asentamientos informales', 'Pueden presentar:

- infraestructura limitada;
- riesgo de inundación o deslizamiento;
- inseguridad jurídica;
- acceso irregular a agua/saneamiento;
- hacinamiento.

La respuesta debe ser:
- respetuosa;
- intersectorial;
- sin estigma.

---', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d37606a9-5fc0-5917-8dbf-240bf4211b45', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_36', '25. Urbanización y vectores', 'La OMS señala que la urbanización puede facilitar transmisión vectorial cuando existen:

- almacenamiento de agua;
- residuos;
- criaderos;
- alta densidad poblacional;
- movilidad.

Dengue es un ejemplo de gran relevancia regional.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('93e2ce4c-3a7c-50a2-9b72-69c6ece2f06e', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_37', '26. Urbanización y tuberculosis', 'Factores que pueden favorecer transmisión:

- hacinamiento;
- mala ventilación;
- pobreza;
- demora diagnóstica;
- barreras de acceso.', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b0d777cc-3c2d-5956-914a-51b67ef09dc8', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_38', 'Importante', 'La urbanización por sí sola no causa tuberculosis.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('44943e9b-209d-5b71-a7cb-6046216a6eb8', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_39', '27. Urbanización y salud mental', 'Factores urbanos pueden influir en:

- estrés;
- aislamiento;
- ruido;
- inseguridad;
- violencia;
- vivienda;
- trabajo;
- acceso a naturaleza.

También las ciudades pueden ofrecer:
- redes;
- servicios;
- oportunidades;
- apoyo.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ac271432-4d7b-538d-89fb-a5be3143eb08', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_40', '28. Educación sobre ecología y salud', 'Debe conectar conductas cotidianas con salud:

- basura;
- agua;
- criaderos;
- humo;
- movilidad;
- áreas verdes;
- alimentos;
- energía.

Mensajes deben ser:

- claros;
- relevantes;
- accionables;
- culturalmente apropiados.

---', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6b3dc1f1-8f95-58db-929f-19e44278f6b0', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_41', '29. Participación comunitaria', 'Incluye:

- identificar problemas;
- priorizar;
- diseñar soluciones;
- ejecutar;
- evaluar.', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a41018aa-a094-53ce-82ba-c3c9519e09c6', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_42', 'Error', 'Llegar con una solución prediseñada sin escuchar a la comunidad.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('73ab9737-b8de-5919-a3eb-75b932f91a71', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_43', '30. Urbanismo saludable', 'Puede promover:

- transporte activo;
- aire limpio;
- espacios verdes;
- vivienda saludable;
- agua y saneamiento;
- seguridad vial;
- acceso a servicios;
- resiliencia climática.

La OMS impulsa integrar salud dentro de la planificación urbana.

---', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('24b20079-d120-5ec8-a4d7-291157f330af', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_44', '31. Enfermería en salud urbana', 'Puede participar en:

- diagnóstico comunitario;
- educación;
- vigilancia;
- visitas domiciliarias;
- prevención;
- programas escolares;
- identificación de vulnerabilidad;
- referencia;
- coordinación.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a8c4def3-192a-5eac-b0f6-d0e0d9332dcf', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_45', '32. PAE / proceso comunitario', '', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f44c3dfd-42fb-5eb4-a76e-a81669ca709c', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_46', 'Valoración', '- población;
- vivienda;
- servicios;
- ambiente;
- transporte;
- residuos;
- áreas verdes;
- indicadores.', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9875c457-5be6-5689-81c5-8d2f3aca6ff8', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_47', 'Priorización', '- magnitud;
- gravedad;
- vulnerabilidad;
- factibilidad.', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('11356af2-70e8-5bb5-839f-6a1fc176cfcb', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_48', 'Planificación', '- objetivos;
- acciones;
- actores;
- indicadores.', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c2d74712-d030-5350-984e-d42fe1dca822', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_49', 'Implementación', '- educación;
- visitas;
- campañas;
- coordinación;
- intervención ambiental.', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('decccae1-f4de-5b60-8b2a-95437339cbe9', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_50', 'Evaluación', '- cobertura;
- cambios ambientales;
- utilización de servicios;
- indicadores de salud.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fd495025-e441-513a-ab20-c8563d2deb7d', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_51', '33. Casos tipo examen', '', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b3aaa922-dca2-5884-882f-3a441a2e6e6b', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_52', 'Caso 1', 'Barrio tiene centro de salud cercano, pero el transporte y horarios impiden asistir.

**Interpretación:** disponibilidad no equivale a acceso efectivo.', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('285feffc-3b43-52ef-80d2-a32bcd7c5aef', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_53', 'Caso 2', 'Parque existe, pero carece de iluminación y la población evita usarlo.

**Clave:** accesibilidad y seguridad condicionan beneficio.', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bc848018-fab2-5e1b-a5dd-aa42e13f48a1', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_54', 'Caso 3', 'Zona densamente urbanizada presenta altas temperaturas y poca vegetación.

**Concepto:** isla de calor urbana.', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fc25beac-ecad-51c9-a220-9fb92fb56041', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_55', 'Caso 4', 'Familias almacenan agua por servicio intermitente y aparecen criaderos.

**Riesgo:** urbanización + almacenamiento + vectores.', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7ca2fd38-2155-5293-9db5-66f5e04a0726', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_56', 'Caso 5', 'Se culpa a residentes de asentamiento por enfermedades.

**Error:** estigma; deben analizarse determinantes estructurales.', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d57f0823-b09c-5b36-8885-d1374c6c007d', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_57', 'Caso 6', 'Ciudad diseña ciclovías y cruces seguros.

**Beneficio:** transporte activo y prevención de lesiones.', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b9d3251b-ac1e-5e6a-8c87-61441450ec9b', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_58', 'Caso 7', 'Escuela tiene mala ventilación y hacinamiento.

**Riesgo:** mayor transmisión de infecciones respiratorias.', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8454edb5-624a-54c8-9e8c-94934e2ba7d9', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_59', 'Caso 8', 'Barrio acumula residuos junto a viviendas.

**Intervención:** coordinación de saneamiento + educación + gestión de residuos.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4dc98850-2a17-59a2-8df9-6fa817e89a4a', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_60', 'Caso 9', 'Comunidad solicita árboles y sombra en rutas peatonales.

**Interpretación:** intervención urbana con beneficios ambientales y de salud.', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a678eb0c-d6e2-5c7e-84f0-e67dcf5ff099', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_61', 'Caso 10', 'Programa educativo explica relación entre basura, criaderos y dengue.

**Tipo:** educación comunitaria ecología-salud.', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3badb7ff-2265-5514-a43b-19ab1d57276d', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_62', 'Caso 11', 'Enfermera usa solo el promedio municipal para evaluar una barriada vulnerable.

**Problema:** puede ocultar inequidades locales.', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('04ef9b1f-4058-5cce-9004-445a299057f9', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_63', 'Caso 12', 'Plan urbano integra salud, transporte, vivienda y ambiente.

**Interpretación:** enfoque intersectorial de salud urbana.

---', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('433bf1df-3448-51d7-a4f1-7d8bf8e849c4', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_64', '34. Errores frecuentes', '1. Decir urbanización = enfermedad.
2. Confundir presencia de servicio con acceso.
3. Ignorar inequidades entre barrios.
4. Pensar que parques siempre son accesibles.
5. Ignorar seguridad y discapacidad.
6. Culpar a comunidades.
7. Reducir salud urbana a contaminación.
8. Ignorar transporte y lesiones.
9. Ignorar vivienda y hacinamiento.
10. Ignorar salud mental.
11. Educar sin participación.
12. Excluir planificación urbana del trabajo en salud pública.

---', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('90c8cb66-f250-5c84-844e-1d6925a4d353', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_65', '35. Qué memorizar', '**Urbanización puede producir beneficios o riesgos según planificación y equidad.**

**Salud urbana = ambiente + vivienda + transporte + servicios + seguridad + equidad.**

**Contaminación, hacinamiento, residuos y saneamiento deficiente aumentan riesgos.**

**Espacios verdes favorecen actividad física, bienestar, interacción y enfriamiento.**

**Acceso ≠ cercanía física solamente.**

**Escuela, vivienda y comunidad son ambientes de salud.**

**Enfermería participa en educación + vigilancia + diagnóstico comunitario + coordinación.**

---', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f9afacd8-3438-511a-a0d8-645bb533ce52', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_66', '36. Fuentes', '', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d3c01eee-d9ff-525f-8df3-ff194df9b2fd', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_67', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f8bcfc54-d535-5f06-9ffc-ba182090fb58', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_68', 'Complementarias', '**World Health Organization. Urban health. 19 de marzo de 2025.**

**World Health Organization. Green spaces: sectoral solutions for air pollution and health. 4 de septiembre de 2025.**

**World Health Organization. WHO Housing and health guidelines. 2018.**

**World Health Organization. Urban Health Initiative.**

---', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f5ded174-c4d7-5060-8352-88298b6d4d65', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_69', '37. Control de calidad', '- Los tres subtemas expresos de CICDE están cubiertos.
- Se conserva `area_code = PUBLIC_HEALTH`.
- Integra contaminación, acceso a servicios y espacios verdes.
- Incluye vivienda, escuelas y comunidad.
- Incluye equidad y participación comunitaria.
- 12 casos originales.
- Estado `REVIEW`.

---', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8291f05e-85d2-573c-b6b5-271709a492f7', '11597845-086e-5ecf-98ca-a3c952827eee', 'sec_70', '38. Estado', 'Antes de `VERIFIED`:

- revisión humana;
- vincular normativa urbana/sanitaria panameña cuando sea necesaria;
- verificar indicadores locales antes de incorporar cifras nacionales o municipales;
- enlazar PUBLIC-01, PUBLIC-04, PUBLIC-08, PUBLIC-09.', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dc74f508-133c-5578-9d1b-03a7edaa7ada', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_1', 'Riesgos para la salud del individuo y el medio ambiente', '**Área:** Salud Pública  
**Código:** PUBLIC-04  
**area_code:** `PUBLIC_HEALTH`  
**Estado académico:** `REVIEW`  
**Versión:** 1  
**Revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('212d9985-8bd0-5aea-af0f-ad3fae0ab571', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_2', '1. Alcance oficial CICDE', 'El CICDE 2026 incluye:

**“Riesgos para la salud del individuo y el medio ambiente”.**

Subtemas:

- Calidad del agua (diferentes tipos de agua).
- Calidad de la vivienda.
- Calidad de los alimentos (toda la cadena de producción).
- Disposición de excretas, control de artrópodos y roedores.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0f128d3d-9214-5e6c-b7fd-68c92699e5eb', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_3', '2. Objetivos', 'El estudiante debe poder:

1. Explicar qué significa agua segura para consumo humano.
2. Diferenciar fuentes de agua y riesgos sanitarios generales.
3. Reconocer amenazas microbiológicas, químicas y físicas del agua.
4. Identificar componentes de una vivienda saludable.
5. Relacionar hacinamiento, ventilación y temperatura con salud.
6. Explicar la inocuidad alimentaria desde producción hasta consumo.
7. Aplicar principios para prevenir contaminación cruzada.
8. Reconocer la importancia de disposición segura de excretas.
9. Diferenciar artrópodos vectores de roedores.
10. Identificar medidas ambientales para control integrado.
11. Reconocer situaciones que requieren intervención sanitaria.
12. Aplicar educación y vigilancia de enfermería.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f2d3bd43-ed9a-50b8-8a28-63856703a091', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_4', '3. Calidad del agua', 'El agua destinada al consumo debe ser:

- suficiente;
- accesible;
- aceptable;
- disponible;
- segura.

La seguridad se relaciona con evitar niveles peligrosos de:

- microorganismos;
- sustancias químicas;
- contaminantes físicos.', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1b4dfea1-b680-5c81-9bfc-f426072c6959', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_5', 'Clave', 'Agua clara, sin olor o sin sabor extraño **no garantiza** inocuidad.

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d5e0823a-c11d-5c7c-a14f-6752ea9177f0', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_6', '4. Tipos de agua — clasificación práctica', 'Según origen puede hablarse de:

- agua superficial;
- agua subterránea;
- agua de lluvia;
- agua de red;
- agua embotellada;
- agua almacenada.', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('95a1f4a6-410e-5dd7-b1a2-56c55e367b12', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_7', 'Importante', 'La clasificación exacta puede variar según normas y textos.

El riesgo depende de:
- fuente;
- tratamiento;
- almacenamiento;
- distribución.

---', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8145fba9-0871-59f5-a89d-d2e81995aefb', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_8', '5. Agua superficial', 'Incluye:

- ríos;
- lagos;
- embalses.

Puede contaminarse por:

- excretas;
- escorrentía;
- agricultura;
- industria;
- basura;
- animales.

Generalmente requiere tratamiento antes de consumo.

---', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('30200458-d290-51b6-823e-bcda8c16bff9', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_9', '6. Agua subterránea', 'Proviene de:

- pozos;
- acuíferos.

Puede parecer limpia pero contaminarse por:

- infiltración fecal;
- nitratos;
- metales;
- productos químicos;
- actividades agrícolas/industriales.

---', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('711b68b5-4f36-51f4-9a89-35fc82c490e3', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_10', '7. Agua de lluvia', 'Puede utilizarse en determinados contextos, pero la calidad depende de:

- superficie de captación;
- contaminación atmosférica;
- almacenamiento;
- mantenimiento;
- tratamiento.

No debe asumirse potable automáticamente.

---', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('328854e2-fb25-5a0e-81c0-0597b03e82d9', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_11', '8. Agua almacenada', 'El almacenamiento inadecuado puede producir:

- recontaminación;
- proliferación de microorganismos;
- criaderos de mosquitos.

Buenas prácticas:

- recipiente limpio;
- tapa;
- extracción higiénica;
- limpieza periódica;
- evitar acumulación innecesaria.

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('754fd47f-6acf-58f6-a4c0-b7f2a8ca4782', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_12', '9. Riesgos microbiológicos del agua', 'Pueden incluir:

- bacterias;
- virus;
- parásitos.

El agua y saneamiento inseguros pueden favorecer enfermedades diarreicas y otras infecciones.

La OMS publicó en 2025 una síntesis de patógenos importantes relacionados con agua potable y saneamiento.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bbaa08e1-dfec-5500-b35a-8a8e6ec6adf9', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_13', '10. Riesgos químicos', 'Pueden incluir:

- metales;
- pesticidas;
- nitratos;
- contaminantes industriales;
- otros compuestos.', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2050464e-ead7-55a6-a020-901689b46b84', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_14', 'Importante', 'Hervir agua puede ayudar frente a determinados riesgos microbiológicos, pero **no elimina necesariamente contaminantes químicos**.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('38f80b24-1222-5bba-b2e3-9c1c03de6535', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_15', '11. Agua segura en emergencias', 'Después de:

- inundaciones;
- fallas de red;
- contaminación;
- desastres;

debe seguirse la instrucción de la autoridad sanitaria.', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7c9e8ff0-b0a1-56e0-a518-dcdc59a3310c', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_16', 'Panamá, ejemplo 2025', 'Ante una situación de calidad de agua en Herrera, MINSA indicó medidas específicas, incluyendo hervir el agua que llegaba a hogares antes de beber, cocinar o cepillarse los dientes, además de habilitar fuentes aprobadas y mantener vigilancia.', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ce5b885d-8494-53e3-9938-a561d525a60f', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_17', 'Clave', 'La recomendación de tratamiento doméstico debe basarse en el evento y la autoridad correspondiente.

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('086180bb-3d5b-5f93-a0b0-df9ecfcd58cd', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_18', '12. Saneamiento y WASH', '**WASH** integra:

- agua;
- saneamiento;
- higiene.

OPS destaca que los sistemas seguros de agua y saneamiento son fundamentales para prevenir enfermedades y responder a emergencias.

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8f865582-1f38-5bc4-a020-27cf7125cfdc', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_19', '13. Calidad de la vivienda', 'Una vivienda saludable debe favorecer:

- seguridad estructural;
- espacio suficiente;
- ventilación;
- temperatura adecuada;
- agua;
- saneamiento;
- accesibilidad;
- control de plagas;
- protección frente a riesgos.

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4afa1980-41f9-529b-9930-39cf8f2a86d8', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_20', '14. Hacinamiento', 'Puede asociarse con:

- transmisión respiratoria;
- estrés;
- falta de privacidad;
- problemas de sueño;
- conflictos.

Debe analizarse como condición social y ambiental.

---', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('617c91e2-b7f3-5da2-961e-47d244cc7e8e', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_21', '15. Temperatura de la vivienda', 'Temperaturas interiores extremas pueden afectar:

- personas mayores;
- niños;
- personas con enfermedades crónicas.

La vivienda debe proteger frente a:
- calor;
- frío;
- humedad;
- eventos climáticos.

---', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c1c7d4aa-db1a-5b08-9ead-1d008afd2110', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_22', '16. Humedad y moho', 'Pueden asociarse con:

- irritación;
- alergias;
- síntomas respiratorios;
- exacerbación de asma.

Intervenciones:

- controlar filtraciones;
- ventilación;
- reparar humedad;
- manejo seguro del moho.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b50f8963-572e-5007-b950-929c3ee9f0f9', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_23', '17. Riesgos de lesiones en vivienda', 'Ejemplos:

- escaleras inseguras;
- cables;
- pisos irregulares;
- mala iluminación;
- fuego;
- objetos sueltos.

Especial atención a:
- personas mayores;
- niños;
- personas con discapacidad.

---', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('25e19c6e-8084-5ec8-a408-74fffe618e36', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_24', '18. Accesibilidad', 'La vivienda debe permitir el mayor grado posible de:

- movilidad;
- independencia;
- seguridad.

Puede requerir:
- barandas;
- rampas;
- iluminación;
- baño accesible;
- eliminación de obstáculos.

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('29de99d7-5b87-5265-9fd9-df2d477e5dcf', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_25', '19. Inocuidad de los alimentos', 'La OMS señala que los alimentos contaminados por microorganismos o sustancias químicas pueden causar más de 200 enfermedades.

La inocuidad debe protegerse a lo largo de toda la cadena:

- producción;
- procesamiento;
- transporte;
- almacenamiento;
- preparación;
- venta;
- consumo.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('783af5cb-ba2d-59e1-a707-ff3ac0839d9d', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_26', '20. Cadena de producción', 'Los peligros pueden introducirse en cualquier etapa.

Ejemplos:', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('00888d50-309f-53ae-ab4d-7397553094c8', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_27', 'Producción primaria', '- agua contaminada;
- animales enfermos;
- agroquímicos mal utilizados.', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8d6eab4c-1859-5f0c-9398-f8a43526201f', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_28', 'Procesamiento', '- fallas de higiene;
- contaminación cruzada.', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2dfb5fc2-26e3-589f-bb68-41e3ec2599ab', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_29', 'Transporte', '- ruptura de temperatura;
- recipientes contaminados.', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ce65703a-140f-5912-a1c9-1ef4339728ba', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_30', 'Venta/preparación', '- mala higiene;
- conservación incorrecta.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('94770cfd-f7b4-5dbb-8b74-9514b37fb850', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_31', '21. Contaminación biológica', 'Puede involucrar:

- bacterias;
- virus;
- parásitos.

Factores de riesgo:

- manos contaminadas;
- alimentos crudos;
- superficies;
- agua insegura;
- temperaturas inadecuadas.

---', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('95919e7c-5885-5e9a-af05-f8ea7a074fdb', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_32', '22. Contaminación química', 'Puede originarse por:

- pesticidas;
- productos de limpieza;
- metales;
- sustancias tóxicas;
- almacenamiento incorrecto.', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fcdcb0bb-31aa-5b74-a38f-797cee2b88e8', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_33', 'Regla', 'Productos químicos nunca deben almacenarse en envases de bebidas o alimentos.

---', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8b66fa0b-f752-532a-9965-bf931d277534', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_34', '23. Contaminación física', 'Ejemplos:

- vidrio;
- metal;
- piedras;
- fragmentos de materiales.

La inspección y buenas prácticas ayudan a reducir estos riesgos.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4dc70075-9f4a-55cf-b289-af08a7f058d3', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_35', '24. Contaminación cruzada', 'Ocurre cuando contaminantes pasan de:

- alimento crudo a cocido;
- manos a alimento;
- superficie contaminada a alimento;
- utensilios a alimento.

Prevención:

- separar crudos/cocidos;
- lavado de manos;
- limpiar utensilios;
- almacenamiento adecuado.

---', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('97bfd879-aa61-5df6-8c7b-fb3bc25db77a', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_36', '25. Cinco claves para alimentos más seguros', 'La OMS promueve cinco principios generales:

1. Mantener limpieza.
2. Separar alimentos crudos y cocidos.
3. Cocinar completamente.
4. Mantener alimentos a temperaturas seguras.
5. Usar agua y materias primas seguras.', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('202f1bba-6134-5706-ad21-d2aca0020331', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_37', 'Clave', 'Son principios educativos generales; las temperaturas exactas dependen del alimento y normativa aplicable.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5d46aa29-a341-526a-b6a1-5af09b5852fa', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_38', '26. Higiene de manos en manipuladores', 'Debe realizarse especialmente:

- antes de preparar alimentos;
- después de ir al baño;
- después de tocar residuos;
- después de manipular alimento crudo;
- después de contaminación de manos.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('842ba579-2060-509b-8d98-eed483330e38', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_39', '27. Panamá: vigilancia de alimentos 2026', 'MINSA mantiene inspecciones sanitarias de establecimientos y manipuladores.

El **30 de julio de 2026**, la **Dirección Nacional de Control de Alimentos y Vigilancia Veterinaria (DINACAV)** en Veraguas informó operativos durante las Fiestas Patronales de Santiago en el Mercado Público, supermercados, restaurantes e hielerías.

Durante las inspecciones se reforzaron:

- cadena de frío;
- disposición y almacenamiento correctos de productos;
- prevención de contaminación cruzada;
- condiciones higiénicas en preparación y expendio;
- vigencia de los carnés exigidos a manipuladores.', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0de966cf-08ec-563d-acd1-e67c49a0b34f', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_40', 'Corrección de precisión', 'La fuente oficial atribuye este operativo a **DINACAV**, no a “Saneamiento Ambiental de Veraguas”.

---', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d3a06757-b9ce-550d-b990-0a83928e1880', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_41', '28. Disposición de excretas', 'Una disposición segura evita que las heces contaminen:

- agua;
- suelo;
- alimentos;
- manos;
- superficies.

Sistemas posibles dependen del contexto:

- alcantarillado;
- tanque séptico;
- letrina sanitaria;
- otros sistemas aprobados.', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2d03cdfb-e38d-5fc7-b6f4-9a2f00dd6e1b', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_42', 'Clave', 'La prioridad es cortar la vía fecal-oral.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d5c15add-9df5-50b6-928c-cf6f5358a917', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_43', '29. Riesgos por disposición inadecuada', 'Puede favorecer:

- diarreas;
- parasitosis;
- contaminación de agua;
- proliferación de insectos;
- degradación ambiental.

---', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8e74d0a5-37ce-548d-b26b-b0c65cc20ad3', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_44', '30. Artrópodos de importancia sanitaria', 'Incluyen:

- mosquitos;
- moscas;
- pulgas;
- garrapatas;
- otros según región.

Pueden actuar como:

- vectores biológicos;
- vectores mecánicos;
- plagas.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ff4ef320-634f-5878-b6ee-35f621a37eb8', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_45', '31. Aedes', 'Puede transmitir:

- dengue;
- Zika;
- chikunguña;
- fiebre amarilla en determinados contextos epidemiológicos.

Control:

- eliminar criaderos;
- tapar recipientes;
- limpiar;
- vigilancia;
- medidas químicas cuando sean indicadas por programas.

---', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8adbcbdf-7a52-5b16-a774-b53b91cde8ee', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_46', '32. Control integrado de vectores', 'Debe combinar estrategias:

- manejo ambiental;
- vigilancia;
- educación;
- control físico;
- control químico cuando corresponda;
- participación comunitaria.', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3231e384-99a5-525e-bdcb-174cd3a8babc', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_47', 'Error', 'Confiar únicamente en fumigación.

---', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7418ebb5-c2bd-5e51-bdd6-92db14a973d5', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_48', '33. Roedores', 'Pueden:

- contaminar alimentos;
- dañar viviendas;
- actuar como reservorios;
- contribuir a transmisión de enfermedades.

Factores favorecedores:

- basura;
- alimentos expuestos;
- maleza;
- refugios;
- grietas;
- acumulación.

---', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d5dc96b8-f559-50a0-82da-6f50e1295170', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_49', '34. Control de roedores', 'Medidas:

- eliminar alimento y refugio;
- almacenar residuos;
- sellar entradas;
- limpiar entorno;
- vigilancia;
- control profesional cuando se requiera.', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('64f8fcbd-7e53-50cd-b5d9-85715240f3cb', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_50', 'Seguridad', 'Los rodenticidas deben manejarse de acuerdo con productos y autoridades competentes para evitar intoxicaciones humanas, animales y ambientales.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('62e907ff-8a7e-5012-912e-aecd5b4bf7e6', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_51', '35. Panamá: control de roedores 2026', 'MINSA ha realizado durante 2026 operativos de:

- inspección;
- desratización;
- eliminación de criaderos;
- educación comunitaria;
- coordinación con autoridades de aseo.

En marzo de 2026, Panamá Este reforzó control tras casos de dengue y hantavirus, incluyendo orientación sobre almacenamiento de agua, roedores y criaderos.

---', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('20fd5a46-e935-570c-9b50-a96ce3c00f14', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_52', '36. Participación comunitaria', 'Las medidas ambientales requieren colaboración:

- hogares;
- escuelas;
- comercios;
- municipios;
- servicios de agua;
- recolección de residuos;
- salud.', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('77a1355c-f83d-5201-8aac-9f5bd77aa28f', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_53', 'Clave', 'El control sostenible no depende únicamente del personal sanitario.

---', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5598f8b6-0907-562d-b0e3-6042a5d16f32', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_54', '37. Rol de enfermería', 'Enfermería puede:

- valorar condiciones de vivienda;
- preguntar fuente de agua;
- educar en almacenamiento seguro;
- identificar riesgos alimentarios;
- detectar brotes;
- participar en vigilancia;
- educar sobre excretas;
- promover control de vectores/roedores;
- coordinar referencia sanitaria.

---', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('71cddc4e-a51f-5718-8924-28cb81066f05', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_55', '38. Visita domiciliaria', 'Permite observar:

- almacenamiento de agua;
- disposición de residuos;
- presencia de criaderos;
- hacinamiento;
- ventilación;
- seguridad;
- alimentos;
- excretas;
- roedores.

Debe realizarse:
- con respeto;
- sin culpabilizar;
- protegiendo privacidad.

---', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('996694de-e673-589c-a9cd-36d602c32f79', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_56', '39. PAE / proceso comunitario', '', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('23850677-9229-5c3e-98a9-2f24976a9e0a', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_57', 'Valoración', '- agua;
- vivienda;
- alimentos;
- excretas;
- vectores;
- roedores;
- vulnerabilidad.', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('23abe550-e02b-5cd7-b469-263880eb241e', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_58', 'Priorización', '- riesgo inmediato;
- magnitud;
- exposición;
- gravedad.', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('76aad390-088b-50d1-81f7-0952c7a782a1', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_59', 'Planificación', '- educación;
- control ambiental;
- vigilancia;
- coordinación.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0fcebf7e-659c-5c01-bcf3-c2b73770dcb1', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_60', 'Implementación', '- visitas;
- campañas;
- inspección;
- referencia;
- participación comunitaria.', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2404c6e5-f8b8-5aad-9c3c-70018ca29712', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_61', 'Evaluación', '- criaderos;
- calidad sanitaria;
- conocimiento;
- exposición;
- casos.

---', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cb51b098-655a-5554-995a-4958156fb3f7', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_62', '40. Casos tipo examen', '', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7cee3518-c574-569d-88dc-3af4a65f2c9e', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_63', 'Caso 1', 'Agua de pozo luce cristalina.

**Respuesta:** apariencia no asegura inocuidad; debe evaluarse la fuente y calidad.', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bfe02057-01ac-5495-9524-fb4831bb34cd', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_64', 'Caso 2', 'Familia hierve agua con contaminación química conocida.

**Problema:** hervir no necesariamente elimina contaminantes químicos.', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('714910cb-23e0-5540-83b8-f2ab08006cf3', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_65', 'Caso 3', 'Recipiente de agua permanece destapado.

**Riesgo:** recontaminación y criaderos.', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4978e4c3-5696-55af-b797-2077a85bea21', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_66', 'Caso 4', 'Vivienda presenta humedad persistente y moho.

**Intervención:** corregir fuente de humedad y valorar síntomas respiratorios.', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a1779dae-ee94-5103-8014-330afc7497a1', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_67', 'Caso 5', 'Adulto mayor vive con escaleras oscuras y sin baranda.

**Riesgo:** lesiones/caídas.', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2787e290-23c5-5bd3-9091-d41653fcf3c7', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_68', 'Caso 6', 'Tabla usada para pollo crudo se usa para ensalada sin lavar.

**Concepto:** contaminación cruzada.', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('47f9f716-6774-5328-a2d0-aeed8a684663', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_69', 'Caso 7', 'Vendedor mantiene alimentos expuestos a insectos y polvo.

**Problema:** riesgo de contaminación e incumplimiento de buenas prácticas.', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fc4e2420-bc39-5cf9-88eb-164a1afde826', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_70', 'Caso 8', 'Comunidad elimina excretas cerca de fuente de agua.

**Riesgo:** contaminación fecal y transmisión.', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a451ffb9-5ca7-5b3c-8795-cf330b683753', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_71', 'Caso 9', 'Vecinos dependen exclusivamente de fumigación para dengue.

**Error:** control efectivo incluye eliminación de criaderos y participación.', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e6855371-06ad-54e1-871c-99228d96164e', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_72', 'Caso 10', 'Basura y alimentos abiertos atraen roedores.

**Intervención:** manejo ambiental y residuos antes/además del control directo.', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('87863a81-bf78-5340-9a1f-87fe48e248be', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_73', 'Caso 11', 'Niño encuentra rodenticida accesible.

**Prioridad:** riesgo de intoxicación; asegurar productos y solicitar atención si hubo exposición.', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e771dbba-c6ed-523e-bbf6-548cf1345d85', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_74', 'Caso 12', 'Enfermera visita hogar y culpa a la familia por condiciones estructurales de pobreza.

**Error:** intervención debe ser respetuosa y considerar determinantes sociales.

---', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('370ec64c-ab53-55c5-94fc-83c972b4da05', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_75', '41. Errores frecuentes', '1. Suponer que agua clara es potable.
2. Pensar que hervir elimina todos los contaminantes.
3. Ignorar almacenamiento del agua.
4. Reducir vivienda saludable a limpieza.
5. Ignorar accesibilidad y lesiones.
6. Pensar que inocuidad solo depende del consumidor.
7. Ignorar cadena productiva.
8. Confundir contaminación cruzada con alimento “dañado”.
9. Manejar excretas sin considerar fuente de agua.
10. Confiar solo en fumigación.
11. Usar rodenticidas sin seguridad.
12. Culpar a familias por determinantes estructurales.

---', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5f510667-1aed-5a88-b5d0-5c828a094e85', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_76', '42. Qué memorizar', '**Agua segura = calidad + tratamiento + distribución + almacenamiento.**

**Agua clara ≠ agua segura.**

**Hervir ayuda frente a ciertos riesgos microbiológicos, no garantiza eliminar químicos.**

**Vivienda saludable = espacio + ventilación + temperatura + seguridad + accesibilidad + saneamiento.**

**Inocuidad alimentaria = de producción a consumo.**

**5 claves OMS: limpiar + separar + cocinar + temperatura segura + agua/materias primas seguras.**

**Excretas seguras → cortar vía fecal-oral.**

**Vectores: control integrado, no solo fumigación.**

**Roedores: eliminar alimento/refugio + sellado + residuos + vigilancia.**

---', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4308dca8-743c-5a7d-935f-1c5ca3cadc9a', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_77', '43. Fuentes', '', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9c61adf9-6b6b-52f9-ad9a-80f38a5a8a38', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_78', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c638484c-3dfc-508b-9bed-6a34538937d0', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_79', 'Complementarias', '**WHO. State of systems for drinking-water, sanitation and hygiene: global update 2025. Publicado 26 de enero de 2026.**

**OPS. Agua, Saneamiento e Higiene (WASH).**

**WHO. Housing and health guidelines. 2018.**

**WHO. Inocuidad de los alimentos. Actualización 2026.**

**WHO. Five Keys to Safer Food.**

**WHO. Keeping the vector out: housing improvements for vector control and sustainable development.**', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fc6812d1-5e1c-5a63-9a10-55bd889c670a', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_80', 'Panamá', '**MINSA Herrera. Medidas sanitarias ante situación del agua potable. 13 de junio de 2025.**

**MINSA Panamá Este. Medidas de control y prevención en comunidades ante dengue y hantavirus. 21 de marzo de 2026.**

**MINSA. Dirección Nacional de Control de Alimentos y Vigilancia Veterinaria realiza operativos por Fiestas Patronales de Santiago 2026. 30 de julio de 2026.**

**MINSA. Acciones de control de roedores en San Miguelito, 2026.**

---', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('674d724d-b041-5840-957e-e0cf2b2bade8', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_81', '44. Control de calidad', '- Cubre los cuatro subtemas exactos de CICDE.
- `area_code = PUBLIC_HEALTH`.
- Incluye agua, vivienda, alimentos, excretas, artrópodos y roedores.
- Incluye WASH.
- Incluye inocuidad alimentaria de cadena completa.
- Incluye contexto oficial Panamá 2025–2026.
- 12 casos originales.
- No inventa concentraciones, dosis ni tiempos universales de desinfección.

---', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6602f282-5cea-51f8-bc23-ae85b43a4d29', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_82', '45. Estado', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- revisión humana;
- vincular normas nacionales específicas de agua, alimentos, saneamiento y control de plagas;
- confirmar procedimientos operativos locales antes de convertirlos en preguntas de protocolo;
- enlazar PUBLIC-01, PUBLIC-02, PUBLIC-03 y PUBLIC-08.', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e34e92ea-8eb4-5692-93ae-1b5c7b90b381', '1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'sec_83', 'Auditoría documental 2026-09-10', 'Se reconfirmaron GLAAS 2025 (OMS/UNICEF, publicado 26 de enero de 2026), la ficha OMS de inocuidad de alimentos del 4 de junio de 2026, el operativo de Panamá Este del 21 de marzo de 2026, el operativo de alimentos en Santiago del 30 de julio de 2026 y las acciones de control de roedores en Belisario Frías del 30 de enero de 2026. Se corrigió la institución ejecutora del operativo de alimentos de Santiago a DINACAV. El contenido permanece en `REVIEW`.', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('126fefc5-1806-58f9-bac7-66a4f3fc6deb', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_1', 'Políticas de Salud Pública globales', '**Área:** Salud Pública  
**Código:** PUBLIC-05  
**area_code:** `PUBLIC_HEALTH`  
**Estado académico:** `REVIEW`  
**Versión:** 1  
**Revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9b22036a-0a45-54c6-ba61-e6d9a685d3b4', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_2', '1. Alcance oficial CICDE', 'El CICDE 2026 incluye expresamente:

**“Políticas de Salud Pública globales”.**

Como el lineamiento no desglosa subtemas, este módulo desarrolla marcos globales centrales y actuales, sin asumir que todos tienen el mismo valor jurídico.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('91e0cd18-35bc-5605-8c9a-07593860ad0a', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_3', '2. Objetivos', 'El estudiante debe poder:

1. Definir política de salud pública.
2. Diferenciar política, estrategia, programa y norma.
3. Reconocer el papel de OMS y Asamblea Mundial de la Salud.
4. Relacionar derecho a la salud, ODS y equidad.
5. Explicar cobertura sanitaria universal y APS.
6. Comprender Salud en Todas las Políticas.
7. Reconocer el Reglamento Sanitario Internacional (RSI).
8. Identificar las enmiendas del RSI vigentes desde 2025.
9. Reconocer el Acuerdo de la OMS sobre Pandemias adoptado en 2025.
10. Diferenciar adopción internacional de ratificación nacional.
11. Reconocer la relación entre políticas globales y políticas nacionales.
12. Aplicar estos marcos al rol de enfermería.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3c434322-8f45-5a09-8310-470158773e29', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_4', '3. Política, estrategia, programa y norma', '', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6d09b678-f4d8-5538-89e8-5e67755b7660', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_5', 'Política', 'Define dirección, prioridades y objetivos generales.', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('868eac86-1f9c-5cd5-afa4-83ec50fb1453', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_6', 'Estrategia', 'Organiza el enfoque para alcanzar esos objetivos.', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('05ecf41e-691a-5cdd-9d8b-6ed412f1315e', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_7', 'Programa', 'Agrupa actividades concretas dirigidas a un problema o población.', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('892a705e-1378-5210-9474-6054403c9238', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_8', 'Ley o reglamento', 'Establece obligaciones jurídicas dentro de su ámbito.', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0f368fae-b499-5533-9297-45817006f524', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_9', 'Clave', 'No son conceptos equivalentes.

---', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6f716042-6f2f-5e18-a957-613dc1935d53', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_10', '4. Gobernanza global en salud', 'La cooperación internacional es necesaria porque:

- enfermedades y riesgos cruzan fronteras;
- viajes y comercio conectan poblaciones;
- existen amenazas ambientales transnacionales;
- las emergencias requieren coordinación;
- hay desigualdades de recursos y capacidades.

Participan gobiernos, OMS, OPS, Naciones Unidas, sociedad civil, academia y comunidades.

---', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8103cfdd-3caf-5b9c-bbb2-85f3c7b73e5a', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_11', '5. Organización Mundial de la Salud', 'La OMS es el organismo especializado de Naciones Unidas para la salud.

Funciones generales:

- coordinación internacional;
- normas y estándares;
- orientación técnica;
- vigilancia y análisis;
- apoyo a Estados;
- respuesta a emergencias.

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f112c1de-99ac-5c27-94de-7628ce60cfc6', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_12', '6. Asamblea Mundial de la Salud', 'Es el principal órgano decisorio de la OMS.

Los Estados Miembros participan en decisiones sobre resoluciones, estrategias, presupuesto, prioridades e instrumentos internacionales de salud.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8c6cc3d7-0dc2-5928-b879-b7aa4a2c46ee', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_13', '7. Derecho a la salud', 'La Constitución de la OMS reconoce el disfrute del grado máximo de salud que se pueda lograr como un derecho fundamental.

Un enfoque de derechos exige considerar disponibilidad, accesibilidad, aceptabilidad, calidad, no discriminación, participación y rendición de cuentas.

---', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0ad622cc-2d59-5b30-b810-788edfae5e9e', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_14', '8. Objetivos de Desarrollo Sostenible', 'La Agenda 2030 incluye 17 ODS.

El **ODS 3** busca garantizar una vida sana y promover el bienestar para todas las edades.

Otros ODS también afectan salud: pobreza, hambre, educación, género, agua y saneamiento, trabajo, ciudades y clima.', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('86704eee-8f23-56ae-bb56-f5fafac5b824', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_15', 'Clave', 'La salud es intersectorial.

---', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('16a153ea-82fa-5a41-9bf2-c42bd45afca3', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_16', '9. Cobertura Sanitaria Universal', 'La OMS define la cobertura sanitaria universal como acceso a servicios de calidad necesarios sin dificultades financieras.

Incluye promoción, prevención, tratamiento, rehabilitación y cuidados paliativos.

La OMS informó en diciembre de 2025 que el mundo no está avanzando al ritmo necesario para alcanzar este objetivo.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5082a8d1-72c2-5d67-8d3c-abde05089e9b', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_17', '10. Protección financiera', 'Cobertura universal no significa solamente disponer de hospitales.

También requiere reducir gasto catastrófico, empobrecimiento por atención y barreras económicas.', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7ffd8249-1b24-5b0f-aa12-571908b03f88', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_18', 'Clave', '**Disponibilidad ≠ acceso efectivo ≠ utilización ≠ protección financiera.**

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5d80127d-7894-5205-a6ab-d1809a650867', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_19', '11. Atención Primaria de Salud', 'La APS orienta los sistemas hacia atención integral, promoción, prevención, comunidad, participación, continuidad y acción intersectorial.

Es una vía fundamental hacia la salud universal.

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('29993d84-4d6b-54cb-94d4-b317f8b87431', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_20', '12. Alma-Ata y Astaná', '', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cfb8ea5b-a0c6-5366-be8e-e8c63eccc536', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_21', 'Alma-Ata, 1978', 'Consolidó la APS como estrategia central para Salud para Todos.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b06617c6-bcf6-5b0a-8f48-5b5b9f2d66ac', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_22', 'Astaná, 2018', 'Reafirmó el compromiso político con APS y sistemas centrados en las personas.', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8bf7366f-8deb-5f11-ae73-2936eafabf9b', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_23', 'Importante', 'Astaná no anuló Alma-Ata; la reafirmó en un contexto contemporáneo.

---', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('43c1e78b-591b-5a26-941b-5c254bb4d565', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_24', '13. Salud en Todas las Políticas', 'Este enfoque reconoce que decisiones fuera del sector salud pueden modificar fuertemente la salud.

Sectores relevantes incluyen transporte, educación, vivienda, agricultura, ambiente, trabajo y economía.

Ejemplo: una política de transporte afecta lesiones, contaminación, actividad física y acceso a servicios.

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c447301e-66a2-5ada-b837-216f66668ff2', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_25', '14. Equidad en salud', 'La equidad busca reducir diferencias injustas y evitables.

Puede requerir mayor apoyo a poblaciones vulnerables, accesibilidad, adaptación cultural y distribución diferencial de recursos.', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9042e2be-d23f-5d07-935e-ba3a7a0a8e21', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_26', 'Clave', 'Equidad no significa dar exactamente lo mismo a todos.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('28ecc277-94d4-5f49-bff0-703778812fca', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_27', '15. Reglamento Sanitario Internacional', 'El **RSI/IHR** es un instrumento jurídico internacional que orienta la prevención y respuesta ante riesgos de salud pública con potencial de propagación internacional.

La OMS informa que cubre a **196 Estados Partes**, incluidos los Estados Miembros de la OMS.

---', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3203be01-5742-5947-a9f2-6d4c7f117947', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_28', '16. Funciones del RSI', 'Incluye obligaciones y capacidades relacionadas con vigilancia, evaluación, notificación, respuesta, puntos de entrada y comunicación.

No se limita únicamente a pandemias.

---', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c0edf922-ad73-5db9-a222-13735aa054d3', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_29', '17. Enmiendas del RSI de 2024', 'La Asamblea Mundial de la Salud adoptó en 2024 enmiendas al RSI.

La OMS informó que entraron en vigor el **19 de septiembre de 2025** conforme al procedimiento aplicable.

Entre los cambios se incorporó el concepto de **emergencia pandémica** y un mayor énfasis en solidaridad y equidad.', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bd66390c-ca7d-598a-a063-92b433d33e51', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_30', 'Precaución', 'Para una cuestión jurídica concreta debe verificarse siempre el texto vigente aplicable al Estado.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bf7e5c34-7738-5b8d-a238-e74c059e9ce6', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_31', '18. Acuerdo de la OMS sobre Pandemias', 'El **20 de mayo de 2025**, la 78.ª Asamblea Mundial de la Salud adoptó el **Acuerdo de la OMS sobre Pandemias**.

Busca fortalecer prevención, preparación, respuesta, equidad y cooperación internacional.

---', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3847e21b-f2a9-57c5-8aca-e5a8ca987496', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_32', '19. Adopción, PABS y ratificación', 'La adopción del Acuerdo en mayo de 2025 **no equivale a ratificación nacional ni a entrada en vigor automática**.

La resolución WHA78.1 estableció un Grupo de Trabajo Intergubernamental para negociar el anexo sobre el **Sistema de Acceso a Patógenos y Participación en los Beneficios (PABS)**.', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7616ddb0-034f-5b22-964b-396e6e562364', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_33', 'Estado al 10 de septiembre de 2026', '- En mayo de 2026, la 79.ª Asamblea Mundial de la Salud decidió continuar las negociaciones del anexo PABS.
- En julio de 2026, la OMS informó que las negociaciones seguían abiertas.
- La octava reunión estaba programada para **14–18 de septiembre de 2026**, por lo que al cierre de esta auditoría todavía no había ocurrido.
- La OMS señala que el anexo PABS debe finalizarse antes de que el Acuerdo pueda abrirse a firma y ratificación.', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2334ffc2-434a-55c3-9e67-c08544f2bad3', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_34', 'Clave', '**Acuerdo adoptado ≠ Acuerdo ya ratificado o vigente.**
A 10 de septiembre de 2026, el trabajo del anexo PABS seguía en curso.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8cd30d12-e4cc-59a1-890c-cca2fbc636c1', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_35', '20. Seguridad sanitaria global', 'Busca fortalecer capacidades para detectar, evaluar, notificar, contener y responder.

Debe equilibrarse con derechos, proporcionalidad, equidad y transparencia.

---', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('677e9276-59c8-5881-ad1b-4c0c64b31f83', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_36', '21. Vigilancia como política global', 'La cooperación requiere sistemas nacionales de vigilancia, laboratorios, epidemiología, notificación, interoperabilidad y personal capacitado.

Enfermería puede participar en detección, reporte, educación, vacunación y respuesta comunitaria.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('675c9043-99e9-5519-a649-389df4b5606e', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_37', '22. Vacunación y políticas globales', 'Los marcos internacionales promueven acceso equitativo, cobertura, seguridad, vigilancia y confianza pública.', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c7c5872a-f0f1-5bc1-b04d-97756eb207ff', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_38', 'Precaución', 'Los esquemas concretos son nacionales y pueden cambiar.

Para Panamá debe usarse el esquema nacional vigente.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5f1593aa-0bfd-5e32-a38c-2e415fee8c0e', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_39', '23. Resistencia antimicrobiana', 'Requiere políticas sobre vigilancia, prevención de infecciones, uso racional, laboratorio, salud humana, salud animal y ambiente.

Es un problema claramente relacionado con Una Salud.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e9586e0c-cd82-5b1f-ad3f-e751f479f53e', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_40', '24. Enfermedades no transmisibles', 'Las políticas globales buscan disminuir factores como tabaco, alimentación poco saludable, inactividad física, consumo nocivo de alcohol y contaminación del aire.

Requieren educación, regulación y entornos saludables.

---', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0a5b6d24-da6b-5ea1-8d63-9550b0166fd1', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_41', '25. Salud mental', 'Los marcos contemporáneos promueven servicios comunitarios, derechos humanos, integración en APS, reducción del estigma, acceso y prevención.

---', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9136a234-b225-5500-a448-6e186ff7ab28', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_42', '26. Cambio climático y salud', 'Las políticas de salud deben considerar calor, eventos extremos, vectores, agua, alimentos, contaminación y desplazamiento.

Se requieren adaptación, resiliencia y vigilancia.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aa509313-1c13-5c63-bdbc-303517310314', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_43', '27. Política basada en evidencia', 'Debe utilizar vigilancia, investigación, indicadores, evaluación, evidencia científica y participación social.', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a4e7e4a0-78c3-5db5-bc21-97c6b0cdc417', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_44', 'Error', 'Aprobar políticas sin evaluar problema, impacto y factibilidad.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dcad0c9c-ae3e-5a00-840d-85b3b3001b5a', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_45', '28. Evaluación de políticas', 'Puede valorar cobertura, equidad, efectividad, eficiencia, calidad, impacto y sostenibilidad.', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('96440dba-7b4d-55dd-839d-adacd55b03e6', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_46', 'Clave', 'Una política aprobada no necesariamente está implementada con éxito.

---', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8855dd14-f940-57ba-a1d2-57fccaeefb97', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_47', '29. Panamá y marcos globales', 'Los marcos globales pueden orientar planes nacionales, vigilancia, vacunación, preparación ante emergencias, promoción y regulación.', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('945ae2b4-cf0a-5758-ac57-7d611279405f', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_48', 'Precaución', 'No toda recomendación internacional se convierte automáticamente en norma panameña.

---', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8ee08e38-7744-5dcd-869c-636476757107', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_49', '30. Rol de enfermería', 'Enfermería puede contribuir a implementación, vigilancia, educación, promoción, prevención, evaluación, generación de datos, defensa de derechos y acción intersectorial.

---', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('300bf2a0-6462-5884-bd07-c80bcc305f26', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_50', '31. Casos tipo examen', '1. País con hospitales, pero familias se empobrecen al pagar atención. **Clave:** protección financiera.
2. Municipio cambia transporte para reducir contaminación y lesiones. **Clave:** Salud en Todas las Políticas.
3. Evento con riesgo de propagación internacional. **Marco:** RSI.
4. Se afirma que RSI solo aplica a pandemias. **Error:** cubre riesgos internacionales más amplios.
5. Se afirma que un acuerdo adoptado ya fue ratificado por todos. **Error:** adopción ≠ ratificación.
6. Salud universal se limita a hospitales. **Error:** faltan promoción, prevención y protección financiera.
7. Recursos adicionales para población con mayores barreras. **Principio:** equidad.
8. Vigilancia modifica una política. **Principio:** evidencia.
9. Enfermera activa notificación. **Rol:** implementación de seguridad sanitaria.
10. País adapta recomendación OMS a su contexto. **Clave:** orientación global, implementación nacional.
11. Política climática favorece movilidad activa. **Clave:** cobeneficio sanitario.
12. Plan pandémico prioriza acceso equitativo a insumos. **Principio:** equidad.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a723f81e-f29e-5baa-a6ba-9abfc7417d2b', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_51', '32. Errores frecuentes', '1. Confundir política y programa.
2. Confundir recomendación con ley.
3. Pensar que OMS gobierna directamente los sistemas nacionales.
4. Creer que cobertura universal significa todo gratis.
5. Ignorar protección financiera.
6. Reducir APS a primer nivel.
7. Pensar que salud depende solo del sector sanitario.
8. Confundir adopción con ratificación.
9. Pensar que RSI solo aplica a pandemias.
10. Ignorar equidad.
11. Presentar política aprobada como logro ya alcanzado.
12. Usar una recomendación global como si fuera automáticamente norma panameña.

---', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e517c55d-9438-56a3-bb63-8fd83768bee0', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_52', '33. Qué memorizar', '**ODS 3 = salud y bienestar.**

**Cobertura universal = servicios necesarios + calidad + protección financiera.**

**APS = integralidad + comunidad + prevención + participación.**

**Salud en Todas las Políticas = sectores no sanitarios también determinan salud.**

**RSI = instrumento internacional para riesgos de salud pública transfronterizos.**

**Enmiendas RSI 2024 → vigencia desde 19 septiembre 2025 según procedimiento aplicable.**

**Acuerdo OMS sobre Pandemias → adoptado 20 mayo 2025.**

**Adopción ≠ ratificación automática.**

---', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e34f4612-e5a3-516f-9433-8c86a4dff477', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_53', '34. Fuentes', '', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cc271e02-4dd8-5e3a-a801-522266d38fca', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_54', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7ebf9ea4-41bc-5903-bdb1-f9b7717381c2', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_55', 'Complementarias', '- World Health Organization. Universal health coverage (UHC). 5 diciembre 2025.
- World Health Organization. International Health Regulations.
- World Health Organization. Amended International Health Regulations enter into force. 19 septiembre 2025.
- World Health Organization. WHO Pandemic Agreement. 20 mayo 2025.
- World Health Organization. Seventy-ninth World Health Assembly – Daily update: 19 May 2026.
- World Health Organization. WHO Member States continue negotiations on the Pathogen Access and Benefit Sharing Annex. 20 julio 2026.
- World Health Organization. Primary health care.
- United Nations. Sustainable Development Goal 3.
- Pan American Health Organization. Health in All Policies.

---', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9d82eb95-fffa-5eda-b6cc-e96ceb8a007b', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_56', '35. Control de calidad', '- Alcance CICDE cubierto.
- Distingue instrumentos políticos y jurídicos.
- Integra ODS, UHC, APS, Salud en Todas las Políticas, RSI y Acuerdo sobre Pandemias.
- RSI actualizado a enmiendas vigentes desde 2025.
- Acuerdo sobre Pandemias actualizado a adopción de 2025.
- Distingue adopción de ratificación.
- Distingue política global de norma nacional.
- Incluye 12 casos originales.
- Estado `REVIEW`.

---', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c1b806ab-85f1-5176-8063-af10445e4c3c', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_57', '36. Estado', 'Antes de `VERIFIED`:

- revisión humana;
- comprobar cambios posteriores en RSI/Acuerdo sobre Pandemias;
- verificar cualquier afirmación jurídica específica para Panamá con fuente nacional;
- enlazar PUBLIC-06, PUBLIC-07 y PUBLIC-08.', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fe3161af-de35-5b06-9822-91741d92e415', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_58', 'Precisión RSI 2026', 'La OMS informó que 11 de los 196 Estados Partes rechazaron las enmiendas de 2024; por ello, no deben presentarse como aplicables de manera idéntica a todos los Estados Partes.', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5220d7d4-5c20-50f7-bd79-e8f29c74028b', '522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'sec_59', 'Auditoría documental 2026-09-10', 'Se confirmó el estado actualizado del RSI y del Acuerdo de la OMS sobre Pandemias. Las enmiendas del RSI de 2024 entraron en vigor el 19 de septiembre de 2025 para los Estados a los que resultan aplicables; la OMS informó que 11 Estados Partes las rechazaron. El Acuerdo sobre Pandemias fue adoptado en mayo de 2025, pero el anexo PABS seguía en negociación en julio de 2026 y la octava reunión estaba prevista para 14–18 de septiembre de 2026. PUBLIC-05 debe volver a comprobarse después del 18 de septiembre antes de considerarlo cerrado. Permanece en `REVIEW`.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('faddba7f-7a44-5925-8e66-62ef22ac50f3', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_1', 'Las funciones esenciales de salud pública', '**Área:** Salud Pública  
**Código:** PUBLIC-06  
**area_code:** `PUBLIC_HEALTH`  
**Estado académico:** `REVIEW`  
**Versión:** 1  
**Revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d0aa46ca-0cfc-5c5a-b02f-468e444194ce', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_2', '1. Alcance oficial CICDE', 'El CICDE 2026 incluye expresamente:

**“Las funciones esenciales de salud pública”.**

Para la Región de las Américas se utiliza el marco renovado de la **Organización Panamericana de la Salud (OPS)**, que define **11 Funciones Esenciales de Salud Pública (FESP)**.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8e597074-293e-5885-b413-02097fa87886', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_3', '2. ¿Qué son las FESP?', 'Las FESP son capacidades de las autoridades de salud, en todos los niveles y junto con la sociedad civil, necesarias para:

- fortalecer sistemas de salud;
- proteger el derecho a la salud;
- actuar sobre riesgos;
- abordar determinantes sociales;
- garantizar acceso a intervenciones y servicios.', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aa0ef0f7-6b05-53f1-a402-888bb8170a75', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_4', 'Clave', 'No son 11 programas aislados.

Son capacidades que forman un ciclo integrado de políticas de salud pública.

---', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('21630f7e-b143-571c-a2c7-0b6c5ac690c4', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_5', '3. Marco renovado OPS', 'El marco renovado incorpora cuatro pilares transversales:

- derechos humanos;
- determinantes sociales de la salud;
- acceso integral a intervenciones y servicios;
- rectoría colaborativa e intersectorial.

También aumenta la importancia de la participación social y la equidad.

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('edbd3f38-f43c-5d04-a3d9-dc9e63edf5d5', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_6', '4. Cuatro etapas del ciclo de políticas', 'Las FESP se articulan alrededor de cuatro etapas:

1. **Evaluación**
2. **Desarrollo de políticas**
3. **Asignación de recursos**
4. **Acceso**', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a0486fee-5b7d-5286-81af-d92f7a82a542', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_7', 'Clave', 'Las funciones están conectadas; un mismo problema puede activar varias simultáneamente.

---', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2f44ceac-c809-5862-8f1e-38fd50411c11', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_8', '5. FESP 1 — Monitoreo y evaluación', '**Monitoreo y evaluación de la salud y el bienestar, la equidad, los determinantes sociales de la salud y el desempeño e impacto de los sistemas de salud.**

Incluye:

- indicadores;
- tendencias;
- inequidades;
- análisis de datos;
- evaluación de desempeño;
- uso de información para decisiones.', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('99aeb976-e37b-5daf-a9f6-562b97b87010', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_9', 'Ejemplo', 'Comparar mortalidad, cobertura y barreras entre regiones.

---', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eeb0b6cb-68ed-5ac0-9369-b02ec762df82', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_10', '6. FESP 1 — Rol de enfermería', 'Enfermería contribuye mediante:

- registros completos;
- calidad de datos;
- seguimiento;
- indicadores;
- identificación de brechas;
- documentación útil para planificación.', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('964f76cb-f592-52d8-9df2-4b58b24c92c7', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_11', 'Error', 'Pensar que documentar no tiene impacto en salud pública.

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6cfb0278-daae-54fc-882a-5777fe9a9a48', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_12', '7. FESP 2 — Vigilancia, riesgos y emergencias', '**La vigilancia en la salud pública: el control y la gestión de los riesgos para la salud y las emergencias.**

Incluye:

- detección;
- notificación;
- investigación;
- análisis;
- control;
- preparación;
- respuesta.

Ejemplos:
- brotes;
- epidemias;
- desastres;
- amenazas ambientales.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('429ee1cb-976f-5915-a57e-57a72a67501f', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_13', '8. FESP 2 — Rol de enfermería', 'Puede incluir:

- identificar casos sospechosos;
- notificar;
- recolectar datos;
- participar en investigaciones;
- educación comunitaria;
- vacunación;
- respuesta a emergencias.

---', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bcd59d9c-83e8-570f-94f9-87e321d63250', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_14', '9. FESP 3 — Investigación y conocimiento', '**Promoción y gestión de la investigación y el conocimiento en el ámbito de la salud.**

Incluye:

- producir evidencia;
- identificar brechas;
- transferir conocimiento;
- innovación;
- evaluación de intervenciones;
- uso de resultados de investigación.', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fee04e42-44a1-55fb-8275-a78d6251d073', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_15', 'Clave', 'Investigación también significa aplicar evidencia para mejorar decisiones.

---', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('94ce2b81-7814-5515-bb07-ba8791d93ad6', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_16', '10. FESP 3 — Enfermería', 'Puede:

- formular preguntas;
- participar en estudios;
- recopilar datos;
- aplicar evidencia;
- evaluar prácticas;
- compartir resultados.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('284ba789-a2b1-578b-a00d-dfacde6a01f1', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_17', '11. FESP 4 — Políticas y legislación', '**Formulación e implementación de políticas de salud y promoción de legislación que proteja la salud de la población.**

Incluye:

- análisis de problemas;
- diseño;
- regulación;
- implementación;
- evaluación;
- protección de derechos.

Ejemplos:
- tabaco;
- vacunación;
- agua;
- alimentos;
- seguridad ocupacional.

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a9afa792-6a86-5bc6-899c-637d927bee09', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_18', '12. FESP 4 — Rectoría', 'La autoridad sanitaria debe poder:

- orientar;
- regular;
- coordinar;
- supervisar;
- evaluar;
- rendir cuentas.', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5d990eb9-fd0e-5ea4-a72a-e18123f8f78a', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_19', 'Clave', 'Rectoría no significa que el Estado deba prestar directamente cada servicio.

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6ebef8f2-9e6d-534f-b93e-f7cd9e2d2a02', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_20', '13. FESP 5 — Participación y movilización social', '**Participación y movilización social, inclusión de actores estratégicos y transparencia.**

Incluye:

- comunidades;
- organizaciones;
- actores sociales;
- comunicación;
- transparencia;
- rendición de cuentas.', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('26521ea1-71d7-5353-97d9-8fc3487e9593', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_21', 'Clave', 'La comunidad no debe ser una receptora pasiva.

---', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('87023790-ddf0-5d89-b465-5e542e38eafc', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_22', '14. FESP 5 — Ejemplo', 'En una comunidad con dengue, la población participa en:

- identificar criaderos;
- priorizar problemas;
- ejecutar acciones;
- vigilar resultados.

Eso es más completo que entregar folletos sin participación.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('356f43fc-6338-5e35-865d-382f1713cc59', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_23', '15. FESP 6 — Recursos humanos', '**Desarrollo de recursos humanos para la salud.**

Incluye:

- formación;
- empleo;
- distribución;
- condiciones laborales;
- competencias;
- educación continua;
- regulación profesional.', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2a14eb06-1bd0-59a5-a1ff-249b04a1e2be', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_24', 'Enfermería', 'La disponibilidad y competencia del personal forman parte de la capacidad de salud pública.

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7621acc7-6cce-53f0-b1ca-81ba3096c6e0', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_25', '16. FESP 6 — Distribución del personal', 'No basta con conocer el total nacional.

Debe analizarse:

- distribución geográfica;
- ruralidad;
- necesidades;
- carga de trabajo;
- competencias;
- retención.', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('202af0c9-6c0a-5b67-8888-40da080799bc', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_26', 'Clave', 'Cantidad total ≠ acceso equitativo.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aec7f034-fa12-5b1e-b154-b23dedae2dc0', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_27', '17. FESP 7 — Medicamentos y tecnologías', '**Asegurar el acceso y el uso racional de medicamentos y otras tecnologías sanitarias esenciales de calidad, seguras y eficaces.**

Incluye:

- regulación;
- calidad;
- seguridad;
- eficacia;
- selección;
- evaluación;
- uso racional;
- acceso.', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8ee6b045-90ad-5bd6-a058-1b1af73baf16', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_28', 'Clave', 'No se limita a medicamentos; incluye otras tecnologías sanitarias.

---', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('039426f4-4bb8-5a74-a85c-19fafe6de568', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_29', '18. FESP 7 — Enfermería', 'Puede contribuir mediante:

- administración segura;
- farmacovigilancia;
- educación;
- reporte de eventos;
- uso racional;
- gestión de suministros;
- identificación de barreras.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c59845b6-ab7f-5a88-ad09-598e40a7306a', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_30', '19. FESP 8 — Financiamiento', '**Financiamiento de la salud eficiente y equitativo.**

Busca:

- movilizar recursos;
- asignarlos según necesidades;
- mejorar eficiencia;
- proteger financieramente a la población;
- disminuir inequidades.', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1a82c07e-0fb9-53f1-89b8-ede4fb09c5cb', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_31', 'Clave', 'Más gasto por sí solo no garantiza mejores resultados.

---', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e5ee595d-365b-54c6-9d82-dd16dd63398d', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_32', '20. FESP 8 — Equidad', 'Una distribución idéntica puede ser inequitativa si las necesidades son diferentes.

La equidad puede requerir mayor inversión en:

- áreas rurales;
- poblaciones vulnerables;
- territorios con menor acceso.

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e558b290-ed55-5540-bdd2-adf60a782a33', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_33', '21. FESP 9 — Acceso a servicios integrales', '**Acceso equitativo a servicios de salud integrales y de calidad.**

Incluye:

- promoción;
- prevención;
- diagnóstico;
- tratamiento;
- rehabilitación;
- cuidados paliativos;
- continuidad.

---', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d42bb06b-e182-51c9-8423-48ba9256f40c', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_34', '22. FESP 9 — Barreras', 'Pueden ser:

- geográficas;
- económicas;
- culturales;
- lingüísticas;
- administrativas;
- discapacidad;
- horarios;
- estigma.', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('619104ff-8bf3-50fd-b5f2-9b5994c90ea0', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_35', 'Enfermería', 'Puede identificar barreras y facilitar continuidad y referencia.

---', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9c6769c5-881a-575b-a6bd-9db2fba343b9', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_36', '23. FESP 10 — Promoción y reducción de riesgos', '**Acceso equitativo a intervenciones que buscan promover la salud, reducir factores de riesgo y favorecer comportamientos saludables.**

Incluye:

- promoción;
- prevención;
- entornos saludables;
- educación;
- políticas poblacionales;
- reducción de exposición.

Ejemplos:
- actividad física;
- control de tabaco;
- alimentación saludable;
- vacunación;
- seguridad vial.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a633bc11-8381-5219-a69a-27384edd8242', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_37', '24. FESP 10 — Más allá de las charlas', 'Promoción no significa solo educación.

También puede modificar:

- entornos;
- normas;
- disponibilidad;
- políticas;
- condiciones sociales.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4f751f80-a975-5cf8-9158-ac90953cc7c1', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_38', '25. FESP 11 — Determinantes sociales', '**Gestión y promoción de las intervenciones sobre los determinantes sociales de la salud.**

Incluye factores estructurales como:

- pobreza;
- educación;
- vivienda;
- trabajo;
- transporte;
- ambiente;
- protección social.

Muchos están fuera del control directo del sector salud.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('35e7820b-9bfa-5652-ac36-5796d5641fde', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_39', '26. FESP 11 — Acción intersectorial', 'Puede requerir coordinación con:

- educación;
- vivienda;
- ambiente;
- municipios;
- trabajo;
- agricultura;
- transporte;
- protección social.', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cd756dd0-b718-55f1-8e4a-3f78285adce3', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_40', 'Clave', 'Muchos determinantes no se modifican desde un hospital solamente.

---', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5683b534-5d9a-52a2-8089-5e0a29bb44be', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_41', '27. Las 11 FESP integradas', 'Ejemplo: dengue.

- **FESP 1:** medir casos, distribución y brechas.
- **FESP 2:** vigilar y responder.
- **FESP 3:** usar evidencia.
- **FESP 4:** aplicar políticas.
- **FESP 5:** movilizar comunidad.
- **FESP 6:** disponer personal.
- **FESP 7:** contar con tecnologías e insumos.
- **FESP 8:** financiar acciones.
- **FESP 9:** asegurar atención.
- **FESP 10:** reducir criaderos y riesgos.
- **FESP 11:** intervenir agua, vivienda y saneamiento.', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fe5066e0-458a-5011-89a3-b8d00fa197cf', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_42', 'Clave', 'Un problema real rara vez corresponde a una sola FESP.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('480db39f-ebb7-5b1a-a438-228392f61b68', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_43', '28. FESP y Atención Primaria de Salud', 'Las FESP complementan la APS mediante:

- vigilancia;
- promoción;
- prevención;
- participación;
- acceso;
- equidad;
- trabajo territorial.

---', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c2251f5b-5834-588e-a2c1-f708f4871370', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_44', '29. FESP y salud universal', 'La OPS presenta las FESP como capacidades necesarias para:

- sistemas sólidos;
- salud universal;
- resiliencia;
- respuesta a epidemias;
- reducción de barreras.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f7a61609-525a-55fd-9b60-5c5dcda1e648', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_45', '30. FESP y derechos humanos', 'El marco renovado incorpora:

- no discriminación;
- participación;
- accesibilidad;
- calidad;
- rendición de cuentas.

---', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5fb418a0-ad81-56c6-ad6e-cbec4d366046', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_46', '31. FESP y equidad', 'Cada función debe preguntar:

- ¿quién tiene peor salud?
- ¿quién enfrenta barreras?
- ¿quién está excluido?
- ¿cómo se distribuyen los recursos?', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e7b651c0-e4b5-59c8-92fa-8607a235b96b', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_47', 'Error', 'Usar solo promedios y ocultar desigualdades.

---', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eba7d44e-53e9-5462-adb3-2e6ee5fead6b', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_48', '32. FESP y determinantes sociales', 'El marco renovado da mayor importancia a:

- condiciones estructurales;
- desigualdad;
- acción intersectorial;
- determinantes sociales.

Esto supera una visión limitada a control de enfermedades.

---', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('12d764f2-b9b6-5f08-8092-1debf259205b', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_49', '33. Evaluación de capacidades', 'Evaluar FESP permite:

- identificar brechas;
- priorizar;
- planificar mejoras;
- monitorear avances;
- fortalecer instituciones.', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5bba94ab-a6a3-5528-b7a8-44b5b923477f', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_50', 'Clave', 'No es un ejercicio puramente administrativo.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a21214c9-90fd-5b61-b51c-e6973216b50d', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_51', '34. Actualización regional 2025', 'En abril de 2025, OPS presentó un informe sobre implementación de FESP en las Américas.

El análisis se basó en evaluaciones realizadas entre 2021 y 2023 en 14 países.

Reafirmó la necesidad de fortalecer capacidades para:

- resiliencia;
- equidad;
- salud universal;
- desafíos sanitarios futuros.

---', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('14316cb4-91b7-5e23-a669-774144929565', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_52', '35. RedFESP 2026', 'La **RedFESP** fue constituida formalmente en 2025.

En febrero de 2026 puso en marcha un eje estratégico dirigido a:

- institucionalizar evaluación;
- promover mejora continua;
- fortalecer capacidades en niveles nacional y subnacional.

Participaron representantes de varios países, incluido **Panamá**.', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ae45259f-e8ab-5349-9770-2969c4db0be8', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_53', 'Clave', 'El marco de FESP sigue activo en la cooperación regional contemporánea.

---', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cc823204-16c2-5db6-bdee-9a996e9261e6', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_54', '36. Rol transversal de enfermería', 'Enfermería aporta a las 11 FESP mediante:

- registro;
- vigilancia;
- investigación;
- educación;
- políticas;
- participación;
- desarrollo profesional;
- tecnologías;
- gestión;
- acceso;
- promoción;
- determinantes sociales.

---', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('baba79d2-30a6-5ed9-9db6-53e6f040e5cd', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_55', '37. Ejemplo integrador — Vacunación', '', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('90aa47d7-46e7-57b2-953e-7692a39ba6ea', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_56', 'FESP 1', 'Coberturas.', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('36dbafc7-4dc4-5c29-849d-dd7936920b19', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_57', 'FESP 2', 'Vigilancia de enfermedades y eventos.', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('94284d6a-db8d-5551-bf16-687935b290d0', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_58', 'FESP 3', 'Investigación.', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4a301c3c-2995-5196-8bea-d15d538e75cf', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_59', 'FESP 4', 'Políticas y normas.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fa08043f-f53a-50db-93ac-ec2c0de6babc', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_60', 'FESP 5', 'Participación y confianza.', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bb60d2a2-1056-5151-ac70-6777237e5c32', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_61', 'FESP 6', 'Personal capacitado.', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4b50e36b-e490-565a-8e79-e39b1f5fe39b', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_62', 'FESP 7', 'Vacunas y cadena de frío.', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b9bc0a02-f7df-5785-9f88-1f0d991ead4f', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_63', 'FESP 8', 'Financiamiento.', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('caa95f94-484f-54c2-b11d-35d711c56244', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_64', 'FESP 9', 'Acceso.', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('475395d0-a12f-5dbd-944e-f67ff5a18882', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_65', 'FESP 10', 'Promoción y reducción de riesgo.', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('18bcc295-7cab-59fa-b7ad-fc6d69c5742a', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_66', 'FESP 11', 'Barreras sociales y territoriales.

---', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f0fef811-18b2-5692-addb-9ebf44a49db4', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_67', '38. Ejemplo integrador — Agua segura', 'Puede involucrar:

- indicadores;
- vigilancia;
- investigación;
- regulación;
- participación;
- personal;
- tecnología;
- financiamiento;
- servicios;
- promoción;
- determinantes ambientales.

---', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c95265ef-6c0a-5bcc-bdab-e25647643e2f', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_68', '39. PAE / razonamiento comunitario', '', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('47e2102e-60a2-5859-a6dd-805520889950', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_69', 'Valoración', '- indicadores;
- riesgos;
- inequidades;
- recursos.', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8afc4084-ef67-5cc6-b8ad-c121f05ea1dd', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_70', 'Priorización', '- brechas;
- población afectada;
- determinantes.', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9a39d4f1-54a8-52fc-88b4-513a4aa82141', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_71', 'Planificación', '- objetivos;
- intervenciones;
- actores;
- recursos.', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('42e558da-7da0-5930-973a-c383a4399c1f', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_72', 'Implementación', '- programas;
- vigilancia;
- educación;
- coordinación.', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e93351ef-dc76-5873-a4ba-bc3f7d6d86e8', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_73', 'Evaluación', '- resultados;
- acceso;
- cobertura;
- equidad.

---', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fe34bc1f-a25e-5538-a0e0-3b503455dd69', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_74', '40. Casos tipo examen', '1. Región compara mortalidad y acceso entre provincias. **FESP 1.**
2. Equipo detecta y notifica un brote. **FESP 2.**
3. Hospital estudia infecciones para cambiar prácticas. **FESP 3.**
4. Gobierno promueve legislación contra humo de tabaco. **FESP 4.**
5. Comunidad participa en priorización. **FESP 5.**
6. País identifica déficit de enfermeras rurales. **FESP 6.**
7. Sistema garantiza medicamentos esenciales seguros. **FESP 7.**
8. Recursos se asignan según necesidad y vulnerabilidad. **FESP 8.**
9. Se reducen barreras geográficas a atención. **FESP 9.**
10. Municipio crea espacios saludables. **FESP 10.**
11. Salud trabaja con vivienda y educación. **FESP 11.**
12. Programa de dengue integra vigilancia, comunidad, saneamiento y atención. **Clave:** varias FESP actúan juntas.

---', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('636dda77-796c-5336-9c60-1c3ec828700e', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_75', '41. Errores frecuentes', '1. Memorizar FESP como programas aislados.
2. Confundir monitoreo con vigilancia.
3. Pensar que investigación es solo académica.
4. Reducir políticas a legislación.
5. Confundir participación con informar.
6. Medir personal solo por número nacional.
7. Pensar que FESP 7 solo trata medicamentos.
8. Creer que mayor gasto siempre significa buen financiamiento.
9. Confundir disponibilidad con acceso.
10. Reducir promoción a charlas.
11. Pensar que determinantes dependen solo de salud.
12. Olvidar que el modelo funciona como ciclo integrado.

---', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9a0ad8a7-4343-562c-aaf0-00976672017f', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_76', '42. Qué memorizar', '**FESP = capacidades institucionales para proteger la salud pública.**

**Son 11.**

**Ciclo: evaluación + desarrollo de políticas + asignación de recursos + acceso.**

**1 = monitoreo/evaluación.**

**2 = vigilancia/riesgos/emergencias.**

**3 = investigación/conocimiento.**

**4 = políticas/legislación.**

**5 = participación/movilización social.**

**6 = recursos humanos.**

**7 = medicamentos/tecnologías.**

**8 = financiamiento.**

**9 = acceso a servicios integrales.**

**10 = promoción/reducción de riesgos.**

**11 = determinantes sociales.**

**Derechos + equidad + intersectorialidad atraviesan el marco.**

---', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6571c4d1-0c58-5b7f-9b27-de081c515e03', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_77', '43. Fuentes', '', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9a6f5079-cc6a-5701-b3fd-ba42a6f8c807', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_78', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('121233b9-ad74-5a3f-923e-e5faa71d3b06', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_79', 'Principal', '**OPS. Las funciones esenciales de la salud pública en las Américas. Una renovación para el siglo XXI. Marco conceptual y descripción. 2020.**', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6dab77f8-2f47-53b6-808f-2fc663c03db0', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_80', 'Actualizaciones', '**OPS. Implementación de las Funciones Esenciales de Salud Pública en las Américas: Evaluación y fortalecimiento de capacidades. 2025.**

**OPS. Reforzar las capacidades de salud pública es esencial para garantizar resiliencia y equidad en las Américas. 15 abril 2025.**

**OPS. RedFESP pone en marcha el primer eje estratégico de su Plan de Trabajo 2026. 23 febrero 2026.**

---', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('884d770d-d9f5-5aec-89bb-1615989c69f0', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_81', '44. Control de calidad', '- Alcance CICDE cubierto.
- Presenta las 11 FESP del marco renovado OPS.
- Organiza las funciones dentro del ciclo de políticas.
- Integra derechos, equidad, determinantes y participación.
- Incluye actualización regional 2025.
- Incluye RedFESP 2026 con participación de Panamá.
- Incluye rol de enfermería.
- Incluye 12 casos originales.
- Estado `REVIEW`.

---', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ef2e85cb-090e-5daf-8d1b-bdbc3ac13bd4', '8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'sec_82', '45. Estado', 'Antes de `VERIFIED`:

- revisión humana;
- confirmar si CICDE espera además nomenclatura histórica de FESP;
- conservar el marco renovado OPS como referencia contemporánea;
- enlazar PUBLIC-05, PUBLIC-07 y PUBLIC-08.', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8b9a9a12-e501-5754-89c5-0d50ce9404ba', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_1', 'Los determinantes de la salud', '**Área:** Salud Pública  
**Código:** PUBLIC-07  
**area_code:** `PUBLIC_HEALTH`  
**Estado académico:** `REVIEW`  
**Versión:** 1  
**Revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ef51d330-fd09-5d6d-b51d-08585584697a', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_2', '1. Alcance oficial CICDE', 'El lineamiento CICDE 2026 incluye expresamente:

**“Los determinantes de la salud”.**

El CICDE no desglosa subtemas adicionales en este punto. Por ello, este módulo desarrolla el concepto con base en el marco contemporáneo de OMS/OPS y lo conecta con la realidad de la salud pública y la enfermería en Panamá.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3c010ea3-a8f4-5758-bf0a-474c3c6cbbf0', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_3', '2. Objetivos de aprendizaje', 'El estudiante debe poder:

1. Definir determinantes de la salud y determinantes sociales de la salud.
2. Diferenciar factores individuales, sociales, económicos, ambientales y estructurales.
3. Explicar la diferencia entre determinantes estructurales e intermedios.
4. Reconocer el gradiente social de la salud.
5. Diferenciar desigualdad e inequidad en salud.
6. Identificar cómo educación, ingreso, vivienda, trabajo y protección social afectan la salud.
7. Relacionar ambiente y cambio climático con inequidades.
8. Explicar por qué el acceso a servicios no es el único determinante.
9. Reconocer la importancia de la acción intersectorial.
10. Aplicar el enfoque de determinantes en valoración comunitaria.
11. Relacionar los determinantes con la Política Nacional de Salud 2026–2035 de Panamá.
12. Identificar intervenciones de enfermería sobre factores modificables y barreras sociales.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('129c4298-0483-5ae7-afa7-3f9adf7ca5d5', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_4', '3. ¿Qué son los determinantes sociales de la salud?', 'La OMS define los **determinantes sociales de la salud** como las condiciones en las que las personas:

- nacen;
- crecen;
- trabajan;
- viven;
- envejecen;

y las fuerzas más amplias que modelan la vida cotidiana.

Estas fuerzas incluyen:

- políticas económicas;
- sistemas políticos;
- normas sociales;
- programas de desarrollo;
- distribución de recursos;
- protección social.', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('23d34fe8-9017-5447-9d60-af99897d9b96', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_5', 'Clave', 'La salud no depende únicamente de biología ni de atención médica.

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('de055afc-9e90-5bf8-8f8a-30a89d9b388c', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_6', '4. Determinantes de la salud: visión amplia', 'Para fines de salud pública pueden considerarse:', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3d65250f-3abb-5599-a0c7-c2065fb03a36', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_7', 'Biológicos e individuales', '- edad;
- sexo biológico;
- genética;
- condiciones preexistentes.', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('acad7c0c-df38-5ac4-b623-d1309f0cbd91', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_8', 'Conductuales', '- alimentación;
- actividad física;
- consumo de sustancias;
- adherencia;
- conductas preventivas.', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1ca5da8b-0d33-506a-9751-01bea348d158', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_9', 'Sociales', '- educación;
- apoyo social;
- discriminación;
- género;
- redes familiares.', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0f087d71-3d55-5dc6-aa73-c9f732f541aa', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_10', 'Económicos', '- ingreso;
- empleo;
- seguridad económica.', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7d464b39-b087-5793-b0f9-5f58bc2a1270', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_11', 'Ambientales', '- agua;
- aire;
- vivienda;
- clima;
- contaminación.', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d3f99501-443d-5d87-a302-7b3441ed539d', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_12', 'Servicios de salud', '- disponibilidad;
- accesibilidad;
- calidad;
- continuidad.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3ac369cd-11da-5769-b2dd-7e7def1463ba', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_13', '5. Determinantes estructurales', 'La OPS distingue determinantes **estructurales** relacionados con el contexto socioeconómico y político que distribuye poder, recursos y oportunidades.

Ejemplos:

- políticas públicas;
- modelo económico;
- gobernanza;
- legislación;
- distribución de ingresos;
- posición socioeconómica;
- desigualdad social;
- discriminación estructural.', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8b0598e5-5208-55a0-aa00-768735452dde', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_14', 'Clave', 'Actúan “aguas arriba” y condicionan muchas exposiciones posteriores.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('92cefed2-ef92-5c63-99d8-261f2928845b', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_15', '6. Determinantes intermedios', 'Son condiciones más próximas a la experiencia cotidiana.

Ejemplos:

- vivienda;
- trabajo;
- alimentación;
- estrés;
- condiciones ambientales;
- transporte;
- apoyo social;
- acceso a servicios.', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fcd39aba-fdcf-553c-817b-1093681d7731', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_16', 'Relación', 'Los determinantes estructurales influyen en la distribución desigual de estos determinantes intermedios.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bedc7931-a51f-585b-9be4-46618890bd94', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_17', '7. Gradiente social de la salud', 'La OMS señala que la salud suele seguir un **gradiente social**:

a mayor desventaja social, suelen observarse peores resultados de salud y menos años de vida saludable.', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('47a5a765-d66a-5259-bf88-f6607a15c136', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_18', 'Importante', 'No significa que todas las personas con bajos ingresos enfermarán.

Describe un patrón poblacional.

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e4383c35-ab57-5675-b8bf-9736a34c8202', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_19', '8. Desigualdad e inequidad', '', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('77836bd5-8a95-57f4-a823-073c8c0ea28c', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_20', 'Desigualdad en salud', 'Diferencia observable entre grupos.', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('66eccaf8-0e2c-504b-ae9b-63f7f2c81020', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_21', 'Inequidad en salud', 'Diferencia considerada injusta y evitable, vinculada a la distribución desigual de recursos, oportunidades y poder.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4cf8bf79-8e19-5424-a053-daa91b96eb12', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_22', 'Ejemplo', 'Una diferencia de cobertura de vacunación entre comunidades puede ser una desigualdad; si surge de barreras evitables y sistemáticas, puede constituir una inequidad.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0a4488fc-b69b-53ac-9e84-287bed5e8c89', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_23', '9. Educación', 'La educación puede influir en:

- empleo;
- ingreso;
- alfabetización en salud;
- capacidad para navegar servicios;
- exposición ocupacional;
- toma de decisiones.

La OMS señala que, a nivel poblacional, mayor nivel educativo suele asociarse con mejor salud y mayor esperanza de vida.

---', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('95043889-ff09-51ff-92c3-09cd7d150b7b', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_24', '10. Ingreso y pobreza', 'El ingreso puede afectar:

- vivienda;
- alimentación;
- transporte;
- acceso a medicamentos;
- condiciones laborales;
- capacidad de afrontar emergencias.', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f1cc7ce7-694f-5368-a9aa-1636ea97007e', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_25', 'Clave', 'La pobreza no es solo falta de dinero; puede acumular múltiples exposiciones y barreras.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ead578f4-2492-5278-96ce-237c324a8636', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_26', '11. Empleo y condiciones de trabajo', 'Pueden influir:

- estabilidad;
- salario;
- exposición química o física;
- estrés;
- horarios;
- protección laboral;
- seguridad ocupacional.

Un empleo puede ser protector o perjudicial según sus condiciones.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bf8e7faf-33c3-5d15-b36a-6afa94263ca0', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_27', '12. Vivienda', 'La vivienda afecta:

- hacinamiento;
- seguridad;
- temperatura;
- humedad;
- ventilación;
- exposición a vectores;
- salud mental;
- riesgo de lesiones.', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e6bf6655-80e5-5433-a1d0-5df086b22ccc', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_28', 'Enfermería', 'La vivienda debe valorarse como parte del entorno de salud, no como detalle secundario.

---', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c9b7824b-cbb5-568d-9a35-d117c410015b', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_29', '13. Alimentación', 'La disponibilidad de alimentos nutritivos depende de:

- ingreso;
- precios;
- transporte;
- producción;
- comercio;
- disponibilidad local;
- cultura;
- políticas.', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('10eb49a8-9583-5f92-89d6-5c87851a13fa', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_30', 'Clave', 'No toda elección alimentaria es puramente individual.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b6c24e95-823f-58a6-950f-be897f42b314', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_31', '14. Agua, saneamiento y ambiente', 'El acceso a:

- agua segura;
- disposición de excretas;
- manejo de residuos;
- aire limpio;

afecta directamente riesgos de enfermedad.

Estas condiciones se relacionan con infraestructura, inversión pública y territorio.

---', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('02c2d235-84e5-589b-b378-0935d8d34084', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_32', '15. Transporte', 'Puede influir en:

- acceso a salud;
- acceso a empleo;
- actividad física;
- contaminación;
- lesiones;
- aislamiento.', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d41b2828-08ed-549b-9918-f1cf6bffad16', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_33', 'Ejemplo', 'Tener un centro de salud cercano no garantiza acceso si no existe transporte viable.

---', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('51e024bb-975f-5150-9a36-7cdb104dfde0', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_34', '16. Redes sociales y apoyo', 'Las redes familiares y comunitarias pueden:

- apoyar cuidados;
- facilitar adherencia;
- reducir aislamiento;
- ayudar ante emergencias.

La ausencia de apoyo puede aumentar vulnerabilidad, especialmente en dependencia, enfermedad crónica y vejez.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fb102c87-6b0d-5a76-8ef9-d9eabc241841', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_35', '17. Discriminación estructural', 'La discriminación puede afectar:

- oportunidades;
- empleo;
- educación;
- vivienda;
- trato en servicios;
- salud mental;
- confianza institucional.', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('38d819d0-e6cd-54ed-9432-7a5c7001085e', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_36', 'Clave', 'La inequidad no se explica solamente por decisiones individuales.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('77b40114-aeb5-569d-bded-dacb269c4568', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_37', '18. Género', 'Las normas y desigualdades de género pueden modificar:

- exposición a violencia;
- empleo;
- ingresos;
- responsabilidades de cuidado;
- acceso a recursos;
- utilización de servicios.

El análisis debe evitar estereotipos y centrarse en barreras reales.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7d76c6c2-95dc-5a3e-9ff5-0e46a3b178a9', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_38', '19. Territorio', 'El lugar donde vive una persona puede afectar:

- distancia a servicios;
- disponibilidad de personal;
- transporte;
- agua;
- saneamiento;
- conectividad;
- exposición climática.', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('07503e81-e657-59d0-947b-4504ba8bc3d2', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_39', 'Clave', 'Promedios nacionales pueden ocultar brechas territoriales.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('993d8844-9d6d-5104-ac37-70fcb7fbca8d', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_40', '20. Ruralidad y áreas de difícil acceso', 'Pueden existir barreras relacionadas con:

- distancia;
- geografía;
- transporte;
- disponibilidad de servicios;
- personal;
- conectividad.', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bdf5cb33-89bf-5d8a-9947-b47bea8d6bc6', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_41', 'Respuesta', 'Acercar servicios y adaptar estrategias al territorio.

---', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c2eb5fec-3c91-56b3-a529-a987592aa8e0', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_42', '21. Curso de vida', 'Los determinantes pueden acumularse a lo largo de la vida.

Ejemplos:

- nutrición infantil;
- educación;
- exposición a violencia;
- trabajo;
- enfermedad crónica;
- protección social en vejez.', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3e2771ea-e0cb-548a-90ee-54f5704e3247', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_43', 'Clave', 'Una exposición temprana puede influir en resultados posteriores.

---', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('66232df8-012f-5c03-ae93-1613a893a33a', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_44', '22. Cambio climático como determinante', 'El cambio climático puede afectar:

- agua;
- alimentos;
- vivienda;
- empleo;
- desplazamiento;
- enfermedades vectoriales;
- eventos extremos.

La OMS subraya que sus impactos se distribuyen de manera desigual y pueden ampliar inequidades.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fa11c67b-9ba5-54cc-b558-3977e2bc70ad', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_45', '23. Acceso a servicios de salud', 'Es un determinante importante, pero no el único.

Dimensiones:

- disponibilidad;
- accesibilidad geográfica;
- costo;
- aceptabilidad;
- calidad;
- continuidad.', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4b32f0d4-ea38-58ad-b499-cea4acb86113', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_46', 'Error', 'Pensar que construir un centro de salud elimina automáticamente las inequidades.

---', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fe7fb1de-0859-56d5-9a0c-de8ea4aecadd', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_47', '24. Protección social', 'Puede reducir vulnerabilidad mediante:

- licencias;
- pensiones;
- apoyo familiar;
- protección laboral;
- prestaciones sociales.

La OMS destaca la protección social como una herramienta para mejorar la equidad en salud.

---', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7b322842-fcc5-5583-8da3-6bec91440546', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_48', '25. Determinantes comerciales', 'Algunas decisiones comerciales pueden influir en:

- disponibilidad;
- precio;
- publicidad;
- consumo;
- exposición a productos nocivos.

Ejemplos relevantes para políticas de salud:
- tabaco;
- alcohol;
- alimentos ultraprocesados.

---', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('913913b1-f986-52df-aa94-45941177d97d', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_49', '26. Determinantes y enfermedad crónica', 'En diabetes, hipertensión u obesidad pueden influir:

- alimentos disponibles;
- ingreso;
- espacios para actividad física;
- transporte;
- acceso a controles;
- medicamentos;
- estrés.', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cc79be1d-e0c3-5d03-944a-18977b44ac55', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_50', 'Clave', 'La prevención requiere más que decir “cambie su estilo de vida”.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('57f7c508-fe01-5544-9eac-bcad1d275413', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_51', '27. Determinantes y enfermedades transmisibles', 'Pueden influir:

- hacinamiento;
- agua;
- saneamiento;
- trabajo;
- movilidad;
- acceso a diagnóstico;
- vacunación.

Ejemplo: condiciones sociales pueden favorecer transmisión o retrasar detección.

---', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('61a6107e-e90f-55fe-be0f-be33c87a95f1', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_52', '28. Determinantes y salud mental', 'Factores relevantes:

- violencia;
- desempleo;
- aislamiento;
- pobreza;
- discriminación;
- vivienda;
- eventos climáticos;
- apoyo social.

---', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('09a8f7da-f010-5907-9660-76c1cb22dca9', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_53', '29. Acción intersectorial', 'La OPS señala que abordar determinantes requiere colaboración entre sectores como:

- salud;
- educación;
- ambiente;
- trabajo;
- vivienda;
- desarrollo social;
- gobiernos locales.', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('613a9fff-9935-5863-beb0-4fe15ea6423a', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_54', 'Clave', 'El sector salud no puede modificar por sí solo todos los determinantes.

---', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9362a3b5-0c72-52e9-a08e-6f6c5f3e3853', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_55', '30. Participación comunitaria', 'Las comunidades deben participar en:

- identificación de problemas;
- priorización;
- diseño de soluciones;
- implementación;
- evaluación.

Esto mejora pertinencia y sostenibilidad.

---', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a50430b9-3e79-58da-9515-dbb62d5042e8', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_56', '31. Panamá — Política Nacional de Salud 2026–2035', 'Panamá aprobó mediante **Decreto Ejecutivo No. 17 de 23 de marzo de 2026** la:

**Política Nacional de Salud, sus Objetivos Estratégicos y Líneas de Acción para el período 2026–2035.**

El decreto establece como eje orientador:

- derecho a la salud;
- equidad;
- calidad;
- participación social y comunitaria;
- intervención sostenida sobre determinantes de la salud;
- rectoría del MINSA.', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('06570b98-9fe9-5e90-978b-e9759b747f2a', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_57', 'Clave', 'Para el CICDE, esta política ya es la referencia nacional vigente del período 2026–2035.

---', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5017bd72-6ab0-5980-951d-fa3436d43c6f', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_58', '32. Panamá — enfoque contemporáneo', 'La formulación 2026–2035 incorpora:

- evidencia;
- análisis situacional;
- compromisos nacionales e internacionales;
- enfoque integral;
- participación;
- visión de Una Salud;
- seguimiento de resultados.', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c6491c43-b48a-593d-b528-9a73918fe2e3', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_59', 'Precaución', 'Un objetivo de política no debe confundirse con un resultado ya logrado.

---', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3eeea1a9-254e-5c53-bf5b-fa7bbac2ca73', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_60', '33. Marco operacional OPS 2026', 'En junio de 2026, OPS publicó un marco para integrar:

- equidad;
- determinantes sociales;
- promoción de la salud;

dentro de la Atención Primaria de Salud.

Propone procesos como:

- diagnóstico territorial participativo;
- reducción de barreras;
- identificación de activos comunitarios;
- integración social y sanitaria;
- fortalecimiento de gobernanza local.

---', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4fa84790-b6a3-58e5-a843-300b609cec37', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_61', '34. Valoración comunitaria de determinantes', 'Preguntar y observar:

- dónde vive la población;
- educación;
- empleo;
- ingresos;
- transporte;
- agua;
- saneamiento;
- alimentos;
- redes de apoyo;
- seguridad;
- acceso a servicios.', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('07add652-b573-54af-b6ae-48997a198e17', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_62', 'Enfermería', 'La valoración debe mirar al paciente dentro de su contexto.

---', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d7431ec2-eaf1-5a0b-b750-680cd67d36a7', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_63', '35. Intervenciones de enfermería', 'Puede incluir:

- detectar barreras;
- educar;
- referir;
- coordinar;
- facilitar acceso;
- realizar visitas domiciliarias;
- participar en programas;
- recopilar datos;
- abogar por poblaciones vulnerables;
- trabajar con otros sectores.

---', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eddfc4a7-95e1-57f1-835f-5dd72a8b4783', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_64', '36. Intervención individual vs estructural', '', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c409d5bd-5d9e-5fe5-8d69-6d729061a2ab', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_65', 'Individual', 'Enseñar adherencia.', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6fd07236-7cb8-5216-8b46-62f025ef3211', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_66', 'Estructural', 'Identificar que el paciente no puede llegar al centro por transporte.', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e16b8e48-8a30-5546-a74d-409ee4a648be', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_67', 'Clave', 'Ambas dimensiones pueden requerir acciones distintas.

---', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e5c6be2a-7d7d-55d0-a17f-3ce953f79052', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_68', '37. Indicadores para estudiar determinantes', 'Ejemplos:

- escolaridad;
- desempleo;
- pobreza;
- hacinamiento;
- acceso a agua;
- cobertura de servicios;
- mortalidad;
- esperanza de vida.

Los indicadores ayudan a comparar grupos y territorios.

---', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('68538873-3156-515d-ae53-9516466d372a', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_69', '38. Casos tipo examen', '', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ee78f84e-3c45-5571-8383-ec0a58b12c98', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_70', 'Caso 1', 'Paciente no asiste porque no tiene transporte.

**Determinante:** accesibilidad geográfica/social.', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dddd9dc2-7f50-511a-a819-647d31b466d1', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_71', 'Caso 2', 'Dos comunidades tienen distinta mortalidad pese a estar en la misma provincia.

**Interpretación:** investigar determinantes e inequidades locales.', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5f42ee66-e549-5428-8fb8-151cb29c2567', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_72', 'Caso 3', 'Familia vive en hacinamiento.

**Determinante intermedio:** condiciones materiales de vivienda.', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('36d7ed60-c159-5814-87c2-2acc58f54948', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_73', 'Caso 4', 'Programa entrega el mismo recurso a todos aunque una región tenga barreras mayores.

**Problema:** igualdad de distribución no garantiza equidad.', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1d115804-1d6d-5205-a7fd-c9adf1d3002f', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_74', 'Caso 5', 'Comunidad participa en diagnóstico territorial.

**Principio:** participación social.', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e2251d0d-2428-5ae5-b7b3-0537113e4387', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_75', 'Caso 6', 'Trabajador está expuesto a químicos sin protección.

**Determinante:** condiciones laborales.', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3769cf5f-76e4-5f59-a63d-395671113375', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_76', 'Caso 7', 'Paciente recibe educación dietética pero en su comunidad no hay alimentos saludables accesibles.

**Limitación:** intervención individual sin abordar entorno alimentario.', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('67f7a98b-da2d-5c6f-9b1d-c27610e52a3b', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_77', 'Caso 8', 'Adulto mayor vive solo y sin red de apoyo.

**Determinante:** apoyo social.', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8f3dc433-1dff-5123-b622-3295114b41b6', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_78', 'Caso 9', 'Inundaciones afectan más a familias con vivienda precaria.

**Interpretación:** clima + vulnerabilidad social.', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('40edf4f1-b659-5bbf-91b2-3d8dba90d7e9', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_79', 'Caso 10', 'Centro de salud está disponible pero existe discriminación percibida.

**Determinante:** aceptabilidad y trato.', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4eca90c5-ed0b-57b0-ad34-8edfc74be1b8', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_80', 'Caso 11', 'Ministerios de Salud, Vivienda y Educación trabajan juntos.

**Estrategia:** acción intersectorial.', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c5be4916-e44a-5723-94ab-589f986340f5', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_81', 'Caso 12', 'Enfermera documenta barreras de acceso y las comunica al equipo.

**Rol:** identificación y gestión de determinantes.

---', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('76b80746-7ab3-5f4c-a969-48f0d7ad5775', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_82', '39. Errores frecuentes', '1. Pensar que determinantes = estilos de vida solamente.
2. Creer que salud depende principalmente del hospital.
3. Confundir desigualdad con inequidad.
4. Ignorar determinantes estructurales.
5. Culpar al individuo por condiciones sociales.
6. Usar promedios nacionales sin mirar territorio.
7. Reducir acceso a cercanía física.
8. Ignorar discriminación.
9. Ignorar cambio climático.
10. Pensar que educación sanitaria resuelve barreras estructurales.
11. Excluir participación comunitaria.
12. Presentar objetivos de políticas como resultados ya logrados.

---', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2af25000-d6af-5a1b-9c9a-df04517a5136', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_83', '40. Qué memorizar', '**DSS = condiciones en que nacemos, crecemos, trabajamos, vivimos y envejecemos + fuerzas amplias que las moldean.**

**Estructurales = políticas, poder, economía, posición social.**

**Intermedios = vivienda, trabajo, alimentos, estrés, ambiente, servicios.**

**Desigualdad = diferencia.**

**Inequidad = diferencia injusta y evitable.**

**Gradiente social = mayor desventaja suele asociarse con peor salud.**

**Acceso a salud es importante, pero no explica toda la salud.**

**Acción intersectorial + participación comunitaria son fundamentales.**

**Panamá 2026–2035 prioriza determinantes, equidad, derecho a la salud y rectoría.**

---', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('320b19e4-f54b-5b2a-a8af-065f98828dcf', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_84', '41. Fuentes', '', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eb8453dc-9810-5fec-8a5f-40d854eef4f0', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_85', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('418e3c0c-e992-5f31-9603-71c41a4509de', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_86', 'Complementarias', '**World Health Organization. Determinantes sociales de la salud. Actualizado 6 de mayo de 2025.**

**Pan American Health Organization. Determinantes sociales de la salud.**

**OPS. Marco operacional para la inclusión del enfoque de equidad, determinantes sociales y promoción de la salud en la atención primaria de salud. 4 de junio de 2026.**', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('697d6336-b9a0-5750-93cb-12c7f7ea311e', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_87', 'Panamá', '**Ministerio de Salud de Panamá. Decreto Ejecutivo No. 17 de 23 de marzo de 2026, que aprueba la Política Nacional de Salud, sus Objetivos Estratégicos y Líneas de Acción para el período 2026–2035.**

---', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('53d58cbf-27d8-5020-86f4-70747fe037cc', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_88', '42. Control de calidad', 'Este paquete:

- cubre el tema exacto CICDE;
- diferencia determinantes estructurales e intermedios;
- desarrolla equidad, gradiente social y acción intersectorial;
- integra cambio climático y territorio;
- incorpora la Política Nacional de Salud 2026–2035 vigente;
- incluye marco operacional OPS de junio 2026;
- incorpora rol de enfermería;
- contiene 12 casos originales.

---', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7cc0c61d-0145-50db-888a-c2dc2c860dc3', 'cc1640c4-15b5-5416-aa80-67ecb7610f45', 'sec_89', '43. Estado', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- revisar cualquier actualización de la política 2026–2035;
- evitar convertir asociaciones poblacionales en causalidad individual;
- enlazar PUBLIC-05, PUBLIC-06 y PUBLIC-08.', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('df28bb4e-4a71-5796-82dc-472268dc6860', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_1', 'Enfermería en Salud Pública', '**Área:** Salud Pública  
**Código:** PUBLIC-08  
**area_code:** `PUBLIC_HEALTH`  
**Estado académico:** `REVIEW`  
**Versión:** 1  
**Revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5e30df7b-122f-5b14-8cbb-3d69e9c9759e', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_2', '1. Alcance oficial CICDE', 'El CICDE 2026 incluye expresamente:

**“Enfermería en Salud Pública”.**

Subtemas:

- Concepto de Salud, Salud Pública, Enfermería en Salud Pública.
- Indicadores de salud.
- Proceso salud-enfermedad: tríada ecológica, cadena epidemiológica.
- Estructura Organizativa y Administrativa del Sistema de Salud en Panamá.
  - Organización.
  - Políticas de Salud 2026-2035.
  - Programas de Salud.
- Rol de la Enfermera en los programas.
- Visita Domiciliaria.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2fc81196-f262-5d1b-ab7a-d9e9366c0031', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_3', '2. Objetivos de aprendizaje', 'El estudiante debe poder:

1. Definir salud, salud pública y enfermería en salud pública.
2. Explicar la diferencia entre atención individual y acción poblacional.
3. Interpretar indicadores básicos de salud.
4. Diferenciar incidencia y prevalencia.
5. Interpretar mortalidad, letalidad y cobertura.
6. Explicar la tríada epidemiológica.
7. Reconocer los eslabones de la cadena de infección.
8. Identificar puntos donde puede romperse la transmisión.
9. Describir la organización general del sistema de salud panameño.
10. Reconocer la rectoría del MINSA y el papel de la CSS.
11. Identificar la Política Nacional de Salud 2026–2035 vigente.
12. Reconocer programas de salud y el papel de enfermería.
13. Aplicar principios de visita domiciliaria.
14. Integrar vigilancia, promoción, prevención, atención y comunidad.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fc16b8b1-1910-53dd-b4bc-b3c8f597e0b1', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_4', '3. Concepto de salud', 'La salud debe entenderse de manera integral, incluyendo dimensiones:

- físicas;
- mentales;
- sociales.

La salud no se reduce a la ausencia de enfermedad.', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2d7f10fe-0d6c-56f5-925d-7f6717a2252d', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_5', 'En salud pública', 'También interesa:

- distribución de riesgos;
- condiciones de vida;
- determinantes;
- acceso;
- equidad;
- bienestar colectivo.

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('76c5b2dd-aef3-555f-b091-1b6e629bc6dd', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_6', '4. Salud pública', 'La salud pública estudia y actúa sobre la salud de las poblaciones.

Incluye:

- promoción;
- prevención;
- vigilancia;
- protección;
- políticas;
- saneamiento;
- preparación ante emergencias;
- investigación;
- organización de servicios;
- acción sobre determinantes.', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f53954fc-91ee-5d4c-b958-cd9b2834aa38', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_7', 'Clave', 'El sujeto de acción puede ser una persona, familia, comunidad o población, pero el objetivo final es mejorar la salud colectiva.

---', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eb781f2d-fac3-533d-8e0d-eba2b32911a6', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_8', '5. Enfermería en salud pública', 'La enfermería en salud pública aplica conocimientos de enfermería, epidemiología, promoción y comunidad para:

- prevenir enfermedades;
- promover salud;
- detectar riesgos;
- vigilar eventos;
- cuidar poblaciones;
- educar;
- coordinar servicios;
- apoyar políticas y programas.', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a4a4db86-9406-54fb-8602-45c362956633', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_9', 'Panamá', 'MINSA describe a enfermería como un pilar del sistema y destaca su trabajo en promoción, inmunización, niñez, embarazo, adulto, VIH, tuberculosis y comunidades rurales o de difícil acceso.

---', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9204e28d-c750-5f0f-9133-cc2dcb4f85c3', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_10', '6. Enfoque individual y poblacional', '', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aae4e4c0-cfc2-5346-81ae-ba4b89004e6e', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_11', 'Atención individual', 'Se centra en necesidades de una persona.', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5567f1bb-dfe2-5a6b-ba53-6945c539bcda', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_12', 'Salud pública', 'Analiza además:

- frecuencia de eventos;
- grupos afectados;
- territorios;
- factores de riesgo;
- barreras;
- intervenciones colectivas.', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9d7d40a5-0cf9-5811-b6f2-56f638ab58e9', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_13', 'Ejemplo', 'Tratar un caso de dengue es atención individual.

Analizar casos por corregimiento y eliminar criaderos es acción de salud pública.

---', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7c1b3bd1-aba5-5c85-a5a6-c9475c96f66d', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_14', '7. Indicadores de salud', 'Un indicador resume información útil para describir, comparar o evaluar:

- estado de salud;
- riesgos;
- servicios;
- cobertura;
- recursos;
- resultados.

MINSA mantiene un sistema público de estadísticas e indicadores de salud para Panamá y sus provincias/comarcas.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cca65000-8d3f-549d-99be-61d5c5c7994a', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_15', '8. ¿Para qué sirven los indicadores?', 'Permiten:

- identificar problemas;
- comparar territorios;
- vigilar tendencias;
- priorizar recursos;
- evaluar programas;
- medir desigualdades;
- apoyar decisiones.', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('283f9685-798f-5af9-a9e4-1378898a5aa2', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_16', 'Clave', 'Un indicador aislado necesita contexto, población y período.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2d1c0f3a-a487-512a-a3be-e3c196f64cf4', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_17', '9. Incidencia', 'La **incidencia** mide la aparición de **casos nuevos** en una población durante un período.

Una forma común es la incidencia acumulada o proporción de incidencia:

**Incidencia = casos nuevos durante el período / población inicialmente en riesgo × 10ⁿ**', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a0107a73-43ef-523b-823d-62e9ae8d6b3e', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_18', 'Interpretación', 'Se relaciona con el **riesgo de desarrollar** el evento.

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('45f55405-bc82-51fe-87d5-d6a830f235f9', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_19', '10. Prevalencia', 'La **prevalencia** mide las personas que tienen una condición en un momento o período e incluye:

- casos nuevos;
- casos preexistentes.

**Prevalencia = casos existentes / población correspondiente × 10ⁿ**', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e9022ee3-a48f-5211-8c47-f2e36abbc6cc', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_20', 'Clave de examen', '**Incidencia = nuevos.**  
**Prevalencia = todos los existentes.**

---', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('25505209-e068-5393-95dd-7e15971fa480', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_21', '11. Incidencia vs prevalencia', 'Una enfermedad puede tener:

- baja incidencia;
- alta prevalencia;

si dura muchos años.

La prevalencia depende de:

- aparición de casos;
- duración;
- recuperación;
- mortalidad.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ac95f4d8-2779-5afa-b90e-adb6b72505a4', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_22', 'Error', 'Usar incidencia y prevalencia como sinónimos.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('11044aa8-75f1-5ac9-a02a-6271eb71a73f', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_23', '12. Mortalidad', 'La mortalidad mide la frecuencia de muertes en una población durante un período.

Forma general:

**Mortalidad = muertes durante el período / población correspondiente × 10ⁿ**

Puede ser:

- general;
- específica por edad;
- específica por causa;
- específica por sexo u otra característica.

---', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e7fdb6e9-4b1c-5487-9be2-4e12af007f91', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_24', '13. Mortalidad infantil', 'Se expresa habitualmente como:

**Muertes de menores de 1 año / nacidos vivos del mismo período × 1,000**', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6d719071-16db-5413-91de-fab463b56e54', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_25', 'Importante', 'Es una razón utilizada como indicador sensible de condiciones sanitarias y sociales.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('de38df60-994e-544b-9a6b-70c5aed1389c', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_26', '14. Mortalidad materna', 'Debe distinguirse la **razón de mortalidad materna** de una tasa de mortalidad general.

La razón se expresa habitualmente como:

**Muertes maternas / nacidos vivos × 100,000**', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c8633115-f004-525d-917c-158e33f52cd8', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_27', 'Precaución', 'La definición operacional de muerte materna y los criterios de vigilancia deben seguir la norma vigente.

---', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3edb26da-1925-5b13-9560-fe282d87b742', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_28', '15. Letalidad', 'La **letalidad** expresa la proporción de personas con una enfermedad que mueren por ella.

**Letalidad = muertes por la enfermedad / casos de la enfermedad × 100**', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('48d63801-07ba-54cb-9d6b-25bb676f4a15', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_29', 'Clave', 'Mortalidad usa como referencia una **población**.

Letalidad usa como referencia los **casos**.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('01c3af3f-2d47-5975-8582-2c73a4005697', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_30', '16. Morbilidad', 'La morbilidad describe enfermedad o alteración de salud en una población.

Puede estudiarse mediante:

- incidencia;
- prevalencia;
- consultas;
- hospitalizaciones;
- discapacidad.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('51492fc8-ac7c-56b2-928d-387c9c80c782', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_31', '17. Cobertura', 'La cobertura puede expresar qué proporción de una población objetivo recibió una intervención.

Ejemplo conceptual:

**Cobertura = personas que recibieron la intervención / población objetivo × 100**

Ejemplos:

- vacunación;
- control prenatal;
- tamizaje;
- controles de crecimiento.', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d48a6623-dc73-52d5-bace-ab4177522164', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_32', 'Precaución', 'Cobertura alta no garantiza por sí sola calidad.

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e3e25c18-0d30-5847-969d-55a23c5fe393', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_33', '18. Indicadores de estructura, proceso y resultado', 'Una clasificación útil distingue:', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9fcaf404-ab89-5133-b7a5-136f0203e67d', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_34', 'Estructura', 'Recursos y capacidad.
- personal;
- camas;
- equipos.', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9186caa5-3001-5363-b7cc-17e4225b8eb1', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_35', 'Proceso', 'Actividades realizadas.
- consultas;
- vacunaciones;
- controles.', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b2319e69-ddf6-5673-ba8a-305e51b52ff5', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_36', 'Resultado', 'Cambios o efectos.
- mortalidad;
- complicaciones;
- control de enfermedad.', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d29a42b2-b770-512b-a74a-287f4648c86b', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_37', 'Clave', 'No confundir actividad con resultado.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ffbb922c-ced5-5b86-87c7-caca862060f3', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_38', '19. Calidad del dato', 'Un indicador depende de:

- registro correcto;
- definición uniforme;
- denominador adecuado;
- oportunidad;
- completitud;
- consistencia.

MINSA señala que el Sistema Electrónico de Información de Salud apoya la recolección de datos, indicadores, seguimiento y toma de decisiones.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5fdfc510-7cc3-5597-8ae6-4613240beb49', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_39', '20. Epidemiología', 'La epidemiología estudia:

- distribución;
- frecuencia;
- determinantes;

de eventos de salud en poblaciones, y aplica ese conocimiento al control de problemas.

Preguntas básicas:

- ¿qué?
- ¿quién?
- ¿dónde?
- ¿cuándo?
- ¿por qué?
- ¿cómo?

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b6abecee-6e89-53aa-9a29-01433c3ebde3', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_40', '21. Tríada ecológica o epidemiológica', 'El modelo tradicional de enfermedad infecciosa incluye:

1. **Agente**
2. **Huésped**
3. **Ambiente**

La enfermedad puede resultar de la interacción entre estos componentes.

---', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0de4da31-1581-5a20-b3f8-df9f4ee7b745', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_41', '22. Agente', 'Puede ser:

- virus;
- bacteria;
- parásito;
- hongo;
- agente químico;
- agente físico, según el modelo ampliado.

Características relevantes:

- infectividad;
- patogenicidad;
- virulencia;
- dosis.', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b4506251-3551-50c9-ac92-ee68d5b666b1', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_42', 'Clave', 'La presencia de un agente por sí sola no siempre produce enfermedad.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0f4ae491-4d6e-57f6-9190-18de6c01b493', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_43', '23. Huésped', 'Factores del huésped:

- edad;
- inmunidad;
- genética;
- nutrición;
- enfermedades previas;
- conducta;
- exposición.

Un huésped susceptible tiene condiciones que facilitan infección o enfermedad.

---', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('39517df5-794e-5dc3-b3db-c249e33c733d', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_44', '24. Ambiente', 'Incluye factores externos que influyen en el encuentro agente-huésped:

- clima;
- vivienda;
- agua;
- saneamiento;
- vectores;
- densidad;
- servicios;
- condiciones sociales.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f70a2b1d-7bb6-53fd-88b4-a39ca03dd401', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_45', '25. Aplicación de la tríada', 'Ejemplo: dengue.', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('344a1cbc-83aa-5c4a-8c5e-af779e4c79aa', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_46', 'Agente', 'Virus dengue.', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9e3f5c76-d00f-5998-bf92-7049604c7419', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_47', 'Huésped', 'Persona susceptible.', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('00bed8f4-b4a3-5100-a684-96fd3f6a7684', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_48', 'Ambiente', 'Condiciones que favorecen presencia del vector, criaderos, exposición y transmisión.', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('627a3e2f-e8f7-5651-865f-f118b64b5288', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_49', 'Importante', 'El mosquito participa como vector; no debe confundirse automáticamente con el agente.

---', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1e92e856-79f8-5430-9072-34b5b431d336', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_50', '26. Cadena epidemiológica o cadena de infección', 'Describe la secuencia por la que un agente puede pasar desde su fuente o reservorio hasta un huésped susceptible.

Componentes clásicos:

1. agente infeccioso;
2. reservorio/fuente;
3. puerta de salida;
4. modo de transmisión;
5. puerta de entrada;
6. huésped susceptible.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ba00124b-0928-5215-b09d-5cdc660d6ec9', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_51', '27. Reservorio', 'Es el hábitat donde el agente normalmente:

- vive;
- crece;
- se multiplica.

Puede ser:

- humano;
- animal;
- ambiental.', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('99dcb46b-9909-58ac-9191-a122e648c0b1', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_52', 'Clave', 'Reservorio y vector no significan lo mismo.

---', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0f537ac4-b1d1-5794-80d0-141a553816b2', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_53', '28. Puerta de salida', 'Vía por la que el agente abandona el reservorio.

Ejemplos:

- secreciones respiratorias;
- sangre;
- heces;
- lesiones;
- tracto genitourinario.

Depende del agente.

---', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('db9d173d-4b4f-5ba3-ad6d-84ce8bb4354a', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_54', '29. Modo de transmisión', 'Puede ser:

- contacto directo;
- contacto indirecto;
- gotas;
- aerosoles, según el agente;
- alimentos;
- agua;
- vectores;
- sangre.', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2ff80a8a-e650-5362-97dc-76836ae8cffc', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_55', 'Clave', 'La vía específica debe estudiarse para cada enfermedad.

---', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e7dca495-768c-57d5-be3a-6db707f1ec89', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_56', '30. Puerta de entrada', 'Ejemplos:

- vía respiratoria;
- digestiva;
- mucosas;
- piel lesionada;
- vía parenteral.

La puerta adecuada depende del agente.

---', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('abec8421-80a1-51ae-89d7-35be0842fbdb', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_57', '31. Huésped susceptible', 'La susceptibilidad puede aumentar por:

- falta de inmunidad;
- edad;
- enfermedad;
- malnutrición;
- tratamientos inmunosupresores;
- exposiciones específicas.

---', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('255e32b6-c87a-5380-aa11-6f961c84a217', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_58', '32. Romper la cadena', 'La prevención actúa en uno o varios eslabones:

- tratar o controlar reservorios;
- higiene;
- aislamiento según indicación;
- agua segura;
- alimentos seguros;
- control vectorial;
- PPE;
- vacunación;
- profilaxis indicada.', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5c33fd89-aeba-56af-80f4-93ad743e035e', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_59', 'Clave', 'Las medidas deben corresponder a la vía real de transmisión.

---', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('33662fe2-a39e-5bdc-95c6-1745821d5162', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_60', '33. Sistema de salud de Panamá', 'Panamá cuenta con un sistema en el que participan, entre otros:

- Ministerio de Salud (MINSA);
- Caja de Seguro Social (CSS);
- patronatos e instituciones especializadas;
- proveedores privados.

El **MINSA ejerce la rectoría sanitaria nacional**.', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('12c85d9a-cc21-5199-8eab-0a093329d62d', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_61', 'Importante', 'No debe enseñarse como si MINSA y CSS ya fueran una única institución.

---', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b67de7e6-bc31-5680-a543-ab94636927f9', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_62', '34. MINSA', 'El Ministerio de Salud fue creado mediante el **Decreto de Gabinete No. 1 de 15 de enero de 1969**, que determinó su estructura y funciones.

La **Política Nacional de Salud y sus Lineamientos Estratégicos 2026–2035**, aprobada mediante Decreto Ejecutivo No. 17 de 23 de marzo de 2026, establece expresamente que:

- el MINSA es el **ente rector del sector salud**;
- conduce, implementa, da seguimiento y evalúa la Política Nacional de Salud;
- la política es de cumplimiento obligatorio para las instituciones públicas y privadas vinculadas al ámbito de la salud;
- debe servir como marco de referencia para coordinación intersectorial.

El decreto también sitúa la conducción dentro de la capacidad de la **Autoridad Sanitaria Nacional**.', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c95fc55b-c3fb-589b-8993-110f1ed2749b', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_63', 'Clave', 'Para el examen: **MINSA = ente rector del sector salud / Autoridad Sanitaria Nacional.**

---', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8de23585-1ef3-511a-88b6-9990b88bb5ff', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_64', '35. Caja de Seguro Social', 'La **Caja de Seguro Social (CSS)** es una institución autónoma regida por su Ley Orgánica. El texto único vigente incorpora las reformas de la **Ley 462 de 18 de marzo de 2025**, entre otras modificaciones.

La CSS mantiene su propia estructura institucional y participa en la provisión de servicios de salud y en la administración de la seguridad social.', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('60323ec3-6b51-5dcd-a300-8eedaaf96c95', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_65', 'Importante', 'La integración de servicios MINSA–CSS **no significa que la CSS haya dejado de ser una institución autónoma ni que ambas entidades se hayan convertido en una sola institución**.

MINSA y CSS avanzan en coordinación e integración funcional de los servicios públicos de salud.

---', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1715d62d-4372-5f71-9ed2-af1dde6bdcf0', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_66', '36. Integración MINSA–CSS: estado 2026', 'La **Comisión de Integración de los Servicios Públicos de Salud** fue creada mediante el **Decreto Ejecutivo No. 26 de 26 de noviembre de 2025**.

MINSA informó el 26 de enero de 2026 que la implementación comenzaba en:

- Herrera;
- Los Santos.

El proceso fue definido oficialmente como **gradual y por etapas**.

En junio de 2026 MINSA informó que, tras los primeros meses en Herrera y Los Santos, la expansión avanzaría hacia:

- Chiriquí;
- Bocas del Toro.

El 14 de agosto de 2026 MINSA confirmó que el proceso ya continuaba en esas dos provincias y señaló como expectativa incorporar Coclé hacia finales de 2026.', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8b03566e-cb0a-5c34-81e5-41d310149748', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_67', 'Clave', 'A septiembre de 2026 debe describirse como **un proceso de integración funcional gradual todavía en curso**, no como una unificación nacional ya terminada.

---', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f696cbf4-6a01-543d-afee-467cce04aa42', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_68', '37. Finalidad de la integración', 'Las comunicaciones oficiales MINSA describen objetivos como:

- coordinar la red pública;
- reducir duplicidades;
- optimizar recursos;
- mejorar el acceso de personas aseguradas y no aseguradas;
- fortalecer la Atención Primaria de Salud;
- mejorar referencia y continuidad de la atención.', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7e3a4e64-7af3-5eb0-991d-683c4ffcc165', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_69', 'Gobernanza', 'La Política Nacional de Salud 2026–2035 mantiene al **MINSA como ente rector**, mientras la CSS conserva su marco legal institucional propio.', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4813cc96-1ce5-596b-8bc4-6d1393cd4cbb', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_70', 'Clave', '**Integrar servicios no equivale a borrar las instituciones.**

---', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f33b4708-361f-54da-92e3-31d8f37138b6', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_71', '38. Niveles y red de atención', 'La cartera oficial de servicios del MINSA incluye, entre otras instalaciones:

- puestos de salud;
- subcentros de salud;
- centros de promoción de la salud;
- centros de salud básicos;
- centros de salud con especialidad;
- centros de salud con camas;
- policentros;
- hospitales de área;
- hospitales regionales.

En los establecimientos de menor complejidad predominan actividades como:

- promoción;
- prevención;
- primeros auxilios;
- controles;
- atención general;
- participación comunitaria.

A medida que aumenta la complejidad se incorporan:

- especialidades;
- apoyo diagnóstico;
- urgencias;
- hospitalización;
- mayor capacidad resolutiva.', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0dcdcf8e-d39e-5f7d-a74f-563b2f3cc8e7', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_72', 'Clave', 'La red organiza la atención por **capacidad resolutiva y referencia**, no solamente por el tamaño físico de la instalación.

---', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('41ac2689-b5de-57fa-8b64-4e5210fceb8c', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_73', '39. Referencia y contrarreferencia', 'La red debe permitir:

- enviar pacientes al nivel adecuado;
- mantener información clínica;
- devolver seguimiento al nivel correspondiente;
- asegurar continuidad.', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7ee4d179-8699-5a99-ba76-240df7ca0026', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_74', 'Clave', 'Referir no significa abandonar el seguimiento.

---', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9b9c5d59-c97d-5022-88d2-5d8689aea369', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_75', '40. Política Nacional de Salud 2026–2035', 'Mediante **Decreto Ejecutivo No. 17 de 23 de marzo de 2026**, Panamá aprobó la Política Nacional de Salud para el período **2026–2035**.

El decreto fue publicado en la **Gaceta Oficial Digital No. 30491-C el 26 de marzo de 2026**.

Entre sus disposiciones centrales:

- reconoce el derecho a la salud;
- considera los determinantes de la salud de la población y del ambiente;
- establece cumplimiento obligatorio para instituciones públicas y privadas vinculadas al sector;
- utiliza la política como marco para coordinación intersectorial;
- asigna al MINSA la conducción, implementación, seguimiento y evaluación.', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1f113774-a254-53d4-8fee-e11eebd1c88d', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_76', 'Clave', 'Para CICDE 2026, esta es la **política nacional vigente** del período solicitado.

---', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('10c08dc5-0960-514d-b9e5-4659b7b84e18', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_77', '41. Enfoques de la política 2026–2035', 'La política plantea como elementos centrales:

- derecho a la salud;
- equidad;
- calidad;
- curso de vida;
- participación social;
- rectoría;
- intervención sobre determinantes;
- coordinación del sistema.

MINSA también comunicó que la formulación incorpora:

- evidencia científica;
- compromisos internacionales;
- análisis situacional;
- enfoque integral;
- Una Salud.

---', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('51efba6c-54d6-5f5a-aac9-c24e731021eb', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_78', '42. Política no es resultado', '', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6d73482e-254f-5124-8a21-1d956fb7f878', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_79', 'Clave de examen', 'Que una política establezca una meta no significa que la meta ya se haya alcanzado.

El estudiante debe distinguir:

- política aprobada;
- línea de acción;
- implementación;
- indicador;
- resultado.

---', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dc18525c-c6e2-5184-974d-53a95c4c4468', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_80', '43. Programas de Salud del MINSA', 'El directorio oficial vigente del MINSA incluye, entre otros:

- **Programa Ampliado de Inmunización**;
- **Programa de Control de la Tuberculosis**;
- **Programa de Cuidados Paliativos**;
- **Programa Salud de Adulto**;
- **Programa Salud Adulto Mayor**;
- **Programa Salud Mental**;
- **Programa Salud Sexual y Reproductiva**;
- **Sección de Salud Integral de Niñez y Adolescencia**;
- otros programas y componentes técnicos nacionales.', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('62f07412-967e-5d4a-9135-f94546cc5c60', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_81', 'Precaución', 'Los nombres, dependencias administrativas y componentes pueden actualizarse. Para preguntas normativas o programáticas debe utilizarse la denominación oficial vigente.

---', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3016c565-d103-58e8-95b6-16c220f92b40', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_82', '44. Programa Ampliado de Inmunización', 'Enfermería participa en:

- aplicación segura;
- cadena de frío;
- registro;
- educación;
- seguimiento de cobertura;
- búsqueda de población pendiente;
- vigilancia de eventos según normativa.', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('51797a4f-4885-50ea-92ed-e50a6e41f1d7', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_83', 'Panamá 2026', 'MINSA mantiene actividades de vacunación lideradas con participación de la Dirección de Enfermería y Atención Primaria.

---', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0104fc67-223d-53ac-a5bd-af43eb85aa4d', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_84', '45. Programa de Tuberculosis', 'Funciones de enfermería pueden incluir:

- detección de personas con criterios de estudio;
- educación;
- administración/seguimiento de tratamiento según programa;
- adherencia;
- visitas domiciliarias;
- vigilancia;
- investigación de contactos conforme a norma.', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b9e66334-90e6-5b1b-9d4d-bbbb0c11ed92', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_85', 'Precaución', 'Los esquemas farmacológicos concretos deben estudiarse con la norma vigente.

---', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5e680b2a-682b-53ae-b275-13ed4f0153fe', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_86', '46. Salud de la niñez', 'Enfermería participa en:

- crecimiento y desarrollo;
- vacunación;
- nutrición;
- promoción;
- detección de riesgos;
- seguimiento;
- educación a cuidadores.

---', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dff34ef2-a25b-5ffd-813d-c049d5d081b5', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_87', '47. Embarazo y salud sexual/reproductiva', 'Puede participar en:

- captación;
- controles;
- educación;
- signos de alarma;
- prevención;
- promoción;
- planificación familiar dentro del marco normativo;
- referencia.

---', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('028f1445-1d24-5583-8e84-f6ad6d211530', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_88', '48. Salud del adulto y adulto mayor', 'Incluye:

- promoción;
- prevención;
- valoración;
- seguimiento de crónicos;
- funcionalidad;
- educación;
- visita domiciliaria;
- coordinación de cuidados.

En 2026 MINSA publicó una Norma Técnico-Administrativa del Programa de Salud de Personas Adultas Mayores.

---', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dcaab2f2-9f78-5f95-ac3f-84e8163cbb85', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_89', '49. VIH', 'Enfermería puede contribuir a:

- prevención;
- educación;
- pruebas según normativa;
- consejería dentro del modelo institucional;
- adherencia;
- seguimiento;
- reducción de estigma;
- continuidad.

---', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b3fa95b6-c478-5701-ac32-7c884eb85c69', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_90', '50. Rol general de enfermería en programas', 'MINSA destaca participación de enfermería en:

- inmunización;
- crecimiento y desarrollo;
- embarazo;
- salud del adulto;
- VIH;
- tuberculosis.

Además, la práctica incluye:

- atención directa;
- promoción;
- prevención;
- tratamiento;
- rehabilitación;
- educación;
- vigilancia;
- gestión.

---', 90)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c147e918-8f29-5746-bedf-671012a1f2fa', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_91', '51. Enfermería y vigilancia epidemiológica', 'El personal de enfermería puede:

- identificar eventos;
- usar definiciones de caso vigentes;
- notificar;
- registrar;
- participar en investigación;
- hacer seguimiento;
- educar.

MINSA ha reforzado explícitamente el rol de enfermería en vigilancia epidemiológica.

---', 91)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('acc56847-b357-54c0-8888-51e913788183', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_92', '52. Enfermería y promoción', 'La promoción incluye:

- educación;
- participación;
- hábitos saludables;
- trabajo escolar;
- trabajo comunitario;
- fortalecimiento de capacidades.', 92)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('126b3cf3-2b07-5b3d-bff1-313c5f05b6cf', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_93', 'Clave', 'Promoción no se limita a dar charlas.

---', 93)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cbf94bda-0cee-5223-bbca-2592551dd612', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_94', '53. Visita domiciliaria', 'La visita domiciliaria lleva la atención al entorno real de la persona y la familia.

Puede permitir:

- valoración clínica;
- valoración social;
- valoración ambiental;
- educación;
- seguimiento;
- evaluación de adherencia;
- identificación de barreras;
- coordinación.

MINSA mantiene documentos técnicos que contemplan la visita domiciliaria en distintos programas y continúa utilizándola en la práctica asistencial y comunitaria.

En mayo de 2026, por ejemplo, el Centro de Salud Rómulo Roux de Pueblo Nuevo documentó visitas domiciliarias con un equipo integrado por:

- medicina general;
- enfermería;
- trabajo social;
- promoción de la salud.', 94)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b2826c71-23f3-5bb4-8d2a-1700b346ca79', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_95', 'Clave', 'La visita domiciliaria **no es una inspección del hogar**: es una intervención planificada con objetivo, respeto, registro y seguimiento.

---', 95)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c6fcbd5f-6364-527f-a6c5-72423746ab7e', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_96', '54. ¿Quién puede requerir visita?', 'Depende del programa y criterio clínico/social.

Ejemplos documentados en normas MINSA incluyen:

- inasistencia a controles;
- vacunación incompleta;
- seguimiento de enfermedad;
- discapacidad;
- problemas sociales;
- eventos epidemiológicos;
- situaciones de difícil traslado.', 96)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('37cf7af3-c7ba-525f-95b2-301b8f6e29e9', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_97', 'Importante', 'La indicación específica depende de la norma del programa correspondiente.

---', 97)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0f0896ec-09d9-5384-a4bf-cf9ad61ca229', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_98', '55. Fases generales de una visita domiciliaria', '', 98)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('24f341ce-ec8b-5849-a1e9-15f847e91f5d', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_99', 'Antes', '- revisar información disponible;
- definir objetivo;
- coordinar;
- preparar materiales;
- valorar seguridad.', 99)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a33b3181-7588-500b-92a4-b22e5a64adb7', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_100', 'Durante', '- presentarse;
- obtener colaboración/consentimiento según corresponda;
- respetar privacidad;
- valorar persona, familia y ambiente;
- intervenir;
- educar.', 100)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('92b85131-fbe1-5960-bfc8-b2f8344bd155', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_101', 'Después', '- registrar;
- comunicar hallazgos relevantes;
- coordinar referencias;
- planificar seguimiento.

---', 101)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('81f6b7c9-5cc7-5f43-b161-c64768e18d58', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_102', '56. Valoración en el hogar', 'Observar cuando sea pertinente:

- movilidad;
- apoyo familiar;
- medicamentos;
- alimentación;
- agua;
- saneamiento;
- vivienda;
- riesgos de caída;
- barreras;
- signos clínicos.', 102)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ccf6f059-57b6-53e4-9879-34aff998eeac', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_103', 'Clave', 'No convertir la visita en inspección punitiva.

---', 103)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2366c47b-f2b7-5432-9ead-8167208527fd', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_104', '57. Comunicación durante la visita', 'Debe ser:

- respetuosa;
- clara;
- confidencial;
- culturalmente adecuada;
- centrada en necesidades.', 104)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0120d9e7-ce0b-5ae8-bdf5-14dc8f5eae3c', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_105', 'Error', 'Regañar o culpabilizar a la familia.

---', 105)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('91136545-3964-5ead-b773-d9eb6c002e9b', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_106', '58. Seguridad del equipo', 'La visita debe planificarse considerando:

- identificación institucional;
- ruta;
- comunicación;
- riesgo ambiental;
- bioseguridad;
- protocolos locales.

No deben improvisarse procedimientos que requieren condiciones o equipos no disponibles.

---', 106)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('be39e62e-7520-55c0-8050-610290c0aed6', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_107', '59. Visita domiciliaria actual en Panamá', 'En mayo de 2026 el Centro de Salud Rómulo Roux de Pueblo Nuevo informó visitas domiciliarias con equipo interdisciplinario de:

- medicina;
- enfermería;
- trabajo social;
- promoción de la salud.

Se utilizaron para acercar atención a personas con limitaciones para trasladarse.

---', 107)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('38479c5c-18e7-5d75-a368-287034b36314', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_108', '60. Interdisciplinariedad', 'La enfermera puede coordinar con:

- medicina;
- trabajo social;
- nutrición;
- promoción;
- farmacia;
- salud mental;
- rehabilitación;
- autoridades comunitarias.', 108)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('21dcd6c1-537a-5695-87ec-f1fdfe8e058c', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_109', 'Clave', 'Los problemas comunitarios complejos raramente se resuelven por una sola disciplina.

---', 109)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6c1a8b18-5579-5156-b17d-ee99e8864345', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_110', '61. PAE aplicado a salud pública', '', 110)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8429ea31-decc-5921-b6cb-581e12a3abd9', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_111', 'Valoración', '- persona;
- familia;
- comunidad;
- indicadores;
- determinantes;
- recursos.', 111)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9c53489d-7764-55cc-8365-30178c0c0b18', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_112', 'Priorización', '- gravedad;
- magnitud;
- vulnerabilidad;
- urgencia.', 112)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2a494b60-713e-556c-a11d-d7d1ebf1e2de', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_113', 'Planificación', '- objetivos;
- intervenciones;
- recursos;
- actores.', 113)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1175af7c-53af-5072-ad08-6a3f2236ead3', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_114', 'Implementación', '- cuidado;
- educación;
- vigilancia;
- coordinación.', 114)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('59411860-8643-5160-977e-11f926adbd3f', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_115', 'Evaluación', '- resultados;
- cobertura;
- adherencia;
- cambios;
- nuevas necesidades.

---', 115)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9b1d8bba-96d0-5c07-abae-99bc89803562', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_116', '62. Casos tipo examen', '', 116)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('235e3399-d45b-588a-9c2d-8de9da9e7138', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_117', 'Caso 1', 'En un año aparecen 80 casos nuevos de una enfermedad.

**Indicador:** incidencia.', 117)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('041b46dd-9731-5547-baf9-976bc5ba0d66', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_118', 'Caso 2', 'Se cuentan todos los pacientes que actualmente viven con diabetes.

**Indicador:** prevalencia.', 118)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('56b19057-8a02-50f3-9f65-4ce5ff36e681', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_119', 'Caso 3', 'Se divide el número de muertes por una enfermedad entre los casos diagnosticados de esa enfermedad.

**Indicador:** letalidad.', 119)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2a235265-c85d-5cd3-97f1-4a9d3f409074', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_120', 'Caso 4', 'Un estudio analiza agente, huésped y ambiente.

**Modelo:** tríada epidemiológica.', 120)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('987d057e-df34-50b6-9e62-78de7e8f6630', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_121', 'Caso 5', 'Enfermera identifica reservorio, puerta de salida, transmisión y huésped susceptible.

**Modelo:** cadena epidemiológica.', 121)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('471a8a04-7d31-57e4-95a9-90fa2f156c89', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_122', 'Caso 6', 'Se aplica vacunación a una persona susceptible.

**Efecto:** intervenir sobre susceptibilidad/huésped dentro de la cadena de transmisión.', 122)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('09fbb5a6-86be-5b2a-ad1d-e67415b951a7', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_123', 'Caso 7', 'Estudiante afirma que MINSA y CSS ya son una sola institución nacional.

**Error:** la integración funcional es gradual y continúa en proceso en 2026.', 123)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b2f762d4-dd96-5fca-9799-649a5597e4e5', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_124', 'Caso 8', 'Se pregunta cuál institución ejerce rectoría sanitaria nacional.

**Respuesta:** MINSA.', 124)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('73af1f72-aaa4-56bf-9089-d0e8c1b93405', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_125', 'Caso 9', 'Pregunta solicita política sanitaria vigente del período del examen.

**Respuesta:** Política Nacional de Salud 2026–2035, aprobada por Decreto Ejecutivo No. 17 de 23 de marzo de 2026.', 125)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5c32679a-7c3b-503d-8909-48f911cbd71e', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_126', 'Caso 10', 'Persona con dificultad para trasladarse necesita seguimiento en su hogar.

**Intervención posible:** visita domiciliaria según criterios del programa.', 126)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5bbbb713-60ea-5b7f-8ade-da6b42179e71', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_127', 'Caso 11', 'Enfermera registra vacunaciones y analiza población pendiente.

**Roles:** atención + vigilancia + gestión de cobertura.', 127)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fc498e88-2292-5f6b-8352-4ab1298082c2', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_128', 'Caso 12', 'Durante visita se detectan problemas de vivienda y barreras sociales.

**Conducta:** documentar, educar y coordinar intervenciones/referencias pertinentes.

---', 128)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9b9c7520-a1e9-592f-b945-da232f2dec33', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_129', '63. Errores frecuentes', '1. Confundir salud con ausencia de enfermedad.
2. Confundir salud pública con atención hospitalaria.
3. Confundir incidencia y prevalencia.
4. Confundir mortalidad y letalidad.
5. Usar denominadores incorrectos.
6. Confundir vector con agente.
7. Confundir reservorio con huésped susceptible.
8. Aplicar medidas de transmisión sin conocer la vía.
9. Decir que MINSA y CSS ya están completamente unificados.
10. Presentar metas de la política 2026–2035 como logros consumados.
11. Reducir enfermería a vacunación.
12. Realizar visita domiciliaria sin objetivo, registro o seguimiento.

---', 129)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('07e604d3-cf91-53c5-8123-26a5de1205c8', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_130', '64. Qué memorizar', '**Salud pública = acción sobre la salud de poblaciones.**

**Incidencia = casos nuevos.**

**Prevalencia = casos existentes.**

**Mortalidad = muertes/población.**

**Letalidad = muertes/casos.**

**Tríada = agente + huésped + ambiente.**

**Cadena = agente → reservorio → salida → transmisión → entrada → huésped susceptible.**

**MINSA = Autoridad Sanitaria Nacional / rectoría.**

**CSS = institución autónoma del sistema público.**

**Integración MINSA–CSS = proceso gradual en curso en 2026.**

**Política vigente para el temario = Política Nacional de Salud 2026–2035.**

**Enfermería = promoción + prevención + atención + vigilancia + educación + gestión + comunidad.**

**Visita domiciliaria = valoración e intervención en el entorno de persona/familia con objetivo y seguimiento.**

---', 130)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8b33094d-2c95-5767-8ccd-4892ab66f975', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_131', '65. Fuentes', '', 131)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ac1eb043-dae1-5f2e-a202-c12c2778b72d', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_132', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 132)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('14201e15-6b51-5dad-a203-37199646c01b', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_133', 'Epidemiología e indicadores', '**Centers for Disease Control and Prevention. Principles of Epidemiology in Public Health Practice.**

**CDC. Chain of Infection Components.**', 133)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aa675996-f67a-5a84-9608-605d06d54ae8', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_134', 'Panamá', '**MINSA / Gaceta Oficial Digital. Decreto Ejecutivo No. 17 de 23 de marzo de 2026 — Política Nacional de Salud 2026–2035. Gaceta Oficial No. 30491-C, 26 de marzo de 2026.**

**MINSA. Política Nacional de Salud, sus objetivos estratégicos y líneas de acción para el periodo 2026–2035. Publicación institucional, 21 de julio de 2026.**

**MINSA. Decreto de Gabinete No. 1 de 15 de enero de 1969 — creación, estructura y funciones del Ministerio de Salud.**

**Caja de Seguro Social. Texto Único de la Ley 51 de 2005, Orgánica de la CSS, con reformas vigentes incluida la Ley 462 de 2025.**

**MINSA. Decreto Ejecutivo No. 26 de 26 de noviembre de 2025 — crea la Comisión de Integración de los Servicios Públicos de Salud.**

**MINSA. Indicadores de Salud.**

**MINSA. Estadísticas de Salud.**

**MINSA. Programas.**

**MINSA. Cartera de servicio por nivel de atención.**

**MINSA. Enfermería: Pilar fundamental en la salud pública. 16 de mayo de 2025.**

**MINSA. Instalan Comisión para la Integración de los servicios de salud entre MINSA-CSS. 26 de enero de 2026.**

**MINSA. Integración del sistema público de salud avanza en Chiriquí y Bocas del Toro. 14 de agosto de 2026.**

**MINSA. Equipo de Salud de Pueblo Nuevo fortalece la atención integral con visitas domiciliarias. 22 de mayo de 2026.**

**MINSA. Normas, Protocolos y Guías de Atención – Programa de Adulto Mayor: Orientaciones técnicas sobre la visita domiciliaria.**

---', 134)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7b12bbc8-286a-56a6-b73b-536e79967995', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_135', '65A. Resultado de auditoría documental 2026-09-10', 'Se realizó una segunda revisión enfocada en los elementos de mayor riesgo normativo de PUBLIC-08.', 135)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('42f17a70-0bc7-55d8-b976-4cccf638eed8', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_136', 'Confirmado con fuentes oficiales vigentes', '- Creación del MINSA: Decreto de Gabinete No. 1 de 15 de enero de 1969.
- MINSA como ente rector del sector salud: Decreto Ejecutivo No. 17 de 23 de marzo de 2026.
- Política Nacional de Salud 2026–2035 publicada en Gaceta Oficial No. 30491-C el 26 de marzo de 2026.
- CSS mantiene marco legal institucional propio; el texto único de su Ley Orgánica incorpora la reforma de Ley 462 de 2025.
- Comisión de Integración de los Servicios Públicos de Salud: Decreto Ejecutivo No. 26 de 26 de noviembre de 2025.
- Inicio de integración en Herrera y Los Santos: enero de 2026.
- Expansión a Chiriquí y Bocas del Toro: confirmada por MINSA en agosto de 2026.
- El proceso de integración sigue siendo gradual y no debe enseñarse como un sistema nacional ya completamente unificado.
- La cartera oficial MINSA mantiene múltiples niveles/tipos de instalaciones y programas nacionales.
- La visita domiciliaria continúa utilizándose en 2026 con participación de enfermería.', 136)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0847112e-9582-5959-9a23-e49f25f49bfb', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_137', 'Ajustes realizados', '- Se precisó el fundamento legal de la rectoría del MINSA.
- Se aclaró la autonomía institucional vigente de la CSS.
- Se reforzó que integración funcional no equivale a fusión institucional completa.
- Se actualizaron nombres de programas conforme al directorio actual del MINSA.
- Se precisó la publicación oficial de la Política Nacional 2026–2035.

El contenido permanece en `REVIEW` hasta concluir la auditoría integral de Salud Pública.

---', 137)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8012b4ea-a3ac-5c0e-ba47-36f44ec05013', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_138', '66. Control de calidad', 'Este paquete:

- cubre todos los subtemas expresos de PUBLIC-08;
- incluye indicadores epidemiológicos fundamentales y denominadores;
- diferencia incidencia, prevalencia, mortalidad y letalidad;
- desarrolla tríada y cadena epidemiológica;
- actualiza la Política Nacional de Salud a 2026–2035;
- describe correctamente la integración MINSA–CSS como proceso en curso;
- integra programas y rol de enfermería;
- desarrolla visita domiciliaria sin inventar un protocolo universal;
- contiene 12 casos originales;
- mantiene estado `REVIEW`.

---', 138)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('970dd812-fdc0-59cb-ba34-b174743318e8', 'bed0e240-be6f-521a-8733-05dc084c041f', 'sec_139', '67. Estado para integración', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- verificar cualquier actualización posterior a septiembre de 2026 sobre integración MINSA–CSS;
- contrastar procedimientos específicos de visita con la norma del programa aplicable;
- validar esquemas, dosis o protocolos clínicos en sus normas específicas;
- enlazar PUBLIC-09, PUBLIC-10, PUBLIC-11, PUBLIC-12 y PUBLIC-13.', 139)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4b8e1d66-e49f-5450-97fc-6baeb1ddfacb', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_1', 'Promoción de la Salud', '**Área:** Salud Pública  
**Código:** PUBLIC-09  
**area_code:** `PUBLIC_HEALTH`  
**Estado académico:** `REVIEW`  
**Versión:** 1  
**Revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b9e3304c-84be-5ce6-b165-ea38108dbc90', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_2', '1. Alcance oficial CICDE', 'El CICDE 2026 incluye expresamente:

**“Promoción de la Salud”.**

Subtema:

- **Educación para la salud.**

Este módulo desarrolla el alcance desde la Carta de Ottawa, el enfoque contemporáneo OMS/OPS y el contexto panameño actual.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ed13c4c3-a946-57f3-9bf4-df6a41a610bb', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_3', '2. Objetivos de aprendizaje', 'El estudiante debe poder:

1. Definir promoción de la salud.
2. Diferenciar promoción de la salud, prevención de enfermedad y educación para la salud.
3. Reconocer las cinco áreas de acción de la Carta de Ottawa.
4. Explicar abogar, facilitar y mediar como estrategias de promoción.
5. Relacionar promoción con determinantes sociales y equidad.
6. Identificar entornos promotores de salud.
7. Explicar el papel de la participación comunitaria.
8. Diseñar educación para la salud centrada en necesidades.
9. Aplicar alfabetización en salud y teach-back.
10. Evaluar aprendizaje y resultados.
11. Reconocer el papel de enfermería.
12. Relacionar la promoción con la Política Nacional de Salud 2026–2035 de Panamá.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f05b6cda-a68f-537b-bde7-edd7ecc03769', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_4', '3. ¿Qué es promoción de la salud?', 'La OMS define la **promoción de la salud** como el proceso de permitir que las personas aumenten el control sobre su salud y la mejoren.', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b53c298a-2b08-5407-a5f6-3c43957efc47', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_5', 'Clave', 'No significa solamente dar información.

Incluye modificar:

- capacidades personales;
- condiciones sociales;
- ambientes;
- políticas;
- servicios;
- oportunidades.

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a6540526-cc86-5f5b-a5ad-fa184218a44b', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_6', '4. Promoción vs prevención vs educación', '', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('65fa4c3b-d6e8-59bc-b583-11080ddb8538', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_7', 'Promoción de la salud', 'Busca aumentar capacidades, control, bienestar y condiciones saludables.', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f6ea1f1f-2b38-5900-bdbf-e755e0c51cac', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_8', 'Prevención de enfermedad', 'Busca reducir aparición, detectar temprano o limitar consecuencias de enfermedad.', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f6a8aa93-c25d-5623-a77f-4a910687894d', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_9', 'Educación para la salud', 'Es una herramienta que facilita conocimientos, habilidades y decisiones.', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2b7ebc95-9b27-525f-941e-766f2571dcb8', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_10', 'Clave de examen', '**Educación es parte de la promoción, pero promoción no es solo educación.**

---', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('db7b0f2e-c5d6-54ec-83e0-1662e24acdaf', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_11', '5. Carta de Ottawa', 'La Carta de Ottawa de 1986 es un marco fundamental de promoción de la salud.

Plantea cinco áreas de acción:

1. Construir políticas públicas saludables.
2. Crear entornos favorables.
3. Fortalecer la acción comunitaria.
4. Desarrollar habilidades personales.
5. Reorientar los servicios de salud.

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('04ad150d-ecb8-5eee-ad35-07f6340a3bc6', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_12', '6. Políticas públicas saludables', 'Una política saludable incorpora la salud en decisiones de diferentes sectores.

Ejemplos:

- transporte seguro;
- espacios libres de humo;
- regulación alimentaria;
- urbanismo saludable;
- agua y saneamiento.', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ecf808bd-da5c-5f20-9c3b-f157d3e8a98a', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_13', 'Clave', 'La promoción de salud trasciende el sector sanitario.

---', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5e00816b-edea-50fa-bd83-8953cf0a106d', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_14', '7. Entornos favorables', 'La salud se crea en los lugares donde las personas:

- viven;
- estudian;
- trabajan;
- juegan;
- se relacionan.

Entornos relevantes:

- hogar;
- escuela;
- trabajo;
- comunidad;
- ciudad;
- servicios de salud.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e0d3320f-858c-55a2-a2ea-9fafbb6dcf86', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_15', '8. Acción comunitaria', 'Fortalecer la acción comunitaria significa que la población participa en:

- identificar necesidades;
- priorizar problemas;
- planificar;
- ejecutar;
- evaluar.', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('14130cab-a2fe-5e45-9ce7-e2e0822f9676', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_16', 'Error', 'Confundir participación con convocar a la comunidad solo para escuchar una charla.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c91a555e-e52f-5a2a-862a-a3ebd74b6fd1', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_17', '9. Habilidades personales', 'Incluyen capacidades para:

- comprender información;
- tomar decisiones;
- resolver problemas;
- autocuidarse;
- comunicarse;
- buscar ayuda;
- reducir riesgos.

La educación para la salud es una herramienta central.

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('45225d92-b530-5434-a009-dcf2bd947688', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_18', '10. Reorientar los servicios de salud', 'Los servicios deben ir más allá de tratar enfermedad e incorporar:

- promoción;
- prevención;
- participación;
- equidad;
- continuidad;
- determinantes sociales.', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ba47f27b-2094-57ca-af48-94b760282ae3', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_19', 'Enfermería', 'Tiene una posición estratégica por su contacto continuo con personas, familias y comunidades.

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d2ea5d08-419f-5e9e-a877-b89fa3c1f7a4', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_20', '11. Estrategias de Ottawa', 'La OMS resume tres estrategias básicas:', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('302364d8-d487-556b-8856-fb9b5a0d4231', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_21', 'Abogar', 'Defender condiciones favorables para la salud.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3b698b67-df5a-5a80-9a94-74881c29ca81', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_22', 'Facilitar', 'Dar oportunidades y recursos para reducir inequidades.', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('36d5ce45-9976-5d24-98e5-64e3e366f1ad', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_23', 'Mediar', 'Coordinar intereses y sectores diferentes.

---', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('50da74d1-a783-55f2-b45d-f3cfaa5c06e0', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_24', '12. Equidad y promoción', 'Promover salud implica reconocer que no todas las personas tienen iguales oportunidades.

Pueden existir barreras por:

- ingreso;
- educación;
- territorio;
- discapacidad;
- género;
- idioma;
- discriminación;
- transporte.', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2855fa1f-ea7a-5e5c-a37b-987299ca0f28', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_25', 'Clave', 'Una intervención idéntica para todos no siempre produce resultados equitativos.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0e0c9b65-af63-5f19-9328-1af5a7d7bebe', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_26', '13. Determinantes sociales', 'La promoción de salud debe actuar sobre condiciones como:

- vivienda;
- empleo;
- educación;
- ambiente;
- alimentación;
- transporte;
- apoyo social;
- acceso a servicios.', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d537e8b2-bc0d-52f6-b639-31a66cd0d418', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_27', 'Ejemplo', 'Recomendar ejercicio sin disponer de espacios seguros puede ser insuficiente.

---', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e6168be1-2e14-5938-a70c-5be238328f02', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_28', '14. Carta de Ginebra para el Bienestar', 'La OMS adoptó en 2021 la Carta de Ginebra para el Bienestar, construida sobre el legado de Ottawa.

Promueve sociedades orientadas al bienestar mediante:

- economía equitativa;
- políticas para el bien común;
- cobertura sanitaria universal;
- transformación digital responsable;
- protección del planeta.', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ecbfdb4f-e9ab-5a4d-bbbf-030461477366', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_29', 'Clave', 'La promoción moderna integra bienestar, equidad y sostenibilidad.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('05b00d62-2f08-514c-9b1e-49adecf6e633', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_30', '15. Promoción en las Américas', 'OPS describe la promoción como un enfoque:

- participativo;
- intersectorial;
- sensible al contexto;
- multinivel;
- centrado en capacidades y fortalezas.

Su estrategia regional 2019–2030 se vincula con los Objetivos de Desarrollo Sostenible.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f8d88c8a-61c6-583f-8ab8-d1b9d10f2939', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_31', '16. Entornos saludables', 'Un entorno saludable facilita decisiones beneficiosas.

Ejemplos:', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e99e71de-9498-5506-8747-f6bdff4d5150', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_32', 'Escuela', '- actividad física;
- alimentación;
- salud mental;
- prevención de violencia.', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9223297d-bdd1-5b8a-8b9c-e03ef944e981', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_33', 'Trabajo', '- seguridad;
- bienestar;
- ergonomía;
- salud mental.', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aa8b9e60-f6d0-5e62-8eee-2a9f90af1357', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_34', 'Comunidad', '- agua;
- transporte;
- espacios públicos;
- seguridad.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0e9c54ba-941c-5467-9c40-49aedb01d38c', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_35', '17. Promoción a lo largo del curso de vida', 'Las prioridades cambian según etapa:', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2bf476fd-c718-52cf-bfbf-4409c296323b', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_36', 'Niñez', '- desarrollo;
- nutrición;
- vacunación;
- hábitos.', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5a5123d1-e98d-54f9-bd47-d16606394be0', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_37', 'Adolescencia', '- salud mental;
- sexualidad responsable;
- actividad física;
- prevención de sustancias.', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a6186a2b-d6f5-5629-a845-2498ed06d907', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_38', 'Adulto', '- crónicos;
- salud laboral;
- actividad física;
- alimentación.', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a0e03381-100d-584a-8a79-1436bd9b3857', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_39', 'Adulto mayor', '- funcionalidad;
- prevención de caídas;
- apoyo social;
- envejecimiento saludable.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0dd269cf-b42f-5378-9516-cec9e64af345', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_40', '18. Educación para la salud', 'Es un proceso planificado para facilitar aprendizaje y decisiones informadas.

Puede abordar:

- conocimientos;
- actitudes;
- habilidades;
- autocuidado;
- prevención;
- uso de servicios.', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('71116857-8c60-5c94-820e-828ffb90efc4', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_41', 'Clave', 'El objetivo no es “hablar mucho”, sino producir aprendizaje útil.

---', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8b2f1c27-2155-53d1-9842-bb1801253b47', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_42', '19. Valoración educativa', 'Antes de educar, valorar:

- qué sabe la persona;
- qué necesita;
- qué quiere aprender;
- idioma;
- cultura;
- alfabetización;
- capacidad sensorial/cognitiva;
- disponibilidad;
- barreras.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ee13e658-3186-52ea-bb0c-86bd7d41dcaa', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_43', '20. Objetivos educativos', 'Deben ser claros y medibles.

Ejemplo débil:

“Comprender la diabetes.”

Ejemplo mejor:

“Al finalizar, la persona explicará dos signos de hipoglucemia y qué acción inicial debe realizar.”', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4c54bf33-a8d5-57e7-9291-13a90c07a317', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_44', 'Clave', 'El objetivo describe lo que podrá hacer el estudiante/paciente.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ebff1934-5dca-540c-be10-ecb58b897bc7', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_45', '21. Dominios del aprendizaje', '', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('484c7230-8bb0-59dc-9498-d936eac0cae2', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_46', 'Cognitivo', 'Conocimiento y comprensión.', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f227eb98-e5ec-50cf-b183-aa38af966816', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_47', 'Psicomotor', 'Habilidades prácticas.', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('911b2463-a500-50d7-a513-5b00b59360b1', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_48', 'Afectivo', 'Valores, actitudes y disposición.', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('96e6a66d-b2aa-505b-8d1f-ff8403477ea1', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_49', 'Ejemplo', 'Aprender a usar un inhalador requiere componente psicomotor, no solo explicación verbal.

---', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2805b3e7-b35f-50ad-bca5-455c608c7181', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_50', '22. Métodos educativos', 'Pueden incluir:

- conversación individual;
- demostración;
- retorno-demostración;
- grupos;
- material visual;
- simulación;
- medios digitales;
- visitas domiciliarias.

La estrategia depende del objetivo y población.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3cc14136-875c-54d6-ace9-916232ba69a0', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_51', '23. Teach-back', 'El **teach-back** verifica comprensión pidiendo a la persona que explique con sus propias palabras lo aprendido.

No debe formularse como examen o regaño.

Ejemplo:

“Para asegurarme de que lo expliqué claramente, ¿cómo va a tomar este medicamento en casa?”', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9194ac08-c784-5e5c-a284-e74b3fe540a1', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_52', 'Clave', 'Evalúa también la claridad del educador.

---', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e7982adb-3f9d-50e7-9405-bf749eca8001', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_53', '24. Retorno-demostración', 'Se utiliza para habilidades prácticas.

Ejemplos:

- inhalador;
- cuidado de herida;
- aplicación de insulina;
- uso de equipo.

La persona demuestra la técnica y el profesional corrige de manera segura.

---', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8515a911-bce7-5597-93f9-8da08737d9c2', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_54', '25. Alfabetización en salud', 'Es la capacidad de acceder, comprender, valorar y utilizar información y servicios para tomar decisiones de salud.

Barreras pueden incluir:

- vocabulario técnico;
- lectura limitada;
- formularios complejos;
- información contradictoria;
- acceso digital.

---', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('54d2cf8a-7288-5868-9994-28e57bda91ef', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_55', '26. Comunicación clara', 'Buenas prácticas:

- lenguaje sencillo;
- frases cortas;
- priorizar mensajes;
- ejemplos concretos;
- imágenes cuando ayuden;
- confirmar comprensión.', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('13e59a71-4b8c-5b6a-8843-8b76aa0fc170', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_56', 'Error', 'Usar lenguaje técnico para “verse profesional” sin comprobar si la persona entiende.

---', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d8b89559-110e-57ef-831c-be9729970a87', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_57', '27. Educación individual', 'Ventajas:

- personalización;
- privacidad;
- adaptación al ritmo;
- aclaración de dudas.

Útil para:

- medicamentos;
- autocuidado;
- alta;
- temas sensibles.

---', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5d90ad6a-c1b9-526f-9d15-f6518f082291', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_58', '28. Educación grupal', 'Ventajas:

- intercambio;
- apoyo;
- eficiencia;
- aprendizaje entre pares.

Requiere:

- objetivos;
- facilitación;
- espacio;
- respeto;
- participación.

---', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('565dbea4-d75b-508f-88e1-ef7b15a14b35', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_59', '29. Educación comunitaria', 'Debe partir de:

- diagnóstico;
- necesidades reales;
- prioridades locales;
- recursos;
- participación.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c68ed6f6-abe8-54b0-8847-828dec7a75c0', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_60', 'Clave', 'No se diseña solo desde el escritorio.

---', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7699253c-f6c8-5b1c-8f32-c1a8f8987a98', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_61', '30. Cultura', 'La educación debe respetar:

- valores;
- idioma;
- creencias;
- prácticas;
- decisiones informadas.

Adaptar no significa aceptar prácticas peligrosas sin discusión; significa comunicar con respeto y negociar alternativas seguras.

---', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('51aad10f-0924-501b-9eae-2c053dab0e0a', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_62', '31. Motivación y cambio de conducta', 'Saber qué hacer no garantiza hacerlo.

Influyen:

- confianza;
- apoyo;
- recursos;
- barreras;
- hábitos;
- entorno;
- percepción de riesgo.', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d89a03e8-2829-50f9-a4de-db1ce6e4d655', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_63', 'Clave', 'La promoción debe crear condiciones que hagan la opción saludable más posible.

---', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4ac64729-3305-58c8-a2f6-8f90e9c5f08c', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_64', '32. Autocuidado', 'La educación puede fortalecer:

- reconocimiento de síntomas;
- uso correcto de medicamentos;
- seguimiento;
- alimentación;
- actividad física;
- prevención;
- búsqueda oportuna de atención.

---', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('51c26fbf-1af0-5dd2-8188-3ae8f0fc6b65', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_65', '33. Educación al alta', 'Debe priorizar:

- qué problema tiene;
- medicamentos;
- señales de alarma;
- cuidados;
- restricciones;
- citas;
- a quién contactar.', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4d04f42c-697e-50a0-8135-fc73c808dac4', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_66', 'Clave', 'No entregar un documento sin verificar comprensión.

---', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('59d4f72c-b7cb-5d87-adc2-8a2525010579', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_67', '34. Familia y cuidadores', 'Pueden ser aliados cuando:

- la persona lo autoriza;
- es apropiado;
- respetan autonomía y privacidad.

Son especialmente importantes en:

- niñez;
- dependencia;
- discapacidad;
- deterioro cognitivo;
- enfermedad crónica.

---', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f33c9e76-73b9-58be-ba90-c30a2722f898', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_68', '35. Evaluación de la educación', 'Evaluar:

- comprensión;
- demostración;
- conducta;
- adherencia;
- cobertura;
- indicadores;
- necesidad de refuerzo.', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9b6afa82-5682-5093-b97c-373d53c301d1', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_69', 'Clave', '“Se brindó educación” no demuestra aprendizaje.

---', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('11883158-d14a-5e6f-a217-77024c3f9745', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_70', '36. Panamá — Plan de Promoción 2016–2025', 'El CICDE cita el **Plan Nacional de Promoción de la Salud 2016–2025** de MINSA.

Ese documento es útil como referencia histórica y bibliográfica del temario.', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('76418e69-f608-5dbd-a8a6-7fb90b94304d', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_71', 'Precaución temporal', 'En 2026 su período nominal ya terminó, por lo que no debe presentarse como el plan nacional vigente del período actual sin una extensión o actualización oficial.

---', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bdb21923-32ce-55b6-9783-82815c249d08', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_72', '37. Panamá — marco vigente 2026–2035', 'La **Política Nacional de Salud 2026–2035**, aprobada mediante Decreto Ejecutivo No. 17 de 23 de marzo de 2026, constituye el marco nacional vigente para contextualizar la promoción de la salud.

La política incorpora:

- promoción;
- prevención;
- equidad;
- participación social;
- determinantes de la salud;
- atención primaria;
- derecho a la salud.', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a6f18bd1-6355-5680-9466-1fdd3aa35b93', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_73', 'Clave', 'El **Plan Nacional de Promoción de la Salud 2016–2025** sigue siendo bibliografía explícita del CICDE, pero su período nominal terminó. Para el contexto normativo de 2026 debe distinguirse del marco nacional vigente 2026–2035.

---', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('74814249-ba1a-5eb9-b6f5-4c6422570d27', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_74', '38. Panamá — promoción actual', 'La Dirección de Promoción de la Salud del MINSA mantiene acciones educativas y campañas sobre temas como:

- obesidad;
- actividad física;
- dengue;
- tabaco;
- alimentación;
- prevención cardiovascular.

En septiembre de 2026 MINSA lanzó **“Cuida tu corazón 2026”**, con educación sobre actividad física, alimentación, descanso, hidratación y reducción de factores de riesgo.', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ddab6c89-87ab-581e-b3f9-d6ecbca286f8', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_75', 'Clave', 'Es un ejemplo actual de promoción y prevención en el territorio.

---', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7300c55b-93cd-514c-aeca-9f78bbf2482f', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_76', '39. Rol de enfermería en promoción', 'Puede incluir:

- valoración educativa;
- consejería;
- educación;
- participación comunitaria;
- detección de barreras;
- promoción de autocuidado;
- trabajo escolar;
- visita domiciliaria;
- coordinación intersectorial;
- evaluación.

---', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5d6737a7-b63b-5bab-87d1-df5a7674dba8', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_77', '40. PAE aplicado a educación/promoción', '', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c92bb26e-cf3f-5572-9c1b-31a697936e4f', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_78', 'Valoración', '- conocimientos;
- necesidades;
- recursos;
- barreras.', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('17ee3df1-bf39-5c08-8260-d303e851f82a', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_79', 'Identificación', '- déficit de conocimiento;
- riesgo;
- disposición para aprender;
- problemas comunitarios.', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c3cbbb33-7f40-5615-be79-c469ca6ddd2e', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_80', 'Planificación', '- objetivos;
- método;
- recursos;
- tiempo.', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('62d0156d-8cbc-51c8-afeb-a27b2df84916', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_81', 'Implementación', '- educación;
- demostración;
- participación.', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d8e9fb68-2368-5d1f-84e9-cb7906cf0a9a', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_82', 'Evaluación', '- teach-back;
- retorno-demostración;
- indicadores;
- seguimiento.

---', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('21d043b1-dcd4-5385-bd66-a5183f6bd70e', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_83', '41. Casos tipo examen', '1. Enfermera da una charla sin valorar necesidades. **Problema:** educación no individualizada.
2. Paciente repite con sus palabras cómo tomará medicamentos. **Método:** teach-back.
3. Persona demuestra cómo usar inhalador. **Método:** retorno-demostración.
4. Municipio crea ciclovías y parques. **Área Ottawa:** entornos favorables/política saludable.
5. Comunidad participa en decisiones. **Área Ottawa:** fortalecer acción comunitaria.
6. Escuela enseña habilidades de autocuidado. **Área Ottawa:** desarrollar habilidades personales.
7. Servicio incorpora prevención y trabajo comunitario. **Área Ottawa:** reorientar servicios.
8. Programa cambia normas de alimentos escolares. **Área Ottawa:** política pública saludable.
9. Educación usa términos que la persona no entiende. **Problema:** baja adecuación a alfabetización en salud.
10. Se registra “educado” sin verificar comprensión. **Problema:** no se evaluó aprendizaje.
11. Programa adapta intervención a barreras rurales. **Principio:** equidad/contexto.
12. Campaña involucra salud, escuelas y municipios. **Principio:** intersectorialidad.

---', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e5034aad-4f22-581c-bf87-ef034de32ac1', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_84', '42. Errores frecuentes', '1. Promoción = charla.
2. Promoción = prevención.
3. Educación = entregar folleto.
4. No valorar necesidades.
5. Usar lenguaje técnico.
6. No comprobar comprensión.
7. Dar una intervención idéntica a todos.
8. Ignorar cultura.
9. Culpar a la persona por barreras estructurales.
10. No involucrar comunidad.
11. Confundir actividad realizada con resultado.
12. Presentar el Plan 2016–2025 como automáticamente vigente en 2026.

---', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f9d4f815-c4e9-50c7-b006-167e208ae54a', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_85', '43. Qué memorizar', '**Promoción = aumentar control sobre la propia salud y mejorarla.**

**Educación es una herramienta de promoción.**

**Ottawa: políticas saludables + entornos favorables + acción comunitaria + habilidades personales + reorientación de servicios.**

**Estrategias: abogar + facilitar + mediar.**

**Teach-back = explicar con sus propias palabras.**

**Retorno-demostración = demostrar una habilidad.**

**Promoción = personas + comunidades + ambientes + políticas.**

**En 2026, el Plan MINSA 2016–2025 es referencia histórica del CICDE; la Política Nacional 2026–2035 aporta el marco nacional vigente.**

---', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a465be13-f715-540d-8d48-08d834c59cb9', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_86', '44. Fuentes', '', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a8f6a3c8-825b-53d9-8431-75bcdc317af4', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_87', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7762aec1-92ea-594d-a718-673f9eeaf125', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_88', 'Bibliografía CICDE', '**MINSA. Plan Nacional de Promoción de la Salud 2016–2025.**', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('841e76d5-0e94-573e-9e02-9363420c77c5', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_89', 'Complementarias', '**World Health Organization. Ottawa Charter for Health Promotion. 1986.**

**World Health Organization. Health Promotion.**

**World Health Organization. Geneva Charter for Well-being. 2021.**

**Pan American Health Organization. Health Promotion. Estrategia regional 2019–2030.**', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ee213689-e17c-54bd-9384-ee24ea089bbd', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_90', 'Panamá actual', '**MINSA. Política Nacional de Salud 2026–2035.**

**MINSA. Dirección de Promoción de la Salud.**

**MINSA. Campaña Cuida tu Corazón 2026. 3 de septiembre de 2026.**

---', 90)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('873a9f48-5cf0-5d50-9852-6e438f8943a7', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_91', '45. Control de calidad', '- Cubre Promoción de la Salud y Educación para la salud.
- Conserva el marco clásico de Ottawa.
- Integra Carta de Ginebra y enfoque OPS.
- Distingue promoción, prevención y educación.
- Incluye alfabetización, teach-back y retorno-demostración.
- Maneja correctamente el Plan MINSA 2016–2025 como referencia ya concluida temporalmente.
- Usa la Política Nacional 2026–2035 como marco actual.
- Incluye 12 casos originales.
- Estado `REVIEW`.

---', 91)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f9d0afa7-d62e-559c-8d1c-1aaa55155dec', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_92', '46. Estado', '**Estado recomendado:** `REVIEW`

Antes de `SOURCE_VALIDATED` o nivel equivalente:

- mantener la distinción entre bibliografía CICDE y marco nacional vigente;
- comprobar si MINSA publica posteriormente un plan específico de promoción que sustituya formalmente al plan 2016–2025;
- enlazar PUBLIC-07, PUBLIC-08 y PUBLIC-10.', 92)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bc9159ee-1271-56ac-9ede-a02ad1b3e057', 'a1c66bde-690a-5d66-ac0e-1177382a549e', 'sec_93', 'Resultado de auditoría documental 2026-09-10', 'Se reconfirmó:

- definición OMS de promoción de la salud;
- cinco áreas de acción y tres estrategias de la Carta de Ottawa;
- Carta de Ginebra para el Bienestar de 2021;
- Estrategia y Plan de Acción de OPS sobre Promoción de la Salud 2019–2030;
- existencia oficial del Plan Nacional de Promoción de la Salud 2016–2025 de MINSA;
- vigencia de la Política Nacional de Salud 2026–2035 como marco nacional actual;
- lanzamiento de la campaña **Cuida tu Corazón 2026** el 3 de septiembre de 2026.

No se detectaron errores conceptuales mayores. Se reforzó únicamente la distinción temporal entre el plan 2016–2025 y la política vigente 2026–2035.', 93)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0c5825b6-9630-52fe-af06-95341a420e3a', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_1', 'Prevención de la Enfermedad', '**Área:** Salud Pública  
**Código:** PUBLIC-10  
**area_code:** `PUBLIC_HEALTH`  
**Estado académico:** `REVIEW`  
**Versión:** 1  
**Revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('820bda2f-9035-5519-abfe-87c555556910', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_2', '1. Alcance oficial CICDE', 'El CICDE 2026 incluye expresamente:

**“Prevención de la Enfermedad”.**

Subtemas:

- **Niveles de prevención.**
- **Papel de la enfermera en los diferentes niveles de prevención.**

Para este módulo se utiliza la clasificación clásica de prevención primaria, secundaria y terciaria, claramente diferenciada de promoción de la salud.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ab10db05-0917-531c-8077-d28c137769d4', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_3', '2. Objetivos de aprendizaje', 'El estudiante debe poder:

1. Definir prevención de enfermedad.
2. Diferenciar promoción y prevención.
3. Explicar prevención primaria, secundaria y terciaria.
4. Identificar el momento del proceso salud-enfermedad en que actúa cada nivel.
5. Clasificar vacunación dentro de prevención primaria.
6. Clasificar tamizaje y detección temprana dentro de prevención secundaria.
7. Clasificar rehabilitación y prevención de complicaciones dentro de prevención terciaria.
8. Reconocer que no todo tamizaje es beneficioso para toda población.
9. Reconocer la importancia de factores de riesgo y grupos vulnerables.
10. Explicar el papel de enfermería en cada nivel.
11. Aplicar prevención a enfermedades transmisibles y no transmisibles.
12. Relacionar la prevención con políticas y acciones vigentes de Panamá.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d78be1f1-f6f7-5646-be50-7b15969f4087', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_4', '3. ¿Qué es prevención de enfermedad?', 'La prevención busca disminuir:

- aparición de enfermedad;
- progresión;
- complicaciones;
- discapacidad;
- mortalidad.

Puede actuar:

- antes de que aparezca la enfermedad;
- en etapas tempranas;
- después del diagnóstico para limitar daño.

---', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('11eace86-b434-50bf-87d3-54851f7c80cf', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_5', '4. Promoción vs prevención', '', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('84686199-3dfc-5104-aa9f-104366dd6c05', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_6', 'Promoción', 'Busca mejorar salud, bienestar, capacidades y condiciones saludables.', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('09b6649a-aa80-5c4a-9e38-860cbdc84ff7', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_7', 'Prevención', 'Busca reducir riesgo, detectar enfermedad temprana o limitar consecuencias.', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('645b88bd-42e5-54a8-9800-167fc49e26a5', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_8', 'Ejemplo', 'Crear un parque seguro puede ser promoción.

Vacunar contra una enfermedad prevenible es prevención primaria.

Realizar un tamizaje validado es prevención secundaria.

Rehabilitar después de un accidente cerebrovascular es prevención terciaria.

---', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aeb47a86-a4d6-54dd-809f-fe381af13c02', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_9', '5. Historia natural de la enfermedad', 'El modelo clásico considera:', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('df65a295-065d-5158-8f0e-f2e8ca069020', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_10', 'Período prepatogénico', 'Aún no se manifiesta la enfermedad.', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a8742146-908a-535b-ab94-bb13ef1df86e', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_11', 'Período patogénico', 'El proceso ya se ha iniciado.

Puede existir:
- fase subclínica;
- manifestaciones clínicas;
- secuelas.

Los niveles de prevención se relacionan con estas fases.

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ac2173c2-3349-564f-9c99-91e6e462bdee', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_12', '6. Prevención primaria', 'Actúa **antes de que aparezca la enfermedad o evento adverso**.

Objetivo:

- evitar aparición;
- reducir exposición;
- aumentar protección.

Ejemplos:

- vacunación;
- control de vectores;
- agua segura;
- preservativo;
- prevención de tabaquismo;
- seguridad vial;
- reducción de riesgos ocupacionales.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b1e007f8-0d49-598d-86bc-237a315d79d6', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_13', '7. Promoción dentro de prevención primaria', 'Muchas acciones de promoción pueden contribuir a prevención primaria.

Ejemplos:

- alimentación saludable;
- actividad física;
- educación antitabaco;
- entornos saludables.', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('50425cb7-e049-5952-a088-f256f2db21a6', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_14', 'Clave', 'Promoción y prevención se superponen en la práctica, pero conceptualmente no son idénticas.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4eec0f56-eff0-54d4-9bac-301ec524a60c', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_15', '8. Protección específica', 'Dentro del enfoque clásico de prevención primaria, la protección específica incluye medidas dirigidas a riesgos concretos.

Ejemplos:

- inmunización;
- equipos de protección;
- preservativo;
- fluoruración según política;
- control de exposición ocupacional.

---', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dafd0007-8c69-5b18-a543-87d25e52d92f', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_16', '9. Vacunación', 'La vacunación es un ejemplo clásico de prevención primaria porque busca impedir o disminuir la enfermedad antes de que aparezca.

Enfermería participa en:

- valoración;
- administración;
- educación;
- cadena de frío;
- registro;
- cobertura;
- vigilancia de eventos.', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8e50b61b-647c-5dbc-9005-7405f3d2b41b', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_17', 'Precaución', 'El esquema debe seguir la norma nacional vigente.

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('217070ba-6152-5abe-8a9f-5131985d3916', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_18', '10. Prevención primaria en enfermedades transmisibles', 'Ejemplos:

- vacunación;
- agua segura;
- higiene;
- saneamiento;
- control vectorial;
- preservativo;
- control de exposición;
- bioseguridad.

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3e5d4a2a-ab64-5c15-a63d-71a37ab12149', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_19', '11. Prevención primaria en enfermedades no transmisibles', 'Puede incluir:

- evitar tabaco;
- actividad física;
- alimentación saludable;
- control de exposición ocupacional;
- seguridad vial;
- reducción de consumo nocivo de alcohol;
- entornos que faciliten conductas saludables.

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e86309be-4555-54e9-83c7-31673298cc12', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_20', '12. Prevención secundaria', 'Busca **detectar enfermedad o alteración en una etapa temprana**, cuando una intervención puede mejorar resultados.

Incluye:

- tamizaje;
- detección precoz;
- diagnóstico oportuno;
- tratamiento temprano.', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('89d1784b-bcfc-5e7b-a789-d843786072d7', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_21', 'Clave', 'La persona puede encontrarse asintomática.

---', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cb82c850-2627-5566-b3ee-833ef99c58ac', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_22', '13. Tamizaje', 'Un **tamizaje** se aplica a personas aparentemente sanas o sin diagnóstico conocido para identificar quiénes necesitan evaluación adicional.', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7c731308-caa3-51cb-b8b3-45627161ae75', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_23', 'Importante', 'Un tamizaje positivo **no siempre equivale a diagnóstico**.

Generalmente requiere confirmación.

---', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a4148586-668b-5f7f-a369-512648bab320', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_24', '14. Criterios generales de un buen tamizaje', 'Debe existir:

- enfermedad relevante;
- etapa detectable;
- prueba adecuada;
- tratamiento o intervención útil;
- balance favorable entre beneficios y daños;
- población objetivo definida.', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cce48070-d115-5351-9b9b-a120e3a1e3b0', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_25', 'Error', 'Realizar pruebas indiscriminadamente “por si acaso”.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('53f3b2ad-8faf-5d11-a8cf-69663c9672f9', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_26', '15. Sensibilidad y especificidad', '', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('03b09f4f-d567-5753-8858-52e78b4a2b25', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_27', 'Sensibilidad', 'Capacidad de una prueba para identificar correctamente personas con la condición.', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f0934bd1-25a6-53f7-b17a-a2bec81da8cf', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_28', 'Especificidad', 'Capacidad de identificar correctamente personas sin la condición.', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b8171ba0-7ae7-5294-b2b6-cc578a4c2cbc', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_29', 'Clave', 'Ninguna prueba debe interpretarse sin considerar población, prevalencia y propósito.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('65a82e4c-1884-5233-91d2-067fa1eead0b', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_30', '16. Falsos positivos y falsos negativos', '', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aba58843-244c-5a47-ac94-aa276e09fbfa', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_31', 'Falso positivo', 'Prueba positiva en persona sin la condición.

Puede causar:
- ansiedad;
- estudios adicionales;
- costos;
- procedimientos innecesarios.', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f10f4477-0235-5da6-80c0-40944ca5b710', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_32', 'Falso negativo', 'Prueba negativa en persona que sí tiene la condición.

Puede retrasar diagnóstico.

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7e65260d-ceff-5155-b517-a585dc785b8e', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_33', '17. Ejemplos de prevención secundaria', 'Según población y guía vigente:

- tamizaje de cáncer cervicouterino;
- mamografía;
- control de presión arterial;
- detección de diabetes;
- pruebas en recién nacidos;
- detección de tuberculosis en grupos indicados.', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c5b13e8a-207d-5aba-a56e-b9f4308b4aeb', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_34', 'Precaución', 'Edad, frecuencia y método dependen de la norma vigente.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('575a1ea5-a5d1-594b-9a1c-182046437b3e', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_35', '18. Detección temprana vs diagnóstico', 'Tamizaje identifica **riesgo o sospecha**.

Diagnóstico confirma o descarta enfermedad mediante evaluación clínica y pruebas correspondientes.', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1fadd0b7-4747-583a-859c-3cb2382d2376', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_36', 'Clave', 'Tamizaje ≠ diagnóstico definitivo.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f9cf88c0-1dce-5d5d-883f-c4f67e928dc0', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_37', '19. Prevención terciaria', 'Actúa cuando la enfermedad ya está establecida.

Objetivos:

- reducir complicaciones;
- limitar discapacidad;
- recuperar función;
- mejorar calidad de vida;
- prevenir recaídas o deterioro.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8d1b6564-4fbf-5f92-ae17-22912b140484', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_38', '20. Ejemplos de prevención terciaria', '- rehabilitación post-ACV;
- cuidado de pie diabético para evitar amputación;
- rehabilitación cardíaca;
- control de complicaciones renales;
- fisioterapia;
- cuidados de heridas crónicas;
- seguimiento de enfermedad crónica.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cf918e69-ce99-511f-9564-f7921bdbdb3e', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_39', '21. Rehabilitación', 'Busca recuperar o maximizar:

- función;
- independencia;
- participación;
- calidad de vida.

Puede incluir:

- fisioterapia;
- terapia ocupacional;
- rehabilitación cardiopulmonar;
- apoyo psicosocial.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c4ce180c-e3a3-582e-96cb-bb90d9ced395', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_40', '22. Prevención de complicaciones', 'Ejemplos:', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('32e8d9ab-f68a-5013-a425-0b859d2bf9c3', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_41', 'Diabetes', '- control;
- cuidado de pies;
- vigilancia renal;
- educación.', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('43bde96a-004e-58e9-96aa-f00a082e6da2', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_42', 'Hipertensión', '- adherencia;
- seguimiento;
- prevención de daño de órganos.', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a2c8b0a8-5aaf-5566-9439-082e1a136ea7', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_43', 'EPOC', '- tratamiento;
- rehabilitación;
- prevención de exacerbaciones.

---', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cf02b423-3aad-521d-86d2-f4b13029c16d', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_44', '23. Prevención en el curso de vida', '', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('666f3f75-fb55-59d0-be3b-802cc587d606', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_45', 'Niñez', '- vacunación;
- nutrición;
- prevención de lesiones.', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('55dc5cc4-09c9-5a22-a827-3cfa03729347', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_46', 'Adolescencia', '- salud sexual;
- prevención de sustancias;
- salud mental.', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c859e163-6b8e-513b-a0b6-ec4051a9bb90', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_47', 'Adulto', '- factores cardiovasculares;
- cáncer;
- seguridad laboral.', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2d9e3f8d-1588-577f-bb20-2e66faf2cc80', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_48', 'Adulto mayor', '- caídas;
- vacunación;
- funcionalidad;
- crónicos.

---', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('88b27a73-e4a8-5a79-8319-da973d6b9306', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_49', '24. Enfermería en prevención primaria', 'Puede participar en:

- vacunación;
- educación;
- control vectorial;
- prevención de infecciones;
- salud sexual;
- promoción de actividad física;
- prevención de lesiones;
- visitas comunitarias.', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6e550db1-36bb-5d87-a8ed-27e5db6599ae', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_50', 'Enfoque', 'Evitar aparición o exposición.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('65981d94-6038-59ca-991b-558e310ecd38', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_51', '25. Enfermería en prevención secundaria', 'Puede:

- identificar población objetivo;
- realizar mediciones/tamizajes autorizados;
- detectar signos tempranos;
- referir;
- hacer seguimiento;
- educar;
- registrar.', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aa52684f-5d11-56ad-8260-1a5e54be57c3', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_52', 'Enfoque', 'Encontrar el problema pronto y actuar oportunamente.

---', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('13633409-fdf9-5952-a651-62c9cf89d027', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_53', '26. Enfermería en prevención terciaria', 'Puede:

- prevenir complicaciones;
- apoyar rehabilitación;
- reforzar adherencia;
- enseñar autocuidado;
- coordinar servicios;
- prevenir reingresos;
- apoyar cuidadores.', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9bf39c2f-cbb8-50ff-9ed3-c54eb20dac2f', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_54', 'Enfoque', 'Reducir daño y mejorar función/calidad de vida.

---', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bc05211a-c39e-560f-925b-5a6bd63ec48e', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_55', '27. Papel de la enfermera: valoración', 'Antes de intervenir:

- identificar riesgos;
- historia;
- edad;
- inmunización;
- antecedentes;
- hábitos;
- exposición;
- barreras;
- determinantes sociales.

---', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f0041c3f-f1c0-5f08-b6c3-4a9e6d1faf9a', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_56', '28. Educación preventiva', 'Debe explicar:

- qué riesgo se quiere disminuir;
- qué acción realizar;
- cuándo;
- cómo;
- signos de alarma;
- cuándo buscar atención.', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e7531bf7-85e4-537c-818f-8c6c5a4c5952', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_57', 'Clave', 'Información sin comprensión no garantiza prevención.

---', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e87d4074-9fdc-5db2-a9b1-9323e70c6099', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_58', '29. Prevención y comunidad', 'Las intervenciones poblacionales pueden incluir:

- campañas;
- vacunación;
- control de vectores;
- seguridad vial;
- agua/saneamiento;
- espacios saludables.

La comunidad debe participar en identificación y solución de problemas.

---', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('75d2e45e-e6ca-5434-bce7-61e0b993a801', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_59', '30. Prevención y determinantes sociales', 'Las personas pueden conocer una recomendación pero no poder cumplirla por:

- costo;
- distancia;
- empleo;
- vivienda;
- falta de alimentos saludables;
- inseguridad;
- discriminación.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('54c5fd14-3d4b-5121-8b55-956d2cddf480', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_60', 'Clave', 'La prevención efectiva también debe abordar barreras.

---', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a8848a31-f401-5bf1-bf0a-bf96a7de2749', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_61', '31. Prevención basada en evidencia', 'Antes de implementar:

- conocer población;
- evaluar beneficio;
- considerar daños;
- usar guías;
- medir resultados.', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c9e8c56e-ac21-53d9-8c1a-b659b607a8a9', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_62', 'Error', 'Aplicar un tamizaje sin evidencia solo porque existe una prueba.

---', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('153d6030-157a-50af-a186-d877478a7629', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_63', '32. Sobreprevención y sobrediagnóstico', 'Más pruebas no siempre significan mejor prevención.

Puede existir:

- falso positivo;
- sobrediagnóstico;
- tratamientos innecesarios;
- ansiedad;
- costo.', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1f731bbd-e11a-59e4-87fe-5f3fbf5147a0', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_64', 'Clave', 'La prevención también requiere balance beneficio-riesgo.

---', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1928ae0d-e895-5229-92ad-9b62103f039b', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_65', '33. Prevención en enfermedades infecciosas', 'Puede actuar en:', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('222c6004-3da2-5f0f-a544-054cb0da6de2', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_66', 'Primaria', 'Vacunación, agua, higiene, vectores.', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('436bd4f3-6dc8-57a5-a224-d7a2dcfcfb8a', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_67', 'Secundaria', 'Detección temprana, vigilancia, diagnóstico oportuno.', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2a27c462-c26c-5a09-bfba-1477ddd2e48a', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_68', 'Terciaria', 'Tratamiento y prevención de complicaciones/secuelas.

---', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('42243ea4-2e2b-5d98-a61a-1faa88f4bb98', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_69', '34. Prevención cardiovascular', '', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2934b919-b6c2-58d2-a5f2-ecf2f3c1e2cb', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_70', 'Primaria', '- no fumar;
- actividad física;
- alimentación saludable.', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3f5b1150-a22b-5521-95ea-766808d553e1', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_71', 'Secundaria', '- detección de hipertensión o factores de riesgo según guías.', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5db030e4-8d84-5349-92e7-68eea38be2ae', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_72', 'Terciaria', '- rehabilitación y prevención de nuevos eventos después de enfermedad cardiovascular.

---', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9d80da62-8b66-56a0-8791-930d0316edce', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_73', '35. Prevención del cáncer', '', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8e434864-c1a2-54c3-a7ad-c5793fdb7669', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_74', 'Primaria', '- evitar tabaco;
- vacunación contra agentes relacionados con algunos cánceres;
- reducir exposiciones.', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3f7870ce-edea-50af-bc54-e0f4edb60946', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_75', 'Secundaria', '- tamizaje validado para población objetivo.', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('906cf09c-7d86-5a95-b044-b6dbfeb9a81a', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_76', 'Terciaria', '- tratamiento, rehabilitación, control de complicaciones y cuidados de soporte.

---', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eae8da80-dcad-5f1f-8215-5ee174aa7588', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_77', '36. Prevención de lesiones', '', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2a12c28a-efbd-5957-aab3-349608a1dd75', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_78', 'Primaria', '- cinturón;
- casco;
- seguridad del hogar;
- prevención de caídas.', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3b17cfd5-074d-52cf-9d58-15699b7bb8a1', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_79', 'Secundaria', '- detección rápida y atención temprana después de lesión.', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a1b440af-3447-587c-8109-ef9e716eada9', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_80', 'Terciaria', '- rehabilitación.

---', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('49e8aab8-b9b8-513f-aa1e-e474ea4f7670', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_81', '37. Panamá — Política Nacional de Salud 2026–2035', 'La Política Nacional de Salud vigente incorpora prevención, promoción, atención primaria, equidad y acción sobre determinantes.

Esto establece un marco nacional contemporáneo para intervenciones preventivas.

---', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8fb13f5d-32c2-50e1-904b-02f28f9573e4', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_82', '38. Panamá — Ley 522 de 2026', 'La **Ley No. 522 de 12 de mayo de 2026**, publicada en la **Gaceta Oficial Digital No. 30524-D del 14 de mayo de 2026**, establece un marco normativo integral para:

- promoción de la salud;
- prevención;
- diagnóstico temprano;
- control;
- seguimiento;

de las enfermedades no transmisibles.

La ley menciona, entre otras:

- diabetes mellitus tipo 2;
- enfermedades cardiovasculares;
- enfermedades respiratorias crónicas;
- hipertensión arterial;
- cáncer;
- obesidad;
- enfermedad renal crónica.

También establece participación de instituciones públicas, privadas y organizaciones comunitarias, además de un sistema nacional de información y vigilancia para estas enfermedades y sus factores de riesgo.', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('45099213-632f-5cae-896e-0b5b53e1e272', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_83', 'Relevancia', 'Refuerza legalmente el enfoque de promoción, prevención y detección temprana de enfermedades crónicas en Panamá.

---', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('03f3cc2b-faad-5fef-beed-335d44e15b3c', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_84', '39. Panamá — prevención y autocuidado 2026', 'En julio de 2026 MINSA reiteró la importancia de:

- autocuidado;
- participación comunitaria;
- eliminación de criaderos;
- vacunación según indicación;
- consulta oportuna;
- protección de grupos vulnerables.

Lo hizo en el contexto de vigilancia de influenza, dengue, Zika, chikunguña, malaria, hantavirus, leptospirosis y otros eventos.

---', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c65ca7e6-991f-5575-8756-bf939b9177e8', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_85', '40. Panamá — prevención cardiovascular 2026', 'En septiembre de 2026 MINSA lanzó **Cuida tu Corazón 2026**.

Promueve:

- actividad física;
- alimentación adecuada;
- descanso;
- hidratación;
- abandono de tabaco;
- reducción de alcohol;
- disminución del sedentarismo.

MINSA resaltó la APS como pilar para prevenir complicaciones antes de que se desarrollen.

---', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4b23fe1f-d890-5997-a624-ce2374fca12a', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_86', '41. Indicadores de prevención', 'Pueden incluir:

- cobertura de vacunación;
- porcentaje de población tamizada;
- seguimiento de resultados positivos;
- incidencia;
- hospitalizaciones;
- complicaciones;
- mortalidad.', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0eebad9b-8cd6-50ba-a6dc-a34b76fedc35', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_87', 'Clave', 'El indicador debe corresponder al objetivo preventivo.

---', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('81ff7ede-a41f-542f-b117-29b973375f62', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_88', '42. PAE y prevención', '', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('48d144a3-8416-5de0-8843-e914d0518574', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_89', 'Valoración', '- riesgos;
- antecedentes;
- conducta;
- barreras.', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('66e594f6-01ae-5976-b87b-d0e10ca40301', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_90', 'Identificación', '- riesgo de enfermedad;
- riesgo de complicación;
- necesidad de detección.', 90)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('884e5b43-ff7b-57d5-b565-50de0d96caa2', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_91', 'Planificación', '- intervenciones preventivas;
- metas;
- seguimiento.', 91)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9bf9b3c0-1ef1-5e92-91b2-6095980c5d08', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_92', 'Implementación', '- vacunas;
- educación;
- tamizaje;
- referencia;
- rehabilitación.', 92)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cb5e69b1-ca0d-5868-8995-55e4fdae70ee', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_93', 'Evaluación', '- adherencia;
- cobertura;
- resultados;
- complicaciones.

---', 93)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a84c5909-da1a-5cb3-a0f7-71564d61379c', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_94', '43. Casos tipo examen', '', 94)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a9a71079-ce1a-569f-8f3e-195edea37590', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_95', 'Caso 1', 'Niño recibe vacuna según esquema.

**Nivel:** prevención primaria.', 95)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('045967db-e7c4-5ae1-abf9-09c70bc74fa8', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_96', 'Caso 2', 'Persona sin síntomas participa en tamizaje validado de cáncer.

**Nivel:** prevención secundaria.', 96)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3994ff0b-c120-5e4e-a4e5-b3cd22a60f07', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_97', 'Caso 3', 'Paciente post-ACV recibe fisioterapia.

**Nivel:** prevención terciaria.', 97)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5f532061-df8e-52a0-b124-359a6d4c4629', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_98', 'Caso 4', 'Comunidad elimina criaderos antes de que aparezcan casos.

**Nivel:** prevención primaria.', 98)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6da1518a-2a1e-5f35-8f1d-7556b0b20acc', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_99', 'Caso 5', 'Prueba de tamizaje resulta positiva.

**Conducta:** requiere evaluación/confirmación; no es diagnóstico automático.', 99)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0151d7ce-3ec5-5a84-a38c-c658d46691d8', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_100', 'Caso 6', 'Paciente diabético aprende cuidado de pies para evitar úlceras.

**Nivel:** prevención terciaria.', 100)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c71d950a-ce82-58bf-b482-b948213e9469', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_101', 'Caso 7', 'Enfermera mide presión en población objetivo y refiere valores alterados.

**Nivel:** prevención secundaria.', 101)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5def032f-b1cf-5def-aa5c-f5d9b12b7818', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_102', 'Caso 8', 'Programa evita inicio del tabaquismo en adolescentes.

**Nivel:** prevención primaria.', 102)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5c4890b5-cbd5-51d8-9931-9a17bc791877', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_103', 'Caso 9', 'Paciente con infarto participa en rehabilitación cardíaca.

**Nivel:** prevención terciaria.', 103)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('65fef50e-1579-5432-bca8-401837113199', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_104', 'Caso 10', 'Se ordena una prueba sin evidencia a toda la población.

**Problema:** posible sobreprevención/sobrediagnóstico.', 104)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3bddc477-c7e7-5d5f-9075-3217dcc1dd0a', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_105', 'Caso 11', 'Persona quiere cumplir recomendaciones, pero no puede comprar alimentos adecuados.

**Necesidad:** abordar determinantes y barreras.', 105)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('53677ea0-96b5-503d-b543-117decbf964f', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_106', 'Caso 12', 'Enfermera registra tamizajes, resultados y referencias.

**Rol:** prevención secundaria + continuidad del cuidado.

---', 106)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d5c3d3b0-ad1d-59d2-8eb0-a26157f959c0', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_107', '44. Errores frecuentes', '1. Confundir promoción con prevención.
2. Clasificar tamizaje como prevención primaria.
3. Clasificar rehabilitación como secundaria.
4. Creer que tamizaje positivo = diagnóstico.
5. Hacer pruebas indiscriminadas.
6. Ignorar falsos positivos.
7. Ignorar barreras sociales.
8. Limitar prevención primaria a vacunas.
9. Limitar terciaria a tratamiento.
10. No evaluar resultados.
11. Aplicar edades/frecuencias de tamizaje sin guía vigente.
12. Pensar que prevención es responsabilidad exclusiva del paciente.

---', 107)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a3ab3127-5b94-5e9a-af1e-bb268c07cc73', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_108', '45. Qué memorizar', '**Primaria = evitar que aparezca.**

**Secundaria = detectar temprano.**

**Terciaria = limitar daño, complicaciones y discapacidad.**

**Vacunación = primaria.**

**Tamizaje = secundaria.**

**Rehabilitación = terciaria.**

**Tamizaje positivo ≠ diagnóstico definitivo.**

**Prevención debe basarse en evidencia y población objetivo.**

**Enfermería participa en los tres niveles.**

---', 108)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f4bcd0da-d495-5e35-a1b5-224d4979d6e3', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_109', '46. Fuentes', '', 109)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e1c84bc1-b6d2-5b01-9bf8-9af01b3555af', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_110', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 110)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0ef5edb5-cb00-543f-95cf-697cb3a20b04', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_111', 'Complementarias', '**OPS/OMS. Health promotion and disease prevention — clasificación primaria, secundaria y terciaria.**

**World Health Organization. Health Promotion.**', 111)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9629a507-0cfc-5963-97bb-4f2ca245c90a', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_112', 'Panamá', '**MINSA. Política Nacional de Salud 2026–2035.**

**MINSA. Ley No. 522 de 12 de mayo de 2026, marco legal para prevención, diagnóstico y control de enfermedades no transmisibles.**

**MINSA. Prevención y autocuidado claves para evitar enfermedades prevenibles. 6 de julio de 2026.**

**MINSA. Cuida tu Corazón 2026. 3 de septiembre de 2026.**

---', 112)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d0fd74eb-c085-5f4f-a801-122bbb559659', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_113', '47. Control de calidad', 'Este paquete:

- cubre los niveles de prevención exigidos por CICDE;
- desarrolla el papel de enfermería en cada nivel;
- utiliza la clasificación clásica primaria/secundaria/terciaria;
- diferencia tamizaje y diagnóstico;
- integra riesgo-beneficio y sobrediagnóstico;
- incluye prevención transmisible y no transmisible;
- incorpora contexto legal y programático panameño de 2026;
- contiene 12 casos originales;
- mantiene estado `REVIEW`.

---', 113)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e517adde-e35b-5ebd-9fcd-f056f294f29a', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_114', '48. Estado', '**Estado recomendado:** `REVIEW`

Antes de `SOURCE_VALIDATED` o nivel equivalente:

- validar edades, frecuencias y pruebas de tamizaje con normas nacionales específicas cuando se conviertan en preguntas de protocolo;
- no convertir ejemplos generales en recomendaciones universales;
- enlazar PUBLIC-08, PUBLIC-09 y PUBLIC-11.', 114)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f2692722-d5b4-573e-b5d8-f394468370df', '655815c1-f66b-5ca8-a236-114b88a8c543', 'sec_115', 'Resultado de auditoría documental 2026-09-10', 'Se reconfirmó:

- clasificación clásica de prevención primaria, secundaria y terciaria;
- distinción entre tamizaje y diagnóstico;
- vigencia de la Política Nacional de Salud 2026–2035;
- texto oficial de la **Ley 522 de 12 de mayo de 2026**;
- comunicación MINSA del 6 de julio de 2026 sobre autocuidado y participación comunitaria;
- campaña **Cuida tu Corazón 2026** del 3 de septiembre de 2026.

Se precisó la Ley 522: su objeto incluye promoción de la salud, prevención, diagnóstico temprano, control y seguimiento de las enfermedades no transmisibles. El contenido permanece en `REVIEW`.', 115)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('db299d4b-41ee-5f36-9804-73949b26a9a8', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_1', 'Programa Ampliado de Inmunización', '**Área:** Salud Pública  
**Código:** PUBLIC-11  
**area_code:** `PUBLIC_HEALTH`  
**Estado académico:** `REVIEW`  
**Versión:** 1  
**Revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4940ad0b-bb82-5281-999b-77bf49b69cca', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_2', '1. Alcance oficial CICDE', 'El CICDE 2026 incluye expresamente el **Programa Ampliado de Inmunización** y exige estudiar:

- Vacuna e inmunización.
- Características de las vacunas.
- Tipos de inmunidad.
- Tipos de vacunas.
- Manejo y conservación.
- Efectos adversos atribuibles a la vacunación e inmunización.
- Enfermedades con protección específica.
- Esquema actual de inmunizaciones de Panamá.

Este módulo utiliza como referencia normativa principal el **Esquema Nacional de Vacunación 2026 de MINSA/PAI, revisado por CONAPI en enero de 2026**.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('da84b455-1646-58da-8d75-1ef5cb7250ac', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_3', '2. Objetivos de aprendizaje', 'El estudiante debe poder:

1. Diferenciar vacuna, vacunación e inmunización.
2. Diferenciar inmunidad activa y pasiva.
3. Diferenciar inmunidad natural y artificial/adquirida por intervención.
4. Reconocer tipos generales de vacunas.
5. Explicar el propósito de la cadena de frío.
6. Aplicar principios básicos de almacenamiento y manejo.
7. Reconocer un evento adverso posterior a la inmunización sin atribuir causalidad automáticamente.
8. Identificar enfermedades prevenibles por vacunas.
9. Interpretar el Esquema Nacional de Vacunación de Panamá 2026 por grupo de edad.
10. Reconocer esquemas de rescate y grupos especiales como situaciones que requieren consulta de tabla oficial.
11. Explicar el papel de enfermería en el PAI.
12. Reconocer errores de seguridad en vacunación.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c896bdd2-f012-537f-ab6b-881bc0f6461a', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_4', '3. Vacuna, vacunación e inmunización', '', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b101bd64-380f-5e46-aa87-cc799870cd4d', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_5', 'Vacuna', 'Preparación biológica diseñada para inducir una respuesta inmunitaria protectora contra una enfermedad o agente específico.', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6b317120-5e73-50d8-948f-32510e9b544e', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_6', 'Vacunación', 'Acto de administrar una vacuna.', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a71454df-7849-5709-acc4-c269cbee3151', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_7', 'Inmunización', 'Proceso por el cual una persona adquiere protección inmunitaria, ya sea mediante vacunación o por otros mecanismos de inmunidad.', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fca343f0-b176-59d7-9b6d-f17d7e0d7ac6', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_8', 'Clave', '**Vacunación es la acción; inmunización es el proceso de adquirir protección.**

---', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7989eee6-6e8d-529a-b5cb-8daecc6f624b', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_9', '4. Inmunidad activa', 'Se produce cuando el propio sistema inmunitario genera una respuesta.

Puede surgir:

- después de una infección;
- después de una vacuna.

Suele generar memoria inmunológica.', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('834c342e-1ac2-5e08-b75a-9435f8548453', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_10', 'Ejemplo', 'Respuesta inmunitaria después de recibir una vacuna contra hepatitis B.

---', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2c836375-b5d9-55bb-aeb4-1ab44e593bd8', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_11', '5. Inmunidad pasiva', 'Se obtiene mediante anticuerpos producidos fuera del propio organismo.

Ejemplos:

- anticuerpos maternos transferidos al feto;
- inmunoglobulinas administradas.

Generalmente brinda protección más inmediata pero temporal.

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a4a10e55-1ccb-5f6f-aa9b-214144fcd47d', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_12', '6. Inmunidad natural y adquirida por intervención', 'Una clasificación didáctica útil:', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b96cbf6c-a0a9-58e5-b894-75c4b88f1f3a', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_13', 'Activa natural', 'Después de una infección.', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8374b7a2-d766-5a65-8a86-a79a2c858321', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_14', 'Activa por vacunación', 'Después de una vacuna.', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('571742b8-1fec-53b0-b8bb-443ed606fedd', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_15', 'Pasiva natural', 'Transferencia materna de anticuerpos.', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d6b317e5-b4f9-5bf3-80f6-7c637b43bf82', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_16', 'Pasiva por intervención', 'Administración de inmunoglobulinas o anticuerpos.', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('42ce47d7-3fc5-517d-9cc5-96cd0a3a16ea', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_17', 'Precaución', 'La terminología puede variar entre textos; para examen debe reconocerse el principio inmunológico.

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e244ff4a-4fad-50d1-af91-648a94c4f2cb', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_18', '7. Tipos generales de vacunas', 'Entre las plataformas utilizadas en inmunización pueden encontrarse:

- vivas atenuadas;
- inactivadas;
- toxoides;
- subunidades/recombinantes;
- polisacáridas;
- conjugadas;
- vectores virales;
- ácidos nucleicos como ARNm.', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('13ab940c-4ecb-5953-af48-d4589b254e4c', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_19', 'Clave', 'El tipo de plataforma influye en conservación, contraindicaciones y respuesta inmunitaria.

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c72492ed-f5ee-5524-9947-2f2d09663ccd', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_20', '8. Vacunas vivas atenuadas', 'Utilizan un microorganismo debilitado capaz de inducir respuesta inmunitaria.

Ejemplos clásicos incluyen determinadas vacunas virales como:

- sarampión-rubéola-parotiditis;
- varicela;
- fiebre amarilla.', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('511bd865-e489-597e-a772-66959c27fbe5', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_21', 'Precaución', 'Las contraindicaciones en inmunosupresión y embarazo dependen de la vacuna y la norma vigente.

---', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('85b3cf50-0404-589f-a9c9-a9208c154c92', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_22', '9. Vacunas inactivadas y de componentes', 'No contienen un agente capaz de producir la infección natural de la misma manera que una vacuna viva.

Pueden requerir:

- varias dosis;
- refuerzos;
- adyuvantes.

Ejemplos de plataformas:
- inactivadas;
- toxoides;
- recombinantes;
- conjugadas.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('deddcd5e-0ccc-5617-b4f1-769c7f818d3f', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_23', '10. Vacunas combinadas', 'Una vacuna puede proteger contra varios agentes o enfermedades en una sola aplicación.', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a024e3bc-6d91-50d2-8980-30b7f77c3e49', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_24', 'Panamá 2026', 'La vacuna **hexavalente** del esquema infantil protege contra:

- difteria;
- tétanos;
- tosferina;
- *Haemophilus influenzae* tipo b;
- hepatitis B;
- poliomielitis.

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8f537105-6c3f-578d-85eb-caf9ea7891a2', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_25', '11. Programa Ampliado de Inmunización', 'El PAI organiza acciones para:

- proteger a la población;
- mantener coberturas;
- prevenir enfermedades;
- vigilar eventos;
- asegurar disponibilidad;
- capacitar personal;
- mantener cadena de frío;
- registrar dosis.

MINSA informó en marzo de 2026 que Panamá mantiene un esquema nacional con **25 vacunas gratuitas** para la población.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('60b1a2b3-2570-55c8-bc38-1387e1985fbb', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_26', '12. Papel de enfermería en el PAI', 'Enfermería participa en:

- revisión del historial;
- identificación de vacunas pendientes;
- preparación y administración;
- educación;
- registro;
- cadena de frío;
- vigilancia de eventos adversos;
- búsqueda de población rezagada;
- campañas;
- manejo seguro de insumos.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('926de53e-f5c0-578d-b904-13e9c31011ad', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_27', '13. Cadena de frío', 'La cadena de frío mantiene las vacunas dentro de condiciones de temperatura adecuadas durante:

- almacenamiento;
- transporte;
- distribución;
- uso.

La OMS señala que la mayoría de las vacunas de programas de inmunización se conservan tradicionalmente entre **+2 °C y +8 °C**, aunque existen productos con requisitos diferentes.', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b8c13f9f-c899-5149-8a70-c35655e11da7', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_28', 'Clave', '**No asumir que todas las vacunas toleran congelación o las mismas condiciones.**

---', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fa578ca4-0b1d-5c2c-ab81-c88e5007d895', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_29', '14. Manejo y conservación', 'Principios generales:

- usar equipos apropiados;
- monitorizar temperatura;
- registrar temperaturas;
- proteger de excursiones térmicas;
- revisar fecha de vencimiento;
- conservar presentación e identificación;
- usar diluyente correcto;
- respetar instrucciones del fabricante;
- mantener trazabilidad.', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('13149b60-f0af-5991-8f84-3cd8e23039e0', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_30', 'Importante', 'Un refrigerador doméstico común no debe asumirse equivalente a un equipo validado para vacunas.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c42db481-b25f-5fda-8698-3aa3ce293162', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_31', '15. Congelación y calor', 'El calor puede disminuir potencia de muchas vacunas.

La congelación también puede dañar algunas vacunas sensibles al frío.', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('65247783-5f73-55f9-bd28-48cd539ef290', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_32', 'Clave', 'La respuesta correcta ante una excursión de temperatura no es “usar de todos modos” ni “desechar automáticamente”.

Debe:
1. aislarse el producto según procedimiento;
2. documentarse la excursión;
3. seguirse orientación del programa/fabricante antes de usar o descartar.

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('db1984e8-70b4-5890-9122-b89fa4ef8b59', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_33', '16. Diluyentes y reconstitución', 'Cuando una vacuna requiere diluyente:

- debe utilizarse el diluyente específico indicado;
- deben respetarse condiciones de conservación;
- debe registrarse/reconocerse el tiempo de reconstitución según el producto;
- deben respetarse las políticas de vial abierto correspondientes.', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4de41a6e-0157-57a6-bc65-8d7f13982832', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_34', 'Error grave', 'Usar un diluyente que no corresponde a la vacuna.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1ab647c9-0d68-5957-b6c4-5b39b1715733', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_35', '17. Seguridad de administración', 'Antes de vacunar:

- identificar a la persona;
- verificar vacuna;
- revisar edad/indicación;
- revisar historial;
- verificar dosis y presentación;
- comprobar vía y sitio;
- revisar vencimiento;
- revisar contraindicaciones/precauciones;
- informar;
- documentar.

---', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8bb79d63-bc2d-5998-925b-9f365517845b', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_36', '18. Evento adverso posterior a la inmunización', 'La OMS define un evento adverso posterior a la inmunización como cualquier problema médico que ocurre después de vacunar y que **no necesariamente tiene relación causal con la vacuna**.

Puede ser:

- síntoma;
- signo;
- resultado de laboratorio;
- enfermedad coincidente.', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ed0d99ac-1f3e-557f-acdc-357800e8a4af', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_37', 'Clave', '**Temporalidad ≠ causalidad.**

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2429e73f-ae81-5eba-83a0-069531bc5928', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_38', '19. Eventos comunes', 'Pueden ocurrir:

- dolor local;
- enrojecimiento;
- fiebre leve;
- malestar.

Los efectos graves son mucho menos frecuentes.', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4034a307-a4bb-59e3-9c61-efd31ff86141', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_39', 'Seguridad', 'Ante una reacción inesperada o grave debe seguirse el sistema de atención y vigilancia vigente.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fe401e2c-d496-5f0c-b79f-973026f07637', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_40', '20. Vigilancia de eventos adversos', 'Incluye:

- reconocer;
- atender clínicamente;
- registrar;
- notificar cuando corresponda;
- investigar;
- evaluar causalidad mediante metodología apropiada.', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('12913725-6136-5fec-9a4e-024ca1f3722d', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_41', 'Error', 'Etiquetar inmediatamente todo evento posterior como “causado por la vacuna”.

---', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9e7daac9-f0c3-5686-a440-2efb3c85d0b0', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_42', '21. Enfermedades con protección específica en Panamá', 'El esquema 2026 incluye protección frente a enfermedades como:

- tuberculosis grave;
- hepatitis A y B;
- difteria;
- tétanos;
- tosferina;
- enfermedad por Hib;
- poliomielitis;
- rotavirus;
- enfermedad neumocócica;
- influenza;
- COVID-19;
- sarampión;
- rubéola;
- parotiditis;
- varicela;
- fiebre amarilla en áreas indicadas;
- VPH;
- virus sincitial respiratorio en grupos definidos;
- rabia en situaciones indicadas;
- enfermedad meningocócica en determinadas situaciones.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a973e7f4-9fee-5b66-881d-980a8a3f9c46', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_43', '22. Esquema Panamá 2026 — menores de 1 año', 'Según el esquema oficial revisado en enero de 2026:

| Edad | Vacunas principales |
|---|---|
| Al nacer | BCG + Hepatitis B |
| 2 meses | Hexavalente 1 + Rotavirus 1 + Neumococo 20-valente 1 |
| 4 meses | Hexavalente 2 + Rotavirus 2 + Neumococo 20-valente 2 |
| 6 meses | Hexavalente 3; iniciar Influenza según esquema; COVID-19 actualizada según esquema |
| 6–11 meses | Influenza: completar 2 dosis en menor de 1 año con intervalo indicado por PAI |', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b990d359-6b18-5bec-94b8-915a48b178b4', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_44', 'Puntos exactos importantes', '- Hepatitis B del recién nacido: preferentemente en las primeras **12 horas**.
- Rotavirus humano: 2 dosis a los **2 y 4 meses**.
- Hexavalente: **2, 4 y 6 meses**.
- Neumococo 20-valente: **2 y 4 meses** en el esquema básico.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cf1c8ddc-9b27-5757-90b4-fa360a299de7', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_45', '23. Recién nacido', '', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('223c6be9-0d10-5a6b-800e-261c6e61b619', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_46', 'BCG', '- dosis única;
- al nacer;
- protege contra formas graves de tuberculosis, especialmente meníngea y miliar.

El esquema 2026 indica que se aplica a todos los recién nacidos independientemente del peso y señala posibilidad de aplicación hasta los **15 años, 11 meses y 29 días** cuando corresponda según historial.', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a9ad5b1b-18df-53e8-8b8f-9ba5bc3056f0', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_47', 'Precaución', 'La aplicación fuera del momento neonatal debe seguir la indicación del PAI y el contexto clínico; no debe extrapolarse como una recomendación automática para toda persona no vacunada.', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e575c5e4-1aff-5545-b4eb-4518714250fe', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_48', 'Hepatitis B', '- dosis única neonatal;
- **al nacer, dentro de las primeras 12 horas**, según el Esquema Nacional de Vacunación 2026.

El propio cuadro oficial añade dos consideraciones:
- en partos fortuitos o fuera de una institución, puede aplicarse hasta las **24 horas de vida**;
- el manejo del recién nacido con madre HBsAg positiva o con factores de riesgo requiere seguir el protocolo específico vigente y no debe improvisarse.', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f7fd14c2-f11c-530f-9f37-4f9fc7079099', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_49', 'Clave', 'Para examen, la regla rutinaria del esquema es: **hepatitis B al nacer, primeras 12 horas**.

---', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('367cb286-4f87-5c27-bc66-9181639cb132', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_50', '24. Esquema Panamá 2026 — 1 a 4 años', '| Edad | Vacunas principales |
|---|---|
| 12 meses | Neumococo 20-valente refuerzo + Triple Viral (MMR/SPR) + Hepatitis A |
| 15 meses | Varicela + Fiebre Amarilla solo donde está indicada |
| 18 meses | Triple Viral refuerzo + Hepatitis A refuerzo + Hexavalente refuerzo |
| 4 años | Varicela refuerzo + Tetravalente acelular refuerzo |
| 1–4 años | Influenza anual + vacuna COVID-19 actualizada según esquema |', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e8ef1055-0bec-5e6a-95c2-4cf0426cf1cc', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_51', 'Fiebre amarilla', 'En el cuadro 2026 se señala a los **15 meses** y se limita a las regiones de:

- Darién;
- Panamá Este;
- Guna Yala.

---', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4565d160-4c48-52d8-a394-f8fbcd11507e', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_52', '24A. Rotavirus — límites importantes del esquema 2026', 'El esquema oficial utiliza vacuna contra rotavirus humano:

- primera dosis: **2 meses**;
- segunda dosis: **4 meses**;
- intervalo recomendado: **2 meses**;
- intervalo mínimo: **1 mes**.

La nota oficial establece:

- aplicar la segunda dosis hasta los **8 meses de edad**;
- en áreas de difícil acceso, puede aplicarse hasta los **11 meses**;
- está contraindicada en niños con **inmunodeficiencia congénita severa**, según el cuadro nacional.', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('62ea5473-f988-518b-a4a1-ff3591aef5f6', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_53', 'Clave', 'El rescate de rotavirus tiene límites de edad específicos; no debe aplicarse la regla general de “continuar a cualquier edad”.

---', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('17ac3d00-beba-5fc8-8a33-0edb9f23b6ac', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_54', '25. Neumococo 20-valente infantil', 'Esquema básico:

- 2 meses;
- 4 meses;

con refuerzo a los:

- 12 meses.', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fb941be1-ba3d-5f5f-b522-a0d7b903ca2c', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_55', 'Clave', 'Panamá 2026 utiliza **neumococo conjugado 20-valente** en el esquema mostrado.

---', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('026affc3-325c-56a2-8388-b0e2323de982', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_56', '26. Triple Viral', 'Protege contra:

- sarampión;
- rubéola;
- parotiditis.

Calendario infantil del esquema 2026:

- 12 meses;
- refuerzo a los 18 meses.

Para personas mayores con esquemas incompletos se aplican criterios de rescate según historial y grupo.

---', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ed7f29a5-7ed5-51c2-b813-9352b33401de', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_57', '27. Hepatitis A infantil', 'En el esquema 2026:

- primera dosis: 12 meses;
- refuerzo: 18 meses.

El cuadro indica completar 2 dosis en menores de 5 años.

---', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8a1b6572-6c15-5d27-b25a-576a87b71753', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_58', '28. Varicela', 'En el esquema infantil:

- primera dosis: 15 meses;
- refuerzo: 4 años.

En situación de atraso o brote se aplican reglas específicas del PAI.

---', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('077199d6-9757-5ffb-b31c-4d71b19b8a7c', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_59', '29. Hexavalente y tetravalente acelular', '', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3daffad4-9a7d-5c47-81d1-d3f6e2692de1', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_60', 'Hexavalente', '- 2 meses;
- 4 meses;
- 6 meses;
- refuerzo a los 18 meses.', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d25eef6b-66d1-5ffd-b720-c684bf89562d', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_61', 'Tetravalente acelular', 'El esquema 2026 utiliza un refuerzo a los **4 años** para:
- difteria;
- tétanos;
- tosferina;
- poliomielitis inactivada.

---', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('70dfd26b-b116-5cde-9481-a19b197c39ee', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_62', '30. Esquema Panamá 2026 — 5 a 19 años', 'El cuadro oficial incluye:

- Triple Viral para completar esquema según historial;
- VPH;
- Tdap;
- Td;
- Influenza en situación de riesgo;
- Neumococo 20-valente en situación de riesgo;
- COVID-19 actualizada.', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('60db3637-56ed-5c41-afc0-e785a23cb470', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_63', 'Clave', 'En adolescentes debe revisarse historial: no todos requieren exactamente las mismas dosis.

---', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aaf0c61c-00ba-532f-82e1-c2434c2d2c07', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_64', '31. VPH — niños y niñas', 'Esquema de rutina 2026:

- **10 años**;
- **2 dosis**;
- segunda dosis a los **6 meses**.

Situaciones especiales:
- inmunosupresión, incluido VIH: 3 dosis según tabla;
- mayores de 15 años sin vacuna: 3 dosis;
- víctimas de agresión sexual: iniciar/completar según edad e historial.

---', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5d200e2f-77b2-5e91-84ad-1064767cbffb', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_65', '32. Tdap en adolescencia', 'El esquema 2026 incluye:

- una dosis de **Tdap entre 10 y 11 años**.

También tiene indicaciones específicas en embarazo, cuidadores y contactos de tosferina.

---', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f0879382-7393-5f0d-ac1c-db08edae969b', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_66', '33. Influenza en niños/adolescentes', '', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f23c86ae-9b38-5bec-b334-218d44006c08', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_67', 'Menores de 1 año', 'Dos dosis para quien inicia esquema, según tabla.', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4a695541-e94e-5d64-8968-b15e1a129430', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_68', '1–4 años', 'Dosis anual.', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4a59bb42-cc48-54bd-82b8-eb64b0ef1f98', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_69', '10–19 años', 'El cuadro contempla vacunación anual en **situación de riesgo**.', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('740c28f7-0ee5-5c52-9cac-2a4004ffc948', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_70', 'Nota', 'En menores de 9 años nunca vacunados, la tabla establece 2 dosis con intervalo de 4 semanas.

---', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('26391971-a11c-55c7-9389-b3b81b82ea47', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_71', '34. Mujeres en edad fértil, embarazadas y puérperas', 'El cuadro oficial 2026 incluye:

- Td;
- Tdap;
- Influenza;
- MR en las situaciones indicadas;
- VRS;
- COVID-19.

---', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('22e3a4c7-c09b-5581-a0fe-caaadea79dc2', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_72', '35. Tdap en embarazo', 'El esquema 2026 indica:

- **1 dosis en cada embarazo**;
- a partir de la **semana 27**;
- contempla puérperas hasta **42 días posparto** cuando corresponda.', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('307c2047-7ff2-5b11-9fe1-938345ae8ee0', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_73', 'Clave', 'La Tdap de cada embarazo forma parte de la estrategia para proteger frente a tosferina.

---', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eefb502a-da18-5ccb-b3cb-ffd43cf876aa', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_74', '36. Influenza en embarazo', 'El cuadro 2026 establece:

- una dosis;
- anual;
- independientemente del período del embarazo.

---', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0512dd38-c7f9-5f97-ae8f-8d7a17d2085b', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_75', '37. VRS en embarazo', 'El **Esquema Nacional de Vacunación 2026** indica una dosis de vacuna contra virus sincitial respiratorio en:

- **30–36 semanas de gestación**.

La nota del propio esquema añade que:

- debe procurarse un mínimo de **14 días antes de la fecha probable de parto**;
- en clínica de alto riesgo obstétrico puede considerarse desde las **28 semanas**, según indicación médica;
- se aplica en cada embarazo.

MINSA volvió a comunicar durante julio y agosto de 2026 el intervalo general de **30–36 semanas**, por lo que este módulo conserva ese rango como referencia nacional principal.', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eef6188e-5b93-5691-83b0-a85664cda816', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_76', 'Clave', '**Rutina del esquema: 30–36 semanas.**
Las excepciones de alto riesgo requieren indicación clínica.

---', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1f81e964-7c3f-5922-b350-51f1c0ffe5ea', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_77', '38. COVID-19 en embarazo', 'El cuadro 2026 contempla:

- 1 dosis;
- independientemente del período de gestación;
- con posibilidad de administración simultánea con otras vacunas según nota del esquema.

---', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2dad4664-8789-5b11-b38c-d29ee0428ede', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_78', '39. Adultos de 60 años y más', 'El esquema 2026 incluye:

| Vacuna | Esquema general |
|---|---|
| Influenza | 1 dosis anual |
| Neumococo 20-valente | dosis única a partir de 60 años |
| Td adulto | completar 3 dosis según historial y refuerzo cada 10 años |
| Tdap | una dosis; cuadro contempla refuerzo cada 10 años y situaciones especiales |
| VRS | una dosis a partir de 60 años |
| COVID-19 | una dosis según vacuna/esquema vigente |

---', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('17d6720c-4182-5b42-81f9-23d71cd6a7db', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_79', '40. Neumococo 20-valente en ≥60 años', 'El esquema establece:

- dosis única;
- a partir de los 60 años.

Si la persona recibió previamente vacunas neumocócicas de formulaciones anteriores, la propia tabla contiene reglas de intervalo.', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f26ee55d-01ec-5166-ada0-603556e24877', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_80', 'Clave', 'Revisar historia antes de administrar.

---', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('982c80fc-a562-5c7c-ac7d-c7353823ee88', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_81', '41. VRS en ≥60 años', 'El esquema 2026 incluye:

- una dosis;
- a partir de los 60 años;
- con o sin comorbilidad según nota oficial.

---', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aff0e61a-a755-58f1-b5ae-ff3343d3fb6a', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_82', '42. Población general y grupos especiales', 'El esquema oficial también contempla indicaciones para:

- población indígena en áreas comarcales;
- grupos esenciales;
- adultos desde 50 años para influenza;
- privados de libertad;
- manipuladores de alimentos;
- trabajadores expuestos a desechos peligrosos;
- trabajadores del sexo;
- contactos de casos;
- profesionales con riesgo de rabia;
- víctimas de agresión sexual;
- manejo de brotes.', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aaded37c-ec63-59f3-928e-2bd3ee131fef', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_83', 'Clave', 'Estos esquemas dependen de riesgo e historial y deben consultarse en la tabla oficial.

---', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5cdcf71b-30c5-5635-83d7-879aaa028f74', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_84', '43. Esquema de rescate', 'El propio MINSA advierte que para dosis fuera del grupo etario se debe consultar el:

**cuadro de vacunación de rescate en niños con esquema atrasado.**', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('044a81f2-a792-58e7-b2e5-cac61cbfeacc', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_85', 'Principio', 'Un esquema atrasado no debe reiniciarse automáticamente desde cero; debe evaluarse lo ya recibido y aplicarse la tabla de rescate vigente.

---', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('14eb6392-ce36-530e-8413-59ad4b204f15', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_86', '44. Vacunación simultánea', 'El esquema 2026 permite administración simultánea en distintas situaciones.

Principios:

- verificar compatibilidad según norma;
- usar sitios anatómicos apropiados;
- registrar cada vacuna;
- no mezclar productos en una misma jeringa salvo formulación autorizada.

---', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c6eacf30-f3dc-5f13-938b-c71d304a77f9', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_87', '45. Contraindicaciones y precauciones', 'Deben distinguirse:', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5b9f5a42-42d5-58b9-ae3d-1d6b5e154b35', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_88', 'Contraindicación', 'Situación en la que una vacuna no debe administrarse.', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('06908ac6-8bd7-564e-98e4-39705e89bc1c', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_89', 'Precaución', 'Situación que exige valorar riesgo-beneficio, momento o supervisión.', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3dc87e79-85eb-5121-913e-7b5c0e206987', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_90', 'Error', 'Considerar cualquier resfriado leve como contraindicación universal.

Las reglas específicas dependen de cada vacuna.

---', 90)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e652c6de-daf3-55cf-96ad-8a2aab3bb0c0', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_91', '46. Enfermedades prevenibles: asociaciones clave', '- **BCG** → formas graves de tuberculosis.
- **Hepatitis B** → hepatitis B.
- **Hexavalente** → difteria, tétanos, tosferina, Hib, hepatitis B, polio.
- **Rotavirus** → gastroenteritis por rotavirus.
- **Neumococo 20-valente** → enfermedad por serotipos incluidos.
- **MMR/SPR** → sarampión, rubéola, parotiditis.
- **Hepatitis A** → hepatitis A.
- **Varicela** → varicela.
- **Fiebre amarilla** → fiebre amarilla.
- **VPH** → infección/enfermedades por tipos de VPH incluidos.
- **Td/Tdap** → tétanos/difteria; Tdap agrega tosferina.
- **Influenza** → influenza estacional.
- **VRS** → enfermedad por virus sincitial respiratorio.
- **COVID-19** → COVID-19.

---', 91)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bb096e6c-610c-5fcc-9736-d8c2a255cc22', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_92', '47. Registro', 'Debe documentarse según sistema vigente:

- vacuna;
- fecha;
- dosis;
- lote;
- fabricante/presentación cuando corresponda;
- vía;
- sitio;
- establecimiento;
- vacunador;
- próxima dosis cuando corresponda.', 92)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c47c0bbc-c232-5fad-b36c-810e3155fa92', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_93', 'Clave', 'Una dosis no documentada puede ser difícil de verificar posteriormente.

---', 93)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('de8799df-215a-519a-845f-cc13c75b045c', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_94', '48. Educación después de vacunar', 'Explicar:

- reacciones esperables;
- medidas básicas;
- signos de alarma;
- cuándo buscar atención;
- próxima dosis;
- conservar tarjeta/registro.

---', 94)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a5833f7b-dcb4-5564-8b4d-a02803451c64', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_95', '49. Vacunación y cobertura', 'Cobertura:

**personas vacunadas / población objetivo × 100**

Sirve para:

- identificar brechas;
- planificar;
- buscar rezagados;
- evaluar campañas.', 95)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d337ed24-52d0-5aed-97f5-a66a621ebab3', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_96', 'Precaución', 'Cobertura alta no elimina necesidad de vigilancia.

---', 96)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ef46f2cd-0507-590d-906e-df127df0674a', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_97', '50. Actualidad Panamá 2026', 'Durante 2026 MINSA:

- mantuvo vigente el esquema nacional;
- realizó jornadas de actualización técnica;
- reforzó vacunación frente a sarampión;
- continuó vacunación infantil y de adultos;
- reportó coberturas infantiles superiores al 90% en algunas vacunas;
- llamó a completar esquemas ante tosferina.', 97)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d8d98c77-8992-5501-a922-36c46ad6e7f1', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_98', 'Actualización VRS — nirsevimab', 'En agosto de 2026 MINSA inició progresivamente la aplicación de **nirsevimab** a recién nacidos y lactantes elegibles con brechas de protección frente al VRS.', 98)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('03414df5-4187-50f8-a4f1-7aac0098d3b9', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_99', 'Importante', '**Nirsevimab es un anticuerpo monoclonal, no una vacuna.**

La estrategia nacional combina:

- vacunación materna contra VRS;
- protección con nirsevimab para recién nacidos/lactantes elegibles cuando la protección materna no se produjo o resulta insuficiente según los lineamientos operativos.

Esto es una actualización programática de 2026 posterior a la revisión CONAPI de enero.', 99)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('25019088-0aa9-5a9d-8abb-b1f63f3a1c74', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_100', 'Clave', 'Las campañas y estrategias complementarias no sustituyen automáticamente el calendario rutinario; deben interpretarse junto con los lineamientos vigentes.

---', 100)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('76c88368-8b8f-5416-8ed9-665890216e0f', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_101', '51. Casos tipo examen', '', 101)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('28dff300-c9c6-5a0f-88ce-e7072a634320', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_102', 'Caso 1', 'Recién nacido sano en institución.

**Prioridad de esquema:** verificar BCG y hepatitis B según calendario neonatal.', 102)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0f3c07e8-e3f7-51a8-8ffc-420c3f0aea78', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_103', 'Caso 2', 'Lactante de 2 meses.

**Esquema base:** hexavalente, rotavirus y neumococo 20-valente según tabla 2026.', 103)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eb0e6bd7-df0e-59f6-aa17-74c54364e68c', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_104', 'Caso 3', 'Niño de 12 meses con esquema al día.

**Vacunas clave:** neumococo refuerzo, triple viral y hepatitis A.', 104)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1bbf463c-0e57-5d38-9804-1cf1e68ccc05', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_105', 'Caso 4', 'Niño de 15 meses en una región donde está indicada fiebre amarilla.

**Vacunas clave:** varicela y fiebre amarilla según esquema.', 105)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d211b2f1-eb37-5576-b159-ddcfa3243c0d', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_106', 'Caso 5', 'Niño de 10 años sin VPH.

**Esquema de rutina:** iniciar VPH de 2 dosis según calendario 2026.', 106)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('68dfd803-3227-5322-9ebb-37914143d5ed', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_107', 'Caso 6', 'Embarazada de 30 semanas.

**Vacunas del cuadro:** revisar Tdap, influenza, VRS y COVID-19 conforme historial e indicación.', 107)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('357ba977-0352-5bd4-a2e2-ebf3e4d47a1e', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_108', 'Caso 7', 'Adulto de 65 años.

**Revisar:** influenza, neumococo 20-valente, Td/Tdap, VRS y COVID-19.', 108)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ed955b2b-0afa-522e-871f-7f362a9b2d7b', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_109', 'Caso 8', 'Vacuna estuvo fuera de temperatura recomendada.

**Conducta:** aislar, registrar y consultar procedimiento; no usar ni desechar automáticamente.', 109)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fbb8647d-94a0-5114-b0ec-2202fdaf2775', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_110', 'Caso 9', 'Paciente desarrolla fiebre horas después de vacunarse.

**Concepto:** evento temporal posterior; no prueba causalidad por sí solo.', 110)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('460e4018-128e-552f-ac28-d2c3f434ec37', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_111', 'Caso 10', 'Niño llega atrasado.

**Conducta:** revisar historial y tabla de rescate; no reiniciar automáticamente todo el esquema.', 111)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f8a84c79-7863-5f6c-ab42-a74e53a4409a', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_112', 'Caso 11', 'Enfermera usa diluyente de otro producto.

**Error de seguridad:** el diluyente debe corresponder específicamente a la vacuna.', 112)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('22718aa5-41e1-5794-a454-f3c5aa899379', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_113', 'Caso 12', 'Se aplicó vacuna pero no se registra lote ni fecha.

**Problema:** pérdida de trazabilidad y seguridad del programa.

---', 113)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5dac7f41-c6d8-5532-96a2-ad1b5795d4bf', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_114', '52. Errores frecuentes', '1. Vacunación = inmunización.
2. Confundir inmunidad activa y pasiva.
3. Asumir que todas las vacunas son vivas.
4. Asumir que todas toleran congelación.
5. No revisar historial.
6. Usar diluyente incorrecto.
7. Reiniciar automáticamente esquemas atrasados.
8. Confundir evento posterior con causalidad.
9. No registrar lote/dosis.
10. Memorizar esquema 2025 o antiguo como si fuera 2026.
11. Ignorar grupos de riesgo.
12. Usar una campaña temporal como sustituto del calendario nacional.

---', 114)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8735ee57-7e1b-568e-824c-fa8acb9789c8', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_115', '53. Qué memorizar para CICDE', '**Panamá 2026: esquema oficial revisado por CONAPI en enero de 2026.**

**Nacimiento:** BCG + hepatitis B; hepatitis B dentro de las primeras **12 horas** en el esquema rutinario.

**2, 4, 6 meses:** hexavalente.

**2 y 4 meses:** rotavirus + neumococo 20-valente.

**12 meses:** neumococo refuerzo + MMR + hepatitis A.

**15 meses:** varicela; fiebre amarilla solo en áreas indicadas.

**18 meses:** MMR + hepatitis A + hexavalente refuerzo.

**4 años:** varicela refuerzo + tetravalente acelular.

**10 años:** VPH niños y niñas (2 dosis, segunda a 6 meses).

**10–11 años:** Tdap.

**Embarazo:** Tdap desde semana 27; influenza; VRS **30–36 semanas** (con excepción de alto riesgo desde 28 semanas por indicación médica); COVID-19 según cuadro 2026.

**≥60 años:** influenza anual + neumococo 20-valente + Td/Tdap + VRS + COVID-19 según historial/esquema.

**Cadena de frío:** en general +2 °C a +8 °C para la mayoría de vacunas, pero siempre manda el producto y la norma.

**Evento adverso posterior ≠ causalidad automática.**

---', 115)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2e006b87-af64-50ee-ada4-db81e1e71b54', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_116', '54. Fuentes', '', 116)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3d0be4c5-05c4-5f89-abc3-466a0644c2fa', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_117', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 117)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('23035479-4149-5132-a3e4-07cb88d6772f', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_118', 'Panamá — normativa/programa actual', '**Ministerio de Salud de Panamá / PAI. Esquema Nacional de Vacunación 2026. CONAPI revisado enero 2026.**

**MINSA. Panamá tiene su esquema de vacunación garantizado. 9 de marzo de 2026.**

**MINSA. Refuerzan actualización en vacunas para prevenir brotes y fortalecer cobertura nacional. 18 de marzo de 2026.**

**MINSA. Vacunación protege la salud y fortalece la prevención en la población panameña. 16 de junio de 2026.**

**MINSA. Minsa refuerza vigilancia y exhorta a completar vacunación frente a tos ferina. 9 de julio de 2026.**

**MINSA. Minsa inicia aplicación de anticuerpo monoclonal para fortalecer la protección de recién nacidos frente al VRS. Agosto de 2026.**', 118)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('19386c17-07d3-5746-ad20-7cd82f98a913', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_119', 'Complementarias', '**World Health Organization. Vaccines and immunization: Vaccine safety.**

**World Health Organization. Vaccine cold chain / controlled temperature chain guidance.**

**World Health Organization. Vaccine management and diluent guidance.**

---', 119)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b318dcd7-9791-50bf-b2fa-050e95246957', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_120', '55. Control de calidad', 'Este paquete:

- cubre todos los subtemas expresos CICDE;
- utiliza el esquema oficial Panamá 2026;
- diferencia vacuna, vacunación e inmunización;
- desarrolla tipos de inmunidad y vacunas;
- incluye cadena de frío y manejo;
- diferencia evento posterior de causalidad;
- incorpora esquema por edades y grupos prioritarios;
- incluye 12 casos originales;
- evita inventar reglas fuera del documento oficial;
- mantiene estado `REVIEW`.

---', 120)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0a548390-8e71-5679-8092-050a016b6728', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_121', '56. Estado', '**Estado recomendado:** `REVIEW`

Antes de `SOURCE_VALIDATED` o nivel equivalente:

- realizar segunda auditoría independiente del calendario 2026 contra el PDF oficial completo;
- validar notas especiales y rescates antes de convertirlos en preguntas con una sola respuesta;
- comprobar si MINSA publica una revisión posterior a enero de 2026;
- conservar el PDF oficial como fuente normativa prioritaria;
- cualquier dosificación o manejo pos-exposición debe seguir protocolos específicos vigentes.', 121)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bce12db3-59e3-5da0-b579-48f722fa40cd', 'edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'sec_122', 'Resultado de auditoría documental 2026-09-10', 'Las afirmaciones numéricas centrales de este módulo fueron contrastadas nuevamente con el **Esquema Nacional de Vacunación 2026 de MINSA/PAI, CONAPI revisado enero de 2026**, y con comunicaciones oficiales MINSA posteriores de 2026.

Se ajustó:
- precisión de hepatitis B neonatal;
- límites de edad de rotavirus;
- excepción obstétrica de VRS;
- actualización de nirsevimab, claramente identificado como anticuerpo monoclonal y no vacuna.

El contenido permanece en `REVIEW` hasta concluir la auditoría integral del área.', 122)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8de01449-c76a-5033-bebb-74f7ccb4fed6', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_1', 'Concepto, estructura y tipos de familias', '**Área:** Salud Pública  
**Código:** PUBLIC-12  
**area_code:** `PUBLIC_HEALTH`  
**Estado académico:** `REVIEW`  
**Versión:** 1  
**Revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5cfd7b19-3d06-538a-a0bc-0634dd60544e', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_2', '1. Alcance oficial CICDE', 'El CICDE 2026 incluye expresamente:

**“Concepto, estructura y tipos de familias”.**

El lineamiento no enumera subtemas adicionales. Este módulo desarrolla la familia como unidad de cuidado dentro de Atención Primaria de Salud y enfermería comunitaria.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0a68e974-bcb7-512c-bf4d-2852d6851fee', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_3', '2. Objetivos de aprendizaje', 'El estudiante debe poder:

1. Explicar el concepto de familia.
2. Diferenciar familia y hogar.
3. Reconocer que existen diversas estructuras familiares.
4. Identificar tipos frecuentes de familia.
5. Describir funciones familiares.
6. Reconocer roles, límites, jerarquías y comunicación.
7. Comprender el ciclo de vida familiar.
8. Identificar riesgos y recursos de la familia.
9. Utilizar herramientas básicas como genograma y ecomapa.
10. Aplicar enfoque familiar sin estigmatizar estructuras distintas.
11. Relacionar familia con Atención Primaria de Salud.
12. Identificar el papel de enfermería en cuidado familiar.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b1672b58-ec98-50b8-9309-ed8051293f12', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_4', '3. Concepto de familia', 'La familia es una unidad social formada por personas vinculadas por:

- parentesco;
- matrimonio o unión;
- adopción;
- cuidado;
- compromiso y vínculos afectivos/sociales.

En salud, interesa especialmente cómo sus miembros:

- se apoyan;
- toman decisiones;
- comparten recursos;
- cuidan;
- enfrentan crisis;
- influyen en conductas y resultados de salud.', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('15efe24c-d444-5bf7-adc6-41e2d8c0eaa6', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_5', 'Clave', 'No existe una única forma válida de familia.

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('026a1fdb-d5c8-5a58-bf48-0dd423dbdeed', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_6', '4. Familia y hogar no son exactamente lo mismo', '', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4efd9d08-c7e4-5afd-b7de-9508f36f6bdb', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_7', 'Familia', 'Se define principalmente por relaciones familiares y de cuidado.', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6e1efb9c-399e-5b21-9120-805bdbedd94c', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_8', 'Hogar', 'Se refiere a personas que comparten una vivienda y arreglos de vida.

Un hogar puede:

- contener una familia;
- contener más de una familia;
- incluir personas no emparentadas;
- estar formado por una sola persona.', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d9b471e6-71f4-5649-b701-fe29c3d627d1', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_9', 'Clave de examen', '**Hogar y familia son conceptos relacionados, pero no sinónimos perfectos.**

---', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1469c42a-03e0-563b-94da-9097b83d9ebc', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_10', '5. Familia como unidad de salud', 'La OMS y la APS reconocen que la salud se desarrolla en interacción con:

- individuos;
- familias;
- comunidades.

La familia puede influir en:

- hábitos;
- nutrición;
- uso de servicios;
- adherencia;
- salud mental;
- cuidado de dependientes;
- respuesta ante enfermedad.

---', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3b275177-0853-5f20-8039-be5f658af6d4', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_11', '6. Estructura familiar', 'La estructura describe:

- quiénes forman la familia;
- cómo se relacionan;
- generaciones presentes;
- convivencia;
- roles;
- autoridad;
- vínculos.', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f2f0afda-ad0c-5bdc-9098-9cee5a6b2c26', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_12', 'Importante', 'La estructura por sí sola no determina si una familia funciona bien o mal.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('761ff7d6-698f-5bad-b55d-937cae3ea145', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_13', '7. Familia nuclear', 'Formada típicamente por:

- pareja;
- hijos dependientes o convivientes.', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e2141676-df70-5741-aef8-9dc62dfda948', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_14', 'Precaución', 'No debe tratarse como el único modelo “normal”.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('68738d45-8a66-528e-a78a-ff81d02541bd', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_15', '8. Familia extensa o ampliada', 'Incluye familiares de más de una generación o parentesco adicional, por ejemplo:

- abuelos;
- tíos;
- primos;
- otros familiares.

Puede ofrecer:

- apoyo;
- cuidado;
- recursos compartidos.

También puede presentar conflictos o sobrecarga, como cualquier otra estructura.

---', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d6b0813e-14c3-519e-957c-d588fd4b43b8', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_16', '9. Familia monoparental', 'Un progenitor o cuidador principal vive con uno o más hijos.

Puede resultar de:

- separación;
- divorcio;
- viudez;
- elección;
- otras circunstancias.', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f6657ce7-0615-5984-9fe8-6f827334b344', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_17', 'Enfermería', 'Debe valorar apoyos y necesidades sin asumir automáticamente disfunción.

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8f64517a-0d7a-523d-83a3-2929209f0c9a', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_18', '10. Familia reconstituida o ensamblada', 'Se forma cuando una pareja establece un nuevo hogar y uno o ambos miembros tienen hijos de relaciones previas.

Puede incluir:

- padrastros/madrastras;
- hermanastros;
- medios hermanos.', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('94ef111b-15d8-5ea0-be00-149094adf013', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_19', 'Necesidad', 'Clarificar roles, redes y responsables de cuidado.

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('83ddecae-faf5-5d2c-bbfd-44f58e4f5942', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_20', '11. Pareja sin hijos', 'Una pareja puede constituir una familia aunque no tenga hijos.

Puede ser:

- por elección;
- etapa del ciclo vital;
- infertilidad;
- otras circunstancias.

---', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('83113766-7036-5a0e-9abd-33add9491ff9', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_21', '12. Familia adoptiva', 'Incluye uno o más hijos incorporados mediante adopción.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6edb6d9f-c823-5159-9707-923270f7ddee', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_22', 'Clave', 'La relación familiar y de cuidado no depende exclusivamente del vínculo biológico.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e6cd0403-0f2c-539b-b6a5-9e473be48731', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_23', '13. Familia con cuidadores no parentales', 'En algunos hogares, niños o personas dependientes pueden estar al cuidado de:

- abuelos;
- tíos;
- hermanos mayores;
- otros familiares o cuidadores.

En enfermería importa identificar:

- cuidador real;
- autoridad legal cuando sea relevante;
- capacidad de cuidado;
- necesidades de apoyo.

---', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('560b1395-bb35-5b89-8d4b-b8d99a80b868', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_24', '14. Familias diversas', 'Las familias pueden adoptar distintas configuraciones según:

- cultura;
- relaciones;
- migración;
- ciclo de vida;
- decisiones;
- condiciones sociales.', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fdb959a8-9f14-57f8-8b99-d1c438cc506f', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_25', 'Principio', 'La valoración clínica debe centrarse en necesidades, funcionamiento, seguridad y apoyo, no en prejuicios sobre la estructura.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aff654e2-bc9c-53e6-87f2-8228001b631a', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_26', '15. Funciones de la familia', 'Pueden incluir:

- afectiva;
- protección;
- socialización;
- cuidado;
- apoyo económico;
- educación;
- transmisión cultural;
- manejo de recursos;
- apoyo durante enfermedad.', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('43e08aea-d5e2-5965-ac6b-b114675faaa2', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_27', 'Precaución', 'No todas las familias realizan estas funciones de la misma manera.

---', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('15e4e5d0-b14e-5247-a151-89d7f6377da5', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_28', '16. Función afectiva', 'Incluye:

- apoyo emocional;
- pertenencia;
- comunicación;
- seguridad afectiva.

Puede influir en:

- salud mental;
- afrontamiento;
- adherencia;
- recuperación.

---', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('954f3e3c-ffe6-53f5-b214-0d733c05aa43', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_29', '17. Función de cuidado', 'La familia puede ayudar en:

- medicamentos;
- citas;
- alimentación;
- movilidad;
- higiene;
- vigilancia de síntomas;
- cuidado infantil o de dependientes.', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f73dc57c-aa23-5076-9399-e14c8104a9ea', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_30', 'Riesgo', 'El cuidador también puede sufrir sobrecarga.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2df09ac0-d7ac-5400-90a2-fff87e674918', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_31', '18. Socialización', 'La familia participa en aprendizaje de:

- normas;
- hábitos;
- valores;
- comunicación;
- autocuidado;
- conductas de salud.

No es el único agente de socialización; también influyen escuela, comunidad y medios.

---', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1a6c8f16-7cbe-589d-a948-a4b11ae01b81', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_32', '19. Función económica', 'Puede incluir:

- producción de ingresos;
- distribución de recursos;
- vivienda;
- alimentación;
- transporte;
- gastos de salud.

La inseguridad económica puede afectar decisiones sanitarias.

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6a6380df-4471-5240-bfc4-8bfa384c5e35', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_33', '20. Roles familiares', 'Un rol es el conjunto de responsabilidades o expectativas asociadas a una persona dentro de la familia.

Ejemplos:

- cuidador;
- proveedor;
- responsable de decisiones;
- apoyo emocional.', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3b183d64-f579-53fd-a068-1809caac384f', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_34', 'Clave', 'Los roles pueden cambiar por enfermedad, edad o crisis.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('effe588b-b5aa-50de-b4b9-f7d646e35d1b', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_35', '21. Jerarquía y autoridad', 'Describe cómo se toman decisiones y se distribuye poder.

En enfermería interesa conocer:

- quién decide;
- quién cuida;
- quién administra recursos;
- quién acompaña;
- quién necesita apoyo.', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('541f43ff-108d-584e-9ad0-fe176e54845d', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_36', 'Precaución', 'Debe respetarse la autonomía del paciente competente.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c1292492-678a-5edb-a557-4e9d422f09ce', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_37', '22. Límites', 'Los límites regulan:

- cercanía;
- privacidad;
- responsabilidades;
- participación entre subsistemas familiares.

Pueden variar culturalmente.', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('357e75e7-41b3-5f97-89b9-deeb6125567e', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_38', 'En salud', 'El profesional debe evitar invadir espacios o revelar información sin autorización.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dd3cc658-6756-5157-855e-0b7ef83bafcd', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_39', '23. Comunicación familiar', 'Puede ser:

- clara;
- ambigua;
- abierta;
- cerrada;
- directa;
- indirecta.

La comunicación afecta:

- decisiones;
- adherencia;
- resolución de conflictos;
- apoyo.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('875e4e6e-55c0-5976-992c-f0d667ac3389', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_40', '24. Cohesión y adaptabilidad', '', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aee1e898-f856-5f49-8b8e-095beeb3873d', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_41', 'Cohesión', 'Grado de conexión emocional y apoyo.', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('34378a17-2303-5553-8d10-4159deac0fb3', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_42', 'Adaptabilidad', 'Capacidad para reorganizarse frente a cambios.', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('28f97685-e20a-50cf-b1c5-0e63a4a7f709', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_43', 'Ejemplo', 'Después de un accidente, la familia redistribuye tareas y cuidados.

---', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cb5349aa-dfb1-55b3-bc04-b43433e726e5', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_44', '25. Ciclo de vida familiar', 'Las familias atraviesan etapas y transiciones.

Un esquema general puede incluir:

- formación de pareja/familia;
- llegada o crianza de hijos;
- hijos en edad escolar;
- adolescencia;
- salida de hijos;
- envejecimiento;
- pérdidas y reorganización.', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4b0ffb9c-8fc4-5b1e-a114-7b4d57f39e3b', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_45', 'Precaución', 'No todas las familias siguen la misma secuencia.

---', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bce68e7f-283b-5f75-95a2-4b148501a25a', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_46', '26. Transiciones familiares', 'Pueden ser:', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('56648bde-5acc-59b9-a7bc-3defcf2beb64', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_47', 'Esperadas', '- nacimiento;
- escolarización;
- adolescencia;
- jubilación.', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('906f340c-32b0-5264-aaf0-ee58cee6ad89', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_48', 'No esperadas', '- enfermedad grave;
- accidente;
- desempleo;
- desastre;
- migración abrupta;
- muerte prematura.

La capacidad de adaptación influye en salud.

---', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0d3c6bd0-c08d-53b7-9efc-0ce305bcb173', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_49', '27. Crisis familiar', 'Una crisis surge cuando las demandas superan temporalmente recursos y estrategias habituales.

Puede requerir:

- apoyo;
- información;
- redistribución de roles;
- servicios sociales;
- atención en salud mental;
- redes comunitarias.', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5a4c7fcc-d273-5cda-af03-93688f662e44', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_50', 'Clave', 'Crisis no significa automáticamente “familia disfuncional”.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cfce05b2-235b-522d-8cb8-f260be043af5', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_51', '28. Factores protectores', 'Ejemplos:

- comunicación;
- apoyo;
- ingresos estables;
- vivienda segura;
- redes;
- acceso a servicios;
- capacidad de adaptación;
- conocimientos de salud.

---', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('47ee215b-fdea-52d7-9783-3bb58c8fcc25', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_52', '29. Factores de riesgo', 'Ejemplos:

- violencia;
- aislamiento;
- sobrecarga del cuidador;
- desempleo;
- inseguridad alimentaria;
- hacinamiento;
- consumo problemático de sustancias;
- enfermedad crónica sin apoyo;
- barreras de acceso.', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3ec9ad77-e781-5d2d-ba45-f3717bd5fa17', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_53', 'Prioridad', 'La seguridad tiene precedencia cuando existe violencia o riesgo inmediato.

---', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fb114adb-5789-5323-b9fa-56605ee971ad', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_54', '30. Familia y determinantes sociales', 'La familia vive dentro de un contexto:

- económico;
- cultural;
- territorial;
- político;
- ambiental.', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('61604939-4d76-57bb-a45f-8a3db37555fd', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_55', 'Clave', 'No atribuir exclusivamente a la familia problemas generados por barreras estructurales.

---', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('577124c1-673b-50c8-b126-fc7b67c4f1fc', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_56', '31. Familia y Atención Primaria de Salud', 'La APS promueve:

- atención centrada en personas;
- familias;
- comunidades;
- participación;
- continuidad;
- prevención;
- promoción.

La familia es un puente entre individuo y comunidad.

---', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8685d979-3d44-5241-b8d4-e0eb8b2ab611', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_57', '32. Valoración familiar', 'Puede incluir:

- composición;
- edades;
- relaciones;
- enfermedades;
- roles;
- vivienda;
- recursos;
- apoyo;
- comunicación;
- riesgos;
- cultura;
- utilización de servicios.

---', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9f18e176-de5a-5f3c-a50e-951d8ab7022a', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_58', '33. Genograma', 'El **genograma** representa gráficamente:

- miembros;
- parentesco;
- generaciones;
- relaciones;
- algunos antecedentes relevantes.

Puede ayudar a identificar:

- patrones familiares;
- enfermedades;
- cuidadores;
- pérdidas;
- relaciones.', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7c70e9bd-b09d-5ac0-a3c8-0dffb8c460c3', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_59', 'Clave', 'No reemplaza entrevista ni valoración clínica.

---', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c3108437-aaf7-5b89-902f-33029888a9a8', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_60', '34. Ecomapa', 'El **ecomapa** representa vínculos entre la familia y sistemas externos:

- escuela;
- trabajo;
- iglesia/comunidad;
- amigos;
- salud;
- servicios sociales;
- organizaciones.

Ayuda a identificar:

- apoyos;
- tensiones;
- recursos;
- aislamiento.

---', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4321f375-fe73-5ff4-bc75-467acf882a87', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_61', '35. APGAR familiar', 'Es una herramienta breve utilizada para explorar percepción del funcionamiento familiar en determinadas dimensiones.', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('012bcb79-6844-52ce-ae20-941ae2f850d9', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_62', 'Precaución', 'No debe utilizarse como diagnóstico único de “familia funcional/disfuncional” ni sustituye valoración completa.

---', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('69884618-9c8a-56cf-87c7-1a10e768e466', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_63', '36. Visita domiciliaria y familia', 'Permite observar:

- interacción;
- vivienda;
- roles;
- seguridad;
- medicamentos;
- apoyos;
- barreras.

Debe realizarse con:

- respeto;
- privacidad;
- objetivo claro;
- registro;
- seguimiento.

---', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('35b8c6d3-6f5a-5917-b88e-a4f495e50021', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_64', '37. Cuidador principal', 'Debe valorarse:

- capacidad;
- conocimientos;
- carga;
- descanso;
- salud propia;
- apoyo;
- recursos.', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('82a3c8a1-59d0-5df1-bb01-ac815e45ed66', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_65', 'Error', 'Centrarse solo en el paciente dependiente e ignorar al cuidador.

---', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e1a2ac8b-d5b8-5b18-a84c-49fc7662d988', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_66', '38. Educación familiar', 'Debe adaptarse a:

- comprensión;
- cultura;
- recursos;
- responsabilidades;
- disponibilidad.

Puede incluir:

- medicamentos;
- alimentación;
- señales de alarma;
- movilización;
- prevención;
- citas.

---', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d2fb24d4-92ef-5236-bb00-56b2a8b26e96', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_67', '39. Autonomía y confidencialidad', 'La familia puede ser un apoyo, pero el paciente competente mantiene derechos sobre:

- información;
- decisiones;
- privacidad.', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aad24c1f-c094-5a90-bc40-ff707c3f365c', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_68', 'Clave', '“Es familia” no autoriza automáticamente a revelar información clínica.

---', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('80a6bb80-49ff-5280-9e2d-e60a3bc8da18', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_69', '40. Niños y adolescentes', 'En su cuidado deben considerarse:

- responsables legales;
- desarrollo;
- seguridad;
- participación apropiada según edad;
- protección.

La familia es esencial, pero la actuación debe seguir marco legal y derechos del menor.

---', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('27c2548a-2e3a-588a-bd56-abdbd50c293f', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_70', '41. Adulto mayor', 'Valorar:

- independencia;
- cuidador;
- riesgo de abandono;
- polifarmacia;
- caídas;
- redes;
- recursos.', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5e456b44-28ee-5af3-a496-ac4f3a4517df', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_71', 'Clave', 'No asumir dependencia por edad únicamente.

---', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6a652917-3936-5b1e-9ff5-91b9adea8f22', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_72', '42. Enfermedad crónica en la familia', 'Puede generar:

- cambio de roles;
- gastos;
- estrés;
- necesidad de educación;
- sobrecarga;
- adaptación.

Intervenciones:
- autocuidado;
- apoyo al cuidador;
- coordinación;
- seguimiento.

---', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('54d0d4d2-747e-50e5-9f38-7d8c55e539b9', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_73', '43. Discapacidad', 'El enfoque debe priorizar:

- autonomía;
- accesibilidad;
- inclusión;
- apoyo;
- derechos.', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eaaa5840-358e-52a6-9208-4d7f2f405d3f', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_74', 'Error', 'Hablar solo con el familiar cuando la persona puede participar directamente.

---', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('717b09fe-2122-5ce3-9745-cd60d1284d1b', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_75', '44. Violencia familiar', 'Señales o sospechas requieren:

- seguridad;
- valoración;
- documentación objetiva;
- actuación conforme a normativa;
- referencia/protección.', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('71142c2a-8d0e-5ca3-86c4-d666589e87e7', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_76', 'Precaución', 'No realizar confrontaciones que aumenten el riesgo.

---', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b4028158-9116-5d33-b09f-ea5e1f4e43f2', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_77', '45. Duelo', 'La pérdida puede alterar:

- roles;
- economía;
- apoyo;
- salud mental.

La respuesta varía entre personas y culturas.

Enfermería puede:
- escuchar;
- valorar riesgo;
- orientar;
- referir cuando sea necesario.

---', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2a8226e4-6e8f-5e38-a39d-daf2a38c89ca', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_78', '46. Familia y comunidad en Panamá', 'La práctica de APS en Panamá continúa utilizando equipos interdisciplinarios y visitas domiciliarias para acercar servicios a personas y familias con dificultades de traslado.

En 2026 MINSA documentó intervenciones domiciliarias con:

- medicina;
- enfermería;
- trabajo social;
- promoción de la salud.

Esto refuerza el enfoque de atención en el entorno familiar.

---', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4740ac58-2809-5c08-a015-de33fa0ea609', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_79', '47. Rol de enfermería con familias', 'Incluye:

- valoración;
- promoción;
- prevención;
- educación;
- cuidado;
- seguimiento;
- detección de riesgos;
- apoyo al cuidador;
- coordinación;
- referencia;
- participación comunitaria.

---', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6d6a9052-9fcb-5539-9daa-68e7ee324848', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_80', '48. Proceso de enfermería familiar', '', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c01f1a7a-2da2-598d-b2a6-eebfeb6a4710', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_81', 'Valoración', 'Composición, salud, roles, ambiente, recursos.', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5164e163-e5f8-5ac1-a859-a57655b3b436', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_82', 'Identificación/priorización', 'Necesidades y riesgos.', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('df0257c2-63ab-5d36-bfcd-b88b93fd7290', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_83', 'Planificación', 'Metas con la familia.', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d929cea4-41db-5961-ab79-079553d0e6c3', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_84', 'Implementación', 'Educación, cuidado, coordinación.', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f62916ed-00d2-59a4-8724-c75e3bba51f7', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_85', 'Evaluación', 'Cambios, capacidad de autocuidado, acceso y resultados.

---', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2b24adab-40a0-521b-8942-3da468b5376d', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_86', '49. Casos tipo examen', '', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('62331d50-3db3-59de-b10e-97d95f3dbaa4', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_87', 'Caso 1', 'Abuela, madre y nietos viven juntos.

**Tipo estructural:** familia extensa/ampliada.', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('68aacb27-bbe4-5d97-9549-5f99be0f3d3e', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_88', 'Caso 2', 'Madre vive con dos hijos y es la cuidadora principal.

**Tipo:** monoparental.', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6762cb88-81aa-5fd0-9d3a-8e19b2e3181e', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_89', 'Caso 3', 'Pareja forma hogar con hijos de relaciones previas.

**Tipo:** reconstituida/ensamblada.', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('73b64337-d340-59ee-9285-ceecbd27a085', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_90', 'Caso 4', 'Dos personas viven juntas sin parentesco.

**Clave:** pueden formar un hogar; no debe asumirse automáticamente parentesco familiar.', 90)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bce3f066-0399-54d3-98cd-f251c85f32b7', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_91', 'Caso 5', 'Enfermera necesita conocer tres generaciones y antecedentes.

**Herramienta:** genograma.', 91)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4f8d755c-6762-57fb-8503-185fcd2c5a74', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_92', 'Caso 6', 'Se quiere visualizar vínculos con escuela, trabajo y servicios.

**Herramienta:** ecomapa.', 92)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('60e7f765-0a97-50b5-8a4e-5733bd18a9b9', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_93', 'Caso 7', 'Cuidador está agotado por atención continua.

**Necesidad:** valorar sobrecarga y apoyos.', 93)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c67feaa0-ae7d-544f-b6bb-9bd8b1e7b47f', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_94', 'Caso 8', 'Familia reorganiza funciones tras enfermedad.

**Concepto:** adaptabilidad.', 94)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c4076acd-7ce6-558b-9648-bc96d54f197c', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_95', 'Caso 9', 'Profesional informa diagnóstico a familiares sin autorización de paciente competente.

**Problema:** confidencialidad.', 95)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('075a6a86-35a5-553b-ad90-2805df7e49e4', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_96', 'Caso 10', 'Familia tiene vivienda precaria por pobreza estructural.

**Error:** culpabilizar a la familia; deben evaluarse determinantes sociales.', 96)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('543ad20a-b35b-5c0e-b070-edf5f2a00faf', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_97', 'Caso 11', 'Durante visita se sospecha violencia.

**Prioridad:** seguridad y protocolo de protección vigente.', 97)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('66f166ed-0919-579e-8760-bfb59fff82a7', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_98', 'Caso 12', 'Equipo negocia metas con la familia y evalúa resultados.

**Enfoque:** cuidado familiar participativo.

---', 98)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9834e4b3-1bfd-5754-b2a7-4a681372df32', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_99', '50. Errores frecuentes', '1. Familia = solo padre, madre e hijos.
2. Familia = hogar.
3. Familia monoparental = familia disfuncional.
4. Estructura = funcionamiento.
5. Ignorar cuidador principal.
6. Asumir roles sin preguntar.
7. Divulgar información por ser familiar.
8. Culpar a la familia por determinantes sociales.
9. Usar APGAR como diagnóstico definitivo.
10. Ignorar violencia.
11. Elaborar genograma sin entrevista suficiente.
12. Educar sin considerar recursos y cultura.

---', 99)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dfb6610f-611d-5513-bf1a-831944c49184', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_100', '51. Qué memorizar', '**Familia = unidad social y de cuidado; puede adoptar múltiples estructuras.**

**Hogar ≠ familia necesariamente.**

**Nuclear = pareja/hijos.**

**Extensa = incorpora otros familiares/generaciones.**

**Monoparental = un progenitor/cuidador principal con hijos.**

**Reconstituida = nueva pareja con hijos de relaciones previas.**

**Genograma = estructura y relaciones familiares.**

**Ecomapa = vínculos con sistemas externos.**

**Estructura familiar no determina por sí sola funcionalidad.**

**Enfermería valora persona + familia + contexto.**

---', 100)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ca780bb0-4393-59fe-9032-c380231d5ce6', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_101', '52. Fuentes', '', 101)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c1f5da5c-5a91-5906-adbc-b730f97fc1a0', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_102', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 102)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7f37b225-5bc1-5f01-a1e3-0231b47bc63f', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_103', 'Complementarias', '**World Health Organization. Primary Health Care — enfoque de individuos, familias y comunidades.**

**Pan American Health Organization. Primary Health Care.**

**Pan American Health Organization. Expanding the Roles of Nurses in Primary Health Care. 2018.**

**Pan American Health Organization. Strategic Directions for Nursing in the Region of the Americas. 2019.**', 103)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4a610374-f37d-5706-8595-41760a996774', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_104', 'Panamá', '**MINSA. Equipo de Salud de Pueblo Nuevo fortalece la atención integral con visitas domiciliarias. 22 de mayo de 2026.**

---', 104)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cce499eb-058d-5e58-847e-075b3a1b4adf', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_105', '53. Control de calidad', 'Este paquete:

- cubre concepto, estructura y tipos de familia;
- diferencia familia y hogar;
- incluye diversidad estructural sin estigmatizar;
- desarrolla funciones, roles y ciclo vital;
- incorpora genograma y ecomapa;
- integra cuidador, confidencialidad y determinantes;
- relaciona familia con APS y enfermería;
- contiene 12 casos originales;
- mantiene estado `REVIEW`.

---', 105)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c14b5777-6878-543f-bafa-e02f2e91df61', '6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'sec_106', '54. Estado', 'Antes de `SOURCE_VALIDATED` o nivel equivalente:

- revisión final de terminología contra bibliografía docente seleccionada;
- evitar clasificaciones rígidas o estigmatizantes;
- confirmar cualquier instrumento familiar que vaya a utilizarse como evaluación formal;
- enlazar PUBLIC-08 y PUBLIC-13.', 106)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('234c15ab-faf0-5a19-a945-1985b755bb33', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_1', 'Diagnóstico integral de salud', '**Área:** Salud Pública  
**Código:** PUBLIC-13  
**area_code:** `PUBLIC_HEALTH`  
**Estado académico:** `REVIEW`  
**Versión:** 1  
**Revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('14c6d725-2198-5172-9e8b-5f624ccb00e2', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_2', '1. Alcance oficial CICDE', 'El CICDE 2026 incluye expresamente:

**“Diagnóstico integral de salud”.**

Subtemas:

- Investigación en salud.
- Participación comunitaria.
- Construcción de indicadores.
- Etapas:
  - recolección de datos;
  - priorización;
  - planeación;
  - implementación;
  - evaluación.

Este módulo desarrolla el diagnóstico integral como un proceso ordenado para conocer la situación de salud de una población y convertir la información en decisiones, acciones y evaluación.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('85a6b9ed-d843-556e-a90e-fb3ddffbc9e8', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_3', '2. Objetivos de aprendizaje', 'El estudiante debe poder:

1. Explicar qué es un diagnóstico integral de salud.
2. Relacionarlo con el Análisis de Situación de Salud (ASIS).
3. Diferenciar datos primarios y secundarios.
4. Diferenciar información cuantitativa y cualitativa.
5. Reconocer fuentes de información sanitaria.
6. Explicar principios básicos de investigación en salud.
7. Incorporar participación comunitaria.
8. Construir e interpretar indicadores.
9. Priorizar problemas de salud.
10. Formular objetivos y acciones.
11. Diferenciar implementación y evaluación.
12. Explicar el papel de enfermería en cada etapa.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ea53bb8d-e3a1-5760-a7f9-22c11e4f44aa', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_4', '3. ¿Qué es un diagnóstico integral de salud?', 'Es un proceso sistemático para identificar y comprender:

- estado de salud de una población;
- principales enfermedades y riesgos;
- determinantes sociales y ambientales;
- recursos disponibles;
- acceso y utilización de servicios;
- inequidades;
- necesidades percibidas por la comunidad.', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f03c3f3a-7746-5bed-8d8d-5944a3be5b58', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_5', 'Clave', 'No consiste solamente en hacer una lista de enfermedades.

Debe responder:

- ¿quiénes están afectados?
- ¿por qué?
- ¿dónde?
- ¿desde cuándo?
- ¿qué recursos existen?
- ¿qué problemas deben priorizarse?
- ¿qué puede hacerse?
- ¿cómo se sabrá si mejoró?

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4cb8310e-5e3b-5eb8-a005-ea0f17bac313', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_6', '4. Relación con el ASIS', 'El Ministerio de Salud de Panamá mantiene el **Análisis de Situación de Salud (ASIS)** como herramienta para estudiar la situación sanitaria nacional y regional.

El ASIS integra información sobre:

- población;
- mortalidad;
- morbilidad;
- determinantes;
- servicios;
- riesgos;
- desigualdades;
- prioridades.', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('49845263-88a6-5c78-a2e9-884d13882991', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_7', 'Importante', 'En este módulo se utiliza ASIS como marco metodológico relacionado con el diagnóstico integral de salud.

No debe asumirse que todo ejercicio comunitario pequeño requiere reproducir un ASIS nacional completo.

---', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('511bba6c-a47e-5830-8e93-c273735a0ac4', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_8', '5. Finalidad del diagnóstico', 'Sirve para:

- conocer necesidades;
- detectar brechas;
- priorizar problemas;
- orientar recursos;
- diseñar intervenciones;
- establecer línea basal;
- monitorear cambios;
- evaluar resultados.', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b629042d-d515-5b13-8e47-8e0de6e4e802', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_9', 'Clave', 'Diagnosticar sin planificar acciones deja el proceso incompleto.

---', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9cf7d5b5-3d3e-543a-b9a1-a2666cb34bd6', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_10', '6. Enfoque integral', 'Debe considerar varias dimensiones.', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eb52255b-a9ac-51dd-919b-b710b8ef8487', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_11', 'Demográfica', '- edad;
- sexo;
- crecimiento;
- migración.', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b5c31a59-79a2-5378-b59b-59fdabedf69f', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_12', 'Epidemiológica', '- morbilidad;
- mortalidad;
- incidencia;
- prevalencia.', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6c906709-8c52-5059-8079-83fd94abdaca', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_13', 'Social', '- educación;
- empleo;
- pobreza;
- redes.', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1a236402-40b1-5d26-bc23-c59b075b9254', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_14', 'Ambiental', '- agua;
- vivienda;
- saneamiento;
- residuos;
- clima.', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5dc6cfb7-9dd5-5e65-8623-94908444f179', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_15', 'Servicios', '- cobertura;
- acceso;
- recursos;
- calidad.', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9ee26a79-e74f-5152-9560-c115ffc94414', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_16', 'Comunitaria', '- percepción;
- prioridades;
- activos;
- liderazgo.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e1a9f647-858c-53da-8a60-e010d43a4073', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_17', '7. Investigación en salud', 'La investigación en salud es un proceso sistemático para generar o analizar conocimiento útil.

Puede responder preguntas sobre:

- frecuencia;
- distribución;
- causas o asociaciones;
- necesidades;
- calidad;
- efectividad;
- experiencias;
- servicios.', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1a8ae153-24ad-58d5-afd4-9d8529508a17', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_18', 'Clave', 'La investigación comienza con una pregunta clara, no simplemente recopilando datos sin propósito.

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c0ca200b-7209-5445-9025-e30a91d63dff', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_19', '8. Pregunta de investigación', 'Una buena pregunta define:

- población;
- problema;
- lugar;
- tiempo;
- variable o resultado.

Ejemplo:

“¿Cuál es la cobertura de vacunación contra influenza en adultos mayores atendidos en una comunidad durante 2026?”

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('00549936-1b25-55ca-8199-c4edbdb56f13', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_20', '9. Fuentes primarias', 'Datos recogidos directamente para el estudio.

Ejemplos:

- encuesta;
- entrevista;
- observación;
- medición;
- grupo focal;
- visita domiciliaria.', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('202c8531-0424-5435-98db-db8a6d1a6e56', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_21', 'Ventaja', 'Permiten obtener información específica.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ab0f6268-cd8d-50e3-b33a-8735f5ce6ec0', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_22', 'Limitación', 'Requieren tiempo, recursos y planificación.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f87d161b-9e06-54ee-835e-74e549f0b367', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_23', '10. Fuentes secundarias', 'Información ya existente.

Ejemplos:

- registros clínicos;
- estadísticas vitales;
- censos;
- boletines epidemiológicos;
- bases de datos;
- informes;
- ASIS;
- registros de programas.', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b89aafaa-014d-5a6a-b5f5-fe36732d1dbe', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_24', 'Clave', 'Antes de recolectar nuevos datos debe revisarse qué información confiable ya existe.

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('395e11b6-17a2-5cfc-8be9-6450d44f843a', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_25', '11. Datos cuantitativos', 'Se expresan numéricamente.

Ejemplos:

- número de casos;
- edad;
- tasa;
- porcentaje;
- cobertura;
- mortalidad.

Permiten medir:

- magnitud;
- frecuencia;
- tendencia;
- comparación.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5850782b-98f2-5ff8-802e-caebdbf76e2d', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_26', '12. Datos cualitativos', 'Exploran:

- percepciones;
- experiencias;
- barreras;
- creencias;
- prioridades;
- explicaciones.

Métodos:

- entrevistas;
- grupos focales;
- observación;
- diálogo comunitario.', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('13cc55ea-b773-5115-8767-2c53ad957e64', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_27', 'Clave', 'Los datos cualitativos ayudan a comprender el “por qué” detrás de los números.

---', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b95255b7-d67d-572b-989f-cf8494c58699', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_28', '13. Métodos mixtos', 'Combinan información:

- cuantitativa;
- cualitativa.

Ejemplo:

1. Los datos muestran baja cobertura.
2. Las entrevistas revelan que el horario del centro dificulta asistir.', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('794d58a5-7744-5117-a644-d871cc1ea488', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_29', 'Valor', 'Permiten interpretar mejor el problema y diseñar una intervención más adecuada.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a1833d6d-1cfc-53ac-8271-2c7864a3e3dc', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_30', '14. Población de estudio', 'Es el conjunto de personas o unidades sobre las que se desea obtener información.

Debe definirse con claridad.

Ejemplos:

- niños menores de 5 años;
- embarazadas;
- hogares de un corregimiento;
- adultos mayores;
- estudiantes.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eb8a02e8-6437-5d6b-8832-02ddb322fb97', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_31', '15. Muestra', 'Cuando no es posible estudiar toda la población puede seleccionarse una muestra.

Debe procurarse que sea adecuada para el objetivo del estudio.', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('423c4005-94b2-50df-9a6a-69b2986a1a2a', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_32', 'Error', 'Generalizar a toda una comunidad a partir de unas pocas personas seleccionadas sin método.

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1942b2b3-6b3a-55c3-ad11-49f146fa64a9', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_33', '16. Sesgos', 'Un sesgo es un error sistemático que puede distorsionar los resultados.

Ejemplos:

- seleccionar únicamente personas fáciles de localizar;
- preguntas dirigidas;
- registros incompletos;
- subregistro;
- medición inconsistente.', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1f8cc606-f58e-5f01-a055-7d506ed19da5', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_34', 'Clave', 'Más datos no corrigen automáticamente un dato sesgado.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c3505a1b-d983-5fa2-a34c-8748d8f35c88', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_35', '17. Ética en investigación y diagnóstico', 'Debe protegerse:

- dignidad;
- privacidad;
- confidencialidad;
- consentimiento cuando corresponda;
- seguridad;
- uso apropiado de datos.', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b3d7009c-4725-5572-aaed-d62d7cd0bb35', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_36', 'Enfermería', 'No debe compartir información identificable de pacientes o familias fuera de los canales autorizados.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('59768434-c05a-5d07-a563-58dfc7dd0926', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_37', '18. Recolección de datos', 'Es la primera etapa explícita del proceso solicitado por CICDE.

Debe responder al objetivo definido.

Puede incluir:

- revisión documental;
- registros;
- encuestas;
- observación;
- entrevistas;
- visitas domiciliarias;
- mapeo comunitario;
- indicadores.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4dc878c8-7dde-5973-b5e2-456a77f20b6e', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_38', '19. Plan de recolección', 'Debe establecer:

- qué dato;
- para qué;
- de qué fuente;
- quién lo recoge;
- cuándo;
- cómo;
- cómo se registrará;
- cómo se protegerá.', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3cec312f-8457-5a07-88b6-bce6943f6731', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_39', 'Clave', 'No recoger información que no se utilizará.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('81ff8331-341d-5ad7-8ce4-ce9d058e51fb', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_40', '20. Calidad de datos', 'Características deseables:

- exactitud;
- completitud;
- oportunidad;
- consistencia;
- comparabilidad;
- validez.', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f18127aa-29d5-596c-b18c-d6af4c4c10fe', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_41', 'Ejemplo', 'Si distintos equipos usan definiciones diferentes de “caso”, la comparación puede ser inválida.

---', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2d02a34b-8e8f-5e4d-97b0-b5c0d5de49ff', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_42', '21. Triangulación', 'Consiste en contrastar varias fuentes o métodos.

Ejemplo:

- registro de casos;
- encuesta comunitaria;
- observación ambiental.

Si convergen, aumenta la confianza en la interpretación.

Si discrepan, debe investigarse la causa.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2cb73158-4264-57e1-bb30-73b57a9fead7', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_43', '22. Participación comunitaria', 'La OMS define la participación social como la intervención de personas, comunidades y sociedad civil en decisiones que afectan la salud.

En un diagnóstico integral la comunidad puede participar en:

- identificar problemas;
- aportar conocimiento local;
- validar hallazgos;
- priorizar;
- diseñar soluciones;
- ejecutar;
- evaluar.', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e2e74420-31cf-5187-9387-eb713fdfadc0', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_44', 'Clave', 'La comunidad no es solo una fuente de datos.

Es un actor del proceso.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('86e8efbc-2db8-5519-9fb7-4534c9e7901f', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_45', '23. Niveles de participación', 'Puede ir desde:

- información;
- consulta;
- colaboración;
- participación en decisiones;
- liderazgo comunitario.', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8fc2214c-091e-5240-94a0-e77082d8d577', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_46', 'Error', 'Llamar “participativo” a un diagnóstico donde la comunidad solo responde encuestas y nunca participa en decisiones.

---', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d8fd59c2-55e2-57dc-b118-40b706a62ed5', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_47', '24. Activos comunitarios', 'El diagnóstico no debe identificar únicamente problemas.

También debe reconocer recursos como:

- líderes;
- organizaciones;
- escuelas;
- iglesias;
- instalaciones;
- redes;
- promotores;
- espacios públicos;
- conocimientos locales.', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d854d9c8-97ac-536d-a5df-8f7e70301730', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_48', 'Clave', 'Necesidades + recursos = mejor planificación.

---', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8b485668-f10f-5063-960f-9ad0dac2a55f', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_49', '25. Construcción de indicadores', 'Un indicador debe expresar de manera clara una característica que se desea medir.

Debe definir:

- nombre;
- objetivo;
- numerador;
- denominador cuando corresponda;
- unidad;
- fuente;
- período;
- población;
- interpretación.

---', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('da124b37-3373-5db5-a957-3ca8d235d537', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_50', '26. Numerador y denominador', 'Ejemplo:

**Cobertura de vacunación = personas vacunadas / población objetivo × 100**

- numerador: personas vacunadas;
- denominador: población objetivo.', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e2d7ba23-6cd3-57d7-8cb4-b95ff78a2ef9', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_51', 'Error', 'Utilizar un denominador que no corresponde al grupo estudiado.

---', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('be69b075-ac21-5c02-b93a-50f3f448d6bc', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_52', '27. Tipos de indicadores', '', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2f4cdaca-daa6-50f9-8014-5068eb3ab1dd', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_53', 'Demográficos', '- población;
- natalidad;
- estructura por edad.', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('09d4f641-d860-50d9-b747-8b29d8c7997a', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_54', 'Epidemiológicos', '- incidencia;
- prevalencia;
- mortalidad;
- letalidad.', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('959a760c-ce8e-5076-80f7-cf70aa13ec99', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_55', 'Servicios', '- cobertura;
- consultas;
- disponibilidad.', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0673d915-11ef-51dd-a157-6dc1ea002077', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_56', 'Sociales', '- escolaridad;
- desempleo;
- pobreza.', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('19bb7c86-15a9-5a8f-a7d6-7da1456d031d', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_57', 'Ambientales', '- agua;
- saneamiento;
- vivienda.

---', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9aa03c95-a9bb-5acb-8b35-62454c7c5c19', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_58', '28. Indicadores de estructura, proceso y resultado', '', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2defd7d3-04e8-5052-96d0-b5080612e8fa', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_59', 'Estructura', 'Recursos.

Ejemplo:
- número de enfermeras.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bb5f7ff0-3b42-58c8-9cf3-13ca5632aa48', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_60', 'Proceso', 'Actividades realizadas.

Ejemplo:
- porcentaje de embarazadas con control.', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f570b4e7-ce31-5a35-bba1-c425b263d080', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_61', 'Resultado', 'Cambio en salud o condición.

Ejemplo:
- reducción de complicaciones.', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('995e4f00-32f0-59f2-b418-914cb796e9ea', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_62', 'Clave', 'Actividad realizada no equivale automáticamente a resultado logrado.

---', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('45443a9f-0c12-58d4-ac8c-5ddaa477021b', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_63', '29. Desagregación', 'Siempre que sea pertinente, un indicador puede analizarse por:

- edad;
- sexo;
- territorio;
- nivel socioeconómico;
- población específica.', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('28d9dc90-fc16-5012-a8bd-4243efa954a3', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_64', 'Valor', 'La desagregación ayuda a descubrir inequidades ocultas por un promedio general.

---', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('529739eb-83ac-59d3-8e03-f0f3a6be139d', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_65', '30. Línea basal', 'Es la medición inicial antes de una intervención.

Permite comparar posteriormente.

Ejemplo:

- cobertura antes del programa: 65%;
- cobertura después: 82%.', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('50f15050-649f-5aab-a1f8-a40b92b41fbd', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_66', 'Precaución', 'Una diferencia temporal no demuestra por sí sola causalidad.

---', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e7c58218-d9d0-5e5a-b766-8c2699d37c1b', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_67', '31. Meta', 'Una meta indica el resultado esperado en un período.

Debe ser:

- específica;
- medible;
- realista;
- relevante;
- delimitada en tiempo.', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b0c5c643-6db9-5dea-b685-addf79b6cd45', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_68', 'Ejemplo', '“Aumentar la cobertura del 65% al 80% en 12 meses.”

---', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f9c1187a-c881-5f25-aaae-4c161b58b7ae', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_69', '32. Priorización', 'Es la segunda etapa explícita indicada por CICDE.

No todos los problemas pueden abordarse simultáneamente.

Criterios frecuentes:

- magnitud;
- gravedad;
- vulnerabilidad;
- tendencia;
- inequidad;
- factibilidad;
- recursos;
- percepción comunitaria.

---', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1c5478fd-aa5b-5dc4-a6cc-e45bc25f9b46', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_70', '33. Magnitud', 'Pregunta:

**¿A cuántas personas afecta?**

Puede medirse mediante:

- número;
- proporción;
- tasa;
- cobertura.', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9d2fb009-67ff-5569-9f2f-6d761621809b', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_71', 'Precaución', 'Un problema poco frecuente puede seguir siendo prioritario si es extremadamente grave.

---', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5fcd5da7-155f-5e7d-9454-ecc8aa3d2761', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_72', '34. Gravedad', 'Puede considerar:

- mortalidad;
- discapacidad;
- complicaciones;
- hospitalización;
- impacto social;
- urgencia.

---', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1e90e460-b9d8-5d24-8fd7-13cf1f87d7d9', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_73', '35. Vulnerabilidad o posibilidad de intervención', 'Pregunta:

**¿El problema puede modificarse con intervenciones disponibles?**

Ejemplo:

Un problema con medidas preventivas efectivas puede obtener alta prioridad.

---', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bda4e7f4-80cf-5d37-b9a5-e46c075b3ed1', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_74', '36. Factibilidad', 'Considera:

- recursos;
- personal;
- tiempo;
- aceptación;
- capacidad técnica;
- marco legal;
- sostenibilidad.', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1f613a27-289d-5a33-99ea-0d2cc775cdd1', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_75', 'Clave', 'Una intervención ideal pero imposible de ejecutar necesita adaptación.

---', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('206c71b3-63ac-52c1-8e6d-58fccd9e4684', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_76', '37. Priorización participativa', 'La comunidad puede valorar:

- importancia;
- urgencia;
- impacto;
- aceptabilidad.', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9391028c-cacc-53e4-97a8-4219f0047326', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_77', 'Error', 'Priorizar exclusivamente desde estadísticas sin considerar percepción comunitaria.

También sería incorrecto priorizar únicamente por percepción ignorando evidencia.

---', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ac1dbab9-1dee-5839-99e6-999bb52550a2', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_78', '38. Matriz de priorización', 'Puede asignar puntajes a criterios.

Ejemplo conceptual:

| Problema | Magnitud | Gravedad | Factibilidad | Prioridad |
|---|---:|---:|---:|---:|
| A | 3 | 3 | 2 | 8 |
| B | 2 | 2 | 3 | 7 |', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('62d03c30-f7fe-5614-b1f5-d05a066d52c7', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_79', 'Precaución', 'El puntaje es una ayuda para decidir, no sustituye el juicio epidemiológico y comunitario.

---', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c33dbc3c-e349-5881-a7ca-d3a44222ee8a', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_80', '39. Formulación del problema', 'Debe describirse de manera específica.

Débil:

“Hay mala salud.”

Mejor:

“Existe baja cobertura de vacunación contra influenza en personas de 60 años y más de la comunidad X durante 2026.”

---', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('df3018d5-72d5-5cb0-8c5d-b1c9e0687533', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_81', '40. Análisis causal', 'Antes de intervenir se deben explorar causas y factores asociados.

Puede utilizarse:

- árbol de problemas;
- diagrama causa-efecto;
- análisis de determinantes;
- discusión comunitaria.', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aa9c021a-9c4b-575c-a9ac-5511bbe01fb9', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_82', 'Clave', 'No confundir causa con consecuencia.

---', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('33900480-f6a4-55eb-8327-41c040f12d34', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_83', '41. Planeación', 'Es la tercera etapa explícita del CICDE.

Debe definir:

- problema prioritario;
- objetivo;
- población;
- actividades;
- responsables;
- recursos;
- cronograma;
- indicadores;
- meta;
- evaluación.

---', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a4137735-eb1a-58e2-9d24-8da0216bd41d', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_84', '42. Objetivo general y objetivos específicos', '', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7aae1e9d-8835-54aa-906f-a98b149a57d7', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_85', 'General', 'Expresa el cambio amplio esperado.', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3d6ec650-883a-5aa5-b77d-825bf1a89aa8', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_86', 'Específicos', 'Describen resultados concretos que contribuyen al objetivo general.', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b997afb3-8d8e-5151-9b9a-d43d6c496081', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_87', 'Ejemplo', 'General:
“Mejorar la cobertura de vacunación en adultos mayores.”

Específico:
“Identificar durante el primer trimestre a adultos mayores con esquema pendiente.”

---', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2d366945-a5f0-5e08-9fb6-a3cfdbdac8f5', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_88', '43. Actividades', 'Deben corresponder a la causa y al objetivo.

Ejemplos:

- visitas domiciliarias;
- jornada;
- educación;
- búsqueda activa;
- coordinación de transporte;
- eliminación de criaderos;
- referencia.', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0b5cfcd5-ce14-5493-8df5-9e871877c181', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_89', 'Error', 'Elegir una charla como solución automática para cualquier problema.

---', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9f92e82d-6889-5d17-aa99-328944d714ff', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_90', '44. Responsables', 'Toda actividad debe tener:

- responsable;
- colaboradores;
- fecha;
- recursos.', 90)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4e1fd11a-2a2d-5c04-9027-e6c8199a062e', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_91', 'Clave', '“Que alguien lo haga” no es planificación.

---', 91)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1f85e81f-6b61-5b48-8628-07ffad677434', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_92', '45. Recursos', 'Pueden ser:

- humanos;
- materiales;
- financieros;
- tecnológicos;
- comunitarios;
- logísticos.

Los activos comunitarios pueden reducir barreras y fortalecer sostenibilidad.

---', 92)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('31b0a7be-18a3-5621-a651-3d462a4fc2db', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_93', '46. Cronograma', 'Ordena actividades en el tiempo.

Debe considerar:

- secuencia;
- dependencia;
- fechas;
- responsables;
- disponibilidad.

---', 93)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b2b8980d-a8a4-56d5-a5eb-8d526da8f187', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_94', '47. Implementación', 'Es la cuarta etapa explícita indicada por CICDE.

Significa ejecutar el plan.

Requiere:

- coordinación;
- comunicación;
- supervisión;
- registro;
- resolución de problemas;
- adaptación.', 94)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('37521d34-a053-56ce-bbd3-336e0da92c29', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_95', 'Clave', 'Implementar no significa repetir ciegamente el plan si aparecen obstáculos.

Los cambios deben justificarse y documentarse.

---', 95)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('14587665-9170-5bc6-8622-7bf2172133f7', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_96', '48. Monitoreo durante implementación', 'Permite saber:

- qué se está haciendo;
- cuánto;
- cuándo;
- con qué cobertura;
- con qué dificultades.

Ejemplos:

- hogares visitados;
- personas vacunadas;
- sesiones realizadas;
- personas referidas.

---', 96)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1b548de1-4236-5ec4-8b7d-f1aebac99464', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_97', '49. Evaluación', 'Es la quinta etapa explícita CICDE.

Determina en qué medida se alcanzaron:

- actividades;
- objetivos;
- resultados;
- impacto esperado.

---', 97)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('050dbd8b-e935-534d-a44b-413bf6fadf1b', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_98', '50. Evaluación de proceso', 'Pregunta:

**¿Se hizo lo planificado?**

Ejemplos:

- número de visitas;
- porcentaje de actividades realizadas;
- cobertura alcanzada.

---', 98)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('683082fc-8714-53da-9d05-841745a11e47', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_99', '51. Evaluación de resultado', 'Pregunta:

**¿Cambió el problema o la condición?**

Ejemplos:

- aumento de cobertura;
- mejor conocimiento;
- reducción de criaderos;
- mejora de control.

---', 99)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cd50ad3b-87dd-51ce-a4ec-7ca6ecb8db6d', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_100', '52. Evaluación de impacto', 'Busca cambios más amplios o de mayor plazo.

Ejemplos:

- reducción sostenida de incidencia;
- disminución de mortalidad;
- reducción de inequidades.', 100)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('26667dc9-169c-57cb-b520-c74ee194ebe1', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_101', 'Precaución', 'El impacto puede depender de múltiples factores, no solo de una intervención.

---', 101)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ecbe2405-33b1-5c65-87c0-b0aacc8d7d79', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_102', '53. Retroalimentación', 'Los resultados deben volver a:

- equipo;
- autoridades;
- comunidad.

Esto permite:

- aprender;
- corregir;
- rendir cuentas;
- planificar el siguiente ciclo.', 102)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('743a6fb1-bd87-54dd-afc4-b2df61a54781', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_103', 'Clave', 'El diagnóstico integral es cíclico.

Después de evaluar se vuelve a valorar la nueva situación.

---', 103)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3ac67e35-0557-5d1c-8c39-76033478d430', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_104', '54. Ciclo completo', '**Recolección de datos  
→ análisis  
→ priorización  
→ planeación  
→ implementación  
→ monitoreo  
→ evaluación  
→ retroalimentación  
→ nueva valoración**', 104)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e0fec980-5c21-5ebc-b0fe-eed70394ef94', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_105', 'Para CICDE', 'Las cinco etapas que deben reconocerse expresamente son:

**recolección de datos → priorización → planeación → implementación → evaluación.**

---', 105)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a53f3fec-0bb5-57cd-9ebf-899bb566db4f', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_106', '55. Panamá — Guía ASIS', 'MINSA mantiene una **Guía para la elaboración del Análisis de Situación de Salud (ASIS)** y un repositorio de análisis nacionales y regionales.

Actualmente están disponibles análisis:

- nacionales;
- regionales;
- mortalidad;
- cáncer;
- desigualdades;
- carga de enfermedad;
- eventos específicos.', 106)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('87ac6c77-ad20-5438-ab79-5de5af2b27c9', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_107', 'Clave', 'Panamá utiliza el análisis de situación como herramienta real de planificación sanitaria.

---', 107)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7e4c889e-8773-5de4-be4b-82cbb86456ee', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_108', '56. Panamá — indicadores oficiales', 'MINSA mantiene indicadores por:

- República;
- provincias;
- comarcas.

También publica:

- anuarios;
- población;
- instalaciones;
- estadísticas;
- mortalidad y morbilidad.', 108)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9e189e7d-7543-524c-acbf-4921536facd9', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_109', 'Aplicación', 'Estas fuentes son apropiadas para construir un diagnóstico con información secundaria oficial.

---', 109)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e853c01b-1b41-52be-9fc5-5ae324fb85bf', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_110', '57. Panamá — transformación de datos 2026', 'En junio de 2026 MINSA, con apoyo OPS/OMS, puso en marcha un proyecto para transformar datos de Registros Médicos y Estadísticas de Salud (REGES) en tableros para la toma de decisiones.

Busca integrar y estandarizar datos de:

- mortalidad;
- morbilidad;
- enfermedades no transmisibles.', 110)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('102f8334-e0ec-578b-9189-aba5e66f09eb', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_111', 'Clave', 'Los datos no son un fin en sí mismos: deben apoyar decisiones y planificación.

---', 111)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('96a8236a-fe1f-5cfc-9658-c745e247eb97', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_112', '58. Participación comunitaria en Panamá 2026', 'MINSA ha reiterado durante 2026 la importancia de la participación comunitaria para prevenir enfermedades.

Además, lineamientos oficiales para agentes comunitarios frente a malaria reconocen:

- corresponsabilidad;
- apropiación local;
- enfoque intercultural;
- vigilancia y respuesta comunitaria.', 112)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('df52d4cb-eb4d-50af-a48b-a9138b0bea11', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_113', 'Clave', 'La participación tiene un papel operativo, no solamente educativo.

---', 113)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bbf99a40-f031-5427-806a-666c736e68e4', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_114', '59. Rol de enfermería en el diagnóstico integral', 'Enfermería puede participar en:

- recolección;
- registros;
- encuestas;
- visitas;
- análisis;
- indicadores;
- identificación de riesgos;
- priorización;
- planificación;
- implementación;
- evaluación;
- devolución de resultados.

---', 114)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ad0c94a7-cf46-5136-aa24-134fe2fc0c05', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_115', '60. Enfermería y calidad del dato', 'Responsabilidades:

- registrar correctamente;
- usar definiciones vigentes;
- evitar duplicación;
- verificar datos;
- proteger confidencialidad;
- comunicar inconsistencias.', 115)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0565dd9b-00ef-57c4-8565-3e0cdbd7ce1e', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_116', 'Clave', 'Un mal registro puede producir una mala decisión de salud pública.

---', 116)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('369709da-6eda-52eb-b9d7-2f82267ffabe', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_117', '61. Enfermería y comunidad', 'El profesional puede facilitar:

- reuniones;
- educación;
- diálogo;
- identificación de líderes;
- priorización;
- movilización;
- evaluación participativa.', 117)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2fac5945-6675-5b3e-ac0f-e735c2bf0d1c', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_118', 'Error', 'Decidir por la comunidad sin escucharla.

---', 118)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('01e6a5ae-b9a5-58fb-92e8-3cdf93e4a518', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_119', '62. Ejemplo integrador — dengue', '', 119)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dfa5f27b-310a-5320-b2fc-dbb869c87d9d', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_120', 'Recolección', 'Casos, criaderos, agua, vivienda, percepción.', 120)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dc54d2f0-3fe2-50c6-9d21-e908d355b870', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_121', 'Priorización', 'Alta incidencia y riesgo estacional.', 121)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b198335c-9686-5309-9e30-36b38d0bef95', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_122', 'Planeación', 'Eliminar criaderos, educación, visitas y coordinación.', 122)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6d293055-37b4-5a82-89ac-f0d9d96ae8ee', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_123', 'Implementación', 'Acción comunitaria y control ambiental.', 123)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d8ec9148-5cc8-514f-bbe5-2cc77d3cd8d5', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_124', 'Evaluación', 'Criaderos, casos, participación y cobertura.

---', 124)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('95769fc6-a20f-5569-96f5-6b4133c4e77f', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_125', '63. Ejemplo integrador — vacunación', '', 125)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f7c0eec0-99ee-50af-8617-f6cec6cc84e7', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_126', 'Recolección', 'Cobertura por edad y barrio.', 126)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('04c870ea-c228-59ab-b237-c269afc88e9b', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_127', 'Problema', 'Adultos mayores con cobertura baja.', 127)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('42242058-e937-5330-aa46-d888b2bc2633', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_128', 'Priorización', 'Alta vulnerabilidad y enfermedad prevenible.', 128)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('66992883-422a-56ae-ba1a-c9512654022e', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_129', 'Planeación', 'Búsqueda, horario extendido, visitas.', 129)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('760ad13e-c64d-51b4-8475-07508d85b84e', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_130', 'Implementación', 'Vacunación y registro.', 130)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7b95ed57-10b8-56f5-a8ac-d2d74dbd56a3', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_131', 'Evaluación', 'Nueva cobertura y población pendiente.

---', 131)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('710d4ae4-c4f5-5b81-a2c9-c77c9343161a', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_132', '64. Ejemplo integrador — hipertensión', '', 132)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b1cc5913-b31b-5bcd-9cb1-33833715a89d', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_133', 'Datos', 'Registros muestran baja proporción de pacientes controlados.', 133)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('285a4474-3442-509b-8cda-5ccad351158b', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_134', 'Información cualitativa', 'Usuarios señalan dificultad para obtener citas.', 134)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('009ae0e2-56e0-55cf-aab5-9700cf4e693c', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_135', 'Priorización', 'Alta carga y riesgo cardiovascular.', 135)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e1ba4912-86ed-50b3-956b-e4ceded7e7f5', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_136', 'Plan', 'Mejorar seguimiento y acceso.', 136)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('65f9162f-3c6a-5383-94aa-16e5944b744b', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_137', 'Evaluación', 'Control de presión y continuidad.

---', 137)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b5cb74af-32a5-5641-9f66-778cfe896cea', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_138', '65. Casos tipo examen', '', 138)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2903c407-46de-5b17-a777-12daef235dc1', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_139', 'Caso 1', 'Equipo comienza recolectando toda clase de información sin pregunta ni objetivo.

**Error:** la recolección debe responder al propósito del diagnóstico.', 139)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7c4f3c12-7dc8-5d9f-b08e-1081f8c9cf17', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_140', 'Caso 2', 'Se utilizan registros existentes de mortalidad.

**Tipo de fuente:** secundaria.', 140)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7da45d27-0170-596c-8656-15ca69af4a76', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_141', 'Caso 3', 'Enfermera realiza entrevistas a familias.

**Tipo de fuente:** primaria y cualitativa.', 141)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('19ec7dd1-6e3c-5677-836d-a791017c81c7', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_142', 'Caso 4', 'Registro muestra baja cobertura y entrevistas revelan barreras de transporte.

**Método:** combinación/triangulación de datos.', 142)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('312e4105-c160-5b3a-b5cf-fdbbe70b196c', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_143', 'Caso 5', 'Se divide número de vacunados entre población objetivo.

**Resultado:** indicador de cobertura.', 143)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d932cb38-4e50-522f-a9ef-ba3b45f41580', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_144', 'Caso 6', 'Se compara un indicador por corregimiento y edad.

**Acción:** desagregación para detectar brechas.', 144)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('308198b5-4ec9-51c1-b87a-35abd5b7cd1f', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_145', 'Caso 7', 'Problema afecta pocos casos pero causa alta mortalidad.

**Interpretación:** gravedad puede elevar prioridad aunque magnitud sea baja.', 145)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('66272875-098c-59a8-bc26-839144776ea7', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_146', 'Caso 8', 'Comunidad identifica un problema que no aparece claramente en registros.

**Conducta:** investigarlo e integrar evidencia y percepción comunitaria.', 146)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3ef88847-1152-5049-89a3-a991af8671e9', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_147', 'Caso 9', 'Plan establece actividades pero no responsable ni fecha.

**Problema:** planeación incompleta.', 147)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('097d1c5b-9d02-591e-a06e-3f0fe7e36673', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_148', 'Caso 10', 'Durante ejecución aparece una barrera imprevista.

**Conducta:** adaptar justificadamente y documentar.', 148)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('13eca372-a84a-540b-8ecd-eb6750c3d497', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_149', 'Caso 11', 'Programa contabiliza talleres pero no mide cambios.

**Limitación:** evalúa actividad/proceso, no resultado.', 149)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a7b42562-9a18-5126-a2aa-8366af725125', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_150', 'Caso 12', 'Después de evaluar, el equipo comparte resultados y replanifica.

**Concepto:** ciclo continuo de mejora.

---', 150)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b6a5023a-cd65-5040-b38a-22e89233fe15', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_151', '66. Errores frecuentes', '1. Diagnóstico = lista de enfermedades.
2. Recolectar datos sin objetivo.
3. Confundir datos primarios y secundarios.
4. Usar una muestra sesgada como si representara toda la población.
5. Ignorar información cualitativa.
6. Excluir a la comunidad de decisiones.
7. Construir indicador sin denominador correcto.
8. Confundir actividad con resultado.
9. Priorizar solo por magnitud.
10. Planificar sin responsables o indicadores.
11. Implementar sin monitorear.
12. Evaluar solo al final sin línea basal.

---', 151)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('859d8850-4b12-5296-91e6-3c2c569af06a', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_152', '67. Qué memorizar', '**Diagnóstico integral = datos + análisis + determinantes + comunidad + prioridades + acción.**

**Primarios = recogidos directamente.**

**Secundarios = ya existentes.**

**Cuantitativo = cuánto.**

**Cualitativo = cómo/por qué/experiencia.**

**Indicador = definición + numerador + denominador + población + período + fuente.**

**Priorización = magnitud + gravedad + vulnerabilidad + factibilidad + comunidad.**

**Etapas CICDE:**

**1. Recolección de datos  
2. Priorización  
3. Planeación  
4. Implementación  
5. Evaluación**

**Participación comunitaria atraviesa todo el proceso.**

**Después de evaluar, el ciclo vuelve a comenzar.**

---', 152)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3bf520b6-80d5-52ab-aa45-b512f4b6cfdc', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_153', '68. Fuentes', '', 153)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5374932f-4d7b-5ddb-839a-05448d6c04ac', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_154', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 154)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c45bac3c-a01b-5c11-97f4-1cf1c1761f6c', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_155', 'Panamá', '**Ministerio de Salud de Panamá. Guía para la elaboración del Análisis de Situación de Salud (ASIS).**

**Ministerio de Salud de Panamá. Análisis de Situación de Salud (ASIS), repositorio nacional y regional.**

**Ministerio de Salud de Panamá. Indicadores de Salud.**

**Ministerio de Salud de Panamá. Estadísticas de Salud.**

**MINSA. Minsa impulsa la transformación digital de las estadísticas de salud para fortalecer la toma de decisiones. 8 de junio de 2026.**

**MINSA. Resolución No. 112 de 25 de febrero de 2026 — Lineamientos Operacionales para la Participación de los Agentes Comunitarios en la Eliminación de la Malaria en Panamá. Gaceta Oficial Digital No. 30500-E, 9 de abril de 2026.**', 155)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('55e46128-bd69-51a2-8ba7-756f96f35e72', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_156', 'Complementarias', '**World Health Organization & UNICEF. Primary health care measurement framework and indicators: monitoring health systems through a primary health care lens. 2022.**

**World Health Organization. Social participation for universal health coverage: technical paper. 2023.**

**Pan American Health Organization. Indicadores de Salud: elementos básicos para el análisis de situación de salud.**

---', 156)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('36575ee1-8a48-5ece-a101-28bc57052e35', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_157', '69. Control de calidad', 'Este paquete:

- cubre el tema exacto CICDE;
- cubre investigación en salud;
- cubre participación comunitaria;
- desarrolla construcción e interpretación de indicadores;
- conserva expresamente las cinco etapas CICDE;
- integra fuentes primarias/secundarias y cuantitativas/cualitativas;
- incluye priorización por magnitud, gravedad, vulnerabilidad y factibilidad;
- incorpora metodología ASIS de MINSA;
- incluye información oficial panameña de indicadores y estadísticas;
- incorpora actualidad 2026 sobre transformación de datos y participación comunitaria;
- contiene 12 casos originales;
- mantiene estado `REVIEW`.

---', 157)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1fb9c1a6-1c78-5e7f-aa30-c13d6fcef2ff', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_158', '70. Estado para integración', '**Estado recomendado:** `REVIEW`

Antes de `SOURCE_VALIDATED` o nivel equivalente:

- concluir la comprobación cruzada de PUBLIC-01 a PUBLIC-13;
- mantener trazabilidad de las fuentes oficiales;
- validar todos los JSON y referencias en el proceso de integración;
- no liberar contenido al rol STUDENT hasta aplicar la política de publicación definida para contenido auditado.', 158)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('56c1169f-c38e-5b03-9d4a-2d70338efcfe', '3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'sec_159', 'Resultado de auditoría documental 2026-09-10', 'Se reconfirmó:

- existencia de la Guía MINSA para elaboración del ASIS;
- repositorio nacional y regional de ASIS;
- disponibilidad de análisis nacionales, regionales, de mortalidad, cáncer, desigualdades y carga de enfermedad;
- proyecto REGES de transformación de datos en tableros para toma de decisiones, iniciado el 8 de junio de 2026 con respaldo OPS/OMS;
- definición OMS de participación social como participación inclusiva de personas, comunidades y sociedad civil en decisiones de salud;
- Resolución No. 112 de 25 de febrero de 2026 sobre participación de agentes comunitarios en la **eliminación de la malaria en Panamá**.

Se corrigió el título de esta última referencia para que coincida con la denominación normativa oficial. No se detectaron errores metodológicos mayores.', 159)
ON CONFLICT (lesson_id, section_key) DO NOTHING;

-- 4. Insert lesson-source relationships.
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'dbaaa09a-8ed1-535a-8a28-178534e7432c', NULL, 'Edición a cargo de Carlos Miguel Ríos González; 1.ª edición, 2022.', false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', '7fe36274-9698-5be3-ba6d-bd00442bca16', NULL, 'Referencia listada por CICDE; ficha editorial exacta no corroborada de forma independiente al 2026-09-10.', false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', '3d272be7-05b5-51c9-85c2-d27fdbc7e2d1', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'c2ffce81-e399-518c-9358-db25f35ad5fa', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', '8fab4086-7dae-5f32-aa46-2d6c51658c9f', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', 'c63442be-16de-558f-8ec9-96512fdb8063', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', '3b633e82-19f1-5069-8f2d-526171bea8ba', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('9e89bdfd-4b0d-5f22-a2ba-6b3d8c2f5ba6', '6272b064-2692-5324-9cc2-b6f87efa22cb', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('0eccfab6-0acf-5322-8274-a6a24050deb6', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('0eccfab6-0acf-5322-8274-a6a24050deb6', 'dbaaa09a-8ed1-535a-8a28-178534e7432c', NULL, 'Edición a cargo de Carlos Miguel Ríos González; 1.ª edición, 2022.', false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('0eccfab6-0acf-5322-8274-a6a24050deb6', 'c2ffce81-e399-518c-9358-db25f35ad5fa', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('0eccfab6-0acf-5322-8274-a6a24050deb6', '24f37161-bffc-5ab1-82f3-14999c4f4957', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('0eccfab6-0acf-5322-8274-a6a24050deb6', '68a86fca-2e4d-5344-bdfa-17079e2861aa', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('0eccfab6-0acf-5322-8274-a6a24050deb6', '445cfccd-2a4a-5149-ae11-42247d6d5bf4', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('0eccfab6-0acf-5322-8274-a6a24050deb6', '9ecc1347-f200-5676-a413-e625bc86d8a5', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('11597845-086e-5ecf-98ca-a3c952827eee', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('11597845-086e-5ecf-98ca-a3c952827eee', '14f67239-8757-501c-ad27-6e4d1ac0362b', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('11597845-086e-5ecf-98ca-a3c952827eee', '302610c7-0e0f-55bd-8f92-eaece9b812ee', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('11597845-086e-5ecf-98ca-a3c952827eee', '5499683b-7d19-5a7e-89d8-7167647d3a7a', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('11597845-086e-5ecf-98ca-a3c952827eee', '39f940cd-a6d5-54c1-a1b4-abbc687024bd', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'cc1b39b0-1f16-5f1b-9b31-82ac6e0908b3', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1a9a8bad-ed40-5c53-a662-72b6aa13426d', 'dc798b1b-2030-5032-b97b-b64ac1c3a411', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1a9a8bad-ed40-5c53-a662-72b6aa13426d', '5499683b-7d19-5a7e-89d8-7167647d3a7a', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1a9a8bad-ed40-5c53-a662-72b6aa13426d', '451b48d2-845d-56fa-ac1c-68b0fd5cb211', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1a9a8bad-ed40-5c53-a662-72b6aa13426d', '87249c8f-a504-5617-83c2-299d688b0bf0', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1a9a8bad-ed40-5c53-a662-72b6aa13426d', '5e2646b2-96dd-5bb4-bee1-bc1caf849fe5', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1a9a8bad-ed40-5c53-a662-72b6aa13426d', '8b2f61a0-756b-55fd-a5d1-1a18e441c38f', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1a9a8bad-ed40-5c53-a662-72b6aa13426d', '027a41cf-d3c6-5710-b470-bca9bb965ee5', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1a9a8bad-ed40-5c53-a662-72b6aa13426d', '32022cde-afed-5c5f-b045-c39bfa53e9ba', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'a5b09d12-a9eb-5738-9aa1-0f25c7091de4', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', '8e21951d-cdf1-5a42-bdb0-b8eb22c5437a', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', '2b337a96-99fa-54cc-9fe1-a15ae864c84b', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', 'd3bd7f6e-6809-52ed-9ca3-76878d6817bd', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', '56c17f75-3ceb-5068-ab3a-01de4bf69825', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', '63bc66f1-5750-5060-a0ac-044ed9f5804c', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', '7cf8b622-08bf-5e2c-85c3-d9f7b54a15de', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', '920524a0-04ed-50c3-a0a1-9b5a7e82c35b', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('522d13b1-dd9f-54a2-8dc8-cd0ae63441f9', '6075bd5c-3625-5d7b-a43c-cbf4f16cda3b', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('8c6dcac8-91ee-589d-904d-8798fc58c2cc', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('8c6dcac8-91ee-589d-904d-8798fc58c2cc', '6d9f12d5-4fea-5052-a405-b7054b6f96ce', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('8c6dcac8-91ee-589d-904d-8798fc58c2cc', '8bba6a04-f4ad-5eeb-9ae7-bcba6c0886f4', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('8c6dcac8-91ee-589d-904d-8798fc58c2cc', '84b84750-d043-54ff-896a-f5d1d71c0b49', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('8c6dcac8-91ee-589d-904d-8798fc58c2cc', '959f533a-286b-5df9-b24b-cc09e6746de7', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cc1640c4-15b5-5416-aa80-67ecb7610f45', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cc1640c4-15b5-5416-aa80-67ecb7610f45', '246d8818-2cdf-597b-8c5d-d9e9d542474b', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cc1640c4-15b5-5416-aa80-67ecb7610f45', 'a0c668ee-4042-5d55-a699-59bbc30f31be', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cc1640c4-15b5-5416-aa80-67ecb7610f45', '26b48a50-bf05-52da-b4e3-2108577bebd0', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cc1640c4-15b5-5416-aa80-67ecb7610f45', 'c9994b94-7d09-538b-8fce-c297c44331ff', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', '1512781f-d722-5d5c-956f-b66cc44153d7', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', 'f0a7a34f-bd9f-5117-89d8-ea379a42b451', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', 'c9994b94-7d09-538b-8fce-c297c44331ff', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', '5e037af4-7d41-5fe6-a915-7271c8b34148', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', '4a085252-d9cd-591c-9175-e5a48eda5a41', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', 'd37dbb11-2a0c-5336-8bb7-8b861f78cb03', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', 'c0d9e7b6-69fb-5973-8287-1ea8ca2b2ed8', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', '417b2cb9-efcf-5a66-a50e-3d0d0a24b055', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', '5fcb8e50-6bef-50a0-9722-cb3e175f8048', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', '41b3ebfc-251f-5da7-bf42-9073b074eb74', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', 'bec8859d-41fc-5f45-a2e3-16b9b290746c', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', 'e9a78751-6d6a-5404-83a1-915b2bb13129', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', '84cc3bc6-4885-58c6-88d1-f56f0110b127', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', '75c70d26-2486-5245-a08f-e02b44c0c880', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('bed0e240-be6f-521a-8733-05dc084c041f', 'ee8f25cf-1b4d-5a3c-a12a-f65df62675f5', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a1c66bde-690a-5d66-ac0e-1177382a549e', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a1c66bde-690a-5d66-ac0e-1177382a549e', 'fab5da01-70e5-50d2-8995-8415c4e31e80', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a1c66bde-690a-5d66-ac0e-1177382a549e', 'f64f1de9-c396-5318-95c0-c2fc3fe0aa4d', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a1c66bde-690a-5d66-ac0e-1177382a549e', '071e4be2-3686-584a-bfab-e6804b401834', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a1c66bde-690a-5d66-ac0e-1177382a549e', 'c6363926-0c88-5ea6-bd61-baf0a818ad4e', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a1c66bde-690a-5d66-ac0e-1177382a549e', 'd211a825-3795-5338-a5c2-75cc2d2b179a', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a1c66bde-690a-5d66-ac0e-1177382a549e', '6220b898-c458-573f-b89f-95abd2f42f96', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a1c66bde-690a-5d66-ac0e-1177382a549e', 'aae18d5b-9eb2-59f0-84c2-5396be1426d8', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('655815c1-f66b-5ca8-a236-114b88a8c543', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('655815c1-f66b-5ca8-a236-114b88a8c543', 'f68b39e2-985d-5471-a249-885d875d17af', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('655815c1-f66b-5ca8-a236-114b88a8c543', '071e4be2-3686-584a-bfab-e6804b401834', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('655815c1-f66b-5ca8-a236-114b88a8c543', '6220b898-c458-573f-b89f-95abd2f42f96', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('655815c1-f66b-5ca8-a236-114b88a8c543', '0ab90cab-0fe5-53a6-8629-f9d592811585', NULL, 'Publicada en Gaceta Oficial Digital No. 30524-D el 14 de mayo de 2026.', false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('655815c1-f66b-5ca8-a236-114b88a8c543', '6925d41c-b8a3-51d3-8473-d7adf6843a42', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('655815c1-f66b-5ca8-a236-114b88a8c543', 'aae18d5b-9eb2-59f0-84c2-5396be1426d8', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('edf45ec9-49a3-5741-8fa8-b4a3331a7b25', '9be316cd-4955-5dfe-a51f-8e842f7a03ee', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'ec67fd4f-c4df-54a7-bad1-c4fdaff74646', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'a6e62671-69ac-5660-9fb4-5335b2d06ef0', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'b6f19ef8-ba37-50da-9d80-752b952a80db', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('edf45ec9-49a3-5741-8fa8-b4a3331a7b25', '697e31d2-4e2d-51a7-994a-e1839ce1da84', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'cf1dc5f0-de6c-58cd-bb69-194224ff271b', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('edf45ec9-49a3-5741-8fa8-b4a3331a7b25', '8c733e3d-801e-5ce1-b721-697b60ab573f', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('edf45ec9-49a3-5741-8fa8-b4a3331a7b25', '5904be2d-d4b5-5e17-8364-fdb97fdf6488', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('edf45ec9-49a3-5741-8fa8-b4a3331a7b25', 'c9574fc4-056b-58a1-9413-0e4d1f07e20c', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'c4cbc6d0-da37-5b4a-b2de-db4f8fe9b174', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('6e4a7814-0f74-5ef9-9dad-59eae4423b49', '17aa81aa-4c8f-5a6e-9f23-8055e0a96b21', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'd711bc45-20c7-56ea-91d2-ce4a12c358fd', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('6e4a7814-0f74-5ef9-9dad-59eae4423b49', '07fe5f27-a0ff-5615-a34d-c49cd620ef22', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('6e4a7814-0f74-5ef9-9dad-59eae4423b49', 'bec8859d-41fc-5f45-a2e3-16b9b290746c', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('3fe4a301-8705-5637-ad05-8473c2aa9cc4', '40dd91e6-de23-58be-8325-567278fa296e', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('3fe4a301-8705-5637-ad05-8473c2aa9cc4', '04167052-4d7f-56e3-851b-10607497be85', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('3fe4a301-8705-5637-ad05-8473c2aa9cc4', '4a085252-d9cd-591c-9175-e5a48eda5a41', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'bfc2dede-4deb-5ac2-a7e6-56096c992104', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('3fe4a301-8705-5637-ad05-8473c2aa9cc4', '05aed0dd-23f3-5b61-9b73-3eef769d61fe', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('3fe4a301-8705-5637-ad05-8473c2aa9cc4', 'c1044e2b-79e2-5210-b276-11690e41cc1b', NULL, 'Publicada en Gaceta Oficial Digital No. 30500-E el 9 de abril de 2026.', false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('3fe4a301-8705-5637-ad05-8473c2aa9cc4', '907a13c4-9003-5c8b-bc4b-0306e8c2ebd2', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('3fe4a301-8705-5637-ad05-8473c2aa9cc4', '7ebe624c-8feb-59bb-b862-c47621be23f2', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('3fe4a301-8705-5637-ad05-8473c2aa9cc4', '4f70d564-ab95-5ce5-b204-7efaedef89b3', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;

COMMIT;
