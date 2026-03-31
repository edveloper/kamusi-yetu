# Phase 2 Expansion Plan

Date: February 25, 2026
Status: Active execution plan

## Purpose

This document turns `Phase 2 - Phrase and Usage Layer` into an operational work plan.

It covers:

1. phrase expansion for active languages
2. word expansion for active languages
3. controlled onboarding of remaining Kenyan languages
4. activation gates and quality thresholds

This is the practical companion to:

- [project-roadmap.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/project-roadmap.md)
- [phrase-usage-layer-design.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/phrase-usage-layer-design.md)

## Execution Principles

1. Depth before breadth for already active languages.
2. Phrase coverage must grow alongside word coverage.
3. New languages should be onboarded in cohorts, not all at once.
4. Every batch must remain reversible, reviewable, and bridge-complete.
5. Community contribution is useful, but curated seed packs set the baseline.

## Current Priorities

The next block of work should happen in this order:

1. Complete phrase and word expansion for the currently active indigenous languages.
2. Continue building out English and Swahili because they remain the bridge backbone.
3. Add remaining Kenyan languages in controlled cohorts.

## Active Language Expansion

### Current Active Indigenous Languages

- Kikuyu (`ki`)
- Dholuo (`luo`)
- Kamba (`kam`)
- Luhya (`luy`)
- Kalenjin (`kal`)

### Current Bridge Languages

- English (`en`)
- Swahili (`sw`)

### Operational Target Per Active Indigenous Language

Minimum next milestone:

- +100 new words
- +50 verified phrases
- usage examples on at least 70% of new phrases
- at least one bridge translation on every new entry
- both bridge translations preferred where known
- audio on top 20-30 highest-frequency words or phrases

### Suggested Expansion Domains

Words:

- family
- body and health
- food and cooking
- home and daily life
- school and education
- work and business
- religion and culture
- nature and agriculture
- transport and movement
- time and numbers

Phrases:

- greetings
- introductions
- gratitude
- apologies
- requests
- directions
- classroom phrases
- health and care phrases
- market and trade phrases
- social and family interaction

## Bridge Language Expansion

English and Swahili must keep expanding because they power cross-language translation.

### English

Target:

- add more high-frequency everyday vocabulary
- add more explanatory definitions
- add Swahili bridge coverage where missing
- add starter phrase bank

### Swahili

Target:

- continue improving English bridge completeness
- add more phrase coverage
- add more contextual examples
- improve quality of imported definitions where too shallow

## Remaining Kenyan Languages

These should be added in cohorts.

### Cohort 1 - Highest Next Practical Priority

- Gusii (`guz`)
- Meru (`mer`)
- Embu (`ebu`)
- Sheng (`x-sheng`)
- Kenyan Hindustani (`x-ke-hin`)

Reason:

- already seeded or partially represented
- relatively easier to continue from current state
- useful for proving the onboarding model beyond the original base set

### Cohort 2 - Strong Regional Expansion

- Somali (`som`)
- Borana Oromo (`orm`)
- Maasai (`mas`)
- Taita (`dav`)
- Taveta (`tvs`)

Reason:

- broadens geography and language-family range
- useful for testing moderation and bridge workflows on more diverse languages

### Cohort 3 - Additional Community Expansion

- Samburu (`saq`)
- Rendille (`rel`)
- Giriama (`nyf`)
- Digo (`dig`)
- Duruma (`dug`)

### Cohort 4 - Final Current Registry Cluster

- Chonyi (`coh`)
- Rabai (`rra`)
- Kuria (`x-ke-kur`)
- Pokomo (`x-ke-pok`)
- Turkana (`x-ke-trk`)

### Next Registry Additions - Standalone Kenyan Languages

These are the next recommended registry additions before considering deeper splits of umbrella labels like `luy` and `kal`.

- Pokot (`pko`)
- Sabaot (`spy`)
- Suba (`sxb`)
- Aweer / Boni (`bob`)
- Orma (`orc`)
- Okiek (`oki`)
- Yaaku (`muu`)
- Omotik (`omt`)
- El Molo (`elo`)

### Next Registry Additions - Luhya and Kalenjin Subgroups

These should be added as separate inactive records before any future split of the umbrella community pages.

Luhya subgroup candidates:

- Bukusu (`bxk`)
- Idakho-Isukha-Tiriki (`ida`)
- Logooli (`rag`)
- Lutachoni (`lts`)
- Lukabaras (`lkb`)
- Olushisa (`lks`)
- Olutsotso (`lto`)
- Oluwanga (`lwg`)
- Olumarama (`lrm`)
- Samia (`lsm`)
- Olukhayo (`lko`)
- Olumarachi (`lri`)
- Olunyole (`nyd`)
- Nyala (`nle`)

Kalenjin subgroup candidates:

- Kipsigis (`sgc`)
- Nandi (`niq`)
- Tugen (`tuy`)
- Keiyo (`eyo`)
- Terik (`tec`)
- Markweeta (`enb`)

