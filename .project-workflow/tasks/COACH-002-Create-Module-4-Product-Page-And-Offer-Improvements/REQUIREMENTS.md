# Requirements

## Summary

- Task: COACH-002
- Title: Create Module 4 Product Page And Offer Improvements
- Last updated: 2026-06-25
- Primary repo: `next`
- Repos touched: `next`, parent workspace workflow docs
- Workflow owner: parent workspace tracker
- Branch/PR: parent workspace branch `codex/coach-002-module-4-product-page`; `next` branch `codex/coach-002-module-4-product-page`; PR not started
- Archived context: continues the Shopify Growth Coaching member-area work migrated from the former `next` workflow state and follows `JOHNDETLEFS_PROGRAM_ROADMAP.md`.
- Source video reviewed: `Ecommerce Page Redesign: UX/UI Tips to 3.5x Conversion` by uxpeak, YouTube ID `oYskl2ZBoBc`, published 2026-04-25, transcript fetched 2026-06-23.

## Goal

Create Module 4 in the Shopify Growth Coaching member area so members can turn their Module 3 Golden Ratio result into one safe, measurable product-page or offer improvement. The module should help a non-technical merchant use Codex as the primary reviewer of the selected product page, have Codex assess the page against the product-page criteria, identify the most important conversion objections, prepare one narrow change, preview it through Shopify CLI, and set it up as an experiment before making any permanent live-store decision.

## Non-Goals

- Do not implement product/code changes until the owner approves these requirements and the implementation plan.
- Do not turn Module 4 into a full store redesign, brand refresh, campaign audit, ad creative module, or checkout optimisation module.
- Do not ask members to change campaigns, budgets, pixels, analytics settings, audiences, or traffic sources; traffic concerns should be captured as caveats or routed to a later module.
- Do not encourage direct live-theme edits, live pushes, live publishing, or unreviewed production changes.
- Do not invent reviews, sales counts, certifications, guarantees, ingredient claims, medical claims, safety claims, or scarcity claims.
- Do not require members to become developers, learn Git deeply, or choose technical branching strategy themselves.
- Do not support or recommend third-party A/B testing platforms in this module.
- Do not drift into done-for-you implementation by John; the member does the work with checklist structure and coaching review.

## Users & Context

- Coaching members arrive after Module 3 with a Golden Ratio result, measurement-confidence note, first product/page focus, and a lightweight traffic caveat.
- Many members will likely see a product-page/add-to-cart bottleneck, but some may have questionable measurement data or a traffic-quality caveat that should prevent overconfident product-page changes.
- Members have already set up Codex, GitHub, Shopify CLI, a duplicated approval theme, project-workflow guardrails, and a local theme preview in Modules 1 and 2.
- The member-area checklist is currently code-defined in `next/app/members/_lib/shopify-growth-coaching.ts`, with progress and saved response fields persisted under `shopifyGrowthWorkspaces/{workspaceId}/progress/{moduleId}`.
- Admin/operator users need to review saved Module 4 notes before coaching, just as Module 3 notes are now reviewable.

## Requirements (Outcome-Focused)

- Module 4 must appear after Module 3 as `Product Page And Offer Improvements`, locked for non-admin students until Module 3 is complete and available to admin/operator users.
- Module 4 must start by reusing the saved Module 3 context: Golden Ratio result, measurement confidence, first product/page focus, and traffic caveat.
- Module 4 must help the member decide whether it is appropriate to proceed with a product-page experiment now, defer because measurement is not reliable enough, or route a traffic-quality issue to a later module.
- Module 4 must make the first product/page target explicit and saved, including why that product/page has enough commercial weight to inspect.
- Module 4 must make the product-page review AI-led: the member should ask Codex to inspect the selected product page, theme/template context, and available product evidence against the Module 4 criteria before any edit is proposed.
- Module 4 must teach Codex to audit the page against conversion levers from the source video, adapted for small Shopify merchants: product promise, visual context, proof, variant clarity, offer framing, CTA language, trust signals, and objection handling.
- Module 4 must require Codex to separate observations, evidence, assumptions, risk, and recommendations so members can understand what is known versus inferred.
- Module 4 must require proof and claims to be true, current, and supportable. Badges such as best-seller, top-rated, review counts, sold-this-week counts, guarantees, third-party testing, vegan status, shipping promises, or returns promises can only be used when the merchant can verify them.
- Module 4 must ask the member to choose one narrow experiment hypothesis instead of changing many page elements at once.
- Module 4 must include an inspection-only Codex prompt that audits the selected product template/page without changing files, summarises risks, identifies likely Shopify theme files/settings, and proposes one to three narrow experiment options.
- Module 4 must include a decision step where the member selects one Codex-recommended hypothesis or brings the recommendation to coaching before implementation.
- Module 4 must include a Codex prompt that uses the member's existing local Shopify theme workspace, project-workflow guardrails, branch, and duplicated approval theme before making any theme change.
- Module 4 must require local preview through Shopify CLI and basic theme validation before any approval-theme upload.
- Module 4 must prohibit live publish commands and direct live theme edits during the module. Approved changes may go only to the duplicated approval theme or an experiment variant until the member and coach explicitly approve the next step.
- Module 4 must include a testing step that records the chosen A/B testing platform/tool, experiment name, variant URL or preview, primary metric, start date, and decision rule.
- Module 4 must use Shopify Rollouts as the only supported A/B testing platform. The module should explain that Rollouts can test online store theme changes and checkout/accounts configuration, but Module 4 uses only the online store/product-page theme experience.
- Module 4 must route code-level product-page changes through a treatment theme path: Codex prepares and previews the local change, the member uploads or selects an unpublished treatment theme, and Shopify Rollouts compares the live/control theme against that treatment.
- Module 4 must not ask members to A/B test direct Shopify admin product-data edits such as price, inventory, live product copy, product media, discounts, app configuration, campaign traffic, or tracking settings. Codex may identify those as recommendations or coaching questions, but the first Module 4 experiment should stay in the testable product-page theme experience.
- Module 4 must record `Added to cart rate` as the default primary Rollouts metric for product-page experiments, with reached checkout, bounce rate, and conversion rate as supporting metrics where available.
- Module 4 must support a low-traffic fallback: if a formal A/B test is not scientifically useful yet, the member should record that limitation and use coaching review plus a cautious before/after observation plan rather than pretending the test is conclusive.
- Module 4 must persist member notes for the selected page, audit findings, experiment hypothesis, Codex safety check, test setup, and result/decision notes.
- Admin member detail must expose saved Module 4 notes in a read-only, scannable way.
- Module 4 should update `next/docs/shopify-growth-coaching-checklists.md` so the checklist design remains documented outside the code.

