-- Migration: Grant authenticated access to user_lesson_progress and profiles
-- Date: 2026-09-26
-- Purpose: Fix ACL gap - enable RLS policies to function
--
-- Context: Migration 20260910280000 created user_lesson_progress table
-- with RLS policies but omitted table-level GRANTs. Policies are
-- correctly written but inoperative because PostgreSQL ACL blocks
-- access before RLS evaluation.
--
-- Additionally, user_lesson_progress policies contain EXISTS subqueries
-- that reference public.profiles (e.g., checking role='STUDENT' and is_active=true).
-- Without SELECT on profiles, these policy checks fail with "permission denied".
--
-- This migration follows the established pattern from lessons/sources
-- (see 20260909223000_create_lessons_and_sources.sql lines 82-91).

-- Revoke all permissions from anon role for defense-in-depth.
-- Even with RLS enabled and no policies for anon, explicit REVOKE
-- provides clear ACL-level denial.
REVOKE ALL PRIVILEGES ON TABLE public.user_lesson_progress FROM anon;
REVOKE ALL PRIVILEGES ON TABLE public.profiles FROM anon;

-- Grant table-level access to authenticated role.
-- user_lesson_progress: RLS policies determine row-level permissions:
--   - Active STUDENT: SELECT/INSERT/UPDATE own records
--   - ADMIN: SELECT all records (no INSERT/UPDATE policy)
--   - Inactive users: blocked by RLS
-- DELETE is not granted (no business flow requires it).
GRANT SELECT, INSERT, UPDATE ON TABLE public.user_lesson_progress TO authenticated;

-- profiles: Required for RLS policy subqueries (role/is_active checks).
-- Authenticated users need SELECT to allow policies to verify their profile.
-- RLS on profiles itself restricts users to viewing their own profile.
GRANT SELECT ON TABLE public.profiles TO authenticated;
