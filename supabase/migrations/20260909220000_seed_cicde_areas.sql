-- CICDE Enfermeria 2026
-- Seed official CICDE study areas

insert into public.areas (
  code,
  name,
  sort_order
)
values
  ('ADULT', 'Salud del Adulto', 1),
  ('MENTAL', 'Salud y Enfermedad Mental', 2),
  ('PUBLIC_HEALTH', 'Salud Publica', 3),
  ('OBGYN', 'Enfermeria Gineco-Obstetrica', 4),
  ('PEDIATRICS', 'Enfermeria Pediatrica', 5),
  ('ADMINISTRATION', 'Administracion y Gestion de los Servicios', 6),
  ('RESEARCH', 'Investigacion', 7),
  ('ETHICS_LEGAL', 'Aspectos Eticos y Legales', 8),
  ('PHARMACOLOGY', 'Farmacologia', 9);