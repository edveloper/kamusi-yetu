# Translation + Lexicon Foundation

Date: February 24, 2026
Status: Foundational phase largely completed; retained as historical tactical record

## Canonical Policy
- Every entry must have at least one bridge translation:
  - `english_translation` OR `swahili_translation` (or both)
- Translation flows may pivot through English or Swahili.

## Deliverables
1. Schema support for translation graph and bulk operations.
2. Audit pack for backfilling existing entries.
3. Two-week sprint backlog for implementation.

## Status Review

This document describes the foundation phase that is now mostly complete.

Completed in codebase and product:

- schema support for bridge translation, staging, apply, rollback, and bulk moderation flows
- lexicon audit and bridge backfill workflow
- `/api/translate` and `/translate` UI
- direct, bridge, and mixed bridge translation ranking
- translation feedback ingestion
- expanded language onboarding and seed import operations

What remains active has moved into later roadmap phases:

- phrase-aware translation quality improvements
- usage-example-driven ranking
- sentence and document translation work

Use [project-roadmap.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/project-roadmap.md) as the canonical current roadmap.
Use [phrase-usage-layer-design.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/phrase-usage-layer-design.md) for the current implementation phase.

## Execution Order
1. Run `sql/001_translation_schema.sql`
2. Run `sql/003_bridge_lexicon.sql`
3. Run `sql/004_bridge_autopopulate_backfill.sql`
4. Run `sql/002_lexicon_audit.sql`
5. Execute sprint backlog in `docs/sprint-backlog-2weeks.md`
