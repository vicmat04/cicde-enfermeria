# Database Schema

## Objetivo

PostgreSQL sera la fuente de verdad de CICDE Enfermeria 2026.

La base debe soportar:

- multiples estudiantes;
- roles;
- temario jerarquico;
- lecciones estructuradas;
- fuentes verificables;
- banco de preguntas;
- practicas;
- examenes;
- simulacros;
- respuestas historicas;
- progreso;
- dominio por tema;
- flashcards en fases posteriores.

Los IDs principales utilizaran UUID.

---

# 1. Usuarios

Supabase Auth administrara credenciales en:

auth.users

La aplicacion utilizara:

## profiles

- id uuid PK -> auth.users.id
- full_name text
- role app_role
- avatar_url text nullable
- is_active boolean default true
- created_at timestamptz
- updated_at timestamptz

## app_role

Valores:

- ADMIN
- STUDENT

No crear una tabla duplicada de usuarios con contrasenas.

---

# 2. Areas CICDE

## areas

- id uuid PK
- code text unique
- name text
- description text nullable
- sort_order integer
- is_active boolean default true
- created_at timestamptz
- updated_at timestamptz

Ejemplos:

ADULT
MENTAL
PUBLIC_HEALTH
OBGYN
PEDIATRICS
ADMINISTRATION
RESEARCH
ETHICS_LEGAL
PHARMACOLOGY

---

# 3. Temas y subtemas

## topics

- id uuid PK
- area_id uuid FK -> areas.id
- parent_topic_id uuid nullable FK -> topics.id
- code text unique
- title text
- description text nullable
- sort_order integer
- is_active boolean default true
- created_at timestamptz
- updated_at timestamptz

parent_topic_id permite jerarquia ilimitada.

Ejemplo:

Funcion cardiovascular
    -> Angina
    -> Arritmias
    -> Edema pulmonar
    -> Paro cardiorrespiratorio

---

# 4. Fuentes

## source_type

Valores:

- CICDE
- PANAMA_OFFICIAL
- COMPLEMENTARY

## sources

- id uuid PK
- source_type source_type
- title text
- authors text nullable
- organization text nullable
- publisher text nullable
- publication_year integer nullable
- edition text nullable
- url text nullable
- isbn text nullable
- citation_text text
- notes text nullable
- verified boolean default false
- verified_at timestamptz nullable
- created_at timestamptz
- updated_at timestamptz

---

# 5. Lecciones

## content_status

Valores:

- DRAFT
- REVIEW
- VERIFIED
- ARCHIVED

## lessons

- id uuid PK
- topic_id uuid FK -> topics.id
- title text
- summary text nullable
- status content_status default DRAFT
- version integer default 1
- is_current boolean default true
- reviewed_at timestamptz nullable
- reviewed_by uuid nullable FK -> profiles.id
- created_at timestamptz
- updated_at timestamptz

No sobreescribir una version historica importante.

Cuando una leccion validada cambie sustancialmente, crear una nueva version.

---

# 6. Secciones de una leccion

## lesson_sections

- id uuid PK
- lesson_id uuid FK -> lessons.id
- section_key text
- title text
- body text
- sort_order integer
- created_at timestamptz
- updated_at timestamptz

section_key puede utilizar valores como:

- definition
- causes
- pathophysiology
- assessment
- signs_symptoms
- red_flags
- nursing_priorities
- interventions
- treatment
- medications
- complications
- pae
- patient_education
- memorize
- common_errors
- exam_focus

El contenido se almacenara inicialmente como Markdown.

---

# 7. Fuentes de las lecciones

## lesson_sources

- lesson_id uuid FK -> lessons.id
- source_id uuid FK -> sources.id
- reference_detail text nullable
- usage_note text nullable
- is_primary boolean default false

PK compuesta:

lesson_id + source_id

reference_detail puede contener:

- pagina;
- capitulo;
- seccion;
- norma;
- articulo.

---

# 8. Preguntas

## question_type

Valores:

- MEMORY
- COMPREHENSION
- CLINICAL_CASE
- PRIORITY
- PAE
- PHARMACOLOGY
- CALCULATION
- ETHICS

## difficulty_level

Valores:

- EASY
- MEDIUM
- HARD

## questions

- id uuid PK
- primary_topic_id uuid FK -> topics.id
- parent_question_id uuid nullable FK -> questions.id
- version integer default 1
- question_type question_type
- difficulty difficulty_level
- stem text
- explanation text
- status content_status default DRAFT
- is_current boolean default true
- created_by uuid nullable FK -> profiles.id
- reviewed_by uuid nullable FK -> profiles.id
- reviewed_at timestamptz nullable
- created_at timestamptz
- updated_at timestamptz

Una pregunta que ya tenga respuestas historicas no debe cambiar semanticamente.

Si cambia sustancialmente:

crear una nueva version y enlazarla mediante parent_question_id.

---

# 9. Opciones de respuesta

