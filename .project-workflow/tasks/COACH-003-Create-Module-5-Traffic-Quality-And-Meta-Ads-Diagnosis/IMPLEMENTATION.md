## User Story

As a Shopify Growth Coaching member, I want Module 5 to help me diagnose whether my Meta traffic is helping or distorting the product-page work, so that I can make one clear advertising decision for coaching without randomly changing campaigns, budgets, pixels, or ads.

As a Shopify Growth Coaching admin/operator, I want to review a member's Meta snapshot, Shopify comparison, traffic diagnosis, advertising hypothesis, and Module 6 image-theme brief, so that the next coaching call can focus on judgement and next action rather than reconstructing Ads Manager screenshots.

## Goal

Add a fifth member-area module, `Traffic Quality And Meta Ads Diagnosis`, that turns the Module 3 traffic caveat and Module 4 product-page work into one read-only advertising diagnosis. The module should help the member collect a Meta advertising snapshot, compare it with Shopify and the saved coaching context, classify the traffic-quality issue, and prepare a brief for Module 6 image-ad theme discovery using the local `product-ads` engine.

## Approach

- Treat Module 3 as the source of the initial traffic caveat: Golden Ratio result, measurement confidence, product/page focus, and coaching brief.
- Treat Module 4 as useful product-page/offer work, not something that needs traffic permission before it can happen.
- Bring Module 4 context into Module 5 where available, especially selected page, hypothesis, Rollouts setup, result notes, and low-traffic caveats.
- Make Module 5 read-only. Members can inspect Meta Ads Manager, Shopify, screenshots, and exports, but they should not change campaigns, budgets, objectives, audiences, ads, pixels, attribution settings, Shopify products, discounts, or theme files in this module.
- Keep Meta/Facebook/Instagram as the first supported ad platform. Other channels may be noted only as traffic context.
- Ask Codex to do the structured interpretation from member-provided notes/screenshots/exports, separating observations, evidence, assumptions, risks, and recommendations.
- Classify the result in merchant language: traffic good enough for current learning, weak traffic quality, unreliable tracking/attribution, creative/landing-page mismatch, poor campaign economics, or not enough data.
- Produce one advertising hypothesis and one Module 6 image-theme brief. Module 6, not Module 5, will use `product-ads` to create image ad variants. Video comes later.
- Use the existing code-defined module model first; do not introduce Meta API integration, database-backed curriculum authoring, or a client-facing `product-ads` UI in this task.
- Use the existing member progress endpoint and admin member detail patterns for saved response fields.

## Phases

- Phase 1: Confirm owner approval on requirements and implementation plan. Completed in-thread on 2026-06-26.
- Phase 2: Extend the member checklist model with Module 5 content, read-only diagnosis prompts, and saved response fields. Completed.
- Phase 3: Add member-side save helpers for Module 5 notes, including Meta snapshot, Shopify comparison, diagnosis, hypothesis, and Module 6 image-theme brief. Completed.
- Phase 4: Add read-only admin review of Module 5 saved work. Completed.
- Phase 5: Update checklist documentation and local member QA coverage. Completed.
- Phase 6: Validate, run QA/code review gate, and hand off for owner review. Completed on 2026-06-29.

## Acceptance Criteria

