## User Story

As a Shopify Growth Coaching member who has completed setup, I want Module 3 to guide me through the Golden Ratio diagnostic plus the key Shopify, product, and audience numbers, so that I understand where my business is leaking value before changing my product pages or advertising.

## Goal

Build out Module 3 as a measurement and signal-health checklist that reuses the existing Golden Ratio / Shopify Bottleneck Analysis diagnostic, suppresses videos for the member-context flow for now, and gives members a concrete measurement brief to bring into coaching.

## Approach

- Extend the existing Shopify Bottleneck Analysis flow with a small member-context query parameter that carries through report and results links.
- Use that context to hide setup/result video sections only for member diagnostic usage.
- Expand `moduleThreeChecklist` in `app/members/_lib/shopify-growth-coaching.ts` with sequential, plain-language tasks covering Golden Ratio, top products, demographics, paid-social signals, and coaching handoff.
- Avoid adding new persistence models or duplicate diagnostic math.

## Phases

1. Document the tracked scope in `TASK-017` and pass workflow readiness.
2. Add member-context support to the existing Bottleneck Analysis pages and API result paths.
3. Expand the Module 3 checklist content.
4. Run lint, workflow doctor, and browser verification against the local member route.

## Acceptance Criteria

- [x] AC1: Module 3 contains multiple sequential checklist tasks that cover Golden Ratio diagnostic setup, report completion, result recording, top-product selection, audience/demographic context, paid-social signal health, and a final coaching brief.
- [x] AC2: The Module 3 Golden Ratio task links to `/shopify-bottleneck-analysis` with member-context query parameters so the existing diagnostic is reused.
- [x] AC3: When the diagnostic is opened in member context, the report setup page and results page do not render `BottleneckVideoSection`, while the default public diagnostic still renders videos.
- [x] AC4: The member-context lead capture persists and navigates through report and results URLs while retaining the member context needed to keep videos hidden.
- [x] AC5: Module 3 checklist copy tells the member what Golden Ratio result details to bring to coaching and how the result informs Module 4 and Module 5.
- [x] AC6: Module 3 provides plain-language steps for top products, landing/product-page focus, customer demographics, and Meta/TikTok signal capture without asking the member to change settings or campaigns.
- [x] AC7: Existing member checklist progress behaviour remains intact: tasks are still sequential, mark-complete buttons still work, and no new required-response gate blocks unrelated modules.
- [x] AC8: Validation confirms lint passes and the local member Module 3 route renders with the updated checklist and member-context diagnostic links.

## Validation

- AC1: Inspect Module 3 rendered checklist and source checklist data.
- AC2: Inspect the Golden Ratio task resource/link URL in Module 3.
- AC3: Verify member-context report/results pages omit `BottleneckVideoSection`; verify default public route still includes it.
- AC4: Verify lead capture URL propagation through source search, API result path, and redirect URLs.
- AC5: Inspect Module 3 copy for result details and Module 4/5 handoff language.
- AC6: Inspect Module 3 tasks for Shopify, product, audience, Meta, Instagram, and TikTok signal capture.
- AC7: Browser-test mark-complete behaviour on Module 3 or inspect unchanged checklist persistence flow.
- AC8: Run `npm run lint`, browser verification, and workflow doctor.

## Task List

| ID | Title | Description | Acceptance Criteria | User Verification | Status |
| --: | ----- | ----------- | ------------------- | ----------------- | ------ |
| 1 | Member diagnostic context | Add member-context propagation to the existing Shopify Bottleneck Analysis lead/report/results flow and hide videos only when that context is present. | AC2, AC3, AC4 | Open member-context diagnostic links and confirm report/results pages render without video sections while public routes still show them. | Complete |
| 2 | Module 3 checklist build-out | Replace the one-step Module 3 placeholder with a sequenced measurement checklist covering Golden Ratio, report result capture, top products, demographics, paid-social signals, and final coaching brief. | AC1, AC5, AC6, AC7 | Open `/members/modules/measurement-signal-health` and inspect the task sequence, resources, and coaching prompts. | Complete |
| 3 | Validation and workflow handoff | Run lint, browser checks, workflow readiness/doctor, and record evidence. | AC8 | `npm run lint`, local browser verification, and workflow doctor output. | Complete |

## QA & Code Review

- Verdict: Implementation validation passed; awaiting `project-qa-review` lifecycle gate.
- Evidence:
  - `npm run lint` passed on 2026-06-18.
  - `npm run build` passed on 2026-06-18.
  - Browser verification opened `/members/modules/measurement-signal-health` and confirmed the Module 3 heading, six updated checklist tasks, and `/shopify-bottleneck-analysis?context=member-module-3` diagnostic links.
  - Browser verification opened `/shopify-bottleneck-analysis/report?context=member-module-3` and confirmed no iframe/video walkthrough copy renders in member context.
  - Browser verification opened `/shopify-bottleneck-analysis/report` and confirmed the public report setup still renders the video walkthrough section.
  - Code inspection confirmed member-context propagation through landing, report, results, and API result paths.
- Findings: None from implementation validation.

## Retro

- Reusable lessons: Pending.
- Conventions or agent assets updated: None planned.
- Follow-up tasks: Add member-specific diagnostic videos later.

## Notes

- Task: TASK-017
- Title: Build Module 3 Measurement Signal Health Diagnostic
- Created: 2026-06-18
