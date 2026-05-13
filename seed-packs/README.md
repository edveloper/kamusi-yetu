# Seed Packs Directory

This directory contains concept-based seed definitions for bulk populating Kamusi Yetu with curated, high-confidence entry sets across Kenyan languages.

## What is a Seed Pack?

A seed pack is a JSON file containing a **concept matrix**: a structured list of related concepts (e.g., "all numbers 1-1000" or "family relations") with:
- **Semantic grouping** (all greetings, all body parts, etc.)
- **Multilingual reference** (English gloss + Swahili translation)
- **Metadata** (part of speech, category, tags)

Each concept in a pack is **language-agnostic**—it defines the *concept*, not language-specific terms.

Native language translations are added separately in `scripts/generate-seed-csv.ts` via the `languageMappings` object.

## Available Packs

| Pack | Concepts | Purpose |
|------|----------|---------|
| `numbers.json` | 20 | Cardinal numbers 1-1000 |
| `greetings.json` | 12 | Common social phrases |
| `kinship.json` | 15 | Family and social relations |
| `health.json` | 15 | Body parts and health concepts |

## Seed Pack Schema

Each pack is a JSON array of concept objects:

```json
[
  {
    "concept_id": "PACK_NNN_NAME",
    "semantic_pack": "semantic_group",
    "domain": "category",
    "english_gloss": "English translation of concept",
    "swahili_gloss": "Swahili translation of concept",
    "part_of_speech": "noun|verb|adjective|adverb|phrase",
    "category": "category_name",
    "phrase_type": "phrase_description or null",
    "tags": ["tag1", "tag2"],
    "notes": "Optional contextual notes"
  }
]
```

### Field Definitions

| Field | Type | Required | Purpose |
|-------|------|----------|---------|
| `concept_id` | string | ✅ | Unique identifier: `PACK_NNN_NAME` (e.g., `NUM_001_ONE`) |
| `semantic_pack` | string | ✅ | Grouping for concept (e.g., `"kinship"`, `"numbers"`) |
| `domain` | string | ✅ | Narrow category (e.g., `"family"`, `"health"`) |
| `english_gloss` | string | ✅ | English meaning of concept |
| `swahili_gloss` | string | ✅ | Swahili meaning of concept (bridge language) |
| `part_of_speech` | string | ✅ | `noun`, `verb`, `adjective`, `adverb`, or `phrase` |
| `category` | string | ✅ | Kamusi Yetu category (e.g., `"numbers"`, `"family"`, `"health"`) |
| `phrase_type` | string \| null | ✅ | For phrases: `"greeting"`, `"farewell"`, etc. or `null` for single words |
| `tags` | string[] | ✅ | Semantic tags (e.g., `["core", "beginner"]`) |
| `notes` | string | ✅ | Optional contextual notes for translators |

### Naming Convention

Concept IDs follow the pattern: `PACK_NNN_NAME`

- `PACK`: 3-letter code for semantic pack (NUM, GRT, KIN, HLT, CLR, VRB, etc.)
- `NNN`: Zero-padded sequence number (001-999)
- `NAME`: Uppercase concept name (SINGULAR for nouns)

Examples:
- `NUM_001_ONE` — Numbers, #1, concept "One"
- `GRT_005_THANK_YOU` — Greetings, #5, concept "Thank you"
- `KIN_012_FRIEND` — Kinship, #12, concept "Friend"
- `HLT_002_EYE` — Health, #2, concept "Eye"

## Adding a New Seed Pack

### Step 1: Define the concept matrix

Create a new JSON file with the pack code:

```json
// seed-packs/colors.json
[
  {
    "concept_id": "CLR_001_RED",
    "semantic_pack": "colors",
    "domain": "appearance",
    "english_gloss": "red",
    "swahili_gloss": "nyekundu",
    "part_of_speech": "adjective",
    "category": "colors",
    "phrase_type": null,
    "tags": ["primary", "basic"],
    "notes": "Primary color"
  },
  // ... more colors
]
```

### Step 2: Add language mappings

Update `scripts/generate-seed-csv.ts` → `languageMappings`:

```typescript
const languageMappings = {
  luo: {
    'CLR_001_RED': { headword: 'machweyi', definition: 'The color red' },
    'CLR_002_BLUE': { headword: 'machuong', definition: 'The color blue' },
    // ...
  },
  // ... more languages
}
```

