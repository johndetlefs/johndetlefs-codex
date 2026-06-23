# Constitution

## Mission

- Help Shopify merchants improve their own stores through simple reports, practical checklists, and weekly coaching.
- Give members a clear next action after each report so they can make progress without relying on agency retainers, paid diagnostic calls, or done-for-you implementation.
- Keep JohnDetlefs.com product, content, lead-magnet, product-ad, and implementation work coordinated from the workspace root.

## Repository Boundaries

- Parent repo: workspace/control repo for product memory, workflow state, roadmaps, lead magnets, guide/video packets, `product-ads/`, and all project-workflow tracking.
- `next/`: website application repo for deployable Next.js code only. It must not contain live project-workflow state.
- `email/`: email-related repo for deployable email code/assets only. It must not contain live project-workflow state.

## Target Users

- Primary users: Shopify merchants and ecommerce operators, especially small Australian brands and time-poor store owners who need plain-language structure.
- Secondary users: operators who are willing to use AI-assisted workflows but need safe guardrails, priorities, and coaching before changing their Shopify store.

## Core Outcomes

- Visitors understand Shopify Growth Coaching as the main commercial offer.
- Qualified merchants can join or access the coaching membership without a discovery-call or diagnostic-call detour.
- Members can log in and see their reports, recommended module, and current checklist.
- Members can complete checklist tasks between coaching calls and see their progress persist.
- Checklists teach merchants safe, practical workflows for improving their own Shopify stores.
- Lead magnets, reports, and guide content point naturally toward the coaching membership.

## Product Principles

- Coaching over done-for-you: John provides structure, judgement, teaching, and review; members do the implementation work themselves.
- Plain language over technical depth: non-technical merchants should understand each task, why it matters, and when it is done.
- Durable references over disposable videos: prefer official documentation, stable written instructions, and selectively embedded external videos where useful.
- Safe progress over speed: theme, app, analytics, and AI-assisted workflows should help members avoid risky production changes.
- One next step: every member view should make the recommended checklist action obvious.

## Non-Goals

- Selling Fix-It calls, paid diagnostic calls, discovery calls, implementation hours, or custom development retainers inside this offer.
- Promising that John will directly edit a member's Shopify store or theme.
- Building a generic course library with no report-driven recommendation path.
- Replacing weekly coaching with a fully self-serve technical training product.
- Optimizing for advanced developers at the expense of non-technical store owners.

## Success Signals

- Members can reliably access their dashboard and resume checklist progress.
- Members understand what to do before asking for help on a coaching call.
- The first checklist reduces setup friction for Codex, GitHub, Shopify access, project-workflow guardrails, and a safe local Shopify CLI theme workflow.
- Coaching conversations focus on decisions, review, and prioritization rather than repeating basic setup instructions.
- Public CTAs and lead magnet result pages consistently point to Shopify Growth Coaching.

## Decision Filters

- Does this help a non-technical Shopify merchant know what to do next?
- Does this preserve the coaching model rather than drifting into done-for-you implementation?
- Does this reduce risk before the merchant changes their live store?
- Does this create reusable checklist or report infrastructure instead of one-off content?
- Does this make weekly coaching more effective?

## Workflow Principles

- The parent workspace tracker is the only live project-workflow source of truth.
- Cross-repo work must list its primary repo, touched repos, and branch/PR state.
- Child repos must not contain `.project-workflow/` or `.codex/skills/project-workflow/`.
- Historical child workflow state is preserved under `.project-workflow/archive/` and should be linked, not edited, when new parent tasks continue old work.

## Assumptions & Risks

- Assumption: merchants will pay for structure, coaching, and safe workflows even when they do the implementation work themselves.
- Assumption: three initial client stores are enough to validate the member-area workflow and first checklist before broad public launch.
- Risk: setup tasks around Codex, GitHub, Shopify access, and theme work may overwhelm non-technical members if not broken into small steps.
- Risk: external documentation and videos can change; checklist copy should remain useful even if linked resources move.
- Risk: legacy Fix-It and diagnostic copy may confuse visitors until public pages are updated.

## Change Log

- 2026-02-26: Created initial constitution from current repository product context and homepage offer positioning in the former `next` workflow.
- 2026-05-21: Updated product direction from a live Fix-It Call toward the $295 Shopify Fix-It Diagnostic and optional $695/month mentoring/coaching continuation.
- 2026-06-01: Realigned constitution to the Shopify Growth Coaching membership roadmap, making reports, member dashboards, checklist progress, and weekly coaching the core product outcomes.
- 2026-06-02: Clarified that Module 1 should lead to a Codex-managed local Shopify CLI theme workflow rather than merchant-facing GitHub Desktop or live theme edits.
- 2026-06-02: Added project-workflow guardrails as part of the Module 1 safety model for future Shopify blocks, sections, features, and ideas.
- 2026-06-18: Moved the live project-workflow source of truth to the parent workspace and removed live project-workflow state from child repos.
