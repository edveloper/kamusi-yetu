# First Batch Playbook (No Existing Batch Needed)

Date: February 24, 2026

This creates your first import batch even if you have no external dataset yet.

## Goal
Start with your own high-quality verified English/Swahili core, then fill the target-language terms.

## Why this works
1. You already trust your EN/SW bridge.
2. New-language contributors only need to provide:
- `headword` (target language)
- `primary_definition` (recommended in English or Swahili)
3. Bridge fields are prefilled from your canonical base.

## Steps
1. Run source tracking migration once:
- `sql/010_import_source_tracking.sql`

2. Generate a seed CSV:
- Open `sql/011_generate_batch_seed_from_bridge.sql`
- Replace:
  - `BATCH_LABEL_HERE` (example: `BATCH_SHENG_2026_02_24_A`)
  - `target_language_code` (example: `x-sheng` or `x-ke-hin`)
  - `max_rows` (start with 100-300)
- Run query and export results as CSV.

3. Fill the CSV:
- Required to fill per row:
  - `headword`
  - `primary_definition`
- Keep prefilled bridge fields (`english_translation`, `swahili_translation`) unless correction is needed.

4. Import CSV to staging table:
- `public.entry_import_staging`

5. Validate + apply:
- Validate: `sql/007_import_validate_batch.sql`
- Apply: `sql/008_import_apply_batch.sql`

6. Roll back if needed:
- `sql/009_import_rollback_job.sql`

## Free Data Sources (Optional Boost)
If you want to accelerate beyond community curation:
1. PanLex (CC0): https://panlex.org/license
2. Wiktionary dumps/legal (attribution required): https://dumps.wikimedia.org/legal.html
3. Kaikki extracts (Wiktionary-derived): https://kaikki.org/simplewiktionary/

## Recommended start order
1. `x-sheng` (community-sourced terms are easiest to validate locally)
2. `x-ke-hin`
3. One additional Kenyan language with active contributor coverage
