# Seed Pack System - Quick Start Guide

**Last Updated:** May 1, 2026

## What You Have Now

✅ **5 Seed Packs** (74 concepts total):
- `numbers.json` — 20 numeric concepts (1-1000)
- `greetings.json` — 12 social phrases
- `kinship.json` — 15 family relations
- `health.json` — 15 body parts + health terms
- `colors.json` — 12 color adjectives

✅ **Generator Script**:
- `scripts/generate-seed-csv.ts` — Converts JSON → CSV for import

✅ **Documentation**:
- `docs/SEED_GENERATOR_WALKTHROUGH.md` — Full step-by-step guide
- `seed-packs/README.md` — Schema and architecture docs

✅ **Language Support** (starter):
- Luo (luo) — Partial mappings for most packs
- Kikuyu (ki) — Partial mappings for core concepts

---

## Get Started in 5 Steps

### Step 1: Generate CSV (2 minutes)

```bash
npx ts-node scripts/generate-seed-csv.ts
```

Outputs:
```
output/BATCH_SEED_2026_05_01_luo.csv
output/BATCH_SEED_2026_05_01_kikuyu.csv
```

### Step 2: Inspect the CSV (5 minutes)

Open `output/BATCH_SEED_2026_05_01_luo.csv` in Excel or terminal:

```bash
head -20 output/BATCH_SEED_2026_05_01_luo.csv
```

Should show rows like:
```
batch_label,source_row_no,language_code,headword,primary_definition,...
BATCH_SEED_2026_05_01,1,luo,achiel,The number one,...
BATCH_SEED_2026_05_01,2,luo,ariyo,The number two,...
```

### Step 3: Import to Supabase (10 minutes)

Go to [supabase.com](https://supabase.com) dashboard:

1. Open your Kamusi Yetu project
2. Go to **SQL Editor**
3. Copy this (use the first CSV):

```sql
-- Replace the $$...CSV DATA...$$ section with actual CSV data

COPY public.entry_import_staging (
  batch_label, source_row_no, language_code, headword, primary_definition,
  english_translation, swahili_translation, part_of_speech, dialect_variant,
  register, pronunciation_ipa, etymology, audio_url, category, created_by,
  source_name, source_license, source_url, source_note
)
FROM stdin WITH (FORMAT csv, HEADER);
$$
[copy-paste CSV content here]
$$
;
```

### Step 4: Validate & Apply (5 minutes)

```sql
-- Run sql/007_import_validate_batch.sql
-- Then run sql/008_import_apply_batch.sql (see full guide for exact SQL)
```

### Step 5: Verify in App (2 minutes)

Go to http://localhost:3000 and:

1. Search for **"achiel"** (Luo for "one")
   - Should show entry with Swahili + English translations
2. Search for **"wuon"** (Luo for "father")
   - Should show family relationship entry

---

## What's Next?

### Add More Languages (30 min per language)

1. Edit `scripts/generate-seed-csv.ts` → add language to `languageMappings`:

```typescript
const languageMappings = {
  luo: { /* existing */ },
  kikuyu: { /* existing */ },
  kamba: {  // NEW
    'NUM_001_ONE': { headword: 'kimwe', definition: 'The number one' },
    'NUM_002_TWO': { headword: 'kili', definition: 'The number two' },
    // ... more concepts
  },
}
```

2. Re-run generator
3. Import new CSV

### Add More Seed Packs (1 hour per pack)

Choose from recommended packs in `seed-packs/README.md`:
- **VRB** (50 verbs) — Essential for all languages
- **FD** (30 foods) — Local staples
- **TME** (25 time concepts) — Days, months, seasons
- **ANM** (20 animals) — Fauna

Create new JSON file in `seed-packs/`, add to generator, re-run.

### Bulk Approve New Seeds (automated)

Once satisfied with quality, skip manual moderation:

```sql
UPDATE public.entries
SET validation_status = 'verified'
WHERE batch_label = 'BATCH_SEED_2026_05_01'
  AND language_code IN ('luo', 'ki');  -- only high-quality languages
```

---

## Directory Structure

```
kamusi-yetu/
├── seed-packs/
│   ├── README.md (schema & best practices)
│   ├── numbers.json
│   ├── greetings.json
│   ├── kinship.json
│   ├── health.json
│   └── colors.json
├── scripts/
│   └── generate-seed-csv.ts
├── output/ (generated at runtime)
│   ├── BATCH_SEED_2026_05_01_luo.csv
│   └── BATCH_SEED_2026_05_01_kikuyu.csv
└── docs/
    ├── SEED_GENERATOR_WALKTHROUGH.md (full step-by-step)
    ├── bulk-ingest-runbook.md (overview)
    └── language-import-template.csv (schema reference)
```

---

## Key Files to Know

| File | Purpose |
|------|---------|
| `seed-packs/*.json` | Concept definitions (language-agnostic) |
| `scripts/generate-seed-csv.ts` | Generator: JSON → CSV |
| `output/BATCH_*.csv` | Ready-to-import CSV files |
| `docs/SEED_GENERATOR_WALKTHROUGH.md` | Detailed step-by-step guide |
| `seed-packs/README.md` | Schema + architecture |

---

## Common Issues

| Issue | Solution |
|-------|----------|
| "ts-node not found" | `npm install -g ts-node` |
| CSV has blank headwords | Language not in `languageMappings` — add it |
| Search doesn't find new entries | Wait 5s for full-text-search reindex |
| Validation fails | Check `entry_import_staging.status` column for error |
| Can't see imported entries | Entries start as `validation_status='pending'` — approve in `/moderate` |

---

## Import Workflow at a Glance

```
JSON seed packs
       ↓
  generate CSV
       ↓
  import to staging
       ↓
  validate (SQL)
       ↓
  apply (SQL)
       ↓
  entries table
       ↓
  moderate (web UI)
       ↓
  live in search
```

---

## Command Reference

```bash
# Generate CSV
npx ts-node scripts/generate-seed-csv.ts

# View generated files
ls -la output/

# Check CSV format
head -5 output/BATCH_SEED_2026_05_01_luo.csv

# Dev server (search results)
npm run dev
# → Go to http://localhost:3000
```

---

## Full Documentation

- **[SEED_GENERATOR_WALKTHROUGH.md](../SEED_GENERATOR_WALKTHROUGH.md)** — Complete import guide with SQL
- **[seed-packs/README.md](./README.md)** — Schema, naming conventions, best practices
- **[bulk-ingest-runbook.md](../bulk-ingest-runbook.md)** — Bulk operations overview

---

## Success Indicators

✅ You're on track if:
- [ ] Generator runs without errors
- [ ] CSV files appear in `output/` directory
- [ ] CSV has 47+ rows for Luo (greetings + numbers + kinship + health + colors)
- [ ] Entries import to `entry_import_staging` without validation errors
- [ ] You can search for "achiel" and get result
- [ ] Entries appear in `/moderate` dashboard as "pending"
- [ ] You can click "Approve" and entries move to "verified"
- [ ] Search results now include your newly seeded entries

---

**Next: Follow [SEED_GENERATOR_WALKTHROUGH.md](../SEED_GENERATOR_WALKTHROUGH.md) for the complete import walkthrough.**
