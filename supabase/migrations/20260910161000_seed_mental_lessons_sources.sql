-- CICDE Enfermeria 2026
-- Auto-generated migration for MENTAL lessons and sources
BEGIN;

-- 1. Insert Sources
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('f6a33c85-e780-5680-a23d-f8bdff804d56', 'CICDE', 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería', NULL, 'IV CICDE', NULL, 2026, NULL, NULL, 'Lineamientos para el Examen de Competencias de Profesionales de Enfermería', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('55866d0a-c1b2-566d-9afd-555ca6e1bedc', 'CICDE', 'Enfermería Psiquiátrica y Salud Mental', 'AMIR', NULL, NULL, 2014, NULL, NULL, 'Enfermería Psiquiátrica y Salud Mental', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('e2d062c8-0a9a-5d40-83bd-914730debc70', 'CICDE', 'Enfermería Psiquiátrica', 'José Luis Galiana Roch', NULL, 'Elsevier', 2016, NULL, NULL, 'Enfermería Psiquiátrica', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('1d151db0-31c9-54a6-b57d-1a0c72f561e0', 'CICDE', 'Manual Diagnóstico y Estadístico de los Trastornos Mentales (DSM-5)', NULL, 'American Psychiatric Association', NULL, 2014, NULL, NULL, 'Manual Diagnóstico y Estadístico de los Trastornos Mentales (DSM-5)', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('0d140138-8fe7-5ed7-8ca0-c2db48cc43a5', 'COMPLEMENTARY', 'World Mental Health Report: Transforming Mental Health for All', NULL, 'World Health Organization', NULL, 2022, NULL, NULL, 'World Mental Health Report: Transforming Mental Health for All', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('0cdfcc9a-e559-56ce-a34e-5c91c0182e39', 'COMPLEMENTARY', 'Guidance on community mental health services: promoting person-centred and rights-based approaches', NULL, 'World Health Organization', NULL, 2021, NULL, NULL, 'Guidance on community mental health services: promoting person-centred and rights-based approaches', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('5d2ae30c-de54-51d1-87a9-fa77c692a2b5', 'COMPLEMENTARY', 'Person-centred recovery planning for mental health and well-being', NULL, 'World Health Organization', NULL, 2019, NULL, NULL, 'Person-centred recovery planning for mental health and well-being', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('8b23d980-68ee-5961-a843-dc929138b862', 'COMPLEMENTARY', 'Código de Ética del CIE para las Enfermeras', NULL, 'International Council of Nurses', NULL, 2021, NULL, NULL, 'Código de Ética del CIE para las Enfermeras', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('29ef2133-7ab1-55e3-a4ff-84edb2249029', 'COMPLEMENTARY', 'Health Literacy Universal Precautions Toolkit — Clear Communication / Teach-Back', NULL, 'Agency for Healthcare Research and Quality', NULL, 2024, NULL, NULL, 'Health Literacy Universal Precautions Toolkit — Clear Communication / Teach-Back', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('1f2443eb-ad99-58ef-8dde-f04bbe4c4c85', 'COMPLEMENTARY', 'Framework to implement a life course approach in practice', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'Framework to implement a life course approach in practice', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('bc9aee26-7170-5686-87d2-3277a567eb57', 'COMPLEMENTARY', 'Mental health', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'Mental health', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('724ba08f-6494-528e-b974-9427a9f6ae89', 'COMPLEMENTARY', 'Promotion and prevention — Mental and brain health across the life course', NULL, 'World Health Organization', NULL, NULL, NULL, NULL, 'Promotion and prevention — Mental and brain health across the life course', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('bdb590ae-bcea-50f4-91f6-934271f5e8bd', 'COMPLEMENTARY', 'Guidance on mental health policy and strategic action plans', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'Guidance on mental health policy and strategic action plans', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('770ec7b0-95dc-5177-8c01-1876918a1de3', 'PANAMA_OFFICIAL', 'Programa Salud Mental', NULL, 'Ministerio de Salud de Panamá', NULL, NULL, NULL, NULL, 'Programa Salud Mental', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('1f0b5a45-f9be-5cc0-ba33-85391fe8c46e', 'PANAMA_OFFICIAL', 'Ley 364 de 6 de febrero de 2023', NULL, 'República de Panamá', NULL, 2023, NULL, NULL, 'Ley 364 de 6 de febrero de 2023', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('149b6c65-0a70-5e66-bbd9-b6f77661e7de', 'PANAMA_OFFICIAL', 'Decreto Ejecutivo 61 de 27 de junio de 2024', NULL, 'República de Panamá', NULL, 2024, NULL, NULL, 'Decreto Ejecutivo 61 de 27 de junio de 2024', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('6c988212-a06a-5d7b-ae8a-793b1ccebf23', 'PANAMA_OFFICIAL', 'Resolución N.º 637 de 7 de octubre de 2022 — Norma Técnica Administrativa Nacional de Salud Mental', NULL, 'Ministerio de Salud de Panamá', NULL, 2022, NULL, NULL, 'Resolución N.º 637 de 7 de octubre de 2022 — Norma Técnica Administrativa Nacional de Salud Mental', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('27941b45-2f8b-5331-ae7b-04f65bdac563', 'PANAMA_OFFICIAL', 'Resolución N.º 099 de 11 de febrero de 2026 — Norma del Sistema de Vigilancia de la Conducta de Riesgo Suicida', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Resolución N.º 099 de 11 de febrero de 2026 — Norma del Sistema de Vigilancia de la Conducta de Riesgo Suicida', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('ea8615bc-847b-558e-91c6-27996701e3d0', 'PANAMA_OFFICIAL', 'Avances en la construcción del Plan Estratégico SMAPS 2026–2030', NULL, 'Ministerio de Salud de Panamá', NULL, 2026, NULL, NULL, 'Avances en la construcción del Plan Estratégico SMAPS 2026–2030', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('c70f4d30-b4b4-50bf-afc0-b4295c688e53', 'COMPLEMENTARY', 'Anxiety disorders', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'Anxiety disorders', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('a9586ec4-87b6-5dc7-9c7a-268f9810f2e8', 'COMPLEMENTARY', 'Doing What Matters in Times of Stress: An Illustrated Guide', NULL, 'World Health Organization', NULL, 2020, NULL, NULL, 'Doing What Matters in Times of Stress: An Illustrated Guide', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('076f3ec0-97a8-564f-86d8-67c76d078d7e', 'COMPLEMENTARY', 'En tiempos de estrés, haz lo que importa. Versión adaptada para América Latina', NULL, 'OPS/OMS', NULL, 2022, NULL, NULL, 'En tiempos de estrés, haz lo que importa. Versión adaptada para América Latina', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('91790bf5-ecd2-5443-8430-74cc0c5c7c25', 'COMPLEMENTARY', 'Nursing: Mental Health and Community Concepts, 2nd edition — Stress, Coping, and Crisis Intervention', NULL, 'NCBI Bookshelf / Open RN', NULL, 2025, NULL, NULL, 'Nursing: Mental Health and Community Concepts, 2nd edition — Stress, Coping, and Crisis Intervention', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('32942b75-101e-5ae7-891a-7b10a7cf3673', 'COMPLEMENTARY', 'Interpersonal relations: a theoretical framework for application in nursing practice', 'Hildegard E. Peplau', NULL, NULL, 1992, NULL, NULL, 'Interpersonal relations: a theoretical framework for application in nursing practice', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('7c992a7a-383c-5e7c-95f8-ec105fe9f459', 'COMPLEMENTARY', 'Therapeutic Communication and the Nurse-Client Relationship', NULL, 'NCBI Bookshelf / Open RN', NULL, NULL, NULL, NULL, 'Therapeutic Communication and the Nurse-Client Relationship', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('ab3b3a24-fae9-5a46-9769-8cedb3cbe74e', 'COMPLEMENTARY', 'Appraising Travelbee’s Human-to-Human Relationship Model', 'G. Shelton', NULL, NULL, 2016, NULL, NULL, 'Appraising Travelbee’s Human-to-Human Relationship Model', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('df72846a-3d73-542e-9ea7-10544707d6bb', 'COMPLEMENTARY', 'Travelbee and relational AI: A triadic model for nursing', 'Hugo Neves et al.', NULL, 'Nursing Outlook', 2026, NULL, NULL, 'Travelbee and relational AI: A triadic model for nursing', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('a04b4f90-b1cd-53d4-8283-10caf702b0e3', 'COMPLEMENTARY', 'The Roy Adaptation Model: theoretical update and knowledge for practice', 'Sister Callista Roy; C. P. Corliss', NULL, NULL, 1993, NULL, NULL, 'The Roy Adaptation Model: theoretical update and knowledge for practice', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('ad3c7e33-30be-5d18-83b0-6ea155a610f6', 'COMPLEMENTARY', 'Roy Adaptation Model: Theory-Based Knowledge and Nursing Care', 'Candan et al.', NULL, NULL, 2022, NULL, NULL, 'Roy Adaptation Model: Theory-Based Knowledge and Nursing Care', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('ad3e6faa-17fb-5b6b-89cb-16bc2761514f', 'COMPLEMENTARY', 'An evaluation of the Johnson Behavioural System Model of Nursing', 'W. Reynolds; D. F. Cormack', NULL, NULL, 1991, NULL, NULL, 'An evaluation of the Johnson Behavioural System Model of Nursing', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('7ede314d-dc3d-54f3-b858-1da22d299c91', 'COMPLEMENTARY', 'Application of the Johnson Behavioral System Model in nursing practice', 'A. K. Derdiarian', NULL, NULL, 1993, NULL, NULL, 'Application of the Johnson Behavioral System Model in nursing practice', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('92418105-a2bd-52d5-a4b8-2c1dc623f84a', 'COMPLEMENTARY', 'Schizophrenia', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'Schizophrenia', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('7a2f7fcd-3aac-554a-b984-a349aace714f', 'COMPLEMENTARY', 'Depressive disorder (depression)', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'Depressive disorder (depression)', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('1c1bf25a-ec73-5a90-b7ef-fb6c34161bce', 'COMPLEMENTARY', 'Bipolar disorder', NULL, 'World Health Organization', NULL, 2025, NULL, NULL, 'Bipolar disorder', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('db2f0dcc-a236-5644-9232-4900ac5ec801', 'COMPLEMENTARY', 'Dementia', NULL, 'World Health Organization', NULL, 2026, NULL, NULL, 'Dementia', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('bacceaac-50b6-57bd-8719-59964cdd7dad', 'COMPLEMENTARY', 'Violence against women', NULL, 'World Health Organization', NULL, 2026, NULL, NULL, 'Violence against women', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('db823e30-8f2a-5976-824b-5248e6aae0be', 'COMPLEMENTARY', 'Global status report on alcohol and health and treatment of substance use disorders', NULL, 'World Health Organization', NULL, 2024, NULL, NULL, 'Global status report on alcohol and health and treatment of substance use disorders', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('36ad4090-6c86-58ec-b5cf-14d64082be69', 'COMPLEMENTARY', 'Violence and aggression: short-term management in mental health, health and community settings (NG10)', NULL, 'NICE', NULL, NULL, NULL, NULL, 'Violence and aggression: short-term management in mental health, health and community settings (NG10)', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('8edd052b-437e-5342-9812-8887b8d58e21', 'COMPLEMENTARY', 'Depression Medicines', NULL, 'U.S. Food and Drug Administration', NULL, NULL, NULL, NULL, 'Depression Medicines', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('9be44945-febe-5ac6-a5df-357a7d1b4d8e', 'COMPLEMENTARY', 'Depression in adults: treatment and management (NG222)', NULL, 'NICE', NULL, 2022, NULL, NULL, 'Depression in adults: treatment and management (NG222)', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('07e31e2e-3226-5524-a295-f1ffd5ffc25b', 'COMPLEMENTARY', 'Generalised anxiety disorder and panic disorder in adults: management (CG113)', NULL, 'NICE', NULL, NULL, NULL, NULL, 'Generalised anxiety disorder and panic disorder in adults: management (CG113)', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('217d083b-b626-50d2-b267-33a7d09edb2c', 'COMPLEMENTARY', 'Benzodiazepine Drug Class: Boxed Warning Updated to Improve Safe Use', NULL, 'U.S. Food and Drug Administration', NULL, 2020, NULL, NULL, 'Benzodiazepine Drug Class: Boxed Warning Updated to Improve Safe Use', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('fb315d75-01ae-5a32-b769-b0060247844b', 'COMPLEMENTARY', 'Psychosis and schizophrenia in adults: prevention and management (CG178)', NULL, 'NICE', NULL, NULL, NULL, NULL, 'Psychosis and schizophrenia in adults: prevention and management (CG178)', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('3c1f8494-b5ee-5cf5-86a3-125d51f75868', 'COMPLEMENTARY', 'Bipolar disorder: assessment and management (CG185)', NULL, 'NICE', NULL, NULL, NULL, NULL, 'Bipolar disorder: assessment and management (CG185)', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('ec692519-6e3a-5f28-9ab6-2cac5a1ce165', 'COMPLEMENTARY', 'FDA removes REMS program for clozapine; ANC monitoring remains recommended', NULL, 'U.S. Food and Drug Administration', NULL, 2025, NULL, NULL, 'FDA removes REMS program for clozapine; ANC monitoring remains recommended', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('4935c122-25c6-588b-9937-1070436e7bd6', 'COMPLEMENTARY', 'Psychiatric-Mental Health Nursing — Therapeutic Communication and Group Therapy', NULL, 'OpenStax', NULL, NULL, NULL, NULL, 'Psychiatric-Mental Health Nursing — Therapeutic Communication and Group Therapy', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified, verified_at, verified_by)
VALUES ('2872b9f0-074d-55d0-8789-d506e4a06607', 'COMPLEMENTARY', 'Psychiatric-Mental Health Nursing', NULL, 'OpenStax', NULL, NULL, NULL, NULL, 'Psychiatric-Mental Health Nursing', false, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- 2. Insert Lessons
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT 'a15acbb0-d168-563b-86cc-38f8d8077d72', id, 'Estrategias de enfermería para fortalecer la autoestima y reforzar los valores', 'Estrategias de enfermería para fortalecer autoestima, autoconcepto, autonomía, valores, fortalezas y recuperación desde una atención centrada en la persona.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics WHERE code = 'MENTAL-01'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT 'ded19263-bf42-5185-b801-81bd378d24c7', id, 'Mecanismos de la comunicación afectiva y efectiva', 'Comunicación terapéutica afectiva y efectiva: escucha activa, empatía, preguntas, clarificación, reflexión, validación, límites, teach-back y adaptación a alteraciones de salud mental.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics WHERE code = 'MENTAL-02'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', id, 'Estrategias para promover salud mental en cada etapa del ciclo vital', 'Promoción de salud mental a lo largo del curso de vida, desde primera infancia hasta adultez mayor, con factores protectores, riesgos, transiciones y contexto Panamá.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics WHERE code = 'MENTAL-03'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', id, 'Rol del profesional de enfermería en la promoción de la salud mental en la población', 'Rol de enfermería en promoción, prevención, detección, atención primaria, comunidad, derechos, crisis, vigilancia y continuidad de la salud mental poblacional.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics WHERE code = 'MENTAL-04'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT '436f52b3-5e17-5296-b1d8-6d33fed54051', id, 'Manejo de factores de riesgo: estrés, ansiedad, conflicto, frustración y mecanismos de defensa', 'Estrés, ansiedad, conflicto, frustración, afrontamiento y mecanismos de defensa con valoración, manejo, seguridad y PAE.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics WHERE code = 'MENTAL-05'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT '1436ca61-228f-5608-9f94-a92e9504c48c', id, 'Modelos de enfermería aplicados a la salud mental', 'Modelos de Peplau, Travelbee, Roy y Johnson aplicados a valoración, relación terapéutica, adaptación, conducta y PAE en salud mental.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics WHERE code = 'MENTAL-06'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', id, 'Cuidado de Enfermería a las personas con trastornos mentales y del comportamiento', 'Cuidado de enfermería en esquizofrenia, depresión mayor, ansiedad, bipolaridad, trastornos de personalidad, neurocognitivos, violencia y adicciones.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics WHERE code = 'MENTAL-07'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT 'f39c849c-9d42-5c01-9b47-fa7a842817ff', id, 'Farmacología (antidepresivos, ansiolíticos, antipsicóticos)', 'Psicofarmacología de alta prioridad para enfermería: antidepresivos, ansiolíticos y antipsicóticos, con efectos, interacciones, síndromes graves y monitorización.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics WHERE code = 'MENTAL-08'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT '207018b2-f2a6-5c74-86ff-87050f04cccc', id, 'Terapias psicodinámicas de enfermería', 'Terapias individuales y grupales enumeradas por CICDE: supresión, apoyo, realidad, comunicación, remotivación y actividades, con aplicación segura de enfermería.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics WHERE code = 'MENTAL-09'
ON CONFLICT (topic_id, version) DO NOTHING;
INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current, reviewed_at, reviewed_by)
SELECT 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', id, 'PAE de pacientes con alucinación, conductas agresivas, deprimido, ansioso, maniaco', 'PAE aplicado a alucinaciones, agresividad, depresión, ansiedad y manía, priorizando seguridad, evaluación de riesgos, comunicación y reevaluación.', 'REVIEW', 1, true, NULL, NULL
FROM public.topics WHERE code = 'MENTAL-10'
ON CONFLICT (topic_id, version) DO NOTHING;

-- 3. Insert Lesson Sections
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b6b9aff9-bbab-572f-b60d-526626721d8d', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_1', 'Estrategias de enfermería para fortalecer la autoestima y reforzar los valores', '**Área:** Enfermería en Salud y Enfermedad Mental  
**Código:** MENTAL-01  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f8fbf774-228f-554f-8e19-011ba9d45cd2', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_2', '1. Alcance oficial CICDE', 'El lineamiento CICDE 2026 incluye expresamente:

**“Estrategias de enfermería para fortalecer la autoestima, reforzar los valores”.**

Este tema se desarrolla desde el cuidado de enfermería en salud mental, con énfasis en:

- autoconcepto;
- autoestima;
- identidad y dignidad;
- valoración de fortalezas;
- factores que afectan la autoestima;
- valores personales;
- clarificación de valores;
- autonomía y toma de decisiones;
- estrategias terapéuticas de enfermería;
- comunicación respetuosa;
- metas realistas;
- apoyo social;
- imagen corporal;
- adaptación a enfermedad;
- prevención de estigma;
- PAE.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('75cb6e43-f0f9-5c23-aff5-e7ef1bca3810', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_3', '2. Objetivos de aprendizaje', 'Al finalizar el tema, el estudiante debe poder:

1. Diferenciar autoconcepto, autoestima e identidad.
2. Reconocer factores que pueden afectar la autoestima.
3. Valorar fortalezas, recursos y capacidades de la persona.
4. Identificar manifestaciones compatibles con autoestima disminuida.
5. Aplicar intervenciones de enfermería que promuevan dignidad, autonomía y participación.
6. Utilizar refuerzo positivo de forma realista y específica.
7. Evitar intervenciones que infantilicen, juzguen o invaliden.
8. Comprender qué significa clarificar valores.
9. Respetar valores personales sin imponer los propios.
10. Favorecer decisiones informadas y metas alcanzables.
11. Reconocer cuándo una alteración de autoestima requiere valoración adicional de depresión, violencia o riesgo suicida.
12. Integrar estas intervenciones al PAE.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fb3f3257-85ea-582a-869a-96a402a64651', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_4', '3. Autoconcepto', 'El **autoconcepto** es la percepción global que una persona tiene de sí misma.

Puede incluir:

- características personales;
- roles;
- capacidades;
- relaciones;
- valores;
- identidad;
- percepción corporal;
- desempeño social y laboral.

Se modifica a lo largo de la vida y puede verse afectado por experiencias, enfermedad, pérdidas y relaciones.

---', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ea84c288-b2d8-5b1e-9649-c26e0430a98f', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_5', '4. Autoestima', 'La autoestima se relaciona con la valoración que la persona realiza de sí misma y de su propio valor.

Puede fluctuar según:

- experiencias;
- relaciones;
- estado de salud;
- logros y pérdidas;
- rechazo;
- violencia;
- estigma;
- cambios corporales;
- independencia/dependencia;
- entorno social.', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b472392e-847b-555f-9fe5-7d3e41483454', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_6', 'Clave', 'Autoestima baja no es sinónimo automático de un trastorno mental específico.

Debe valorarse dentro del contexto completo de la persona.

---', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('252b8e09-bc14-5b21-a42e-fb90af534dd6', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_7', '5. Identidad y dignidad', 'La atención de salud mental debe reconocer a la persona como:

- sujeto de derechos;
- participante activo;
- alguien con historia, valores y preferencias;
- más que un diagnóstico.

La OMS promueve servicios de salud mental:

- centrados en la persona;
- orientados a la recuperación;
- basados en derechos humanos.', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('65b8a6df-911f-5a14-a864-c6242acafe7a', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_8', 'Enfermería', 'Evitar reducir al paciente a expresiones como:
- “el esquizofrénico”;
- “la depresiva”;
- “el bipolar”.

Preferir lenguaje centrado en la persona.

---', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('611872af-f39e-5396-9149-b8c2fd672f77', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_9', '6. Factores que pueden disminuir autoestima', '- crítica constante;
- abuso o violencia;
- discriminación;
- estigma;
- pérdidas;
- fracaso percibido;
- desempleo;
- enfermedad crónica;
- discapacidad;
- cambios en imagen corporal;
- dependencia funcional;
- aislamiento;
- relaciones abusivas;
- trastornos del estado de ánimo;
- experiencias traumáticas.', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dc431235-1890-5a4f-ac57-1abf88d043db', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_10', 'Importante', 'El profesional debe explorar sin asumir la causa.

---', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('287a0dc2-ef33-5508-b0a9-92e34a93ef90', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_11', '7. Manifestaciones posibles', 'Pueden observarse:

- autocrítica intensa;
- expresiones de inutilidad;
- vergüenza;
- dificultad para reconocer fortalezas;
- indecisión;
- dependencia excesiva de aprobación;
- aislamiento;
- rechazo de elogios;
- desesperanza;
- dificultad para establecer límites;
- abandono del autocuidado.

Ningún signo aislado confirma por sí solo “baja autoestima”.

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f60da9bc-8810-5691-bfe4-dc6e7cf2d645', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_12', '8. Valoración de enfermería', 'Explorar:

- “¿Cómo se describe usted?”
- “¿Qué cosas siente que hace bien?”
- “¿Qué ha cambiado recientemente?”
- “¿Qué es importante para usted?”
- “¿Qué personas le apoyan?”
- “¿Qué le preocupa de sí mismo/a?”
- “¿Qué decisiones desea tomar por usted mismo/a?”
- “¿Qué metas serían importantes ahora?”

Observar:

- lenguaje verbal;
- postura;
- contacto visual según contexto cultural;
- autocuidado;
- interacción;
- respuesta ante elogios;
- autonomía.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0fa2f4d3-f83c-5f07-8d0e-c04bc4e5440e', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_13', '9. Valoración de fortalezas', 'No centrar toda la entrevista en déficits.

Identificar:

- habilidades;
- experiencias superadas;
- relaciones protectoras;
- intereses;
- conocimientos;
- recursos comunitarios;
- espiritualidad si la persona la considera relevante;
- estrategias de afrontamiento;
- metas personales.', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1e7f698b-16d5-5a20-8ce0-7223811f1d66', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_14', 'Principio', 'Una atención orientada a la recuperación ayuda a la persona a reconocer capacidades y participación activa.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e08830fc-f861-5862-a937-b12f4092b396', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_15', '10. Estrategias para fortalecer autoestima', '', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c7b957d0-7b16-51bd-8fab-0073ff750146', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_16', '1. Relación terapéutica consistente', '- respeto;
- autenticidad profesional;
- escucha;
- confianza;
- límites claros.', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('160c356d-6672-58cc-aa54-85c6d60d5553', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_17', '2. Reconocer fortalezas', 'Señalar capacidades observables y reales.', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0e740b0a-b0ac-5c85-ae93-6e4a15634830', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_18', '3. Establecer metas alcanzables', 'Dividir objetivos grandes en pasos pequeños.', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d111f0bd-2210-5a09-8c08-a9b6467846b1', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_19', '4. Favorecer autonomía', 'Ofrecer elecciones reales cuando sean posibles.', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d5e05424-b236-51b3-b0d8-40e347dffac3', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_20', '5. Involucrar en el cuidado', 'Permitir participación en decisiones.', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1365eb40-2eb9-52d6-8c66-c98308912ed3', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_21', '6. Reforzar avances', 'Reconocer progreso específico.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fa0196f4-41f4-555f-860d-46efd43808f9', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_22', '7. Promover autocuidado y función', 'Facilitar actividades que generen competencia.', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a0b2f6b0-3d96-5a07-b42b-1e99cd18b6ec', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_23', '8. Fortalecer apoyo social', 'Con consentimiento y respetando preferencias.

---', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('83c6ae19-1910-5103-b962-29787ab6d285', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_24', '11. Refuerzo positivo terapéutico', 'Debe ser:

- sincero;
- específico;
- relacionado con una conducta o esfuerzo observable;
- proporcional.

Ejemplo:

**Adecuado:**  
“Hoy pidió ayuda antes de sentirse sobrepasado; eso muestra que está usando una estrategia nueva.”

**Menos útil:**  
“Usted es increíble, todo va a estar perfecto.”', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('908f7065-15a8-5247-b401-f3ef1d03c894', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_25', 'Clave', 'El elogio vacío puede sentirse poco auténtico y no fortalece competencia real.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f5781363-1137-52a8-8b84-35bc5e0e4d84', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_26', '12. Metas realistas', 'Una meta terapéutica debe ser:

- significativa para la persona;
- alcanzable;
- observable;
- revisable.

Ejemplo:

En lugar de:
> “Volveré a ser como antes.”

Puede trabajarse:
> “Esta semana identificaré dos actividades que puedo realizar de forma independiente.”

El profesional acompaña; no impone la meta.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7515d21a-acfc-59d4-bd9b-51453a1817e2', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_27', '13. Autonomía', 'Promover autonomía significa:

- proporcionar información;
- ofrecer elecciones;
- respetar preferencias;
- apoyar decisiones;
- evaluar capacidad cuando exista duda clínica;
- evitar coerción innecesaria.', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e0cfb5c6-49f0-53e1-9ca9-8d8e8141f4b6', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_28', 'Importante', 'Ayudar no significa hacer por la persona aquello que puede realizar por sí misma.

La sobreprotección puede aumentar dependencia y disminuir percepción de capacidad.

---', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5f434af5-12eb-58e1-86d2-fcddd2da1564', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_29', '14. Valores', 'Los valores son principios o convicciones que orientan decisiones, prioridades y comportamientos.

Pueden relacionarse con:

- familia;
- independencia;
- espiritualidad;
- trabajo;
- honestidad;
- responsabilidad;
- comunidad;
- salud;
- educación;
- justicia;
- otros aspectos.

Los valores son personales y pueden variar según cultura y experiencia.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bb5c2bc2-02a5-5b26-b0be-1cf50cf736a2', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_30', '15. Clarificación de valores', 'La enfermera puede ayudar a la persona a explorar:

- qué considera importante;
- qué opciones tiene;
- qué consecuencias anticipa;
- qué decisión es coherente con sus propios valores.', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('481aa3f9-deb5-5864-8552-7f910d9cf7ca', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_31', 'La enfermera NO debe', '- imponer sus creencias;
- decidir por el paciente cuando este puede decidir;
- utilizar culpa;
- moralizar;
- presionar para que el paciente adopte valores del profesional.

---', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('db7f3d94-5388-5590-960b-36b7c6e466d2', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_32', '16. Conflicto de valores', 'Puede ocurrir entre:

- paciente y familia;
- paciente y profesional;
- valores personales y recomendaciones clínicas;
- dos valores importantes para el propio paciente.

Intervenciones:

- escuchar;
- aclarar información;
- identificar prioridades;
- explorar alternativas;
- solicitar apoyo ético/interdisciplinario cuando corresponda;
- respetar derechos y marco legal.

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9ff4de53-144f-5ba7-b658-b7c8b401e420', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_33', '17. Valores profesionales de enfermería', 'El Código de Ética del CIE 2021 guía la práctica mediante valores y responsabilidades profesionales.

Entre los principios relevantes para este tema se encuentran:

- respeto;
- dignidad;
- derechos humanos;
- equidad;
- privacidad;
- confidencialidad;
- responsabilidad profesional;
- cuidado centrado en la persona.', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8bdb3c10-f2f6-5caf-9ad7-61c7f9d1e214', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_34', 'Regla', 'Los valores profesionales orientan cómo cuidar; no autorizan a imponer valores personales al paciente.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8b56aecc-c59f-5620-9750-30067f0edffb', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_35', '18. Imagen corporal', 'Cambios que pueden afectar autoconcepto:

- amputación;
- mastectomía;
- ostomía;
- cicatrices;
- quemaduras;
- alopecia;
- cambios de peso;
- discapacidad;
- alteraciones neurológicas;
- enfermedad crónica.', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('565da53d-a48d-5a7d-97e4-572e88114a3d', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_36', 'Intervenciones', '- permitir expresión;
- no minimizar pérdida;
- ofrecer información;
- fomentar participación progresiva en autocuidado;
- apoyo de pares cuando esté disponible;
- respetar el ritmo de adaptación.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c827eeb4-56f3-58f9-9161-a2a34c386dbe', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_37', '19. Enfermedad crónica y dependencia', 'Una persona que necesita ayuda puede experimentar:

- pérdida de control;
- vergüenza;
- frustración;
- sensación de ser carga.

Enfermería puede:

- preservar privacidad;
- pedir permiso;
- ofrecer elecciones;
- promover independencia residual;
- reconocer logros;
- evitar infantilizar.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('058736e4-c427-5767-bd2d-1d2cdaa64c5d', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_38', '20. Estigma y autoestima', 'El estigma relacionado con enfermedad mental puede deteriorar:

- autoestima;
- búsqueda de ayuda;
- relaciones;
- empleo;
- recuperación.

La OMS promueve una atención respetuosa y basada en derechos.', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9eac6b72-cf66-5ec4-8b5d-67fbca1d2757', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_39', 'Enfermería', 'Evitar:
- etiquetas;
- bromas;
- comentarios despectivos;
- hablar del paciente como si no estuviera presente.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('478418ad-aab8-5cb5-896d-d215f1e2057b', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_40', '21. Escucha y validación emocional', 'Validar no significa estar de acuerdo con todas las interpretaciones.

Significa reconocer la experiencia emocional.

Ejemplo:
> “Parece que este cambio ha sido muy difícil para usted.”

Evitar:
> “No debería sentirse así.”

---', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('df69c62b-1264-5c69-953d-3cbf90235657', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_41', '22. Autoeficacia', 'La autoeficacia se relaciona con la confianza de la persona en su capacidad para realizar una acción.

Puede fortalecerse mediante:

- metas pequeñas;
- práctica;
- aprendizaje;
- reconocimiento de logros;
- apoyo;
- resolución de problemas.', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5eaefc2d-f5c2-553a-9561-81b8c18f6189', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_42', 'Diferencia útil', 'Autoestima = valoración personal global.  
Autoeficacia = confianza para realizar una tarea o afrontar una situación.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('185ae824-4a7b-52a9-b837-dd1c7103c2ea', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_43', '23. Límites terapéuticos', 'Fortalecer autoestima no significa:

- permitir cualquier conducta;
- evitar límites;
- establecer una relación de amistad personal;
- hacer promesas especiales.

Los límites claros pueden aumentar:
- seguridad;
- previsibilidad;
- confianza.

---', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8c3095c9-bfc3-5773-9954-510537fb9d05', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_44', '24. Cuando explorar riesgo adicional', 'Expresiones como:

- “no valgo nada”;
- “soy una carga”;
- “todos estarían mejor sin mí”;
- “ya no tiene sentido seguir”;

requieren explorar:

- depresión;
- desesperanza;
- ideación suicida;
- plan/intención;
- violencia;
- apoyo.', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('add794e9-4ced-5603-9711-5df1f79baec9', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_45', 'Importante', 'No asumir que son “solo baja autoestima”.

---', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('729e8b46-e374-5d25-b039-72ad417b015f', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_46', '25. Intervenciones que pueden ser contraproducentes', '- discutir con la persona sobre cómo “debería” sentirse;
- elogios exagerados;
- comparación con otros;
- moralizar;
- dar consejos no solicitados;
- sobreproteger;
- hacer todo por el paciente;
- minimizar pérdidas;
- imponer metas;
- culpabilizar.

---', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4b12010f-8cf8-58e8-bc28-dcf5bf78d61b', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_47', '26. Enfoque de recuperación', 'La recuperación en salud mental no significa necesariamente ausencia total de síntomas.

Puede incluir:

- esperanza;
- identidad;
- propósito;
- autonomía;
- relaciones;
- participación;
- vida significativa.

La herramienta QualityRights de OMS promueve planes de recuperación centrados en los propios objetivos y aspiraciones de la persona.

---', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('180bfe56-00ca-55be-9375-ec4ae46d8ad1', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_48', '27. Educación a familia y cuidadores', 'Con consentimiento y respetando confidencialidad:

- evitar críticas humillantes;
- reconocer esfuerzos;
- permitir autonomía;
- apoyar metas;
- escuchar;
- evitar sobreprotección;
- reconocer signos de deterioro;
- buscar ayuda cuando sea necesaria.

---', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('75b0b54d-acd7-5d55-a37d-43af12e84083', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_49', '28. PAE', '', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('16ef28f3-15ff-5a0a-afe2-9aef4ba5469e', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_50', 'Valoración', '- autoconcepto;
- expresiones sobre sí mismo;
- fortalezas;
- roles;
- imagen corporal;
- valores;
- apoyo;
- autonomía;
- estado de ánimo;
- seguridad.', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1512c867-83f6-5c11-a061-aa8d9e15df42', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_51', 'Problemas/juicios posibles', '- autoestima alterada;
- afrontamiento ineficaz;
- aislamiento;
- desesperanza;
- alteración de imagen corporal;
- riesgo de autolesión cuando corresponda.', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eec3af18-a12f-54df-9343-6607db6f016a', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_52', 'Planificación', 'Metas:
- identificar fortalezas;
- participar en decisiones;
- realizar actividades alcanzables;
- expresar valores;
- aumentar autocuidado;
- utilizar apoyo.', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dbff16b6-96c4-52b2-9be3-d0b5c2eb081c', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_53', 'Implementación', '- relación terapéutica;
- refuerzo específico;
- metas graduadas;
- autonomía;
- comunicación;
- apoyo.', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('497d7a4b-88dc-5b86-b1e3-57d1f22d5e95', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_54', 'Evaluación', '- participación;
- lenguaje sobre sí mismo;
- función;
- decisiones;
- metas;
- seguridad.

---', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b569fce2-dfa2-582e-90e9-273f4bcedc92', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_55', '29. Situaciones tipo examen', '', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d8af5ab4-1476-5d70-ba96-732d9b298fc2', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_56', 'Caso 1', 'Paciente dice: “No sirvo para nada desde que me amputaron la pierna.”

**Respuesta:** explorar pérdida e imagen corporal, identificar fortalezas y favorecer autonomía; no responder con falsa tranquilidad.', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9672a15e-974c-544a-b570-e76295e0a0c6', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_57', 'Caso 2', 'Enfermera dice: “No diga eso, usted tiene que pensar positivo.”

**Problema:** invalida la experiencia emocional.', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a2e55972-62dc-5a0a-a070-25678e77c3ed', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_58', 'Caso 3', 'Paciente puede bañarse parcialmente, pero el personal hace todo por él para ahorrar tiempo.

**Problema:** puede aumentar dependencia; favorecer participación segura.', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('68cbe776-32e1-5bc1-a7c3-2df88466bc84', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_59', 'Caso 4', 'Paciente completa por primera vez una actividad que evitaba.

**Intervención:** reconocimiento específico del esfuerzo y logro.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('81fca57c-8d75-57e0-a0e0-8d860d02588d', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_60', 'Caso 5', 'Paciente duda entre dos tratamientos por valores familiares.

**Conducta:** clarificar información y valores sin imponer la opinión de enfermería.', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2e1124f4-aa2c-5f83-a1cb-11cb09e84e78', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_61', 'Caso 6', 'Enfermera presiona al paciente para aceptar una decisión porque “es lo correcto”.

**Problema:** imposición de valores.', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6fee6414-e340-5d11-9bfc-75b2c9c0b1ed', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_62', 'Caso 7', 'Paciente con cicatriz extensa evita verse al espejo.

**Conducta:** permitir expresión y adaptación progresiva, sin forzar exposición.', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('037d1a2f-c258-5b27-86c6-d38d525b08a6', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_63', 'Caso 8', 'Paciente expresa: “Mi familia estaría mejor sin mí.”

**Prioridad:** explorar directamente ideación y riesgo suicida.', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e147c47d-d367-58b1-8082-86106117e695', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_64', 'Caso 9', 'Persona identifica que logró superar situaciones difíciles anteriormente.

**Intervención:** utilizar esa fortaleza como recurso de afrontamiento.', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c013182f-b49c-5d85-99cc-132cab18815e', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_65', 'Caso 10', 'Paciente hospitalizado desea escoger entre dos horarios posibles para higiene.

**Intervención:** ofrecer elección real promueve autonomía.', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6f9f6848-afb4-57d9-b02c-500cb6104735', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_66', 'Caso 11', 'Enfermera elogia de forma exagerada cualquier conducta.

**Problema:** el refuerzo puede perder credibilidad; debe ser específico y auténtico.', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('655b9eeb-1702-5387-95b8-e3207ac4bde2', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_67', 'Caso 12', 'Paciente tiene una meta demasiado grande y se frustra.

**Intervención:** dividirla en pasos alcanzables acordados con la persona.

---', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('72c81b28-df1b-5fd7-a6d5-2df6482d5c2d', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_68', '30. Errores frecuentes', '1. Confundir autoestima con diagnóstico psiquiátrico.
2. Centrarse solo en déficits.
3. Dar elogios vacíos.
4. Imponer metas.
5. Hacer por el paciente todo lo que puede hacer solo.
6. Infantilizar.
7. Imponer valores personales.
8. Minimizar pérdidas.
9. Confundir validación con estar de acuerdo.
10. Ignorar estigma.
11. No explorar suicidio ante expresiones de desesperanza.
12. Romper límites terapéuticos para “hacer sentir bien” al paciente.

---', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e4f7de71-1111-58dc-abb0-292ec9bcdd27', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_69', '31. Qué memorizar', '**Autoestima = valoración que la persona hace de sí misma.**

**Fortalecer autoestima: relación terapéutica + fortalezas + autonomía + metas alcanzables + refuerzo específico.**

**No imponer valores personales.**

**Clarificar valores = ayudar a la persona a identificar qué es importante para ella y tomar decisiones informadas.**

**Ayudar ≠ sustituir capacidades conservadas.**

**Validar emoción ≠ aprobar toda interpretación.**

**“Soy una carga / estarían mejor sin mí” → valorar riesgo suicida.**

**Cuidado mental actual: persona + recuperación + derechos + dignidad.**

---', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8586308f-b325-59ef-8c0a-4822cd81f987', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_70', '32. Fuentes y validación', '', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2508eda2-9e74-5a6b-8ba9-b940aeec93dc', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_71', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**

El CICDE incluye este tema como primer punto del área de Salud y Enfermedad Mental.', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('75e24761-1e49-5957-a0da-876312989ad9', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_72', 'Bibliografía señalada por CICDE', '**AMIR. Enfermería Psiquiátrica y Salud Mental. 2014.**

**Galiana Roch, J. Enfermería Psiquiátrica. Elsevier. 2016.**

**DSM-5. Manual Diagnóstico y Estadístico de los Trastornos Mentales. Referenciado por CICDE.**', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fea9a9d2-89b5-5b43-8367-43d633ba5695', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_73', 'Nota de trazabilidad', 'Los enlaces `file:///` que aparecen en el documento CICDE corresponden a rutas locales del autor del PDF y no constituyen fuentes accesibles o verificables en línea.', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0cc3ef0e-8874-5581-92fd-d640192db0f5', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_74', 'Fuentes complementarias', '**World Health Organization. World Mental Health Report: Transforming Mental Health for All. 2022.**

**World Health Organization. Guidance on community mental health services: promoting person-centred and rights-based approaches. 2021.**

**World Health Organization. QualityRights — Person-centred recovery planning for mental health and well-being.**

**International Council of Nurses. Código de Ética del CIE para las Enfermeras. 2021.**

---', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cbe8e959-f45a-5477-be63-55964fd47ad2', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_75', '33. Control de calidad', 'Este paquete:

- cubre autoestima y valores según CICDE;
- diferencia autoestima, autoconcepto y autoeficacia;
- incluye valoración de fortalezas;
- incorpora autonomía y recuperación;
- protege contra imposición de valores;
- integra derechos y dignidad;
- incluye señal de escalamiento ante desesperanza/riesgo suicida;
- contiene 12 casos originales;
- no presenta ningún diagnóstico DSM como conclusión automática a partir de autoestima disminuida.

---', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('18d6db5a-0466-5372-8cdd-cc07349a87aa', 'a15acbb0-d168-563b-86cc-38f8d8077d72', 'sec_76', '34. Estado para integración', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- enlazar fuentes bibliográficas;
- mantener diferenciados contenido CICDE y guías actuales;
- enlazar posteriormente con MENTAL-02 comunicación, MENTAL-05 estrés/ansiedad y MENTAL-10 PAE.', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('74dfbcaa-a22a-534a-b5f5-e859ff148dd0', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_1', 'Mecanismos de la comunicación afectiva y efectiva', '**Área:** Enfermería en Salud y Enfermedad Mental  
**Código:** MENTAL-02  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8f24ff99-ad3f-598e-bf12-9f8fa1c8440a', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_2', '1. Alcance oficial CICDE', 'El lineamiento CICDE 2026 incluye expresamente:

**“Mecanismos de la comunicación afectiva y efectiva”.**

Se conserva la formulación oficial **afectiva y efectiva**.

El módulo desarrolla la comunicación de enfermería como herramienta terapéutica en salud mental, incluyendo:

- proceso comunicativo;
- comunicación verbal y no verbal;
- escucha activa;
- empatía;
- preguntas abiertas;
- clarificación;
- reflexión;
- reformulación;
- focalización;
- silencio terapéutico;
- validación;
- límites;
- comunicación con personas ansiosas, deprimidas, agresivas o con alteraciones de percepción;
- barreras de comunicación;
- teach-back;
- intérprete;
- documentación y confidencialidad.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c4f3b8a5-5ba2-52ad-84de-211766363d21', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_3', '2. Objetivos de aprendizaje', 'El estudiante debe poder:

1. Explicar elementos del proceso comunicativo.
2. Diferenciar comunicación verbal, no verbal y paraverbal.
3. Aplicar escucha activa y empatía.
4. Utilizar preguntas abiertas de forma terapéutica.
5. Emplear clarificación, reflexión, reformulación y focalización.
6. Utilizar silencio terapéutico.
7. Diferenciar validación de falsa tranquilidad.
8. Reconocer barreras comunes en la comunicación de enfermería.
9. Mantener límites profesionales.
10. Adaptar comunicación ante ansiedad, depresión, agresividad, alucinaciones o delirios.
11. Utilizar comunicación clara y teach-back.
12. Utilizar intérprete calificado cuando corresponda.
13. proteger privacidad y confidencialidad.
14. Resolver situaciones tipo examen.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('11f0ecee-2ab6-5a34-89a6-159431da7cb7', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_4', '3. Comunicación', 'La comunicación es un proceso mediante el cual se intercambia información, significado y emociones.

Elementos:

- emisor;
- mensaje;
- canal;
- receptor;
- retroalimentación;
- contexto;
- ruido/barreras.

En salud mental, lo que se comunica **y cómo se comunica** puede influir directamente en:
- confianza;
- seguridad;
- adherencia;
- relación terapéutica.

---', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('73a28806-7822-5644-8ea8-d1292ef0ee96', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_5', '4. Comunicación afectiva', 'Dentro del lenguaje utilizado por CICDE, puede comprenderse como una comunicación capaz de reconocer el componente emocional de la relación.

Incluye:

- respeto;
- calidez profesional;
- empatía;
- aceptación;
- sensibilidad;
- reconocimiento del sufrimiento.', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d2f5f3a9-6274-58c7-a252-1de0deeab2a0', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_6', 'No significa', '- sobreinvolucrarse;
- actuar como amigo;
- compartir indiscriminadamente información personal;
- romper límites.

---', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9d2a49a7-3263-50bb-97c0-4a818183b5d0', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_7', '5. Comunicación efectiva', 'Es aquella en la que:

- el mensaje es claro;
- el receptor puede comprenderlo;
- existe oportunidad de responder;
- se verifica comprensión;
- se minimizan barreras;
- la comunicación cumple un propósito terapéutico.

AHRQ recomienda comunicación clara y el método **teach-back** para confirmar comprensión.

---', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('427d255d-eaec-5b7e-b57a-cad8c966fd9b', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_8', '6. Comunicación verbal', 'Incluye:

- palabras;
- contenido;
- preguntas;
- explicaciones;
- tono conceptual del mensaje.

Debe ser:

- clara;
- concreta;
- comprensible;
- respetuosa;
- adaptada al nivel de comprensión.

Evitar jerga innecesaria.

---', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e0a796b2-f175-5c0a-a683-60e433574fee', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_9', '7. Comunicación no verbal', 'Incluye:

- postura;
- distancia;
- gestos;
- expresión facial;
- orientación corporal;
- movimientos;
- silencio;
- contacto visual.', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bcb21510-d718-5e3d-b2bc-123af819edca', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_10', 'Importante', 'El significado de muchas conductas no verbales depende de:
- cultura;
- neurodiversidad;
- situación clínica;
- preferencias.

No interpretar un solo gesto como prueba de una emoción o diagnóstico.

---', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bf0a01dd-6f29-5828-bc18-8f60686b4ae3', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_11', '8. Comunicación paraverbal', 'Incluye:

- tono;
- volumen;
- velocidad;
- ritmo;
- pausas.

Ejemplo:
Una frase aparentemente tranquila dicha con volumen alto y tono amenazante transmite algo diferente de las mismas palabras en tono calmado.

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0ee65db9-abc9-5e0b-a51e-e01dccdae905', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_12', '9. Escucha activa', 'Implica:

- atención;
- presencia;
- no interrumpir innecesariamente;
- observar;
- responder al contenido y emoción;
- verificar comprensión.

AHRQ recomienda escuchar activamente, emplear preguntas abiertas y evitar asumir que el paciente comprendió.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('71bc797b-4b9b-5191-802e-34baee0f2dba', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_13', '10. Preguntas abiertas', 'Favorecen expresión.

Ejemplos:

- “¿Qué ocurrió después?”
- “¿Cómo se ha sentido desde entonces?”
- “¿Qué le preocupa más?”
- “¿Qué cree que le ayudaría?”', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4b6f8094-3e4c-59e4-b8e9-93e811a09b9d', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_14', 'Evitar convertir la entrevista en interrogatorio', 'Alternar preguntas con:
- escucha;
- reflexión;
- silencio;
- resumen.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1adffd6c-9dab-5a06-923c-7e476f008776', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_15', '11. Preguntas cerradas', 'Son útiles cuando se necesita información concreta:

- “¿Tomó la medicación hoy?”
- “¿Tiene un plan para hacerse daño?”
- “¿Escucha voces ahora?”', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a7d830fb-cf98-5f14-ba1b-a9f90848b36b', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_16', 'Clave', 'No son “malas”; deben utilizarse cuando el propósito clínico exige precisión.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('091da8e2-b976-5544-89fe-4ca28d6bb2f7', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_17', '12. Clarificación', 'Se utiliza cuando el mensaje no está claro.

Ejemplos:

- “Cuando dice que no puede más, ¿qué significa exactamente?”
- “¿Puede explicarme qué entiende por ‘me persiguen’?”

Evita asumir significados.

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('333b3e4b-50fa-5f00-8fee-3ebe7b6daa22', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_18', '13. Reflexión', 'Devuelve al paciente parte de lo expresado para favorecer exploración.

Paciente:
> “No sé si debería volver a casa.”

Enfermera:
> “Parece que tiene dudas sobre regresar.”

No debe convertirse en repetición mecánica de cada frase.

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a2217c54-35fa-52fe-9755-99f847e22551', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_19', '14. Reformulación / parafraseo', 'Expresar con otras palabras lo comprendido.

> “Entonces, desde que perdió el trabajo se siente más aislado y ha dejado de dormir bien.”

Permite que la persona:
- confirme;
- corrija;
- amplíe.

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3ae25469-d2d6-5a9c-bd12-7000c8232be4', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_20', '15. Focalización', 'Ayuda a concentrarse en un tema relevante.

> “Ha mencionado varias dificultades. Me gustaría volver a lo que dijo sobre no querer despertar mañana.”', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f2722370-7fb9-52f7-9419-d4a7888b8d2f', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_21', 'Seguridad', 'En presencia de riesgo, focalizar en seguridad tiene prioridad sobre explorar temas menos urgentes.

---', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('035abb8b-74a0-5f4b-a4be-e3c851050094', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_22', '16. Silencio terapéutico', 'El silencio puede:

- permitir organizar pensamientos;
- favorecer expresión emocional;
- disminuir presión;
- mostrar presencia.', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0438afa5-29cd-5285-9510-716c4cc90703', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_23', 'Importante', 'No todo silencio es terapéutico.

Debe distinguirse de:
- abandono;
- distracción;
- castigo;
- incomodidad del profesional.

---', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1fb54609-99d0-555d-90c8-cd29d8ed6e21', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_24', '17. Empatía', 'Es intentar comprender la experiencia de la persona desde su perspectiva y comunicar esa comprensión.

Ejemplo:
> “Parece que se sintió muy solo cuando recibió esa noticia.”', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('73b49127-7930-5a2b-a88f-da98fdc37e56', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_25', 'Empatía ≠ simpatía', 'Empatía mantiene el foco en la experiencia del paciente.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a81945d8-8837-51e5-a93b-43d29946b50f', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_26', '18. Validación', 'Reconoce que la emoción de la persona es real y significativa.

> “Entiendo que esto le genere miedo.”

No implica confirmar una idea delirante.

Ejemplo ante delirio:

**No recomendado:**  
“Sí, definitivamente lo están vigilando.”

**Más terapéutico:**  
“No veo evidencia de que alguien lo esté vigilando, pero entiendo que para usted se siente muy real y aterrador.”

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fc5b11d8-a4f7-5875-9698-e888c557dd89', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_27', '19. Presentar realidad', 'Cuando existe alteración de percepción o pensamiento:

- mantener calma;
- reconocer emoción;
- no discutir agresivamente;
- no reforzar el contenido falso;
- presentar realidad de forma breve;
- redirigir hacia seguridad.

---', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6846c057-8106-5e36-b25a-7f3f6d0bd1db', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_28', '20. Alucinaciones', 'Ante una persona que escucha voces:

- valorar qué dicen;
- preguntar si ordenan hacer daño;
- valorar capacidad de resistir órdenes;
- evaluar riesgo;
- presentar realidad;
- disminuir estímulos si ayuda;
- mantener seguridad.', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cb5c3ee7-5ed8-5ad5-853d-99a40baed0c9', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_29', 'Error', 'Decir:
> “Las voces son reales, haga lo que dicen.”

También es poco útil:
> “Eso es ridículo.”

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ad64eb32-896b-5366-bf93-e14e0aa736e8', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_30', '21. Comunicación con persona deprimida', 'Puede ser útil:

- frases breves;
- tiempo para responder;
- silencio tolerado;
- preguntas directas sobre suicidio;
- reconocimiento de sufrimiento;
- evitar presión excesiva.

Evitar:
- “anímese”;
- “otros están peor”;
- “todo está en su mente”.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('50294268-b6a6-5f13-9d96-b4b42351b93e', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_31', '22. Comunicación con ansiedad intensa', '- tono calmado;
- frases cortas;
- instrucciones simples;
- reducir estímulos;
- permanecer presente;
- priorizar seguridad;
- repetir información cuando sea necesario.

En ansiedad extrema, una explicación larga puede no ser procesada adecuadamente.

---', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d4d190f7-9e01-5978-910f-74a150dcea56', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_32', '23. Comunicación ante agresividad', 'Prioridades:

- seguridad;
- distancia;
- salida accesible;
- tono bajo y firme;
- límites claros;
- evitar provocación;
- no rodear innecesariamente;
- ofrecer opciones simples cuando sea seguro;
- activar ayuda temprano.

Ejemplo:
> “Puedo escuchar lo que necesita, pero no puedo permitir que golpee a otras personas.”

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('299a187b-d37c-53d7-adc4-6eed0a97c99b', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_33', '24. Límites terapéuticos', 'Los límites deben ser:

- claros;
- consistentes;
- respetuosos;
- relacionados con seguridad y conducta.

Evitar:
- amenazas;
- humillación;
- negociación de límites esenciales;
- castigos arbitrarios.

---', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c49d3889-57b5-59bb-b4ab-e29ee954fdde', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_34', '25. Falsa tranquilidad', 'Frases como:

- “Todo va a salir bien.”
- “No se preocupe.”
- “Seguro no es nada.”

pueden cerrar la comunicación.

Alternativa:

> “Veo que esto le preocupa. Dígame qué es lo que más teme en este momento.”

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('79e98dfd-c696-5c97-9238-0973dd7007a3', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_35', '26. Dar consejos', 'Decir:
> “Yo en su lugar haría…”

puede desplazar la decisión hacia el profesional.

Más útil:

- explorar opciones;
- consecuencias;
- recursos;
- valores;
- decisiones propias.

Excepción:
Cuando existe una instrucción clínica o de seguridad necesaria, la enfermera debe ser clara y directiva.

---', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a91c0528-6dee-5da2-96eb-4536d7fa61b2', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_36', '27. Preguntas “¿por qué?”', 'Pueden ser apropiadas en algunos contextos, pero en entrevista terapéutica pueden sonar acusatorias.

En vez de:
> “¿Por qué hizo eso?”

Puede ser más útil:
> “¿Qué estaba ocurriendo justo antes?”
> “¿Qué pensó en ese momento?”

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('83cd9ecd-946a-5463-b3a2-b2b27926bd56', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_37', '28. Cambiar de tema', 'Si el paciente comparte algo doloroso y el profesional cambia rápidamente de tema, puede transmitir rechazo.', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('830ece00-e480-58b0-a1de-66e0cf51a3a2', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_38', 'Excepción', 'Puede redirigirse de forma deliberada cuando:
- aumenta desorganización;
- existe escalamiento;
- se necesita priorizar seguridad.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c6a6dff4-efc5-5bff-a150-8b79d1b6ee93', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_39', '29. Comunicación y cultura', 'Valorar:

- idioma;
- significado cultural;
- contacto visual;
- distancia;
- familia;
- espiritualidad;
- forma de expresar sufrimiento.

No asumir que una conducta tiene el mismo significado en todas las culturas.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ce81e721-a65f-5cbe-b454-32e47414bfbe', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_40', '30. Intérprete', 'Cuando existe una barrera importante de idioma:

- utilizar intérprete calificado cuando esté disponible;
- hablar directamente al paciente;
- usar frases claras;
- evitar pedir a menores que interpreten información sensible;
- preservar confidencialidad.

AHRQ recomienda intérpretes calificados y teach-back para mejorar comprensión.

---', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3ab85a74-9322-5479-90fd-a83296c8b59b', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_41', '31. Teach-back', 'Teach-back no pregunta:
> “¿Entendió?”

Pide al paciente explicar con sus propias palabras.

Ejemplo:
> “Para asegurarme de que lo expliqué bien, ¿puede decirme cómo va a tomar este medicamento al llegar a casa?”', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('60d2a1f4-31e6-5d7c-be70-fc28cd7017a9', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_42', 'Clave', 'Teach-back evalúa la claridad de nuestra explicación, no la inteligencia del paciente.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('68148c4b-9bf6-53cc-9235-e5a78e7cab44', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_43', '32. Verificación de comprensión', 'AHRQ advierte que una respuesta “sí” a “¿entendió?” no garantiza comprensión.

Por eso se puede pedir:

- explicar;
- mostrar;
- repetir plan en sus propias palabras.

Especialmente importante en:
- alta;
- medicamentos;
- señales de alarma;
- planes de seguridad.

---', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a0578206-8879-5f72-b3b5-6db98ab99bf3', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_44', '33. Comunicación escrita', 'Debe ser:

- clara;
- legible;
- concreta;
- con lenguaje comprensible;
- organizada.

Puede apoyarse con:
- pictogramas;
- listas breves;
- calendarios;
- instrucciones visuales.

Adaptar a alfabetización, visión y capacidad cognitiva.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('730fb2f1-e0bd-5a90-8319-01a5667484be', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_45', '34. Confidencialidad', 'La información compartida en la relación terapéutica debe protegerse.

No conversar sobre pacientes:
- en ascensores;
- pasillos;
- redes sociales;
- con personas sin necesidad asistencial.', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e3ef82ae-6acd-50e8-8b5d-16a05e411cf5', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_46', 'Límites', 'La confidencialidad puede tener excepciones legales/de seguridad, por ejemplo ante riesgo grave e inminente, según marco aplicable.

---', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('acfac82d-e480-5c23-ae44-ce11ba8e6114', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_47', '35. Comunicación dentro del equipo', 'La comunicación profesional debe ser:

- objetiva;
- relevante;
- oportuna;
- verificable.

Herramientas estructuradas como SBAR pueden ayudar en transferencias y escalamiento.', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('336901b2-28e5-54a1-b1a4-3fcc0f90b9cf', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_48', 'Seguridad', 'Evitar etiquetas no clínicas como:
- “difícil”;
- “manipulador”;
- “problemático”

sin describir la conducta observable.

---', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f9cb5a3a-0cce-538e-bb39-fccf65e851f9', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_49', '36. Documentación terapéutica', 'Registrar:

- conducta observable;
- palabras relevantes del paciente;
- riesgos;
- intervención;
- respuesta.

Preferir:

> “Paciente caminó repetidamente por el pasillo, elevó la voz y dijo ‘quiero salir ahora’.”

en lugar de:

> “Paciente estaba loco y agresivo.”

---', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('71a81f51-c21f-57eb-a470-0578fe82ad2b', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_50', '37. Comunicación centrada en la persona', 'La OMS promueve servicios que:

- respeten derechos;
- fortalezcan autonomía;
- apoyen recuperación;
- incorporen preferencias;
- eviten coerción innecesaria.

La comunicación es parte central de ese enfoque.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('af72866e-7574-53da-8891-fb4f02809f0d', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_51', '38. PAE', '', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6ca29dde-f84f-5a57-acaf-8effb84f0bf4', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_52', 'Valoración', '- capacidad de comunicación;
- lenguaje;
- pensamiento;
- percepción;
- emoción;
- audición/visión;
- idioma;
- cognición;
- riesgo;
- apoyo.', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d9721d8b-c1e3-5b5e-8122-8f2d7ffa2010', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_53', 'Problemas/juicios posibles', '- comunicación alterada;
- ansiedad;
- aislamiento;
- conocimiento insuficiente;
- afrontamiento alterado;
- riesgo de violencia/autolesión.', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cbe6a227-a5ad-5c38-b69f-d36f2ed14852', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_54', 'Planificación', '- comunicación comprensible;
- expresión emocional;
- seguridad;
- participación.', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b07b5e01-c47e-5e41-b47b-71d34670e936', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_55', 'Implementación', '- escucha;
- técnicas terapéuticas;
- límites;
- adaptación;
- intérprete;
- teach-back.', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('887cb38b-5237-5cab-a3d1-484302b432d9', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_56', 'Evaluación', '- comprensión;
- participación;
- disminución de escalamiento;
- seguridad;
- relación terapéutica.

---', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('feca321e-68a3-5d41-a68b-8041e614a769', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_57', '39. Situaciones tipo examen', '', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0838fb43-63d0-52fa-92f5-463f1a6b7231', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_58', 'Caso 1', 'Paciente dice: “No puedo seguir así.”

**Respuesta:** clarificar qué significa y valorar seguridad; no asumir.', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('39f802b7-0433-5335-98b0-91812df1bfca', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_59', 'Caso 2', 'Paciente llora y la enfermera responde: “No llore, todo va a estar bien.”

**Problema:** falsa tranquilidad e invalidación.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('edd436f9-e9d6-5a4f-bed4-b5b063c9b01e', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_60', 'Caso 3', 'Paciente tarda en responder durante episodio depresivo.

**Conducta:** permitir tiempo y silencio terapéutico.', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7ff51f41-1d65-5a4c-8f40-f92dfa1d33dc', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_61', 'Caso 4', 'Paciente afirma que cámaras secretas lo vigilan.

**Conducta:** reconocer miedo sin confirmar el delirio y presentar realidad brevemente.', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('742e0f04-755f-5cb4-bdd4-5e8c43e0530e', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_62', 'Caso 5', 'Paciente escucha voces.

**Prioridad:** preguntar contenido, especialmente órdenes de autolesión o violencia.', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0a56abbc-cb51-530d-9025-4fc034760f67', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_63', 'Caso 6', 'Paciente con ansiedad extrema recibe una explicación de 15 minutos.

**Problema:** simplificar, reducir estímulos y dar instrucciones breves.', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('df6be391-f486-563f-a4d7-2a29bf2191a1', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_64', 'Caso 7', 'Paciente grita y amenaza.

**Conducta:** seguridad, distancia, tono calmado, límites claros y activar apoyo.', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4a036298-effd-5ede-acc9-bfe44fafea6e', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_65', 'Caso 8', 'Paciente no domina el idioma y su hijo menor está presente.

**Conducta:** utilizar intérprete calificado cuando esté disponible, especialmente para información sensible.', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('81471253-7a73-5c43-8419-775df41ebe17', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_66', 'Caso 9', 'Enfermera pregunta “¿entendió?” y el paciente dice sí.

**Conducta:** usar teach-back para verificar comprensión.', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2c53f013-5566-5770-8b35-cc89ea5c7710', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_67', 'Caso 10', 'Paciente dice “tengo miedo de regresar a casa”.

**Respuesta terapéutica:** “¿Qué es lo que le preocupa de regresar?”', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fc363b4a-77bc-5bb1-94f1-9cda23edd0c5', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_68', 'Caso 11', 'Enfermera documenta “paciente manipulador”.

**Problema:** registrar conducta observable, no etiquetas.', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9783bc98-e4d6-5539-86a9-b3c28a6d9e7b', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_69', 'Caso 12', 'Paciente pide consejo sobre una decisión personal sin riesgo inmediato.

**Conducta:** ayudar a explorar opciones y valores en vez de decidir por él.

---', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('44cf6b4c-55be-5993-901c-020a4e7be448', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_70', '40. Errores frecuentes', '1. Confundir empatía con simpatía.
2. Interrumpir constantemente.
3. Dar falsa tranquilidad.
4. Dar consejos personales.
5. Usar preguntas acusatorias.
6. Confirmar delirios.
7. Discutir agresivamente con alucinaciones/delirios.
8. No valorar órdenes de las voces.
9. Dar demasiada información durante ansiedad intensa.
10. Gritar para controlar agresividad.
11. Utilizar familiares menores como intérpretes de rutina.
12. Preguntar solo “¿entendió?”.
13. Documentar etiquetas en lugar de conductas.
14. Romper confidencialidad innecesariamente.

---', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bd4a099a-e7b5-5d0e-ab3a-f767430b46b7', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_71', '41. Qué memorizar', '**Escucha activa = atención + observación + respuesta + verificación.**

**Preguntas abiertas favorecen expresión.**

**Clarificar = pedir significado.**

**Reflejar = devolver contenido/emoción para explorar.**

**Silencio puede ser terapéutico.**

**Empatía = comprender y comunicar comprensión.**

**Validar emoción ≠ confirmar delirio.**

**Alucinación → preguntar contenido y riesgo.**

**Agresividad → seguridad + calma + límites claros.**

**Teach-back ≠ “¿entendió?”**

**Comunicación terapéutica = clara + respetuosa + centrada en la persona + con límites.**

---', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2c2f5886-9227-5eac-a7fc-83d24b66b0dc', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_72', '42. Fuentes y validación', '', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9ffe7603-3952-57dd-943b-551db293b6f5', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_73', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**

El CICDE identifica este contenido como segundo punto del área de Salud y Enfermedad Mental.', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f173f898-de0e-58dd-abe0-8545e4e45a54', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_74', 'Bibliografía señalada por CICDE', '**AMIR. Enfermería Psiquiátrica y Salud Mental. 2014.**

**Galiana Roch, J. Enfermería Psiquiátrica. Elsevier. 2016.**

**DSM-5. Manual Diagnóstico y Estadístico de los Trastornos Mentales. Referenciado por CICDE.**', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1317576f-9b6f-5d49-aac6-619ed4ba1b27', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_75', 'Nota', 'Las rutas `file:///` presentes en la bibliografía del documento CICDE son enlaces locales del equipo donde se confeccionó el PDF y no son fuentes públicas utilizables.', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d47cf1ff-b976-52e8-a376-b894ddfceb09', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_76', 'Fuentes complementarias', '**World Health Organization. Guidance on community mental health services: promoting person-centred and rights-based approaches. 2021.**

**World Health Organization. World Mental Health Report: Transforming Mental Health for All. 2022.**

**Agency for Healthcare Research and Quality. Health Literacy Universal Precautions Toolkit — Clear Communication / Teach-Back. Actualización 2023–2024.**

**International Council of Nurses. Código de Ética del CIE para las Enfermeras. 2021.**

---', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a440d219-cde9-50fb-a499-0085511796bc', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_77', '43. Control de calidad', 'Este paquete:

- cubre literalmente la comunicación afectiva y efectiva del CICDE;
- desarrolla técnicas terapéuticas clásicas;
- incorpora comunicación centrada en derechos;
- diferencia empatía, validación y presentación de realidad;
- incluye delirios y alucinaciones sin reforzarlos;
- incluye de-escalamiento comunicacional básico;
- incorpora AHRQ teach-back;
- incluye confidencialidad y documentación;
- contiene 12 casos originales.

---', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f59af7ed-41b5-5d7c-ae25-8996227d874a', 'ded19263-bf42-5185-b801-81bd378d24c7', 'sec_78', '44. Estado para integración', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- enlazar fuentes;
- mantener las técnicas comunicacionales diferenciadas de intervenciones coercitivas o de emergencia;
- enlazar con MENTAL-01, MENTAL-05, MENTAL-07 y MENTAL-10.', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2b505fc2-23f6-54e8-9e1f-b19202fbfca4', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_1', 'Estrategias para promover salud mental en cada etapa del ciclo vital', '**Área:** Enfermería en Salud y Enfermedad Mental  
**Código:** MENTAL-03  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a5221109-8ab0-50f9-93a4-7e95d00e0c23', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_2', '1. Alcance oficial CICDE', 'El lineamiento CICDE 2026 incluye expresamente:

**“Estrategias para promover salud mental en cada etapa del ciclo vital”.**

Este módulo desarrolla la promoción de la salud mental desde un enfoque de curso de vida, considerando:

- primera infancia;
- niñez;
- adolescencia;
- adultez joven;
- adultez media;
- adultez mayor;
- transiciones vitales;
- factores protectores y de riesgo;
- familia;
- escuela;
- trabajo;
- comunidad;
- envejecimiento saludable;
- prevención de violencia;
- promoción de vínculos;
- sueño, actividad física y hábitos saludables;
- detección temprana;
- reducción de estigma;
- acceso oportuno a servicios;
- PAE y educación.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ba9e120b-456e-5987-af8d-bb21871c9330', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_3', '2. Objetivos de aprendizaje', 'Al finalizar el tema, el estudiante debe poder:

1. Explicar el enfoque de curso de vida aplicado a salud mental.
2. Reconocer factores protectores y de riesgo en diferentes etapas.
3. Identificar intervenciones de promoción apropiadas para infancia, adolescencia, adultez y vejez.
4. Reconocer el valor de vínculos seguros y entornos protectores.
5. Integrar salud física, mental y social.
6. Promover habilidades de afrontamiento y resolución de problemas.
7. Reconocer señales que requieren evaluación profesional.
8. Evitar estigmatización y discriminación.
9. Promover participación familiar y comunitaria respetando autonomía y confidencialidad.
10. Utilizar intervenciones de prevención y promoción en atención primaria.
11. Reconocer transiciones vitales como momentos de oportunidad y riesgo.
12. Integrar el PAE.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ab150a65-4a82-54ce-8eec-97ac4c25c58c', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_4', '3. Salud mental', 'La OMS define la salud mental como un estado de bienestar mental que permite a las personas:

- afrontar las tensiones de la vida;
- desarrollar sus capacidades;
- aprender;
- trabajar;
- contribuir a su comunidad.

La salud mental existe en un continuo y está influida por múltiples factores:

- individuales;
- familiares;
- comunitarios;
- sociales;
- económicos;
- ambientales;
- estructurales.', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8e8f77d3-6949-5e1a-b8d2-70789ea8e383', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_5', 'Clave', 'Promover salud mental no significa solamente prevenir trastornos.

También significa fortalecer:
- bienestar;
- capacidades;
- relaciones;
- participación;
- resiliencia;
- acceso a oportunidades.

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('787cd91c-bd91-5083-90b7-2cd0651c2472', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_6', '4. Enfoque de curso de vida', 'La OMS publicó en 2025 un marco para aplicar el enfoque de curso de vida.

Este enfoque reconoce que:

- la salud se construye desde etapas tempranas;
- existen períodos sensibles y transiciones;
- los riesgos y factores protectores pueden acumularse;
- experiencias tempranas pueden influir en etapas posteriores;
- la intervención puede ser útil en cualquier edad.', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a545e4a4-7b13-5868-92dd-94f8b34bc5b3', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_7', 'Principio', 'No existe una única estrategia válida para todas las etapas.

---', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('79946f29-8e08-5e35-9a61-990872000598', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_8', '5. Factores protectores generales', 'Pueden incluir:

- vínculos seguros;
- apoyo social;
- vivienda estable;
- alimentación adecuada;
- acceso a educación;
- seguridad;
- participación comunitaria;
- sentido de pertenencia;
- habilidades socioemocionales;
- actividad física;
- sueño adecuado;
- acceso a servicios;
- oportunidades de empleo;
- reducción de violencia y discriminación.

---', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6c5ff17d-70b7-5ba4-9c21-001bb87054ef', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_9', '6. Factores de riesgo generales', 'La OMS reconoce factores como:

- pobreza;
- violencia;
- discriminación;
- aislamiento social;
- estrés crónico;
- inseguridad;
- trauma;
- enfermedad crónica;
- consumo problemático de sustancias;
- desempleo;
- problemas habitacionales;
- emergencias y desastres.', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('57da26d8-c7e6-5aed-ad6f-b15668aa8646', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_10', 'Importante', 'Tener factores de riesgo no significa que una persona desarrollará necesariamente un trastorno mental.

---', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('86691c37-0506-58f5-8fb9-f9ccdc5f6b18', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_11', '7. Primera infancia', 'La primera infancia es una etapa crítica para:

- vínculo;
- regulación emocional;
- desarrollo cognitivo;
- lenguaje;
- confianza;
- seguridad.', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f1ae7589-a828-544b-9218-c6a37a23bdca', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_12', 'Estrategias de promoción', '- vínculo sensible cuidador-niño;
- respuesta a necesidades;
- estimulación apropiada;
- juego;
- rutinas;
- sueño seguro y adecuado;
- nutrición;
- protección frente a violencia;
- apoyo a cuidadores;
- detección de retrasos del desarrollo.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ee32007b-ac90-5495-a2ce-aac5e305211f', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_13', '8. Salud mental del cuidador', 'El bienestar del cuidador influye en el entorno del niño.

Enfermería puede:

- preguntar por estrés;
- explorar apoyo disponible;
- reconocer agotamiento;
- orientar hacia servicios;
- promover descanso y apoyo;
- detectar violencia o riesgo.', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8888e88e-135b-53c2-a5f8-6a3d9986aea3', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_14', 'Clave', 'Apoyar al cuidador también es una intervención de promoción para el niño.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eb2985ba-2947-51d2-9e09-d2cd209e832f', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_15', '9. Niñez escolar', 'Necesidades frecuentes:

- seguridad;
- pertenencia;
- aprendizaje;
- amistades;
- autoestima;
- regulación emocional.', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1a0cf897-14ba-53e6-b645-9ab9b8ee57a2', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_16', 'Estrategias', '- habilidades socioemocionales;
- resolución de conflictos;
- prevención de acoso;
- actividad física;
- rutinas;
- sueño;
- participación familiar;
- detección de dificultades escolares;
- ambientes libres de violencia.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6d4f7da9-0267-5410-9dd9-da08300a48db', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_17', '10. Acoso escolar', 'Puede afectar:

- autoestima;
- asistencia;
- rendimiento;
- ansiedad;
- depresión;
- riesgo de autolesión.', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d1926798-1476-5bda-a4fe-6146c4c93282', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_18', 'Enfermería', 'No reducirlo a “cosas de niños”.

Explorar:
- seguridad;
- frecuencia;
- amenazas;
- apoyo;
- impacto emocional;
- necesidad de intervención escolar/familiar.

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4b94eae6-64ca-5579-a15a-e574159409dc', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_19', '11. Adolescencia', 'Es una etapa de:

- cambios físicos;
- identidad;
- autonomía;
- relaciones;
- presión social;
- exploración;
- transición educativa.

Puede aumentar vulnerabilidad ante:
- violencia;
- consumo de sustancias;
- problemas de imagen corporal;
- ansiedad;
- depresión;
- autolesión;
- riesgo suicida.

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c52c2959-9873-5507-a9db-fd24751b26a0', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_20', '12. Promoción en adolescencia', '- espacios de escucha;
- habilidades emocionales;
- apoyo entre pares saludable;
- actividad física;
- sueño;
- prevención de sustancias;
- educación sexual;
- uso saludable de tecnología;
- prevención de violencia;
- acceso confidencial apropiado a servicios;
- fortalecer adultos de confianza.

---', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('59b0e0f8-a0cf-5148-85a6-174f9dfd3a2f', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_21', '13. Tecnología y redes sociales', 'El uso digital puede tener beneficios y riesgos.

Beneficios:
- conexión;
- información;
- apoyo;
- creatividad.

Riesgos posibles:
- acoso;
- comparación social;
- contenido dañino;
- alteración del sueño;
- exposición a violencia;
- uso problemático.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1dea7fcd-3380-50c6-b23f-3374bd006e92', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_22', 'Educación', 'Evitar mensajes absolutos de “redes sociales = malas”.

Promover:
- límites;
- sueño;
- seguridad;
- privacidad;
- búsqueda de ayuda ante acoso.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b2fd6012-0712-5be2-a879-e5b19d5490d9', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_23', '14. Detección de señales en adolescentes', 'Explorar cuando hay:

- cambio marcado de conducta;
- aislamiento;
- caída funcional;
- ausentismo;
- autolesiones;
- consumo;
- desesperanza;
- irritabilidad persistente;
- trastornos del sueño;
- ideas de muerte.', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('72791ecf-6ee9-549c-983e-d7ec65a5f596', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_24', 'Seguridad', 'Ante ideación suicida, preguntar directamente y activar evaluación de riesgo.

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('42d076cc-a9d8-5d54-9ee4-d7b9f5e9c288', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_25', '15. Adultez joven', 'Transiciones frecuentes:

- educación superior;
- primer empleo;
- independencia;
- relaciones de pareja;
- maternidad/paternidad;
- migración;
- cambios económicos.', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('34f3fea4-9283-5e3d-9ca3-ace28ac53924', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_26', 'Promoción', '- habilidades de afrontamiento;
- red de apoyo;
- manejo del estrés;
- hábitos saludables;
- prevención de consumo;
- acceso temprano a atención;
- equilibrio trabajo-vida.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ad9f66c7-e015-5d38-9477-86cde354ed6a', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_27', '16. Salud mental perinatal', 'Embarazo y posparto pueden asociarse con cambios emocionales importantes.

Enfermería debe:

- preguntar por estado de ánimo;
- sueño;
- ansiedad;
- apoyo;
- violencia;
- consumo;
- pensamientos de autolesión;
- vínculo con el bebé;
- funcionamiento.', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ecf1f057-a3ed-5806-b2db-d6dab3e92902', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_28', 'Alarma', 'Psicosis posparto, conducta desorganizada o ideas de daño a sí misma o al bebé requieren atención urgente.

---', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('233ecdb0-7900-56eb-91f0-5b906324e9d6', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_29', '17. Adultez media', 'Posibles retos:

- responsabilidades familiares;
- cuidado de hijos y padres;
- carga laboral;
- enfermedad crónica;
- cambios económicos;
- duelo;
- cambios de rol.', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8c04bc78-040c-573f-a365-dfd6bd4cb2e3', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_30', 'Promoción', '- manejo del estrés;
- actividad;
- redes sociales;
- sueño;
- prevención de burnout;
- apoyo a cuidadores;
- atención a salud física;
- ayuda temprana.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5fea6e35-853f-56e2-9f3e-38aaf2de47c8', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_31', '18. Salud mental en el trabajo', 'El trabajo puede ser:

- fuente de propósito;
- ingreso;
- identidad;
- vínculos.

También puede implicar:
- sobrecarga;
- acoso;
- inseguridad laboral;
- falta de control;
- discriminación;
- burnout.', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('126993a5-7bff-5433-9de0-7b99ef619354', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_32', 'Promoción', '- ambientes psicológicamente seguros;
- prevención de acoso;
- pausas;
- apoyo;
- acceso a salud;
- liderazgo saludable;
- equilibrio de demandas.

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b4906c4c-d1a1-59d0-ae78-ed93af800518', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_33', '19. Panamá y certificados de salud mental', 'En 2026, MINSA reiteró la aplicación de la **Ley 364 de 2023** y el **Decreto Ejecutivo 61 de 2024**, que protegen el derecho humano a la salud mental.

MINSA indicó que no debe solicitarse de forma general un certificado de salud mental como requisito de empleo, educación o trámite administrativo, salvo excepciones reguladas para actividades de alto riesgo.', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f6a73531-42a7-5640-ad72-b0e9af29b59d', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_34', 'Valor académico', 'Este ejemplo ilustra:
- reducción de discriminación;
- enfoque de derechos;
- no estigmatización.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aedf24e5-2cb2-58ed-a050-d69c1a6c9b2d', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_35', '20. Adultez mayor', 'En esta etapa pueden presentarse:

- jubilación;
- duelos;
- enfermedad crónica;
- disminución funcional;
- cambios sensoriales;
- aislamiento;
- cambios de vivienda;
- dependencia.', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cfa4002d-08e9-5e31-becf-325ba1d82281', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_36', 'Error frecuente', 'Considerar depresión, aislamiento o pérdida de interés como “normal por la edad”.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('514d6c8c-2493-50e5-8cd4-e390a563457f', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_37', '21. Promoción en adultez mayor', '- participación social;
- actividad física adaptada;
- propósito;
- estimulación cognitiva;
- sueño;
- manejo de enfermedades;
- corrección de barreras auditivas/visuales;
- prevención de caídas;
- apoyo a cuidadores;
- detección de depresión;
- prevención de maltrato.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bca8a4bc-dc6d-5fd6-9c71-a47e449c798d', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_38', '22. Soledad y aislamiento', 'No son idénticos.

**Aislamiento social:** pocos contactos o interacciones objetivas.

**Soledad:** experiencia subjetiva de desconexión.

Ambos pueden afectar salud mental.

Intervenciones:
- explorar preferencias;
- facilitar conexión;
- grupos comunitarios;
- actividades significativas;
- tecnología accesible;
- apoyo familiar.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('12726487-9e8c-5d55-a976-147459dc8e4a', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_39', '23. Duelo', 'El duelo es una respuesta humana a una pérdida.

Puede incluir:

- tristeza;
- añoranza;
- alteración de sueño;
- cambios de apetito;
- emociones variables.', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('876fd4db-319d-5b7e-8fc8-a36e48a63762', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_40', 'No patologizar automáticamente', 'La intensidad y duración deben interpretarse según:
- cultura;
- contexto;
- funcionamiento;
- riesgo.

Derivar cuando existe:
- deterioro persistente significativo;
- riesgo suicida;
- síntomas severos;
- incapacidad funcional preocupante.

---', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d2477307-36b5-559d-9864-347172b57cc8', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_41', '24. Transiciones vitales', 'Momentos de transición pueden incluir:

- inicio escolar;
- adolescencia;
- graduación;
- empleo;
- matrimonio/separación;
- maternidad/paternidad;
- migración;
- jubilación;
- duelo;
- diagnóstico de enfermedad.', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bee99461-4a47-53bf-8534-83f5db2f0de1', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_42', 'Enfermería', 'Las transiciones son oportunidades para:
- anticipar estrés;
- identificar recursos;
- educar;
- detectar riesgo;
- fortalecer afrontamiento.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bca6c369-7b0a-588c-a055-843f26d3da4e', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_43', '25. Sueño y salud mental', 'El sueño influye en:

- regulación emocional;
- atención;
- memoria;
- energía;
- afrontamiento.

Promoción:
- horario regular;
- ambiente adecuado;
- reducir estimulantes;
- limitar pantallas antes de dormir;
- evaluar ronquido/apnea;
- revisar medicamentos.

---', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('368b9a04-df6d-5e22-a5c9-3553be59cdba', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_44', '26. Actividad física', 'La actividad física apropiada puede favorecer:

- bienestar;
- sueño;
- reducción de estrés;
- función;
- participación social.

Debe adaptarse a:
- edad;
- condición física;
- comorbilidades;
- preferencias.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bdb7eca9-b481-574d-8c27-7d75f8fa9950', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_45', '27. Sustancias', 'La promoción de salud mental incluye:

- educación;
- identificación de consumo de riesgo;
- intervención temprana;
- reducción de daños cuando corresponda;
- tratamiento sin estigma.

Evitar lenguaje despectivo.

---', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('41f6945d-bbee-5a31-9bdb-43c02f2142cd', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_46', '28. Violencia', 'La exposición a violencia afecta salud mental a cualquier edad.

Puede incluir:

- violencia infantil;
- pareja;
- sexual;
- comunitaria;
- laboral;
- contra adulto mayor.', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6df93d30-0348-525f-9461-70488d331846', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_47', 'Enfermería', '- privacidad;
- preguntas sensibles;
- evaluación de seguridad;
- documentación objetiva;
- rutas de protección;
- evitar confrontar al agresor frente a la víctima.

---', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9b76e876-ed1d-5d70-a1de-c3e7ddab6493', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_48', '29. Factores sociales', 'La salud mental está vinculada a:

- vivienda;
- empleo;
- educación;
- seguridad;
- ingresos;
- acceso a servicios;
- discriminación.

La OMS 2025 enfatiza que políticas de salud mental deben considerar determinantes sociales y estructurales.

---', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8729e7bd-2888-53c3-8326-bd495f9c5e07', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_49', '30. Promoción universal, selectiva e indicada', '', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('51304dc7-4989-592e-8f15-4d0708a34bab', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_50', 'Universal', 'Dirigida a población general.

Ejemplo:
- campañas contra estigma.', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8a5b7f32-50c3-52ce-bec9-a2415f925499', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_51', 'Selectiva', 'Dirigida a grupos con mayor exposición al riesgo.

Ejemplo:
- apoyo a cuidadores.', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('809ce785-0f93-5087-b071-01ba7204ff41', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_52', 'Indicada', 'Dirigida a personas con señales tempranas o factores muy específicos sin diagnóstico necesariamente establecido.

Ejemplo:
- intervención temprana ante síntomas iniciales.

---', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('58063768-46db-5ddd-9b8b-266927b74085', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_53', '31. Entornos promotores', 'La promoción no ocurre solo en hospitales.

Puede desarrollarse en:

- hogar;
- escuela;
- universidad;
- trabajo;
- centro comunitario;
- atención primaria;
- redes sociales;
- espacios deportivos;
- comunidades religiosas si la persona lo desea;
- servicios para adultos mayores.

---', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('de30259c-3378-5660-a81e-ac147f554bd4', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_54', '32. Reducción del estigma', 'Estrategias:

- lenguaje centrado en la persona;
- educación;
- contacto social respetuoso;
- información basada en evidencia;
- protección de derechos;
- acceso equitativo.', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7069d96d-b856-51ac-a5d4-a505fe0031aa', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_55', 'No usar', '- “loco”;
- “débil”;
- “peligroso” como generalización;
- culpabilización.

---', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f7633e4c-5ba3-56b6-8eeb-530d8deb6369', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_56', '33. Señales de alarma transversales', 'A cualquier edad, requieren evaluación oportuna:

- ideación suicida;
- autolesión;
- psicosis nueva;
- agitación severa;
- violencia;
- delirium/cambio agudo de conciencia;
- deterioro funcional importante;
- incapacidad para cubrir necesidades básicas;
- intoxicación/abstinencia grave.

---', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7d3c80b5-cddf-5edf-8ba2-bfb71090812a', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_57', '34. Panamá — Programa de Salud Mental', 'El Programa de Salud Mental de MINSA declara entre sus funciones:

- acciones de promoción;
- protección;
- prevención;
- atención primaria;
- reducción de la carga de enfermedad mental;
- articulación intersectorial;
- integración de equipos de salud mental en atención primaria.', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1e548c4d-66c2-5d40-b57d-c5c4a5cbd115', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_58', 'Importancia', 'La promoción de salud mental es una función explícita del sistema sanitario panameño y no solamente una intervención especializada hospitalaria.

---', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e47e3191-09de-5485-8a09-863969141026', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_59', '35. PAE', '', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('10172c88-9ceb-5d6d-8eab-ecf7b9b03870', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_60', 'Valoración', '- etapa vital;
- transición actual;
- factores protectores;
- riesgos;
- apoyo;
- función;
- sueño;
- sustancias;
- violencia;
- seguridad.', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e6ea2a5e-167a-5734-ace8-5e821065ac54', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_61', 'Problemas/juicios posibles', '- afrontamiento alterado;
- aislamiento;
- estrés;
- riesgo de violencia/autolesión;
- conocimiento insuficiente.', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c5041f25-2f56-5dbd-a466-6f615a12e9df', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_62', 'Planificación', '- fortalecer factores protectores;
- reducir riesgos;
- aumentar acceso;
- mantener función;
- detectar señales tempranas.', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('81c8b0d0-bd3a-56f7-b7bf-62991d9f00e6', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_63', 'Implementación', '- educación;
- apoyo;
- referencias;
- actividades;
- participación familiar/comunitaria;
- reducción de estigma.', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eb6b529b-0b7e-5ee2-92e9-307983d5bf23', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_64', 'Evaluación', '- bienestar;
- función;
- apoyo;
- uso de estrategias;
- acceso a servicios;
- seguridad.

---', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('430155f1-5325-55e4-91c9-57c41072a5af', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_65', '36. Situaciones tipo examen', '', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('78156205-b794-5a6d-95f0-0104bc7d9438', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_66', 'Caso 1 — Primera infancia', 'Madre agotada refiere que no tiene apoyo y duerme muy poco.

**Intervención:** valorar bienestar del cuidador y red de apoyo; apoyarla también protege el desarrollo del niño.', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('af6cd11e-ddc9-53d8-bcd8-6d1ddc232820', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_67', 'Caso 2 — Escolar', 'Niño evita escuela por acoso.

**Conducta:** valorar seguridad e impacto; no minimizar como “cosas de niños”.', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('97dccf28-c94b-5d1d-940a-6601928dd55d', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_68', 'Caso 3 — Adolescente', 'Adolescente se aísla y dice que “ya nada importa”.

**Prioridad:** explorar depresión y riesgo suicida directamente.', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('99f091df-3639-574b-a276-5c79091fa2d6', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_69', 'Caso 4 — Redes', 'Familia quiere prohibir toda tecnología porque “causa enfermedad mental”.

**Educación:** valorar uso, contenido, sueño y funcionamiento; evitar simplificaciones absolutas.', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5722069b-18df-5ac3-9502-b1bead07307e', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_70', 'Caso 5 — Posparto', 'Madre presenta conducta extraña y dice que voces le ordenan hacer daño al bebé.

**Prioridad:** emergencia psiquiátrica y seguridad inmediata.', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5d46f6e8-38a0-535a-882c-ecadc27e2d4c', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_71', 'Caso 6 — Adulto joven', 'Persona pierde empleo y se aísla.

**Intervención:** valorar afrontamiento, apoyo, síntomas y riesgo; facilitar recursos.', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('757eb231-379a-5d4a-be6d-8885b343f610', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_72', 'Caso 7 — Trabajo', 'Empleado refiere acoso laboral y ansiedad.

**Intervención:** reconocer factor ambiental, valorar seguridad y acceso a apoyo.', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6bcfe97f-f134-5c27-ada7-3c0d59b5760a', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_73', 'Caso 8 — Adulto mayor', 'Persona mayor pierde interés, apetito y expresa desesperanza.

**Conducta:** evaluar depresión; no atribuirlo automáticamente a envejecimiento.', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9fe3f6c8-a97d-5cd1-be76-e49883d30998', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_74', 'Caso 9 — Duelo', 'Persona llora tras una pérdida reciente, pero mantiene funcionamiento y apoyo.

**Conducta:** acompañar y no patologizar automáticamente.', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('72bf15ce-94b1-5d9e-81f2-6ab84c9775e7', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_75', 'Caso 10 — Aislamiento', 'Adulto mayor vive solo y desea más contacto social.

**Intervención:** facilitar recursos comunitarios respetando preferencias.', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b009a60d-66bb-56c1-8534-a07ddbd82158', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_76', 'Caso 11 — Violencia', 'Paciente revela violencia de pareja.

**Conducta:** privacidad, seguridad, documentación y ruta de apoyo; no confrontar al agresor.', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6df3d9ff-1864-5459-b864-1d13672893ec', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_77', 'Caso 12 — Promoción', 'Centro de salud organiza talleres de sueño, afrontamiento y prevención de estigma.

**Interpretación:** intervención de promoción comunitaria de salud mental.

---', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2e8c163f-9b6b-5fee-8fdd-5e1cdfff609c', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_78', '37. Errores frecuentes', '1. Reducir promoción a “dar charlas”.
2. Aplicar la misma intervención a todas las edades.
3. Ignorar al cuidador en primera infancia.
4. Minimizar acoso.
5. Patologizar todo duelo.
6. Normalizar depresión en personas mayores.
7. Ignorar determinantes sociales.
8. Culpar al individuo por estrés estructural.
9. Considerar redes sociales siempre buenas o siempre malas.
10. Omitir riesgo suicida ante señales.
11. Usar estigma como estrategia de prevención.
12. Creer que salud mental solo corresponde a psiquiatría.

---', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6dfe7737-db0e-5d1b-94ad-54fdfcf791e3', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_79', '38. Qué memorizar', '**Curso de vida = salud influida por riesgos, protección y transiciones acumuladas.**

**Promoción ≠ solo prevención de trastornos.**

**Primera infancia: vínculo + cuidado + estimulación + protección.**

**Adolescencia: identidad + pares + sueño + violencia + sustancias + riesgo suicida.**

**Adulto: trabajo + relaciones + estrés + apoyo.**

**Adulto mayor: participación + función + duelo + aislamiento + detectar depresión.**

**Factores sociales también modifican salud mental.**

**Salud mental puede promoverse en hogar, escuela, trabajo, comunidad y APS.**

**Señales de suicidio, psicosis, violencia o cambio agudo = escalar.**

---', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2a8bd112-542f-56a0-8e04-38b3ac8bf7e1', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_80', '39. Fuentes y validación', '', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6b6db4bf-555c-568d-ad91-5bac27e59e2a', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_81', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('99ec6264-9d17-5c4e-b67b-f5d669edcecc', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_82', 'Bibliografía señalada por CICDE', '**AMIR. Enfermería Psiquiátrica y Salud Mental. 2014.**

**Galiana Roch, J. Enfermería Psiquiátrica. Elsevier. 2016.**

**DSM-5. Manual Diagnóstico y Estadístico de los Trastornos Mentales. Referenciado por CICDE.**', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('28df03aa-92e3-5565-bb21-5a28bee5f3e4', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_83', 'Fuentes complementarias actuales', '**World Health Organization. Framework to implement a life course approach in practice. 2025.**

**World Health Organization. Mental health. Actualizado 8 de octubre de 2025.**

**World Health Organization. Promotion and prevention — mental and brain health across the life course.**

**World Health Organization. Guidance on mental health policy and strategic action plans. 2025.**', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7d938ed4-6b9b-5ec6-a9b7-9c7eaa54cbe9', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_84', 'Panamá', '**Ministerio de Salud de Panamá. Programa Salud Mental.**

**MINSA. Ley 364 de 2023 y Decreto Ejecutivo 61 de 2024, implementación reiterada en 2026 sobre derecho a salud mental y restricciones a certificados generales de salud mental.**

---', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ea996db2-208c-511c-a7b6-5a2ff525e697', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_85', '40. Control de calidad', 'Este paquete:

- cubre literalmente la promoción de salud mental en cada etapa del ciclo vital;
- utiliza enfoque de curso de vida OMS 2025;
- integra infancia, adolescencia, adultez y vejez;
- incorpora factores individuales, familiares, sociales y estructurales;
- incluye prevención de violencia y estigma;
- reconoce señales de alarma;
- incorpora contexto panameño;
- contiene 12 casos originales.

---', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('47342308-e3a1-559d-9f5e-c78fe359f868', 'ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'sec_86', '41. Estado para integración', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- vincular fuentes;
- revisar rutas específicas de salud mental infantil/perinatal si se incorporan algoritmos nacionales;
- enlazar con MENTAL-01, MENTAL-02, MENTAL-04, MENTAL-05 y MENTAL-10.', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7c9e6357-77d0-5086-91bc-782863a00aa4', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_1', 'Rol del profesional de enfermería en la promoción de la salud mental en la población', '**Área:** Enfermería en Salud y Enfermedad Mental  
**Código:** MENTAL-04  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('536d3dc0-323e-51ea-a901-ce5ea62104a7', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_2', '1. Alcance oficial CICDE', 'El lineamiento CICDE 2026 incluye expresamente:

**“Rol del profesional de enfermería en la promoción de la salud mental en la población”.**

Este módulo desarrolla el rol de enfermería en:

- promoción;
- prevención;
- educación;
- detección temprana;
- atención primaria;
- referencia;
- continuidad;
- reducción de estigma;
- derechos humanos;
- intervención comunitaria;
- participación familiar;
- crisis;
- salud mental en emergencias;
- coordinación intersectorial;
- vigilancia y documentación;
- autocuidado profesional.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7d40dc5e-ef4b-560c-81f6-ebe1c7ac7a58', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_3', '2. Objetivos de aprendizaje', 'Al finalizar el tema, el estudiante debe poder:

1. Explicar el papel de enfermería en promoción de salud mental poblacional.
2. Diferenciar promoción, prevención, detección y tratamiento.
3. Reconocer oportunidades de intervención en atención primaria.
4. Aplicar educación y comunicación terapéutica.
5. Detectar señales tempranas y riesgos.
6. Realizar referencia y seguimiento apropiados.
7. Promover derechos, dignidad y autonomía.
8. Reducir estigma.
9. Trabajar con familias y comunidades.
10. Participar en programas intersectoriales.
11. Reconocer responsabilidades ante crisis y conducta suicida.
12. Documentar objetivamente.
13. Promover continuidad de cuidados.
14. Reconocer la importancia del bienestar del propio personal de salud.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3a285a15-3f53-5d51-bacf-741aa9a492fa', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_4', '3. Salud mental como responsabilidad de todo el sistema', 'La promoción de salud mental no corresponde únicamente al hospital psiquiátrico.

Puede integrarse en:

- atención primaria;
- urgencias;
- medicina;
- cirugía;
- obstetricia;
- pediatría;
- salud pública;
- escuelas;
- comunidad;
- visitas domiciliarias;
- programas ocupacionales.', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aaf72b58-d3bd-573a-9f61-d78a15bef424', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_5', 'Clave', 'Toda enfermera puede contribuir a salud mental desde su ámbito de práctica.

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cc026ef8-d859-533e-b701-9f92a956cf0d', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_6', '4. Panamá — Programa de Salud Mental de MINSA', 'El Programa de Salud Mental depende de la Dirección General de Salud Pública.

Entre sus funciones declaradas están:

- impulsar acciones de promoción;
- protección y prevención;
- fortalecer atención primaria;
- disminuir carga de enfermedad mental y discapacidad;
- promover articulación intersectorial;
- sensibilizar equipos regionales;
- definir indicadores;
- integrar equipos de salud mental en APS.', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ff75354d-628b-5437-87e9-864d7ee181be', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_7', 'Relevancia CICDE', 'El rol de promoción es coherente con funciones nacionales del sistema de salud.

---', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b9a742ca-5afc-52e0-a829-74354b1b1ba6', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_8', '5. Norma Técnica Administrativa Nacional de Salud Mental', 'Panamá aprobó mediante **Resolución N.º 637 del 7 de octubre de 2022** la **Norma Técnica Administrativa Nacional de Salud Mental**.

Esta norma constituye una referencia nacional importante para organización y prestación de servicios.', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1646b585-8057-5e79-bd37-54d61e513bd8', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_9', 'Política de plataforma', 'Debe mantenerse como fuente `PANAMA_OFFICIAL`.

Antes de cargar protocolos operativos muy específicos se debe comprobar si ha sido modificada o sustituida por una norma posterior.

---', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('92bfc760-1e9a-54fc-92e7-c75a062760d4', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_10', '6. Enfoque actual de OMS', 'La OMS promueve servicios de salud mental:

- centrados en la persona;
- basados en derechos;
- orientados a recuperación;
- integrados a comunidad;
- con menor dependencia de instituciones;
- accesibles;
- conectados con servicios sociales.', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6c2a11b5-1df2-51f7-b730-ce0affc4b2d1', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_11', 'Enfermería', 'Debe promover:
- autonomía;
- decisiones informadas;
- dignidad;
- participación.

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0c2a1f9a-877f-5eed-9faf-c7993ced5fe1', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_12', '7. Promoción', 'La promoción busca fortalecer condiciones que favorecen bienestar.

Ejemplos:

- educación sobre sueño;
- manejo del estrés;
- vínculos;
- habilidades emocionales;
- actividad física;
- prevención de violencia;
- reducción de estigma;
- espacios de apoyo;
- participación comunitaria.

No requiere que la persona tenga un trastorno.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e6345291-a135-5f27-99c8-bfcc243ff262', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_13', '8. Prevención', 'Puede orientarse a:

- reducir exposición a factores de riesgo;
- detectar problemas tempranos;
- prevenir progresión;
- prevenir recaídas;
- prevenir discapacidad.

Ejemplos:
- prevención de suicidio;
- intervención ante violencia;
- detección de consumo de riesgo;
- apoyo a cuidadores.

---', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fa9718e5-d65a-5e25-a57d-fb6c5105bd6e', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_14', '9. Detección temprana', 'Enfermería puede reconocer:

- depresión;
- ansiedad;
- psicosis;
- consumo;
- deterioro cognitivo;
- violencia;
- autolesión;
- ideas suicidas;
- delirium.', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a992e5a7-45b3-5462-b636-1b4d12eb3a9b', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_15', 'Importante', 'Detectar no equivale a diagnosticar fuera del alcance profesional.

La enfermera:
- observa;
- pregunta;
- documenta;
- aplica instrumentos autorizados;
- refiere/escalona.

---', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4462eaa9-a2f0-5437-b78d-180f1850d885', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_16', '10. Tamizaje', 'Un instrumento de tamizaje:

- identifica riesgo o posibles síntomas;
- no sustituye evaluación diagnóstica.

Puede aplicarse en:
- atención primaria;
- prenatal;
- adulto mayor;
- enfermedades crónicas;
- urgencias;
- otros programas.', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('76e58593-3749-5814-bcb8-b1ba60d90c5b', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_17', 'Clave', '“Tamizaje positivo” ≠ diagnóstico definitivo.

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('687c53b0-9856-516e-baad-d7146286edc6', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_18', '11. Relación terapéutica', 'El profesional debe establecer:

- confianza;
- respeto;
- límites;
- escucha;
- claridad;
- confidencialidad.

La calidad de la relación puede influir en:
- adherencia;
- detección de riesgo;
- continuidad;
- recuperación.

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d3817356-e978-5106-837a-38f96253aff7', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_19', '12. Psicoeducación', 'Puede incluir:

- síntomas;
- factores de riesgo;
- señales de recaída;
- medicamentos;
- sueño;
- sustancias;
- estrategias de afrontamiento;
- cuándo consultar;
- recursos disponibles.', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c3fedd05-a01d-59f2-8834-bd3643d2ec02', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_20', 'Método', 'Adaptar:
- lenguaje;
- cultura;
- alfabetización;
- audición/visión;
- capacidad cognitiva.

Usar teach-back cuando sea útil.

---', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c7e5ccff-0cf0-59b6-bfed-856ac1d6fed9', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_21', '13. Reducción de estigma', 'Enfermería puede:

- usar lenguaje centrado en la persona;
- corregir mitos;
- evitar etiquetas;
- defender privacidad;
- promover inclusión;
- facilitar acceso sin discriminación.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1a63498a-d03d-5a99-992a-32b47f586b82', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_22', 'Ejemplo', 'No asumir que toda persona con trastorno mental es peligrosa.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('022777f4-d6d2-5a53-8558-b6a266b342c8', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_23', '14. Derechos humanos', 'Panamá reconoce la salud mental como derecho humano mediante su marco nacional, incluido el desarrollo asociado con **Ley 364 de 2023** y su reglamentación.

En 2026 MINSA reiteró que certificados de salud mental no pueden exigirse como requisito general de empleo o educación, salvo excepciones de alto riesgo reguladas.', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4b01a582-4afb-58f9-95d0-7600396f98d9', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_24', 'Rol de enfermería', '- no discriminar;
- informar derechos;
- proteger privacidad;
- evitar coerción innecesaria;
- documentar adecuadamente.

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ef728a9a-12f2-5903-8e81-7f4f153c7ea9', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_25', '15. Autonomía y consentimiento', 'La persona debe participar en decisiones siempre que sea posible.

Enfermería debe:

- explicar;
- verificar comprensión;
- respetar elecciones;
- reconocer capacidad de decisión;
- activar procesos legales/éticos cuando exista incapacidad o emergencia.', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('059c3057-6961-52ff-9893-16f10516f6b0', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_26', 'Clave', 'Diagnóstico psiquiátrico no significa automáticamente incapacidad para decidir.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('388a2bf5-ca57-5a9f-8134-61cde28d427c', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_27', '16. Familia y red de apoyo', 'La familia puede ser:

- recurso;
- cuidadora;
- fuente de información;
- o, en algunos casos, fuente de conflicto o violencia.

No asumir que incluir familia siempre es seguro.', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('28678e10-dd1e-549d-8e2f-007bc1df53b4', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_28', 'Intervención', '- obtener consentimiento cuando corresponda;
- respetar confidencialidad;
- valorar seguridad;
- enseñar señales de alarma;
- evitar sobrecarga del cuidador.

---', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d5420b0b-183f-566f-ba0b-f2640807cb6f', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_29', '17. Comunidad', 'Intervenciones comunitarias:

- educación;
- grupos;
- visitas;
- detección;
- campañas;
- referencia;
- redes de apoyo;
- coordinación con líderes y organizaciones.', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4311666d-b44c-539c-aea7-a39b20164b3c', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_30', 'Principio', 'La promoción debe adaptarse a necesidades reales de la comunidad y evitar intervenciones estigmatizantes.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1268b850-d02d-53f7-a281-4e0a407d3ba4', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_31', '18. Atención primaria', 'La APS permite:

- detección temprana;
- seguimiento;
- continuidad;
- manejo de condiciones comunes;
- referencia;
- integración con salud física.

OMS impulsa integración de salud mental en sistemas comunitarios y de atención general.

---', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8e565b17-54ea-549a-bfc2-51f3c25ca5c3', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_32', '19. Continuidad de cuidados', 'Después de una crisis u hospitalización:

- verificar plan;
- medicamentos;
- citas;
- red de apoyo;
- transporte;
- señales de alarma;
- acceso a servicios;
- seguridad.', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('13250c0e-6389-5a3f-b067-76b4a4d2eae7', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_33', 'Riesgo', 'Las transiciones asistenciales son momentos vulnerables.

---', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d5460235-4246-508c-b4b7-efd6e161a26a', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_34', '20. Coordinación interdisciplinaria', 'Puede incluir:

- medicina;
- psiquiatría;
- psicología;
- trabajo social;
- terapia ocupacional;
- farmacia;
- enfermería;
- servicios comunitarios.', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3df9fa6e-19ed-57a0-bf10-7a1d217a7656', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_35', 'Enfermería', 'Aporta:
- observación continua;
- respuesta a tratamiento;
- función;
- educación;
- riesgos;
- preferencias del paciente.

---', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f9084bd5-81fa-521d-9890-e559db0428b4', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_36', '21. Coordinación intersectorial', 'La salud mental también involucra:

- educación;
- trabajo;
- vivienda;
- justicia;
- seguridad;
- desarrollo social;
- protección civil;
- medios de comunicación.

La OMS 2025 destaca determinantes sociales/estructurales dentro de políticas de salud mental.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('09e3a89c-3b41-549e-8665-22bfbda779f6', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_37', '22. Crisis de salud mental', 'La prioridad es:

- seguridad;
- evaluación médica;
- de-escalamiento;
- riesgo de violencia/autolesión;
- causas orgánicas;
- reducción de estímulos;
- apoyo.', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e1a7bb97-808c-5c65-ac0d-93524b708d41', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_38', 'No asumir', 'Agitación = enfermedad psiquiátrica.

Descartar:
- hipoxia;
- hipoglucemia;
- delirium;
- intoxicación;
- abstinencia;
- infección;
- trauma;
- alteraciones metabólicas.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d0966d54-81dc-5d66-80f6-12bdfc90c037', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_39', '23. Conducta suicida', 'El rol de enfermería incluye:

- preguntar directamente;
- valorar plan/intención/medios;
- no dejar sola a persona con riesgo inminente;
- retirar medios cuando sea seguro;
- activar evaluación;
- documentar;
- planificar seguimiento.', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9e2450b0-aad5-56f3-bfe8-f425490ef3c7', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_40', 'Panamá 2026', 'La Resolución N.º 099 de 11 de febrero de 2026 aprobó la **Norma del Sistema de Vigilancia de la Conducta de Riesgo Suicida**.

---', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3da3e5d0-c824-590f-8c54-e6a75f119996', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_41', '24. Vigilancia de conducta suicida', 'La norma panameña 2026 fortalece la vigilancia de:

- lesiones autoinfligidas;
- intentos;
- suicidio consumado.', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f375ebf6-78e4-57f0-bc2b-6386f18e1edc', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_42', 'Enfermería', 'Debe cumplir:
- registros;
- notificación;
- confidencialidad;
- rutas institucionales.

Las obligaciones exactas dependen del establecimiento y sistema de vigilancia.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8febcb87-a5fc-582a-b50a-f77f2bdd4a56', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_43', '25. Salud mental en emergencias y desastres', 'En 2026 Panamá instaló la **Comisión Técnica Intersectorial de Salud Mental y Apoyo Psicosocial en Emergencias y Desastres (CTI-SMAPS)**.

Se trabaja en un **Plan Estratégico SMAPS 2026–2030**.', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('07cab8d6-e4ac-57f2-859b-5b8f772fe4fe', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_44', 'Nota de gobernanza', 'A mayo de 2026 MINSA lo describía como **en construcción**.

Por tanto:
- no debe presentarse como plan final aprobado hasta comprobar publicación formal.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('71674290-6bd6-5376-a125-8c736e1b21be', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_45', '26. Rol en emergencias', 'Enfermería puede:

- primeros auxilios psicológicos dentro de entrenamiento;
- identificar necesidades urgentes;
- apoyar orientación;
- facilitar reunificación;
- detectar riesgo;
- referir;
- proteger continuidad de medicamentos;
- apoyar poblaciones vulnerables.', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7ee81fc5-4785-5a57-aa6c-b741297e8a92', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_46', 'Evitar', 'Forzar a una persona a relatar detalles traumáticos inmediatamente como requisito para “procesar” la experiencia.

---', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a57c0536-edb0-5090-8c2d-14fc86d23b11', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_47', '27. Visita domiciliaria', 'Puede permitir valorar:

- entorno;
- adherencia;
- apoyo;
- vivienda;
- funcionamiento;
- riesgos;
- acceso a alimentos/medicación;
- seguridad.

Debe realizarse con:
- consentimiento;
- privacidad;
- protocolos de seguridad.

---', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c13fdfae-4637-5e55-86ed-7278e7a7d353', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_48', '28. Educación poblacional', 'Mensajes efectivos deben:

- ser claros;
- evitar alarmismo;
- indicar señales de ayuda;
- ofrecer recursos;
- evitar culpabilización;
- combatir mitos.', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2f231b1f-3311-5bd9-992a-c261f7239850', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_49', 'Suicidio', 'La comunicación pública debe evitar glorificar, romantizar o describir métodos de forma innecesaria.

---', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f0a4d4a3-c20c-56c1-b375-3a299138b274', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_50', '29. Sustancias', 'El profesional puede:

- detectar consumo;
- realizar intervención breve según entrenamiento;
- prevenir interacciones/riesgos;
- referir;
- reducir estigma;
- apoyar tratamiento.', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('47904e6f-d3c5-5c51-9901-7f7596d2ead8', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_51', 'Seguridad', 'No interpretar síntomas psiquiátricos sin considerar:
- intoxicación;
- abstinencia;
- medicamentos.

---', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a1520867-18a0-5596-a1c4-f2229c221384', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_52', '30. Violencia', 'Rol de enfermería:

- preguntar en privacidad;
- valorar seguridad;
- atender lesiones;
- documentar objetivamente;
- activar rutas;
- preservar evidencia cuando corresponda;
- no culpabilizar.

La seguridad de la víctima tiene prioridad.

---', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6ce9c3d2-2221-59c7-9353-7c89196ec3f6', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_53', '31. Personas con enfermedad física', 'En servicios generales, enfermería debe reconocer que personas con:

- cáncer;
- enfermedad renal;
- diabetes;
- dolor crónico;
- discapacidad;
- enfermedad cardiovascular;

pueden tener necesidades de salud mental.', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d0081888-279a-5a52-a556-14f47dab5446', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_54', 'Integración', 'No separar artificialmente “mente” y “cuerpo”.

---', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('59ebd022-3ca5-5c91-b5bf-e0fcd0e8b126', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_55', '32. Adulto mayor', 'Rol:

- detectar depresión;
- diferenciar delirium/deterioro;
- valorar aislamiento;
- promover función;
- revisar medicamentos;
- detectar maltrato;
- apoyar cuidadores.

No normalizar sufrimiento mental por edad.

---', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c3231a66-fb0f-5ad2-be0b-20219e342878', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_56', '33. Niñez/adolescencia', 'Rol:

- entorno seguro;
- desarrollo;
- conducta;
- escuela;
- familia;
- violencia;
- sustancias;
- autolesión;
- referencia.

Mantener protección infantil y confidencialidad conforme a legislación.

---', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8f0bdd36-d53b-5f9b-8557-371474240de3', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_57', '34. Indicadores y calidad', 'MINSA señala que el Programa de Salud Mental debe:

- definir indicadores;
- integrar información;
- monitorear acciones.

Enfermería contribuye mediante:
- registro completo;
- seguimiento;
- notificación;
- evaluación de resultados.', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9850e21c-6390-5d76-a2e4-fd01f5abbf5a', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_58', 'Clave', 'Lo que no se documenta adecuadamente dificulta continuidad y vigilancia.

---', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a14e6d7b-8995-5b9d-b946-b52b0b6ca476', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_59', '35. Documentación', 'Registrar:

- observaciones objetivas;
- palabras relevantes;
- riesgos;
- intervención;
- respuesta;
- derivaciones;
- educación;
- seguimiento.

Evitar etiquetas.

---', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('939951c8-70ed-51c7-bd05-903dc8674c11', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_60', '36. Confidencialidad', 'Proteger información.

Compartir únicamente:
- con quienes necesitan conocerla para atención;
- cuando exista obligación legal;
- ante circunstancias de seguridad previstas por normativa.

No utilizar casos clínicos identificables en redes sociales.

---', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('632e1099-c130-5e2f-8c35-972f0ebfe18a', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_61', '37. Abogacía/defensa del paciente', 'El profesional puede:

- identificar barreras;
- facilitar acceso;
- cuestionar prácticas discriminatorias;
- promover atención digna;
- comunicar preferencias del paciente;
- proteger seguridad.

---', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e9a18740-97ff-5e25-9d91-0db4746db628', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_62', '38. Autocuidado del profesional', 'La atención en salud mental puede producir:

- estrés;
- fatiga;
- burnout;
- trauma vicario.

Medidas:
- supervisión;
- pausas;
- apoyo del equipo;
- límites;
- descanso;
- acceso a ayuda profesional;
- cultura de seguridad.', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6d73206b-529a-57a7-8f3b-7f5e9d8ae448', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_63', 'Importante', '“Resiliencia personal” no debe utilizarse para ocultar problemas organizacionales como sobrecarga crónica.

---', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('84c35a48-b8b7-5d76-96dc-1c06c53cddf6', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_64', '39. PAE poblacional/comunitario', '', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5cda2dee-6bfc-5bad-be42-85822cd9cc76', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_65', 'Valoración', '- necesidades;
- riesgos;
- recursos;
- acceso;
- barreras;
- estigma;
- determinantes;
- indicadores.', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cf03f4ff-006c-5e99-8aec-f34db4d88bf3', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_66', 'Diagnóstico/juicio', '- problemas prioritarios;
- grupos vulnerables;
- brechas de acceso.', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eafeaa25-0fe6-55b8-b9d3-c45c352dcf18', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_67', 'Planificación', '- metas medibles;
- intervención apropiada;
- actores;
- recursos.', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('73901372-ccff-520a-9be8-9e404b317b9f', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_68', 'Implementación', '- educación;
- tamizaje;
- promoción;
- coordinación;
- referencia.', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('28e2c922-d318-53d8-93c1-31f4257a1d47', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_69', 'Evaluación', '- cobertura;
- participación;
- acceso;
- resultados;
- seguridad;
- continuidad.

---', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('65285ca7-282b-590a-bcaa-0fe699934ac2', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_70', '40. Situaciones tipo examen', '', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5e7ea57e-1a57-5c2d-8b9a-e93d47f39d71', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_71', 'Caso 1', 'Paciente con diabetes expresa desesperanza durante control general.

**Rol:** valorar salud mental y riesgo; no ignorar por estar en consulta “física”.', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('becebff6-7bdc-5e9b-8653-d60b1c8ba823', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_72', 'Caso 2', 'Tamizaje de depresión positivo.

**Interpretación:** requiere evaluación; no equivale por sí solo a diagnóstico.', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('334744a6-a13d-5366-98fa-29d36eb98d94', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_73', 'Caso 3', 'Enfermera afirma que “las personas psiquiátricas no pueden decidir”.

**Error:** diagnóstico no implica automáticamente incapacidad.', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e8bf311d-2f88-5bab-94a2-9bbb1ea09347', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_74', 'Caso 4', 'Familia exige información sin consentimiento y no existe emergencia.

**Conducta:** proteger confidencialidad conforme a normas.', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f67e3620-84a8-5a54-a4b1-e932f7bd9e2d', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_75', 'Caso 5', 'Paciente se agita súbitamente con fiebre.

**Prioridad:** considerar causa orgánica/delirium, no asumir trastorno psiquiátrico.', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4d09387b-3526-591f-b01c-ccc4225216e0', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_76', 'Caso 6', 'Paciente dice que planea suicidarse hoy.

**Prioridad:** seguridad inmediata, no dejar solo y activar evaluación.', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7711d279-d63c-58bb-b5d6-c16af3c5adb5', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_77', 'Caso 7', 'Comunidad presenta alta violencia y ansiedad.

**Rol:** intervención no solo individual; articular salud, comunidad y sectores pertinentes.', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0cea909f-05c6-5f83-88d9-188be0acad6a', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_78', 'Caso 8', 'Paciente es dado de alta después de crisis sin cita ni plan.

**Problema:** falla de continuidad.', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c9f5df9a-9ca4-5dad-857b-ad83fb2fbcf3', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_79', 'Caso 9', 'Campaña pública llama “locos” a personas para generar impacto.

**Problema:** estigmatización y posible barrera para buscar ayuda.', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0114421c-c943-5fc3-acf1-66c4344a38f5', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_80', 'Caso 10', 'Adulto mayor con tristeza profunda es descartado porque “es normal a su edad”.

**Error:** requiere valoración.', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7f55e41b-54bd-5e48-9604-8f96f5790c42', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_81', 'Caso 11', 'Tras desastre se obliga a sobrevivientes a describir inmediatamente todos los detalles traumáticos.

**Problema:** no es una intervención universal recomendada; priorizar seguridad y apoyo.', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c6c97d5f-8890-5d10-8854-b7c240a58431', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_82', 'Caso 12', 'Enfermera presenta agotamiento severo por carga excesiva.

**Intervención:** apoyo individual y medidas organizacionales; no reducirlo a “debe ser más resiliente”.

---', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4a9c08e8-71d5-567f-9f90-29691ecc3409', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_83', '41. Errores frecuentes', '1. Creer que salud mental solo corresponde a psiquiatría.
2. Confundir tamizaje con diagnóstico.
3. Estigmatizar.
4. Asumir incapacidad por diagnóstico.
5. Romper confidencialidad.
6. No descartar causas orgánicas de agitación.
7. Ignorar salud mental en enfermedad física.
8. No organizar continuidad.
9. Excluir determinantes sociales.
10. Reducir promoción a charlas.
11. Ignorar documentación/vigilancia.
12. Culpar al profesional por burnout estructural.

---', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1ec4ae25-40ce-59d6-9438-a6bf27a252cd', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_84', '42. Qué memorizar', '**Enfermería promueve salud mental en TODOS los niveles de atención.**

**Promoción ≠ tratamiento.**

**Tamizaje positivo ≠ diagnóstico.**

**Salud mental actual = persona + derechos + recuperación + comunidad.**

**Agitación aguda → descartar causa médica.**

**Riesgo suicida → seguridad + evaluación directa + continuidad.**

**Panamá: Resolución 637/2022 = Norma Técnica Administrativa Nacional de Salud Mental.**

**Panamá: Resolución 099/2026 = vigilancia de conducta de riesgo suicida.**

**Programa Salud Mental MINSA incluye promoción, prevención, APS e intersectorialidad.**

**Plan SMAPS 2026–2030 estaba en construcción en mayo de 2026: no presentarlo como final sin verificar.**

---', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('38ecdc64-aa5d-5f52-8bf8-727679fd38d3', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_85', '43. Fuentes y validación', '', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aae59e9e-dfaa-5529-b759-ed53c0391817', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_86', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('81fdc7ad-cd7e-5bd8-a159-da9242f71614', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_87', 'Bibliografía señalada por CICDE', '**AMIR. Enfermería Psiquiátrica y Salud Mental. 2014.**

**Galiana Roch, J. Enfermería Psiquiátrica. Elsevier. 2016.**

**DSM-5. Manual Diagnóstico y Estadístico de los Trastornos Mentales. Referenciado por CICDE.**', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('780de7ba-bc11-5879-9691-b4900afbba25', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_88', 'Fuentes complementarias', '**World Health Organization. Guidance on community mental health services: promoting person-centred and rights-based approaches. 2021.**

**World Health Organization. Guidance on mental health policy and strategic action plans. 2025.**

**World Health Organization. Framework to implement a life course approach in practice. 2025.**', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d145df44-2f45-5653-9564-8dcd29a9d717', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_89', 'Panamá', '**Ministerio de Salud de Panamá. Programa Salud Mental.**

**MINSA. Resolución N.º 637 de 7 de octubre de 2022 — Norma Técnica Administrativa Nacional de Salud Mental.**

**República de Panamá. Ley 364 de 6 de febrero de 2023 y Decreto Ejecutivo 61 de 27 de junio de 2024.**

**MINSA. Resolución N.º 099 de 11 de febrero de 2026 — Norma del Sistema de Vigilancia de la Conducta de Riesgo Suicida.**

**MINSA. Comisión Técnica Intersectorial de Salud Mental y Apoyo Psicosocial en Emergencias y Desastres, 2026.**

**MINSA. Avances en la construcción del Plan Estratégico SMAPS 2026–2030, 30 de mayo de 2026.**

---', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e123a997-abd7-5a61-b8db-80f79b987813', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_90', '44. Control de calidad', 'Este paquete:

- cubre el rol de enfermería en promoción poblacional;
- integra APS, comunidad y continuidad;
- incorpora derechos humanos;
- diferencia detección de diagnóstico;
- incluye prevención, crisis y suicidio;
- incorpora normativa panameña;
- identifica correctamente SMAPS 2026–2030 como plan aún en construcción en la fuente consultada;
- contiene 12 casos originales.

---', 90)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9adf2a6c-29e9-5a7b-8299-45eacb018a7f', '4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'sec_91', '45. Estado para integración', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- vincular fuentes nacionales;
- comprobar si la Norma 637/2022 fue formalmente sustituida;
- comprobar publicación final del Plan SMAPS 2026–2030 antes de tratarlo como normativa vigente;
- enlazar con MENTAL-03, MENTAL-05, MENTAL-07 y MENTAL-10.', 91)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('71b3e7f7-438e-57a6-8454-307c3c66ab92', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_1', 'Manejo de factores de riesgo: estrés, ansiedad, conflicto, frustración y mecanismos de defensa', '**Área:** Enfermería en Salud y Enfermedad Mental  
**Código:** MENTAL-05  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('72daa59f-d403-5434-9e2b-2ede47e474e0', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_2', '1. Alcance oficial CICDE', 'El lineamiento CICDE 2026 incluye expresamente:

**“Manejo de factores de riesgo: stress, ansiedad, conflicto, frustración, mecanismo de defensa”.**', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('412a1c21-7524-53f7-9bf8-0380958624ec', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_3', 'Nota terminológica', 'El documento oficial utiliza la palabra inglesa **“stress”**. En el contenido académico se utiliza el término español **estrés**, manteniendo la formulación original en la trazabilidad.

Este módulo desarrolla:

- estrés y estresores;
- respuesta fisiológica y psicológica;
- afrontamiento;
- ansiedad normal y trastornos de ansiedad;
- niveles de ansiedad;
- conflicto;
- frustración;
- mecanismos de defensa;
- afrontamiento adaptativo y maladaptativo;
- crisis;
- prioridades de enfermería;
- señales de alarma;
- PAE.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0a246a9e-3a45-5f04-8514-8f40f614b644', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_4', '2. Objetivos de aprendizaje', 'Al finalizar el tema, el estudiante debe poder:

1. Diferenciar estrés, estresor, ansiedad, conflicto y frustración.
2. Reconocer respuestas físicas, cognitivas, emocionales y conductuales al estrés.
3. Identificar factores personales y ambientales que modifican la respuesta al estrés.
4. Diferenciar ansiedad esperable de un trastorno de ansiedad.
5. Reconocer niveles clínicos de ansiedad y adaptar la comunicación.
6. Identificar respuestas adaptativas y maladaptativas de afrontamiento.
7. Explicar los mecanismos de defensa más frecuentes.
8. Diferenciar mecanismos de defensa de estrategias conscientes de afrontamiento.
9. Reconocer signos de escalamiento a crisis.
10. Identificar cuándo existe riesgo de autolesión, violencia o deterioro médico.
11. Aplicar estrategias básicas de manejo de estrés.
12. Integrar el PAE.

---', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e567fbf5-24f3-5905-890b-ec96c1a6989e', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_5', '3. Estrés', 'El estrés es una respuesta del organismo y de la persona ante demandas internas o externas que requieren adaptación.

Puede involucrar:

- sistema nervioso autónomo;
- eje hipotálamo-hipófisis-suprarrenal;
- emociones;
- pensamientos;
- conducta;
- relaciones;
- funcionamiento.', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f38925f7-de69-508a-b428-3f065b9a4bac', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_6', 'Clave', 'El estrés no es automáticamente una enfermedad.

La respuesta puede ser:
- transitoria;
- adaptativa;
- o volverse perjudicial cuando es intensa, prolongada o excede los recursos de afrontamiento.

---', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cdb12c17-f18c-5e63-95e7-2946ff719096', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_7', '4. Estresor', 'Un **estresor** es una demanda, situación o estímulo que puede activar una respuesta de estrés.

Puede ser:

- físico;
- psicológico;
- social;
- ambiental;
- económico;
- laboral;
- familiar;
- relacionado con enfermedad.

Ejemplos:
- dolor;
- hospitalización;
- pérdida;
- desempleo;
- conflicto;
- sobrecarga;
- diagnóstico nuevo;
- violencia.

---', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('09b51da8-5b6b-5ffd-8586-e107291073cd', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_8', '5. Respuesta al estrés', 'Puede manifestarse en varias dimensiones.', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5d7bf170-7059-5b97-bb71-6f6a66d30592', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_9', 'Física', '- taquicardia;
- tensión muscular;
- sudoración;
- cefalea;
- molestias gastrointestinales;
- fatiga;
- alteraciones del sueño.', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2afdac50-f40a-59b1-ad60-56533fbe87d5', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_10', 'Cognitiva', '- preocupación;
- dificultad de concentración;
- pensamiento repetitivo;
- indecisión.', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a4b97ebd-846f-508d-9379-50cc2f0870d2', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_11', 'Emocional', '- irritabilidad;
- miedo;
- tristeza;
- frustración;
- sensación de sobrecarga.', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c528a77b-433b-5df1-bd6b-dfba4eaac51f', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_12', 'Conductual', '- aislamiento;
- cambios en alimentación;
- consumo de sustancias;
- irritabilidad;
- disminución del autocuidado.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('819aa81c-b57b-597d-8015-b46d28620e5b', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_13', '6. Estrés agudo y crónico', '', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('766afed3-00cb-5d1f-bcd7-ffd5b1e7c4d1', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_14', 'Agudo', 'Respuesta de duración limitada ante un evento inmediato.

Puede facilitar:
- alerta;
- rapidez de respuesta;
- movilización de recursos.', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aa08aaab-876b-5854-9079-2ff37cb37e09', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_15', 'Crónico', 'Exposición persistente o repetida a demandas.

Puede relacionarse con:
- alteración del sueño;
- ansiedad;
- depresión;
- agotamiento;
- enfermedad física;
- deterioro funcional.', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5b47989b-5cc4-5449-884f-0aa7923be092', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_16', 'Enfermería', 'No basta con enseñar respiración si el problema principal es, por ejemplo, violencia, pobreza o sobrecarga laboral persistente.

También deben abordarse los determinantes y recursos disponibles.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('73a3fd2b-0bee-5df9-bef4-b9eaa11a3c6c', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_17', '7. Valoración del estrés', 'Explorar:

- qué está ocurriendo;
- duración;
- intensidad;
- percepción de control;
- recursos;
- apoyo;
- sueño;
- alimentación;
- actividad;
- sustancias;
- funcionamiento;
- estrategias utilizadas;
- seguridad.

Preguntas útiles:

- “¿Qué situación le está resultando más difícil?”
- “¿Qué suele hacer cuando se siente así?”
- “¿Qué le ha ayudado anteriormente?”
- “¿Quién puede apoyarle?”

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c9a9f07c-bf01-590b-97ea-81618c4f6951', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_18', '8. Afrontamiento', 'El afrontamiento comprende esfuerzos cognitivos y conductuales utilizados para manejar demandas internas o externas.

Puede ser:', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8ea94c8d-76fe-578e-8659-ce618696122d', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_19', 'Centrado en el problema', 'Busca modificar la situación.

Ejemplos:
- planificar;
- pedir ayuda;
- resolver pasos concretos.', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6c746989-cf07-5bd1-911d-399972ff8818', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_20', 'Centrado en la emoción', 'Busca regular la respuesta emocional.

Ejemplos:
- respiración;
- relajación;
- actividad física;
- apoyo social;
- mindfulness.

Ambos pueden ser útiles según el problema.

---', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fca72457-8bdc-5c74-b381-47f16f64158c', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_21', '9. Afrontamiento adaptativo', 'Ejemplos:

- pedir ayuda;
- resolver problemas;
- descanso;
- ejercicio;
- expresión emocional;
- apoyo social;
- planificación;
- técnicas de relajación;
- actividades significativas;
- búsqueda de tratamiento.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('18dfe642-3c54-5a82-ba6f-ae69324ab6ea', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_22', 'Importante', 'La utilidad depende del contexto.

No todas las estrategias funcionan igual para todas las personas.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('481c5213-b93d-5986-b437-b78fa9eb4124', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_23', '10. Afrontamiento maladaptativo', 'Puede incluir:

- abuso de alcohol u otras sustancias;
- evitación extrema;
- agresión;
- autolesión;
- aislamiento persistente;
- abandono del tratamiento;
- conductas de riesgo.', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6cae1c4e-7d8c-5925-b242-aa752cd0d0a1', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_24', 'Enfermería', 'No juzgar.

Explorar:
- función de la conducta;
- consecuencias;
- alternativas;
- motivación;
- seguridad.

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4682bdf1-161e-5db8-b7da-243f4b707bd6', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_25', '11. Manejo práctico del estrés', 'La OMS propone habilidades sencillas de manejo del estrés en su guía **Doing What Matters in Times of Stress / En tiempos de estrés, haz lo que importa**.

Principios aplicables:

- conectar con el presente;
- observar pensamientos y emociones;
- actuar de acuerdo con valores;
- hacer espacio a emociones difíciles;
- tratarse con amabilidad;
- buscar apoyo;
- resolver problemas de forma gradual.', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9f727304-e644-5fec-beb5-dacdef231404', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_26', 'Clave', 'Las técnicas de autoayuda complementan, pero no sustituyen atención profesional cuando existe deterioro significativo o riesgo.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3186e6f1-b160-5611-8b57-cd9bc012e437', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_27', '12. Ansiedad', 'La ansiedad es una experiencia humana caracterizada por preocupación, temor o sensación de amenaza.

Puede ser una respuesta normal y transitoria.', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ca10d4fe-0f12-5294-b64b-f9a52019153d', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_28', 'Trastorno de ansiedad', 'La OMS 2025 destaca que los trastornos de ansiedad implican miedo/preocupación intensos o excesivos, difíciles de controlar, persistentes y capaces de producir malestar o deterioro funcional.', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5dd8ff03-f8ee-5288-b0da-df3a129d706e', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_29', 'Clave', 'Sentir ansiedad no equivale automáticamente a tener un trastorno de ansiedad.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5fe0c4d9-9bf7-574a-9603-f70376c85ec4', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_30', '13. Manifestaciones de ansiedad', '', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('516c184a-4e9c-55c3-a394-7b8b4af7adcc', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_31', 'Físicas', '- palpitaciones;
- temblor;
- sudoración;
- tensión;
- náuseas;
- disnea subjetiva;
- mareo;
- alteración del sueño.', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('698c6f70-a46f-5b74-92a4-2a48de480807', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_32', 'Cognitivas', '- preocupación;
- dificultad de concentración;
- pensamientos catastróficos;
- dificultad para decidir.', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('81ae5cce-a735-5db5-bd85-81f3fbd0038a', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_33', 'Conductuales', '- evitación;
- inquietud;
- búsqueda constante de seguridad;
- escape.

---', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5165f34e-bae8-5b0a-bd55-964aa3f70c35', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_34', '14. Niveles de ansiedad — enfoque de enfermería', 'En enseñanza clásica de enfermería psiquiátrica se suelen utilizar:', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('23cb9d88-28b8-53bd-bd1b-49216506f1a8', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_35', 'Leve', '- mayor alerta;
- capacidad de aprender conservada.

**Enfermería:** educación, resolución de problemas, prevención.', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f1ae9d48-025e-51a4-b1e7-daeb2df356f8', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_36', 'Moderada', '- campo perceptivo más estrecho;
- dificultad para concentrarse.

**Enfermería:** mensajes breves, focalizar, reducir estímulos.', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a37ad387-f16a-548c-8403-9d41526339eb', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_37', 'Severa', '- gran reducción de la capacidad de procesar información;
- síntomas físicos intensos.

**Enfermería:** permanecer con la persona, instrucciones simples, seguridad.', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ea558086-8859-5b9d-ab8d-0fecccb628c3', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_38', 'Pánico', '- desorganización intensa;
- dificultad para procesar la realidad;
- posible conducta impulsiva.

**Enfermería:** seguridad, ambiente de bajo estímulo, comunicación muy breve, evaluación clínica.', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a0dceabd-3714-59b6-aea1-9876411a8f4d', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_39', 'Importante', 'Estos niveles son una herramienta clínica de enfermería, no sustituyen criterios diagnósticos formales.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2c578c8f-4b3f-5078-8619-01b76d11dda3', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_40', '15. Ataque de pánico', 'Puede incluir:

- temor intenso;
- palpitaciones;
- disnea;
- dolor torácico;
- temblor;
- mareo;
- sensación de muerte;
- desrealización.', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7b0dac74-f4e6-5323-9092-df34db8b251f', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_41', 'Seguridad', 'Antes de atribuir síntomas a pánico, considerar causas médicas cuando el cuadro sea:
- nuevo;
- atípico;
- severo;
- acompañado de signos de alarma.

Ejemplos a descartar según contexto:
- síndrome coronario;
- arritmia;
- hipoglucemia;
- hipoxia;
- embolia pulmonar;
- intoxicación.

---', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('931aeef0-3ecc-5666-9a83-16eac7ac9fce', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_42', '16. Trastornos de ansiedad', 'La OMS reconoce, entre otros:

- ansiedad generalizada;
- trastorno de pánico;
- ansiedad social;
- agorafobia;
- ansiedad por separación;
- fobias específicas.

El diagnóstico corresponde a evaluación clínica profesional.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f2ce076a-4c4c-57a1-b6b3-5d1b5c55f869', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_43', '17. Tratamiento de trastornos de ansiedad — principios', 'La OMS 2025 señala que existen tratamientos eficaces.

Pueden incluir:

- intervenciones psicológicas;
- terapia cognitivo-conductual;
- exposición cuando corresponde;
- manejo del estrés;
- medicamentos en pacientes seleccionados.', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0a5ac844-d7b6-5e93-9def-1f30c1a556b8', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_44', 'Benzodiazepinas', 'La OMS señala que, aunque históricamente utilizadas, generalmente no se recomiendan como tratamiento rutinario prolongado de trastornos de ansiedad debido a dependencia y limitada eficacia a largo plazo.', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b2233a6f-bbb5-512b-9e27-ce0e19a607fe', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_45', 'Enfermería', '- adherencia;
- efectos adversos;
- sedación;
- caídas;
- dependencia;
- interacción con alcohol/opioides;
- no suspensión brusca cuando existe dependencia física.

---', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6123721a-d97f-59ed-a9b6-22ef9a342dc0', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_46', '18. Conflicto', 'Existe conflicto cuando una persona percibe demandas, necesidades, metas o valores incompatibles.

Puede ser:

- intrapersonal;
- interpersonal;
- familiar;
- laboral;
- ético;
- comunitario.', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8da0d432-98d4-555d-bec3-af9e64f576cb', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_47', 'Respuesta', 'El conflicto puede aumentar:
- estrés;
- ansiedad;
- frustración;
- impulsividad.

No todo conflicto es patológico.

---', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cd5326cd-24ca-53ea-b4f3-e69004d0f48a', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_48', '19. Tipos clásicos de conflicto motivacional', '', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ac63289b-b888-55ef-aaa5-fcde49cada56', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_49', 'Aproximación-aproximación', 'Elegir entre dos opciones deseables.', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4bf09c35-234e-54b8-b189-6837a11b70a7', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_50', 'Evitación-evitación', 'Elegir entre dos opciones no deseadas.', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8699f9e4-60b0-5bfd-89cc-9ea3ec3ccd33', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_51', 'Aproximación-evitación', 'Una misma opción tiene aspectos positivos y negativos.', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c40ab533-5272-5b8d-8a17-78e8219c6daf', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_52', 'Doble aproximación-evitación', 'Varias alternativas poseen simultáneamente ventajas y desventajas.', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f575b38e-5599-59c8-8c1e-4b1a25259934', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_53', 'Enfermería', 'Ayudar a:
- clarificar opciones;
- identificar valores;
- anticipar consecuencias;
- favorecer decisión autónoma.

---', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c6ad4a0e-ae7e-5cc6-82fe-c20350edd9d4', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_54', '20. Frustración', 'La frustración aparece cuando una meta, necesidad o expectativa se ve bloqueada.

Puede producir:

- irritabilidad;
- tristeza;
- enojo;
- ansiedad;
- pérdida de motivación;
- agresividad;
- evitación.', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9fee41e7-865b-5a27-a49e-df405440ac8c', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_55', 'Clave', 'La frustración es una experiencia, no un diagnóstico.

---', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cba0c533-3a57-543b-8a13-58b5db71cf36', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_56', '21. Tolerancia a la frustración', 'Puede fortalecerse mediante:

- metas realistas;
- resolución de problemas;
- flexibilidad;
- apoyo;
- regulación emocional;
- aprendizaje de experiencias;
- tolerancia a demora;
- autocuidado.', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('84aafe44-4dc5-5ab0-b3f8-b3ff6106e81e', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_57', 'Enfermería', 'Evitar avergonzar a la persona por reaccionar emocionalmente.

---', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('50b1258e-bd1d-57d4-a4ef-58d025e49492', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_58', '22. Mecanismos de defensa', 'Son patrones psicológicos utilizados para reducir ansiedad relacionada con estrés o conflicto.

La bibliografía de enfermería los describe como mecanismos que operan principalmente fuera de la conciencia.', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c153092f-6ae1-565a-8d83-39b757b34d84', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_59', 'Excepción relevante', 'La **supresión** se considera una decisión consciente de posponer temporalmente un pensamiento o emoción.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b5659635-89ba-5417-92f3-173c0c846aaf', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_60', 'Clave', 'Mecanismo de defensa ≠ afrontamiento consciente.

---', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2ebb8883-01d4-5083-a7b9-66b84fe63c12', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_61', '23. Negación', 'La persona rechaza o no reconoce temporalmente una realidad difícil.

Ejemplo:
Una persona recién diagnosticada insiste en que el laboratorio “debe estar equivocado”.', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d97dabf0-65f8-5135-9dd4-9004ea563d9c', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_62', 'Enfermería', '- no confrontar de forma humillante;
- valorar cuánto interfiere con seguridad/tratamiento;
- proporcionar información gradualmente.

---', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6426a1ed-ca7c-57ee-8dda-c6b7c27b913d', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_63', '24. Proyección', 'Atribuir a otra persona pensamientos o sentimientos propios que generan conflicto.

Ejemplo:
Persona con intensa hostilidad afirma que “todos quieren atacarme” sin evidencia suficiente.', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('218f5596-1be8-591c-b64a-abd039cab5c9', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_64', 'Enfermería', 'No discutir sobre culpa; explorar emociones y hechos.

---', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('61986cfd-4cfd-5e1e-b084-5d224eeb8cbb', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_65', '25. Desplazamiento', 'Transferir una emoción desde el verdadero origen hacia un objetivo menos amenazante.

Ejemplo:
Paciente enojado por un diagnóstico grita al familiar que intenta ayudarle.

---', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cadd0825-addc-5f80-8a3c-1058b8bf2f2c', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_66', '26. Racionalización', 'Crear explicaciones aceptables para una conducta o resultado que evita reconocer motivos más difíciles.

Ejemplo:
“Reprobé porque el examen era injusto”, sin explorar falta de preparación.

---', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4827b477-dcb2-5601-9dc1-5ed39fa91b0a', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_67', '27. Regresión', 'Retorno a conductas de etapas previas del desarrollo ante estrés.

Puede observarse como:
- dependencia aumentada;
- conductas infantiles;
- demanda de atención.

No debe utilizarse el término para humillar.

---', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a539c6bc-b529-55ef-8e0f-335e5f55e866', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_68', '28. Represión', 'Exclusión inconsciente de pensamientos o recuerdos dolorosos de la conciencia.', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bf0fb129-03d8-50d1-a013-0c487d449625', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_69', 'Diferencia', 'Represión = inconsciente.  
Supresión = consciente.

---', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b1bab559-0fc9-55df-9d15-c73a74010eb6', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_70', '29. Supresión', 'Decisión consciente de posponer un pensamiento.

Ejemplo:
“Ahora debo terminar este procedimiento; hablaré de mi preocupación después.”

Puede ser adaptativa cuando es temporal.

---', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ec4ad2a5-bb05-542a-9932-4bdaa8a10841', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_71', '30. Formación reactiva', 'Expresar una actitud o conducta opuesta a un impulso inaceptable.

Ejemplo:
Mostrar amabilidad exagerada hacia alguien por quien se siente hostilidad intensa.

---', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d6172fa1-4aec-5502-ae09-b9eaeb842c04', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_72', '31. Sublimación', 'Canalizar impulsos o emociones hacia actividades socialmente constructivas.

Ejemplo:
Canalizar ira hacia deporte, arte o trabajo significativo.

Suele considerarse un mecanismo relativamente adaptativo.

---', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e1f342c6-071c-5841-9ea3-04544a9a999b', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_73', '32. Intelectualización', 'Concentrarse excesivamente en hechos y detalles para evitar conectar con el componente emocional.

Ejemplo:
Persona recién diagnosticada habla solo de estadísticas y evita toda expresión emocional.

---', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('673bb4a3-8f47-538e-9fa2-ec4e29ec6971', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_74', '33. Compensación', 'Intentar equilibrar una debilidad percibida destacando otra capacidad.

Puede ser adaptativa si no produce deterioro.

---', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5d1fe17b-4199-537b-960f-77796aa52abd', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_75', '34. Conversión', 'Síntomas neurológicos funcionales pueden presentarse en relación con procesos psicológicos.', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a16341fa-10f2-5b0d-828c-a6462f987cb1', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_76', 'Seguridad', 'Nunca asumir que un síntoma físico es “psicológico” antes de realizar valoración médica apropiada.

El diagnóstico de trastorno neurológico funcional corresponde a evaluación clínica.

---', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1e89c46a-9ea8-5ce3-b53d-ca9f5d9ee05f', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_77', '35. Mecanismos de defensa y enfermería', 'El profesional no debe decir al paciente de manera acusatoria:

> “Está proyectando.”

Más útil:
- describir conducta;
- explorar emoción;
- mantener límites;
- ayudar a identificar alternativas.', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d59e99be-e86c-52ac-befe-7ef91651d6c3', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_78', 'Principio', 'Los mecanismos de defensa pueden proteger temporalmente frente a ansiedad; se vuelven problemáticos cuando interfieren persistentemente con realidad, relaciones, seguridad o función.

---', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('74db4ead-34be-5f32-998d-1866a2737cf5', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_79', '36. Crisis', 'Una crisis puede ocurrir cuando:

- el estresor excede recursos;
- las estrategias habituales fallan;
- aumenta desorganización.

Manifestaciones:
- ansiedad intensa;
- confusión;
- insomnio;
- impulsividad;
- desesperanza;
- deterioro funcional.', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1697a350-2d2c-591e-8467-c3645fca9df4', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_80', 'Evaluar siempre', '- autolesión;
- suicidio;
- violencia;
- sustancias;
- apoyo;
- causas médicas.

---', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e398c1fb-2b60-5cb7-8b90-3a7cbff3b7da', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_81', '37. Señales de alarma', 'Escalar atención cuando exista:

- ideación suicida;
- plan/intención;
- agresividad grave;
- psicosis;
- incapacidad para autocuidado básico;
- intoxicación/abstinencia;
- síntomas físicos compatibles con emergencia;
- delirium;
- deterioro rápido.

---', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3f7ec307-3dc0-563f-ab8e-ec3dd73df17b', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_82', '38. Intervenciones de enfermería según nivel de activación', '', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8ed2ca4a-4695-5ea7-90a7-b353a1b84d79', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_83', 'Estrés leve/moderado', '- educación;
- respiración;
- resolución de problemas;
- actividad;
- apoyo;
- planificación.', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5c7745b6-0ac9-5a4f-90e5-68cb665c2aea', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_84', 'Ansiedad severa', '- permanecer;
- bajar estímulos;
- mensajes cortos;
- seguridad;
- evaluar causas.', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1b087e70-3a27-5805-90e4-908401ea7636', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_85', 'Pánico/crisis', '- ambiente seguro;
- instrucciones simples;
- evaluación médica;
- control de riesgo;
- tratamiento indicado.

---', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('190e2d2a-3dd2-57cf-bc05-944901f787bf', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_86', '39. PAE', '', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f853d9a7-78a3-5424-8d45-44c228b5408e', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_87', 'Valoración', '- estresor;
- ansiedad;
- conflicto;
- frustración;
- afrontamiento;
- sustancias;
- sueño;
- función;
- apoyo;
- seguridad.', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8e467f6e-d225-5250-89c6-f960c245249c', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_88', 'Problemas/juicios posibles', '- sobrecarga de estrés;
- afrontamiento ineficaz;
- ansiedad;
- riesgo de autolesión;
- alteración del sueño.', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('521d6e07-068f-5868-9f78-74dcb702acb7', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_89', 'Planificación', '- disminuir activación;
- fortalecer afrontamiento;
- mejorar función;
- mantener seguridad.', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dd141117-7081-5cb6-a6d8-5c606f768985', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_90', 'Implementación', '- comunicación;
- reducción de estímulos;
- técnicas de manejo;
- apoyo;
- educación;
- referencia.', 90)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('14d1e2f5-0719-5a68-91d9-65d8781b724e', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_91', 'Evaluación', '- síntomas;
- uso de estrategias;
- sueño;
- función;
- riesgo.

---', 91)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('18577924-1cc3-5b93-862f-68dc4da2bcf1', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_92', '40. Situaciones tipo examen', '', 92)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6c343f08-39f4-541b-811a-8c64c88dd7c5', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_93', 'Caso 1 — Estrés', 'Paciente enfrenta cambio laboral y presenta insomnio leve, pero mantiene funcionamiento.

**Interpretación:** respuesta de estrés que requiere valoración y estrategias; no diagnosticar automáticamente trastorno.', 93)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b53a930b-14a7-5335-990f-6282db49270a', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_94', 'Caso 2 — Estrés estructural', 'Paciente vive violencia doméstica y se le recomienda únicamente “respirar profundo”.

**Problema:** la técnica puede ayudar, pero debe abordarse seguridad y causa del estrés.', 94)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6aee3793-3b3b-5a4e-9524-ee77d9e3a66b', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_95', 'Caso 3 — Ansiedad moderada', 'Paciente no logra seguir una explicación extensa.

**Intervención:** reducir estímulos y usar mensajes breves y focalizados.', 95)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a654f7cc-44c3-5dee-bd52-8d36022a261c', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_96', 'Caso 4 — Pánico', 'Paciente tiene dolor torácico intenso por primera vez y afirma que “es ansiedad”.

**Prioridad:** descartar causas médicas antes de asumir pánico.', 96)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('93a6eb66-cfc3-5d28-92a6-cf1face00532', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_97', 'Caso 5 — Afrontamiento', 'Persona usa ejercicio y apoyo social durante una pérdida.

**Interpretación:** estrategias de afrontamiento potencialmente adaptativas.', 97)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('59a01fb1-498f-57f9-bf66-a51abf82a124', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_98', 'Caso 6 — Sustancias', 'Paciente incrementa alcohol para dormir.

**Intervención:** reconocer afrontamiento maladaptativo, valorar consumo y ofrecer alternativas.', 98)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d9bb0bc9-7c5e-5b2a-9f78-1ee9c939b097', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_99', 'Caso 7 — Conflicto', 'Paciente duda entre dos tratamientos acordes a valores distintos.

**Intervención:** clarificar opciones/valores sin decidir por él.', 99)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a2040b2f-b86c-572a-a9ad-3d6f9c29ba6f', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_100', 'Caso 8 — Frustración', 'Paciente se enoja porque no progresa tan rápido como esperaba.

**Intervención:** reconocer emoción y renegociar metas realistas.', 100)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e06b1cf3-eff6-5aea-aadc-d8cdffaa60e5', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_101', 'Caso 9 — Negación', 'Persona recién diagnosticada rechaza toda información.

**Intervención:** valorar impacto en seguridad y ofrecer información gradualmente.', 101)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e820a659-b822-5121-acd9-505f3908c21d', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_102', 'Caso 10 — Represión vs supresión', 'Persona decide conscientemente posponer hablar de una preocupación hasta terminar una tarea.

**Respuesta:** supresión.', 102)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6f7a4836-3c17-51a2-ad01-2ded0cec7460', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_103', 'Caso 11 — Sublimación', 'Paciente canaliza enojo en actividad deportiva segura.

**Respuesta:** sublimación.', 103)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('00195b17-f22e-55a3-9cd8-6bc129842d33', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_104', 'Caso 12 — Crisis', 'Paciente dice que ya no puede afrontar la situación y desea morir.

**Prioridad:** evaluación directa de suicidio y seguridad inmediata.

---', 104)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cb976dce-5758-5b11-a91f-c746c4daf23a', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_105', '41. Errores frecuentes', '1. Confundir estrés con trastorno mental.
2. Diagnosticar ansiedad solo por preocupación.
3. Atribuir dolor torácico nuevo a pánico sin valoración.
4. Dar explicaciones largas en ansiedad severa.
5. Llamar “mal afrontamiento” a toda emoción.
6. Ignorar determinantes sociales del estrés.
7. Confundir afrontamiento con defensa.
8. Confundir represión con supresión.
9. Confrontar defensas de manera humillante.
10. Asumir síntomas físicos como psicológicos.
11. No explorar sustancias.
12. No valorar suicidio durante crisis.

---', 105)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c067f9b3-4075-5eda-a581-d2799cab65d2', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_106', '42. Qué memorizar', '**Estresor = demanda; estrés = respuesta.**

**Ansiedad normal ≠ trastorno de ansiedad.**

**A mayor ansiedad, mensajes más breves y mayor prioridad a seguridad.**

**Afrontamiento = esfuerzo consciente/cognitivo-conductual.**

**Defensas = principalmente inconscientes.**

**Supresión = consciente.**

**Represión = inconsciente.**

**Negación = no reconocer realidad difícil.**

**Proyección = atribuir a otros lo propio.**

**Desplazamiento = mover emoción a otro blanco.**

**Sublimación = canalizar hacia actividad constructiva.**

**Crisis + suicidio/violencia/psicosis = prioridad de seguridad.**

---', 106)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('993a9142-b331-53d2-99c4-3025945c44d1', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_107', '43. Fuentes y validación', '', 107)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a2cd10d8-07f6-5c74-9aa4-aa851f707966', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_108', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 108)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3ec2b610-c223-5ff0-babf-ca88f883107b', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_109', 'Bibliografía señalada por CICDE', '**AMIR. Enfermería Psiquiátrica y Salud Mental. 2014.**

**Galiana Roch, J. Enfermería Psiquiátrica. Elsevier. 2016.**

**DSM-5. Manual Diagnóstico y Estadístico de los Trastornos Mentales. Referenciado por CICDE.**', 109)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e489846a-bf99-5210-80cb-69ed5fb5b1d8', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_110', 'Fuentes complementarias', '**World Health Organization. Anxiety disorders. Actualizado 8 de septiembre de 2025.**

**World Health Organization. Doing What Matters in Times of Stress: An Illustrated Guide. 2020.**

**OPS/OMS. En tiempos de estrés, haz lo que importa. Versión adaptada para América Latina.**

**Open RN / NCBI Bookshelf. Nursing: Mental Health and Community Concepts, 2nd edition. Chapter 3: Stress, Coping, and Crisis Intervention. 2025.**', 110)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d7f8c31b-0503-5098-8b31-b839edc03903', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_111', 'Nota', 'Los mecanismos de defensa se enseñan como conceptos psicodinámicos/de enfermería. No deben utilizarse para etiquetar ni para sustituir una valoración clínica integral.

---', 111)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b5eb0a14-544e-55c4-9257-d0bde93268c3', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_112', '44. Control de calidad', 'Este paquete:

- cubre los cinco elementos mencionados por CICDE;
- conserva la palabra “stress” solo en trazabilidad y normaliza “estrés”;
- diferencia ansiedad normal de trastorno;
- diferencia afrontamiento de defensa;
- explica los principales mecanismos de defensa;
- incorpora OMS 2025 para ansiedad;
- incorpora guía OMS/OPS de manejo del estrés;
- contiene 12 casos originales;
- incluye seguridad ante crisis.

---', 112)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6143ebca-b911-5417-aca3-81dd1264d3a2', '436f52b3-5e17-5296-b1d8-6d33fed54051', 'sec_113', '45. Estado para integración', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- enlazar fuentes;
- mantener niveles de ansiedad como herramienta de enfermería y no como diagnóstico formal;
- revisar farmacoterapia concreta dentro de MENTAL-08;
- enlazar con MENTAL-02, MENTAL-07, MENTAL-08 y MENTAL-10.', 113)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d74be127-e4b5-5d89-8692-853dd6123bbc', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_1', 'Modelos de enfermería aplicados a la salud mental', '**Área:** Enfermería en Salud y Enfermedad Mental  
**Código:** MENTAL-06  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('59aaa6a3-95b6-5d5e-81c3-a6001a3e2f42', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_2', '1. Alcance oficial CICDE', 'El lineamiento CICDE 2026 incluye expresamente los siguientes modelos:

1. **Relación Interpersonal – Hildegard Peplau**
2. **Persona a Persona – Joyce Travelbee**
3. **Adaptación – Callista Roy**
4. **Conductual – Dorothy Johnson**', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dd95e90f-ec80-5db7-ad1b-d7005d3024e0', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_3', 'Nota de trazabilidad', 'El documento CICDE presenta errores ortográficos en algunos nombres (“Hildergard” y “Jonhson”). En esta plataforma se conservan esas formas únicamente como evidencia del texto original y se utilizan los nombres correctos:

- **Hildegard E. Peplau**
- **Joyce Travelbee**
- **Sister Callista Roy**
- **Dorothy E. Johnson**

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('20f3be3f-3c0b-57d8-bee0-d793b82fa9e3', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_4', '2. Objetivos de aprendizaje', 'Al finalizar el tema, el estudiante debe poder:

1. Identificar los cuatro modelos exigidos por CICDE.
2. Relacionar cada modelo con su autora.
3. Explicar el foco central de cada modelo.
4. Reconocer las fases de la relación interpersonal de Peplau.
5. Reconocer las fases de la relación persona-a-persona de Travelbee.
6. Explicar los estímulos y modos adaptativos de Roy.
7. Identificar los subsistemas conductuales de Johnson.
8. Aplicar cada modelo a situaciones de salud mental.
9. Diferenciar modelos conceptuales de protocolos clínicos.
10. Integrar los modelos con el PAE.
11. Evitar confundir terminología entre teorías.
12. Resolver situaciones tipo examen.

---', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d3fc1290-982c-532c-9a17-eaa6359638d0', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_5', '3. ¿Qué es un modelo de enfermería?', 'Un modelo de enfermería organiza conceptos para orientar:

- valoración;
- relación enfermera-persona;
- identificación de necesidades;
- planificación;
- intervención;
- evaluación.', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c140025d-19de-5c6f-907b-d528a60ab630', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_6', 'Importante', 'Un modelo de enfermería:

- no reemplaza el juicio clínico;
- no reemplaza diagnóstico médico;
- no reemplaza guías de seguridad;
- no sustituye protocolos de emergencia.

Es un marco para comprender y organizar el cuidado.

---', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dc6647ab-6cb8-5af1-87a1-235d28625334', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_7', '4. Comparación rápida', '| Modelo | Autora | Foco principal |
|---|---|---|
| Relación interpersonal | Hildegard Peplau | Relación terapéutica enfermera-persona |
| Persona a persona | Joyce Travelbee | Encuentro humano, sufrimiento, significado y esperanza |
| Adaptación | Callista Roy | Persona como sistema adaptativo frente a estímulos |
| Sistema conductual | Dorothy Johnson | Equilibrio y organización de subsistemas conductuales |

---', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1e8dc43a-d751-54f3-b05e-b995ec0cc63a', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_8', '5. HILDEGARD PEPLAU — TEORÍA DE LAS RELACIONES INTERPERSONALES', 'Peplau es una figura central de la enfermería psiquiátrica.

Su teoría considera la relación enfermera-paciente como un proceso interpersonal terapéutico.

PubMed conserva trabajos de Peplau que describen su teoría como un marco para comprender fenómenos interactivos entre enfermera y paciente.

---', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('03acaaa5-7372-538f-b406-ad70d0c482e2', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_9', '6. Fases clásicas de Peplau', 'En la formulación clásica se enseñan cuatro fases:

1. **Orientación**
2. **Identificación**
3. **Explotación / aprovechamiento**
4. **Resolución**', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c7e44525-097f-5650-8d7f-860cae703bac', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_10', 'Nota de equivalencia', 'Algunos textos contemporáneos simplifican la relación terapéutica en:

- orientación;
- trabajo;
- terminación.

La fase de **trabajo** puede integrar elementos que en la formulación clásica corresponden a identificación y explotación.

Para CICDE conviene conocer **las cuatro fases clásicas** y reconocer la equivalencia moderna.

---', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a52f0eab-d860-53eb-80bd-ae1b1d15297c', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_11', '7. Orientación — Peplau', 'La persona reconoce una necesidad y entra en contacto con el profesional.

La enfermera:

- se presenta;
- aclara su rol;
- establece confianza;
- valora necesidades;
- define límites;
- establece objetivos iniciales;
- explica la relación.', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3ac1bdfe-9cb4-5389-8bcc-fe423ea4159b', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_12', 'Ejemplo', 'Paciente ingresado por ansiedad conoce por primera vez a su enfermera.

La prioridad es establecer seguridad, propósito y confianza.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8914e0a6-e73d-5740-8ca7-ed88550c32ad', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_13', '8. Identificación — Peplau', 'La persona empieza a:

- expresar problemas;
- identificar necesidades;
- responder a quienes pueden ayudar;
- participar en la relación.

La enfermera facilita:
- expresión;
- comprensión;
- establecimiento de metas;
- reconocimiento de recursos.

---', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('38c58bb5-d672-5c77-ae84-7ce7394a6b86', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_14', '9. Explotación / aprovechamiento — Peplau', 'La persona utiliza los recursos disponibles dentro de la relación terapéutica.

Puede:

- participar en tratamiento;
- aprender;
- practicar habilidades;
- pedir ayuda;
- utilizar recursos.', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b05b2182-3fcc-508c-ad04-e22d5571fdce', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_15', 'Importante', '“Explotación” es un término histórico de la teoría y significa **aprovechar terapéuticamente los recursos disponibles**, no abuso o explotación de la persona.

---', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6915ab79-071a-5371-b67c-7b21e704cb1e', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_16', '10. Resolución — Peplau', 'Los objetivos se han trabajado y la relación profesional llega a su cierre.

La persona:

- aumenta independencia;
- integra aprendizajes;
- utiliza nuevos recursos.

La enfermera:
- prepara el cierre;
- revisa logros;
- facilita transición;
- mantiene límites.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3941b1a9-aee6-5142-a08a-86b02c964569', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_17', '11. Roles de enfermería en Peplau', 'Entre los roles clásicos descritos se incluyen:

- extraño;
- persona recurso;
- docente;
- líder;
- sustituto;
- consejero.', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e8439586-5b5b-58b9-b176-e4f611d90917', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_18', 'Clave', 'El rol cambia según la fase y las necesidades.

La enfermera sigue siendo profesional y mantiene límites.

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5c0def2c-0b9f-5d57-8da4-c4dc9ea21bab', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_19', '12. Peplau aplicada a salud mental', 'Ejemplo:

Paciente con ansiedad social.', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a6b52592-c0ca-5233-80a2-19fb057e24aa', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_20', 'Orientación', 'Establecer confianza y valorar impacto.', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5eea2774-5180-526d-aa96-db08f68b9488', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_21', 'Identificación', 'Paciente reconoce situaciones temidas y metas.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c2d540e4-59d1-52ea-9d1c-989cb8e8b7b1', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_22', 'Explotación', 'Utiliza educación, terapia y estrategias disponibles.', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eb2015cd-a880-5e47-b93c-c5c1f490f309', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_23', 'Resolución', 'Integra habilidades y finaliza la relación terapéutica.

---', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cac5a722-8ea1-522a-bc28-3838bffd1c09', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_24', '13. Error frecuente con Peplau', 'Confundir relación terapéutica con amistad.', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bf23f673-b7ac-5e63-a885-14bb95651052', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_25', 'No es amistad porque:', '- tiene objetivos;
- límites;
- rol profesional;
- tiempo/contexto definido;
- foco en necesidades del paciente.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b7965ff9-c443-5b40-be73-2a1b3c63bdd0', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_26', '14. JOYCE TRAVELBEE — MODELO DE RELACIÓN PERSONA A PERSONA', 'Travelbee enfatiza que enfermera y paciente son primero **seres humanos únicos**, no simplemente roles.

La relación busca ayudar a la persona/familia a:

- afrontar enfermedad;
- afrontar sufrimiento;
- encontrar significado;
- mantener/desarrollar esperanza.

La comunicación es esencial.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('586f3cf0-aa60-5d67-8e01-8db16f01ccc4', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_27', '15. Fases de Travelbee', 'Se describen cinco momentos:

1. **Encuentro original**
2. **Emergencia de identidades**
3. **Empatía**
4. **Simpatía**
5. **Rapport**

---', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1555aa12-b866-5e56-8c30-44ee08c47b10', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_28', '16. Encuentro original — Travelbee', 'Primer contacto.

Pueden existir:
- primeras impresiones;
- etiquetas;
- expectativas.', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a0af765b-210d-50c4-9e66-62fe7ee4e1f9', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_29', 'Meta', 'Avanzar más allá de categorías como:
- “enfermera”;
- “paciente”;
- “diagnóstico”.

Reconocer a la otra persona como única.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e59fb7a5-ea90-5ff7-8b8c-4a155034046a', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_30', '17. Emergencia de identidades', 'Ambos participantes comienzan a percibirse como personas individuales.

La enfermera conoce:

- historia;
- significado;
- valores;
- experiencia.

Se reduce la relación basada únicamente en estereotipos.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('83015d1b-cd07-500a-9d9a-40847c11d752', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_31', '18. Empatía — Travelbee', 'Capacidad de comprender la experiencia de otra persona manteniendo diferenciación entre uno mismo y el otro.

La empatía permite:
- reconocer sufrimiento;
- entender significado;
- responder de forma terapéutica.

---', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b40720f5-ba0e-565b-b9e9-10af6ce9182d', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_32', '19. Simpatía — Travelbee', 'En Travelbee, la simpatía representa un paso más allá de comprender: existe deseo de aliviar el sufrimiento.', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f7c8fd67-d281-5efd-b18b-b821f2eb1659', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_33', 'Importante', 'No significa lástima ni sobreinvolucramiento.

Debe mantenerse el juicio profesional.

---', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('635624b7-1dbc-5c2b-a50c-2d5b5c16ef83', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_34', '20. Rapport — Travelbee', 'Es una relación caracterizada por:

- confianza;
- comprensión;
- conexión terapéutica;
- participación humana genuina.

No aparece automáticamente; se desarrolla a través del proceso relacional.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('192db643-9598-5c4c-b3c0-ac1dc12c3464', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_35', '21. Sufrimiento, significado y esperanza', 'Travelbee presta especial atención a:

- sufrimiento;
- enfermedad;
- significado;
- esperanza.', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a346e40f-f1cf-5b52-af6a-c83aa4b02f60', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_36', 'Aplicación', 'En enfermedad crónica, duelo, oncología, cuidados paliativos o salud mental:

la enfermera no solo pregunta “¿qué síntomas tiene?”, sino también:

- “¿Qué significa esto para usted?”
- “¿Qué es lo que más teme?”
- “¿Qué le ayuda a seguir adelante?”

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d7bc44cf-e5a5-59e8-ab7d-5f72d8149523', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_37', '22. Travelbee y comunicación', 'La comunicación permite:

- conocer necesidades;
- comprender sufrimiento;
- establecer relación;
- promover esperanza;
- ofrecer ayuda.', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e7086930-da09-5046-9d7e-0b6715c7fdc1', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_38', 'Error', 'Usar frases vacías de esperanza.

La esperanza terapéutica debe ser:
- realista;
- centrada en la persona;
- compatible con la situación.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c25838da-4f48-51ac-9eb6-5930ca471187', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_39', '23. Travelbee — aplicación', 'Paciente recibe diagnóstico crónico incapacitante.

La enfermera:

1. evita reducirlo a su diagnóstico;
2. explora experiencia personal;
3. demuestra empatía;
4. identifica sufrimiento;
5. ayuda a encontrar metas y significado;
6. fortalece esperanza realista.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('529731ca-d9e4-518e-8fb6-335adf31ecb0', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_40', '24. CALLISTA ROY — MODELO DE ADAPTACIÓN', 'El Modelo de Adaptación de Roy considera a la persona como un **sistema adaptativo** en interacción con un ambiente cambiante.

La enfermería ayuda a promover respuestas adaptativas.

---', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('608197d8-e205-51d0-9190-4211668e006a', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_41', '25. Estímulos en Roy', '', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('99a762eb-9213-5fa4-b8b7-2a593e757d4e', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_42', 'Estímulo focal', 'El estímulo que enfrenta de manera más inmediata la persona.

Ejemplo:
diagnóstico reciente.', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a112e90f-d188-5baa-8dc4-0757be1e794d', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_43', 'Estímulos contextuales', 'Otros factores que contribuyen a la situación.

Ejemplos:
- apoyo;
- economía;
- dolor;
- trabajo;
- ambiente.', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('de020dd1-3982-5ce9-89cd-40a2d4667c31', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_44', 'Estímulos residuales', 'Factores cuyo efecto puede ser menos claro o no estar completamente validado.

Ejemplos:
- experiencias previas;
- creencias;
- actitudes;
- recuerdos.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a0f06ff4-ec61-5c31-b020-351b2ff85717', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_45', '26. Mecanismos de afrontamiento en Roy', 'Roy describe dos grandes subsistemas de afrontamiento:', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('99e475cf-80a7-52bf-89d4-762c5e5c0ec6', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_46', 'Regulador', 'Procesos fisiológicos automáticos.

Incluye respuestas:
- neurales;
- químicas;
- endocrinas.', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1159fd9b-5be0-53c0-a417-860b4821cc7a', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_47', 'Cognador', 'Procesos cognitivos/emocionales.

Incluye:
- percepción;
- aprendizaje;
- juicio;
- emoción.

---', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f33fb6ac-c4b5-5bfd-a874-53644cab9a05', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_48', '27. Cuatro modos adaptativos de Roy', '', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5711ee9a-af10-534e-afa3-061ced26e62c', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_49', '1. Fisiológico-físico', 'Necesidades y respuestas corporales.', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('74c5d0e6-680b-559c-bbc0-a8217a497163', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_50', '2. Autoconcepto / identidad de grupo', 'Percepción de uno mismo, valores, identidad y dimensión psicosocial.', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('99770ee7-ffef-5ff9-8617-a0875ea86d91', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_51', '3. Función de rol', 'Roles y expectativas sociales.', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('96b5d485-4aed-5624-b92b-9197395e721a', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_52', '4. Interdependencia', 'Relaciones, apoyo, dar y recibir afecto/recursos.

---', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9de670c6-ed22-54da-84b2-2e42712a1950', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_53', '28. Roy aplicada a salud mental', 'Paciente pierde su empleo y desarrolla síntomas ansiosos.', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('578231cf-47ea-5b49-940a-05ebeb9edf56', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_54', 'Focal', 'Pérdida de empleo.', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a0893e4a-086a-5fc3-a0ae-416cda53fbb8', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_55', 'Contextuales', 'Deudas, poco apoyo, enfermedad.', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('979c28a3-a1d7-5aa8-bd31-6e05dffc7a9d', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_56', 'Residuales', 'Experiencias previas de fracaso.', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('154575e0-c1dd-5829-a73b-7677e59c6adc', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_57', 'Modos', '- fisiológico: insomnio;
- autoconcepto: “soy inútil”;
- rol: pérdida del rol laboral;
- interdependencia: aislamiento.', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('33471496-b0f9-50e1-9252-b85f34e54141', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_58', 'Enfermería', 'Intervenir sobre estímulos modificables y favorecer respuestas adaptativas.

---', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d351e75c-502a-5f79-a3f2-b7b7553689b7', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_59', '29. Proceso de enfermería según Roy', 'De forma conceptual:

1. valorar conductas;
2. valorar estímulos;
3. identificar problemas de adaptación;
4. establecer objetivos;
5. intervenir;
6. evaluar respuesta.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f8eab835-0264-5bfc-aea1-6716a721c5e3', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_60', 'Clave', 'No quedarse únicamente con el síntoma; examinar la interacción entre persona y ambiente.

---', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('de5ec24c-a6b1-5849-a677-f841bcbd4066', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_61', '30. Roy — aplicación en salud mental', 'Puede ser útil en:

- enfermedad crónica;
- pérdida;
- discapacidad;
- cambios de rol;
- ansiedad;
- hospitalización;
- rehabilitación;
- cambios familiares.

Su uso contemporáneo continúa apareciendo en literatura de enfermería para organizar cuidado holístico y adaptación.

---', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bd257ccc-c8ab-5a07-825d-9b55a3bc4b70', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_62', '31. DOROTHY JOHNSON — MODELO DEL SISTEMA CONDUCTUAL', 'Johnson conceptualiza a la persona como un **sistema conductual** compuesto por subsistemas interrelacionados.

El objetivo de enfermería es favorecer:

- equilibrio;
- estabilidad;
- funcionamiento conductual efectivo.

---', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a85313d1-a528-57c7-b294-29913e28d99c', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_63', '32. Siete subsistemas de Johnson', 'Los siete subsistemas clásicamente identificados son:

1. **Afiliación/apego**
2. **Dependencia**
3. **Ingestivo**
4. **Eliminativo**
5. **Sexual**
6. **Agresivo-protector**
7. **Logro**

Estos subsistemas interactúan entre sí y con el ambiente.

---', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2693c41a-101e-52ea-a7d9-7a0c85059c05', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_64', '33. Afiliación/apego', 'Se relaciona con:

- vínculos;
- inclusión social;
- intimidad;
- seguridad;
- pertenencia.', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('788f5a51-cd0b-5eed-b53c-c48cbf3370b2', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_65', 'Ejemplo', 'Paciente aislado después de una pérdida puede mostrar alteración en este subsistema.

---', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0f606cbd-c37f-5005-9fba-008c0809570c', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_66', '34. Dependencia', 'Se relaciona con:

- búsqueda de ayuda;
- aprobación;
- reconocimiento;
- asistencia.', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('483ff6b1-9737-554f-96b3-ffc31a46ced9', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_67', 'Clave', 'Dependencia no es siempre negativa.

El equilibrio incluye capacidad para:
- solicitar ayuda apropiada;
- mantener autonomía posible.

---', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c595ddc7-f79d-56f5-953c-be0507e279cb', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_68', '35. Ingestivo', 'Se relaciona con patrones de:

- alimentación;
- significado social de comer;
- cuándo/cómo se ingieren alimentos.

En salud mental puede valorarse en:
- depresión;
- ansiedad;
- trastornos alimentarios;
- efectos de medicamentos.

---', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f32ff0f7-f8f9-50ee-aa82-6db4f9ff829c', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_69', '36. Eliminativo', 'Se relaciona con patrones y significados de eliminación.

Puede verse afectado por:
- ansiedad;
- medicamentos;
- hospitalización;
- pérdida de autonomía.

---', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c4a680ac-51a2-5960-af8f-8debefe48b13', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_70', '37. Sexual', 'Se relaciona con:

- identidad/rol sexual según el marco histórico del modelo;
- intimidad;
- reproducción;
- expresión sexual.', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d9716a21-d46c-5269-96d5-8b7041724fe5', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_71', 'Aplicación actual', 'Debe abordarse con:
- lenguaje inclusivo;
- respeto;
- derechos;
- consentimiento;
- sin imponer categorías antiguas rígidas.

---', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('757911b6-2711-5a31-90ab-2d1402d6edc7', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_72', '38. Agresivo-protector', 'Se relaciona con conductas de:

- autoprotección;
- defensa;
- preservación.', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c8071458-ebb2-5739-bf98-4762cb4cfdda', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_73', 'Importante', 'No significa simplemente “violencia”.

En enfermería se valora:
- amenaza;
- seguridad;
- respuesta defensiva;
- impulsividad.

---', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('88fa23d0-e826-52b6-b062-084b18578fbf', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_74', '39. Logro', 'Se relaciona con:

- dominio;
- competencia;
- metas;
- control sobre aspectos del entorno.

Puede alterarse con:
- discapacidad;
- desempleo;
- enfermedad;
- fracaso percibido.

---', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ef409b6c-3637-5e81-b971-445e9970b51b', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_75', '40. Requisitos funcionales en Johnson', 'La literatura del modelo describe tres necesidades generales para mantener integridad del sistema:

- **protección**;
- **nutrición/apoyo (nurturance)**;
- **estimulación**.

Cuando el sistema pierde equilibrio, enfermería actúa como una fuerza externa que favorece estabilidad.

---', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cbff2ae5-ea31-56a8-86aa-46f7f9c0e7de', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_76', '41. Johnson aplicada a salud mental', 'Paciente hospitalizado por depresión:

- afiliación: aislamiento;
- dependencia: incapacidad para pedir ayuda;
- ingestivo: pérdida de apetito;
- eliminativo: estreñimiento por inactividad/medicación;
- sexual: disminución de interés;
- agresivo-protector: ideación autolesiva;
- logro: sensación de fracaso.', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a0328f6b-e802-5ef9-8403-b7f024163f18', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_77', 'Enfermería', 'Valora patrones de conducta y diseña intervenciones dirigidas a recuperar equilibrio.

---', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f341c04a-782a-5e66-8053-240cbd481b9b', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_78', '42. Diferencias clave entre los cuatro modelos', '', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0e27f51a-d7cc-5cd8-99b8-4dbdcf2fb5a1', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_79', 'Peplau', 'Pregunta principal:
**¿Cómo se desarrolla la relación terapéutica enfermera-persona?**', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2fbdd9bb-0925-5a4f-9b4c-38b5d572b51b', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_80', 'Travelbee', 'Pregunta:
**¿Cómo se encuentran dos seres humanos y se afrontan sufrimiento, significado y esperanza?**', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b6d4a5cd-ecd0-5c93-bc7e-8637256adce3', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_81', 'Roy', 'Pregunta:
**¿Cómo está respondiendo/adaptándose la persona a los estímulos internos y externos?**', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('492074cc-0166-567e-b1e1-c4527a183570', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_82', 'Johnson', 'Pregunta:
**¿Qué patrones o subsistemas conductuales están en desequilibrio y cómo favorecer estabilidad?**

---', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b99bac8c-776c-54d5-82ca-de82ff9af3a8', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_83', '43. Peplau vs Travelbee', 'Se parecen porque:
- son relacionales;
- valoran comunicación;
- consideran interacción terapéutica.

Se diferencian:', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('135f7fcc-53c9-53c3-9c6f-62db14d0edf1', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_84', 'Peplau', 'estructura la relación en fases y roles profesionales.', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('34e59eed-b733-5731-9e90-cb51a9270480', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_85', 'Travelbee', 'enfatiza encuentro humano, significado, sufrimiento, esperanza y superación de etiquetas.

---', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4e0d0a83-8219-5ce0-95ac-e7d1ad00a79f', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_86', '44. Roy vs Johnson', 'Se parecen porque:
- utilizan pensamiento sistémico;
- buscan equilibrio/adaptación;
- organizan valoración.

Se diferencian:', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('edbf9794-dde7-5e5f-bb28-689ed8b79889', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_87', 'Roy', 'organiza respuestas en **cuatro modos adaptativos** y analiza **estímulos**.', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fb3be525-5637-5ca9-b4d2-027d5490ab5c', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_88', 'Johnson', 'organiza a la persona como **siete subsistemas conductuales**.

---', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4267bfee-8368-502f-b8c7-76ad759f043b', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_89', '45. Relación con PAE', 'Los modelos ayudan a estructurar el PAE, pero no sustituyen sus etapas.

Ejemplo:', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ca18a3e5-1c44-5a0f-8c67-83fe6f10b315', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_90', 'Valoración', 'Aplicar el lente conceptual.', 90)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('437424cb-d966-5604-9b54-dbb74a7e2ca8', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_91', 'Diagnóstico/juicio', 'Identificar respuestas humanas prioritarias.', 91)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('16c144ac-81a1-5724-b613-9f5f96a962db', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_92', 'Planificación', 'Definir resultados.', 92)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('19aadba5-7c9c-5cb1-91d3-7e2f4e74e7ed', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_93', 'Implementación', 'Seleccionar intervenciones.', 93)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('32371200-d4ef-5b05-b46a-6e04f4e89185', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_94', 'Evaluación', 'Determinar si mejora relación, adaptación, significado o equilibrio conductual según modelo.

---', 94)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c95fd291-2654-5551-a82b-cb73f75637b6', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_95', '46. Aplicación segura', 'Los modelos deben utilizarse junto con:

- evaluación clínica;
- evidencia actual;
- derechos;
- seguridad;
- protocolos.', 95)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6cd4af05-1059-52f3-92e4-92d03c659bf9', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_96', 'Ejemplo', 'Si un paciente tiene ideación suicida con plan:

no se demora la intervención de seguridad para completar una valoración teórica exhaustiva.

La seguridad tiene prioridad.

---', 96)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('82bdd6eb-214d-5dad-b01b-bedcc61f3e34', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_97', '47. Situaciones tipo examen', '', 97)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('30dbd0b9-95dc-528f-894b-cb69aa8a6151', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_98', 'Caso 1 — Peplau', 'Enfermera se presenta, explica su rol y acuerda objetivos iniciales.

**Fase:** orientación.', 98)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7eb7c64b-fe72-5b3f-b599-3a360bd083f5', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_99', 'Caso 2 — Peplau', 'Paciente empieza a utilizar recursos terapéuticos y practica habilidades.

**Fase clásica:** explotación/aprovechamiento.', 99)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e1492f78-0d1d-5f07-ae18-4a9f4d84bed2', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_100', 'Caso 3 — Peplau', 'Se revisan logros antes del alta.

**Fase:** resolución.', 100)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c98b7848-65e6-52ab-96f3-3ec73eac1cb1', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_101', 'Caso 4 — Travelbee', 'Enfermera evita llamar al paciente “el esquizofrénico” y busca conocerlo como individuo.

**Concepto:** emergencia de identidades/relación persona a persona.', 101)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('35bdd08c-c7fe-5c3e-a3c9-d0efde7c8880', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_102', 'Caso 5 — Travelbee', 'Paciente con cáncer pregunta “¿qué sentido tiene todo esto?”.

**Modelo especialmente útil:** Travelbee por significado, sufrimiento y esperanza.', 102)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1db52c78-6eab-5c89-8f03-f7f1cdcf39e3', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_103', 'Caso 6 — Travelbee', 'La enfermera comprende el sufrimiento y desea ayudar sin caer en lástima.

**Concepto:** progresión empatía-simpatía hacia rapport.', 103)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f1894bf4-e482-53e5-8c28-67dfbead8775', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_104', 'Caso 7 — Roy', 'Diagnóstico nuevo es la demanda inmediata más importante.

**Tipo de estímulo:** focal.', 104)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d3cdeedc-0907-5aa9-a5f3-100bf6a2fab0', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_105', 'Caso 8 — Roy', 'Problemas económicos influyen en adaptación al diagnóstico.

**Tipo:** contextual.', 105)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2f0bab87-4d6e-5db4-91e5-54f1b3f34272', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_106', 'Caso 9 — Roy', 'Paciente presenta aislamiento después de enfermedad.

**Modo:** interdependencia.', 106)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('44c20992-1a8f-55e1-bda0-7c880ae67301', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_107', 'Caso 10 — Johnson', 'Paciente pierde vínculos sociales tras hospitalización.

**Subsistema:** afiliación/apego.', 107)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e1afeb91-3a42-5d50-8bc1-53476e714a52', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_108', 'Caso 11 — Johnson', 'Paciente siente que no logra nada y abandona todas sus metas.

**Subsistema:** logro.', 108)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0ca9fde1-b208-5c46-bba6-5be5c9e7a185', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_109', 'Caso 12 — Seguridad', 'Paciente con plan suicida es entrevistado extensamente sobre teoría antes de asegurar el ambiente.

**Error:** los modelos no sustituyen prioridades clínicas de seguridad.

---', 109)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('46fc2d1b-8a1b-5a6c-a7b9-5b7bf1fc7661', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_110', '48. Errores frecuentes', '1. Confundir Peplau con Travelbee.
2. Olvidar las cuatro fases clásicas de Peplau.
3. Interpretar “explotación” de Peplau como abuso.
4. Confundir empatía y rapport.
5. Reducir Travelbee a “ser amable”.
6. Confundir estímulo focal con contextual en Roy.
7. Olvidar los cuatro modos de Roy.
8. Confundir Roy con Johnson.
9. Olvidar los siete subsistemas de Johnson.
10. Considerar agresivo-protector como sinónimo de violencia.
11. Aplicar modelos históricos sin adaptación ética actual.
12. Priorizar teoría sobre seguridad.

---', 110)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1d9d71a4-402f-5765-9e58-de63bedce678', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_111', '49. Qué memorizar', '**Peplau = relación interpersonal.**

**Peplau: orientación → identificación → explotación/aprovechamiento → resolución.**

**Travelbee = persona a persona.**

**Travelbee: encuentro original → identidades → empatía → simpatía → rapport.**

**Travelbee = sufrimiento + significado + esperanza.**

**Roy = adaptación.**

**Roy: focal + contextual + residual.**

**Roy: fisiológico + autoconcepto + rol + interdependencia.**

**Johnson = sistema conductual.**

**Johnson: afiliación, dependencia, ingestivo, eliminativo, sexual, agresivo-protector, logro.**

**Modelo conceptual ≠ protocolo clínico.**

---', 111)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3a52fd29-381d-553a-8ca4-148d9c20e5c0', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_112', '50. Fuentes y validación', '', 112)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e61179a5-80e0-594a-9a79-6256528cd152', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_113', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**

El documento exige específicamente los cuatro modelos desarrollados en este módulo.', 113)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('47529fa2-8353-52bf-b043-8a582225383e', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_114', 'Bibliografía señalada por CICDE', '**AMIR. Enfermería Psiquiátrica y Salud Mental. 2014.**

**Galiana Roch, J. Enfermería Psiquiátrica. Elsevier. 2016.**', 114)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3162a4ac-2299-549f-9654-fcc5b6e7dcc1', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_115', 'Peplau', '**Peplau, H. E. Interpersonal relations: a theoretical framework for application in nursing practice. Nursing Science Quarterly. 1992. PMID 1538849.**

**Open RN / NCBI Bookshelf. Therapeutic Communication and the Nurse-Client Relationship.**', 115)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b56a89af-0586-5253-89f4-8b7cc189c9bd', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_116', 'Travelbee', '**Shelton, G. Appraising Travelbee’s Human-to-Human Relationship Model. Journal of the Advanced Practitioner in Oncology. 2016/2018 PMC.**

**Neves H, et al. Travelbee and relational AI: A triadic model for nursing. Nursing Outlook. 2026.**  
Uso: evidencia contemporánea de que el modelo persona-a-persona continúa siendo objeto de análisis; el modelo triádico propuesto por esos autores NO forma parte del temario CICDE.', 116)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5f14544a-8cea-5f4d-b5cc-59dc9805d548', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_117', 'Roy', '**Roy, C.; Corliss, C. P. The Roy Adaptation Model: theoretical update and knowledge for practice. 1993. PMID 8371956.**

**Candan HD, et al. Roy Adaptation Model: Theory-Based Knowledge and Nursing Care. Nursing Science Quarterly. 2022. PMID 35762064.**', 117)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('48b8699b-4295-55bd-b61b-8f8e47ee2df9', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_118', 'Johnson', '**Reynolds W.; Cormack D. An evaluation of the Johnson Behavioural System Model of Nursing. Journal of Advanced Nursing. 1991. PMID 1939926.**

**Derdiarian A. K. Application of the Johnson Behavioral System Model in nursing practice. 1993. PMID 8371961.**

**University of Pennsylvania / NLN curriculum archive. Dorothy Johnson Behavioral System Model for Nursing — person as behavioral system with seven subsystems.**

---', 118)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('72ee4d0e-d0b5-534b-b66b-653047aa333c', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_119', '51. Control de calidad', 'Este paquete:

- cubre exactamente los cuatro modelos exigidos por CICDE;
- corrige en el contenido los nombres mal escritos en el PDF sin ocultar la discrepancia;
- conserva las cuatro fases clásicas de Peplau y explica la equivalencia moderna;
- incluye las cinco fases de Travelbee;
- incluye estímulos y cuatro modos de Roy;
- incluye los siete subsistemas de Johnson;
- evita presentar teorías como protocolos;
- contiene 12 casos originales.

---', 119)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f573a8ec-6390-5ae6-a0b7-64dfe1786fd4', '1436ca61-228f-5608-9f94-a92e9504c48c', 'sec_120', '52. Estado para integración', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- enlazar fuentes;
- comprobar consistencia terminológica con el material docente que utilice CICDE;
- mantener visible la equivalencia de fases de Peplau para evitar confusión entre textos;
- enlazar con MENTAL-02, MENTAL-05, MENTAL-07 y MENTAL-10.', 120)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b85b8d23-ef6b-5884-b28a-372b5f6a5475', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_1', 'Cuidado de enfermería a las personas con trastornos mentales y del comportamiento', '**Área:** Enfermería en Salud y Enfermedad Mental  
**Código:** MENTAL-07  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('46eddcc6-7ea4-5cc4-814d-28ad9d8de691', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_2', '1. Alcance oficial CICDE', 'El lineamiento CICDE 2026 incluye expresamente:

1. Trastorno de esquizofrenia.
2. Depresión mayor.
3. Trastornos de ansiedad.
4. Trastorno bipolar.
5. Trastorno de personalidad.
6. Trastornos neurocognitivos.
7. Violencia.
8. Adicciones a sustancias.

Este módulo desarrolla esos ocho componentes desde el cuidado de enfermería, la seguridad, la comunicación terapéutica, la prevención de estigma, el reconocimiento de urgencias y la continuidad de cuidados.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('31a53977-b006-522e-9098-4bbc2981cc39', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_3', '2. Objetivos de aprendizaje', 'Al finalizar el tema, el estudiante debe poder:

1. Reconocer manifestaciones generales de esquizofrenia, depresión, ansiedad, bipolaridad y trastornos de personalidad.
2. Diferenciar síntomas positivos, negativos y cognitivos de esquizofrenia.
3. Identificar señales de riesgo suicida y violencia.
4. Diferenciar manía de hipomanía de forma conceptual.
5. Reconocer delirium como una urgencia clínica distinta de demencia.
6. Aplicar comunicación terapéutica ante alucinaciones y delirios.
7. Aplicar principios de desescalamiento ante agitación.
8. Reconocer intoxicación y abstinencia como posibles causas de alteración mental.
9. Identificar signos de abstinencia alcohólica grave y sobredosis por opioides.
10. Evitar estigma y lenguaje deshumanizante.
11. Integrar salud física y mental.
12. Aplicar PAE y prioridades de enfermería.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9e70365b-6994-5bef-abae-0e55d8ae660b', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_4', '3. Trastornos mentales — principio general', 'La OMS define los trastornos mentales como alteraciones clínicamente significativas de la cognición, la regulación emocional o la conducta, usualmente asociadas con malestar o deterioro del funcionamiento.', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b997d4d5-dc1c-539d-8560-2a890a3fea9e', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_5', 'Clave', 'Un diagnóstico no define a la persona.

La atención debe considerar:
- síntomas;
- función;
- seguridad;
- contexto;
- preferencias;
- salud física;
- apoyo;
- derechos.

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('04cfc577-29c5-512e-9bc9-043c3ce8b501', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_6', '4. ESQUIZOFRENIA', 'La esquizofrenia es un trastorno mental que puede producir psicosis y alteraciones importantes de la percepción de la realidad, el pensamiento, la conducta y el funcionamiento.

La OMS actualizó su ficha de esquizofrenia en octubre de 2025 y enfatiza que existen tratamientos eficaces y posibilidades reales de recuperación.

---', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f21aa458-c5b1-5ac5-9f0f-94d9f8ed860e', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_7', '5. Síntomas positivos de esquizofrenia', 'Incluyen experiencias o conductas añadidas al funcionamiento habitual, como:

- delirios;
- alucinaciones;
- pensamiento/discurso desorganizado;
- conducta marcadamente desorganizada.', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ebf4cba5-8bc5-5749-8572-8a71b2cd8016', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_8', 'Delirio', 'Creencia fija que persiste pese a evidencia contraria.', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fb8ed1ed-2165-53eb-b973-1148205c0d39', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_9', 'Alucinación', 'Percepción sin estímulo externo correspondiente.

Las auditivas son frecuentes, pero pueden ocurrir en otros sentidos.

---', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1e41060b-b8de-5822-91cd-3b507e8a967c', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_10', '6. Síntomas negativos', 'Pueden incluir:

- disminución de expresión emocional;
- pobreza del habla;
- disminución de motivación;
- reducción de placer;
- retraimiento social.', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1d76d703-2bd5-5b58-85f7-18e5a382f762', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_11', 'Importante', 'Los síntomas negativos pueden confundirse con:
- depresión;
- sedación farmacológica;
- efectos extrapiramidales;
- aislamiento ambiental.

Por eso debe valorarse el conjunto.

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('601184f6-48e6-57a6-b808-630015e7b545', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_12', '7. Síntomas cognitivos', 'Pueden afectar:

- atención;
- memoria de trabajo;
- planificación;
- velocidad de procesamiento;
- función ejecutiva.

Esto puede dificultar:
- adherencia;
- autocuidado;
- empleo;
- aprendizaje.', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f6d1edd4-d21f-5a17-bd79-358932680374', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_13', 'Enfermería', 'Usar instrucciones claras, breves y repetición/teach-back cuando sea necesario.

---', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dc602933-186f-5708-a6aa-580db4267c77', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_14', '8. Cuidado ante delirios', 'No:

- discutir agresivamente;
- ridiculizar;
- confirmar una creencia delirante como cierta.

Sí:

- reconocer emoción;
- presentar realidad de manera breve;
- mantener seguridad;
- explorar impacto;
- valorar riesgo.

Ejemplo:

> “No veo evidencia de que alguien lo esté persiguiendo, pero entiendo que usted se siente muy asustado.”

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2cebbebe-5acd-5809-8cf8-4bcea790da57', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_15', '9. Cuidado ante alucinaciones', 'Preguntar:

- qué percibe;
- qué dicen las voces;
- si ordenan hacerse daño;
- si ordenan dañar a otra persona;
- si puede resistirlas;
- qué hace para manejarlas.', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('80db5e78-5949-5e49-9f6d-5a5287984658', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_16', 'Prioridad', 'Alucinaciones de comando con intención o capacidad disminuida para resistir requieren evaluación urgente de seguridad.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2dadc36f-48b1-5848-a892-3731eaa1f8c0', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_17', '10. Esquizofrenia y salud física', 'La OMS señala que las personas con esquizofrenia tienen mayor riesgo de muerte prematura, frecuentemente asociado a enfermedades físicas.

Enfermería debe vigilar:

- peso;
- glucosa;
- lípidos;
- presión;
- tabaquismo;
- actividad física;
- infecciones;
- efectos de medicamentos.

La salud mental no debe hacer invisible la salud física.

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4e2273ab-5cf4-5d36-b431-a7f4c0e645b0', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_18', '11. DEPRESIÓN MAYOR', 'La OMS describe la depresión como un trastorno caracterizado por estado de ánimo deprimido o pérdida del interés/placer durante períodos prolongados, con posible deterioro funcional.

Puede acompañarse de:

- alteración del sueño;
- cambios de apetito;
- fatiga;
- culpa;
- dificultad de concentración;
- desesperanza;
- ideas de muerte.

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ec617414-6d46-5ec9-b5bc-6f420b029b56', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_19', '12. Depresión vs tristeza', 'La tristeza es una emoción humana.

La depresión clínica implica una combinación de:

- síntomas persistentes;
- intensidad;
- afectación funcional;
- duración;
- contexto;
- posible riesgo suicida.', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8125682f-4dd4-5e8f-adb1-520443e6d73a', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_20', 'Clave', 'No diagnosticar depresión únicamente porque una persona está triste.

---', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5de3e5db-8b5a-5d1e-95c6-d2665f1c1cda', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_21', '13. Valoración de depresión', 'Explorar:

- estado de ánimo;
- interés;
- sueño;
- apetito;
- energía;
- concentración;
- culpa;
- psicomotricidad;
- funcionamiento;
- sustancias;
- síntomas físicos;
- ideación suicida.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dca260af-16ba-5455-9f80-beb5b1bd3cb4', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_22', 'Importante', 'Preguntar directamente por suicidio no “implanta” la idea.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('59d377b7-1252-5ae2-9191-2ac955cde488', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_23', '14. Prioridad ante depresión', 'Expresiones como:

- “no quiero vivir”;
- “soy una carga”;
- “sería mejor no despertar”;

requieren explorar:

- ideación;
- plan;
- intención;
- acceso a medios;
- intentos previos;
- factores protectores.

---', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('915a3bc7-3c07-5805-9198-39e101e74e96', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_24', '15. Cuidado de enfermería en depresión', '- comunicación breve y empática;
- permitir tiempo para responder;
- estructurar actividades realistas;
- apoyar autocuidado;
- vigilar nutrición y sueño;
- fomentar participación gradual;
- administrar medicamentos prescritos;
- vigilar efectos;
- mantener seguridad;
- planificar continuidad.', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e6a5b876-ab18-5a2d-97f7-4d132d39c2ba', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_25', 'Error', 'Exigir que la persona “ponga de su parte” o “piense positivo”.

---', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4555304e-12d3-5e02-9bbd-9166f9e49881', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_26', '16. TRASTORNOS DE ANSIEDAD', 'La ansiedad puede ser normal.

Los trastornos de ansiedad implican miedo/preocupación persistente o excesiva con malestar o deterioro funcional.

Pueden incluir:

- ansiedad generalizada;
- pánico;
- fobias;
- ansiedad social;
- agorafobia.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1a0c247e-a418-55fc-8263-25fa1a861658', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_27', '17. Cuidado ante ansiedad', '', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('65e297b6-85a8-5217-b62a-860a3c47ab36', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_28', 'Leve/moderada', '- escuchar;
- identificar desencadenantes;
- educación;
- respiración;
- resolución de problemas.', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fa586514-69f2-5c85-a5c1-4b2f3237f860', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_29', 'Severa/pánico', '- permanecer con la persona;
- ambiente tranquilo;
- instrucciones simples;
- reducir estímulos;
- valorar causas médicas;
- mantener seguridad.', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eea1802c-c46b-5653-8cd8-e88285a55a82', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_30', 'Seguridad', 'Dolor torácico, disnea o palpitaciones de nueva aparición no deben asumirse como ansiedad sin valoración.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0bd2da30-90d7-568c-9e37-6b5b02aff879', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_31', '18. TRASTORNO BIPOLAR', 'La OMS actualizó su ficha en septiembre de 2025.

El trastorno bipolar se caracteriza por episodios de:

- manía o hipomanía;
- depresión.

Puede afectar:
- ánimo;
- energía;
- actividad;
- pensamiento;
- conducta.

---', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('236923a9-2e96-5337-94e6-69e5a540a94b', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_32', '19. Manía', 'Puede incluir:

- ánimo elevado, expansivo o muy irritable;
- aumento marcado de energía;
- disminución de necesidad de sueño;
- habla acelerada;
- ideas rápidas;
- distractibilidad;
- grandiosidad;
- conducta impulsiva o de riesgo.

Puede producir:
- deterioro grave;
- psicosis;
- hospitalización;
- peligro.

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1069e57c-ebb1-5637-9822-d968f8f93253', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_33', '20. Hipomanía', 'Tiene características semejantes a manía pero:

- menor intensidad;
- menor deterioro;
- no debe incluir psicosis;
- no suele requerir hospitalización por sí misma.', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('82812776-170a-555a-9f0a-563a648df68f', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_34', 'Clave', 'Manía y hipomanía no son simplemente “estar feliz”.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('91996543-bf3e-55b9-b9cc-27d9355895a5', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_35', '21. Cuidado ante manía', '- reducir estímulos;
- límites claros y consistentes;
- frases breves;
- evitar confrontación innecesaria;
- alimentación/hidratación fáciles de consumir si la persona no se sienta;
- vigilar sueño;
- observar impulsividad;
- controlar riesgo sexual/financiero cuando sea relevante;
- administrar tratamiento indicado;
- mantener seguridad.

---', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f5ddf2f2-a747-5268-bfa6-fac23abf6d16', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_36', '22. Bipolaridad y suicidio', 'Los episodios depresivos y mixtos pueden asociarse con riesgo suicida.

No asumir que una persona con manía está protegida contra suicidio.

Evaluar:
- impulsividad;
- desesperanza;
- agitación;
- psicosis;
- acceso a medios.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b21d08c7-b700-5796-8300-b0cf57ce89d2', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_37', '23. Antidepresivos y bipolaridad', 'En una persona con síntomas depresivos debe considerarse antecedente de:

- manía;
- hipomanía;
- historia familiar relevante.

El uso de antidepresivos en trastorno bipolar debe seguir evaluación especializada porque pueden existir riesgos de activación o cambio de fase.

Este punto se desarrolla farmacológicamente en **MENTAL-08**.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c812c80a-36d4-5e00-a7fe-46430a2dac40', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_38', '24. TRASTORNOS DE PERSONALIDAD', 'Son patrones persistentes de experiencia interna y comportamiento que pueden afectar:

- relaciones;
- regulación emocional;
- identidad;
- impulsividad;
- funcionamiento.', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1072d2f4-e7b6-5b8e-91e1-44746f39a043', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_39', 'Importante', 'No etiquetar a una persona como “manipuladora” o “difícil”.

Describir conductas observables.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5044b7de-d28b-5876-8d39-c264c0be6b4f', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_40', '25. Agrupación conceptual clásica', 'En DSM se agrupan de forma tradicional en tres clusters:', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4d00edb1-199b-5358-8697-4e315a463d71', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_41', 'A', 'Patrones excéntricos o extraños.', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a26fda7e-0e94-5f12-8fe9-51f60d624f8b', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_42', 'B', 'Patrones dramáticos, emocionales o impulsivos.', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d78feec9-0d53-5f77-9bf1-e588e6343649', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_43', 'C', 'Patrones ansiosos o temerosos.', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e3a8681b-bf01-59a0-8f84-a1e3306a2011', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_44', 'Nota', 'Para CICDE interesa reconocer categorías y cuidado; no memorizar criterios diagnósticos completos sin fuente autorizada.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8db07710-b9a2-562c-a7c0-eb25193d11f2', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_45', '26. Trastorno límite de personalidad — cuidado de enfermería', 'Puede asociarse con:

- inestabilidad emocional;
- relaciones intensas;
- miedo al abandono;
- impulsividad;
- autolesión;
- riesgo suicida.

Cuidados:

- límites claros;
- coherencia del equipo;
- evitar división del personal;
- validar emoción;
- evaluar riesgo;
- no reforzar conductas peligrosas;
- favorecer habilidades de regulación.', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aca6ca22-d80e-5e10-a271-fbbeaee84712', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_46', 'Clave', 'Autolesión siempre requiere valoración de seguridad; no debe desestimarse como “búsqueda de atención”.

---', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9993ce6a-cf66-5be9-b753-7def6813f923', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_47', '27. Límites en trastornos de personalidad', 'Los límites terapéuticos deben ser:

- claros;
- consistentes;
- respetuosos;
- explicados;
- aplicados por el equipo de forma congruente.

No usar límites como castigo.

---', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('22661131-0490-5f9a-b062-c2ea4bc22dbb', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_48', '28. TRASTORNOS NEUROCOGNITIVOS', 'Incluyen alteraciones de:

- memoria;
- atención;
- lenguaje;
- percepción;
- función ejecutiva;
- capacidad para actividades cotidianas.

Dos conceptos muy importantes para enfermería:

- delirium;
- demencia.

---', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a7ef4770-ea2f-5002-80b3-8a3b6a738018', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_49', '29. Delirium', 'Es un cambio agudo de atención y conciencia que suele fluctuar.

Puede asociarse con:

- infección;
- medicamentos;
- alteraciones metabólicas;
- dolor;
- hipoxia;
- abstinencia;
- retención urinaria;
- deshidratación.', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f026c51a-6b51-5ffb-9e5b-5cfcd21c65af', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_50', 'Prioridad', '**Delirium es una urgencia clínica hasta demostrar la causa.**

No asumir que es “demencia”.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b2f85eb5-616b-5d5d-9d2a-85a01a2ee042', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_51', '30. Demencia', 'La OMS actualizó su ficha en julio de 2026.

La demencia afecta:

- memoria;
- pensamiento;
- funcionamiento diario.

Suele:
- progresar con el tiempo;
- ser más frecuente en personas mayores;
- no ser una consecuencia inevitable del envejecimiento.

---', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d9ece4e3-21e6-5c66-9f16-f301c14a0bd9', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_52', '31. Delirium vs demencia', '', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c13f2820-f4c3-5c01-8076-9683da532506', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_53', 'Delirium', '- inicio agudo;
- fluctuación;
- atención alterada;
- buscar causa médica.', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2344e3ba-cf63-5a8c-8e23-0e84686a1a1c', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_54', 'Demencia', '- evolución generalmente crónica/progresiva;
- deterioro cognitivo;
- conciencia relativamente preservada en etapas tempranas.', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fe01d89e-e53a-5f58-aa71-6febc8bdecc8', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_55', 'Clave de examen', 'Cambio mental **agudo y fluctuante** = pensar primero en delirium.

---', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2bace1d2-05cb-5f85-9612-abf86c1604d5', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_56', '32. Cuidado de persona con deterioro cognitivo', '- ambiente tranquilo;
- orientación;
- reloj/calendario;
- lentes/audífonos;
- hidratación;
- movilidad;
- sueño;
- prevención de caídas;
- revisar medicamentos;
- mantener rutinas;
- apoyo familiar;
- evitar restricciones innecesarias.

---', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ea617831-a148-5c01-bb5a-acee344caecf', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_57', '33. VIOLENCIA', 'La violencia puede ser:

- autoinfligida;
- interpersonal;
- colectiva.

En salud mental también se evalúa:
- violencia de pareja;
- violencia sexual;
- agresión en servicios;
- maltrato de personas vulnerables.', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('63b3ec90-169d-578a-bbe9-14113b640cb1', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_58', 'Clave', 'Tener un trastorno mental no significa automáticamente ser violento.

---', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('991c7308-1eff-5d94-ad60-a828f33abd35', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_59', '34. Violencia contra la mujer', 'La OMS actualizó esta ficha en junio de 2026 y reconoce la violencia de pareja y sexual como un problema grave de salud pública y derechos humanos.

Puede producir:

- lesiones;
- depresión;
- ansiedad;
- estrés postraumático;
- consumo de sustancias;
- intentos suicidas;
- consecuencias sexuales y reproductivas.

---', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('951dc800-0e07-5d4f-bc32-09dcad1c560e', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_60', '35. Atención ante violencia', '- entrevistar en privacidad;
- escuchar;
- creer y validar el relato sin interrogar culpabilizando;
- evaluar seguridad inmediata;
- atender lesiones;
- documentar objetivamente;
- activar rutas;
- respetar autonomía dentro del marco legal;
- no confrontar al agresor frente a la víctima.

---', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('15db010d-6ac3-5db3-be24-bfc4cf210888', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_61', '36. Agitación y violencia en servicios', 'NICE recomienda priorizar **desescalamiento** antes de medidas restrictivas cuando sea posible.

Principios:

- detectar signos tempranos;
- mantener espacio personal;
- una persona lidera comunicación;
- tono calmado;
- evitar provocación;
- ofrecer opciones;
- reducir estímulos;
- pedir apoyo.

---', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('998c6062-7480-533c-96ea-0e9639a70d69', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_62', '37. Restricciones', 'Solo cuando:

- existe riesgo real de daño;
- las estrategias menos restrictivas han fallado;
- están autorizadas por normativa;
- se aplican proporcionalmente;
- durante el menor tiempo posible;
- con vigilancia.', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6f9daef3-2460-59ad-9e04-45c19bd37993', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_63', 'Nunca', 'No usar restricción:
- como castigo;
- para humillar;
- para establecer dominio.

---', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('823a33c6-e710-582b-b61b-c18615f9a848', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_64', '38. ADICCIONES A SUSTANCIAS', 'Las sustancias psicoactivas afectan procesos como:

- percepción;
- conciencia;
- cognición;
- ánimo.

El consumo problemático puede producir:

- intoxicación;
- dependencia;
- abstinencia;
- deterioro físico;
- deterioro social y laboral.

---', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0a295e64-02c8-561c-8ebd-372afe51e183', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_65', '39. Atención sin estigma en adicciones', 'Evitar términos como:

- “drogadicto”;
- “vicioso”;
- “borracho”.

Preferir:

- persona con trastorno por consumo de sustancias;
- persona que usa sustancias.', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('08443eb1-6562-5251-9aa2-6ebe22f6cacc', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_66', 'Principio', 'El tratamiento debe ser clínico, no moralizante.

---', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b6914be4-dff1-5378-9dab-bd74c795e2bd', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_67', '40. Valoración de consumo', 'Preguntar:

- sustancia;
- cantidad;
- frecuencia;
- última dosis;
- vía;
- mezclas;
- tolerancia;
- abstinencia previa;
- sobredosis;
- tratamientos;
- impacto funcional;
- riesgo;
- embarazo;
- medicamentos.

---', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4abf1a06-f808-5cf5-8012-3ead6c6bfd9c', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_68', '41. Alcohol — intoxicación y abstinencia', 'La OMS reconoce el alcohol como sustancia psicoactiva y tóxica con capacidad de producir dependencia.', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e2db0ac9-4d72-5ca2-a39c-ba4232b38244', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_69', 'Intoxicación', 'Puede causar:
- desinhibición;
- habla alterada;
- ataxia;
- alteración de conciencia;
- depresión respiratoria en casos graves.', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0accced5-d66a-5ff5-89b9-4a02b180908e', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_70', 'Abstinencia', 'Puede causar:
- temblor;
- sudoración;
- ansiedad;
- taquicardia;
- insomnio;
- náuseas.

---', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a2d02258-b7d5-51f3-9b1e-b11c6aeed899', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_71', '42. Abstinencia alcohólica grave', 'Puede evolucionar a:

- convulsiones;
- alucinaciones;
- delirium tremens;
- hiperactividad autonómica;
- inestabilidad.', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('14e4c6e6-bb6a-5fc7-aedd-b7b5f1c0350d', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_72', 'Prioridad', 'Ante abstinencia grave:
- ABC;
- monitorización;
- tratamiento protocolizado;
- tiamina según indicación;
- corrección de líquidos/electrolitos;
- prevención de lesiones.

No manejar de forma improvisada.

---', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f9cd4f6e-d792-5b6e-8d13-88778462af49', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_73', '43. Opioides', 'La intoxicación/sobredosis puede producir:

- disminución de conciencia;
- respiración lenta o ausente;
- miosis, aunque no siempre;
- cianosis;
- muerte.', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('db63f601-177a-5431-ac8d-b04535fb2fbe', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_74', 'Prioridad', '- vía aérea;
- ventilación;
- respuesta de emergencia;
- naloxona según protocolo;
- observación posterior.', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e55d59d1-1a18-5ab0-943a-0f193c555cdf', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_75', 'Clave', 'La ventilación y soporte vital no deben retrasarse esperando naloxona.

---', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a4d61e06-0cc4-51a4-8d1c-9e734e89314e', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_76', '44. Estimulantes', 'Sustancias como cocaína/metanfetamina pueden asociarse con:

- agitación;
- taquicardia;
- hipertensión;
- hipertermia;
- paranoia;
- convulsiones;
- arritmias.', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a620d98d-4a16-5d56-805a-5796699bad4e', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_77', 'Prioridad', 'No asumir que todo es “psiquiátrico”.

Evaluar:
- temperatura;
- cardiovascular;
- neurología;
- toxicidad.

---', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('75949e64-6de6-5724-9875-c51939465f6e', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_78', '45. Cannabis y otras sustancias', 'Pueden producir:

- ansiedad;
- alteración perceptiva;
- deterioro psicomotor;
- psicosis en personas susceptibles;
- náuseas/vómitos en determinados patrones.

El cuidado depende de:
- sustancia;
- dosis;
- síntomas;
- comorbilidades;
- combinación con otras sustancias.

---', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('56df4b08-584a-5cbd-85c7-43104c0e0b35', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_79', '46. Reducción de daños y tratamiento', 'Las respuestas eficaces pueden incluir:

- tamizaje;
- intervención breve;
- reducción de riesgos;
- tratamiento farmacológico cuando existe;
- terapia;
- apoyo social;
- seguimiento;
- prevención de sobredosis.

La OMS 2024 destaca que existe una gran brecha mundial de acceso a tratamiento para trastornos por consumo de alcohol y drogas.

---', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('79dd8d30-dacd-5803-934f-a45de8b619db', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_80', '47. Diagnósticos diferenciales críticos', 'Ante cambios de conducta considerar también:

- hipoglucemia;
- hipoxia;
- infección;
- alteraciones electrolíticas;
- ACV;
- trauma;
- medicamentos;
- intoxicación;
- abstinencia;
- delirium.', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('87c054ed-78df-5365-9310-17b0070841c5', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_81', 'Regla', 'No atribuir automáticamente un cambio conductual a “enfermedad mental”.

---', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('46c1286e-f20b-5f0a-bd93-47584671f556', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_82', '48. PAE', '', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('36b13db8-b168-59c1-8313-900fb3f1459c', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_83', 'Valoración', '- apariencia;
- conducta;
- ánimo/afecto;
- pensamiento;
- percepción;
- cognición;
- juicio;
- sustancias;
- función;
- salud física;
- apoyo;
- riesgo.', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('59268ab0-b29d-5e27-9c07-42b31e0c4f66', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_84', 'Diagnóstico/juicio', '- riesgo de autolesión;
- riesgo de violencia;
- procesos de pensamiento/percepción alterados;
- afrontamiento alterado;
- autocuidado;
- sueño;
- nutrición;
- interacción social.', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d0e013b8-5f02-5a53-b359-3275a40c56f3', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_85', 'Planificación', 'Priorizar:
- ABC;
- suicidio;
- violencia;
- delirium;
- intoxicación/abstinencia;
- necesidades básicas.', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('146002eb-04c5-528e-8caa-6f555f36695c', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_86', 'Implementación', '- comunicación;
- ambiente seguro;
- medicamentos;
- monitorización;
- educación;
- apoyo;
- referencia;
- continuidad.', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ab7b900b-e592-5ada-8c7c-a70bf5f0f87a', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_87', 'Evaluación', '- seguridad;
- síntomas;
- función;
- adherencia;
- efectos adversos;
- apoyo.

---', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b82bba52-c7e2-5b73-945b-81ed35b7231f', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_88', '49. Situaciones tipo examen', '', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c55d61cc-5f4a-55e5-8caf-e36452fdc873', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_89', 'Caso 1 — Alucinaciones', 'Paciente dice que voces le ordenan saltar por la ventana.

**Prioridad:** valorar intención/capacidad de resistir, asegurar ambiente y activar atención urgente.', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('98927187-7d2c-5f2a-8188-5b606c04cfc7', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_90', 'Caso 2 — Delirio', 'Paciente asegura que el equipo lo envenena.

**Conducta:** no confirmar ni ridiculizar; reconocer miedo, presentar realidad y valorar seguridad.', 90)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c168e75b-98ba-57ae-9233-bcd910c65455', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_91', 'Caso 3 — Depresión', 'Paciente dice: “Todos estarían mejor sin mí”.

**Prioridad:** evaluación directa de riesgo suicida.', 91)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('54000bf4-4aec-5f3d-9499-d255e9ff5c89', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_92', 'Caso 4 — Ansiedad', 'Paciente con “ataque de ansiedad” presenta dolor torácico nuevo y diaforesis.

**Prioridad:** descartar emergencia médica.', 92)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d91245f0-3788-5d83-8f4b-b71ed2dbc3b7', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_93', 'Caso 5 — Manía', 'Paciente lleva cuatro noches casi sin dormir, gasta grandes cantidades y presenta grandiosidad.

**Interpretación:** posible episodio maníaco; valorar seguridad y tratamiento.', 93)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3de7a9f3-85ad-5e31-9546-bee1db62ef5a', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_94', 'Caso 6 — Personalidad', 'Paciente con autolesión es descrito como “solo busca atención”.

**Error:** toda autolesión requiere valoración de riesgo y atención sin estigma.', 94)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eb639ec4-ce77-569e-b303-9fa0799e8667', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_95', 'Caso 7 — Delirium', 'Adulto mayor con infección se desorienta de forma súbita y fluctúa durante el día.

**Prioridad:** delirium y causa médica.', 95)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a521f44d-2b22-5353-b0f3-920585dabe6d', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_96', 'Caso 8 — Demencia', 'Familia afirma que todo deterioro cognitivo es “normal por la edad”.

**Educación:** demencia no es envejecimiento normal.', 96)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('54710c79-30c5-5b6d-9816-85f05a628a2b', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_97', 'Caso 9 — Violencia', 'Paciente agitado empieza a elevar la voz.

**Conducta:** intervención temprana, espacio, un comunicador principal y desescalamiento.', 97)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('83c5229a-8773-5548-9f1f-471791dc1275', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_98', 'Caso 10 — Violencia de pareja', 'Paciente revela agresiones de su pareja.

**Conducta:** privacidad, seguridad, atención, documentación y ruta de apoyo.', 98)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8f7d3229-ae17-50b7-ab7d-dec70a859fa9', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_99', 'Caso 11 — Alcohol', 'Paciente dependiente deja de beber y presenta temblor, taquicardia y alucinaciones.

**Prioridad:** posible abstinencia grave; manejo médico protocolizado.', 99)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d07720a2-2cd9-5bc1-aa31-4eea9bc74a9d', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_100', 'Caso 12 — Opioides', 'Paciente está inconsciente con respiración de 5/min tras consumo de opioides.

**Prioridad:** ventilación/ABC + naloxona según protocolo y respuesta de emergencia.

---', 100)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ae07de6e-e6e2-58c4-a461-b18f1dd9d372', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_101', '50. Errores frecuentes', '1. Confirmar delirios.
2. Ignorar contenido de alucinaciones.
3. Pedir a persona deprimida que “se anime”.
4. Asumir que pánico explica cualquier dolor torácico.
5. Confundir manía con felicidad normal.
6. Etiquetar a personas con trastorno de personalidad.
7. Desestimar autolesión.
8. Confundir delirium y demencia.
9. Normalizar demencia por edad.
10. Suponer que trastorno mental = violencia.
11. Usar restricción como castigo.
12. Moralizar adicciones.
13. No preguntar última dosis de sustancia.
14. Ignorar abstinencia.
15. Esperar naloxona sin ventilar a paciente apneico.

---', 101)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('84b65b49-9402-5f8e-9713-b6d3d356fb8a', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_102', '51. Qué memorizar', '**Esquizofrenia: delirios + alucinaciones + desorganización + síntomas negativos/cognitivos.**

**Alucinación de comando = valorar riesgo inmediatamente.**

**Depresión: siempre explorar suicidio cuando hay desesperanza.**

**Ansiedad severa = mensajes breves + seguridad + descartar causas médicas.**

**Manía = ánimo/energía elevados o irritables + menor sueño + impulsividad/deterioro.**

**Delirium = AGUDO + FLUCTUANTE + alteración de atención.**

**Demencia ≠ envejecimiento normal.**

**Agitación → desescalamiento primero cuando sea seguro.**

**Restricción = último recurso proporcional, nunca castigo.**

**Adicciones = problema clínico, no moral.**

**Abstinencia alcohólica grave puede causar convulsiones/delirium.**

**Sobredosis opioide = respiración primero + naloxona según protocolo.**

---', 102)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('33de596b-8c21-5f6b-aa76-26bba2e604af', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_103', '52. Fuentes y validación', '', 103)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bca02bb2-d0f1-50c4-aa5a-a5ea2486d114', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_104', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 104)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d7cdf64c-d561-5b25-80ba-66d2827e50de', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_105', 'Bibliografía señalada por CICDE', '**AMIR. Enfermería Psiquiátrica y Salud Mental. 2014.**

**Galiana Roch, J. Enfermería Psiquiátrica. Elsevier. 2016.**

**DSM-5. Manual Diagnóstico y Estadístico de los Trastornos Mentales. Referenciado por CICDE.**', 105)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dce218ae-cea6-583b-8ee0-da1c7f6e180b', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_106', 'Fuentes complementarias actuales', '**World Health Organization. Schizophrenia. 6 de octubre de 2025.**

**World Health Organization. Depressive disorder (depression). 29 de agosto de 2025.**

**World Health Organization. Anxiety disorders. 8 de septiembre de 2025.**

**World Health Organization. Bipolar disorder. 8 de septiembre de 2025.**

**World Health Organization. Dementia. Actualizado 3 de julio de 2026.**

**World Health Organization. Violence against women. 18 de junio de 2026.**

**World Health Organization. Alcohol. 2024.**

**World Health Organization. Global status report on alcohol and health and treatment of substance use disorders. 2024.**

**NICE NG10. Violence and aggression: short-term management in mental health, health and community settings.**

---', 106)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('84926fb5-8a1c-51c9-882b-47d3324c74f9', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_107', '53. Control de calidad', 'Este paquete:

- cubre los ocho subtemas exactos del CICDE;
- incorpora fuentes OMS 2025–2026;
- enfatiza recuperación y no estigma;
- prioriza suicidio, violencia, delirium, intoxicación y abstinencia;
- diferencia delirium de demencia;
- incorpora desescalamiento antes de restricción;
- contiene 12 casos originales;
- no reproduce criterios DSM completos.

---', 107)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ce7eb8a0-ffbe-582c-af47-138545678a49', 'cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'sec_108', '54. Estado para integración', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- enlazar fuentes;
- validar rutas nacionales específicas de adicciones y violencia cuando se incorporen a la plataforma;
- mantener farmacoterapia detallada en MENTAL-08;
- enlazar con MENTAL-02, MENTAL-05, MENTAL-08 y MENTAL-10.', 108)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('724bc40c-f9c4-5d73-8ecd-a3c5a0976928', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_1', 'Farmacología: antidepresivos, ansiolíticos y antipsicóticos', '**Área:** Enfermería en Salud y Enfermedad Mental  
**Código:** MENTAL-08  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2a3a24d1-6035-58bc-a595-6e188a7cb6aa', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_2', '1. Alcance oficial CICDE', 'El lineamiento CICDE 2026 incluye expresamente:

**“Farmacología (antidepresivos, ansiolíticos, antipsicóticos)”.**

Este módulo desarrolla:

- clases principales;
- indicaciones generales;
- efectos adversos frecuentes;
- interacciones;
- riesgos graves;
- monitorización;
- adherencia;
- retirada segura;
- educación al paciente;
- prioridades de enfermería;
- síndrome serotoninérgico;
- síndrome neuroléptico maligno;
- efectos extrapiramidales;
- riesgo metabólico;
- clozapina;
- benzodiazepinas.', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('39852961-2e8f-513b-bcb8-8c56bfb80254', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_3', 'Límites', 'No se pretende memorizar dosis universales ni sustituir prescripción/protocolo institucional.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a8c7fc61-9286-5c18-b2d8-e68d4e292278', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_4', '2. Objetivos de aprendizaje', 'Al finalizar el tema, el estudiante debe poder:

1. Reconocer las principales clases de antidepresivos.
2. Explicar por qué el beneficio antidepresivo no suele ser inmediato.
3. Reconocer síndrome serotoninérgico.
4. Identificar riesgos de retirada abrupta.
5. Reconocer efectos anticolinérgicos y cardiotoxicidad de tricíclicos.
6. Reconocer interacciones críticas con IMAO.
7. Explicar riesgos y cuidados con benzodiazepinas.
8. Reconocer depresión respiratoria al combinar benzodiazepinas con opioides/alcohol.
9. Identificar efectos extrapiramidales de antipsicóticos.
10. Reconocer síndrome neuroléptico maligno.
11. Monitorizar efectos metabólicos y cardiovasculares.
12. Reconocer el riesgo hematológico de clozapina.
13. Educar sobre adherencia y seguridad.
14. Integrar farmacovigilancia al PAE.

---', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b9936b70-fd3d-5ac5-bfff-fd30d0d027a3', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_5', '3. Principios generales de psicofarmacología', 'Antes de administrar/educar:

- verificar medicamento;
- indicación;
- dosis;
- horario;
- alergias;
- interacciones;
- embarazo/lactancia cuando corresponda;
- función renal/hepática;
- consumo de alcohol/sustancias;
- respuesta previa;
- riesgo suicida.', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('15696bd8-e8a0-5dd4-a9bd-2fb88d6772ea', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_6', 'Clave', 'No suspender bruscamente un psicofármaco solo porque el paciente “se siente mejor”.

---', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('96d75afa-264b-58ea-928c-6b59232733a8', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_7', '4. ANTIDEPRESIVOS — clases', 'Principales grupos:

- ISRS/SSRIs;
- IRSN/SNRIs;
- tricíclicos;
- inhibidores de monoaminooxidasa (IMAO);
- antidepresivos atípicos.

Ejemplos orientadores:', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3a47c9de-81eb-5812-9d8f-08c144084bba', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_8', 'ISRS', '- sertralina;
- fluoxetina;
- escitalopram;
- citalopram;
- paroxetina.', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b8eadcd3-57a6-5c4d-a86d-220d0fe80415', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_9', 'IRSN', '- venlafaxina;
- duloxetina;
- desvenlafaxina.', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a453e1c1-3a13-544b-acb6-14652f68a6dd', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_10', 'Tricíclicos', '- amitriptilina;
- nortriptilina;
- imipramina.', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('557e097d-c50d-5fb2-8f30-b0b9f4885250', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_11', 'IMAO', '- fenelzina;
- tranilcipromina.', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('59e82fdb-5bd3-5dcc-9a07-2748b800893f', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_12', 'Atípicos', '- bupropión;
- mirtazapina;
- otros según indicación.

---', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b8a729a0-0fbc-5f86-8399-205787b8056b', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_13', '5. Inicio de acción de antidepresivos', 'El efecto terapéutico completo suele requerir tiempo.', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('32c3a77d-c6fe-50ad-9f05-2873ea5ec5b9', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_14', 'Educación', 'Explicar que:

- algunos efectos adversos pueden aparecer antes que el beneficio;
- la mejoría puede ser gradual;
- no duplicar dosis;
- no suspender sin orientación;
- mantener seguimiento.

NICE destaca el desarrollo gradual del efecto y la importancia de monitorizar respuesta y efectos adversos.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cea79431-475e-524d-8b52-32d24665fb53', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_15', '6. ISRS — efectos frecuentes', 'Pueden incluir:

- náuseas;
- diarrea;
- cefalea;
- insomnio o somnolencia;
- sudoración;
- disfunción sexual;
- inquietud inicial.', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2ec5590c-70af-5748-bd97-8ce3d316aa8a', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_16', 'Enfermería', 'Valorar:
- adherencia;
- sueño;
- sexualidad;
- agitación;
- interacción con otros serotonérgicos.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0256bb49-e244-59fb-b563-607e2bb7dd8e', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_17', '7. Riesgo suicida al iniciar antidepresivo', 'La depresión misma se asocia con riesgo suicida.

Además, el etiquetado de varios antidepresivos advierte un aumento de pensamientos/conductas suicidas en algunos niños, adolescentes y adultos jóvenes, especialmente al inicio o al cambiar dosis.', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b3d56135-8d9b-5f47-81d3-9de78cc7c8ce', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_18', 'Enfermería', 'Vigilar:
- empeoramiento;
- nueva agitación;
- impulsividad;
- ideación suicida;
- cambios conductuales.', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7c3e88eb-b40e-5984-b27f-28d107bdaeb2', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_19', 'Clave', 'No interpretar esta advertencia como razón para negar un tratamiento indicado; implica **monitorización y educación**.

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c360e2b7-96b6-53a3-a9d8-25b881b379e1', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_20', '8. Síndrome serotoninérgico', 'Puede ocurrir por exceso de actividad serotoninérgica, especialmente con combinaciones de medicamentos.

Manifestaciones:', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9dcddac8-9488-57d8-9daf-7b0f932de6e7', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_21', 'Mentales', '- agitación;
- confusión.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a77c1641-5f59-545a-b69a-4d54d328e9a3', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_22', 'Autonómicas', '- fiebre;
- sudoración;
- taquicardia;
- hipertensión;
- diarrea.', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c8e450b3-190b-5c3f-8720-c3367e7c1905', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_23', 'Neuromusculares', '- temblor;
- hiperreflexia;
- clonus;
- rigidez.', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bc5a7bfc-74b5-53e5-989b-63764759fbf0', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_24', 'Clave de examen', '**Clonus + hiperreflexia + hipertermia/agitación** en paciente con fármacos serotoninérgicos debe hacer sospechar síndrome serotoninérgico.

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('78051abe-7258-5e96-a591-476dcd72c1ce', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_25', '9. Medicamentos que pueden aumentar riesgo serotoninérgico', 'Ejemplos:

- ISRS;
- IRSN;
- IMAO;
- algunos tricíclicos;
- tramadol;
- linezolid;
- triptanes;
- litio;
- buspirona;
- dextrometorfano;
- hierba de San Juan;
- otros.', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('507d281a-b668-578a-8c19-adebde23ff9f', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_26', 'Seguridad', 'Revisar siempre:
- receta;
- medicamentos OTC;
- suplementos;
- productos herbales.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('10286245-c1fc-51c1-b0d9-477d323168ec', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_27', '10. Manejo del síndrome serotoninérgico', 'Es una urgencia potencial.

Prioridades:

- suspender agentes serotoninérgicos bajo indicación médica;
- ABC;
- temperatura;
- monitorización;
- líquidos;
- control de agitación;
- tratamiento específico según gravedad/protocolo.

No administrar más agentes causales.

---', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('32dbfa93-3389-571d-9d79-4916104c33ae', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_28', '11. Retirada de antidepresivos', 'NICE señala que síntomas de retirada pueden ocurrir con múltiples clases.

Pueden incluir:

- mareo;
- ansiedad;
- irritabilidad;
- síntomas tipo influenza;
- insomnio;
- náuseas;
- sensaciones eléctricas;
- cambios de ánimo.', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8075a227-80fa-5eca-990d-3896e475580d', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_29', 'Clave', 'La retirada debe hacerse de forma gradual e individualizada cuando corresponda.

Puede requerir semanas o meses en algunas personas.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c0d3be00-fcc1-5bf1-b73d-5f4459d8ac43', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_30', '12. Tricíclicos', 'Efectos importantes:

- sedación;
- boca seca;
- estreñimiento;
- retención urinaria;
- visión borrosa;
- hipotensión ortostática;
- taquicardia.', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b80f1526-998f-566b-b8e2-def38a55fda0', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_31', 'Sobredosis', 'Puede causar:
- arritmias;
- hipotensión;
- convulsiones;
- coma.', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0b85d10a-85e5-5f4d-abb8-c64ed5c6a187', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_32', 'Seguridad', 'Una sobredosis de tricíclicos puede ser letal.

En personas con alto riesgo suicida, la cantidad dispensada y seguridad del acceso pueden ser relevantes.

---', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1b1c6fba-6e4a-5d44-95ed-e267f9a29c28', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_33', '13. IMAO', 'Riesgos:

- múltiples interacciones;
- hipotensión;
- crisis hipertensiva con tiramina en determinados IMAO irreversibles;
- síndrome serotoninérgico con combinaciones contraindicadas.', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aff71cce-5760-5f9b-a160-71db0569333a', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_34', 'Alimentos ricos en tiramina', 'Según producto y protocolo pueden requerir restricción de:
- quesos curados;
- carnes fermentadas/curadas;
- ciertos productos fermentados.', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('179f1d57-d651-5e39-bba5-a0d25faf674d', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_35', 'Clave', 'IMAO + medicamentos serotoninérgicos puede ser peligroso.

Los períodos de lavado dependen del medicamento específico.

---', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('538b6451-c52c-5aa9-896a-6dc0ace12dfa', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_36', '14. Bupropión', 'Características:

- menor carga de efectos sexuales que muchos ISRS;
- puede ser activador;
- también tiene indicaciones no depresivas en algunos países.', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9ccf64b5-12f7-50bc-8959-e2f00c30f6aa', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_37', 'Riesgo', 'Puede reducir umbral convulsivo.

Precaución en:
- trastornos convulsivos;
- algunas condiciones alimentarias;
- retirada abrupta de alcohol/sedantes;
- otros factores de riesgo.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('696ea601-823e-56d0-8d54-f688876f1b40', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_38', '15. Mirtazapina', 'Puede asociarse con:

- sedación;
- aumento del apetito;
- aumento de peso.

Puede ser útil o problemático según las características del paciente.', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6f41b4bb-85c5-5cfb-a981-d64ff4e44c27', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_39', 'Enfermería', 'Monitorizar:
- somnolencia;
- peso;
- respuesta;
- seguridad de caídas.

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('401bf3be-d27a-5e38-b46e-6a47051a8540', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_40', '16. ANSIOlÍTICOS', 'Los ansiolíticos incluyen diferentes grupos.

Para CICDE el grupo de alta relevancia es:

- benzodiazepinas.

También existen:
- buspirona;
- algunos antidepresivos usados para trastornos de ansiedad;
- otras opciones según diagnóstico.

---', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('80e8ee8c-5583-50f7-bb4d-3ae360a0bb72', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_41', '17. Benzodiazepinas', 'Ejemplos:

- lorazepam;
- diazepam;
- clonazepam;
- alprazolam;
- midazolam en indicaciones específicas.

Pueden producir:

- sedación;
- somnolencia;
- alteración psicomotora;
- caídas;
- deterioro de memoria;
- depresión respiratoria en combinaciones/riesgo alto.

---', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('156b87ff-0ca8-5b65-a3de-1229ddb3108d', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_42', '18. Dependencia y retirada de benzodiazepinas', 'FDA exige advertencia destacada sobre:

- abuso;
- uso indebido;
- adicción;
- dependencia física;
- reacciones de retirada.

La dependencia física puede ocurrir incluso con uso prescrito.', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('78ec06aa-c1ad-5706-b452-4b654fc03076', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_43', 'Nunca', 'No suspender de forma abrupta después de uso sostenido.

La retirada brusca puede causar:

- ansiedad intensa;
- insomnio;
- temblor;
- convulsiones;
- delirium;
- reacciones potencialmente graves.

---', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dea46045-94f0-5106-bbe6-71baa6626e8d', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_44', '19. Benzodiazepinas + opioides/alcohol', 'Esta combinación aumenta el riesgo de:

- sedación profunda;
- depresión respiratoria;
- coma;
- muerte.', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5320c064-c159-542b-b531-6ae482d12d7a', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_45', 'Enfermería', 'Preguntar explícitamente por:
- opioides;
- alcohol;
- otras sustancias depresoras.

---', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6f97ff52-60d3-5125-b962-4c5810182baa', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_46', '20. Benzodiazepinas en ansiedad', 'NICE no recomienda benzodiazepinas como tratamiento rutinario prolongado del trastorno de ansiedad generalizada; puede considerarlas a corto plazo durante crisis específicas.', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('65d4d20b-0236-50f4-9d80-b943897c4558', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_47', 'Clave', 'Alivio rápido ≠ opción ideal para uso crónico.

---', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2a5841e3-7b96-595b-8979-0333d380c275', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_48', '21. Buspirona', 'Ansiolítico no benzodiazepínico utilizado en determinados trastornos de ansiedad.

Características:

- no produce el mismo patrón de sedación/dependencia de benzodiazepinas;
- efecto no inmediato;
- requiere administración regular.', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('40c0780f-99f7-54ca-b5e5-0cbba1863f86', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_49', 'Enfermería', 'Explicar que no funciona como medicación “de rescate” instantánea.

---', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b555a263-b79c-533c-b51f-f358b194f992', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_50', '22. ANTIPSICÓTICOS', 'Se utilizan en:

- esquizofrenia;
- otros trastornos psicóticos;
- bipolaridad;
- algunas depresiones resistentes;
- otras indicaciones seleccionadas.

Se agrupan de forma general en:

- primera generación;
- segunda generación.

La selección depende de:
- respuesta;
- efectos adversos;
- preferencias;
- comorbilidades.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('821b2296-78fa-5428-8935-f308044f121e', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_51', '23. Primera generación', 'Ejemplos:

- haloperidol;
- chlorpromazine/clorpromazina.

Mayor tendencia relativa, según fármaco, a:

- efectos extrapiramidales;
- hiperprolactinemia.

No todos tienen el mismo perfil.

---', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a8a002da-050a-5ea7-b6c8-a55e6e60242a', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_52', '24. Segunda generación', 'Ejemplos:

- risperidona;
- olanzapina;
- quetiapina;
- aripiprazol;
- clozapina.

Algunos tienen mayor riesgo de:

- aumento de peso;
- dislipidemia;
- hiperglucemia/diabetes.

Los perfiles varían mucho por medicamento.

---', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0914de23-b4ab-5f45-a0d7-b3c6f8b54ba3', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_53', '25. Monitorización antes/durante antipsicóticos', 'NICE recomienda considerar y registrar:

- peso;
- cintura;
- presión;
- pulso;
- glucosa o HbA1c;
- lípidos;
- prolactina;
- movimientos anormales;
- dieta;
- actividad física.

ECG cuando exista:
- riesgo cardiovascular;
- medicamento que prolonga QT;
- ingreso hospitalario u otra indicación.

---', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4d2c5f85-2c9b-56d5-bd44-4dcedd349997', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_54', '26. Efectos extrapiramidales (EPS)', '', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4c35169c-ab79-5539-bf7d-0571b9cdbd12', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_55', 'Distonía aguda', '- contracciones musculares;
- tortícolis;
- crisis oculógira;
- espasmos.', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b7527c5a-6b64-5c1c-8555-98d6c6ecedd7', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_56', 'Alarma', 'Distonía laríngea puede amenazar vía aérea.', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('89ca0442-2f5c-5ecf-a761-97a0a44cc8db', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_57', 'Acatisia', '- inquietud interna;
- incapacidad para permanecer quieto.

Puede confundirse con agitación/ansiedad.', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8123cd70-5773-5f09-ba54-70a6c813ccc3', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_58', 'Parkinsonismo', '- rigidez;
- temblor;
- bradicinesia.', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fb862dc6-40e5-5aeb-a21e-7197d308fa3f', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_59', 'Discinesia tardía', '- movimientos involuntarios persistentes;
- orofaciales frecuentes;
- puede ser irreversible.

---', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a441d8ca-3593-5d2d-ab89-ce5d89b3564d', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_60', '27. Síndrome neuroléptico maligno (SNM)', 'Emergencia rara pero grave asociada con antagonismo dopaminérgico.

Manifestaciones típicas:

- fiebre alta;
- rigidez muscular marcada;
- alteración mental;
- inestabilidad autonómica;
- CK elevada.', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a4a4ac83-f564-5b31-902f-e112a6b7b3f7', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_61', 'Prioridad', '- suspender antipsicótico bajo indicación;
- ABC;
- enfriamiento;
- líquidos;
- monitorización;
- manejo intensivo/específico.

---', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0f4c94b8-6a68-5687-8c72-e0b036564eea', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_62', '28. SNM vs síndrome serotoninérgico', '', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('db1da09c-528d-57c0-a025-5e43f5f16aba', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_63', 'Serotoninérgico', '- hiperreflexia;
- clonus;
- síntomas GI frecuentes;
- inicio relacionado con serotonérgicos.', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b4dbf34f-bdea-534f-98ac-0d474ac024e6', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_64', 'SNM', '- rigidez intensa;
- hiporreflexia/normalidad relativa en muchos casos;
- CK elevada;
- asociado a antipsicóticos/dopamina.', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('97e9b8a8-b4c1-56ff-afc9-6a19a3613cd1', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_65', 'Importante', 'Existe superposición clínica; requiere evaluación médica urgente.

---', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('042ac43f-55f7-5c97-82e7-11d52c009756', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_66', '29. Efectos metabólicos', 'Antipsicóticos pueden aumentar:

- peso;
- glucosa;
- lípidos;
- riesgo cardiovascular.', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0e88e75d-d80b-5192-a67c-7ae01bcd3b38', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_67', 'Enfermería', 'No limitar seguimiento a síntomas psiquiátricos.

Promover:
- controles;
- nutrición;
- actividad;
- prevención cardiovascular.

---', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('75cf073a-3d60-5c9e-b081-b806f608ef88', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_68', '30. Prolactina', 'Algunos antipsicóticos pueden elevar prolactina.

Manifestaciones:

- galactorrea;
- alteraciones menstruales;
- disfunción sexual;
- ginecomastia;
- efectos óseos a largo plazo.

Valorar y comunicar.

---', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0b26807f-ec26-545a-a326-87ec27da490b', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_69', '31. QT y riesgo cardiovascular', 'Algunos psicofármacos pueden prolongar QT.

Riesgo mayor con:

- enfermedad cardiaca;
- hipopotasemia/hipomagnesemia;
- combinaciones de fármacos;
- dosis altas;
- otros medicamentos que prolongan QT.', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fb9a852c-5424-5775-8380-41a2f5509f17', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_70', 'Enfermería', 'Revisar ECG/electrolitos cuando esté indicado.

---', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0f954b0c-f526-5c2f-b200-a9ba7899f291', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_71', '32. Hipotensión ortostática', 'Puede aparecer con:

- antipsicóticos;
- tricíclicos;
- otros psicofármacos.

Intervenciones:

- levantarse gradualmente;
- valorar presión;
- prevenir caídas;
- hidratación apropiada;
- revisar combinaciones.

---', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('792db4a4-4131-58f2-bfe9-9fa48e5577ba', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_72', '33. Clozapina', 'Se utiliza principalmente en esquizofrenia resistente al tratamiento y determinadas situaciones especializadas.

Riesgos importantes:

- neutropenia grave;
- miocarditis;
- convulsiones;
- estreñimiento severo/íleo;
- sedación;
- efectos metabólicos.', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('23efa414-f68c-5764-ba05-ad25d6f3933f', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_73', 'Enfermería', 'Vigilar:
- infección/fiebre;
- ANC según prescripción;
- dolor torácico/disnea;
- tránsito intestinal;
- convulsiones;
- peso/metabolismo.

---', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4afd81a6-6e62-57c1-9c60-611c22adeceb', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_74', '34. Actualización FDA 2025 — clozapina', 'En 2025 la FDA eliminó el programa **Clozapine REMS** de Estados Unidos.', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e9454bb9-40f3-5f47-88db-e2ca24a8e35c', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_75', 'MUY IMPORTANTE', 'Eso **NO significa que desapareció el riesgo de neutropenia**.

La FDA sigue recomendando monitorización de ANC según la información de prescripción.', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1b1ab7ed-72fe-5551-827a-7e493e675acd', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_76', 'Para nuestra plataforma', 'No enseñar:
> “Ya no hay que monitorizar hemograma porque quitaron REMS.”

Eso sería incorrecto.

---', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('197b9985-3a38-5164-9fe3-93dffca3e980', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_77', '35. Antipsicóticos de depósito', 'Formulaciones de acción prolongada pueden utilizarse en pacientes seleccionados.

Ventajas posibles:

- adherencia más verificable;
- menor frecuencia de administración.

Cuidados:

- confirmar medicamento/dosis/intervalo;
- técnica específica;
- sitio;
- efectos adversos;
- seguimiento.

No utilizarlos como castigo por “incumplimiento”.

---', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('70ab0987-8095-568b-840e-579bebd36cad', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_78', '36. Adherencia', 'Explorar razones de no adherencia:

- efectos adversos;
- costo;
- estigma;
- falta de beneficio percibido;
- olvidos;
- horarios;
- síntomas;
- uso de sustancias;
- falta de acceso.', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e568a08a-f6a1-5aa1-9145-f7e3f1b56f54', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_79', 'Clave', 'No etiquetar automáticamente al paciente como “no cooperador”.

---', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('28c2dc68-931d-5cee-8be1-9929974a0d00', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_80', '37. Educación sobre psicofármacos', 'Explicar:

- para qué sirve;
- cómo tomarlo;
- cuándo esperar mejoría;
- efectos frecuentes;
- alarmas;
- interacciones;
- no suspender abruptamente;
- seguimiento;
- qué hacer si olvida dosis según medicamento.

Usar teach-back.

---', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6a7d4a38-55a7-5f92-9c34-d4d4e5dc6fba', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_81', '38. Embarazo/lactancia', 'El balance riesgo-beneficio debe individualizarse.', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('df2070d4-7bf7-5bfc-844c-21531c275ad6', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_82', 'Enfermería', '- no recomendar suspensión abrupta;
- confirmar embarazo;
- derivar para evaluación;
- considerar riesgo de enfermedad no tratada;
- revisar medicamento específico.

---', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f5ab8725-2c5e-58d5-bc21-d3abc7f272f7', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_83', '39. Adulto mayor', 'Mayor riesgo de:

- sedación;
- caídas;
- hipotensión;
- anticolinergia;
- interacciones;
- delirium.

Aplicar:
- revisión de medicamentos;
- dosis individualizadas por prescriptor;
- vigilancia funcional.

---', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('387ab8a4-470f-508b-a47d-42028eac429b', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_84', '40. PAE farmacológico', '', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('38ed8149-4816-5684-8b5d-6280eb92aeec', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_85', 'Valoración', '- síntomas;
- medicamento;
- adherencia;
- efectos;
- interacciones;
- sustancias;
- laboratorios;
- signos vitales;
- riesgo suicida;
- estado neurológico.', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2de6944a-72b3-56f9-bcbe-d09104534cbd', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_86', 'Problemas/juicios posibles', '- riesgo de lesión;
- conocimiento insuficiente;
- riesgo de efectos adversos;
- adherencia comprometida;
- alteración del sueño.', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a09f5cc2-5acf-54eb-82d2-8f9fc3184c5b', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_87', 'Planificación', '- eficacia;
- seguridad;
- adherencia;
- detección temprana de toxicidad.', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('30d46d9b-822f-5e26-98c1-b5b66e7d8e73', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_88', 'Implementación', '- administrar;
- monitorizar;
- educar;
- documentar;
- escalar alarmas.', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2f10a5c9-bb1d-5442-82f5-45a3da213027', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_89', 'Evaluación', '- respuesta;
- efectos;
- laboratorios;
- función;
- seguridad.

---', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('45214730-1f99-5f36-933d-bc61f3abe348', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_90', '41. Situaciones tipo examen', '', 90)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7852753a-1e97-5a64-b8c8-4464ed0e8f45', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_91', 'Caso 1 — ISRS', 'Paciente deja el ISRS al tercer día porque “no funciona”.

**Educación:** el efecto terapéutico requiere tiempo; no suspender sin orientación.', 91)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('38c9c640-c203-574f-be58-f84652290b08', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_92', 'Caso 2 — Serotonina', 'Paciente con dos serotonérgicos desarrolla fiebre, agitación, diarrea, clonus e hiperreflexia.

**Prioridad:** sospechar síndrome serotoninérgico.', 92)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('895af82e-2fe4-5b1d-8d26-2a97405e6a53', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_93', 'Caso 3 — Retirada', 'Paciente suspende abruptamente venlafaxina y presenta mareo/irritabilidad.

**Interpretación:** posible síndrome de retirada; requiere evaluación y plan gradual.', 93)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fe36a1ea-d5c0-52f9-b65c-42fff5386728', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_94', 'Caso 4 — Tricíclico', 'Paciente ingiere gran cantidad de amitriptilina y presenta hipotensión/arritmia.

**Prioridad:** toxicidad potencialmente letal; emergencia.', 94)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d7057597-3902-58d4-8c5e-e307d4743fa7', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_95', 'Caso 5 — IMAO', 'Paciente con IMAO combina un medicamento serotonérgico contraindicado.

**Riesgo:** síndrome serotoninérgico grave.', 95)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('51355084-2ea2-5052-b730-3360e6d072b3', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_96', 'Caso 6 — Benzodiazepina', 'Paciente toma alprazolam diariamente durante meses y decide dejarlo de golpe.

**Riesgo:** abstinencia, incluyendo convulsiones; requiere retirada gradual individualizada.', 96)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e86f6fc2-c352-5b3e-8612-4ac65111af10', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_97', 'Caso 7 — Benzodiazepina + opioide', 'Paciente está muy somnoliento y respira lentamente tras combinar ambos.

**Prioridad:** depresión respiratoria/ABC.', 97)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c4d10fee-247d-51bf-8dd7-106f8ed392d0', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_98', 'Caso 8 — Acatisia', 'Paciente inicia antipsicótico y camina sin parar diciendo que “no puede estarse quieto”.

**Interpretación:** posible acatisia; no asumir empeoramiento de ansiedad.', 98)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d04d3888-bb41-5c20-90d6-4135d68a9f47', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_99', 'Caso 9 — Distonía', 'Tras antipsicótico presenta tortícolis y crisis oculógira.

**Interpretación:** distonía aguda; requiere tratamiento oportuno.', 99)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f53cda22-72d7-5b4b-99e4-8dd5d9bfd6b7', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_100', 'Caso 10 — SNM', 'Paciente con antipsicótico presenta fiebre alta, rigidez intensa y alteración mental.

**Prioridad:** síndrome neuroléptico maligno.', 100)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('49ef319c-e7aa-5781-8a89-8fd0d09d382c', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_101', 'Caso 11 — Metabólico', 'Paciente aumenta mucho de peso después de iniciar antipsicótico.

**Conducta:** monitorizar peso, glucosa, lípidos y riesgo cardiovascular.', 101)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('934ff4a1-0dcc-5d9d-a8b8-6424dfda3105', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_102', 'Caso 12 — Clozapina', 'Paciente con clozapina presenta fiebre y odinofagia.

**Prioridad:** valorar neutropenia/infección y obtener evaluación/ANC según protocolo.

---', 102)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c800e7d7-9d79-5d45-a317-70fe9d398c7c', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_103', '42. Errores frecuentes', '1. Esperar efecto antidepresivo inmediato.
2. Suspender antidepresivo bruscamente.
3. No preguntar por suplementos/OTC.
4. Confundir síndrome serotoninérgico con simple ansiedad.
5. Ignorar cardiotoxicidad de tricíclicos.
6. Olvidar interacciones de IMAO.
7. Usar benzodiazepinas crónicamente sin valorar riesgo.
8. Suspender benzodiazepina abruptamente.
9. Combinar benzodiazepina con alcohol/opioides sin reconocer riesgo.
10. Confundir acatisia con agitación psiquiátrica.
11. No vigilar peso/glucosa/lípidos.
12. Ignorar QT.
13. No reconocer SNM.
14. Creer que eliminación de Clozapine REMS significa que ANC ya no importa.
15. Etiquetar no adherencia sin investigar causas.

---', 103)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('75a51932-4a5d-50d0-8133-9a0afa03a6a1', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_104', '43. Qué memorizar', '**ISRS/IRSN: beneficio gradual, no inmediato.**

**Serotoninérgico = agitación + autonómico + CLONUS/HIPERREFLEXIA.**

**Antidepresivos: retirada gradual cuando corresponde.**

**Tricíclico en sobredosis = cardiotoxicidad + convulsiones.**

**IMAO = interacciones graves; tiramina y serotonérgicos según producto.**

**Benzodiazepinas = sedación + dependencia + retirada peligrosa.**

**Benzo + opioide/alcohol = depresión respiratoria.**

**EPS: distonía, acatisia, parkinsonismo, discinesia tardía.**

**SNM = fiebre + rigidez + alteración mental + inestabilidad autonómica.**

**Antipsicóticos = vigilar metabolismo + movimientos + cardiovascular.**

**Clozapina = ANC sigue siendo importante aunque FDA eliminó REMS en 2025.**

---', 104)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('79a63e2c-7c09-5146-a756-443f59ffaccd', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_105', '44. Fuentes y validación', '', 105)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dde02d11-2adc-5b6d-8e5b-f6ce1c2bb1c3', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_106', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 106)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ab907c2a-d892-5bfb-ab9c-e1ef8baa39d4', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_107', 'Bibliografía señalada por CICDE', '**AMIR. Enfermería Psiquiátrica y Salud Mental. 2014.**

**Galiana Roch, J. Enfermería Psiquiátrica. Elsevier. 2016.**', 107)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5d6b77aa-f204-57b5-8692-f2e7e6b5d841', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_108', 'Antidepresivos', '**FDA. Depression Medicines. Información actual de clases, efectos e interacciones.**

**NICE NG222. Depression in adults: treatment and management. 2022, vigente.**', 108)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('88668293-6ccd-5a5b-9936-67ef3579ff20', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_109', 'Ansiolíticos', '**NICE CG113. Generalised anxiety disorder and panic disorder in adults: management.**

**FDA. Boxed Warning for benzodiazepines — abuse, misuse, addiction, physical dependence and withdrawal.**', 109)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('79faf2ea-25cc-505f-bc87-a7b8430e9bca', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_110', 'Antipsicóticos', '**NICE CG178. Psychosis and schizophrenia in adults: prevention and management.**

**NICE CG185. Bipolar disorder: assessment and management.**', 110)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3beb67bb-59c3-5262-988e-333bc8c181da', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_111', 'Clozapina', '**FDA. Clozapine REMS removed in 2025; ANC monitoring remains recommended according to prescribing information.**

---', 111)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c33d599d-8721-5538-9bd7-adf0bc021efb', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_112', '45. Control de calidad', 'Este paquete:

- cubre exactamente las tres clases señaladas por CICDE;
- desarrolla riesgos de alta prioridad para enfermería;
- incorpora retirada segura de antidepresivos;
- diferencia síndrome serotoninérgico y SNM;
- incluye EPS y monitorización metabólica;
- incorpora advertencias de benzodiazepinas;
- actualiza el cambio regulatorio de clozapina de 2025 sin eliminar monitorización;
- contiene 12 casos originales;
- evita dosis universales.

---', 112)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bf58a21a-f808-5600-b496-a9065bae5639', 'f39c849c-9d42-5c01-9b47-fa7a842817ff', 'sec_113', '46. Estado para integración', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- vincular fichas técnicas/normativa farmacológica aplicable en Panamá;
- validar dosis y esquemas solo cuando se incorporen preguntas farmacológicas específicas;
- enlazar con MENTAL-05, MENTAL-07, MENTAL-10 y área general de Farmacología.', 113)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8972d92c-a006-523c-970b-7ed3be87294c', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_1', 'Terapias psicodinámicas de enfermería', '**Área:** Enfermería en Salud y Enfermedad Mental  
**Código:** MENTAL-09  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('28607144-c5c3-53d9-a5cf-31c446270444', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_2', '1. Alcance oficial CICDE', 'El lineamiento CICDE 2026 incluye expresamente:', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d2b68a3e-d420-53ff-b23c-9dd8eb3f93c3', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_3', 'Terapias individuales', '- supresión;
- apoyo;
- realidad.', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c1d35caa-ad19-50a7-b693-c50b377b1135', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_4', 'Terapias de grupo', '- comunicación;
- remotivación;
- actividades.', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ddb06b5a-2f08-5fe7-847b-bbf6c041d704', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_5', 'Nota académica importante', 'Esta clasificación corresponde a la terminología utilizada por el documento CICDE y por bibliografía clásica de enfermería psiquiátrica.

No todos estos rótulos coinciden uno a uno con la nomenclatura contemporánea de psicoterapias basadas en evidencia.

Por ello, en esta plataforma se hará siempre la distinción entre:

**“Clasificación exigida por CICDE”**  
y  
**“Intervenciones contemporáneas de enfermería y salud mental”.**

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('00458f2d-b43d-53c6-ac29-2e5b4cf0686b', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_6', '2. Objetivos de aprendizaje', 'Al finalizar el tema, el estudiante debe poder:

1. Identificar las terapias individuales y grupales enumeradas por CICDE.
2. Diferenciar intervención individual de intervención grupal.
3. Explicar el propósito general de apoyo psicológico de enfermería.
4. Aplicar comunicación terapéutica en intervenciones individuales y grupales.
5. Diferenciar “presentar la realidad” de discutir o confrontar agresivamente.
6. Comprender el concepto de supresión como mecanismo consciente y su posible uso terapéutico limitado.
7. Reconocer los objetivos de la remotivación.
8. Explicar el valor terapéutico de actividades estructuradas.
9. Reconocer indicaciones y limitaciones de grupos.
10. Mantener límites profesionales, confidencialidad y seguridad.
11. Diferenciar intervención de enfermería de psicoterapia especializada.
12. Integrar estas intervenciones al PAE.

---', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a4587ad2-dba6-54d2-bca8-cba5405c8788', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_7', '3. Intervenciones terapéuticas en salud mental', 'Las intervenciones terapéuticas pueden ser:

- individuales;
- grupales;
- familiares;
- comunitarias;
- farmacológicas;
- ocupacionales;
- psicosociales.

La enfermera puede:

- establecer relación terapéutica;
- escuchar;
- apoyar;
- educar;
- facilitar grupos dentro de su competencia;
- observar respuesta;
- reforzar habilidades;
- detectar riesgo;
- coordinar atención.', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('046b4700-dd17-5674-b92c-8642de10d1f6', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_8', 'Clave', 'La enfermera no debe realizar una psicoterapia especializada fuera de su formación, competencia o autorización profesional.

---', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('85d612b0-7193-5225-8598-db00fc96d389', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_9', '4. TERAPIAS INDIVIDUALES — SUPRESIÓN', '', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3056002b-b8c7-5ce6-a852-7648275668e6', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_10', 'Concepto de supresión', 'La **supresión** se entiende clásicamente como la decisión consciente de posponer temporalmente un pensamiento, emoción o preocupación para poder atender otra tarea.

Ejemplo:

> “Ahora debo concentrarme en este procedimiento; hablaré de esta preocupación después.”', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('98ca036b-f83b-5ee1-a710-7bd5b05c02d4', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_11', 'Diferencia clave', '- **Supresión:** consciente.
- **Represión:** inconsciente.

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0c46b112-5d42-562e-93eb-d48f6157d992', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_12', '5. Uso terapéutico de la supresión', 'Puede ser útil temporalmente para:

- tolerar una situación inmediata;
- completar una tarea;
- reducir sobrecarga momentánea;
- posponer una discusión hasta un momento más seguro;
- organizar prioridades.', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dd26e8ea-e45a-5b6c-abd2-abeef14679e2', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_13', 'Riesgo', 'Si se utiliza de manera constante para evitar todo procesamiento emocional, puede impedir afrontamiento o búsqueda de ayuda.', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0a7653db-92fb-551d-a8fc-591f6bb809b9', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_14', 'Enfermería', 'La meta no es enseñar al paciente a “guardar todo”.

La meta es ayudarle a decidir:
- qué puede abordar ahora;
- qué puede posponer;
- cuándo y cómo retomarlo.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('467dab3e-f8aa-599b-8765-dfd2c8708219', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_15', '6. Ejemplo de supresión', 'Paciente recibe una noticia difícil minutos antes de una intervención urgente.

Respuesta terapéutica:

> “Podemos concentrarnos ahora en que esté seguro durante el procedimiento. Después tendremos un espacio para hablar de lo que está sintiendo.”

Esto permite posponer temporalmente sin negar la emoción.

---', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7c2d0048-7eac-5cdb-886d-85ad38aedc91', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_16', '7. TERAPIA INDIVIDUAL DE APOYO', '', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('68e23e2d-8248-5f7d-84c0-12b483d3ea68', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_17', 'Concepto', 'El apoyo terapéutico busca ayudar a la persona a:

- mantener funcionamiento;
- reducir angustia;
- reforzar afrontamiento;
- utilizar recursos;
- mantener esperanza realista;
- mejorar adherencia;
- manejar crisis.

Puede incluir:

- escucha;
- validación;
- educación;
- resolución de problemas;
- fortalecimiento de capacidades;
- orientación práctica.

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fc7f35b2-2211-5271-ae4d-bed3db56085d', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_18', '8. Principios del apoyo terapéutico', '- relación respetuosa;
- empatía;
- límites;
- seguridad;
- enfoque en fortalezas;
- metas realistas;
- autonomía;
- participación.', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c79af5dd-86bc-5c41-8578-2ea722217d81', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_19', 'No es', '- resolverle la vida al paciente;
- amistad;
- dependencia emocional del profesional;
- prometer resultados;
- dar consejos personales en cada decisión.

---', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0fc46b7c-1e64-5b96-af26-b203c278166c', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_20', '9. Técnicas de apoyo', '- escucha activa;
- clarificación;
- reflexión;
- reformulación;
- focalización;
- validación emocional;
- refuerzo específico;
- educación;
- solución de problemas;
- movilización de apoyo social.

---', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('520e1385-5103-54a5-8097-23d74dcf8531', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_21', '10. Apoyo y crisis', 'En crisis, el apoyo puede ser más:

- estructurado;
- directivo;
- breve;
- orientado a seguridad.

Priorizar:

1. ABC / causa médica si aplica.
2. Riesgo suicida/violencia.
3. Necesidades básicas.
4. Red de apoyo.
5. Plan inmediato.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9ea18233-2e20-55cd-8b84-43d3f366711f', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_22', 'Clave', 'Una crisis con riesgo grave requiere atención profesional urgente; el “apoyo” por sí solo no es suficiente.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b1c3b488-7784-510b-a620-f1260958f627', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_23', '11. TERAPIA INDIVIDUAL DE “REALIDAD”', 'El CICDE utiliza el término **“realidad”** dentro de las terapias individuales.

Este término puede aparecer en bibliografía histórica con más de un sentido.

Para fines seguros de enfermería, se desarrolla principalmente como:

- orientación hacia hechos presentes;
- clarificación de lo que está ocurriendo;
- ayuda para distinguir percepción interna de realidad compartida;
- toma de decisiones basada en situaciones actuales.', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a2573241-6e52-5f8b-9618-f30aeea180a5', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_24', 'Precaución', 'No se asumirá que CICDE exige específicamente la psicoterapia formal denominada **Reality Therapy de William Glasser** salvo confirmación bibliográfica humana.

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bb6591af-ce06-5034-84b3-5c286ae9331c', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_25', '12. Presentación de realidad en psicosis', 'Ante delirios o alucinaciones:', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c4eb7c1d-655f-5b9b-a14c-62e8b0c24523', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_26', 'Evitar', '- confirmar el delirio;
- discutir violentamente;
- burlarse;
- desafiar de forma humillante.', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c2b47845-a626-5149-b6bc-e286a3b41ee2', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_27', 'Utilizar', '- reconocimiento de emoción;
- afirmación breve de la realidad compartida;
- seguridad;
- redirección.

Ejemplo:

> “Sé que usted escucha esa voz. Yo no la escucho. Estoy aquí con usted y vamos a mantenerlo seguro.”

---', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c84dd431-49c7-511b-affe-bcac268cf459', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_28', '13. Orientación a la realidad', 'Puede utilizarse especialmente cuando existe:

- confusión;
- deterioro cognitivo;
- desorientación.

Medidas:

- presentarse;
- explicar dónde está;
- reloj/calendario;
- iluminación apropiada;
- rutinas;
- objetos familiares;
- gafas/audífonos.', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('36e1fb74-ff50-59ad-b1a9-6abcc46ef296', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_29', 'Precaución', 'En delirium debe buscarse y tratarse la causa médica; la orientación ambiental es solo una intervención complementaria.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1b16c313-8870-5b51-8cba-a39d7d1d1b50', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_30', '14. “Realidad” no significa confrontación', 'Decir:

> “Eso es mentira, deje de inventar.”

no es terapéutico.

Más adecuado:

> “Entiendo que para usted se siente real. Yo no observo esa amenaza en este momento.”

La enfermera:
- valida emoción;
- no valida contenido falso;
- mantiene relación.

---', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8eb7faa5-e0c5-5448-9af6-a2c91e08bdd6', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_31', '15. TERAPIAS DE GRUPO', 'Un grupo terapéutico reúne personas con un propósito de tratamiento, apoyo, educación, habilidades o recuperación.

OpenStax Psychiatric-Mental Health Nursing describe que los grupos pueden:

- permitir aprendizaje de experiencias de otros;
- ofrecer apoyo;
- facilitar educación;
- permitir expresión en un ambiente seguro.

---', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('fe34c3a6-76a1-588e-bf40-6d7b29d752a1', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_32', '16. Ventajas de grupos', '- apoyo mutuo;
- sentido de pertenencia;
- habilidades sociales;
- práctica interpersonal;
- modelado;
- retroalimentación;
- educación;
- reducción de aislamiento.', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('914f26ab-9864-5f37-8b55-285b674b18c7', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_33', 'Importante', 'No todos los pacientes son apropiados para cualquier grupo en cualquier momento.

---', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('aa28d585-7c0a-5f76-8f94-e34cae3f2faa', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_34', '17. Evaluación antes de incluir en grupo', 'Valorar:

- nivel de agitación;
- capacidad de participar;
- riesgo de violencia;
- intoxicación;
- delirium;
- estabilidad;
- necesidades de privacidad;
- objetivo del grupo.

Una persona en estado agudo severo puede necesitar primero atención individual y estabilización.

---', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e88cf830-b12b-5584-b891-c3ec6a61c92a', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_35', '18. Confidencialidad en grupos', 'El profesional debe explicar:

- normas;
- respeto;
- privacidad;
- límites de confidencialidad;
- conducta esperada.', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('16c0c24a-94e7-59a6-874f-480410275c1d', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_36', 'Limitación', 'El profesional puede proteger la información que maneja, pero no puede garantizar de forma absoluta que todos los participantes mantendrán secreto fuera del grupo.

Por eso esta limitación debe explicarse.

---', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c810068d-082f-58e1-9948-b98c7133ac26', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_37', '19. Grupo de comunicación', 'Según el lenguaje del CICDE, se orienta a fortalecer:

- expresión;
- escucha;
- interacción;
- habilidades sociales;
- retroalimentación;
- reconocimiento de patrones interpersonales.

Puede trabajar:

- comunicación verbal;
- no verbal;
- asertividad;
- resolución de conflictos;
- escucha activa.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eada1c4a-29a6-5233-b795-7b452678d8cb', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_38', '20. Rol de enfermería en grupo de comunicación', '- establecer reglas;
- facilitar participación;
- evitar monopolización;
- invitar sin obligar;
- observar dinámica;
- mantener seguridad;
- reforzar respeto;
- redirigir ataques personales;
- modelar comunicación terapéutica.

---', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c902ba89-cade-5486-b63f-0c2c6ad43f3f', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_39', '21. Remotivación', 'La **remotivación** es una intervención histórica utilizada en salud mental, especialmente con personas con retraimiento, institucionalización o deterioro funcional.

Busca estimular:

- interés por el entorno;
- conversación;
- participación;
- interacción social;
- conexión con temas del presente.', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0bbd1dd0-8dcb-5c40-9904-bb92cf076a33', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_40', 'Importante', 'No sustituye el tratamiento de:
- depresión;
- psicosis;
- demencia;
- delirium.

Es una intervención de activación y participación.

---', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('abc1b210-0142-5e82-a66a-73724ecd8d31', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_41', '22. Principios de remotivación', 'Puede utilizar:

- temas cotidianos;
- objetos;
- noticias neutrales;
- recuerdos agradables;
- intereses;
- conversación estructurada;
- actividades sencillas.', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('af7dc506-c62d-51b6-a514-9d732e38fca7', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_42', 'Meta', 'Mover el foco temporalmente desde la pasividad o aislamiento hacia:

- interacción;
- interés;
- actividad;
- realidad compartida.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1f3365f5-0943-537e-971e-c16073186f6b', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_43', '23. Remotivación vs reminiscencia', 'No son idénticas.', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dff22455-ba2f-538c-a63c-f487a0f30eeb', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_44', 'Remotivación', 'Busca aumentar:
- interés;
- participación;
- interacción presente.', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2e0cee71-84db-58de-89fd-3a18622031ab', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_45', 'Reminiscencia', 'Utiliza recuerdos y experiencias pasadas con propósito terapéutico.

Pueden solaparse en algunos programas, pero no deben presentarse como sinónimos.

---', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cf482b0a-ae05-554d-8f4c-763edac4c474', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_46', '24. Terapia/grupo de actividades', 'Las actividades estructuradas pueden utilizarse para favorecer:

- participación;
- socialización;
- autoestima;
- habilidades;
- concentración;
- disfrute;
- rutina;
- función.

Ejemplos:

- arte;
- música;
- juegos;
- movimiento;
- manualidades;
- habilidades de vida;
- actividades ocupacionales;
- actividades recreativas.

---', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('456230cf-7eae-5738-9e23-7aca32198d90', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_47', '25. Selección de actividades', 'Debe individualizarse según:

- capacidad física;
- cognición;
- intereses;
- cultura;
- síntomas;
- riesgo;
- edad;
- objetivos.', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5ca7defe-84b8-5fb4-9a79-972b042e6e91', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_48', 'Evitar', 'Actividades demasiado:
- infantiles;
- complejas;
- competitivas;
- sobreestimulantes;

si no son apropiadas para la persona.

---', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('de367f33-cc8a-5d9d-8476-ad1af5280682', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_49', '26. Actividad y depresión', 'Una persona deprimida puede tener:

- baja energía;
- pérdida de interés;
- dificultad para iniciar.

La actividad puede comenzar:

- breve;
- simple;
- acompañada;
- con metas pequeñas.', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cf253d95-6a46-5e2e-ad5e-1d945a683ad1', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_50', 'Error', 'Forzar a participar intensamente y después interpretar la incapacidad como “falta de voluntad”.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('95148ece-dc27-54bb-a57e-acffcb0e466c', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_51', '27. Actividad y manía', 'En manía:

- evitar sobreestimulación;
- preferir actividades simples;
- limitar competencia intensa;
- estructurar el ambiente;
- vigilar impulsividad;
- favorecer descanso.

Un gran grupo ruidoso puede empeorar activación.

---', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('41cc7a5e-6e90-5865-871e-6fef616552d3', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_52', '28. Actividad y ansiedad', 'En ansiedad intensa:

- reducir estímulos;
- instrucciones sencillas;
- permitir salida;
- actividades calmantes.

Cuando disminuye ansiedad pueden añadirse actividades de habilidades y afrontamiento.

---', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('731cf924-fb6a-5506-9a20-c9d369ac9e29', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_53', '29. Actividad y deterioro cognitivo', 'Puede utilizarse:

- música;
- actividades familiares;
- movimiento;
- tareas simples;
- rutinas.

Objetivos:

- participación;
- bienestar;
- función;
- conexión social.

Adaptar al nivel cognitivo real.

---', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7ce70e0d-b2ea-545b-a3e6-293dc3a79e06', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_54', '30. Dinámica de grupo', 'Elementos relevantes:

- roles;
- normas;
- cohesión;
- comunicación;
- liderazgo;
- conflictos;
- subgrupos;
- objetivos.

La enfermera debe observar tanto:
- lo que se dice;
- como la interacción entre participantes.

---', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1cc1b675-2960-58a4-90b5-50e42f17d848', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_55', '31. Liderazgo del grupo', 'Puede ser más:

- directivo;
- facilitador;
- participativo;

según:
- objetivo;
- etapa;
- funcionamiento;
- seguridad.', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2a1d557a-525b-5200-994a-65925e3ee943', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_56', 'En crisis', 'Se requiere mayor estructura.

---', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b12d33fd-45e0-5697-84ac-07e8b2b75293', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_57', '32. Conductas difíciles en grupo', '', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4c9038a2-bafe-57f6-a8f7-a1aa2166e799', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_58', 'Monopolización', 'Redirigir con respeto:

> “Quiero dar oportunidad a otras personas de compartir.”', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f4f13df6-c3e8-5226-b1eb-1690df8d2ffc', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_59', 'Silencio', 'Invitar sin obligar.', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('159de6c9-7285-5ef1-af5b-f3d619dd00f5', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_60', 'Ataques', 'Detener conducta y restablecer límites.', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0448a1ee-3ca1-5457-984f-b28e8fb6cd45', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_61', 'Agitación', 'Valorar seguridad y considerar salida del grupo/atención individual.

---', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('79f4c8db-26ab-5935-9e7d-cde3cd3c13ca', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_62', '33. Grupos de apoyo vs psicoterapia de grupo', '', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e35a4cb4-5f9d-5333-93b0-079dd1eb319b', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_63', 'Grupo de apoyo', '- intercambio;
- experiencia compartida;
- afrontamiento;
- apoyo.', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('15b0fa9f-9c75-590c-907e-493ebe14f4c4', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_64', 'Psicoeducativo', '- conocimiento;
- habilidades;
- prevención de recaída.', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('22a3001b-41cf-5231-bd57-f2fcf6f3959a', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_65', 'Psicoterapia de grupo', '- tratamiento estructurado;
- requiere profesionales entrenados según modalidad.', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3615371d-9e90-5dc4-aa92-9c30f5d33df1', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_66', 'Clave', 'No todo grupo es psicoterapia.

---', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('83efd598-9f92-5cb3-a2f6-1ef67c4e38cc', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_67', '34. Milieu o ambiente terapéutico', 'La enfermería psiquiátrica utiliza el entorno como parte del cuidado.

Un ambiente terapéutico debe favorecer:

- seguridad;
- estructura;
- respeto;
- rutinas;
- autonomía;
- interacción;
- actividad;
- recuperación.

OpenStax destaca el milieu terapéutico como un ambiente controlado y de apoyo que facilita seguridad y cambio conductual.

---', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6351c05e-881d-58dd-8df5-04250ddb6640', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_68', '35. Intervenciones centradas en la persona', 'La OMS promueve atención:

- basada en derechos;
- centrada en la persona;
- orientada a recuperación.

Por eso ninguna terapia debe utilizarse para:

- humillar;
- castigar;
- forzar confesiones;
- controlar por conveniencia del personal.

---', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9c6764f0-d317-5f64-9663-960e42f15134', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_69', '36. Evaluación de efectividad', 'Preguntar:

- ¿disminuyó angustia?
- ¿aumentó participación?
- ¿mejoró comunicación?
- ¿utiliza nuevas estrategias?
- ¿se mantiene seguridad?
- ¿la actividad es significativa para la persona?', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b86d9e0f-d7c2-5336-bb81-79d796d1260a', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_70', 'Clave', '“Participó en grupo” no equivale automáticamente a “mejoró”.

Debe evaluarse el resultado.

---', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5d03bc5d-d87d-5f64-b841-6b1efd2edae9', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_71', '37. PAE', '', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9cb273f9-a268-5054-a62a-c27c063db4ed', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_72', 'Valoración', '- síntomas;
- funcionamiento;
- comunicación;
- participación;
- relaciones;
- intereses;
- seguridad;
- preferencias.', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('be57ca57-6435-53b2-b0e0-8573afe243a0', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_73', 'Problemas/juicios posibles', '- aislamiento;
- afrontamiento alterado;
- comunicación alterada;
- autoestima;
- ansiedad;
- actividad reducida.', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('788f844c-3f0c-5ca6-81e2-98c7641aaf5c', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_74', 'Planificación', '- participación;
- expresión;
- afrontamiento;
- interacción;
- seguridad.', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5747a5e9-0dfa-550c-bbda-a0dccf17d9a8', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_75', 'Implementación', '- apoyo;
- comunicación;
- presentación de realidad;
- grupos;
- actividades;
- remotivación.', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('20cf910f-8d24-5cfc-ac51-36ab66edd303', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_76', 'Evaluación', '- respuesta;
- participación;
- función;
- seguridad;
- satisfacción.

---', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8deba503-2d06-5659-aa0f-87c46ad5a1bf', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_77', '38. Situaciones tipo examen', '', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ba498808-40f9-58bd-a9e4-77e662b3ce51', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_78', 'Caso 1 — Supresión', 'Paciente decide posponer conscientemente hablar de un problema hasta terminar una actividad urgente.

**Respuesta:** supresión.', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8c1704ed-f481-5f43-8f02-ca6db9de75f9', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_79', 'Caso 2 — Represión', 'Paciente no tiene conciencia de un contenido psicológico doloroso.

**Concepto:** represión, no supresión.', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3d155db5-83cb-5960-9ac8-d0556bbb1803', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_80', 'Caso 3 — Apoyo', 'Paciente está abrumado por un diagnóstico reciente.

**Intervención:** escuchar, validar, identificar recursos y establecer pasos realistas.', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5a5af31f-ee83-563a-bc70-416c3133034b', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_81', 'Caso 4 — Realidad', 'Paciente dice que una voz invisible le ordena salir del hospital.

**Conducta:** no confirmar la voz; reconocer experiencia, presentar realidad y valorar riesgo.', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3ea306c8-da75-5070-922d-af5e73d1ecc5', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_82', 'Caso 5 — Delirio', 'Enfermera discute durante 20 minutos intentando demostrar que el delirio es falso.

**Problema:** confrontación prolongada no terapéutica.', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('03e67960-919a-5ac4-9f24-ace921ee1369', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_83', 'Caso 6 — Grupo', 'Paciente extremadamente agitado y amenazante es enviado inmediatamente a grupo para “socializar”.

**Error:** primero seguridad y estabilización.', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('38c9ef2b-45af-5350-8a02-0dc0587d8bdd', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_84', 'Caso 7 — Comunicación', 'Un participante monopoliza la sesión.

**Intervención:** redirigir respetuosamente y facilitar participación del resto.', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('88d0b55a-2cc7-56c3-99e2-ebb866f44b68', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_85', 'Caso 8 — Confidencialidad', 'Enfermera promete que nadie del grupo repetirá nada fuera.

**Error:** no puede garantizar la conducta de otros participantes.', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3943e847-776f-5f0a-856c-73ce23209e3c', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_86', 'Caso 9 — Remotivación', 'Paciente retraído participa en conversación estructurada sobre temas cotidianos.

**Objetivo:** aumentar interés e interacción con el entorno.', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('175a9ee1-a7b7-56cd-842c-d9ec9fc912db', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_87', 'Caso 10 — Actividad/depresión', 'Paciente deprimido rechaza una actividad compleja.

**Intervención:** ofrecer actividad breve y alcanzable en lugar de culpabilizar.', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7b90bb7a-7382-5b44-9357-878f180e8503', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_88', 'Caso 11 — Actividad/manía', 'Paciente maníaco entra en competencia deportiva ruidosa.

**Problema:** puede aumentar estimulación; elegir actividad más estructurada y tranquila.', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('dc801767-09d6-5328-b3a6-ecb8187c3318', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_89', 'Caso 12 — Resultado', 'Paciente asiste a grupos todos los días pero continúa aislado y angustiado.

**Conducta:** reevaluar efectividad; asistencia por sí sola no demuestra mejoría.

---', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('37e3b6e4-72bb-5e12-bc67-f15b6508b83e', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_90', '39. Errores frecuentes', '1. Confundir supresión con represión.
2. Enseñar “supresión” como evitar emociones indefinidamente.
3. Convertir apoyo terapéutico en dependencia.
4. Confirmar delirios al “presentar realidad”.
5. Discutir agresivamente con psicosis.
6. Confundir orientación a realidad con tratamiento causal de delirium.
7. Enviar a grupo a una persona agudamente inestable.
8. Prometer confidencialidad absoluta entre participantes.
9. Confundir remotivación con reminiscencia.
10. Elegir actividades sin considerar capacidad e intereses.
11. Sobreestimular al paciente maníaco.
12. Medir éxito solo por asistencia.
13. Llamar psicoterapia a cualquier grupo.

---', 90)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1e25a522-fba9-5ac6-b768-5c04cc770568', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_91', '40. Qué memorizar', '**CICDE — individual: supresión + apoyo + realidad.**

**CICDE — grupo: comunicación + remotivación + actividades.**

**Supresión = consciente; represión = inconsciente.**

**Apoyo = fortalecer funcionamiento y afrontamiento, no crear dependencia.**

**Presentar realidad = no confirmar delirio + no humillar.**

**Grupo de comunicación = expresión + escucha + interacción.**

**Remotivación = interés y participación en el presente.**

**Actividades = deben ser significativas, seguras e individualizadas.**

**No todo grupo = psicoterapia.**

**Paciente agudamente inestable → primero seguridad/estabilización.**

---', 91)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d0fa22ba-cc73-598c-b455-91d5c7510ff2', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_92', '41. Fuentes y validación', '', 92)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('abea9376-82f9-5df7-acfb-d490e5a9626a', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_93', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 93)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8466eade-184b-5bc4-8bef-3097e7788478', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_94', 'Bibliografía señalada por CICDE', '**AMIR. Enfermería Psiquiátrica y Salud Mental. 2014.**

**Galiana Roch, J. Enfermería Psiquiátrica. Elsevier. 2016.**', 94)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('342b43ac-b7c3-57a0-b1bc-9aa70c39c333', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_95', 'Fuentes complementarias', '**OpenStax. Psychiatric-Mental Health Nursing. Capítulos de comunicación terapéutica y Group Therapy.**

**World Health Organization. Guidance on community mental health services: promoting person-centred and rights-based approaches. 2021.**

**NICE NG10. Violence and aggression: short-term management in mental health, health and community settings.**', 95)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('34e80479-a026-5901-9b63-cf51be0d5b83', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_96', 'Nota de validación', 'Los términos “supresión, apoyo, realidad, comunicación, remotivación y actividades” se conservan porque son los exigidos por CICDE. La equivalencia exacta con escuelas psicoterapéuticas contemporáneas requiere revisión académica humana antes de marcar este módulo como `VERIFIED`.

---', 96)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('71dbc878-b24d-5b3a-8be7-88f8b08ced4c', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_97', '42. Control de calidad', 'Este paquete:

- cubre exactamente la clasificación del CICDE;
- evita reinterpretar “realidad” como una psicoterapia específica sin evidencia suficiente;
- diferencia supresión y represión;
- desarrolla apoyo terapéutico;
- cubre comunicación, remotivación y actividades;
- incorpora seguridad de grupos;
- integra enfoque centrado en derechos;
- contiene 12 casos originales.

---', 97)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('3e980be0-d401-5931-894c-b2f753357fe1', '207018b2-f2a6-5c74-86ff-87050f04cccc', 'sec_98', '43. Estado para integración', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- confirmar la interpretación académica exacta de “terapia de realidad” usada por la bibliografía CICDE;
- confirmar el sentido histórico de “remotivación” en la fuente docente;
- enlazar con MENTAL-02, MENTAL-06, MENTAL-07 y MENTAL-10.', 98)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a783fd3a-3bb2-577b-b759-590306ad4cbf', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_1', 'PAE en pacientes con alucinaciones, conductas agresivas, depresión, ansiedad y manía', '**Área:** Enfermería en Salud y Enfermedad Mental  
**Código:** MENTAL-10  
**Estado académico del paquete:** `REVIEW`  
**Versión:** 1  
**Última revisión del paquete:** 2026-09-10

---', 1)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b363132f-b7ea-58b8-8a6d-99b3766d8f08', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_2', '1. Alcance oficial CICDE', 'El lineamiento CICDE 2026 incluye expresamente:

**“PAE de pacientes con alucinación, conductas agresivas, deprimido, ansioso, maniaco”.**

En este módulo se utiliza terminología clínica centrada en la persona:

- persona que presenta alucinaciones;
- persona con conducta agresiva o agitación;
- persona con síntomas depresivos;
- persona con ansiedad;
- persona con síntomas maníacos.

Se desarrolla el **Proceso de Atención de Enfermería (PAE)** aplicado a cada situación.

---', 2)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7de08ea5-3652-5860-a799-6ce745c26a0f', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_3', '2. Objetivos de aprendizaje', 'Al finalizar el tema, el estudiante debe poder:

1. Aplicar valoración, juicio, planificación, intervención y evaluación en salud mental.
2. Priorizar seguridad sobre problemas de menor urgencia.
3. Valorar contenido y riesgo asociado con alucinaciones.
4. No reforzar delirios ni alucinaciones.
5. Aplicar desescalamiento ante agresividad.
6. Reconocer causas médicas de agitación.
7. Valorar suicidio en depresión.
8. Adaptar comunicación al nivel de ansiedad.
9. Mantener necesidades básicas y seguridad en manía.
10. Formular resultados observables.
11. Reevaluar respuesta a intervenciones.
12. Documentar de forma objetiva.
13. Integrar equipo interdisciplinario y continuidad.
14. Resolver casos tipo examen.

---', 3)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('01858ea5-c1e5-5bcf-a0a2-773e86f3f085', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_4', '3. PAE en salud mental', 'Las etapas clásicas del PAE son:

1. **Valoración**
2. **Diagnóstico/juicio de enfermería**
3. **Planificación**
4. **Implementación**
5. **Evaluación**', 4)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4b4e218b-5e11-5670-8fda-268f665498f4', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_5', 'Prioridad general', 'En salud mental, antes de objetivos psicosociales complejos se debe atender:

- ABC;
- causas médicas;
- suicidio;
- violencia;
- delirium;
- intoxicación/abstinencia;
- necesidades fisiológicas;
- seguridad.

---', 5)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5f35188e-721f-590c-9558-28d99273184f', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_6', '4. Valoración del estado mental', 'Puede incluir:

- apariencia;
- conducta;
- nivel de conciencia;
- orientación;
- habla;
- estado de ánimo;
- afecto;
- pensamiento;
- contenido del pensamiento;
- percepción;
- cognición;
- juicio;
- insight;
- riesgo;
- función.', 6)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b8ad52e4-09b5-523c-b036-632a108ae756', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_7', 'Clave', 'La valoración debe describir lo observado y lo expresado por la persona.

---', 7)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7b9d096e-8705-548f-a587-0b6086ef7646', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_8', '5. Seguridad antes que etiqueta', 'Ejemplo:

Paciente está agitado, sudoroso y confuso.

No asumir:
> “Es agresivo por su enfermedad psiquiátrica.”

Primero considerar:
- hipoxia;
- hipoglucemia;
- fiebre;
- delirium;
- intoxicación;
- abstinencia;
- dolor;
- trauma;
- medicamentos.

---', 8)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d4e907d2-7547-531b-9f54-bccb5c5fab61', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_9', '6. PAE — PERSONA CON ALUCINACIONES', '', 9)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('188c0b4f-5729-5666-b565-d3c84986b6cc', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_10', 'Valoración', 'Preguntar:

- modalidad: auditiva, visual, táctil, etc.;
- inicio;
- frecuencia;
- intensidad;
- contenido;
- angustia;
- capacidad de distinguir realidad;
- sustancias;
- sueño;
- medicamentos;
- riesgo.', 10)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7892a3d7-1e2f-59ed-94b4-e9555eb0a84a', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_11', 'Pregunta crítica', '> “¿Las voces le dicen que se haga daño o que haga daño a alguien?”

---', 11)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a8134fa3-428e-533b-a9ce-1e20b46b212a', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_12', '7. Alucinaciones de comando', 'Aumentan preocupación cuando:

- ordenan daño;
- la persona tiene intención de obedecer;
- ha obedecido anteriormente;
- existe acceso a medios;
- está muy desorganizada;
- no puede resistir las órdenes.', 12)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c78885e8-68ee-5fc8-9439-b3c048f5428a', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_13', 'Prioridad', 'Seguridad inmediata y escalamiento.

---', 13)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f683c4c7-f8e4-5137-83a8-d941931a72a0', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_14', '8. Juicios/problemas posibles — alucinaciones', 'Sin reproducir etiquetas propietarias de taxonomías diagnósticas, pueden identificarse problemas como:

- alteración de la percepción;
- riesgo de autolesión;
- riesgo de violencia;
- ansiedad;
- aislamiento;
- deterioro del autocuidado;
- alteración del sueño.

---', 14)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1789d423-0769-50d7-a72e-6f7d1c397964', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_15', '9. Resultados esperados — alucinaciones', 'Ejemplos:

- paciente comunica aumento de las voces antes de actuar;
- identifica al menos una estrategia para afrontarlas;
- permanece libre de lesiones;
- distingue gradualmente experiencias internas de estímulos externos;
- utiliza apoyo del equipo.', 15)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('10ab1ba8-7cc4-53ae-aa68-539670fc7681', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_16', 'Resultado débil', '> “Paciente mejorará.”

Debe ser observable.

---', 16)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9ee7478a-de1e-52f7-bea7-6055099bc445', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_17', '10. Intervenciones — alucinaciones', '- mantener seguridad;
- preguntar contenido;
- reconocer emoción;
- no confirmar la alucinación;
- presentar realidad brevemente;
- reducir estímulos cuando corresponda;
- involucrar en actividad concreta;
- administrar tratamiento prescrito;
- vigilar efectos;
- reforzar estrategias.

Ejemplo:

> “Sé que usted escucha voces. Yo no las escucho. Quiero saber si le están diciendo que haga algo peligroso.”

---', 17)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('eff7ea6f-d94a-52fc-ba01-cc98d1ce9205', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_18', '11. Evaluación — alucinaciones', 'Reevaluar:

- frecuencia;
- intensidad;
- angustia;
- órdenes;
- capacidad de resistir;
- conducta;
- sueño;
- respuesta a medicación;
- seguridad.

---', 18)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8546eb30-3dbf-56ee-a5f8-8bf0d90b92af', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_19', '12. PAE — CONDUCTA AGRESIVA / AGITACIÓN', '', 19)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4e8b9889-a960-5dc2-baef-06baf9981192', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_20', 'Valoración', '- signos tempranos;
- desencadenante;
- tono;
- postura;
- amenazas;
- armas/objetos;
- sustancias;
- síntomas psicóticos;
- delirium;
- dolor;
- necesidades básicas;
- historia de violencia;
- entorno.

---', 20)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('cbf83c77-6998-50e7-84f1-0936b619a1b3', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_21', '13. Signos de escalamiento', 'Pueden incluir:

- inquietud;
- caminar repetidamente;
- voz elevada;
- puños cerrados;
- amenazas;
- invasión de espacio;
- irritabilidad creciente;
- destrucción de objetos.', 21)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('965dc5ee-312f-5d87-9b38-9f3b3c59e88d', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_22', 'Clave', 'El mejor momento para desescalar suele ser **antes** de la agresión física.

---', 22)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0173aea1-68bb-5e48-a3f4-12b242745e86', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_23', '14. Prioridades de seguridad ante agresividad', '- mantener ruta de salida;
- solicitar apoyo temprano;
- reducir estímulos;
- retirar objetos peligrosos cuando sea seguro;
- evitar rodear al paciente;
- mantener distancia;
- un profesional lidera conversación;
- límites claros.

NICE recomienda un enfoque centrado en dignidad, derechos, seguridad y reducción de intervenciones restrictivas.

---', 23)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4d204c85-197e-50e5-88ef-399fc11adbc3', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_24', '15. Comunicación de desescalamiento', '- tono bajo;
- frases cortas;
- escuchar;
- reconocer emoción;
- preguntar qué necesita;
- ofrecer opciones limitadas;
- evitar provocación;
- evitar discutir.

Ejemplo:

> “Veo que está muy molesto. Quiero escuchar qué necesita, pero necesito que mantengamos las manos lejos de otras personas.”

---', 24)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('77abf0fb-14c3-5811-b4f4-3b3fc61707b4', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_25', '16. Juicios/problemas posibles — agresividad', '- riesgo de violencia;
- control de impulsos alterado;
- ansiedad;
- alteración del pensamiento;
- riesgo de lesión.', 25)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('511d8de6-a82f-53e7-85ef-a40d186d004e', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_26', 'Importante', 'La prioridad es el riesgo observable, no etiquetar al paciente.

---', 26)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0a393654-0059-501d-802f-fd78e53e261b', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_27', '17. Intervenciones restrictivas', 'Solo considerar cuando:

- existe riesgo significativo;
- otras medidas menos restrictivas han fallado o no son viables;
- se cumple normativa;
- personal está entrenado;
- existe monitorización.', 27)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b82c30d5-0bc4-58b3-8a12-b8d60d0be9d0', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_28', 'Nunca', '- como castigo;
- por conveniencia;
- para humillar.

---', 28)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('94240d46-3b8d-53e7-85dd-85f8a3bf395a', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_29', '18. Evaluación después de agresión', 'Revisar:

- lesiones;
- causas;
- desencadenantes;
- intervenciones efectivas;
- efectos de medicamentos;
- percepción del paciente;
- plan para prevenir recurrencia.

Documentar objetivamente.

---', 29)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('54c40701-5f2e-5f29-a421-60844c9d7a42', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_30', '19. PAE — PERSONA CON DEPRESIÓN', '', 30)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('8419cd04-a8de-5aff-84db-6349fb511183', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_31', 'Valoración', '- ánimo;
- anhedonia;
- sueño;
- apetito;
- energía;
- concentración;
- culpa;
- desesperanza;
- funcionamiento;
- medicamentos;
- sustancias;
- apoyo;
- ideación suicida.

---', 31)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0c9b7288-76f4-5c68-b899-6f68287ce262', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_32', '20. Evaluación de suicidio', 'Preguntar directamente:

- pensamientos de muerte;
- ideación suicida;
- plan;
- intención;
- medios;
- preparativos;
- intentos previos;
- factores protectores.', 32)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('79bfad02-9865-5f08-a901-1ccb760a5a68', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_33', 'Clave', 'Preguntar directamente no causa suicidio.

---', 33)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('77379493-a13b-5481-8aa7-d9ffaa1b5fde', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_34', '21. Alta preocupación suicida', 'Aumenta con:

- plan;
- intención;
- acceso a medios;
- intento reciente;
- agitación;
- psicosis;
- desesperanza;
- intoxicación;
- antecedentes.', 34)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('edad8111-f73a-5692-8349-40cd02d21058', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_35', 'Intervención', '- no dejar sola a la persona si riesgo inminente;
- ambiente seguro;
- retirar medios de forma segura;
- activar evaluación;
- tratar problemas médicos;
- documentar;
- continuidad.

---', 35)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4b85dc8e-0c34-5374-aa28-ba5885f8cb4d', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_36', '22. Juicios/problemas posibles — depresión', '- riesgo de autolesión;
- desesperanza;
- autocuidado disminuido;
- alteración del sueño;
- nutrición alterada;
- aislamiento;
- afrontamiento alterado.', 36)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('9873ff58-d448-51da-adee-b66dcbcdc925', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_37', 'Prioridad', 'Riesgo de muerte antes que aislamiento o autoestima.

---', 37)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1bdfaf35-abd9-537a-a81d-66e75cfbeb5b', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_38', '23. Intervenciones — depresión', '- presencia;
- comunicación simple;
- tiempo para responder;
- actividades graduales;
- apoyo al autocuidado;
- nutrición/hidratación;
- sueño;
- tratamiento prescrito;
- monitorizar respuesta;
- seguridad;
- plan de seguimiento.', 38)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2c962e25-3d3c-5e62-8eb3-e3ed9177d760', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_39', 'Evitar', '> “Tiene que animarse.”

---', 39)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d79a5be4-f374-5903-82b9-86b770c4630b', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_40', '24. Activación y suicidio', 'Durante tratamiento, algunas personas pueden recuperar energía antes de que desaparezca completamente la desesperanza.', 40)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e4ad181f-cb2c-54e0-9134-76191cb0989c', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_41', 'Enfermería', 'No asumir que mayor actividad significa automáticamente menor riesgo suicida.

Reevaluar el riesgo durante cambios clínicos.

---', 41)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('53e4ce6c-f5c1-5442-8a15-deac86279aa2', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_42', '25. Evaluación — depresión', '- ideación suicida;
- función;
- sueño;
- alimentación;
- participación;
- concentración;
- efectos adversos;
- adherencia;
- seguimiento.

---', 42)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('df08047a-d1bd-5a67-a08f-f19a490cf089', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_43', '26. PAE — PERSONA CON ANSIEDAD', '', 43)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('f71e571e-a8f2-565c-8373-348742b0fb13', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_44', 'Valoración', '- intensidad;
- desencadenantes;
- síntomas físicos;
- pensamientos;
- duración;
- evitación;
- sueño;
- sustancias;
- medicamentos;
- función;
- síntomas médicos de alarma.

---', 44)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('080bc293-41ec-5ecd-a4f0-ddbc56f3bc3c', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_45', '27. Ansiedad leve/moderada', 'Intervenciones:

- escuchar;
- permitir preguntas;
- educación;
- respiración;
- resolución de problemas;
- técnicas de afrontamiento;
- ambiente adecuado.

La persona todavía puede procesar información.

---', 45)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5f87b4ac-9eec-5f52-afaa-ad2bac2b7f90', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_46', '28. Ansiedad severa/pánico', 'Intervenciones:

- permanecer con la persona;
- reducir estímulos;
- frases cortas;
- instrucciones simples;
- respiración sin forzar hiperventilación;
- seguridad;
- valorar causas físicas;
- tratamiento prescrito.', 46)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7060ce7e-fbab-5bc5-bf43-733bd484874f', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_47', 'Error', 'Enseñar un plan complejo mientras la persona está en pánico.

---', 47)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4109f4e4-d32f-5433-985c-50c9f2003a27', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_48', '29. Diagnóstico diferencial en ansiedad', 'Antes de asumir ataque de pánico, valorar según contexto:

- síndrome coronario;
- arritmia;
- hipoxia;
- hipoglucemia;
- embolia;
- asma;
- tirotoxicosis;
- intoxicación/abstinencia.', 48)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b031d1fb-23f2-5667-b417-cb61e5d697e8', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_49', 'Clave', '“Antecedente de ansiedad” no excluye una emergencia médica.

---', 49)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c11926c6-38ed-5f0f-9dc2-ddd737209ac3', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_50', '30. Juicios/problemas posibles — ansiedad', '- ansiedad;
- afrontamiento alterado;
- sueño alterado;
- conocimiento insuficiente;
- riesgo de lesión si existe pánico/hiperventilación severa.

---', 50)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5b6020a4-27e4-5403-ba51-83242b1e37f4', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_51', '31. Resultados — ansiedad', 'Ejemplos:

- paciente identifica desencadenante;
- utiliza una técnica de afrontamiento;
- refiere disminución de intensidad;
- sigue instrucciones simples;
- mantiene seguridad.

---', 51)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('4e13c5d4-d4d7-5bb1-b396-0c4fbb03910f', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_52', '32. Evaluación — ansiedad', '- nivel de activación;
- función;
- respiración;
- síntomas físicos;
- estrategias utilizadas;
- respuesta a tratamiento;
- sueño.

---', 52)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('af0f7988-b652-5964-becc-1fffb393572e', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_53', '33. PAE — PERSONA CON MANÍA', '', 53)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('52c16ad1-2f75-5e6a-96d0-717a1386dfa0', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_54', 'Valoración', '- sueño;
- energía;
- velocidad del habla;
- pensamiento;
- grandiosidad;
- irritabilidad;
- actividad;
- impulsividad;
- gasto;
- conducta sexual;
- sustancias;
- nutrición;
- hidratación;
- psicosis;
- riesgo suicida/violencia.

---', 54)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6e5dfbd8-6287-577a-92fd-43ad86aaf364', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_55', '34. Prioridades en manía', 'Riesgos frecuentes:

- agotamiento;
- deshidratación;
- poca ingesta;
- conductas impulsivas;
- accidentes;
- conflicto;
- gastos;
- conducta sexual de riesgo;
- agresividad;
- psicosis.', 55)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a6eb73ff-a684-5baf-b145-d7471bb8f301', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_56', 'Prioridad', 'Seguridad + necesidades fisiológicas.

---', 56)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('59738105-9efa-50bc-ada4-aad48d9adbf1', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_57', '35. Intervenciones — manía', '- ambiente con pocos estímulos;
- límites claros;
- instrucciones breves;
- rutina;
- disminuir competencia;
- alimentos fáciles de consumir;
- líquidos;
- promover descanso;
- supervisar riesgo;
- tratamiento prescrito.', 57)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0b41ca6b-e7b8-582e-bf43-784db55b1440', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_58', 'No hacer', 'Entrar en discusión sobre grandiosidad.

---', 58)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('975393ce-9995-57aa-8f05-4bb94be05c56', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_59', '36. Nutrición en manía', 'Una persona muy activa puede no permanecer sentada para comer.

Estrategias:

- alimentos nutritivos fáciles de consumir;
- líquidos;
- monitorizar ingesta;
- peso;
- electrolitos si está indicado.

Esto no sustituye valoración nutricional completa.

---', 59)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6bce216f-50c6-587b-8460-ca3e97cb4e8b', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_60', '37. Sueño en manía', 'Disminución marcada de necesidad de sueño es un signo importante.

Intervenciones:

- reducir estímulos nocturnos;
- estructura;
- tratamiento indicado;
- monitorizar descanso.

La falta prolongada de sueño puede aumentar desorganización.

---', 60)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('333362a6-dea6-5471-bfba-131f854da6a7', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_61', '38. Juicios/problemas posibles — manía', '- riesgo de lesión;
- sueño alterado;
- nutrición/hidratación insuficiente;
- control de impulsos alterado;
- interacción social alterada;
- pensamiento alterado.

---', 61)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('88cbbd99-9aad-5ea1-ae8b-214ed48231d5', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_62', '39. Evaluación — manía', '- horas de sueño;
- actividad;
- ingesta;
- hidratación;
- impulsividad;
- psicosis;
- adherencia;
- seguridad.

---', 62)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('7cfdb61b-a289-50b0-8dda-26a547b601ec', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_63', '40. Priorización comparativa', '', 63)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('44a3a1a6-4136-5f25-a044-6a0c7cb636af', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_64', 'Caso A', 'Paciente escucha voces no amenazantes pero está calmado.

Prioridad:
- valorar contenido;
- mantener relación;
- estrategias.', 64)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('d5db4cc1-202b-527f-9b6b-157a7372a16f', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_65', 'Caso B', 'Paciente escucha voz que ordena suicidarse y dice que obedecerá.

Prioridad:
- **seguridad inmediata**.', 65)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('ad553047-1187-5109-ac7c-ed3bcc3dfe31', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_66', 'Caso C', 'Paciente está deprimido y aislado, sin ideación suicida.

Prioridad:
- función, apoyo, tratamiento, seguimiento.', 66)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('67b79510-0975-5c94-8d38-72b9a937d874', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_67', 'Caso D', 'Paciente deprimido con plan suicida.

Prioridad:
- **riesgo vital**.', 67)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('302bc561-8914-5ce6-bbc4-e13d87555c77', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_68', 'Regla', 'La prioridad cambia según **riesgo**, no solamente según diagnóstico.

---', 68)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b23d6072-4aa5-5a92-82fe-e2ba239f0a33', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_69', '41. Resultados SMART', 'Los resultados del PAE deben ser:

- específicos;
- observables;
- realistas;
- relacionados con el problema;
- evaluables en un tiempo definido.

Ejemplo:

> “Durante el turno, el paciente comunicará al personal si las voces le ordenan hacerse daño.”

Mejor que:

> “Paciente estará bien.”

---', 69)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('beee3bdb-499c-509e-83de-42bc0cb60cbb', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_70', '42. Documentación', 'Registrar:

- conducta observable;
- palabras relevantes textuales cuando sea necesario;
- riesgo;
- intervención;
- respuesta;
- medicamentos;
- efectos;
- notificaciones;
- seguimiento.

Ejemplo adecuado:

> “Paciente caminó rápidamente por el pasillo, elevó la voz y dijo ‘voy a golpearlo’.”

Evitar:

> “Paciente loco y peligroso.”

---', 70)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('62cee708-4ac6-531b-8f88-0713ed1ca207', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_71', '43. Evaluación continua', 'PAE no es lineal.

Si cambia el estado:

- volver a valorar;
- repriorizar;
- modificar plan;
- escalar.

Ejemplo:
Paciente inicialmente ansioso desarrolla confusión y fiebre.

Debe dejar de tratarse como “solo ansiedad” y valorarse causa médica.

---', 71)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5731ee30-557f-5fe7-b555-2bfb396e08a0', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_72', '44. Interdisciplinariedad', 'Puede involucrar:

- enfermería;
- psiquiatría;
- medicina;
- psicología;
- trabajo social;
- farmacia;
- terapia ocupacional;
- nutrición;
- servicios comunitarios.

Enfermería aporta información clave por su observación continua.

---', 72)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('077730a7-9b18-5fb7-90da-22336e16990d', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_73', '45. Continuidad y alta', 'Antes del alta:

- medicamentos;
- citas;
- transporte;
- apoyo;
- señales de alarma;
- plan de seguridad;
- recursos;
- comprensión mediante teach-back.', 73)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('2b3a2680-fcdd-5ffd-b843-f81117c23b27', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_74', 'Depresión/suicidio', 'La continuidad tras una crisis es especialmente importante.

---', 74)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('84b2665b-4a71-5c17-8bd7-6ae092a3980c', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_75', '46. Panamá — conducta suicida', 'La **Resolución N.º 099 del 11 de febrero de 2026** aprobó la Norma del Sistema de Vigilancia de la Conducta de Riesgo Suicida en Panamá.', 75)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c62fb2be-c2b0-5504-bbdf-5a468a2d7811', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_76', 'Implicación para enfermería', 'Las conductas autolesivas e intentos requieren:

- atención;
- documentación;
- vigilancia/notificación conforme al sistema;
- confidencialidad;
- continuidad.

La plataforma no inventará procedimientos de notificación institucional que no estén documentados en normativa local.

---', 76)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('341672b6-1c0c-5def-9e52-0a61fc4f69a3', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_77', '47. Derechos y dignidad', 'La atención debe:

- reducir coerción;
- proteger privacidad;
- informar;
- involucrar al paciente;
- utilizar la opción menos restrictiva compatible con seguridad.

NICE enfatiza dignidad y derechos en el manejo de violencia y agresión.

OMS promueve servicios centrados en la persona y recuperación.

---', 77)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('bb2a14e9-2ecd-536e-be36-00cf587e7a50', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_78', '48. Situaciones tipo examen', '', 78)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c5b8870e-1680-537b-8451-af0650c032ff', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_79', 'Caso 1 — Alucinación', 'Paciente escucha voces pero la enfermera pregunta únicamente “¿las oye sí o no?”.

**Falta:** valorar contenido, angustia y riesgo.', 79)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('81adce35-031e-5658-8738-a60a1ca8d3d5', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_80', 'Caso 2 — Comando', 'Voz ordena al paciente herir a su compañero.

**Prioridad:** seguridad, evaluar intención/capacidad de resistir y activar apoyo.', 80)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('25f83dfe-06fc-59bd-bed5-a937dd71b673', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_81', 'Caso 3 — Realidad', 'Enfermera responde “sí, también escucho la voz”.

**Error:** refuerza la alucinación.', 81)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0e445fd5-7cb8-53b6-8e90-ff4e6909cb89', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_82', 'Caso 4 — Agitación', 'Paciente comienza a cerrar puños y elevar la voz.

**Conducta:** intervenir temprano con desescalamiento y seguridad.', 82)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6f465bba-6a3f-5968-81f1-9965dc7dc37a', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_83', 'Caso 5 — Agresión', 'Cinco profesionales rodean al paciente y todos le hablan.

**Problema:** aumenta estímulo; un comunicador principal cuando sea posible.', 83)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('000a4543-39b1-5c19-8ff0-8d9e669da036', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_84', 'Caso 6 — Depresión', 'Paciente dice “quisiera dormir y no despertar”.

**Prioridad:** preguntar directamente sobre suicidio.', 84)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('6853bd5b-a03a-5d4a-b851-671bd918a10c', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_85', 'Caso 7 — Depresión', 'Paciente tiene plan e intención actual.

**Intervención:** no dejar solo y activar atención inmediata.', 85)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('45516563-acde-5d1e-9275-82bdda2cd5b7', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_86', 'Caso 8 — Ansiedad', 'Paciente en pánico recibe una extensa explicación educativa.

**Problema:** usar frases breves y seguridad primero.', 86)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b3d62559-4d6a-580a-8123-f4a3ffe347e9', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_87', 'Caso 9 — Dolor torácico', 'Paciente con ansiedad conocida presenta dolor nuevo y síncope.

**Prioridad:** emergencia médica hasta evaluar.', 87)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('c744fe2a-fb50-5b6d-a9a9-e389ea345055', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_88', 'Caso 10 — Manía', 'Paciente lleva días sin dormir y no se sienta a comer.

**Intervención:** reducir estímulos, líquidos/alimentos fáciles, descanso y tratamiento.', 88)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('88c43855-e975-54d1-abfe-dc7c23e41d7c', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_89', 'Caso 11 — Grandiosidad', 'Paciente afirma que posee poderes extraordinarios.

**Conducta:** no discutir ni confirmar; mantener límites y realidad.', 89)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0e0fa5cd-5d06-5492-a78c-a98762117e36', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_90', 'Caso 12 — Reevaluación', 'Paciente inicialmente calmado empieza a expresar intención suicida.

**Conducta:** repriorizar inmediatamente el PAE hacia seguridad.

---', 90)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('1f65b87f-8f0b-5fc9-ba17-e92b58693351', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_91', '49. Errores frecuentes', '1. Hacer PAE sin priorización.
2. No preguntar contenido de alucinación.
3. Confirmar alucinaciones/delirios.
4. Esperar violencia física para desescalar.
5. Usar restricciones como primera opción.
6. No descartar causas médicas de agitación.
7. No preguntar suicidio en depresión.
8. Priorizar autoestima sobre riesgo vital.
9. Dar educación larga durante pánico.
10. Asumir que todos los síntomas son ansiedad.
11. Discutir con grandiosidad maníaca.
12. Ignorar nutrición/sueño en manía.
13. Escribir resultados vagos.
14. No reevaluar.
15. Documentar etiquetas en lugar de conductas.

---', 91)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('5128c2d9-f996-5aee-8f20-0b0942e2f9c9', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_92', '50. Qué memorizar', '**PAE: valorar → diagnosticar/juzgar → planificar → implementar → evaluar.**

**En salud mental: seguridad primero.**

**Alucinación → preguntar CONTENIDO + COMANDO + RIESGO.**

**No confirmar alucinaciones/delirios.**

**Agitación → detectar temprano + desescalar + límites + seguridad.**

**Depresión → valorar suicidio directamente.**

**Plan + intención + medios = alta preocupación.**

**Ansiedad severa → mensajes breves + ambiente tranquilo + descartar causa médica.**

**Manía → bajo estímulo + límites + sueño + nutrición/hidratación + seguridad.**

**Resultado de PAE = observable, no “mejorará”.**

**Cambio clínico = volver a valorar y repriorizar.**

---', 92)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('b826b826-a044-536b-a17b-e4ee1e35fc51', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_93', '51. Fuentes y validación', '', 93)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('a9def215-0ac2-5101-aa98-0b61165a97dc', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_94', 'Fuente rectora', '**CICDE Panamá. Lineamientos para el Examen de Competencias de Profesionales de Enfermería, 2026.**', 94)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('0dd1bd07-4f62-596a-ac04-6ac7da9350c3', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_95', 'Bibliografía señalada por CICDE', '**AMIR. Enfermería Psiquiátrica y Salud Mental. 2014.**

**Galiana Roch, J. Enfermería Psiquiátrica. Elsevier. 2016.**', 95)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('36ff52b7-4e51-583b-81c9-df2b6a6729cc', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_96', 'Fuentes complementarias actuales', '**World Health Organization. Schizophrenia. 2025.**

**World Health Organization. Depressive disorder (depression). 2025.**

**World Health Organization. Anxiety disorders. 2025.**

**World Health Organization. Bipolar disorder. 2025.**

**NICE NG10. Violence and aggression: short-term management in mental health, health and community settings.**

**OpenStax. Psychiatric-Mental Health Nursing — therapeutic communication, assessment and therapeutic settings.**', 96)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('381cc357-d374-5b5d-a35f-e03ba175738d', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_97', 'Panamá', '**MINSA Panamá. Resolución N.º 099 de 11 de febrero de 2026 — Norma del Sistema de Vigilancia de la Conducta de Riesgo Suicida.**', 97)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('24c1440c-ed33-52c2-b12f-c6dc726841aa', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_98', 'Nota sobre diagnósticos de enfermería', 'Este paquete describe problemas y prioridades clínicas sin reproducir de manera extensa taxonomías propietarias. Las etiquetas diagnósticas formales deben alinearse con la edición autorizada vigente que utilice el programa académico.

---', 98)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('e5c335e5-3861-5481-aae2-ba7009fc7f0c', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_99', '52. Control de calidad', 'Este paquete:

- cubre los cinco escenarios exactos exigidos por CICDE;
- aplica las cinco etapas del PAE;
- prioriza seguridad;
- incorpora alucinaciones de comando;
- incluye desescalamiento;
- incorpora valoración suicida;
- diferencia ansiedad de emergencia médica;
- incluye sueño, nutrición y seguridad en manía;
- utiliza resultados observables;
- contiene 12 casos originales.

---', 99)
ON CONFLICT (lesson_id, section_key) DO NOTHING;
INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('55188c83-a867-57f2-a430-47441e1d7bcf', 'cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'sec_100', '53. Estado para integración', '**Estado recomendado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- alinear diagnósticos de enfermería formales con la taxonomía autorizada que use la institución;
- validar cualquier protocolo local de restricción, observación o notificación;
- vincular Resolución MINSA 099/2026;
- enlazar con MENTAL-02, MENTAL-07, MENTAL-08 y MENTAL-09.', 100)
ON CONFLICT (lesson_id, section_key) DO NOTHING;

-- 4. Insert Lesson Sources
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a15acbb0-d168-563b-86cc-38f8d8077d72', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a15acbb0-d168-563b-86cc-38f8d8077d72', '55866d0a-c1b2-566d-9afd-555ca6e1bedc', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a15acbb0-d168-563b-86cc-38f8d8077d72', 'e2d062c8-0a9a-5d40-83bd-914730debc70', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a15acbb0-d168-563b-86cc-38f8d8077d72', '1d151db0-31c9-54a6-b57d-1a0c72f561e0', NULL, 'Referencia consignada por CICDE; no utilizada aquí para diagnosticar autoestima.', false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a15acbb0-d168-563b-86cc-38f8d8077d72', '0d140138-8fe7-5ed7-8ca0-c2db48cc43a5', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a15acbb0-d168-563b-86cc-38f8d8077d72', '0cdfcc9a-e559-56ce-a34e-5c91c0182e39', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a15acbb0-d168-563b-86cc-38f8d8077d72', '5d2ae30c-de54-51d1-87a9-fa77c692a2b5', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('a15acbb0-d168-563b-86cc-38f8d8077d72', '8b23d980-68ee-5961-a843-dc929138b862', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ded19263-bf42-5185-b801-81bd378d24c7', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ded19263-bf42-5185-b801-81bd378d24c7', '55866d0a-c1b2-566d-9afd-555ca6e1bedc', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ded19263-bf42-5185-b801-81bd378d24c7', 'e2d062c8-0a9a-5d40-83bd-914730debc70', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ded19263-bf42-5185-b801-81bd378d24c7', '1d151db0-31c9-54a6-b57d-1a0c72f561e0', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ded19263-bf42-5185-b801-81bd378d24c7', '0cdfcc9a-e559-56ce-a34e-5c91c0182e39', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ded19263-bf42-5185-b801-81bd378d24c7', '0d140138-8fe7-5ed7-8ca0-c2db48cc43a5', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ded19263-bf42-5185-b801-81bd378d24c7', '29ef2133-7ab1-55e3-a4ff-84edb2249029', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ded19263-bf42-5185-b801-81bd378d24c7', '8b23d980-68ee-5961-a843-dc929138b862', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', '55866d0a-c1b2-566d-9afd-555ca6e1bedc', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'e2d062c8-0a9a-5d40-83bd-914730debc70', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', '1f2443eb-ad99-58ef-8dde-f04bbe4c4c85', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'bc9aee26-7170-5686-87d2-3277a567eb57', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', '724ba08f-6494-528e-b974-9427a9f6ae89', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', 'bdb590ae-bcea-50f4-91f6-934271f5e8bd', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', '770ec7b0-95dc-5177-8c01-1876918a1de3', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', '1f0b5a45-f9be-5cc0-ba33-85391fe8c46e', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('ed7c6b56-2dad-59a4-b64e-361c69c1ee2d', '149b6c65-0a70-5e66-bbd9-b6f77661e7de', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('4f63cdf2-a635-59c4-b7d8-9aec043c2df2', '55866d0a-c1b2-566d-9afd-555ca6e1bedc', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'e2d062c8-0a9a-5d40-83bd-914730debc70', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('4f63cdf2-a635-59c4-b7d8-9aec043c2df2', '0cdfcc9a-e559-56ce-a34e-5c91c0182e39', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'bdb590ae-bcea-50f4-91f6-934271f5e8bd', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('4f63cdf2-a635-59c4-b7d8-9aec043c2df2', '1f2443eb-ad99-58ef-8dde-f04bbe4c4c85', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('4f63cdf2-a635-59c4-b7d8-9aec043c2df2', '770ec7b0-95dc-5177-8c01-1876918a1de3', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('4f63cdf2-a635-59c4-b7d8-9aec043c2df2', '6c988212-a06a-5d7b-ae8a-793b1ccebf23', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('4f63cdf2-a635-59c4-b7d8-9aec043c2df2', '1f0b5a45-f9be-5cc0-ba33-85391fe8c46e', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('4f63cdf2-a635-59c4-b7d8-9aec043c2df2', '149b6c65-0a70-5e66-bbd9-b6f77661e7de', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('4f63cdf2-a635-59c4-b7d8-9aec043c2df2', '27941b45-2f8b-5331-ae7b-04f65bdac563', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('4f63cdf2-a635-59c4-b7d8-9aec043c2df2', 'ea8615bc-847b-558e-91c6-27996701e3d0', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('436f52b3-5e17-5296-b1d8-6d33fed54051', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('436f52b3-5e17-5296-b1d8-6d33fed54051', '55866d0a-c1b2-566d-9afd-555ca6e1bedc', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('436f52b3-5e17-5296-b1d8-6d33fed54051', 'e2d062c8-0a9a-5d40-83bd-914730debc70', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('436f52b3-5e17-5296-b1d8-6d33fed54051', 'c70f4d30-b4b4-50bf-afc0-b4295c688e53', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('436f52b3-5e17-5296-b1d8-6d33fed54051', 'a9586ec4-87b6-5dc7-9c7a-268f9810f2e8', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('436f52b3-5e17-5296-b1d8-6d33fed54051', '076f3ec0-97a8-564f-86d8-67c76d078d7e', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('436f52b3-5e17-5296-b1d8-6d33fed54051', '91790bf5-ecd2-5443-8430-74cc0c5c7c25', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1436ca61-228f-5608-9f94-a92e9504c48c', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1436ca61-228f-5608-9f94-a92e9504c48c', '55866d0a-c1b2-566d-9afd-555ca6e1bedc', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1436ca61-228f-5608-9f94-a92e9504c48c', 'e2d062c8-0a9a-5d40-83bd-914730debc70', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1436ca61-228f-5608-9f94-a92e9504c48c', '32942b75-101e-5ae7-891a-7b10a7cf3673', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1436ca61-228f-5608-9f94-a92e9504c48c', '7c992a7a-383c-5e7c-95f8-ec105fe9f459', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1436ca61-228f-5608-9f94-a92e9504c48c', 'ab3b3a24-fae9-5a46-9769-8cedb3cbe74e', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1436ca61-228f-5608-9f94-a92e9504c48c', 'df72846a-3d73-542e-9ea7-10544707d6bb', NULL, 'Contemporary analysis only; proposed triadic model is not part of CICDE scope.', false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1436ca61-228f-5608-9f94-a92e9504c48c', 'a04b4f90-b1cd-53d4-8283-10caf702b0e3', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1436ca61-228f-5608-9f94-a92e9504c48c', 'ad3c7e33-30be-5d18-83b0-6ea155a610f6', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1436ca61-228f-5608-9f94-a92e9504c48c', 'ad3e6faa-17fb-5b6b-89cb-16bc2761514f', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('1436ca61-228f-5608-9f94-a92e9504c48c', '7ede314d-dc3d-54f3-b858-1da22d299c91', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf63c556-f17f-5bb6-9a2d-c1c39d36774e', '55866d0a-c1b2-566d-9afd-555ca6e1bedc', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'e2d062c8-0a9a-5d40-83bd-914730debc70', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf63c556-f17f-5bb6-9a2d-c1c39d36774e', '1d151db0-31c9-54a6-b57d-1a0c72f561e0', NULL, 'Referenced by CICDE; full diagnostic criteria are not reproduced.', false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf63c556-f17f-5bb6-9a2d-c1c39d36774e', '92418105-a2bd-52d5-a4b8-2c1dc623f84a', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf63c556-f17f-5bb6-9a2d-c1c39d36774e', '7a2f7fcd-3aac-554a-b984-a349aace714f', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'c70f4d30-b4b4-50bf-afc0-b4295c688e53', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf63c556-f17f-5bb6-9a2d-c1c39d36774e', '1c1bf25a-ec73-5a90-b7ef-fb6c34161bce', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'db2f0dcc-a236-5644-9232-4900ac5ec801', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'bacceaac-50b6-57bd-8719-59964cdd7dad', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf63c556-f17f-5bb6-9a2d-c1c39d36774e', 'db823e30-8f2a-5976-824b-5248e6aae0be', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf63c556-f17f-5bb6-9a2d-c1c39d36774e', '36ad4090-6c86-58ec-b5cf-14d64082be69', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('f39c849c-9d42-5c01-9b47-fa7a842817ff', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('f39c849c-9d42-5c01-9b47-fa7a842817ff', '55866d0a-c1b2-566d-9afd-555ca6e1bedc', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('f39c849c-9d42-5c01-9b47-fa7a842817ff', 'e2d062c8-0a9a-5d40-83bd-914730debc70', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('f39c849c-9d42-5c01-9b47-fa7a842817ff', '8edd052b-437e-5342-9812-8887b8d58e21', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('f39c849c-9d42-5c01-9b47-fa7a842817ff', '9be44945-febe-5ac6-a5df-357a7d1b4d8e', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('f39c849c-9d42-5c01-9b47-fa7a842817ff', '07e31e2e-3226-5524-a295-f1ffd5ffc25b', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('f39c849c-9d42-5c01-9b47-fa7a842817ff', '217d083b-b626-50d2-b267-33a7d09edb2c', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('f39c849c-9d42-5c01-9b47-fa7a842817ff', 'fb315d75-01ae-5a32-b769-b0060247844b', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('f39c849c-9d42-5c01-9b47-fa7a842817ff', '3c1f8494-b5ee-5cf5-86a3-125d51f75868', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('f39c849c-9d42-5c01-9b47-fa7a842817ff', 'ec692519-6e3a-5f28-9ab6-2cac5a1ce165', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('207018b2-f2a6-5c74-86ff-87050f04cccc', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('207018b2-f2a6-5c74-86ff-87050f04cccc', '55866d0a-c1b2-566d-9afd-555ca6e1bedc', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('207018b2-f2a6-5c74-86ff-87050f04cccc', 'e2d062c8-0a9a-5d40-83bd-914730debc70', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('207018b2-f2a6-5c74-86ff-87050f04cccc', '4935c122-25c6-588b-9937-1070436e7bd6', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('207018b2-f2a6-5c74-86ff-87050f04cccc', '0cdfcc9a-e559-56ce-a34e-5c91c0182e39', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('207018b2-f2a6-5c74-86ff-87050f04cccc', '36ad4090-6c86-58ec-b5cf-14d64082be69', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'f6a33c85-e780-5680-a23d-f8bdff804d56', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf4ee694-728b-5ec7-a0a4-decfaeef0114', '55866d0a-c1b2-566d-9afd-555ca6e1bedc', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'e2d062c8-0a9a-5d40-83bd-914730debc70', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf4ee694-728b-5ec7-a0a4-decfaeef0114', '92418105-a2bd-52d5-a4b8-2c1dc623f84a', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf4ee694-728b-5ec7-a0a4-decfaeef0114', '7a2f7fcd-3aac-554a-b984-a349aace714f', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf4ee694-728b-5ec7-a0a4-decfaeef0114', 'c70f4d30-b4b4-50bf-afc0-b4295c688e53', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf4ee694-728b-5ec7-a0a4-decfaeef0114', '1c1bf25a-ec73-5a90-b7ef-fb6c34161bce', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf4ee694-728b-5ec7-a0a4-decfaeef0114', '36ad4090-6c86-58ec-b5cf-14d64082be69', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf4ee694-728b-5ec7-a0a4-decfaeef0114', '2872b9f0-074d-55d0-8789-d506e4a06607', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;
INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('cf4ee694-728b-5ec7-a0a4-decfaeef0114', '27941b45-2f8b-5331-ae7b-04f65bdac563', NULL, NULL, false)
ON CONFLICT (lesson_id, source_id) DO NOTHING;

COMMIT;
