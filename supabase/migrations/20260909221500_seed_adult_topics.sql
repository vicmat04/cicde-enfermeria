-- CICDE Enfermeria 2026
-- Seed top-level topics for Salud del Adulto

insert into public.topics (
  area_id,
  code,
  title,
  sort_order
)
select
  a.id,
  v.code,
  v.title,
  v.sort_order
from public.areas a
cross join (
  values
    ('ADULT-01', 'Atencion etica en enfermeria', 1),
    ('ADULT-02', 'El proceso de enfermeria', 2),
    ('ADULT-03', 'Educacion para la salud y promocion de la salud', 3),
    ('ADULT-04', 'Valoracion nutricional del adulto', 4),
    ('ADULT-05', 'Homeostasis, estres y adaptacion individual y familiar', 5),
    ('ADULT-06', 'Enfermedad cronica y discapacidad', 6),
    ('ADULT-07', 'Atencion de la salud del adulto mayor', 7),
    ('ADULT-08', 'Tratamiento del dolor', 8),
    ('ADULT-09', 'Liquidos y electrolitos', 9),
    ('ADULT-10', 'Tratamiento de pacientes con afecciones oncologicas', 10),
    ('ADULT-11', 'Paliativos', 11),
    ('ADULT-12', 'Atencion pre y post operatoria', 12),
    ('ADULT-13', 'Intercambio de gases y funcion respiratoria', 13),
    ('ADULT-14', 'Tratamiento respiratorio sin invasion corporal', 14),
    ('ADULT-15', 'Manejo de la via aerea', 15),
    ('ADULT-16', 'Intercambio de gases y funcion respiratoria: Asma, Neumonia, Broncoaspiracion y Tuberculosis', 16),
    ('ADULT-17', 'Funcion cardiovascular y circulatoria', 17),
    ('ADULT-18', 'Funcion hematica', 18),
    ('ADULT-19', 'Funcion inmunitaria: VIH-SIDA', 19),
    ('ADULT-20', 'Funcion musculoesqueletica: factores de riesgo musculoesqueleticos', 20),
    ('ADULT-21', 'Trastornos gastrointestinales y del recto', 21),
    ('ADULT-22', 'Funcion metabolica y endocrina', 22),
    ('ADULT-23', 'Funcion renal y urinaria', 23),
    ('ADULT-24', 'Funcion reproductiva', 24),
    ('ADULT-25', 'Tratamiento de paciente con quemaduras', 25),
    ('ADULT-26', 'Funcion sensorial: valoracion de pacientes con deficiencias auditivas', 26),
    ('ADULT-27', 'Funcion neurologica', 27),
    ('ADULT-28', 'Enfermedades de la comunidad', 28),
    ('ADULT-29', 'Aspectos de la atencion de enfermeria en urgencias', 29)
) as v(code, title, sort_order)
where a.code = 'ADULT'
on conflict (code) do nothing;