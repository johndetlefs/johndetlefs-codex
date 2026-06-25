## User Story

As a Shopify Growth Coaching member, I want Module 4 to help me use Codex to review one important product page from my Module 3 findings, so that I can choose a conversion-focused improvement from structured AI feedback without guessing, editing the live store directly, or confusing product-page problems with traffic problems.

As a Shopify Growth Coaching admin/operator, I want to review a member's Module 4 page choice, audit notes, experiment hypothesis, safe-workflow status, and test outcome, so that the next coaching call can focus on judgement and decision-making instead of reconstructing what happened.

## Goal

Add a fourth member-area module, `Product Page And Offer Improvements`, that turns the Module 3 Golden Ratio handoff into one safe product-page experiment. The module should teach the member to choose the right page, have Codex review it against truthful conversion levers, choose one narrow hypothesis from that AI review, use Codex and Shopify CLI through the existing safe theme workflow, and record a Shopify Rollouts A/B test or low-traffic fallback before deciding what to publish.

## Approach

- Treat Module 3 as the source of truth for the first action: result, confidence, product/page focus, and traffic caveat.
- Keep the module product-page first, but include a decision gate for questionable data or traffic-quality caveats.
- Make Codex the primary review mechanism. The member gathers the page/evidence; Codex inspects, audits against the criteria, separates evidence from assumptions, and recommends narrow experiment options.
- Keep the first Codex prompt inspection-only. It may read theme/product context and produce recommendations, but it must not edit files, change Shopify admin settings, push, publish, create discounts, modify apps, or change tracking.
- Translate the uxpeak source video into checklist-safe Shopify principles: sell the product rather than merely show it, reduce the imagination gap, make proof credible, surface variants and objections, frame offer choices, improve CTA/trust language, and verify every claim.
- Use Shopify Rollouts as the only supported A/B testing platform in this module. Third-party testing platforms are out of scope.
- Keep first-version implementation focused on product-page theme/experience changes that can be tested through a treatment theme. Product admin data, pricing, inventory, discounts, app configuration, ads, pixels, and campaign traffic can be captured as review notes but not implemented as Module 4 test actions.
- Treat low-traffic experiments as directional. Record the limitation and route the decision to coaching rather than claiming statistical proof.
- Add only the UI/persistence needed for members to save the evidence John needs for coaching.
- Use the existing code-defined module model first; do not introduce a database-backed curriculum authoring system in this task.
- Use the existing member progress endpoint and admin member detail patterns for saved response fields.
- Add dedicated saved-note helpers like Module 3 so the member and John can review the selected page, AI findings, selected hypothesis, safe-workflow status, Shopify Rollouts setup, and result notes.

## Source Video Notes

- The source video compares a product page that merely displays a product with one that actively guides the buyer from interest to purchase intent.
- Useful levers for Module 4: truthful status badges, imagery showing usage/outcome context, specific review/social-proof numbers, visible flavour/variant choices, reassurance at the moment of hesitation, subscription/bundle offer cards, softer CTA framing, and trust badges tied to actual buyer concerns.
- Module 4 should not copy unsupported examples. Every proof, badge, sales count, guarantee, certification, health/safety claim, or scarcity cue must be verified by the merchant.

## Open Questions

- None blocking after owner clarification on 2026-06-25.

## Phases

- Phase 1: Confirm open questions and final module shape with the owner before product/code edits. Done on 2026-06-25.
- Phase 2: Extend the member checklist model with Module 4 content, AI-led review prompts, and any needed saved response fields. Done on 2026-06-25.
- Phase 3: Add member-side save helpers for Module 4 notes, including selected page, audit findings, hypothesis, Codex safety check, experiment setup, and result notes. Done on 2026-06-25.
- Phase 4: Add read-only admin review of Module 4 saved work. Done on 2026-06-25.
- Phase 5: Update checklist documentation and validate member/admin flows. Done on 2026-06-25.
- Phase 6: QA/code review gate and owner handoff. Next required step.

## Acceptance Criteria

