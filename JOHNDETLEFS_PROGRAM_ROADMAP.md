# JohnDetlefs.com Program Roadmap

Last updated: 2026-06-01

This is the root operating plan for moving JohnDetlefs.com into a checklist-driven Shopify coaching membership.

Strategic update:

- No discovery calls.
- No paid diagnostic calls.
- No paid implementation hours.
- No done-for-you client work inside this offer.
- Lead magnets, tools, and reports point directly to the coaching membership.
- The coaching membership is the commercial core.

Use this document as the shared source of truth for strategy, sequencing, backlog, naming, and cross-repo coordination. Implementation tasks should still be created inside the relevant component repo, usually `next/`, when code changes are required.

## Product Direction

The central promise is:

> Use simple ecommerce reports, checklists, and weekly coaching to know what to improve next, then do the work yourself with a safe AI-assisted workflow.

The product should help small Shopify operators learn how to improve their own stores without needing John to do paid implementation. The value is not more charts and not more agency hours. The value is structured coaching, simple diagnostic tools, practical checklists, and a weekly rhythm that helps members make progress.

The ethos is:

> Teach them how to fish instead of charging them to catch fish for them.

The operating model is:

1. A merchant runs a free tool or report.
2. The report identifies a likely bottleneck or next conversion target.
3. The merchant joins coaching.
4. The member logs in and sees their reports, recommended module, and task checklist.
5. The member works through checklist tasks between calls.
6. The weekly group coaching call explains the current module, answers questions, and helps members keep moving.
7. The system stores task progress and report history so each member always knows what to do next.

## Naming Direction

Move away from "Fix-It", "discovery", and "diagnostic call" as public offer language.

Working core offer name:

- **Shopify Growth Coaching**

Working product category:

- checklist-driven coaching membership

Acceptable supporting language:

- coaching
- group coaching
- guided implementation
- checklist-driven ecommerce improvement
- AI-assisted Shopify workflow
- weekly coaching call
- member dashboard
- reports and task lists

Avoid as public offer language:

- Fix-It Call
- Fix-It Diagnostic
- discovery call
- paid diagnostic call
- implementation hours
- done-for-you fixes
- custom development retainer

Rationale:

- "Fix-It" and "diagnostic call" imply John is personally inspecting or repairing the store as a service.
- "Discovery call" sounds like an agency sales process.
- The new model is explicitly coaching-first: members learn the workflow and complete structured tasks themselves.
- The language should set expectations that John provides structure, judgement, teaching, and review, not outsourced execution.

Legacy cleanup rule:

- Existing references to "Fix-It", diagnostic bookings, discovery calls, and paid implementation paths should be treated as legacy implementation debt.
- Replace public-facing legacy references with coaching language as relevant files are touched.
- Internal file names and environment variables can be renamed later if the public experience is already correct and the code is otherwise stable.

## Offer Ladder

### 1. Free Tools And Reports

Purpose:

- Attract Shopify merchants with a useful first read on their store.
- Help them understand what may be holding back conversion or growth.
- Give them a concrete reason to join coaching.

Current and planned assets:

- Shopify Bottleneck Analysis.
- Shopify Golden Ratio report.
- Future report-style tools, analyzers, checklists, and calculators.

Primary CTA:

- Run the free report or tool.

Commercial bridge:

- Join Shopify Growth Coaching to work through the recommended checklist and improve the store step by step.

### 2. $695/month Shopify Growth Coaching

Purpose:

- Recurring group coaching membership for Shopify merchants who want structured help improving their own stores.

Assumption:

- `$695/month` means the existing intended monthly price. Confirm final public pricing before implementation.

Positioning:

- Weekly group coaching.
- Checklist-driven modules.
- Member dashboard with reports and task progress.
- Practical ecommerce improvement using AI-assisted workflows.
- Members do the work themselves with guidance.

Not included:

- No discovery call.
- No paid diagnostic call.
- No custom implementation by John.
- No paid hours.
- No promise that John will directly edit the client's store or theme.

Expected member experience:

