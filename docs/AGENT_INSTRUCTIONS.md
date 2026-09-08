# Agent Instructions

## Regla principal

Antes de modificar el proyecto, leer:

1. docs/PROJECT_BRIEF.md
2. docs/AGENT_INSTRUCTIONS.md
3. docs/MVP_PLAN.md
4. docs/DECISIONS.md

Cuando existan:

5. docs/DATABASE_SCHEMA.md
6. docs/CONTENT_MODEL.md
7. docs/ROUTES.md
8. docs/AUTH_AND_ROLES.md

## Arquitectura

No cambiar decisiones arquitectonicas importantes sin documentar primero la propuesta.

No sustituir tecnologias principales sin autorizacion.

Stack aprobado:

- Next.js
- TypeScript
- App Router
- Tailwind CSS
- Supabase
- PostgreSQL
- Supabase Auth
- Vercel

## Desarrollo

- TypeScript estricto.
- Evitar `any` salvo justificacion.
- Componentes pequenos y reutilizables.
- Preferir Server Components cuando tenga sentido.
- Usar Client Components solamente cuando sean necesarios.
- No exponer secretos al navegador.
- Validar entradas del usuario.
- Manejar errores de forma explicita.

## Base de datos

- PostgreSQL sera la fuente de verdad.
- Las relaciones deben estar normalizadas cuando sea razonable.
- No almacenar respuestas o resultados importantes solamente en el cliente.
- Diseñar para multiples usuarios.
- Usar Row Level Security cuando se implemente Supabase.

## Contenido clinico

Nunca inventar:

- fuentes;
- referencias;
- respuestas correctas;
- citas bibliograficas;
- normas panamenas.

Las lecciones, preguntas y explicaciones validadas deben persistirse en base de datos.

La IA no debe utilizarse como fuente de verdad para determinar respuestas correctas durante un examen.

## Preguntas

Cada pregunta debe poder relacionarse con:

- area;
- tema;
- dificultad;
- tipo;
- respuesta correcta;
- explicacion;
- fuente.

Tipos previstos:

- memoria;
- comprension;
- caso clinico;
- prioridad;
- PAE;
- farmacologia;
- calculo;
- etica.

## Git

Crear cambios pequenos y coherentes.

Ejemplos:

feat: add authentication
feat: add cicde areas
feat: add topic navigation
feat: add question engine

No mezclar grandes refactors con nuevas funcionalidades si puede evitarse.

## Documentacion

Toda decision importante debe registrarse en docs/DECISIONS.md.

Si cambia el modelo de datos, actualizar docs/DATABASE_SCHEMA.md.

Si cambia una ruta importante, actualizar docs/ROUTES.md.

## Restricciones

No implementar funcionalidades fuera de la fase actual del MVP sin autorizacion.

No agregar librerias grandes si la funcionalidad puede resolverse razonablemente con el stack existente.

No construir todavia funcionalidades de IA hasta que el sistema base de contenido, preguntas y progreso este estable.
