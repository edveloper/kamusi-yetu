# Language Rollout Waves

Date: February 25, 2026
Status: Active operational guide

## Purpose

This document defines the safest rollout order for newly registered standalone Kenyan languages and the newly registered Luhya and Kalenjin subgroup languages.

It is a tactical companion to:

- [project-roadmap.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/project-roadmap.md)
- [phase-2-expansion-plan.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/phase-2-expansion-plan.md)

## Principle

Do not activate a language just because it exists in `public.languages`.

Rollout order should be:

1. registry
2. starter words
3. starter phrases
4. blurbs and UI metadata
5. validation and moderation review
6. activation

That sequence protects Phase 2 quality and prevents empty or low-trust community cards.

## Wave 1 - Safest New Standalone Additions

These are the best next candidates for starter seeding and early activation:

- Pokot (`pko`)
- Sabaot (`spy`)
- Suba (`sxb`)
- Orma (`orc`)
- Okiek (`oki`)

Reason:

- stronger public surface for lexical or descriptive sourcing
- clearer community and language identity
- better fit for starter word and phrase packs

## Wave 2 - Luhya Subgroup Rollout

These should be seeded and activated as a grouped family rather than one isolated card at a time:

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

Reason:

- they now share UI grouping under `Luhya Cluster`
- they should launch with enough lexical depth to justify subgroup distinction

## Wave 3 - Kalenjin Subgroup Rollout

These should be seeded and activated after the standalone additions and after the first Luhya subgroup wave is stable:

- Kipsigis (`sgc`)
- Nandi (`niq`)
- Tugen (`tuy`)
- Keiyo (`eyo`)
- Terik (`tec`)
- Markweeta (`enb`)

Already separate or related Kalenjin-linked records in the registry:

- Kalenjin umbrella (`kal`)
- Pokot (`pko`)
- Sabaot (`spy`)
- Okiek (`oki`)
- Omotik (`omt`)

Current execution note:

- First Kalenjin subgroup starter wave uses Kipsigis and Nandi:
  - `sql/054_stage_kalenjin_subgroup_wave1_kipsigis_nandi.sql`
  - `sql/055_validate_kalenjin_subgroup_wave1_kipsigis_nandi.sql`
  - `sql/056_apply_kalenjin_subgroup_wave1_kipsigis_nandi.sql`
  - `sql/057_activate_kalenjin_subgroup_wave1_kipsigis_nandi.sql`

## Wave 4 - Ultra-Low-Resource Languages

These should remain review-heavy and activation-delayed until stronger expert or community sourcing is available:

- Aweer (`bob`)
- Yaaku (`muu`)
- Omotik (`omt`)
- El Molo (`elo`)

Reason:

- thin public lexical surface
- higher risk of contaminating the lexicon with weak or inferred entries
- better handled through expert partnership and review-led seeding

## Minimum Activation Gate

For any newly added language or subgroup:

- at least `10` starter words
- at least `5` starter phrases
- bridge coverage on every entry
- no unresolved duplicate or validation failures
- language blurb ready
- moderation owner or review path identified

## Preferred Activation Gate

- `30+` words
- `10+` phrases
- usage examples on most phrases
- at least some audio coverage
- no major moderation backlog

## Immediate Next Action

The next Phase 2-safe move is:

1. seed Wave 1 starter packs
2. validate and apply those batches
3. activate only the Wave 1 languages that have clean starter coverage
4. then move to Luhya and Kalenjin subgroup seeding

Current execution note:

- Wave 1 is complete for `pko`, `sxb`, and `orc`:
  - `sql/038_stage_wave1_starter_packs.sql`
  - `sql/039_validate_wave1_starter_packs.sql`
  - `sql/040_apply_wave1_starter_packs.sql`
  - `sql/041_activate_wave1_languages.sql`
- Wave 2 now begins with Sabaot:
  - `sql/042_stage_wave2_sabaot_starter_pack.sql`
  - `sql/043_validate_wave2_sabaot_starter_pack.sql`
  - `sql/044_apply_wave2_sabaot_starter_pack.sql`
- Sabaot activation:
  - `sql/045_activate_sabaot_wave2.sql`
- First Luhya subgroup starter wave uses Olutsotso:
  - `sql/046_stage_luhya_subgroup_wave1_olutsotso.sql`
  - `sql/047_validate_luhya_subgroup_wave1_olutsotso.sql`
  - `sql/048_apply_luhya_subgroup_wave1_olutsotso.sql`
  - `sql/049_activate_luhya_subgroup_wave1_olutsotso.sql`
- Second Luhya subgroup starter wave uses Bukusu and Logooli:
  - `sql/050_stage_luhya_subgroup_wave2_bukusu_logooli.sql`
  - `sql/051_validate_luhya_subgroup_wave2_bukusu_logooli.sql`
  - `sql/052_apply_luhya_subgroup_wave2_bukusu_logooli.sql`
  - `sql/053_activate_luhya_subgroup_wave2_bukusu_logooli.sql`
- `oki` remains registered but pending stronger public lexical coverage or expert-supported curation before a `10 + 5` starter threshold is attempted.
