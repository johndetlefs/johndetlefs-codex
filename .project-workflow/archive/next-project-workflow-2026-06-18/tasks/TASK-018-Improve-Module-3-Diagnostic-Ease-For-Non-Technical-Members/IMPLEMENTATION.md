## User Story

As a non-technical Shopify Growth Coaching member who has already completed setup modules, I want Module 3 to reuse my saved store/admin details, guide me through the Golden Ratio diagnostic, check whether the numbers are trustworthy, and identify the first product or page to inspect, so that I can arrive at coaching with a clear diagnosis before changing my site or ads.

## Goal

Make Module 3 feel like a joined-up member workflow rather than a public lead magnet embedded in a checklist. The normal path should reuse saved member/setup data, recover missing admin details in place, run the Golden Ratio diagnostic with minimal repeated entry, write the generated result back into the Module 3 experience, help the member judge confidence in the numbers, and produce a concise coaching brief.

## Approach

- Reuse the existing member progress/setup data model where possible, especially the saved Shopify Admin URL captured in Module 1.
- Add a member-facing admin-context surface in Module 3 that shows the saved admin/store context, opens Shopify admin directly, and lets the member repair a missing admin URL in place.
- Extend the member-context diagnostic path so known member/store details are prefilled or confirmed rather than retyped.
- Persist the generated Golden Ratio result reference back to the member/module experience when the member-context diagnostic completes.
- Keep the existing Golden Ratio analysis as the calculation source of truth; write back only a protected linked summary to Module 3.
- Gate result write-back behind authenticated member context so anonymous/public lead magnet usage cannot update member progress.
- Replace the current manual "record what the diagnostic says" task with a review/interpretation task that uses the generated result as the source of truth.
- Keep top-product/top-page focus in Module 3 because it directly chooses the first Module 4 inspection target.
- Make the top-product/top-page step honest about its data source: the current diagnostic provides funnel and landing-page-type context, while top-selling product focus still needs Shopify product/page evidence for the same date range.
- Add a measurement-confidence step so the member knows whether the result is usable, questionable, or not enough yet.
- Use plain confidence states such as usable, questionable, and not enough yet instead of technical statistical language.
- Replace the current paid-social signal-health task with a lightweight traffic-context snapshot and defer campaign-level paid-social work to Module 5.
- Make the final Module 3 brief the handoff into coaching: result, confidence, Module 4 focus, traffic caveats, what not to change, and questions.
- Preserve public lead magnet behaviour and existing signed report/persistence architecture.

## Phases

1. Requirements and UX decision update: resolve open questions, record owner decisions, and keep the task gated before execution.
2. Data/context discovery: inspect the existing member progress shape, saved setup fields, and bottleneck analysis result payload to identify the smallest safe integration path.
3. Module 3 admin-context UX: surface saved Shopify Admin URL/store context, direct admin links, and in-module missing-admin recovery.
4. Member diagnostic prefill and result write-back: reuse known profile/setup fields, pass member context through the diagnostic, and persist/show the generated result in Module 3.
5. Module 3 pathway refinement: restructure the module around result review, top-product/page focus, measurement confidence, light traffic context, and the final coaching brief.
6. Validation and handoff: browser-test saved/missing admin states, known member detail prefill, result write-back, measurement confidence, traffic context, checklist locking, public lead magnet preservation, lint, and build if needed.

## Acceptance Criteria

