# MVP Plan

## Fase 0 - Fundacion

Objetivo:

Tener una aplicacion Next.js estable y documentada.

Incluye:

- Next.js
- TypeScript
- Tailwind
- Git
- documentacion base

Estado inicial:
EN PROGRESO

---

## Fase 1 - Backend y autenticacion

Objetivo:

Configurar Supabase correctamente.

Incluye:

- proyecto Supabase;
- variables de entorno;
- PostgreSQL;
- Supabase Auth;
- perfiles;
- roles;
- Row Level Security inicial.

Criterio de aceptacion:

Un usuario puede iniciar sesion y acceder solamente a los recursos permitidos por su rol.

---

## Fase 2 - Estructura CICDE

Objetivo:

Representar el temario oficial en la base de datos.

Incluye:

- areas;
- temas;
- subtemas;
- fuentes;
- relaciones entre temas y fuentes.

Criterio de aceptacion:

El usuario puede navegar:

Dashboard
-> Area
-> Tema
-> Leccion

---

## Fase 3 - Lecciones

Objetivo:

Mostrar contenido de estudio estructurado.

Incluye:

- titulo;
- resumen;
- contenido;
- puntos clave;
- fuentes;
- estado del contenido.

Criterio de aceptacion:

Un estudiante puede abrir una leccion real y consultar sus fuentes.

---

## Fase 4 - Banco de preguntas

Objetivo:

Permitir practicas evaluadas.

Incluye:

- preguntas;
- opciones;
- respuesta correcta;
- explicacion;
- dificultad;
- tipo;
- fuentes.

Criterio de aceptacion:

Un estudiante puede realizar una practica de 10 preguntas y recibir resultado.

---

## Fase 5 - Seguimiento

Objetivo:

Persistir rendimiento.

Incluye:

- intentos;
- respuestas;
- porcentaje;
- historial;
- progreso por tema;
- temas debiles.

Criterio de aceptacion:

Cerrar sesion y volver a entrar no elimina el progreso.

---

## Fase 6 - Simulacros

Objetivo:

Simular el examen CICDE.

Incluye:

- examen de 200 preguntas;
- temporizador;
- navegacion;
- preguntas marcadas para revisar;
- resultados generales;
- resultados por area.

---

## Fase 7 - Flashcards y repeticion

Incluye:

- tarjetas;
- revisiones;
- siguiente fecha de estudio;
- frecuencia adaptativa.

---

## Fase 8 - Tutor IA

Objetivo:

Utilizar IA como apoyo pedagogico.

Funciones:

- explicar respuesta;
- simplificar conceptos;
- generar ejemplos;
- generar ejercicios similares;
- orientar repasos.

La IA no determina de forma improvisada las respuestas correctas del banco validado.

---

## Primera version utilizable

Debe permitir:

Login
-> Dashboard
-> Areas
-> Temas
-> Leccion
-> Practica
-> Resultado

No esperar a completar las nueve areas para publicar el primer MVP.
