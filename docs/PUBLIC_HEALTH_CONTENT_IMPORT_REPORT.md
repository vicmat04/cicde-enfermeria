# Public Health Content Import Report

## Execution Summary

- Validated packages: **13/13**.
- Area: **PUBLIC_HEALTH**.
- Topics: **13** (PUBLIC-01 through PUBLIC-13).
- Lessons: **13**.
- Lesson sections: **1266**.
- Lesson-source relationships: **108**.
- Distinct referenced sources: **87**.
- Global duplicate source references eliminated: **21**.
- Topic migration: `20260910170000_seed_public_health_topics.sql`.
- Lesson/source migration: `20260910171000_seed_public_health_lessons_sources.sql`.

## Import Invariants

- Every lesson is imported with `status=REVIEW`, `version=1`, and `is_current=true`.
- Reviewer provenance is not invented: `reviewed_at=NULL` and `reviewed_by=NULL`.
- Every source is imported with `verified=false`, `verified_at=NULL`, and `verified_by=NULL`. None is human-verified.
- Each Markdown content section (after its package document title) is preserved as one ordered lesson section; all generated section and relationship foreign keys reference generated deterministic lesson/source IDs.
- The migrations are idempotent through `ON CONFLICT DO NOTHING` on the applicable unique keys.

## Deterministic IDs and Source Deduplication

UUID v5 (RFC 4122) uses the stable namespace `b6b8b0e0-c8f2-4b2a-a0a3-f0e0c0b8b8b8` and these names:

- Lessons: `lesson:<topicCode>:v1`
- Sections: `section:<topicCode>:v1:sec_<sort_order>`
- Sources: `source:<canonicalSourceKey>`

The global source deduplication key is `source_type | title | authors | organization | publisher | publication_year | edition | url`, with text fields trimmed and normalized to lowercase. This is compatible with the Adult and Mental generators: one canonical source ID is reused by all Public Health lesson-source relationships with identical source metadata.

## Required Re-verification and Audit Notes

- **PUBLIC-01:** The Sala/Albaladejo record has the intentional `[KNOWN_METADATA_GAP]` for organization/publisher. No metadata was invented.
- **PUBLIC-05:** Re-verify the documentary record after 18 September 2026 for a possible PABS Annex/Pandemic Agreement status change.
- **PUBLIC-08:** Audit the Panama 2026 health-system structure/context documents before integration.
- **PUBLIC-11:** Audit the Panama 2026 national vaccination schedule and documented updates before integration.
- These notes do not confer human verification; none of the imported sources is human-verified.
