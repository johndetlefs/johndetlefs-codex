# Requirements

## Summary

- Task: COACH-003
- Title: Create Module 5 Traffic Quality And Meta Ads Diagnosis
- Last updated: 2026-06-26
- Primary repo: `next`
- Repos touched: `next`, parent workspace workflow docs
- Workflow owner: parent workspace tracker
- Branch/PR: parent workspace branch `codex/COACH-003-create-module-5-traffic-quality-and-meta-ads-diagnosis`; `next` branch `codex/COACH-003-create-module-5-traffic-quality-and-meta-ads-diagnosis`; PR not started
- Archived context: continues the Shopify Growth Coaching member-area work migrated from the former `next` workflow state, especially Module 3 traffic caveat handoff and Module 4 product-page experiment work.

## Goal

Create Module 5 in the Shopify Growth Coaching member area so members can diagnose traffic quality and Meta advertising performance without treating advertising as a blocker for product-page optimisation. The module should help a non-technical Shopify merchant collect a read-only Meta/Instagram/Facebook advertising snapshot, compare it with Shopify and the earlier module evidence, classify what the current traffic is teaching them, and produce one coaching-ready advertising hypothesis before any campaign or budget change.

## Non-Goals

- Do not gate Module 4 product-page and offer improvements behind advertising diagnosis.
- Do not create new image ads, ad templates, creative exports, or `product-ads` workflows in Module 5; image-ad theme discovery belongs in Module 6.
- Do not create video ads or video scripts; videos can come later after image themes prove useful.
- Do not connect to the Meta API, request Meta OAuth permissions, or automate campaign edits in this first version.
- Do not ask members to restructure campaigns, change budgets, change campaign objectives, edit audiences, edit pixels, change attribution settings, or publish new ads from Module 5.
- Do not promise clean statistical certainty from Meta or Shopify attribution.
- Do not teach a generic paid-media course disconnected from Shopify, Module 3, Module 4, and weekly coaching.
- Do not use fear-based copy or make members feel that imperfect traffic invalidates useful product-page work.

## Users & Context

- Coaching members arrive after Module 3 with a Golden Ratio result, measurement-confidence state, first product/page focus, traffic caveat, and coaching brief.
- Members may also have Module 4 product-page work in progress, completed, or deferred, but Module 5 should not require a successful Module 4 experiment before traffic diagnosis.
- Most expected member ad work is in Meta: Facebook, Instagram, and Meta Ads Manager.
- Members are likely non-technical and may not know whether Meta numbers, Shopify numbers, landing page behaviour, and ad creative are telling the same story.
- John/operator users need a read-only summary before coaching: the current ad snapshot, key caveats, likely traffic-quality issue, and next advertising hypothesis.
- Module 6 is expected to use the local `product-ads` image ad engine to generate structured static ad theme variation. Module 5 should prepare the diagnosis and themes to test, not produce creative assets.

## Requirements (Outcome-Focused)

- Module 5 must appear after Module 4 as `Traffic Quality And Meta Ads Diagnosis`, locked for non-admin students until Module 4 is complete under the existing sequential module model and available to admin/operator users.
- Module 5 must make clear that advertising diagnosis does not block product-page improvement. Module 4 remains an always-useful optimisation workflow; Module 5 helps interpret and improve traffic quality.
- Module 5 must reuse saved Module 3 context: Golden Ratio result, measurement confidence, first product/page focus, traffic caveat, and Module 3 coaching brief.
- Module 5 must reuse relevant Module 4 context where available: readiness decision, selected product/page URL, selected hypothesis, Rollouts setup notes, and result notes.
- Module 5 must guide the member to collect a read-only Meta advertising snapshot for a clear recent date range, ideally matching or deliberately contrasting the Module 3 reporting period.
- The ad snapshot must capture enough to diagnose traffic quality: platform/account context, campaign objective, spend, purchases, purchase value, CPA, ROAS, CTR, CPC, CPM, landing page views, add-to-cart, top campaigns/ad sets/ads, promoted product, landing page, cold/warm audience context where known, and notes/screenshots.
- Module 5 must ask the member to compare Meta and Shopify without expecting perfect attribution agreement. It should look for mismatched dates, missing UTMs, Meta-reported sales that are not visible in Shopify, Shopify sales Meta cannot see, missing purchase/add-to-cart signals, and traffic that does not match the landing page promise.
- Module 5 must classify the traffic diagnosis in plain language: traffic likely good enough for current product-page learning, traffic quality looks weak, tracking/attribution is too unreliable, creative and landing page promise do not match, campaign economics do not work yet, or not enough data.
- Module 5 must produce one saved advertising hypothesis for coaching, such as a creative-message mismatch, wrong promoted product, weak landing-page match, weak intent, objective mismatch, budget/sample-size caveat, or economics problem.
- Module 5 must include inspection-only Codex prompts that ask Codex to review screenshots/exports/notes and separate observations, evidence, assumptions, risks, and recommendations.
- Module 5 must tell Codex and the member not to change campaigns, budgets, audiences, ads, pixels, attribution settings, Shopify settings, products, discounts, or theme files during the diagnosis.
- Module 5 must prepare Module 6 inputs: product/offer to advertise, landing page, ad themes worth testing, claims/proof allowed, claims/proof not allowed, and what the image-ad engine should avoid.
- Module 5 must persist member notes for Meta snapshot, Shopify comparison, traffic diagnosis, advertising hypothesis, and Module 6 image-theme brief.
- Admin member detail must expose saved Module 5 notes in a read-only, scannable way.
- Module 5 should update `next/docs/shopify-growth-coaching-checklists.md` so the checklist design remains documented outside the code.

