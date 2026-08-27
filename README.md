This is the LughaKonnect codebase: a community-built dictionary and translation platform for Kenyan languages, with the long-term goal of evolving toward high-quality African language translation.

## Project Roadmap

See [docs/project-roadmap.md](docs/project-roadmap.md) for the current project status, completed milestones, and the roadmap from dictionary foundation toward phrase, sentence, document, and speech translation.

## Tactical Docs

- [docs/translation-roadmap.md](docs/translation-roadmap.md)
- [docs/sprint-backlog-2weeks.md](docs/sprint-backlog-2weeks.md)
- [docs/language-onboarding-pipeline.md](docs/language-onboarding-pipeline.md)
- [docs/phrase-usage-layer-design.md](docs/phrase-usage-layer-design.md)
- [docs/phase-2-expansion-plan.md](docs/phase-2-expansion-plan.md)
- [docs/language-rollout-waves.md](docs/language-rollout-waves.md)
- [docs/trending-visual-spec.md](docs/trending-visual-spec.md)
- [docs/bulk-ingest-runbook.md](docs/bulk-ingest-runbook.md)

## Seed Pack System (Bulk Data Generation)

**New:** Generate and import curated seed packs across multiple Kenyan languages using concept-driven matrices.

**Quick Start:**
1. [SEED_PACK_QUICK_START.md](SEED_PACK_QUICK_START.md) — 5-step guide to generate and import seeds (5 minutes)
2. [docs/SEED_GENERATOR_WALKTHROUGH.md](docs/SEED_GENERATOR_WALKTHROUGH.md) — Full step-by-step import workflow
3. [seed-packs/README.md](seed-packs/README.md) — Schema, concepts, and architecture

**Available Seed Packs:**
- `seed-packs/numbers.json` — 20 numeric concepts (1-1000)
- `seed-packs/greetings.json` — 12 social phrases
- `seed-packs/kinship.json` — 15 family relations
- `seed-packs/health.json` — 15 body parts + health terms
- `seed-packs/colors.json` — 12 color adjectives

**Generator Command:**
```bash
npx ts-node --esm scripts/generate-seed-csv.ts
# Output: CSV files in output/ directory ready for Supabase import
```

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser to view the app. Edits to files under `app/` hot-reload automatically.

## Tech Stack

- **Framework:** Next.js (App Router) + React
- **Language:** TypeScript
- **Styling:** Tailwind CSS with a custom Kenyan heritage design system (see [docs/internal/DESIGN_SYSTEM.md](docs/internal/DESIGN_SYSTEM.md))
- **Fonts:** Inter (body) and Playfair Display (display)
- **Data:** Supabase (Postgres)
- **Hosting:** Vercel

## Testing

```bash
npm test
```

Runs the backend logic tests in `tests/` (translation pipeline, feedback, bulk jobs).
