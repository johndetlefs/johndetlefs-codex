# Requirements

## Summary

- Task: TASK-018
- Title: Improve Module 3 Diagnostic Ease For Non Technical Members
- Last updated: 2026-06-18

## Overview

TASK-017 built the first working version of Module 3, but the current checklist still asks too much of a non-technical member. In particular, Step 1 asks the member to paste the Shopify Admin URL even though Module 1 already asks them to save it, and the checklist copy references saving an admin link without making the saved link easy to find or recover. The current "Record what the diagnostic says" step also risks duplicating work the Golden Ratio diagnostic should already do when the member uploads the report and receives the result.

This task is a requirements-gated correction pass. The goal is to make Module 3 feel like a guided member workflow, not a public lead magnet dropped into a module with extra instructions around it. The member should be able to rely on details they already saved, follow direct links where possible, recover gracefully when something is missing, and bring a useful diagnostic outcome to coaching with as little manual interpretation as practical.

The broader Module 3 shape also needs tightening. Module 3 should not become a full advertising audit. Its job is to help the member understand where the store is leaking, whether the numbers are trustworthy enough to act on, and which product or page should be inspected first in Module 4. Meta, Instagram, TikTok, and campaign-level work belong primarily in Module 5. Module 3 should keep only a light traffic-context snapshot so John can tell whether traffic quality might affect the diagnosis.

## User Story

As a non-technical Shopify Growth Coaching member who has already completed setup modules, I want Module 3 to reuse my saved store/admin details, guide me through the Golden Ratio diagnostic, check whether the numbers are trustworthy, and identify the first product or page to inspect, so that I can arrive at coaching with a clear diagnosis before changing my site or ads.

## Goal

Make Module 3 as easy as possible for a non-technical member while keeping it commercially useful for coaching. The member should understand exactly where to click, what the app already knows, what they still need to provide, whether the numbers are good enough to act on, what not to change, and what outcome to bring to coaching.

The preferred Module 3 outcome is one concise coaching brief:

- where the store appears to be leaking;
- how confident the member should be in the numbers;
- which product/page should be inspected first in Module 4;
- what traffic or ad caveats may affect the diagnosis;
- what questions need coaching support before Module 4 and Module 5.

## Non-Goals

- Do not remove or replace the existing Golden Ratio / Shopify Bottleneck Analysis calculation.
- Do not create a second diagnostic or a parallel report persistence system.
- Do not backtrack TASK-017's member-context diagnostic work unless the approved requirements explicitly say to change part of it.
- Do not add Shopify Admin API, Meta API, TikTok API, or automated report pulling in this pass unless the owner explicitly expands scope.
- Do not ask members to change Shopify settings, theme code, products, analytics, pixels, campaigns, audiences, or budgets in Module 3.
- Do not turn Module 3 into a full ad-platform audit.
- Do not ask members in Module 3 to collect or interpret campaign objective, spend, purchases, cost per purchase, ROAS, CTR, creative performance, audience breakdowns, or campaign-level recommendations except as a clearly optional/lightweight traffic caveat.
- Do not implement Module 4 product-page/site changes or Module 5 ad-platform changes.
- Do not proceed to code changes until the owner has reviewed and approved both the requirements and implementation plan.

## Users & Context

- Primary user: a non-technical Shopify Growth Coaching member who has completed Modules 1 and 2 and expects the member area to remember setup details already captured.
- Member state: Module 1 includes a `save-shopify-admin-url` task that asks the member to save their Shopify Admin URL; Module 2 handles local workflow readiness. Module 3 should assume those steps may be complete, but must still handle the case where the admin link is missing.
- Operator context: John wants the member to arrive at coaching with a trustworthy Golden Ratio diagnosis, a clear likely bottleneck, a confidence read on the data, a first product/page candidate for Module 4, and only enough traffic context to know whether ad quality may be distorting the diagnosis.
- Product context: Shopify Growth Coaching should reduce cognitive load for merchants. A member should not feel like they are being asked to solve technical plumbing or repeat data entry the system already asked for.
- Technical context: The existing diagnostic captures/store details, creates signed report links, accepts Shopify funnel CSV/AOV inputs, calculates the result, and renders a result page. Member Module 3 can link into that flow, but the member journey needs to be clearer and less repetitive.

## Requirements (Outcome-Focused)

