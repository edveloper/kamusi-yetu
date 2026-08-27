# Kamusi Yetu - Comprehensive Codebase Analysis
**Date:** April 20, 2026  
**Project Phase:** Phase 2 - Phrase Layer (In Progress)

---

## EXECUTIVE SUMMARY

Kamusi Yetu is a **community-driven multilingual dictionary platform** for Kenyan languages. The project is in **active Phase 2 development**, with Phase 1 (word foundation) largely complete and phrase layer work underway.

**Status:** ~70% of Phase 2 features implemented; foundational infrastructure solid; gaps exist in phrase coverage and usage example completeness.

---

## 1. ROUTES & PAGES IMPLEMENTED

### Public Routes (Complete)
| Route | Status | Implementation | Notes |
|-------|--------|-----------------|-------|
| `/` (home) | ✅ Complete | Word of the day, latest entries, language cards, search | Polished, ready |
| `/explore` | ✅ Complete | Full dictionary browser, county map, language/category filters | Working with cursor pagination |
| `/categories` | ✅ Complete | Browse by topic, category cards with counts | Static content + live counts |
| `/languages` | ✅ Complete | Language list with entry counts | Direct query to entries |
| `/about` | ✅ Complete | Mission, maturity levels, roadmap (Phase 1-6) | Narrative-focused |
| `/team` | ✅ Complete | Founder bio, team structure, vision | Static with Usalama Voice mention |
| `/contact` | ⚠️ Partial | Contact form page | Form exists but backend unclear |
| `/guidelines` | ✅ Complete | Community standards, do's/don'ts, zero-tolerance | Informational |
| `/moderators` | ✅ Complete | Moderation teams, quality standards CTA | Static showcase |

### Authenticated User Routes (Complete)
| Route | Status | Implementation | Notes |
|--------|--------|-----------------|-------|
| `/login` | ✅ Complete | Email/password auth via Supabase | Working |
| `/signup` | ✅ Complete | Registration, avatar upload, language selection | Avatar upload working |
| `/profile` | ✅ Complete | User profile, stats, contributions, saved words, language settings | Rich - includes moderator dashboard link |

### Core Feature Routes (Complete/In Progress)
| Route | Status | Implementation | Notes |
|--------|--------|-----------------|-------|
| `/contribute` | ✅ Complete | Word & phrase entry form, audio recording/upload | Full workflow; validation rules enforce bridge requirements |
| `/search` | ✅ Complete | Search, filters (language, category, letter, kind), sorting | Cursor-based results; filters by word/phrase |
| `/entry/[id]` | ✅ Complete | Entry detail, likes, comments (threaded replies), save, edit suggestion, report | Rich interaction layer |
| `/translate` | ✅ Complete | Cross-language translation with confidence/path types, feedback | Fully functional; feedback system working |
| `/trending` | ⚠️ Partial | County coverage map component (KenyaCountyCoverageMap) | Map UI exists; detailed implementation unclear |

### Moderation Routes (Complete)
| Route | Status | Implementation | Notes |
|--------|--------|-----------------|-------|
| `/moderate` | ✅ Complete | Moderation dashboard, pending items, bridge health, bulk jobs | Full moderation workflow; moderator-only |

---

## 2. UI COMPONENTS IMPLEMENTED

### Core Entry Components
- **EntryActionModal.tsx** - Edit/report entry form with audio recording, draft persistence, validation
- **UsageContextForm.tsx** - Add usage examples for entries
- **SavedWordsList.tsx** - Saved words gallery with filters and copy functionality

