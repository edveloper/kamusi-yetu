# Phrase and Usage Layer Design

Date: February 25, 2026
Status: In implementation

## Purpose

This document defines the next product and data milestone after the verified dictionary core:

1. first-class phrase support
2. structured usage examples
3. moderation and contributor workflows for contextual language data

This is the bridge between a word dictionary and a sentence translation system.

## Why This Layer Matters

Word-to-word translation is necessary but not sufficient.

Without phrases and examples:

- translation quality collapses on greetings, idioms, commands, and multi-word meaning
- users receive literal output where contextual output is needed
- there is no reliable training or evaluation data for sentence-level systems
- the platform stays stuck as a glossary instead of becoming a translation product

## Current State

What already exists:

- entries can already carry `part_of_speech`
- some seeded content uses `part_of_speech = 'phrase'`
- entry pages already surface `usage_examples`
- contribute UI already exposes `word` vs `phrase`
- explore and search now expose explicit phrase browsing and filtering
- moderator dashboard now exposes phrase filtering and phrase/example completion gaps

What is missing:

- a clear phrase data model
- phrase-specific validation and moderation rules
- structured example storage and review
- translation ranking that understands phrases as a first-class unit
- contributor tasks specifically for contextual data

## Scope

### In Scope

- define phrase entry requirements
- define usage example requirements
- define moderation policy for phrases and examples
- define the first implementation order
- define release criteria for the phrase layer

### Out of Scope

- full sentence translation engine
- document translation workflow
- speech-to-text or text-to-speech
- model training pipelines

## Product Definition

### Phrase

A phrase is a multi-word lexical unit whose meaning should be stored and reviewed as a unit, not inferred from isolated words.

Examples:

- greetings
- requests
- commands
- idioms
- common conversational expressions
- culturally specific expressions

### Usage Example

A usage example is a sentence or short utterance showing how a word or phrase is used in context.

It should help answer:

- when the term is used
- what nuance it carries
- whether it is formal, informal, respectful, archaic, or domain-specific

## Data Model Direction

### Phrase Entry Rules

For the first release, phrases can continue to live in `entries` rather than a separate table.

Required fields for phrase entries:

- `language_id`
- `headword`
- `primary_definition`
- at least one bridge translation:
  - `english_translation` or `swahili_translation`
- `part_of_speech = 'phrase'`

Recommended fields:

- `register`
- `category`
- `etymology`
- `dialect_variant`
- `pronunciation_ipa`
- `audio_url`

Additional validation rules for phrases:

1. `headword` should contain more than one token, or be explicitly approved as a fixed expression.
2. `primary_definition` must explain meaning, not merely repeat the bridge translation.
3. bridge translations should prefer natural equivalents over literal token-by-token glosses.

### Usage Example Model

Recommended direction: create a dedicated table instead of storing examples only as a JSON-like attached field.

Proposed table:

`entry_usage_examples`

Suggested fields:

- `id`
- `entry_id`
- `example_text`
- `english_translation`
- `swahili_translation`
- `notes`
- `register`
- `source_name`
- `source_url`
- `created_by`
- `validation_status`
- `reviewed_by`
- `reviewed_at`
- `created_at`
- `updated_at`

Minimum validation:

1. `example_text` is required
2. at least one bridge translation is required
3. example must not be identical to the headword unless explicitly marked as formulaic

## Moderation Policy

### Phrase Moderation

Moderators should check:

1. Is this actually a phrase and not just a single word?
2. Is the definition explanatory rather than circular?
3. Is the bridge translation natural and context-aware?
4. Is register correct?
5. Is the phrase common, region-specific, slang, ceremonial, or declining in use?

### Usage Example Moderation

Moderators should check:

1. Does the example demonstrate real usage?
2. Is the translation natural?
3. Does the example contain sensitive, abusive, or misleading content?
4. Is the example tied to the right entry?
5. Does the example clarify meaning rather than duplicate the definition?

## Contributor Workflow

### For Word Contributors

Prompt for:

- one example sentence if known
- one bridge translation if available
- register or formality if relevant

### For Phrase Contributors

Prompt for:

- phrase text
- meaning or gloss
- English and/or Swahili equivalent
- when people use it
- whether it is formal, informal, respectful, slang, or ceremonial
- an example sentence if possible

## Release Plan

### Phase A - Schema and Validation

- define phrase validation rules in existing contribute/edit flows
- add dedicated usage example table
- add moderation status for examples

Implementation progress:

- added shared phrase-aware entry validation rules in application code
- added SQL migration plan for `entry_usage_examples`
- added moderator-facing review workflow for phrase completion and approval
- added phrase/example health signals to moderation dashboards
- still pending: translation ranking that prefers phrases over isolated words

### Phase B - Product Surfaces

- make phrase browsing visible in `Explore` and `Search`
- display examples more prominently on entry pages
- add phrase-specific moderation queue filters

Implementation progress:

- complete for phrase browsing in `Explore` and `Search`
- complete for phrase-specific moderation queue filters
- still pending: stronger example presentation on entry pages

### Phase C - Translation Ranking

- prefer phrase matches over isolated word matches when the query is multi-word
- use example availability and moderation quality in confidence ranking

### Phase D - Contributor Tasks

- create tasks for:
  - missing examples
  - weak phrase definitions
  - missing bridge translations on phrases
  - underrepresented language phrase packs

## Suggested First Batch

Start with high-frequency categories:

1. greetings
2. gratitude
3. requests
4. directions
5. family/social interaction
6. school and health phrases

Recommended initial target:

- 25-50 verified phrases for English
- 25-50 verified phrases for Swahili
- 10-20 verified phrases for each active Kenyan language with moderation review

## Definition of Done For This Layer

The phrase and usage layer is considered operational when:

1. phrase entries are validated distinctly from ordinary words
2. usage examples can be created, moderated, and displayed
3. search can return phrase entries intentionally
4. translation can prefer phrase-level matches for phrase inputs
5. at least three major languages have curated phrase packs with examples

## Risks

1. literal bridge translations may hide the real idiomatic meaning
2. contributor examples may be low quality or fabricated
3. phrase coverage may become uneven across languages
4. moderators may be overwhelmed if example volume grows faster than review capacity

## Mitigation

1. require explanatory definitions for phrases
2. separate trusted and unreviewed examples clearly
3. seed small high-quality packs first
4. expose contributor task queues based on language gaps

## Recommended Next Build Order

1. Create SQL design for `entry_usage_examples`
2. Add phrase-specific validation to contribute and suggestion workflows
3. Update `Search` and `Explore` to expose phrase filters
4. Add moderator queue filters for phrases and examples
5. Add phrase-aware ranking in `POST /api/translate`
