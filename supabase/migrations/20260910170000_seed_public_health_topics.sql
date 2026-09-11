-- CICDE Enfermeria 2026
-- Auto-generated seed for PUBLIC_HEALTH topics
BEGIN;

INSERT INTO public.topics (area_id, code, title, sort_order)
SELECT area.id, topic.code, topic.title, topic.sort_order
FROM public.areas AS area
CROSS JOIN (
  VALUES
    ('PUBLIC-01', 'Interacción entre el Ser Humano y su Entorno', 1),
    ('PUBLIC-02', 'Enfermedades Zoonóticas y Ecología', 2),
    ('PUBLIC-03', 'Urbanización y Salud', 3),
    ('PUBLIC-04', 'Riesgos para la salud del individuo y el medio ambiente', 4),
    ('PUBLIC-05', 'Políticas de Salud Pública globales', 5),
    ('PUBLIC-06', 'Las funciones esenciales de salud pública', 6),
    ('PUBLIC-07', 'Los determinantes de la salud', 7),
    ('PUBLIC-08', 'Enfermería en Salud Pública', 8),
    ('PUBLIC-09', 'Promoción de la Salud', 9),
    ('PUBLIC-10', 'Prevención de la Enfermedad', 10),
    ('PUBLIC-11', 'Programa ampliado de inmunización', 11),
    ('PUBLIC-12', 'Concepto, estructura y tipos de familias', 12),
    ('PUBLIC-13', 'Diagnóstico integral de salud', 13)
) AS topic(code, title, sort_order)
WHERE area.code = 'PUBLIC_HEALTH'
ON CONFLICT (code) DO NOTHING;

COMMIT;