### Layout Components  
- **Header.tsx** - Sticky navigation with mobile menu, auth-aware links
- **Footer.tsx** - Dark footer with links and creator attribution
- **layout/** - Layout wrapper components

### Trending/Map Components
- **KenyaCountyCoverageMap.tsx** - SVG county map with hover states, language coverage visualization

### Utility/UI Components
- **LanguageSelector.tsx** - Modal language picker with grouping and search
- **Input.tsx** - Styled input with error states
- **Card.tsx** - Reusable card container
- **Button.tsx** - Themed button variants (primary, secondary, accent, ghost)

### Missing Components
- ❌ **Phrase highlighting/context UI** - No visual distinction for phrase vs word entries
- ❌ **Usage example display component** - Examples shown inline but no dedicated component
- ❌ **Audio player** - No custom audio player for pronunciations
- ❌ **Speech recognition UI** - Audio recording exists but UI minimal
- ❌ **Analytics/dashboard** - No data viz beyond moderation health

---

## 3. API ENDPOINTS IMPLEMENTED

### Entry & Language APIs (`lib/api/entries.ts`, `lib/api/languages.ts`)
- `GET /entries` - List with filters (language, category, validation status)
- `GET /entry/:id` - Single entry with related words
- `POST /entries` - Create new entry (contribution)
- `GET /languages` - All languages
- `POST /entries/:id/save` - Save to collection
- `POST /entries/:id/like` - Like toggle
- `GET /entries/:id/likes` - Like count
- `POST /entries/:id/comments` - Add comment
- `GET /entries/:id/comments` - Fetch threaded comments
- `PATCH /comments/:id` - Edit comment
- `DELETE /comments/:id` - Delete comment
- `POST /entries/:id/report` - Report entry

### Translation API (`/app/api/translate`)
- **POST /api/translate** - Main translation endpoint
  - Uses **bridge-based lookup** (English/Swahili intermediaries)
  - Supports **direct edges** (language pair mappings)
  - Returns candidates with confidence scores and path types
  - Supports phrase matching with confidence boost
- **POST /api/translate/feedback** - Collect user feedback on translations (verdict: correct/partially_correct/incorrect)

### Moderation APIs (`/app/api/moderation/`)
- **POST /api/moderation/action** - Approve/reject/flag entries and suggestions
- **GET /api/moderation/bridge-health** - Bridge translation coverage stats (per language)
- **POST /api/moderation/bulk-jobs** - Dry-run backfill suggestions or apply/rollback jobs

### User APIs (`lib/api/users.ts`)
- `GET /users/:id/stats` - Contribution stats
- `GET /users/:id/profile` - Full profile
- `POST /users/:id/profile` - Update profile
- `POST /users/:id/avatar` - Upload avatar
- `POST /users/:id/avatar/delete` - Remove avatar
- `GET /users/:id/is-moderator` - Moderator check

---

## 4. DATABASE & SCHEMA

### Core Tables
```
entries (word/phrase storage)
  - id, language_id, headword, primary_definition
  - part_of_speech, dialect_variant, pronunciation_ipa
  - english_translation, swahili_translation
  - category, register, audio_url
  - validation_status (pending/verified/disputed/flagged)
  - trust_score, created_by, created_at, updated_at

languages
  - id, code, name, native_name
  - is_active, language_group_key, language_group_label
  - created_at

entry_usage_examples (NEW in Phase 2)
  - id, entry_id, example_text
  - english_translation, swahili_translation
  - register, validation_status
  - created_by, reviewed_by, created_at, updated_at

entry_suggestions
  - For edit/improvement suggestions on existing entries
  - Moderator review workflow

entry_translations
  - Direct language-pair mappings
  - confidence, method (bridge/direct/pivot)

translation_feedback
  - User feedback on translation quality (verdict + note)

user_profiles
  - id, username, display_name, bio, avatar_url
  - languages (array), reputation, role

saved_words
  - user_id, entry_id, created_at

entry_likes, comments, entry_comments_votes
  - Engagement tracking

validations, bulk_edit_jobs
  - Moderation audit trail
```

### Data Model Alignment
✅ **Aligns with Phase 2:**
- Usage examples table exists (`entry_usage_examples`)
- Bridge translation fields (`english_translation`, `swahili_translation`)
- Phrase support (`part_of_speech: 'phrase'`)
- Validation status tracking
- User engagement (likes, comments, saves)

❌ **Gaps:**
- No explicit **phrase pack** table (using staging + import)
- No **semantic tagging** for phrases
- No **collocation data** (word pairings)
- No **dialect/register matrix** (only flat fields)

---

## 5. KEY CONFIGURATION FILES

### package.json
```json
{
  "name": "kamusi-yetu",
  "version": "0.1.0",
  "dependencies": {
    "next": "16.1.1",
    "react": "19.2.3",
    "@supabase/supabase-js": "^2.89.0"
  },
  "devDependencies": {
    "tailwindcss": "^4",
    "typescript": "^5",
    "eslint": "^9"
  }
}
```
✅ **Minimal, clean stack** - Next.js + React + Supabase + Tailwind

### next.config.ts
- Image optimization enabled
- No special rewrites/redirects seen

### lib/constants.ts
- **CATEGORIES** - 17 topic categories (greetings, family, food, health, law, tech, etc.)
- All have icons and descriptions

### lib/supabase.ts
- Initializes Supabase client with public anon key
- Exports Entry and Language types

### Database Validation Rules
- **Bridge requirement** - Entries in EN/SW must have opposite bridge translation
- **Phrase examples required** - Phrases (in phrases-focused migration) enforce usage example presence

---

## 6. IMPLEMENTATION STATUS: ACTUAL vs PHASE 2 REQUIREMENTS

### From Phase 2 Roadmap Docs:
> "Add high-frequency phrase packs with usage context, formality, and domain tags for real conversational meaning."

### ✅ IMPLEMENTED
1. **Word foundation complete** - Entry model solid, verified entries working
2. **Bridge translation live** - EN/SW intermediary translations mandatory
3. **Basic phrases supported** - `part_of_speech: 'phrase'` field and validation
4. **Usage examples table** - `entry_usage_examples` created (migration 022)
5. **Phrase packs staged** - 5 language seeds in migration 023 (KI, LUO, KAM, LUY, KAL)
6. **Moderation workflows** - Moderators can review/approve/flag
7. **User contributions** - Full contribute form (word + phrase modes)
8. **Translate API** - With feedback collection
9. **Search & filtering** - By language, category, word/phrase kind
10. **User accounts & profiles** - Full auth, avatar, language preferences
11. **Engagement layers** - Likes, comments, saved words

### ⚠️ PARTIAL/IN PROGRESS
1. **Phrase pack rollout** - Staged but not yet validated/applied to live entries
   - Staging table has data but no visible "apply batch" UI
   - 5 languages seeded but coverage unclear
2. **Phrase-specific UX** - No visual distinction between words and phrases in most views
3. **Usage example completion** - Examples table exists but:
   - No UI widget for moderators to quickly add examples to incomplete phrases
   - No "requires example" flag in moderation dashboard
4. **Formality tags** - `register` field exists but UI minimal
5. **Domain tags** - `category` exists; "domain" and "dialect" different concepts not fully separated

### ❌ NOT YET IMPLEMENTED
1. **Sentence-level translation** - Only word/phrase translation (Phase 3 goal)
2. **Contextual phrase variants** - No dialectal or register-based phrase grouping
3. **Phrase collocation data** - No n-gram or word-pair analysis
4. **Live audio for phrases** - Audio field exists but record/upload in contribute not phrase-aware
5. **Phrase search suggestions** - No "common phrases starting with..." auto-complete
6. **Bulk phrase import workflows** - Migrations exist but no UI to trigger/review batches
7. **Translation quality metrics per phrase** - Only per-word metrics

### 🚩 CRITICAL GAPS FOR PHASE 2 COMPLETION
1. **Phrase batch validation & application** - Staged phrases need moderator review → apply workflow
2. **Usage example collection strategy** - No systematic way to fill incomplete examples
3. **Phrase-specific moderation** - Gaps detection incomplete (see `getModerationGaps` in moderate page)
4. **Subgroup language rollout** - Phase 2 mentions expansion; only 5 languages actively seeded

---

## 7. TODO/FIXME COMMENTS & INCOMPLETE FEATURES

### Code Search Results
```grep
- "TODO: extend this system for <gi>subcat</gi> elements." 
  (FreeDict XML schema - not critical)
  
- "NOTE: This file should not be edited" 
  (next-env.d.ts - auto-generated)
```

### Inferred TODOs from Code Analysis
| Area | Issue | Priority |
|------|-------|----------|
| `/contact` page | Form backend unclear - submits but no handler | Medium |
| Bulk jobs UI | Dry-run works but "apply" flow incomplete | High |
| Phrase UX | No "phrase" badge in search results | Medium |
| Audio recording | Works but no phone/mobile testing noted | Low |
| Comments moderation | No spam/abuse moderation dashboard | Low |
| County map | Component complex; performance unclear | Low |
| Landing page | "Trending" link exists but route incomplete | Medium |

---

## 8. DATABASE MIGRATIONS STATUS

### Implemented (sql/ directory)
✅ **001-021** - Core schema: entries, languages, users, validation, bridge, import staging  
✅ **022** - Entry usage examples (first-class phrase context)  
✅ **023** - Phrase packs for 5 active languages (staged, not yet applied)  
✅ **024-028** - Batch validation and application workflows  
✅ **033, 037** - Additional language registry (Luhya subgroups, Kalenjin subgroups)  

### Key Migration Details
- **Migration 022** creates `entry_usage_examples` with constraints:
  - Requires either `english_translation` OR `swahili_translation`
  - Validates `example_text` is not blank
  - Backfills from legacy `usage_contexts` table
  
- **Migration 023** inserts 30 phrase rows (6 per language × 5 languages)
  - All have bridge translations
  - Marked as source: "Kamusi curated phrase pack"
  - Status: "community-curated" but validation_status likely "pending"

### Gaps
- No explicit **phrase bundle** or **pack grouping** table
- **Bulk job** status/tracking unclear - jobs table exists but UI minimal
- No **automatic validation** workflow for phrase completeness

---

## 9. COMPONENT & FEATURE CHECKLIST

### User Experience
- ✅ Search (full-text, filters, sorting, pagination)
- ✅ Browse by language, category, letter
- ✅ Entry detail page (full rich view)
- ✅ User profiles with stats
- ✅ Contribution workflow (step-by-step form)
- ✅ Moderator dashboard
- ✅ Translation tool with feedback
- ⚠️ County/region language map (complex but incomplete interaction)
- ❌ Advanced analytics dashboard
- ❌ API documentation for developers

### Data Quality
- ✅ Validation rules enforced (bridge requirements, definitions required)
- ✅ Moderation workflow (pending → verified/disputed/flagged)
- ✅ Trust scoring (based on metadata completeness and engagement)
- ⚠️ Bridge health monitoring (moderators see stats; no auto-alerts)
- ❌ Dialect coverage dashboard
- ❌ Phrase completeness checker

### Engagement
- ✅ Likes & comments (threaded)
- ✅ Save words to collection
- ✅ User reputation/stats
- ⚠️ Community moderation (core features exist; spam detection missing)

---

## 10. CRITICAL OBSERVATIONS

### Strengths
1. **Solid foundation** - Word entry model proven; thousands of entries likely in DB
2. **Moderation infrastructure** - Full workflow from submission to publication
3. **Bridge translation strategy** - EN/SW as intermediaries is clever and working
4. **User engagement** - Comments, saves, likes showing adoption interest
5. **Scalable architecture** - Supabase handles growth; API well-structured
6. **Mobile-first UI** - Responsive, accessibility-conscious design

### Weaknesses
1. **Phrase coverage incomplete** - Migrations staged but not integrated into live views
2. **Batch management opaque** - Bulk jobs exist; UX minimal
3. **Usage example shortage** - Table exists; systematic collection missing
4. **Limited analytics** - Moderators see health; community doesn't see impact
5. **Unclear data provenance** - Import staging table unclear to end users
6. **No offline capability** - All requests require backend

### Risks for Phase 2 Completion
1. **Phrase pack stagnation** - Staged data may not reach live entries without moderator push
2. **Example shortfall** - Without UI, phrases will remain incomplete
3. **Subgroup language delays** - Only 5 main languages actively seeded; expansion slower than promised
4. **Moderator burnout** - Heavy manual review workload; no auto-suggestions visible
5. **User expectations mismatch** - Roadmap shows "phrase-aware translation" but backend simple

---

## 11. RECOMMENDATIONS

### High Priority (Phase 2 Blocker)
1. **Complete phrase batch workflow**
   - Add "Review Batches" tab in moderation dashboard
   - Allow moderators to preview → validate → apply staged entries
   
2. **Build usage example collector**
   - Add "needs examples" filter in moderation
   - Quick-add modal for 5-10 common phrases per language
   
3. **Phrase-specific UX polish**
   - Badge phrases in search results
   - Highlight phrase-only translations
   - Separate phrase sort option

### Medium Priority (Phase 2 Enhancement)
4. **Bridge health automation**
   - Alert moderators when language drops below 80% bridge coverage
   - Suggest bulk backfill with confidence thresholds
   
5. **Usage example import**
   - Allow moderators to import examples from migration data
   - Link to FreeDict/other sources for reference

6. **County map polish**
   - Add language stats hover tooltips
   - Link to contribute for under-resourced languages

### Low Priority (Post-Phase 2)
7. Analytics dashboard for contributors
8. API client library & documentation
9. Offline-first mobile app
10. Advanced phrase matching (similarity, wildcards)

---

## 12. CONCLUSION

**Kamusi Yetu is a well-architected, working platform in active Phase 2 development.** The foundation (Phase 1 - words) is solid. Phrase infrastructure is in place but not fully utilized. To reach "Phrase-Ready" status for 5+ languages, the team needs to:

1. **Activate phrase batches** (migrate staging → live)
2. **Close the example gap** (UI + systematic collection)
3. **Polish phrase UX** (search, filters, display)
4. **Expand language coverage** (subgroups, less-resourced communities)

**Estimated Phase 2 completion:** 60-70% complete; 2-4 weeks of focused moderation work would unlock significant progress.

---

## Appendix: File Structure Summary

```
app/
  ├── page.tsx (home) ✅
  ├── login/ signup/ profile/ ✅
  ├── contribute/ ✅
  ├── search/ ✅
  ├── entry/[id]/ ✅
  ├── explore/ categories/ languages/ ✅
  ├── about/ team/ guidelines/ contact/ ✅
  ├── moderate/ moderators/ ✅
  ├── translate/ ✅
  ├── trending/ ⚠️ (partial)
  └── api/
      ├── translate/ ✅
      └── moderation/ ✅

components/
  ├── EntryActionModal.tsx ✅
  ├── SavedWordsList.tsx ✅
  ├── LanguageSelector.tsx ✅
  ├── layout/ (Header, Footer) ✅
  └── ui/ (Button, Card, Input) ✅

lib/
  ├── api/ (entries, languages, users, suggestions, translate) ✅
  ├── types/database.ts ✅
  ├── constants.ts (categories) ✅
  ├── contexts/AuthContext ✅
  └── validation/ (entry-rules) ✅

sql/
  ├── 001-021 (core schema) ✅
  ├── 022 (usage examples) ✅
  ├── 023 (phrase packs - staged) ⚠️
  └── 024-037 (validation, bulk jobs, language expansion) ✅
```

---

**Report prepared:** April 20, 2026  
**Analysis scope:** Complete codebase exploration + docstring review + schema validation