- [x] AC1: Module 3 shows the member's saved Shopify Admin URL or store context near the top of the module or inside the relevant diagnostic task, with a direct way to open Shopify admin.
- [x] AC2: If the saved Shopify Admin URL is available, the Golden Ratio task does not ask the member to paste it again as a normal path; it uses saved context and direct links wherever possible.
- [x] AC3: If the saved Shopify Admin URL is missing, Module 3 gives a visible recovery path with plain-language steps and an in-module way to save or re-save it before continuing.
- [x] AC4: The Golden Ratio task copy explains the diagnostic flow in simple member language: open diagnostic, confirm known details, open/export the correct Shopify report, upload the CSV, enter AOV for the same period, calculate result, and change nothing in the store.
- [x] AC5: The diagnostic/member flow avoids duplicating information already captured by the member profile, setup tasks, or report. Known name, email, store, and admin details are prefilled, reused, or shown for confirmation where practical.
- [x] AC6: Module 3 shows the generated Golden Ratio result back inside the member experience after completion, including a result link and the key report fields needed for coaching where available.
- [x] AC7: The post-diagnostic task focuses on reviewing and interpreting the already-generated result for Module 4 and Module 5, not re-recording the calculator output as busywork.
- [x] AC8: Module 3 includes a measurement-confidence step that helps the member classify the numbers as usable, questionable, or not enough yet, with non-technical recovery guidance for missing admin link, unable to find report, upload failure, unknown AOV, confusing result, weak sample size, or missing tracking.
- [x] AC9: Existing member checklist progress behaviour remains intact: sequential tasks still lock/unlock correctly and mark-complete behaviour still works.
- [x] AC10: Existing Golden Ratio diagnostic calculation, signed report links, persistence, and public lead-magnet behaviour are preserved unless an approved requirement says otherwise.
- [x] AC11: Validation includes browser review of Module 3 with saved admin context, missing admin context, known member details, completed diagnostic/result context, measurement-confidence context, and lightweight traffic context, plus confirmation that the member diagnostic path no longer asks for unnecessary repeated entry.
- [x] AC12: Module 3 includes a top-product/top-page focus step that helps the member identify the first commercially meaningful product or page area for Module 4.
- [x] AC13: Module 3 includes only a lightweight traffic-context snapshot and removes or defers campaign-level paid-social audit work to Module 5.
- [x] AC14: The final Module 3 coaching brief summarizes the Golden Ratio result, measurement confidence, first Module 4 product/page focus, traffic caveats, what not to change yet, and coaching questions.
- [x] AC15: Module 3 result write-back stores and displays a linked summary of the existing Golden Ratio analysis rather than duplicating the full report or recalculating results in member progress.
- [x] AC16: Result write-back only occurs for an authenticated member-context diagnostic associated with the current member/workspace; anonymous or public lead-magnet usage cannot update member progress.
- [x] AC17: The top-product/top-page focus step is honest about data source: it guides the member to Shopify product/page evidence for the same date range and does not imply product-level data is automatically produced by the Golden Ratio diagnostic.
- [x] AC18: The measurement-confidence step uses plain member-friendly categories such as usable, questionable, and not enough yet, with clear next action for each state.

## Validation

- AC1: Browser-check Module 3 with a saved Shopify Admin URL and confirm the saved context and open-admin action are visible.
- AC2: Browser-check the normal saved-context Golden Ratio path and confirm the task/diagnostic no longer asks for admin URL entry as the main path.
- AC3: Browser-check missing-admin state and confirm the member can save or repair the admin URL inside Module 3.
- AC4: Inspect Module 3 task copy and browser-rendered steps for plain-language diagnostic flow and read-only guardrails.
- AC5: Browser-check the member-context diagnostic with known profile/setup data and confirm known details are prefilled, reused, or confirmable where practical.
- AC6: Complete or simulate the member-context diagnostic result path and confirm the generated result appears back in Module 3 with a usable result link and key fields where available.
- AC7: Inspect the post-diagnostic task and confirm it uses the generated result as source of truth for coaching interpretation.
- AC8: Browser-check or code-inspect missing admin, report/upload uncertainty, unknown AOV, confusing result, weak sample size, missing tracking, and other measurement-confidence copy for actionable non-technical recovery language.
- AC9: Browser-check checklist locking and mark-complete behaviour after the changes.
- AC10: Browser-check public `/shopify-bottleneck-analysis` flow remains public-lead-magnet oriented and run lint/build for route safety.
- AC11: Record browser evidence for saved admin, missing admin, known member details, completed diagnostic/result context, measurement-confidence context, and lightweight traffic context.
- AC12: Inspect the top-product/top-page task and verify it directly identifies the first Module 4 inspection target.
- AC13: Inspect Module 3 and verify campaign-level paid-social audit work is removed or clearly deferred to Module 5.
- AC14: Inspect the final brief task and verify it produces the intended coaching handoff.
- AC15: Inspect persisted member result state and confirm it stores a linked summary/reference to the Golden Ratio analysis, not a duplicate full report or second calculation.
- AC16: Browser-check authenticated member-context result write-back and public/anonymous diagnostic usage to confirm only the member-context flow updates member progress.
- AC17: Inspect the top-product/top-page task and confirm it points to Shopify product/page evidence for the same date range without claiming automatic product-level Golden Ratio output.
- AC18: Inspect measurement-confidence UI/copy and confirm the states are plain-language and action-oriented.

## Implementation Evidence