### Current Onboarding State

- Cohort A is already activated in production:
  - `x-sheng`
  - `x-ke-hin`
  - `guz`
  - `mer`
  - `ebu`
- Cohorts B-D have starter seed files and can now be activated with dedicated scripts:
- Additional standalone registry additions can be registered with:
- Luhya and Kalenjin subgroup additions can be registered with:
  - `sql/037_language_registry_luhya_kalenjin_subgroups.sql`
- Additional standalone registry additions can be registered with:
  - `sql/033_language_registry_additional_kenyan_languages.sql`
- Cohorts B-D have starter seed files and can now be activated with dedicated scripts:
  - `sql/029_activate_language_cohort_b.sql`
  - `sql/030_activate_language_cohort_c.sql`
  - `sql/031_activate_language_cohort_d.sql`
- If you want to move faster after reviewing counts and blurbs, use:
  - `sql/032_activate_all_remaining_language_cohorts.sql`

## Activation Gates For New Languages

A language should not be treated as fully active until the following are true:

1. language code is confirmed
2. language record exists in `public.languages`
3. starter word pack loaded
4. starter phrase pack loaded
5. bridge coverage is near-complete
6. language blurb and UI metadata exist
7. moderation owner exists, even if initially informal

### Minimum Activation Threshold

Recommended baseline:

- 30-50 starter words
- 10-20 starter phrases
- at least one bridge field on all entries
- low duplicate rate
- no severe unresolved moderation issues in initial seed

### Preferred Activation Threshold

- 75-100 words
- 25-30 phrases
- usage examples on most phrases
- at least partial audio coverage
- stable review owner

## Batch Strategy

Use separate batch families instead of mixing everything together.

### Word Expansion Batches

Naming convention:

- `BATCH_<LANG>_WORDS_<YYYY_MM_DD>_A`

Examples:

- `BATCH_KI_WORDS_2026_02_25_A`
- `BATCH_LUO_WORDS_2026_02_25_A`

### Phrase Expansion Batches

Naming convention:

- `BATCH_<LANG>_PHRASES_<YYYY_MM_DD>_A`

Examples:

- `BATCH_KI_PHRASES_2026_02_25_A`
- `BATCH_KAM_PHRASES_2026_02_25_A`

### Example Enrichment Batches

Naming convention:

- `BATCH_<LANG>_EXAMPLES_<YYYY_MM_DD>_A`

### New Language Starter Batches

Naming convention:

- `BATCH_<LANG>_STARTER_<YYYY_MM_DD>_A`

## Required Fields By Batch Type

### Word Batch

Required:

- `language_code`
- `headword`
- `primary_definition`
- bridge translation

Preferred:

- `part_of_speech`
- `category`
- `dialect_variant`
- `pronunciation_ipa`
- `etymology`

### Phrase Batch

Required:

- `language_code`
- `headword`
- `primary_definition`
- `part_of_speech = phrase`
- bridge translation
- `usage_example`

Preferred:

- `register`
- `category`
- `audio_url`

### Example Enrichment Batch

Required:

- existing `entry_id` or deterministic headword/language match
- `example_text`
- at least one bridge translation

## Practical Work Sequence

### Block A - Finish Current Active Languages

1. Expand words for:
- `ki`
- `luo`
- `kam`
- `luy`
- `kal`

2. Then add phrase packs for the same languages.

3. Then add usage examples to phrase-heavy or weak-context entries.

### Block B - Keep Bridge Languages Strong

1. continue English word and phrase growth
2. continue Swahili word and phrase growth
3. keep bridge completeness near-total

### Block C - Onboard Remaining Languages

1. Cohort 1
2. Cohort 2
3. Cohort 3
4. Cohort 4

Do not start the next cohort until the current one has:

- starter words staged and applied
- starter phrases staged and applied
- initial moderation pass completed

## Quality Controls

Every batch should go through:

1. staging
2. validation
3. rejection review
4. apply
5. verification query
6. UI spot check

Phrase-specific checks:

1. phrase is not just a single word misclassified
2. definition is explanatory
3. usage example is natural and not circular
4. bridge translation is natural, not just token substitution

## Suggested Weekly Cadence

### Week Structure

1. one word expansion batch per active language
2. one phrase batch for 1-2 languages
3. one example enrichment pass
4. one moderation cleanup pass
5. one onboarding batch for the next cohort only if review capacity allows

## Operational Definition Of Phase 2 Completion

Phase 2 should be considered operationally complete when:

1. all currently active indigenous languages have meaningful phrase packs
2. phrase submission and moderation are routine, not experimental
3. usage examples are part of normal contribution and review
4. search, explore, trending, and translate all recognize phrase content
5. most currently registered Kenyan languages are at least starter-seeded

## Immediate Next Actions

1. create the first active-language phrase expansion batches
2. create the first active-language word expansion batches
3. decide which new-language cohort to activate next
4. track completion directly against this plan and the main roadmap
