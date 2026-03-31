# Language Onboarding Pipeline

Date: February 24, 2026
Status: Active reference; initial registry rollout completed

## 1) Current-State Check (Your Existing Languages)

Current active set in your lexicon/audit:
- English (`en`)
- Swahili (`sw`)
- Kikuyu (`ki`)
- Dholuo (`luo`)
- Kamba (`kam`)
- Luhya (`luy`)
- Kalenjin (`kal`)

Assessment against onboarding requirements:
1. Exact language list: `Mostly in place`
- You now have a working registry, active base languages, and inactive/seeded expansion languages in the system.
- What is still missing is a stronger ownership/readiness table per language.

2. ISO/code conventions: `Operational but still needs governance`
- `en` and `sw` are standard.
- the current registry uses a practical mix of ISO-like and private-use codes.
- final canonicalization policy is still needed before wider public/API commitments.

3. Script/orthography rules: `Partially defined`
- application search/indexing now uses normalized matching behavior.
- native orthography preservation is part of current product behavior.
- a fuller governance document for spelling variants and moderation handling is still pending.

4. Bridge policy defaults: `Yes`
- This is already implemented and enforced in workflow: at least one bridge (`english_translation` or `swahili_translation`) required, with stronger language-specific constraints in moderation/app logic.

## Current Status Review

What has been accomplished since this document was drafted:

- expansion languages were registered in the language table
- starter packs were seeded for multiple new languages
- first language activation cohorts were introduced to product surfaces
- language-specific community blurbs and visibility were added across the UI
- bridge policy enforcement is active across contribution, suggestion, and moderation flows

What is still required to fully finish onboarding governance:

1. assign maturity/readiness labels per language:
- `seed`
- `emerging`
- `usable`
- `review-heavy`
- `production-ready`

2. define language ownership:
- moderator owner
- contributor pipeline
- phrase pack status
- audio/example coverage status

3. define orthography review rules per language where needed

## 2) Code Convention (Going Forward)

Use this convention:
1. Use ISO where stable and confirmed.
- ISO 639-1 for global languages when available (`en`, `sw`).
- ISO 639-3 for Kenyan/indigenous languages where confirmed.

2. Use `x-` private-use codes where standardization is disputed or mixed usage.
- Example: `x-sheng`, `x-ke-hindustani`.

3. Keep `code` immutable once production data exists.
- If you need canonical migration, do it in a dedicated script with compatibility mapping.

## 3) Orthography + Script Defaults

Apply to all new languages:
1. Script: `Latin` unless explicitly documented otherwise.
2. Store `headword` in preferred native orthography.
3. Normalize comparison/index fields to lowercase + whitespace-normalized + diacritic-insensitive form.
4. Do not strip diacritics from display text; only from normalized search keys.
5. Preserve apostrophes and glottal markers where linguistically meaningful.
6. Treat dialectal variants as separate entries or tagged variants, not silent overwrite.

## 4) Bridge Policy Defaults (Onboarding)

Per-entry minimum bridge policy:
1. English entries must have `swahili_translation`.
2. Swahili entries must have `english_translation`.
3. All other languages must have at least one bridge; target is both.
4. New language activation gate:
- `is_active = false` until:
  - moderation owner assigned,
  - starter lexicon imported,
  - bridge coverage >= agreed threshold (recommended 90%+ for initial publish).

## 5) Exact Onboarding List (Next Expansion Batch)

This is the proposed next batch to register now (inactive first):
1. Sheng (`x-sheng`)
2. Kenyan Hindustani / Kenyan Indian (`x-ke-hindustani`)
3. Gusii (`guz`)
4. Meru (`mer`)
5. Embu (`ebu`)
6. Maasai (`mas`)
7. Turkana (`x-ke-turkana`)
8. Somali (Kenya) (`som`)
9. Borana Oromo (`orm`)
10. Pokomo (`x-ke-pokomo`)
11. Taita (`dav`)
12. Taveta (`tvs`)
13. Samburu (`saq`)
14. Rendille (`rel`)
15. Kuria (`x-ke-kuria`)
16. Giriama (`nyf`)
17. Digo (`dig`)
18. Duruma (`dug`)
19. Chonyi (`coh`)
20. Rabai (`rra`)

Notes:
- Entries marked `x-ke-*` should be confirmed for final code choice before public API commitments.
- Existing production languages can remain as-is now to avoid disruption.
