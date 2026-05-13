This is the Kamusi Yetu codebase: a community-built dictionary and translation platform for Kenyan languages, with the long-term goal of evolving toward high-quality African language translation.

## Project Roadmap

See [docs/project-roadmap.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/project-roadmap.md) for the current project status, completed milestones, and the roadmap from dictionary foundation toward phrase, sentence, document, and speech translation.

## Tactical Docs

- [docs/translation-roadmap.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/translation-roadmap.md)
- [docs/sprint-backlog-2weeks.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/sprint-backlog-2weeks.md)
- [docs/language-onboarding-pipeline.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/language-onboarding-pipeline.md)
- [docs/phrase-usage-layer-design.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/phrase-usage-layer-design.md)
- [docs/phase-2-expansion-plan.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/phase-2-expansion-plan.md)
- [docs/language-rollout-waves.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/language-rollout-waves.md)
- [docs/trending-visual-spec.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/trending-visual-spec.md)
- [docs/bulk-ingest-runbook.md](/C:/Users/Admin/Desktop/kamusi-yetu/docs/bulk-ingest-runbook.md)

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

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.