- Log in.
- See latest report results.
- See current module.
- See assigned checklist tasks.
- Complete tasks.
- Attend weekly group coaching.
- Use the next report or task review to decide what to do next.

### 3. No Done-For-You Path Inside This Program

Purpose:

- Keep the program scalable and aligned with John's agency workload.

Positioning:

- John teaches, prioritizes, explains, and gives structure.
- Members execute.
- The program should not drift into paid implementation, ad-hoc support hours, or custom client work.

## Coaching Modules

The curriculum should be modular and task-driven. Each module should become a checklist stored in the database, with member-specific progress.

### Module 1: AI-Assisted Shopify Setup

Goal:

- Help members get the safe technical setup needed to work on their own Shopify stores with Codex and GitHub.

Likely checklist areas:

- Create or access a Codex account.
- Create or access a GitHub account.
- Install and understand the Shopify Theme Access app.
- Download or connect the Shopify theme safely.
- Create a safe working copy of the theme.
- Understand where not to edit production directly.
- Set up the basic folder/repo workflow.
- Learn how to ask Codex for help using clear prompts.
- Make a first low-risk change.
- Preview, check, and publish safely.

### Module 2: Measurement And Signal Health

Goal:

- Make sure members can trust the basic numbers before making decisions.

Likely checklist areas:

- Shopify analytics basics.
- Meta pixel and server events.
- Google Analytics / Google Ads basics.
- UTMs.
- Report inputs.
- Event quality checks.

### Module 3: Conversion Baseline And Golden Ratio

Goal:

- Help members understand where the funnel is leaking.

Likely checklist areas:

- Sessions.
- Add-to-cart rate.
- Reach-checkout rate.
- Checkout completion rate.
- Conversion target.
- Priority stage.
- First conversion experiment.

### Module 4: Product Page And Offer Improvements

Goal:

- Improve the page, offer, and trust signals that affect buying behaviour.

Likely checklist areas:

- Product promise.
- CTA visibility.
- Product imagery.
- Shipping and returns clarity.
- Reviews and proof.
- Objection handling.
- Bundles and entry offers.

### Module 5: Theme, Speed, And App Hygiene

Goal:

- Help members identify and safely reduce common storefront friction.

Likely checklist areas:

- Theme backup.
- App audit.
- Speed checks.
- Mobile review.
- Broken UI checks.
- Safe change workflow.

### Module 6: Retention And Email Basics

Goal:

- Help members install or improve the most important retention flows.

Likely checklist areas:

- Welcome flow.
- Abandoned cart.
- Browse abandon.
- Post-purchase.
- Win-back.
- Review request.

### Module 7: Traffic, Creative, And Feed Readiness

Goal:

- Help members avoid sending traffic to weak assets, poor product data, or unclear offers.

Likely checklist areas:

- Ad angle ideas.
- Creative briefs.
- Offer hypotheses.
- Product feed basics.
- Catalogue health.
- Landing page readiness.

### Module 8: Profitability And Experiment Planning

Goal:

- Help members choose tests that make commercial sense.

Likely checklist areas:

- Gross margin.
- AOV.
- CAC.
- Discount cost.
- Shipping cost.
- Refund rate.
- Payback.
- Experiment plan.
- Success metric.

## Product Layers

The coaching system should eventually cover these layers:

1. Setup: Codex, GitHub, Shopify theme access, safe theme workflow, and member confidence using AI-assisted changes.
2. Measurement and signal health: Shopify, Meta, Google, pixels, server events, UTMs, attribution, and event quality.
3. Traffic: ads, creative angles, video briefs, campaign readiness, channel hypotheses, and asset gaps.
4. Feed and catalogue health: product data, Merchant Center readiness, images, titles, identifiers, and catalogue structure.
5. Conversion: product pages, site speed, mobile UX, trust, offer clarity, checkout friction, cart behaviour, and Shopify Golden Ratio performance.
6. Offer and merchandising: entry product, bundles, pricing, discounts, category structure, AOV strategy, and product-market fit signals.
7. Retention: email, SMS, post-purchase journeys, abandoned cart, browse abandon, win-back, replenishment, reviews, and retargeting audiences.
8. Profitability: gross margin, contribution margin, CAC, AOV, refund rate, shipping cost, discount cost, repeat purchase rate, and payback period.
9. Experiment planning: what changes, why it should help, expected result, test window, success metric, and next action.