- [x] AC1: `/members` lists Module 5 after Module 4 with the approved title, description, outcome, and progress count.
- [x] AC2: Non-admin students cannot open Module 5 until Module 4 is complete under the current sequential module model; admin/operator users can open it for review without mutating progress.
- [x] AC3: `/members/modules/traffic-quality-and-meta-ads-diagnosis` renders a complete checklist with saved Module 3 context and relevant Module 4 context available where useful.
- [x] AC4: The checklist states that Module 5 does not gate Module 4 and that product-page/offer improvements remain useful even when traffic quality is imperfect.
- [x] AC5: The checklist guides the member through a read-only Meta advertising snapshot, Shopify/Meta comparison, traffic-quality classification, one advertising hypothesis, and a Module 6 image-theme brief.
- [x] AC6: Copyable Codex prompts instruct Codex to inspect and recommend first without changing campaigns, budgets, audiences, ads, pixels, attribution settings, Shopify settings, products, discounts, or theme files.
- [x] AC7: The diagnosis categories use plain merchant language and cover traffic good enough, weak traffic quality, unreliable tracking/attribution, creative/landing-page mismatch, poor campaign economics, and not enough data.
- [x] AC8: Module 5 explicitly routes new static image ad production to Module 6 and notes that video can come later.
- [x] AC9: Member progress persistence stores Module 5 response fields for the Meta snapshot, Shopify comparison, traffic diagnosis, advertising hypothesis, and Module 6 image-theme brief.
- [x] AC10: Admin member detail shows saved Module 5 response fields read-only and handles missing Module 5 data gracefully.
- [x] AC11: The checklist documentation clearly states the Module 5 purpose, task order, no-change diagnosis guardrails, and handoff into Module 6 image-ad theme discovery using `product-ads`.
- [x] AC12: Validation covers member dashboard/module rendering, locking, response persistence, admin read-only review, lint/build, member QA suite, and workflow doctor.

## Validation

- AC1-AC3: Browser-test `/members` and `/members/modules/traffic-quality-and-meta-ads-diagnosis` as admin/operator and as a normal student.
- AC2: Verify student locking still depends on previous-module completion and admin/operator unlock does not mutate progress.
- AC4-AC8: Review rendered checklist copy and prompts against requirements before implementation handoff.
- AC9: Save Module 5 notes as a member, reload, and verify they persist under the workspace progress record.
- AC10: Open `/admin/members/[customerKey]` and verify Module 5 saved work is read-only and missing fields are handled.
- AC11: Review `next/docs/shopify-growth-coaching-checklists.md` for explicit Module 5 and Module 6 boundary documentation.
- AC12: Run `npm run lint`, `npm run build`, `npm run qa:members`, and `./.project-workflow/cli/workflow doctor`.

## Task List

| ID | Title | Description | Acceptance Criteria | User Verification | Status |
| --: | ----- | ----------- | ------------------- | ----------------- | ------ |
| 1 | Owner Approval And Module Boundary Confirmation | Confirm the requirements and implementation plan before code edits, including the boundary that Module 5 diagnoses traffic and Module 6 creates image ads with `product-ads`. | AC4, AC8, AC11 | Owner approved requirements and plan in the thread on 2026-06-26 | Done |
| 2 | Module 5 Checklist Content | Add the Module 5 code-defined checklist after Module 4 with saved handoff context, Meta snapshot steps, Shopify comparison, diagnosis categories, no-change guardrails, and copyable Codex prompts. | AC1, AC3, AC4, AC5, AC6, AC7, AC8 | Browser verified Module 5 route, title, prompts, diagnosis options, and `product-ads` handoff | Done |
| 3 | Member Saved Work | Add Module 5 saved response fields and member-side helper UI for Meta snapshot, Shopify comparison, traffic diagnosis, advertising hypothesis, and Module 6 image-theme brief. | AC9 | Browser saved all Module 5 fields, completed 6 of 6 tasks, reloaded, and confirmed persisted values | Done |
| 4 | Admin Review | Extend admin member detail so operators can inspect Module 5 saved work read-only. | AC10 | Browser verified admin member detail shows Module 5 summary, diagnosis, and Module 6 brief | Done |
| 5 | Locking And Dashboard Verification | Confirm Module 5 appears after Module 4, student locks still work, and admin/operator users can open it without progress mutation. | AC1, AC2, AC3 | Browser verified sequential Module 5 task locking and completion flow; QA fixture covers dashboard/module render | Done |
| 6 | Documentation And QA Coverage | Update checklist docs, seed Module 5 in the member QA suite, run validations, and complete QA/code review before completion. | AC11, AC12 | Docs updated; lint/build/member QA/diff/doctor passed | Done |

## Implementation Evidence

