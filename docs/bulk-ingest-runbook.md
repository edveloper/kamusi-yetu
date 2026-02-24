# Bulk Ingest Runbook (Safe Mode)

Date: February 24, 2026

## Files
- Schema: `sql/006_import_staging_schema.sql`
- Validate batch: `sql/007_import_validate_batch.sql`
- Apply batch: `sql/008_import_apply_batch.sql`
- Rollback by job id: `sql/009_import_rollback_job.sql`
- CSV template: `docs/templates/language-import-template.csv`

## Execution Order
1. Run `sql/006_import_staging_schema.sql` once.
2. Import CSV rows into `public.entry_import_staging` (Supabase Table Editor import).
3. In `sql/007_import_validate_batch.sql`, replace `BATCH_LABEL_HERE`, then run.
4. Review rejected rows:
   - `select * from public.entry_import_staging where batch_label = 'YOUR_BATCH' and status = 'rejected';`
5. Fix rejected rows directly in staging and rerun validation until clean.
6. In `sql/008_import_apply_batch.sql`, replace `BATCH_LABEL_HERE`, then run.
7. Verify import:
   - `select count(*) from public.entry_import_staging where batch_label = 'YOUR_BATCH' and status = 'imported';`
   - `select * from public.bulk_edit_jobs where source_ref = 'entry_import_staging:YOUR_BATCH' order by created_at desc limit 1;`

## Rollback
If needed:
1. Copy the import job id from `bulk_edit_jobs`.
2. In `sql/009_import_rollback_job.sql`, replace `JOB_ID_HERE`.
3. Run rollback script.

## Validation Rules Applied
1. Language code must exist in `public.languages`.
2. `headword` and `primary_definition` are required.
3. Bridge policy:
   - English rows require Swahili translation.
   - Swahili rows require English translation.
   - Other languages require at least one bridge translation.
4. Duplicate checks:
   - Duplicate within same batch.
   - Duplicate against existing entries by `(language, normalized_headword)`.