## Workstreams

### WS1: Coaching Offer And Public Funnel

Goal:

- Update JohnDetlefs.com so all qualified paths point toward Shopify Growth Coaching, not discovery calls, diagnostics, or implementation work.

Scope:

- Homepage positioning.
- Public offer page.
- Lead magnet result CTAs.
- Pricing language.
- Removal or de-emphasis of booking/diagnostic paths.
- Clear explanation that this is coaching, not done-for-you work.

Notes:

- The offer should respect the audience: smart, time-poor merchants who need structure and confidence, not a lecture.
- The page should make the checklist-driven nature obvious.

### WS2: Lead Magnets, Tools, And Reports

Goal:

- Build useful free tools and reports that identify a next conversion target and lead naturally into coaching.

Scope:

- Shopify Bottleneck Analysis.
- Shopify Golden Ratio report.
- Future report-style analyzers.
- Result pages.
- Result emails.
- Internal notifications.
- Report-to-coaching CTA.

Notes:

- Free tools should give real value.
- The CTA should be coaching, not a paid diagnostic call.
- Reports should eventually map to recommended modules or task lists.

### WS3: Membership, Subscription, And Access

Goal:

- Let customers join the coaching membership, pay monthly, log in, and access their member area.

Scope:

- Stripe subscription.
- Member account/authentication.
- Membership status.
- Customer/store linkage.
- Onboarding flow.
- Confirmation emails.
- Internal notifications.

Notes:

- Subscription and access should be implemented before the members area becomes rich.
- The first useful member screen can be simple: reports, current module, current checklist.

### WS4: Checklist And Task Engine

Goal:

- Store coaching modules, checklist templates, member task assignments, and task progress in the database.

Scope:

- Module templates.
- Task templates.
- Member-specific task instances.
- Task status.
- Progress tracking.
- Recommended next task.
- Links from reports to tasks/modules.

Notes:

- This is the core product mechanic.
- The database should support both standard module checklists and report-generated recommended tasks.

### WS5: Coaching Curriculum

Goal:

- Create the checklist-driven module content, starting with Module 1 setup.

Scope:

- Module outlines.
- Task copy.
- Supporting docs/videos.
- Weekly call agendas.
- Member homework.
- Completion criteria.

Notes:

- Start with the setup module because members need the tooling and safety workflow before they can execute changes.
- Keep each task concrete enough that a merchant can complete it without needing John to take over.

### WS6: Group Coaching Operations

Goal:

- Make weekly coaching repeatable without creating custom work for every member.

Scope:

- Weekly call structure.
- Question intake.
- Task review rhythm.
- Module schedule.
- Member progress review.
- Community or async support rules if needed.

Notes:

- The group call should reinforce the checklist, not become open-ended consulting.
- Questions should be routed back to the module/task system where possible.

## Member Dashboard Direction

The first useful member dashboard should answer:

> What should I do next?

V1 should include:

- Membership status.
- Store profile.
- Latest report results.
- Current recommended module.
- Current checklist tasks.
- Task completion state.
- Weekly call details.
- Links to relevant docs/videos.

Later versions can add:

- Experiment tracker.
- Report history.
- Module completion history.
- Benchmarks.
- Task recommendations based on report results.
- Coaching call archive.

## Database Direction

The exact schema should be designed inside the relevant implementation task, but the product likely needs persistent records for:

- Customers.
- Stores.
- Memberships.
- Report runs.
- Report results.
- Modules.
- Task templates.
- Member task instances.
- Task completion history.
- Recommended next module/task.
- Coaching sessions or weekly call records.

Each task should likely support:

- Task ID.
- Module ID.
- Title.
- Description.
- Why it matters.
- Instructions.
- Completion criteria.
- Required evidence or confirmation.
- Status.
- Member notes.
- Related report/result.
- Links to resources.

## Backlog