## Acceptance Criteria (Verifiable)

- AC1: `/members` lists Module 5 after Module 4 with the approved title, description, outcome, and progress count.
- AC2: Non-admin students cannot open Module 5 until Module 4 is complete under the current sequential module model; admin/operator users can open it for review without mutating progress.
- AC3: `/members/modules/traffic-quality-and-meta-ads-diagnosis` renders a complete checklist with saved Module 3 context and relevant Module 4 context available where useful.
- AC4: The checklist states that Module 5 does not gate Module 4 and that product-page/offer improvements remain useful even when traffic quality is imperfect.
- AC5: The checklist guides the member through a read-only Meta advertising snapshot, Shopify/Meta comparison, traffic-quality classification, one advertising hypothesis, and a Module 6 image-theme brief.
- AC6: Copyable Codex prompts instruct Codex to inspect and recommend first without changing campaigns, budgets, audiences, ads, pixels, attribution settings, Shopify settings, products, discounts, or theme files.
- AC7: The diagnosis categories use plain merchant language and cover traffic good enough, weak traffic quality, unreliable tracking/attribution, creative/landing-page mismatch, poor campaign economics, and not enough data.
- AC8: Module 5 explicitly routes new static image ad production to Module 6 and notes that video can come later.
- AC9: Member progress persistence stores Module 5 response fields for the Meta snapshot, Shopify comparison, traffic diagnosis, advertising hypothesis, and Module 6 image-theme brief.
- AC10: Admin member detail shows saved Module 5 response fields read-only and handles missing Module 5 data gracefully.
- AC11: The checklist documentation clearly states the Module 5 purpose, task order, no-change diagnosis guardrails, and handoff into Module 6 image-ad theme discovery using `product-ads`.
- AC12: Validation covers member dashboard/module rendering, locking, response persistence, admin read-only review, lint/build, member QA suite, and workflow doctor.

## Open Questions (Answer Needed)

- None blocking. Owner clarified on 2026-06-26 that Module 5 should not gate Module 4, and Module 6 should use the project-built image advertising engine to discover working static ad themes before videos.

## Decisions (Resolved)

- Module 5 focuses on traffic quality and Meta ads diagnosis, not creative production.
- Product-page and offer improvements remain worth doing regardless of imperfect traffic; Module 5 adds interpretation and next advertising judgement rather than permission.
- Module 5 should be read-only and coaching-oriented. It should not make live campaign, budget, pixel, audience, product, discount, or theme changes.
- Module 6 will own image-based ad theme discovery using the local `product-ads` engine. Videos come later.
- Meta/Facebook/Instagram is the first supported advertising platform for Module 5, while notes may acknowledge other channels only as traffic context.
- The first implementation should use member-entered notes/screenshots/exports, not Meta API integration.

## Validation Plan

- Run `npm run lint` from `next`.
- Run `npm run build` from `next` because adding a module changes static params, route metadata, persisted response types, and admin rendering.
- Update and run `npm run qa:members` from `next` so the seeded member covers Module 5 dashboard/module rendering, saved response persistence, API snapshot, and admin detail.
- Browser-test `/members` and `/members/modules/traffic-quality-and-meta-ads-diagnosis` as admin/operator and as a normal student with and without Module 4 complete where practical.
- Browser-test Module 5 response saves and reloads for a member workspace.
- Browser-test `/admin/members/[customerKey]` to verify Module 5 saved work is read-only and missing data renders cleanly.
- Run `./.project-workflow/cli/workflow doctor` from the workspace root after workflow doc changes.
