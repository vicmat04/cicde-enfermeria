-- Seed MENTAL topics
WITH mental_area AS (
  SELECT id FROM public.areas WHERE code = 'MENTAL'
)
INSERT INTO public.topics (area_id, code, title, sort_order)
SELECT
  a.id,
  v.code,
  v.title,
  v.sort_order
FROM mental_area a
CROSS JOIN (
  VALUES
    ('MENTAL-01', 'Estrategias de enfermería para fortalecer la autoestima, reforzar los valores', 1),
    ('MENTAL-02', 'Mecanismos de la comunicación afectiva y efectiva', 2),
    ('MENTAL-03', 'Estrategias para promover salud mental en cada etapa del ciclo vital', 3),
    ('MENTAL-04', 'Rol del profesional de enfermería en la promoción de la salud mental en la población', 4),
    ('MENTAL-05', 'Manejo de factores de riesgo: stress, ansiedad, conflicto, frustración, mecanismo de defensa', 5),
    ('MENTAL-06', 'Modelos de enfermería aplicados a la salud mental', 6),
    ('MENTAL-07', 'Cuidado de Enfermería a las personas con trastornos mentales y del comportamiento', 7),
    ('MENTAL-08', 'Farmacología (antidepresivos, ansiolíticos, antipsicóticos)', 8),
    ('MENTAL-09', 'Terapias psicodinámicas de enfermería', 9),
    ('MENTAL-10', 'PAE de pacientes con alucinación, conductas agresivas, deprimido, ansioso, maniaco', 10)
) AS v(code, title, sort_order)
ON CONFLICT (code) DO UPDATE SET title = EXCLUDED.title, sort_order = EXCLUDED.sort_order;
