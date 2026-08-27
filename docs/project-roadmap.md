# LughaKonnect Project Roadmap

Date: February 25, 2026
Status: Active working roadmap

## Current Active Checkpoint

The next active checkpoint is `Phase 2 - Phrase and Usage Layer`.

Working design document:

- [phrase-usage-layer-design.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/phrase-usage-layer-design.md)
- [phase-2-expansion-plan.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/phase-2-expansion-plan.md)
- [language-rollout-waves.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/language-rollout-waves.md)
- [trending-visual-spec.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/trending-visual-spec.md)

Checkpoint progress:

- design document created
- phrase-aware validation added to contribute and edit/apply flows
- first SQL migration added for structured usage examples
- explicit phrase contribution mode shipped in contribute, explore, and search surfaces
- moderator dashboard now tracks and filters phrase/example review gaps
- trending now highlights phrase missions and contextual contribution gaps

## Vision

LughaKonnect is being built in phases:

1. Preserve and grow high-quality lexical data for Kenyan languages.
2. Deliver reliable word and phrase translation across those languages.
3. Build the data, review systems, and product workflows needed for sentence, document, and speech translation.
4. Expand beyond Kenya into a broader African language translation platform.

The long-term target is not "just a dictionary." It is a translation system with the quality controls, language coverage, and feedback loops required to eventually approach DeepL-like usefulness for underserved African languages.

## Current Product Position

Today the product is in the `dictionary + bridge translation foundation` phase.

What the platform can already do:

- Host multilingual dictionary entries with moderation and contribution flows.
- Translate between supported languages using direct matches and bridge pivots via English and Swahili.
- Ingest lexicon data in batches through staging, validation, apply, and rollback workflows.
- Track moderation health, bridge coverage, and contribution activity.
- Surface community/language discovery through homepage, explore, search, and trending experiences.

## What We Have Accomplished

### Data Foundation

- Established bridge translation policy:
  - English entries require Swahili translation.
  - Swahili entries require English translation.
  - Other languages require at least one bridge translation.
- Added translation schema, bridge lexicon, staging imports, validation, apply, and rollback SQL flows.
- Audited and backfilled bridge fields for existing lexicon data.
- Imported larger English and Swahili foundation sets from FreeDict.
- Added source tracking for imported data.
- Added staging uniqueness guard to reduce accidental duplicate staging rows.

### Language Expansion

- Registered additional rollout languages in the language registry.
- Seeded curated starter packs for multiple new and existing Kenyan languages.
- Activated at least the first onboarding cohort for product visibility.
- Improved community metadata so language cards and dictionary headers describe each language specifically.

### Translation Layer

- Shipped `POST /api/translate`.
- Implemented translation ranking with:
  - direct path
  - bridge via Swahili
  - bridge via English
  - mixed bridge fallback
- Added confidence labels and provenance badges in the translation UI.
- Added translation feedback capture through `POST /api/translate/feedback`.

### Moderation and Operations

- Added moderator bulk job lifecycle support.
- Improved bridge health reporting beyond the initial capped dataset behavior.
- Improved language risk visibility on moderation surfaces.
- Added phrase-aware moderation filters and completion signals.
- Added phrase/example health metrics to moderation dashboards.
- Fixed archived contributions loading in profile.
- Established practical batch runbooks in `docs/`.

### Product and UX

- Shipped dictionary search and translation surfaces as distinct product concepts.
- Improved homepage and about page messaging to reflect language growth and long-term translation ambition.
- Added stronger contribution prompts for words and phrases.
- Made phrase contribution explicit and distinct from word contribution in end-user forms and CTAs.
- Added word-vs-phrase filters to dictionary search and explore.
- Began shaping `Trending` as a gap-discovery and contribution surface.
- Expanded `Trending` to invite phrase and contextual contribution, especially for lower-coverage languages.

## Product Phases

### Phase 1 - Verified Dictionary Core

Goal:
- Make LughaKonnect the most usable community dictionary for Kenyan languages.

Primary outcomes:
- Stable entry model
- Searchable lexicon
- Moderation workflow
- Source-aware ingestion
- Reliable bridge coverage

Exit criteria:
- All active languages have usable starter lexicons.
- Bridge coverage is high enough that search and translation are consistently useful.
- Moderators can safely review, import, and roll back content.

### Phase 2 - Phrase and Usage Layer

Goal:
- Move from isolated words to real meaning in context.

Primary outcomes:
- Phrase entries
- Usage examples
- Register and formality tagging
- Domain tags
- Better contributor prompts for contextual data

Exit criteria:
- Major languages have a meaningful starter phrase bank.
- Common user intents can be translated at phrase level, not just word level.
- Example sentences are part of the contribution and moderation loop.

### Phase 3 - Sentence Translation System