### Step 3: Generate CSV and test

```bash
npx ts-node scripts/generate-seed-csv.ts
# Generates output/BATCH_SEED_YYYY_MM_DD_*.csv for each language
```

### Step 4: Import and validate

Follow [SEED_GENERATOR_WALKTHROUGH.md](../SEED_GENERATOR_WALKTHROUGH.md) Steps 2-5.

## Common Seed Packs

Below are packs you should create next, with estimated concept counts:

### Verbs (VRB) — 50 concepts

Universal action verbs. Examples:
- VRB_001_GO
- VRB_002_COME
- VRB_003_GIVE
- VRB_004_TAKE
- VRB_005_DO
- VRB_006_MAKE
- VRB_007_SAY
- VRB_008_THINK
- VRB_009_KNOW
- VRB_010_WANT

### Colors (CLR) — 12 concepts

Basic color set. Examples:
- CLR_001_RED
- CLR_002_BLUE
- CLR_003_GREEN
- CLR_004_YELLOW
- CLR_005_BLACK
- CLR_006_WHITE
- CLR_007_ORANGE
- CLR_008_PURPLE
- CLR_009_BROWN
- CLR_010_GRAY
- CLR_011_PINK
- CLR_012_GOLD

### Food (FD) — 30 concepts

Staple foods and kitchen items. Examples:
- FD_001_MAIZE
- FD_002_BEAN
- FD_003_RICE
- FD_004_BANANA
- FD_005_POTATO
- FD_006_CASSAVA
- FD_007_MANGO
- FD_008_PAPAYA
- FD_009_WATER
- FD_010_MILK
- ... 20 more

### Time (TME) — 25 concepts

Temporal references. Examples:
- TME_001_DAY
- TME_002_NIGHT
- TME_003_WEEK
- TME_004_MONTH
- TME_005_YEAR
- TME_006_MORNING
- TME_007_AFTERNOON
- TME_008_EVENING
- TME_009_JANUARY
- TME_010_MONDAY
- ... 15 more

### Animals (ANM) — 20 concepts

Common animals. Examples:
- ANM_001_DOG
- ANM_002_CAT
- ANM_003_COW
- ANM_004_CHICKEN
- ANM_005_BIRD
- ANM_006_FISH
- ANM_007_SNAKE
- ANM_008_LION
- ANM_009_ELEPHANT
- ANM_010_ZEBRA
- ... 10 more

## Generator Output

When you run `scripts/generate-seed-csv.ts`, it:

1. **Loads all JSON packs** from `seed-packs/`
2. **For each language** with mappings in `languageMappings`:
   - Iterates through concepts
   - Looks up native translations
   - Generates a CSV row per concept
3. **Outputs CSV files** to `output/BATCH_SEED_YYYY_MM_DD_[language].csv`

CSV files are ready to import via Supabase or via bulk import SQL.

## Workflow

```
seed-packs/*.json
       ↓
   [generator script]
       ↓
output/BATCH_SEED_*.csv
       ↓
   [Supabase import]
       ↓
entry_import_staging (validation)
       ↓
   [validation SQL]
       ↓
entries table (live)
       ↓
   [moderation]
       ↓
search (verified entries)
```

## Best Practices

1. **Keep packs focused**: One semantic category per file
2. **Use clear names**: Concept IDs should be descriptive
3. **Bridge requirement**: Always provide English + Swahili glosses
4. **Consistency**: Use same `part_of_speech` values across all packs
5. **Document**: Add notes for translators on nuances
6. **Test first**: Generate, review CSV, test with one language before full rollout

## File Size Guidelines

- Small pack: 10-20 concepts (quick test, e.g., greetings)
- Medium pack: 20-50 concepts (typical, e.g., verbs)
- Large pack: 50+ concepts (specialized domain, e.g., medical terms)

Don't exceed 200 concepts per pack—keep distinct packs focused.

## References

- [SEED_GENERATOR_WALKTHROUGH.md](../SEED_GENERATOR_WALKTHROUGH.md) — Step-by-step import guide
- [language-import-template.csv](./language-import-template.csv) — CSV schema
- [bulk-ingest-runbook.md](../bulk-ingest-runbook.md) — Bulk operations overview
