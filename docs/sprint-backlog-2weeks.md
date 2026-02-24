# Sprint Backlog (2 Weeks)

Date range: Feb 24, 2026 - Mar 9, 2026
Policy: Every entry needs at least one bridge field (`english_translation` or `swahili_translation`).

## Sprint Goal
Ship v1 foundation for language expansion + bridge-based translation + bulk lexicon cleanup.

## Workstreams

### Software Engineering
1. Run `sql/001_translation_schema.sql` in Supabase.
2. Run `sql/002_lexicon_audit.sql` and export backlog CSV.
3. Add server endpoint: `POST /api/translate`.
4. Implement translation ranking pipeline:
   - direct entry_translations edge
   - pivot via Swahili
   - pivot via English
5. Return payload: `translation`, `confidence`, `path_type`, `source_entry_ids`.
6. Add admin endpoint for bulk dry-run and apply jobs.
7. Add rollback endpoint based on `bulk_edit_job_items.old_row`.

### UI/UX
1. Add `/translate` page with source/target selectors + candidate list.
2. Display translation provenance badges: Direct / Via Swahili / Via English.
3. Add confidence labels: High/Medium/Low.
4. Add contributor notice in Contribute form:
   - "At least one bridge translation is required (English or Swahili)."

### QA
1. Add integration tests for bridge policy enforcement.
2. Add tests for `/api/translate`:
   - direct match
   - pivot_sw fallback
   - pivot_en fallback
   - no-result behavior
3. Add tests for bulk job lifecycle:
   - dry-run
   - apply
   - rollback
4. Add regression tests for existing contribute/edit flows.

### ML/Ranking
1. Define initial confidence rubric:
   - manual verified edge: 0.90+
   - direct unverified edge: 0.70
   - pivot two-hop: 0.45-0.65
2. Add feedback ingestion from `translation_feedback`.
3. Create weekly recalibration notebook/query for confidence thresholds.

## Progress Snapshot (Feb 24, 2026)
- Completed: `POST /api/translate` + `/translate` UI with path badges and confidence labels.
- Completed: bridge pivoting via EN/SW and mixed bridge fallbacks.
- Completed: feedback ingestion pipeline:
  - `POST /api/translate/feedback`
  - UI feedback actions on translation candidates (correct/partially correct/incorrect).
- Completed: moderator bulk operations endpoint:
  - `POST /api/moderation/bulk-jobs` with `dry_run_backfill_bridge`, `apply_job`, `rollback_job`.
- Completed: bridge policy validation in suggestion apply/review flow.
- Completed: automated QA test harness (`npm run test`) with coverage for:
  - translate ranking behavior (direct, pivot fallback, no-result),
  - feedback validation/method mapping,
  - bulk bridge dry-run logic + lifecycle status transitions.

## Prioritized Tickets
1. DB migration + audit script execution.
2. `/api/translate` MVP.
3. `/translate` UI MVP.
4. Bulk backfill dry-run + first apply batch (verified entries first).
5. Constraint validation after safe threshold reached.

## Definition of Done
1. Translate API returns deterministic results with confidence + path.
2. New submissions cannot be saved without EN or SW bridge field.
3. Audit dashboard shows decreasing missing-bridge count.
4. Bulk updates are reversible by job id.
5. QA pass on core flows (contribute, search, entry, moderation, translate).

## Risks
1. Ambiguous polysemy across dialects.
2. Over-aggressive automatic backfill quality.
3. Moderator capacity for review.

## Mitigation
1. Keep auto-backfill to conservative high-confidence cases only.
2. Route uncertain updates to moderation queue.
3. Enforce dry-run + rollback for every bulk job.