## Acceptance Criteria (Verifiable)

- AC1: `/members` lists Module 4 after Module 3 with the approved title, description, outcome, and progress count.
- AC2: Non-admin students cannot open Module 4 until Module 3 is complete; admin/operator users can open it for review without mutating progress.
- AC3: `/members/modules/product-page-and-offer-improvements` renders a complete checklist with saved Module 3 context available where relevant.
- AC4: The checklist includes a first decision gate for measurement confidence and traffic caveats so members do not make product-page changes from unreliable data without recording the risk.
- AC5: The checklist guides the member through product/page selection, AI-led product-page review, one selected experiment hypothesis, safe Codex implementation, Shopify CLI preview, Shopify Rollouts setup, and experiment result review.
- AC6: The AI-led product-page review criteria cover the source-video levers in merchant-safe language: credible status/proof cues, imagery that reduces the imagination gap, specific reviews/social proof, visible variants and taste/choice reassurance, subscription/bundle framing, CTA language, and product-specific trust badges.
- AC7: The module explicitly blocks fake or unsupported claims, including fabricated review counts, sales volume, certifications, guarantees, health/safety claims, and scarcity.
- AC8: Copyable Codex prompts instruct Codex to inspect and recommend first without editing files; separate evidence from assumptions; use the local Shopify theme workspace; create or use a project-workflow task and branch before implementation; preview locally; push only to the duplicated approval theme/experiment target after approval; and never publish the live theme.
- AC9: Member progress persistence stores Module 4 response fields for selected page, AI review findings, selected hypothesis, safety notes, experiment setup, and result/decision notes.
- AC10: Admin member detail shows saved Module 4 response fields read-only and handles missing Module 4 data gracefully.
- AC11: The checklist documentation clearly states the guardrails for creating and operating coaching modules: conceptual understanding, exact steps, Codex heavy lifting, inspection-only before implementation, truthful claims only, project-workflow before changes, local Shopify CLI preview, Shopify Rollouts for A/B tests, and no live publish without explicit approval.
- AC12: Validation covers member dashboard/module rendering, locking, response persistence, admin read-only review, lint/build, and workflow doctor.

## Open Questions (Answer Needed)

- None blocking after owner clarification on 2026-06-25.

## Decisions (Resolved)

- Module 4 should primarily focus on product page and offer improvements, not traffic campaign changes.
- Module 4 should use Module 3 Golden Ratio context as the handoff rather than starting from a generic product-page checklist.
- Module 4 should be AI-led: Codex should review the selected product page against the module criteria before the member chooses an experiment.
- Codex review must be inspection-only first. Implementation can only follow after the member chooses one narrow hypothesis and the safe Shopify CLI/project-workflow path is confirmed.
- Module 4 uses Shopify Rollouts only for A/B testing. Third-party testing platforms are out of scope.
- The first implementation should support product-page theme/experience changes that can be tested through Shopify Rollouts. Direct product admin data, pricing, inventory, discounts, apps, ads, pixels, and campaign traffic are review notes or future-module topics, not first-version test actions.
- Low-traffic experiments should be treated as directional. The module should record the limitation and bring the decision to coaching rather than claiming statistical proof.
- Module 4 should ship with dedicated saved-note helpers like Module 3 so John can review the selected page, AI findings, hypothesis, safety status, Rollouts setup, and results before coaching.
- Product-page changes must be safe, narrow, previewed, and testable before any permanent live-store decision.
- The source video is useful as inspiration for conversion levers, but the module must adapt it to truthful Shopify merchant work rather than copying every demonstrated pattern blindly.
- Owner approval to proceed was given on 2026-06-25.

## Validation Plan

- Run `npm run lint` from `next`.
- Run `npm run build` from `next` because adding a module changes static params, route metadata, persisted response types, and admin rendering.
- Browser-test `/members` and `/members/modules/product-page-and-offer-improvements` as admin/operator and as a normal student with and without Module 3 complete.
- Browser-test Module 4 response saves and reloads for a member workspace.
- Browser-test `/admin/members/[customerKey]` to verify Module 4 saved work is read-only and missing data renders cleanly.
- Run `./.project-workflow/cli/workflow doctor` from the workspace root after workflow doc changes.
