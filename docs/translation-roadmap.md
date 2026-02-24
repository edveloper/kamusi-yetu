# Translation + Lexicon Foundation

Date: February 24, 2026

## Canonical Policy
- Every entry must have at least one bridge translation:
  - `english_translation` OR `swahili_translation` (or both)
- Translation flows may pivot through English or Swahili.

## Deliverables
1. Schema support for translation graph and bulk operations.
2. Audit pack for backfilling existing entries.
3. Two-week sprint backlog for implementation.

## Execution Order
1. Run `sql/001_translation_schema.sql`
2. Run `sql/003_bridge_lexicon.sql`
3. Run `sql/004_bridge_autopopulate_backfill.sql`
4. Run `sql/002_lexicon_audit.sql`
5. Execute sprint backlog in `docs/sprint-backlog-2weeks.md`
