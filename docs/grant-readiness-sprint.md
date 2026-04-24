# Grant Readiness Sprint

Date: April 2026
Status: Proposed tactical sprint
Purpose: Raise Kamusi Yetu from a credible prototype to a stronger fellowship/grant application in 2 to 4 weeks.

## Sprint Goal

Ship the public proof, trust signals, and operating evidence needed to support a strong founder-led fellowship application.

This sprint is not about expanding the long-term vision.
It is about making the current project legible, credible, and defensible to an external reviewer.

## Core Outcome

At the end of this sprint, Kamusi Yetu should be able to demonstrate:

1. A working public product with no obvious trust-breaking gaps.
2. Precise public claims about what works today versus what is still in progress.
3. Clear proof of project scale, activity, and quality controls.
4. A founder-ready fellowship narrative backed by visible product evidence.

## Application Standard

A reviewer should be able to answer yes to all of the following within 5 to 10 minutes:

- Is this solving a real and important problem?
- Is the founder technically serious?
- Does the product already work in a meaningful way?
- Are the public claims honest and specific?
- Is there evidence of execution, not only ambition?
- Is there a credible next milestone that funding would unlock?

## Sprint Scope

This sprint focuses on four workstreams:

1. Public trust and site credibility
2. Metrics and proof packaging
3. Product claim tightening
4. Fellowship application assets

This sprint explicitly does not focus on:

- sentence translation research
- new country expansion
- major rearchitecture beyond obvious public bottlenecks
- speculative features with no immediate application value

## Workstream 1 - Public Trust and Site Credibility

Goal:
Remove obvious signals that make the project feel incomplete or overstated.

### Tasks

1. Fix or replace non-functional contact flow.
   - Either wire the form to a real submission path or replace it with a direct email-only contact surface.
   - Remove any UI that suggests functionality that does not exist.

2. Tighten homepage and about page claim language.
   - Replace broad "translation is live" language with exact wording.
   - Distinguish dictionary lookup, bridge-assisted translation candidates, phrase expansion, and future roadmap.

3. Add a visible project status block.
   - Include exact counts for active languages, verified entries, verified phrases, and current phase.
   - Add a "What works today" and "What is in progress" split.

4. Improve crawlable trust signals.
   - Ensure metadata/title/description are specific.
   - Prefer server-visible content for core project description and status.
   - Add clear founder identity and contact route.

5. Remove presentation-quality defects.
   - Fix mojibake or encoding artifacts.
   - Fix any broken or confusing CTA text.
   - Eliminate pages that look unfinished.

### Acceptance Criteria

- No major public CTA appears broken.
- Homepage and about page make claims that the codebase can defend.
- A fast external reviewer can identify founder, mission, product status, and contact path without searching.
- No obvious encoding or credibility defects remain on core public pages.

## Workstream 2 - Metrics and Proof Packaging

Goal:
Turn internal progress into external evidence.

### Tasks

1. Define the canonical grant-facing metrics set.
   - Active languages
   - Verified entries
   - Verified phrases
   - Bridge coverage
   - Usage examples
   - Moderation backlog
   - Recent additions

2. Surface these metrics publicly.
   - Homepage, about page, or a dedicated status/progress section.
   - Keep counts current enough to avoid embarrassment.

3. Add a short quality-controls explanation.
   - Explain bridge policy.
   - Explain moderation/review process.
   - Explain what verified means.

4. Prepare one proof artifact for applications.
   - A concise application factsheet in `docs/`
   - Include problem, current scale, current product, near-term milestone, and use of funds.

### Acceptance Criteria

- At least one public page shows concrete product metrics.
- The review process is explained in plain English.
- A reusable application factsheet exists in the repo.

## Workstream 3 - Product Claim Tightening

Goal:
Close the gap between what the site implies and what the product currently does.

### Tasks

1. Audit all public copy that references translation capability.
   - Homepage
   - About
   - Team
   - Translate page
   - Any application-facing docs

2. Reword claims to match implemented reality.
   - Current state: dictionary, bridge-assisted translation candidates, contribution, moderation, discovery, language-health metrics.
   - In-progress state: phrase depth, usage examples, stronger translation quality, sentence-level capability.

3. Add one explicit roadmap sentence for reviewers.
   - State the next milestone funding would accelerate.

4. Make translation UX honest.
   - Explain confidence levels.
   - Explain direct vs bridge path.
   - Avoid implying production-grade sentence translation.

### Acceptance Criteria

- No major page implies a stronger translation system than currently exists.
- The next milestone is concrete and fundable.
- The translation page sets correct expectations.

## Workstream 4 - Fellowship Application Assets

Goal:
Make the project easy to pitch consistently.

### Tasks

1. Prepare founder-positioning notes.
   - Why this founder is building this
   - Why now
   - Why Kenyan language infrastructure matters
   - Why this can become foundational infrastructure, not only a content site

2. Prepare a milestone-based use-of-funds outline.
   - Example buckets:
     - phrase and example enrichment
     - moderation operations
     - contributor/community outreach
     - infrastructure and review tooling

3. Prepare a 6 to 12 month milestone frame.
   - Current state
   - Next milestone with funding
   - Evidence that the team can execute it

4. Prepare an application answer bank.
   - project summary
   - problem statement
   - what is already built
   - traction/progress
   - funding use
   - why founder

### Acceptance Criteria

- A concise application answer bank exists in `docs/`.
- The funding ask is tied to a specific execution milestone.
- Messaging is consistent across site and application materials.

## Suggested Sprint Cadence

### Week 1 - Credibility Fixes

Priority:
- fix contact path
- fix public copy overstatements
- fix encoding defects
- add basic project status block

Definition of done:
- public-facing trust gaps are no longer obvious

### Week 2 - Proof and Metrics

Priority:
- expose canonical metrics
- explain review and verification process
- create application factsheet
- tighten translate page expectation-setting

Definition of done:
- public site now shows measurable evidence, not only positioning

### Week 3 - Application Package

Priority:
- write answer bank
- write use-of-funds draft
- align founder narrative with product evidence
- prepare screenshots and product walkthrough sequence

Definition of done:
- application can be filled quickly without inventing language under pressure

### Optional Week 4 - Buffer and Polish

Priority:
- final copy passes
- final screenshot pass
- analytics or lightweight evidence add-ons
- final reviewer simulation

Definition of done:
- an external reviewer can understand the project in one short session

## Deliverables

By the end of the sprint, the repo should contain:

- a corrected public site with stronger trust signals
- a visible public status/progress section
- `docs/grant-application-factsheet.md`
- `docs/grant-application-answer-bank.md`
- this sprint plan

## Priority Order

If time is tight, do the work in this order:

1. Fix broken trust surfaces.
2. Tighten public claims.
3. Surface concrete metrics.
4. Prepare application materials.
5. Improve non-critical UX.

## Risks

1. Over-polishing narrative while leaving obvious product gaps.
2. Publishing metrics that cannot be maintained or defended.
3. Using vague mission language instead of specific evidence.
4. Applying before the public site matches the application story.

## Mitigation

1. Prefer concrete proof over inspirational copy.
2. Only publish metrics that come from the real product/database.
3. Keep all claims scoped to what is currently implemented.
4. Do a final reviewer pass before submission.

## Go / No-Go Rule

Apply when all of the following are true:

- the public site has no obvious broken trust surface
- the product status is stated clearly and honestly
- concrete metrics are visible and defensible
- the application narrative points to one clear funded milestone

Wait if any of the following remain true:

- key CTAs look broken
- the site still overstates translation maturity
- there is no visible proof of scale or quality control
- the funding ask is still generic