- [x] AC1: `/members` lists Module 4 after Module 3 with the approved title, description, outcome, and progress count.
- [x] AC2: Non-admin students cannot open Module 4 until Module 3 is complete; admin/operator users can open it for review without mutating progress.
- [x] AC3: `/members/modules/product-page-and-offer-improvements` renders a complete checklist with saved Module 3 context available where relevant.
- [x] AC4: The checklist includes a first decision gate for measurement confidence and traffic caveats so members do not make product-page changes from unreliable data without recording the risk.
- [x] AC5: The checklist guides the member through product/page selection, AI-led product-page review, one selected experiment hypothesis, safe Codex implementation, Shopify CLI preview, Shopify Rollouts setup, and experiment result review.
- [x] AC6: The AI-led product-page review criteria cover the source-video levers in merchant-safe language: credible status/proof cues, imagery that reduces the imagination gap, specific reviews/social proof, visible variants and taste/choice reassurance, subscription/bundle framing, CTA language, and product-specific trust badges.
- [x] AC7: The module explicitly blocks fake or unsupported claims, including fabricated review counts, sales volume, certifications, guarantees, health/safety claims, and scarcity.
- [x] AC8: Copyable Codex prompts instruct Codex to inspect and recommend first without editing files; separate evidence from assumptions; use the local Shopify theme workspace; create or use a project-workflow task and branch before implementation; preview locally; push only to the duplicated approval theme/experiment target after approval; and never publish the live theme.
- [x] AC9: Member progress persistence stores Module 4 response fields for selected page, AI review findings, selected hypothesis, safety notes, experiment setup, and result/decision notes.
- [x] AC10: Admin member detail shows saved Module 4 response fields read-only and handles missing Module 4 data gracefully.
- [x] AC11: The checklist documentation clearly states the guardrails for creating and operating coaching modules: conceptual understanding, exact steps, Codex heavy lifting, inspection-only before implementation, truthful claims only, project-workflow before changes, local Shopify CLI preview, Shopify Rollouts for A/B tests, and no live publish without explicit approval.
- [x] AC12: Validation covers member dashboard/module rendering, locking, response persistence, admin read-only review, lint/build, and workflow doctor.

## Validation

- AC1-AC3: Browser-test `/members` and `/members/modules/product-page-and-offer-improvements` as admin/operator and as a normal student.
- AC2: Verify student locking still depends on Module 3 completion and admin/operator unlock does not mutate progress.
- AC4-AC8: Review rendered checklist copy and prompts against requirements before implementation handoff.
- AC9: Save Module 4 notes as a member, reload, and verify they persist under the workspace progress record.
- AC10: Open `/admin/members/[customerKey]` and verify Module 4 saved work is read-only and missing fields are handled.
- AC11: Review `next/docs/shopify-growth-coaching-checklists.md` for explicit module-creation guardrails.
- AC12: Run `npm run lint`, `npm run build`, and `./.project-workflow/cli/workflow doctor`.

## Task List

| ID | Title | Description | Acceptance Criteria | User Verification | Status |
| --: | ----- | ----------- | ------------------- | ----------------- | ------ |
| 1 | Owner Approval And Experiment Tool Decision | Resolve the A/B testing platform/tool and whether Module 4 includes theme-only or product-admin/app configuration work before implementation. | AC4, AC5, AC8 | Owner confirms the module shape and testing tool choice | Done |
| 2 | Module 4 Checklist Content | Add the Module 4 code-defined checklist after Module 3 with source-video levers, safety gates, AI-led Codex review prompts, implementation prompts, and A/B test steps. | AC1, AC3, AC4, AC5, AC6, AC7, AC8 | Open Module 4 and review the full checklist copy | Done |
| 3 | Member Saved Work | Add Module 4 saved response fields and member-side helper UI for selected page, AI review notes, selected hypothesis, safety check, experiment setup, and result notes. | AC9 | Save Module 4 notes, reload, and confirm the notes persist | Done |
| 4 | Admin Review | Extend admin member detail so operators can inspect Module 4 saved work read-only. | AC10 | Open a student detail page and review Module 4 saved work without editing it | Done |
| 5 | Locking And Dashboard Verification | Confirm Module 4 appears after Module 3, student locks still work, and admin/operator users can open it without progress mutation. | AC1, AC2 | Compare dashboard/module access as admin and student | Done |
| 6 | Documentation And Validation | Update checklist docs, run lint/build/workflow doctor, and complete QA/code review before completion. | AC11, AC12 | Review validation evidence and QA findings | Done |

## Implementation Evidence

