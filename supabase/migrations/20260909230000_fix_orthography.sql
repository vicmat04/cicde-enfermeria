-- Fix orthography for areas
UPDATE public.areas SET name = 'Salud de Adulto'
WHERE code = 'ADULT';
UPDATE public.areas SET name = 'Enfermería en Salud y Enfermedad Mental'
WHERE code = 'MENTAL';
UPDATE public.areas SET name = 'Salud Pública'
WHERE code = 'PUBLIC_HEALTH';
UPDATE public.areas SET name = 'Enfermería Gineco-Obstétrica'
WHERE code = 'OBGYN';
UPDATE public.areas SET name = 'Enfermería Pediátrica'
WHERE code = 'PEDIATRICS';
UPDATE public.areas SET name = 'Administración'
WHERE code = 'ADMINISTRATION';
UPDATE public.areas SET name = 'Investigación'
WHERE code = 'RESEARCH';
UPDATE public.areas SET name = 'Aspectos Éticos y Legales'
WHERE code = 'ETHICS_LEGAL';
UPDATE public.areas SET name = 'Farmacología'
WHERE code = 'PHARMACOLOGY';

-- Fix orthography for adult topics
UPDATE public.topics SET title = 'Atención ética en enfermería'
WHERE code = 'ADULT-01';
UPDATE public.topics SET title = 'El proceso de enfermería'
WHERE code = 'ADULT-02';
UPDATE public.topics SET
    title = 'Educación para la salud y promoción de la salud'
WHERE code = 'ADULT-03';
UPDATE public.topics SET title = 'Valoración nutricional del adulto'
WHERE code = 'ADULT-04';
UPDATE public.topics SET
    title = 'Homeostasis, estrés y adaptación individual y familiar'
WHERE code = 'ADULT-05';
UPDATE public.topics SET title = 'Enfermedad crónica y discapacidad'
WHERE code = 'ADULT-06';
UPDATE public.topics SET title = 'Atención de la salud del adulto mayor'
WHERE code = 'ADULT-07';
UPDATE public.topics SET title = 'Tratamiento del dolor'
WHERE code = 'ADULT-08';
UPDATE public.topics SET title = 'Líquidos y electrolitos'
WHERE code = 'ADULT-09';
UPDATE public.topics SET
    title = 'Tratamiento de pacientes con afecciones oncológicas'
WHERE code = 'ADULT-10';
UPDATE public.topics SET title = 'Paliativos'
WHERE code = 'ADULT-11';
UPDATE public.topics SET title = 'Atención Pre – Post operatoria'
WHERE code = 'ADULT-12';
UPDATE public.topics SET
    title = 'Intercambio de gases y la función respiratoria'
WHERE code = 'ADULT-13';
UPDATE public.topics SET
    title = 'Tratamiento respiratorio sin invasión corporal'
WHERE code = 'ADULT-14';
UPDATE public.topics SET title = 'Manejo de la vía aérea'
WHERE code = 'ADULT-15';
UPDATE public.topics SET
    title
    = 'Intercambio de gases y función Respiratoria: del Asma, Neumonía, Broncoaspiración, Tuberculosis'
WHERE code = 'ADULT-16';
UPDATE public.topics SET title = 'Función Cardiovascular y circulatoria'
WHERE code = 'ADULT-17';
UPDATE public.topics SET title = 'Función Hemática'
WHERE code = 'ADULT-18';
UPDATE public.topics SET title = 'Función Inmunitaria: VIH- Sida'
WHERE code = 'ADULT-19';
UPDATE public.topics SET
    title = 'Función musculoesquelética: Factores de riesgo musculoesqueléticos'
WHERE code = 'ADULT-20';
UPDATE public.topics SET title = 'Trastornos gastrointestinales y del recto'
WHERE code = 'ADULT-21';
UPDATE public.topics SET title = 'Función metabólica y endocrina'
WHERE code = 'ADULT-22';
UPDATE public.topics SET title = 'Función renal y urinaria'
WHERE code = 'ADULT-23';
UPDATE public.topics SET title = 'Función reproductiva'
WHERE code = 'ADULT-24';
UPDATE public.topics SET
    title = 'Tratamiento de paciente con quemaduras (Completo)'
WHERE code = 'ADULT-25';
UPDATE public.topics SET
    title
    = 'Función sensorial: valoración de pacientes con deficiencias auditivas'
WHERE code = 'ADULT-26';
UPDATE public.topics SET title = 'Función Neurológica'
WHERE code = 'ADULT-27';
UPDATE public.topics SET title = 'Enfermedades de la comunidad'
WHERE code = 'ADULT-28';
UPDATE public.topics SET
    title = 'Aspectos de la atención de enfermería en urgencias'
WHERE code = 'ADULT-29';
