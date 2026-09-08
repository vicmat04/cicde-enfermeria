# CICDE Enfermeria 2026

## Proposito

Plataforma web de preparacion para el Examen de Competencias de Profesionales de Enfermeria CICDE Panama 2026.

El sistema permitira a estudiantes:

- estudiar el temario oficial;
- consultar lecciones respaldadas por fuentes;
- practicar preguntas;
- resolver casos clinicos;
- realizar calculos de enfermeria;
- hacer simulacros;
- revisar errores;
- medir su progreso;
- identificar debilidades;
- recibir refuerzo personalizado.

## Documento rector

El documento oficial:

"Lineamientos para el Examen de Competencias de Profesionales de Enfermeria - Panama 2026"

es la fuente que define:

- areas;
- temas;
- subtemas;
- competencias;
- bibliografia recomendada;
- estructura general de preparacion.

No se deben eliminar ni inventar temas fuera de esta estructura sin documentarlo.

## Areas CICDE

1. Salud del Adulto
2. Salud y Enfermedad Mental
3. Salud Publica
4. Enfermeria Gineco-Obstetrica
5. Enfermeria Pediatrica
6. Administracion y Gestion
7. Investigacion
8. Aspectos Eticos y Legales
9. Farmacologia

## Filosofia del producto

La plataforma debe entrenar:

- conocimiento;
- razonamiento clinico;
- prioridades de enfermeria;
- seguridad del paciente;
- Proceso de Atencion de Enfermeria;
- calculos;
- toma de decisiones;
- aplicacion de conocimientos en situaciones.

No debe convertirse solamente en un repositorio de apuntes.

## Usuarios iniciales

### ADMIN

Puede:

- administrar contenido;
- administrar fuentes;
- crear y editar preguntas;
- crear examenes;
- consultar resultados;
- gestionar estudiantes.

### STUDENT

Puede:

- estudiar;
- practicar;
- responder evaluaciones;
- hacer simulacros;
- consultar resultados;
- revisar errores;
- consultar progreso.

## Stack inicial

- Next.js
- TypeScript
- App Router
- Tailwind CSS
- Supabase
- PostgreSQL
- Supabase Auth
- Supabase Storage
- Vercel
- OpenAI API en fases posteriores

## Principios

1. El contenido clinico debe estar respaldado por fuentes.
2. Las respuestas correctas del banco de preguntas no deben depender de una respuesta improvisada de IA.
3. La IA sera una herramienta de explicacion y apoyo.
4. El progreso del estudiante debe persistirse en base de datos.
5. La arquitectura debe admitir multiples estudiantes.
6. Seguridad y privacidad deben considerarse desde el inicio.
7. El sistema debe poder crecer sin rehacer el modelo de datos.