- Added Module 5 to the code-defined Shopify Growth Coaching curriculum after Module 4, with six tasks covering starting context, read-only Meta snapshot, Shopify comparison, traffic diagnosis, advertising hypothesis, and Module 6 image-theme brief.
- Updated Module 4 copy so traffic and advertising quality are treated as a caveat for interpretation, not as permission to do product-page work.
- Added persisted Module 5 response fields to the member store, member progress API validation, member checklist UI, admin member detail, and the local member QA fixture.
- Added Module 5 dashboard/module/admin assertions to `next/scripts/qa-shopify-growth-members.mjs`.
- Updated `next/docs/shopify-growth-coaching-checklists.md` with the Module 5 purpose, task order, no-change guardrails, diagnosis categories, and Module 6 `product-ads` boundary.

## Validation Evidence

- `npm run lint` from `next`: passed.
- `npm run build` from `next`: passed.
- `env MEMBER_QA_BASE_URL=http://localhost:3001 npm run qa:members` from `next`: passed on 2026-06-29 against the local Next.js dev server.
- `git diff --check` from the parent workspace: passed.
- `git diff --check` from `next`: passed.
- `./.project-workflow/cli/workflow doctor` from the parent workspace: passed.
- Local browser verification through Chrome:
  - Logged in through `/members/login/development?next=%2Fmembers%2Fmodules%2Ftraffic-quality-and-meta-ads-diagnosis`.
  - Verified the Module 5 page title, diagnosis dropdown categories, read-only `product-ads` handoff language, and sequential task locking.
  - Saved QA-marked Meta snapshot notes, Shopify comparison notes, `creative-landing-page-mismatch` diagnosis, advertising hypothesis, and Module 6 image-theme brief.
  - Completed 6 of 6 Module 5 tasks, reloaded the page, and confirmed all saved values persisted.
  - Opened `/admin/members/customer_5db591955bd26e3a076264d1` and confirmed the admin view shows the Module 5 saved-work summary, diagnosis, and Module 6 brief read-only.

## QA & Code Review

- Date: 2026-06-29.
- Reviewed areas: Module 5 curriculum content and prompts, member saved-response persistence, progress API validation, sequential locking, admin member detail output, documentation, and member QA fixture coverage.
- Validation evidence by acceptance criteria:
  - AC1-AC3: `npm run qa:members` verified dashboard/module rendering with Module 5 fixture data; local browser verification also covered the Module 5 route.
  - AC4-AC8: Checklist and docs review verified non-gating Module 4 language, read-only Meta diagnosis guardrails, diagnosis categories, and Module 6 `product-ads` image-ad handoff.
  - AC9: Local browser verification saved all Module 5 response fields, reloaded, and confirmed persistence; `npm run qa:members` verified API snapshots.
  - AC10: Local browser verification and `npm run qa:members` verified admin member detail output.
  - AC11: `next/docs/shopify-growth-coaching-checklists.md` documents Module 5 purpose, no-change guardrails, task order, and Module 6 boundary.
  - AC12: `npm run lint`, `npm run build`, `env MEMBER_QA_BASE_URL=http://localhost:3001 npm run qa:members`, `git diff --check`, and `./.project-workflow/cli/workflow doctor` passed.
- Findings: None.
- Verdict: Pass.

## Retro

- Date: 2026-06-29.
- Reusable lessons: Member-area module work should keep the local `npm run qa:members` fixture current whenever persisted response fields, admin summaries, or module ordering change. Browser verification is useful for interactive save/reload behavior, but the command-line member QA suite should pass before production push.
- Conventions or agent assets updated: No durable guidance changes needed; the existing workflow guidance already requires child repo validation and workflow doctor checks.
- Follow-up tasks: Create Module 6 image-ad theme discovery using `product-ads`.
- Missed in-scope work: None.

## Notes

- Task: COACH-003
- Title: Create Module 5 Traffic Quality And Meta Ads Diagnosis
- Created: 2026-06-26
- Status: Complete; ready for production push.
- Parent workspace branch: `codex/COACH-003-create-module-5-traffic-quality-and-meta-ads-diagnosis`
- `next` branch: `codex/COACH-003-create-module-5-traffic-quality-and-meta-ads-diagnosis`
