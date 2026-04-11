# Trending Visual Spec

Date: February 26, 2026
Status: Design approved for first implementation pass

## Purpose

This document defines the next visual and product direction for the `Trending` page.

The goal is to evolve `Trending` from a metrics-and-missions page into a more visual language-intelligence surface that:

1. shows where coverage is growing
2. helps users discover active and underdocumented communities
3. invites targeted contribution
4. stays visually consistent with the rest of Kamusi Yetu

## Product Role

`Trending` should not become another copy of `Explore`.

The distinction should be:

- `Explore` = browse the dictionary deliberately
- `Trending` = see momentum, gaps, and live opportunities across the platform

So `Trending` should answer:

- Which communities are growing?
- Which communities need help?
- Where is phrase coverage improving?
- Which regions and language groups are represented?
- What can I contribute right now?

## Design Direction

The page should feel:

- more visual than the current implementation
- still grounded in the existing Kamusi Yetu visual language
- editorial rather than dashboard-heavy
- rich in signal without feeling corporate or sterile

The first version should avoid full analytics-dashboard complexity.

## Proposed Page Structure

### Section 1 - Hero Summary

Keep the emerald hero, but make the top of the page feel more alive.

Content:

- title: `Trending`
- short subtitle about community pulse and language growth
- a compact visual summary strip immediately below the hero

Cards:

- active languages
- verified entries
- phrase-rich languages
- underdocumented communities
- languages missing examples
- fastest-growing communities

These should look more editorial than purely numeric.

## Section 2 - Kenya Coverage Map

This should be the anchor feature of the page.

### What the Map Represents

The map should show county-level language presence and current platform coverage.

Important:

- it must not imply one county belongs to only one language
- it must not claim exact demographic or linguistic precision
- it should represent curated dominant or notable language presence plus Kamusi Yetu coverage state

### Recommended First Version

Use a simplified static SVG map of Kenya by county.

Each county should carry:

- county name
- 1 to 3 relevant language communities
- coverage status for those communities

### County State Model

Each county can be colored using the strongest relevant status among its mapped languages:

- `starter`
- `growing`
- `phrase_ready`
- `review_heavy`
- `not_yet_covered`

Recommended color direction:

- `phrase_ready` = deep emerald
- `growing` = medium emerald
- `starter` = pale emerald
- `review_heavy` = amber
- `not_yet_covered` = stone

### Hover / Click Behavior

Hover should show:

- county name
- mapped languages
- entry counts
- phrase counts if available
- contribution suggestion

Click should:

- open a county-focused panel on the same page in v1
- optionally route to filtered `Explore` or `Search` later

### Why County Map Instead of Heatmap

County map is the right first move because:

- it is visually intuitive for Kenyan users
- it matches the civic and community framing of the project
- it avoids fake precision
- it gives room for curated language presence instead of raw density claims

Avoid:

- choropleths pretending statistical certainty
- geospatial clustering tools
- real demographic overlays in v1

## Section 3 - Popular Communities

This should be a visual card row, not just a list.

For each community:

- language name
- native name
- total entries
- phrase count
- short blurb
- CTA: `Explore Dictionary`

This section should reward depth and momentum.

## Section 4 - Growing Communities

This replaces some of the current “contribution requests” feel with more inviting editorial framing.

For each card:

- language name
- why it matters
- current coverage count
- what is most needed:
  - words
  - phrases
  - examples
  - audio
- CTA: `Contribute`

This is the better place to push underdocumented languages.

## Section 5 - Phrase Spotlight

This should showcase 2 to 4 phrase entries from smaller or recently expanded languages.

Card content:

- phrase
- language
- English meaning
- optional Swahili meaning
- why it is interesting or culturally relevant

This gives the page a human feel instead of only counts.

## Section 6 - Latest Movement

Keep the current idea, but make it clearer and more visual.

Possible blocks:

- newest verified entries
- newest phrase packs
- most appreciated entries
- recent contributor wins

## Section 7 - Missions

Keep missions at the bottom, but make them sharper.

Mission types:

- strengthen this language
- add phrase examples
- help a review-heavy language
- close a bridge gap

Each mission card should show:

- language
- exact gap
- why it matters
- direct CTA

## Data Model Requirements

The first visual version should not depend on perfect new backend systems.

We can drive it with mostly curated and derived data.

### Existing Data Already Available

- total entries by language
- phrase counts by language
- phrase entries missing examples
- likes and saves
- latest entries
- active languages

### New Data Needed For The Map

Add a curated county-language presence dataset.

Suggested shape:

`lib/constants/languageCountyPresence.ts`

Each county record should include:

- county code or slug
- county name
- one to three language codes
- optional primary language code
- optional note

Example shape:

```ts
type CountyLanguagePresence = {
  county: string
  primaryLanguageCode?: string
  languageCodes: string[]
  note?: string
}
```

This should be curated manually in v1.

### Optional Future Data

Later, language maturity can move into the database itself.

For now, we can derive it using heuristics.

## Language Maturity Heuristic For Trending

For first implementation, compute language maturity from current metrics.

Suggested heuristic:

- `phrase_ready`
  - `>= 30` entries
  - `>= 10` phrases
  - phrase example gap not dominant
- `growing`
  - `>= 15` entries
  - at least some phrase coverage
- `starter`
  - `>= 1` entries but below growing threshold
- `review_heavy`
  - active but low bridge quality or high phrase-example gap
- `not_yet_covered`
  - no live entries

This should remain a UI-level heuristic until formalized later.

## UX Constraints

The page should remain aligned with the current site:

- large, elegant headings
- white cards on stone background
- emerald as action color
- no generic analytics dashboard visuals
- no dense chart library feel

The map should feel handcrafted and editorial.

## Recommended First Implementation Scope

Build only these in v1:

1. redesigned summary strip
2. county SVG map with hover panel
3. popular communities card row
4. growing communities card row
5. phrase spotlight strip
6. refined missions section

Do not build in v1:

- real geographic filtering
- analytics charts
- demographic overlays
- user-personalized trending

## Dependencies

Before implementation:

1. settle county-language presence mapping
2. settle first-pass language maturity heuristic
3. choose whether map hover lives in tooltip or side panel
4. identify the first phrase spotlight selection rule

## Suggested Build Order

1. create the county presence constant
2. create maturity computation helper
3. redesign the `Trending` page layout without the map first
4. add the county SVG map
5. connect the map to language cards and missions

## Decision

The first visual version of `Trending` should be a curated editorial map-and-missions page, not a raw analytics dashboard.