Goal:
- Produce useful sentence translation for supported language pairs.

Primary outcomes:
- Sentence segmentation and normalization
- Translation memory
- Example-driven ranking
- Better fallback logic for unknown words
- Human feedback loops to improve candidate quality

Exit criteria:
- Sentence translation is measurably better than naive word substitution.
- Review tooling exists for sentence-level quality evaluation.

### Phase 4 - Document Translation

Goal:
- Translate full passages and documents with consistency.

Primary outcomes:
- Glossary-aware document workflows
- Named entity handling
- Domain-specific translation profiles
- Quality scoring and reviewer handoff

Exit criteria:
- Documents can be processed with acceptable consistency for practical use.
- Human-in-the-loop review is operational for sensitive domains.

### Phase 5 - Speech and Multimodal Translation

Goal:
- Support real-time and accessible translation experiences.

Primary outcomes:
- Speech-to-text
- Text-to-speech
- Live conversation support
- Phrase/audio capture loops from contributors

Exit criteria:
- Users can speak, hear, and review translations in supported languages.

### Phase 6 - African Language Platform

Goal:
- Expand the operating model beyond Kenya without collapsing quality.

Primary outcomes:
- Multi-country onboarding framework
- Stronger code and orthography governance
- Language-specific moderation ownership
- Regional domain packs

Exit criteria:
- The same quality, ingestion, and moderation model works for additional African languages.

## Near-Term Roadmap

### Next 30 Days

- Strengthen `Explore` into a true dictionary surface:
  - stronger search
  - starts-with browsing
  - part-of-speech filters
  - audio/example filters
  - better zero-result contribution prompts
- Add phrase data model and initial phrase contribution workflow.
- Expand curated starter packs for newly onboarded languages.
- Tighten moderation queues around:
  - missing bridge fields
  - weak definitions
  - duplicate detection
  - imported entry cleanup

Immediate implementation order:

1. Define SQL and API model for usage examples.
2. Add phrase-specific validation and moderation rules.
3. Expose phrase/example filters in dictionary search surfaces.
4. Seed and review small high-quality phrase packs for active languages.
5. Add phrase-aware translation ranking so multi-word inputs prefer phrase matches.

### Next 60-90 Days

- Add phrase translation UI and API support.
- Add usage examples per entry.
- Add quality dashboards by language:
  - total entries
  - bridge coverage
  - definition quality
  - moderation backlog
- Formalize publish-readiness thresholds per language.

### Next 3-6 Months

- Begin sentence translation experiments using:
  - phrase memory
  - bridge graph signals
  - curated examples
  - user feedback
- Build richer contributor tasks for underrepresented languages.
- Add domain packs for education, health, governance, and culture.

## What Must Be True To Reach DeepL-Like Quality

This is the hard constraint set:

1. Data depth
- We need far more than isolated word pairs.
- We need phrases, usage examples, variant spellings, dialect notes, and domain terminology.

2. Data quality
- Community contribution alone is not enough.
- We need moderation, provenance, confidence scoring, and rollbackable operations.

3. Language coverage strategy
- We should avoid pretending every language can progress at the same pace.
- Each language needs a clear maturity status: seed, emerging, usable, review-heavy, production-ready.

4. Feedback loops
- Translation quality improves only if users can signal correct, partial, and incorrect results at scale.

5. Evaluation
- We need explicit benchmarks for word, phrase, sentence, and document quality.
- "Seems okay" is not an acceptable evaluation method.

6. Domain focus
- General translation alone is too broad.
- High-value early domains should include education, civic access, health communication, and cultural preservation.

## Operating Principles

- Accuracy before breadth when the tradeoff is direct.
- Roll out languages deliberately, but never invisibly.
- Preserve native orthography in display text.
- Prefer reversible data operations.
- Separate "staged", "reviewed", and "trusted" content clearly.
- Build for community contribution, but do not outsource quality control to hope.

## Core Metrics To Track

- Total entries by language
- Bridge coverage by language
- Entries with strong definitions
- Entries with usage examples
- Phrase coverage by language
- Moderator backlog size
- Translation feedback volume and accuracy trend
- Language activation readiness score

## Canonical Companion Docs

- [translation-roadmap.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/translation-roadmap.md)
- [sprint-backlog-2weeks.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/sprint-backlog-2weeks.md)
- [language-onboarding-pipeline.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/language-onboarding-pipeline.md)
- [bulk-ingest-runbook.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/bulk-ingest-runbook.md)
- [phrase-usage-layer-design.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/phrase-usage-layer-design.md)
- [phase-2-expansion-plan.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/phase-2-expansion-plan.md)

## Decision

This file is the canonical high-level roadmap.

Tactical sprint plans, SQL runbooks, and migration-specific notes should remain in their existing documents and be kept subordinate to this roadmap.