### TASK-001: Update Root Roadmap For Coaching Model

Stream: Operating System
Status: Complete
Priority: P0
Repo: root workspace

Outcome:

- The root roadmap reflects the new coaching-first strategy.

Scope:

- Remove the diagnostic/discovery-call strategy.
- Remove done-for-you and paid-hours positioning.
- Reframe lead magnets as direct paths into coaching.
- Define checklist-driven membership direction.
- Define member dashboard and database implications.
- Update backlog.

Acceptance criteria:

- Roadmap clearly states no discovery calls, no paid diagnostics, no paid hours, and no done-for-you client work.
- Roadmap points all lead magnets toward coaching.
- Roadmap captures modules, checklist/task engine, subscription, member dashboard, and database direction.

### TASK-002: Add Project Context Coaching Override

Stream: Operating System
Status: Complete
Priority: P0
Repo: root workspace

Outcome:

- `PROJECT_CONTEXT.md` gives future Codex sessions the current coaching-first direction before any older diagnostic-first context.

Scope:

- Add a top-level strategic override.
- State that the current roadmap supersedes older Fix-It Diagnostic direction.
- Identify coaching membership as the primary commercial offer.
- State that there are no discovery calls, diagnostic calls, paid hours, or done-for-you client work.
- State that lead magnets point directly to coaching.
- Mark older diagnostic references as legacy context.

Acceptance criteria:

- Future Codex sessions reading `PROJECT_CONTEXT.md` will understand the current strategy.
- Any remaining old diagnostic references are clearly labelled as legacy implementation debt.

### TASK-003: Define Shopify Growth Coaching Offer

Stream: Coaching Offer And Public Funnel
Status: Not Started
Priority: P0
Repo: root workspace first, then `next`

Outcome:

- The coaching offer is clear enough to publish and sell.

Scope:

- Final offer name.
- Final monthly price.
- Public promise.
- Who it is for.
- What is included.
- What is not included.
- Weekly group coaching format.
- Checklist-driven modules.
- Member dashboard promise.
- Cancellation/refund expectations.

Acceptance criteria:

- Offer can be explained in under one minute.
- It is clear that this is coaching, not done-for-you implementation.
- It has a direct bridge from free reports/tools.

### TASK-004: Create Module 1 Setup Checklist

Stream: Coaching Curriculum
Status: Not Started
Priority: P0
Repo: root workspace first, then `next`

Outcome:

- New members can follow a clear setup checklist for Codex, GitHub, and safe Shopify theme work.

Scope:

- Codex account setup.
- GitHub account setup.
- Shopify Theme Access app.
- Theme download or access workflow.
- Safe theme copy workflow.
- Basic repo/folder workflow.
- Prompting Codex for Shopify work.
- First low-risk change.
- Preview/check/publish safety rules.

Acceptance criteria:

- A non-technical Shopify merchant can follow the checklist without John taking over.
- Each checklist item has clear completion criteria.
- The checklist is ready to become database-backed task templates.

### TASK-005: Design Checklist And Task Data Model

Stream: Checklist And Task Engine
Status: Not Started
Priority: P0
Repo: `next`

Outcome:

- The app has a clear implementation plan for storing modules, task templates, member task progress, and report-linked recommendations.

Scope:

- Decide Firestore collections/documents.
- Define module template shape.
- Define task template shape.
- Define member task instance shape.
- Define task status values.
- Define relation between reports and recommended modules/tasks.
- Define basic admin/update workflow for John.

Acceptance criteria:

- Data model supports standard module checklists.
- Data model supports member-specific task progress.
- Data model can link a report result to a recommended module or task.
- Data model is practical to implement in the existing app.

### TASK-006: Update Public Funnel From Diagnostic To Coaching

Stream: Coaching Offer And Public Funnel
Status: Not Started
Priority: P0
Repo: `next`

Outcome:

- The public site no longer sells discovery calls, diagnostic calls, or paid implementation, and instead points qualified users toward coaching.

Scope:

- Homepage.
- Booking/diagnostic routes and CTAs.
- Lead magnet result CTAs.
- Header/nav CTAs.
- Transactional copy where relevant.
- Legacy Fix-It/diagnostic language audit.