## question_options

- id uuid PK
- question_id uuid FK -> questions.id
- option_key text
- option_text text
- is_correct boolean default false
- explanation text nullable
- sort_order integer

Regla:

Las preguntas de seleccion unica deben tener exactamente una opcion correcta.

La respuesta correcta se almacena en base de datos.

No se obtiene de IA durante el examen.

---

# 10. Temas adicionales de una pregunta

## question_topics

- question_id uuid FK -> questions.id
- topic_id uuid FK -> topics.id

PK compuesta:

question_id + topic_id

Esto permite que una pregunta pueda medir mas de un tema.

---

# 11. Fuentes de preguntas

## question_sources

- question_id uuid FK -> questions.id
- source_id uuid FK -> sources.id
- reference_detail text nullable
- rationale text nullable
- is_primary boolean default false

PK compuesta:

question_id + source_id

---

# 12. Evaluaciones

Utilizaremos una estructura unificada para:

- practicas;
- examenes por modulo;
- simulacros CICDE.

## assessment_type

Valores:

- PRACTICE
- MODULE_EXAM
- MOCK_EXAM

## assessments

- id uuid PK
- title text
- assessment_type assessment_type
- description text nullable
- time_limit_minutes integer nullable
- passing_percentage numeric nullable
- question_count integer
- is_published boolean default false
- created_by uuid nullable FK -> profiles.id
- created_at timestamptz
- updated_at timestamptz

El simulacro CICDE podra configurarse con:

question_count = 200
time_limit_minutes = 240
passing_percentage = 61

---

# 13. Preguntas de una evaluacion

## assessment_questions

- assessment_id uuid FK -> assessments.id
- question_id uuid FK -> questions.id
- position integer
- points numeric default 1

PK compuesta:

assessment_id + question_id

---

# 14. Intentos

## attempt_status

Valores:

- IN_PROGRESS
- COMPLETED
- ABANDONED

## assessment_attempts

- id uuid PK
- assessment_id uuid FK -> assessments.id
- user_id uuid FK -> profiles.id
- status attempt_status
- started_at timestamptz
- completed_at timestamptz nullable
- score numeric nullable
- percentage numeric nullable
- correct_count integer nullable
- total_questions integer
- duration_seconds integer nullable
- created_at timestamptz

Nunca borrar el historial academico por editar una pregunta.

---

# 15. Respuestas

## assessment_answers

- id uuid PK
- attempt_id uuid FK -> assessment_attempts.id
- question_id uuid FK -> questions.id
- selected_option_id uuid nullable FK -> question_options.id
- is_correct boolean nullable
- response_time_seconds integer nullable
- answered_at timestamptz nullable
- marked_for_review boolean default false

Unique:

attempt_id + question_id

La correccion utilizada en un intento debe conservarse historicamente.

---

# 16. Dominio por tema

## mastery_level

Valores:

- NOT_STARTED
- WEAK
- DEVELOPING
- MASTERED
- STRONG

## topic_mastery

- user_id uuid FK -> profiles.id
- topic_id uuid FK -> topics.id
- mastery_level mastery_level
- attempts_count integer default 0
- correct_count integer default 0
- accuracy numeric default 0
- last_practiced_at timestamptz nullable
- next_review_at timestamptz nullable
- updated_at timestamptz

PK compuesta:

user_id + topic_id

Los datos detallados de assessment_answers son la fuente historica.

topic_mastery es una vista acumulada de rendimiento.

---

# 17. Flashcards

Fase posterior.

## flashcards

- id uuid PK
- topic_id uuid FK -> topics.id
- front text
- back text
- status content_status
- created_at timestamptz
- updated_at timestamptz

## flashcard_reviews

- id uuid PK
- flashcard_id uuid FK -> flashcards.id
- user_id uuid FK -> profiles.id
- rating integer
- reviewed_at timestamptz
- next_review_at timestamptz
- interval_days integer

---

# Relaciones principales

areas
  -> topics
      -> lessons
          -> lesson_sections
          -> lesson_sources
              -> sources

topics
  -> questions
      -> question_options
      -> question_sources
          -> sources

assessments
  -> assessment_questions
      -> questions

profiles
  -> assessment_attempts
      -> assessment_answers

profiles + topics
  -> topic_mastery

---

# Reglas importantes

1. PostgreSQL es la fuente de verdad.
2. Nunca guardar contrasenas en tablas publicas.
3. Mantener historial de intentos.
4. No cambiar semanticamente preguntas utilizadas en examenes historicos.
5. Versionar contenido validado cuando sea necesario.
6. Toda pregunta validada debe tener respuesta correcta y explicacion.
7. Toda pregunta validada debe poder asociarse con una fuente.
8. Toda leccion validada debe tener al menos una fuente.
9. Los estudiantes solo pueden ver su propio historial.
10. Los administradores pueden gestionar contenido.
11. RLS sera obligatorio en tablas con informacion de usuarios.