- Module 3 must visibly reuse or surface the saved Shopify Admin URL/store context from earlier setup wherever possible.
- If a saved Shopify Admin URL exists, Module 3 must provide direct, plain-language links/actions into the relevant Shopify admin areas rather than asking the member to paste the admin URL again.
- If the saved Shopify Admin URL is missing, Module 3 must let the member save or repair it directly inside Module 3, using the same underlying saved setup field as Module 1 where practical. The member must not be sent away as the primary path or left wondering where the "admin link" is.
- The Golden Ratio diagnostic entry from Module 3 must minimize repeated information entry. Where the system already has member/store details, the member flow should prefill, reuse, or show them as confirmable values rather than presenting empty fields by default.
- The report setup instructions must be written for a non-technical user: clear date period, clear export/upload steps, clear AOV step, clear "do not change anything" guardrails, and clear screenshots/link-to-coaching fallback when they are stuck.
- Module 3 must not require the member to manually transcribe result details that the Golden Ratio diagnostic already calculates and persists. The desired member action should be to review, save/link/screenshot, and optionally summarize the result for coaching, not duplicate the calculator's work.
- The member-context Golden Ratio diagnostic should write the generated result back into the Module 3/member progress experience automatically, with a result link or screenshot instruction as a fallback rather than the main path.
- The Golden Ratio diagnostic report must remain the source of truth for calculation details. Module 3 should store and display a linked result summary, not duplicate the whole report or create a second calculation record.
- Member result write-back must only happen for an authenticated member-context diagnostic tied to the current member/workspace. Public or anonymous lead-magnet usage must not mutate member progress.
- Module 3 must make the diagnostic result practically useful: the member and John should be able to identify the result link, overall status, bottleneck, likely page/product area, and what this implies for Module 4 and Module 5.
- Module 3 must include a clear top-product/top-page focus step that helps the member choose the first commercially meaningful product or page area for Module 4.
- The top-product/top-page focus step must not imply that the current Golden Ratio diagnostic automatically identifies top-selling products. If product-level automation is not present, the module should honestly guide the member to the relevant Shopify report or screenshot for the same date range.
- Module 3 must include a measurement-confidence step that asks whether the numbers are good enough to act on: same date range, enough orders/traffic to be useful, AOV confidence, report/upload confidence, and any obvious missing tracking or data caveats.
- Measurement confidence should use plain categories such as usable, questionable, and not enough yet rather than technical statistical language.
- Module 3 must replace the current paid-social signal-health task with a lightweight traffic-context snapshot. The member should identify whether paid traffic is meaningful, which channel/platform is driving traffic, and whether traffic quality may distort the Golden Ratio result, without doing a campaign audit.
- Module 3 must clearly defer campaign-level Meta, Instagram, TikTok, creative, audience, ROAS, CPA, CTR, and budget decisions to Module 5.
- The checklist should distinguish between facts the app/report has captured and interpretation the member may need to discuss in coaching.
- Module 3 must keep the experience read-only and confidence-building for non-technical users. It should say what to click, what not to touch, and what to bring to coaching if something looks different.
- Existing member progress persistence and sequential task locking must remain intact.
- Public lead magnet behaviour must remain intact unless a change is explicitly approved as part of these requirements.
- Owner approval is required before this task proceeds to implementation planning or code changes.

## Acceptance Criteria (Verifiable)

- AC1: Module 3 shows the member's saved Shopify Admin URL or store context near the top of the module or inside the relevant diagnostic task, with a direct way to open Shopify admin.
- AC2: If the saved Shopify Admin URL is available, the Golden Ratio task does not ask the member to paste it again as a normal path; it uses saved context and direct links wherever possible.
- AC3: If the saved Shopify Admin URL is missing, Module 3 gives a visible recovery path with plain-language steps and an in-module way to save or re-save it before continuing.
- AC4: The Golden Ratio task copy explains the diagnostic flow in simple member language: open diagnostic, confirm known details, open/export the correct Shopify report, upload the CSV, enter AOV for the same period, calculate result, and change nothing in the store.
- AC5: The diagnostic/member flow avoids duplicating information already captured by the member profile, setup tasks, or report. Known name, email, store, and admin details are prefilled, reused, or shown for confirmation where practical.
- AC6: Module 3 shows the generated Golden Ratio result back inside the member experience after completion, including a result link and the key report fields needed for coaching where available.
- AC7: The post-diagnostic task focuses on reviewing and interpreting the already-generated result for Module 4 and Module 5, not re-recording the calculator output as busywork.
- AC8: Module 3 includes a measurement-confidence step that helps the member classify the numbers as usable, questionable, or not enough yet, with non-technical recovery guidance for missing admin link, unable to find report, upload failure, unknown AOV, confusing result, weak sample size, or missing tracking.
- AC9: Existing member checklist progress behaviour remains intact: sequential tasks still lock/unlock correctly and mark-complete behaviour still works.
- AC10: Existing Golden Ratio diagnostic calculation, signed report links, persistence, and public lead-magnet behaviour are preserved unless an approved requirement says otherwise.
- AC11: Validation includes browser review of Module 3 with saved admin context, missing admin context, known member details, completed diagnostic/result context, measurement-confidence context, and lightweight traffic context, plus confirmation that the member diagnostic path no longer asks for unnecessary repeated entry.
- AC12: Module 3 includes a top-product/top-page focus step that helps the member identify the first commercially meaningful product or page area for Module 4.
- AC13: Module 3 includes only a lightweight traffic-context snapshot and removes or defers campaign-level paid-social audit work to Module 5.
- AC14: The final Module 3 coaching brief summarizes the Golden Ratio result, measurement confidence, first Module 4 product/page focus, traffic caveats, what not to change yet, and coaching questions.
- AC15: Module 3 result write-back stores and displays a linked summary of the existing Golden Ratio analysis rather than duplicating the full report or recalculating results in member progress.
- AC16: Result write-back only occurs for an authenticated member-context diagnostic associated with the current member/workspace; anonymous or public lead-magnet usage cannot update member progress.
- AC17: The top-product/top-page focus step is honest about data source: it guides the member to Shopify product/page evidence for the same date range and does not imply product-level data is automatically produced by the Golden Ratio diagnostic.
- AC18: The measurement-confidence step uses plain member-friendly categories such as usable, questionable, and not enough yet, with clear next action for each state.