- Data mapping: `MemberSavedResponses` now has narrow Module 3 fields for a linked Golden Ratio result summary plus member-owned notes. Firestore read/write and `/api/members/progress` validation were updated for those fields.
- Module 3 UX: Checklist now starts with store-context confirmation, shows saved/missing Shopify admin state, provides in-module admin repair, removes duplicate result transcription, adds linked result review, product/page focus, measurement confidence, light traffic context, and final coaching brief steps.
- Diagnostic prefill: Member-context `/shopify-bottleneck-analysis?context=member-module-3` receives known member name/email/store defaults from the member session and workspace where available.
- Report setup: Member-context report setup can receive the saved Shopify Admin URL after token/member email guard checks, and the copy changes from paste-first to confirm-saved when available.
- Result write-back: Final Golden Ratio result generation writes a protected linked summary back to Module 3 only when the original report link has member context, the request has an authenticated member session, the analysis email matches the member email, and any existing workspace store handle is not contradicted.
- Source-of-truth: The Golden Ratio analysis remains the canonical persisted report; Module 3 stores only analysis ID, result link, generated-at timestamp, overall status, bottleneck, revenue summary, and top landing-page type.
- QA fix pass: The member result-page CTA now says the result should already save back into Module 3, with reload/screenshot fallback, instead of asking the member to manually record report fields. The top-product/page step now points to a same-90-day Sales by product/product performance report sorted by gross or net sales, with Products/Analytics screenshot fallback. The measurement-confidence step now gives concrete usable/questionable/not-enough-yet guidance, including the rough 500+ sessions and 10+ orders directional threshold or a normal trading period for that store.
- Browser validation: In-app browser verified missing-admin recovery, in-module admin save using the development member, direct store-specific Shopify analytics/report links after save, sequential task locking and disabled locked note controls, member diagnostic prefill of known name/email, public lead-magnet entry remaining empty/public, removal of old campaign-audit language, and no browser console errors. A full real Golden Ratio result submission was not executed because that flow can create lead records and send transactional/operator emails; protected write-back was verified by code path review plus route/type/build checks and should be exercised in QA with a controlled test report.
- Browser validation: QA fix pass checked the rendered Module 3 page at `http://localhost:3000/members/modules/measurement-signal-health` and confirmed the page includes the concrete Sales by product/product performance guidance, includes 500+ sessions and 10+ orders confidence guidance, no longer includes the old "order/session count feels large enough" or "Capture any caveats" wording, still defers campaign work to Module 5, and reports no browser console errors.
- Automated validation: `npm run lint` passed. `git diff --check` passed. `npm run validate:important-event-notifications` passed. `npm run build` passed.

## Task List

| ID | Title | Description | Acceptance Criteria | User Verification | Status |
| --: | ----- | ----------- | ------------------- | ----------------- | ------ |
| 1 | Confirm data integration points | Inspect member progress/setup storage, saved admin fields, member profile fields, and bottleneck analysis result payloads to choose the smallest safe path for prefill and protected linked-summary result write-back. | AC5, AC6, AC9, AC10, AC15, AC16 | Summarize the existing fields, source-of-truth rule, and proposed mapping before coding; no user-facing change yet. | Complete |
| 2 | Surface store context in Module 3 | Show saved Shopify Admin URL/store context in Module 3, add direct admin/report links, and provide in-module missing-admin save/repair. | AC1, AC2, AC3, AC4, AC8, AC9 | Open Module 3 with saved and missing admin states and confirm the normal and recovery paths are obvious. | Complete |
| 3 | Prefill diagnostic and write back result | Extend member-context diagnostic entry so known details are reused or confirmable, and persist the generated Golden Ratio result reference/key fields back into Module 3 only for authenticated member-context usage. | AC2, AC5, AC6, AC7, AC9, AC10, AC15, AC16 | Open the diagnostic from Module 3, confirm known details are not avoidable empty work, complete or simulate the result, confirm Module 3 shows the result summary/link, and confirm public usage does not write member progress. | Complete |
| 4 | Refine diagnostic review and top-page focus | Replace duplicate recording language with result review, and keep a clear top-product/top-page step that identifies the first commercially meaningful Module 4 inspection target using Shopify product/page evidence. | AC4, AC7, AC12, AC17 | Read Module 3 and confirm the member reviews the generated result and can identify the first Module 4 product/page focus without being told the diagnostic automated product-level ranking. | Complete |
| 5 | Add measurement confidence and light traffic context | Add a plain-language measurement-confidence step, convert paid-social work into a lightweight traffic-context snapshot, and defer campaign-level ad audit work to Module 5. | AC8, AC13, AC18 | Read Module 3 and confirm it classifies data confidence in plain language, captures only traffic caveats, and no longer asks for campaign objective/spend/CPA/ROAS/CTR audit work. | Complete |
| 6 | Final coaching brief and validation handoff | Update the final brief to summarize result, confidence, Module 4 focus, traffic caveats, what not to change, and coaching questions; run browser verification, source-of-truth checks, lint, and build if route/API/shared state changed. | AC9, AC10, AC11, AC14, AC15, AC16, AC17, AC18 | Validation output and observations are recorded in this task before moving to Testing. | Complete |