Acceptance criteria:

- Public CTAs point to coaching or lead magnets, not paid calls.
- No primary funnel path asks users to book a discovery or diagnostic call.
- Copy clearly says members do the work themselves with coaching and checklists.

### TASK-007: Build $695/month Coaching Subscription Path

Stream: Membership, Subscription, And Access
Status: Not Started
Priority: P1
Repo: `next`

Outcome:

- Customers can join Shopify Growth Coaching and pay monthly.

Scope:

- Stripe subscription product/price integration.
- Checkout path.
- Membership status persistence.
- Customer/store linkage.
- Confirmation email.
- Internal notification.
- First-login or onboarding path.

Acceptance criteria:

- Customer can complete monthly subscription checkout.
- Membership status is stored against the customer.
- Customer receives a clear next step.
- John receives internal notification.
- Subscription can grant access to the member area.

### TASK-008: Build Member Dashboard V1

Stream: Membership, Subscription, And Access
Status: Not Started
Priority: P1
Repo: `next`

Outcome:

- Members can log in and see their reports, current module, and checklist tasks.

Scope:

- Member access/authentication.
- Member home screen.
- Store profile.
- Latest report panel.
- Current module panel.
- Checklist task list.
- Task completion controls.
- Weekly call details.

Acceptance criteria:

- Member can log in.
- Member can see their assigned checklist.
- Member can mark tasks complete.
- Member can see latest report context where available.
- The dashboard answers "what should I do next?"

### TASK-009: Finish Golden Ratio Lead Magnet

Stream: Lead Magnets, Tools, And Reports
Status: Not Started
Priority: P1
Repo: root workspace and/or `next`

Outcome:

- The Shopify Golden Ratio lead magnet is ready to attract leads and route qualified users into coaching.

Scope:

- Finish video assets.
- Finalize landing page/report flow.
- Store report results.
- Update CTA to coaching.
- Add result emails and internal notifications if needed.
- Add analytics events.

Acceptance criteria:

- A visitor can complete the Golden Ratio report flow.
- The report gives a useful conversion target or funnel-stage read.
- The result CTA points to coaching, not a diagnostic call.

### TASK-010: Update Existing Lead Magnet Frameworks To Coaching CTA

Stream: Lead Magnets, Tools, And Reports
Status: Not Started
Priority: P1
Repo: root workspace

Outcome:

- Existing lead magnet packets and reusable frameworks no longer assume a paid diagnostic call.

Scope:

- Update `lead-magnets/_frameworks/`.
- Update Shopify Bottleneck Analysis packet language.
- Update report video CTA guidance.
- Update future report template language.
- Add report-to-module/task recommendation language.

Acceptance criteria:

- Future lead magnets inherit coaching-first CTA language.
- Existing report scripts/status docs identify old diagnostic references as legacy.
- Frameworks explain how reports lead into coaching modules and checklist tasks.

### TASK-011: Create Weekly Group Coaching Operating System

Stream: Group Coaching Operations
Status: Not Started
Priority: P1
Repo: root workspace

Outcome:

- Weekly coaching can run consistently without becoming open-ended custom consulting.

Scope:

- Weekly call agenda.
- Question intake process.
- Module teaching segment.
- Member task review format.
- Rules for what John will and will not do.
- Follow-up/update template.

Acceptance criteria:

- A weekly call can be run from the current module and member task data.
- Member questions can be routed back into checklist tasks where possible.
- The format reinforces coaching and avoids drifting into implementation work.

### TASK-012: Build Module 2 Measurement Checklist

Stream: Coaching Curriculum
Status: Not Started
Priority: P2
Repo: root workspace first, then `next`

Outcome:

- Members have a structured checklist for verifying the basic measurement signals needed for ecommerce decisions.

Scope:

- Shopify analytics.
- Meta pixel/events.
- Google Analytics/Ads basics.
- UTMs.
- Report input quality.
- Event trust checklist.

Acceptance criteria:

- Checklist can be completed by a merchant without John logging into accounts for them.
- Each task has clear completion criteria.
- Checklist can be stored as module/task templates.

### TASK-013: Build Report-To-Task Recommendation Logic

Stream: Checklist And Task Engine
Status: Not Started
Priority: P2
Repo: `next`

Outcome:

- Report results can recommend the next module or checklist task.

Scope:

- Define recommendation rules.
- Map Golden Ratio outcomes to modules/tasks.
- Map Bottleneck Analysis outcomes to modules/tasks.
- Store recommendation state.
- Show recommendation in member dashboard.

Acceptance criteria:

- A report result can generate a useful next task or module recommendation.
- The member dashboard can display the recommendation.
- Recommendation logic is simple enough to inspect and maintain.

### TASK-014: Retire Or Repurpose Diagnostic Booking Code

Stream: Coaching Offer And Public Funnel
Status: Not Started
Priority: P2
Repo: `next`

Outcome:

- Legacy booking/diagnostic code no longer creates confusion in the public product.

Scope:

- Audit booking routes.
- Audit booking/payment APIs.
- Decide whether to remove, archive, or repurpose.
- Remove public links.
- Preserve anything useful for subscription onboarding or coaching calls if appropriate.

Acceptance criteria:

- Public site has no primary diagnostic booking path.
- Legacy code is either removed, hidden, or clearly isolated.
- No live payment path sells the old call-based offer.

### TASK-015: Fully Rewrite Project Context For Coaching Model

Stream: Operating System
Status: Not Started
Priority: P2
Repo: root workspace

Outcome:

- `PROJECT_CONTEXT.md` is fully rewritten around the coaching-first model instead of relying on a top-level override.

Scope:

- Replace the old Fix-It Diagnostic primary offer throughout the document.
- Replace the diagnostic booking funnel with the lead-magnet-to-coaching funnel.
- Remove scoped follow-on hours as an intended path.
- Add coaching membership as the primary commercial offer.
- Add checklist-driven member product direction.
- Update implementation notes to reflect subscription, member dashboard, reports, and task/checklist storage.

Acceptance criteria:

- `PROJECT_CONTEXT.md` no longer requires a strategic override to avoid confusion.
- Future Codex sessions can read the whole file without inheriting old offer assumptions.
- Any remaining legacy references are historical notes only.

## Project Workflow Usage

Use this root roadmap for:

- Business and offer decisions.
- Cross-repo sequencing.
- Backlog prioritization.
- Current workstream context.
- Coaching curriculum direction.
- Member task/checklist product direction.

Use `next/.project-workflow/` for:

- Website implementation tasks.
- Subscription and member access work.
- Lead magnet app implementation.
- Members area implementation.
- Checklist/task data model implementation.
- Analytics and transactional email work inside the Next.js app.

Use `email/` workflow or docs later if:

- Email-specific code or templates become substantial enough to manage separately.

Working rule:

- Root roadmap decides what matters.
- Component repo project workflow decides how implementation gets done.

## Status Conventions

Use these simple statuses in this document:

- Not Started
- In Progress
- Blocked
- Waiting
- Complete

Only mark an item Complete when the outcome has been delivered and verified.

## Open Decisions

1. Confirm final public name: **Shopify Growth Coaching**, **Shopify Growth Club**, **Shopify Store Coaching**, or another variant.
2. Confirm final monthly price: assumed `$695/month`, despite the spoken "$6.95" wording in the strategy note.
3. Decide whether weekly group coaching includes any async Q&A, and where that happens.
4. Decide where module/checklist authoring happens first: Markdown templates, admin UI, Firestore seed data, or hardcoded app config.
5. Decide whether members need individual store-specific task assignment in V1, or whether everyone starts with the same Module 1 checklist.
6. Decide how old diagnostic booking pages should behave: redirect, hidden route, archive, or repurpose.
7. Decide when to do the full `PROJECT_CONTEXT.md` rewrite rather than relying on the strategic override.

## Current Principle

Build a scalable coaching product, not another service business. Lead magnets diagnose. Coaching teaches. Checklists drive action. Members do the work themselves.