## Open Questions (Answer Needed)

- None. Owner accepted the pragmatic UX decisions below on 2026-06-18.

## Decisions (Resolved)

- The current Step 1 is not acceptable as-is because it asks for information the member should already have saved and does not make the saved admin link obvious.
- The current "Record what the diagnostic says" concept needs refinement because the diagnostic already calculates and persists the report result.
- The member-context Golden Ratio diagnostic should write its generated result back into the member module/progress view automatically. A result link or screenshot is a fallback, not the main path.
- If the Shopify Admin URL is missing in Module 3, the member should be able to save or repair it directly in Module 3 rather than being sent back to Module 1 as the primary path.
- The member diagnostic should prefill or reuse known member details wherever practical, including name, email, store, and admin context. The goal is to remove all avoidable repeated entry, not only the admin URL.
- Module 3 should be tightened around store diagnosis, measurement confidence, and first product/page focus. Its primary outcome is not an ad plan.
- Most advertising and paid-social work belongs in Module 5. Module 3 should keep only a lightweight traffic-context snapshot so John can see whether traffic quality might affect the Golden Ratio diagnosis.
- Module 3 should produce one concise coaching brief covering result, confidence, first Module 4 focus, traffic caveats, what not to change, and coaching questions.
- Clarification confirmed that the existing member progress model already stores `shopifyAdminUrl` and `storeHandle` at workspace/progress level, so Module 3 should reuse that state instead of inventing a new admin-link source.
- Clarification confirmed that the Golden Ratio report currently provides funnel and landing-page-type data, not top-selling product automation. Product/page focus remains a guided Shopify report/screenshot step in this task.
- Clarification confirmed that result write-back should be a protected member summary linked to the existing analysis record, not a second report system.
- Clarification confirmed that public lead-magnet behaviour must remain isolated from member progress unless the user is authenticated and using the member-context path.
- This task remains owner-gated: the implementation plan must be approved by John before code changes.
- The target user is non-technical, so reducing cognitive load is a core requirement, not polish.

## Validation Plan

- Review approved requirements and the draft implementation plan against Module 3 source and current browser behaviour before implementation.
- After implementation approval and coding in a later phase, verify Module 3 in the browser with saved admin context, missing admin context, known member details, and completed diagnostic/result context.
- Verify the Golden Ratio task copy no longer asks for unnecessary repeated admin URL entry in the normal saved-context path.
- Verify the post-diagnostic task asks the member to review/use the generated result rather than duplicate calculator output, and that the generated result appears back in the member experience where practical.
- Verify the revised module path includes diagnosis, top product/page focus, measurement confidence, lightweight traffic context, and coaching brief.
- Verify campaign-level paid-social audit work has been removed from Module 3 or clearly deferred to Module 5.
- Verify result write-back stores a linked member summary while the Golden Ratio analysis remains the calculation source of truth.
- Verify anonymous/public diagnostic usage does not update member progress.
- Verify the top-product/page step clearly uses Shopify product/page evidence rather than implying automatic product-level Golden Ratio output.
- Verify measurement-confidence categories and recovery actions are understandable without ecommerce analytics expertise.
- Run `npm run lint` after code changes in the later implementation phase.
- Run `npm run build` if approved implementation touches route boundaries, API propagation, or shared member-progress behaviour.