## QA & Code Review

- Date: 2026-06-18
- Status: Reviewed in formal QA/code-review gate.
- Verdict: Pass with follow-up. No release-blocking findings for handing Module 3 to a controlled member such as Alex. The only deferred evidence is a real browser final-submit/write-back using the live configured Firebase/SES/Sendy environment; that should be done deliberately with an approved test/member account because it can create live records and dispatch emails.
- Reviewed areas: Module 3 checklist pathway, member store-context recovery, member diagnostic entry prefill, public diagnostic isolation, report setup/results member-context routing, protected result write-back, member progress persistence, measurement-confidence copy, top-product/page focus, traffic-context deferral, final coaching brief, desktop/mobile rendering, and notification/email validation scripts.
- Browser evidence: Rendered Module 3 at `http://localhost:3000/members/modules/measurement-signal-health` shows the seven-step pathway: confirm saved store details, run Golden Ratio diagnostic, review saved Golden Ratio result, choose first product/page, classify usable/questionable/not enough yet, capture light traffic context, and prepare coaching brief. Saved admin context and direct Shopify links render for the development member, including store-specific analytics/report links. The member diagnostic entry at `/shopify-bottleneck-analysis?context=member-module-3` prefilled first name, email, and store URL and showed member-specific confirmation copy. The public `/shopify-bottleneck-analysis` entry remained empty/public with no member copy. A 390px mobile viewport showed all seven steps with no horizontal overflow and no browser console errors.
- Acceptance-criteria evidence: AC1-AC4 are covered by the saved admin context, in-module admin repair, direct admin/report links, and plain Golden Ratio steps. AC5 is covered by member diagnostic prefill for known name/email/store. AC6-AC7 and AC15-AC16 are covered by code review of member-context result routing and protected write-back, plus source-of-truth storage as a linked summary only. AC8 and AC18 are covered by the usable/questionable/not-enough-yet confidence UI and rough directional thresholds. AC9 is covered by browser-observed sequential locking and disabled note controls for locked steps. AC10 is covered by public-flow browser isolation and build/type validation. AC11 is covered by saved-context browser evidence, public/member path evidence, mobile rendering, and code review for deferred final-submit. AC12 and AC17 are covered by the top-product/page step using Shopify product/page evidence for the same 90-day range without claiming product-level diagnostic automation. AC13 is covered by Module 5 deferral of campaign objective, spend, CPA, ROAS, CTR, creative, audience, and budget work. AC14 is covered by the final brief field and prompt requiring result, confidence, Module 4 focus, traffic caveat, what not to change, and coaching questions.
- Automated validation: `npm run lint` passed. `git diff --check` passed. `npm run validate:important-event-notifications` passed. `npm run validate:shopify-bottleneck-customer-emails` passed. `npm run build` passed.
- Product/UX assessment: Module 3 is achievable for a non-technical member if completed at her own pace. It is not a quick checklist, but the workload is coherent: roughly two hours to collect the numbers and produce one coaching brief. It should give Alex useful next-step clarity: likely funnel bottleneck, data confidence, first product/page focus for Module 4, and traffic caveat for Module 5.
- Findings: No blocking findings. Follow-up: run one approved controlled final diagnostic submission in the configured environment before broad rollout if John wants production-grade evidence that live write-back and email dispatch behave exactly as expected.

## Retro

- Reusable lessons: Member modules should reuse saved setup data by default; repeated entry is a UX failure unless there is a clear reason. A module should have one coherent job; campaign-level advertising diagnosis belongs in the advertising module, not the first measurement module.
- Conventions or agent assets updated: Owner-gate rule already recorded in `.project-workflow/guidance.md`.
- Follow-up tasks: Pending after owner review.

## Notes

- Task: TASK-018
- Title: Improve Module 3 Diagnostic Ease For Non Technical Members
- Created: 2026-06-18
- Gate: Owner approved execution on 2026-06-18. Implementation complete; QA review is the next lifecycle gate.
