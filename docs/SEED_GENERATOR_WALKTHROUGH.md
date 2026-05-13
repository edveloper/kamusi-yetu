# Bulk Seed Generator Walkthrough

Date: May 1, 2026

## Overview

This guide walks you through generating and seeding the first batch of curated seed packs into Kamusi Yetu using the new seed generator system.

You'll:
1. Generate CSV files from seed pack definitions
2. Import them into Supabase staging
3. Validate the batch
4. Apply to production
5. Verify the results

---

## Step 1: Generate CSV Files

The generator reads seed pack definitions (JSON) and produces CSV files ready for import.

### 1a. Run the generator

```bash
npx ts-node scripts/generate-seed-csv.ts
```

**Expected output:**

```
✅ Loaded 4 seed packs:
   - greetings: 12 concepts
   - health: 15 concepts
   - kinship: 15 concepts
   - numbers: 20 concepts

🔄 Generating CSVs for 2 languages...
   ✓ /path/to/output/BATCH_SEED_2026_05_01_luo.csv: 47 rows
   ✓ /path/to/output/BATCH_SEED_2026_05_01_kikuyu.csv: 10 rows

✨ Complete! Batch label: BATCH_SEED_2026_05_01
📁 CSV files saved to: /path/to/output/
```

### 1b. Inspect the generated CSV

Open `output/BATCH_SEED_2026_05_01_luo.csv` to verify it looks right:

```
"batch_label","source_row_no","language_code","headword","primary_definition",...
"BATCH_SEED_2026_05_01",1,"luo","achiel","The number one",...
"BATCH_SEED_2026_05_01",2,"luo","ariyo","The number two",...
```

---

## Step 2: Import CSV into Supabase Staging Table

The staging table is where all imports are validated before going live.

### 2a. Prepare the CSV for upload

You need to:
1. Copy the CSV content
2. Open Supabase console for your project
3. Navigate to `public.entry_import_staging` table
4. Use Table Editor → Insert → CSV paste

**Or use Supabase CLI:**

```bash
supabase db push  # (if using local setup)
```

### 2b. Upload via Supabase Table Editor