- Added `moduleFourChecklist` after Module 3 in `next/app/members/_lib/shopify-growth-coaching.ts` with eight tasks: Module 3 handoff, truthful evidence, inspection-only AI review, one hypothesis, safe treatment implementation, Shopify CLI preview, Shopify Rollouts setup, and result review.
- Added Module 4 Codex prompts that require inspection before editing, separate evidence from assumptions, block unsupported claims, use project-workflow and a branch, validate with Shopify CLI, and prohibit live publishing.
- Added Module 4 response fields to `MemberSavedResponses`, Firestore serialization/parsing, progress API validation, development fallback payloads, member save helpers, prompt interpolation, and admin read-only output.
- Updated `MemberModuleExperience` and `MemberChecklist` so Module 4 can read the previous Module 3 progress record as handoff context without mutating Module 3 progress.
- Updated `next/docs/shopify-growth-coaching-checklists.md` with module creation guardrails and Module 4 Rollouts boundaries.
- Validation on 2026-06-25:
  - `npm run lint` from `next`: passed.
  - `npm run build` from `next`: passed; build includes `/members/modules/[moduleId]`.
  - `git diff --check` from `next`: passed.
  - Built-app route smoke on `http://localhost:3001`: `/members` redirected to login, `/members/modules/product-page-and-offer-improvements` redirected to the correct login URL, and the login URL returned 200.
  - `./.project-workflow/cli/workflow doctor` from the parent workspace: passed with no issues.
  - A separate `next dev --port 3001` attempt was blocked by an existing `.next/dev/lock`; the lock was not removed because another Next process was already present.
  - `npm run qa:members` from `next`: passed; the suite logs in as the local development member, seeds Modules 1-3 complete and Module 4 partial, then verifies the dashboard, Module 4 page, progress API snapshot, and admin member detail.

## QA & Code Review

- Date: 2026-06-25
- Reviewed areas: Module 4 checklist content, member dashboard/module rendering, Module 4 saved-response persistence, checklist unlock flow, admin member detail missing-state and saved-value rendering, responsive mobile sanity, Firestore/API response typing, local member QA suite, docs, and workflow state.
- Validation evidence:
  - AC1: Verified in the in-app browser at `http://localhost:3000/members`; Module 4 appears after Module 3 and links to `/members/modules/product-page-and-offer-improvements`.
  - AC2: Verified module unlock implementation still uses previous-module completion in `MemberModuleList` and `MemberModuleExperience`; development/operator session unlocks all modules without mutating progress. Normal-student locked state remains code-path verified rather than impersonated with a non-operator account.
  - AC3-AC8: Verified Module 4 browser page renders eight steps, saved Module 3 handoff, inspection-only labels, truth/claims guardrails, Added to cart rate, Shopify Rollouts copy, and no-live-publish guardrails.
  - AC9: Saved Module 4 Step 1 readiness decision, selected product/page URL, and reason as the local development member; reloaded the page and verified the values persisted and Step 1 could be completed.
  - AC10: Opened admin member detail for an existing active member; verified Module 4 card renders all eight task rows and missing Module 4 data displays cleanly as `No saved work for this module yet`. Added `npm run qa:members`, which seeds the development member and verifies admin saved-value rendering for non-empty Module 4 fields.
  - AC11: Rechecked `next/docs/shopify-growth-coaching-checklists.md` includes module creation guardrails, Module 4 Rollouts boundaries, and the local member QA suite instructions.
  - AC12: `npm run lint`, `npm run build`, `npm run qa:members`, `git diff --check` in parent and `next`, mobile-width browser sanity at 390px, and `./.project-workflow/cli/workflow doctor` all passed.
- Findings:
  - Fixed during QA: missing Golden Ratio revenue in the Module 4 handoff displayed as `$0` because `Number("")` was treated as zero. `formatSavedCurrency` now returns `Not saved yet` for blank values.
  - Fixed during QA: development-member progress could create a workspace/progress record without a complete member record. `ensurePrimaryWorkspace` now upserts the core member fields so the development QA member can be opened in admin detail.
- Deferred checks:
  - A future suite can add a dedicated non-operator fixture or Firebase emulator path to browser-test the locked normal-student state directly. Current lock behavior is code-path verified and development/operator browser-verified.
- Verdict: Pass with follow-ups. No blocking findings.

## Retro

- Date: 2026-06-25
- Reusable lessons:
  - Coaching module changes need a repeatable member QA path, not just a manual browser pass. `npm run qa:members` is now the local regression path for module order, seeded handoff data, saved member responses, and admin read-only review.
  - Module 4 should stay as the first supervised product-page experiment workflow. The ongoing monthly testing cadence should be handled by a separate member-area Growth Workspace rather than overloading this setup module.
- Conventions or agent assets updated:
  - `next/docs/shopify-growth-coaching-checklists.md` now documents module creation guardrails and the local member QA suite.
- Follow-up suggestions:
  - Create a future task for an ongoing member Growth Workspace that tracks monthly experiments, advertising posted, data snapshots, coaching questions, decisions, and next actions.
  - Add a dedicated non-operator fixture or Firebase emulator path to browser-test locked student state directly.
- Missed in-scope work: None. The non-operator browser fixture was explicitly deferred as a follow-up after code-path verification.

## Notes

- Task: COACH-002
- Title: Create Module 4 Product Page And Offer Improvements
- Created: 2026-06-23
- Status: Complete on 2026-06-25; QA/code review verdict was pass with follow-ups.
- Parent workspace branch: `codex/coach-002-module-4-product-page`
- `next` branch: `codex/coach-002-module-4-product-page`
