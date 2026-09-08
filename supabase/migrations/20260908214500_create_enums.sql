-- CICDE Enfermeria 2026
-- Initial PostgreSQL enum types

create type public.app_role as enum (
  'ADMIN',
  'STUDENT'
);

create type public.source_type as enum (
  'CICDE',
  'PANAMA_OFFICIAL',
  'COMPLEMENTARY'
);

create type public.content_status as enum (
  'DRAFT',
  'REVIEW',
  'VERIFIED',
  'ARCHIVED'
);

create type public.question_type as enum (
  'MEMORY',
  'COMPREHENSION',
  'CLINICAL_CASE',
  'PRIORITY',
  'PAE',
  'PHARMACOLOGY',
  'CALCULATION',
  'ETHICS'
);

create type public.difficulty_level as enum (
  'EASY',
  'MEDIUM',
  'HARD'
);

create type public.assessment_type as enum (
  'PRACTICE',
  'MODULE_EXAM',
  'MOCK_EXAM'
);

create type public.attempt_status as enum (
  'IN_PROGRESS',
  'COMPLETED',
  'ABANDONED'
);

create type public.mastery_level as enum (
  'NOT_STARTED',
  'WEAK',
  'DEVELOPING',
  'MASTERED',
  'STRONG'
);