1. Log in to [supabase.com](https://supabase.com)
2. Open your Kamusi Yetu project
3. Go to **SQL Editor**
4. Run:

```sql
-- Copy/paste the CSV content into the query below
-- This is a helper to insert from CSV:

COPY public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, dialect_variant,
  register, pronunciation_ipa, etymology, audio_url, category, created_by,
  source_name, source_license, source_url, source_note
)
FROM stdin WITH (FORMAT csv, HEADER);

[paste CSV data here]
```

**Or faster: use Table Editor**
1. Click the `entry_import_staging` table
2. Click "Insert" → "Insert new row"
3. Paste CSV content (most Table Editors auto-parse)

---

## Step 3: Validate the Batch

Once imported, validate that all rows pass business rules before applying.

### 3a. Run validation SQL

```sql
-- sql/007_import_validate_batch.sql
-- Replace BATCH_LABEL_HERE with your batch label

BEGIN;

-- Validate the batch
WITH validation_results AS (
  SELECT 
    id,
    batch_label,
    language_code,
    headword,
    english_translation,
    swahili_translation,
    CASE
      WHEN language_code NOT IN (SELECT code FROM public.languages) THEN 'Invalid language code'
      WHEN headword IS NULL OR headword = '' THEN 'Headword required'
      WHEN primary_definition IS NULL OR primary_definition = '' THEN 'Definition required'
      WHEN (language_code NOT IN ('en', 'sw')) AND 
           (english_translation IS NULL OR english_translation = '') AND
           (swahili_translation IS NULL OR swahili_translation = '') 
        THEN 'At least one bridge translation required'
      ELSE 'VALID'
    END as validation_status
  FROM public.entry_import_staging
  WHERE batch_label = 'BATCH_SEED_2026_05_01'
)
UPDATE public.entry_import_staging e
SET status = v.validation_status
FROM validation_results v
WHERE e.id = v.id AND e.batch_label = 'BATCH_SEED_2026_05_01';

COMMIT;
```

### 3b. Check for rejections

```sql
SELECT * FROM public.entry_import_staging
WHERE batch_label = 'BATCH_SEED_2026_05_01' AND status != 'VALID';
```

**If rejected:** Review the `status` column message and fix directly in the table.

**If all valid:** Proceed to Step 4.

---

## Step 4: Apply the Batch

Once validated, apply the rows to production entries.

### 4a. Run the apply script

```sql
-- sql/008_import_apply_batch.sql
-- Replace BATCH_LABEL_HERE with your batch label

BEGIN;

-- Create a tracking job
INSERT INTO public.bulk_edit_jobs (
  initiated_by,
  job_type,
  status,
  source_ref,
  summary
)
VALUES (
  (SELECT id FROM auth.users() LIMIT 1), -- Use logged-in user or hardcode admin ID
  'entry_import',
  'running',
  'entry_import_staging:BATCH_SEED_2026_05_01',
  jsonb_build_object('batch_label', 'BATCH_SEED_2026_05_01', 'started_at', now())
)
RETURNING id INTO job_id;

-- Insert all validated rows into entries
INSERT INTO public.entries (
  language_id,
  headword,
  primary_definition,
  english_translation,
  swahili_translation,
  part_of_speech,
  category,
  register,
  validation_status,
  created_by,
  trust_score
)
SELECT
  (SELECT id FROM public.languages WHERE code = s.language_code),
  s.headword,
  s.primary_definition,
  s.english_translation,
  s.swahili_translation,
  s.part_of_speech,
  s.category,
  s.register,
  'pending', -- New seeds start as pending
  (SELECT id FROM auth.users() LIMIT 1),
  0
FROM public.entry_import_staging s
WHERE s.batch_label = 'BATCH_SEED_2026_05_01' AND s.status = 'VALID'
ON CONFLICT DO NOTHING;

-- Mark batch as complete
UPDATE public.bulk_edit_jobs
SET status = 'completed', completed_at = now()
WHERE source_ref = 'entry_import_staging:BATCH_SEED_2026_05_01';

-- Mark staging rows as imported
UPDATE public.entry_import_staging
SET status = 'imported'
WHERE batch_label = 'BATCH_SEED_2026_05_01' AND status = 'VALID';

COMMIT;
```

---

## Step 5: Verify the Import

Check that entries were successfully created.

### 5a. Count imported rows

```sql
SELECT COUNT(*) as imported_count
FROM public.entry_import_staging
WHERE batch_label = 'BATCH_SEED_2026_05_01' AND status = 'imported';
```

Expected: Should match the number of VALID rows you had.

### 5b. View imported entries

```sql
SELECT 
  l.name as language,
  e.headword,
  e.primary_definition,
  e.english_translation,
  e.validation_status
FROM public.entries e
JOIN public.languages l ON e.language_id = l.id
WHERE e.created_at > now() - interval '1 hour' -- Recent entries
AND (l.code = 'luo' OR l.code = 'kikuyu')
LIMIT 20;
```

### 5c. Test search functionality

Go to your app and search for a word:
- Search "achiel" (Luo for "one") → should return the entry with Swahili + English translation
- Search "wuon" (Luo for "father") → should return the kinship entry

---

## Step 6: Moderate & Approve

New seed entries start with `validation_status = 'pending'`. A moderator must review and approve them.

### 6a. Go to the Moderation Dashboard

Navigate to `/moderate` in your app.

### 6b. Filter by language and batch

- Select language: "Luo" or "Kikuyu"
- Look at entries with "pending" status
- Review headword, definition, and bridge translations

### 6c. Approve entries

For each entry:
1. Click "Approve" if correct
2. Or "Request Changes" if refinement needed

Once approved, `validation_status` becomes `'verified'` and entries appear in search.

---

## Rollback (If Needed)

If something goes wrong after apply:

```sql
-- sql/009_import_rollback_job.sql

BEGIN;

DELETE FROM public.entries
WHERE created_at > (
  SELECT started_at FROM public.bulk_edit_jobs
  WHERE source_ref = 'entry_import_staging:BATCH_SEED_2026_05_01'
);

UPDATE public.bulk_edit_jobs
SET status = 'rolled_back', completed_at = now()
WHERE source_ref = 'entry_import_staging:BATCH_SEED_2026_05_01';

COMMIT;
```

---

## Adding More Languages

To add another language (e.g., Kamba or Luhya):

1. **Update `scripts/generate-seed-csv.ts`:**
   - Add the language code to `languageMappings`
   - Fill in native headwords + definitions for concepts

   ```typescript
   kamba: {
     'NUM_001_ONE': { headword: 'kimwe', definition: 'The number one' },
     'NUM_002_TWO': { headword: 'kili', definition: 'The number two' },
     // ... more mappings
   },
   ```

2. **Re-run the generator:**
   ```bash
   npx ts-node scripts/generate-seed-csv.ts
   ```

3. **Import the new language CSV** following Steps 2-5.

---

## Why This Workflow?

| Step | Why |
|------|-----|
| Generate | Automate from structured packs, avoid manual typos |
| Validate | Catch errors before production (bridge policy, duplicates, nulls) |
| Apply | Transactional insert with rollback capability |
| Moderate | Humans verify cultural/linguistic accuracy before live |
| Track | Every import is logged with job ID for audit trail |

---

## Next Iteration

Once this batch is live and approved, you can:
1. Add more native language mappings (Somali, Oromo, Maasai, etc.)
2. Add more seed packs (Colors, Verbs, Calendar/Time, etc.)
3. Automate approval for high-confidence packs (e.g., all numbers)

---

## Questions?

- **Generator not running?** Make sure `ts-node` is installed: `npm install -g ts-node`
- **CSV looks wrong?** Check `output/` directory and inspect the file
- **Validation failing?** Review the `status` column in `entry_import_staging` for error messages
- **Need to add a concept?** Edit the appropriate JSON file in `seed-packs/`
