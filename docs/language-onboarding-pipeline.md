# Language Onboarding Pipeline

Date: February 24, 2026

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
1. Exact language list: `Partial`
- You have a working list of active languages, but no single canonical onboarding registry document defining rollout status and ownership.

2. ISO/code conventions: `Partial`
- `en` and `sw` are standard.
- Some other codes are usable but not consistently ISO-oriented (`ki`/`kal` likely need canonicalization policy).

3. Script/orthography rules: `Not fully defined`
- There is no enforced written policy for Unicode normalization, casing, diacritics handling, and variant spelling governance.

4. Bridge policy defaults: `Yes`
- This is already implemented and enforced in workflow: at least one bridge (`english_translation` or `swahili_translation`) required, with stronger language-specific constraints in moderation/app logic.

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

