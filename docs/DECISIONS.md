# Architecture Decision Log

## ADR-001 - Aplicacion web

Fecha: 2026-09-08

Decision:

Construir CICDE Enfermeria 2026 como aplicacion web.

---

## ADR-002 - Framework

Decision:

Utilizar Next.js con TypeScript y App Router.

Motivo:

Permite una arquitectura moderna, full-stack y desplegable facilmente en Vercel.

---

## ADR-003 - Backend

Decision:

Utilizar Supabase.

Servicios previstos:

- PostgreSQL
- Auth
- Storage

---

## ADR-004 - Base de datos

Decision:

PostgreSQL sera la fuente de verdad para:

- contenido;
- preguntas;
- resultados;
- progreso;
- usuarios;
- fuentes.

---

## ADR-005 - Contenido clinico

Decision:

El temario CICDE 2026 es el documento rector.

Las fuentes se clasificaran como:

- CICDE;
- oficial Panama;
- complementaria.

No atribuir informacion a una fuente que no haya sido verificada.

---

## ADR-006 - Inteligencia artificial

Decision:

La IA sera una capa de apoyo pedagogico.

No sera la fuente de verdad para las respuestas correctas del banco de preguntas.

---

## ADR-007 - Usuarios

Decision:

Diseñar desde el inicio para multiples usuarios.

Roles iniciales:

- ADMIN
- STUDENT

---

## ADR-008 - Desarrollo asistido

Decision:

ChatGPT se utilizara principalmente para:

- arquitectura;
- investigacion;
- contenido;
- especificaciones;
- revision;
- QA.

Pi sera inicialmente el agente principal de implementacion.

Antigravity podra utilizarse para tareas independientes o segunda revision.

La documentacion y Git permiten cambiar de agente sin perder contexto.

---

## ADR-009 - Estrategia de lanzamiento

Decision:

Publicar progresivamente.

No esperar a que todo el contenido CICDE este terminado.

Primer flujo requerido:

Login
-> Dashboard
-> Area
-> Tema
-> Leccion
-> Preguntas
-> Resultado
