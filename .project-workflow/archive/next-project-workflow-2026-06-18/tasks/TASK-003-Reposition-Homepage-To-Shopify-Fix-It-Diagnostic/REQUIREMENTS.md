# Requirements

## Summary

- Task: TASK-003
- Title: Reposition Homepage To Shopify Fix-It Diagnostic
- Last updated: 2026-05-21

## Goal

Reposition the main public offer from a `$249 AUD` Shopify Fix-It Call to a `$295 Shopify Fix-It Diagnostic`, so qualified Shopify merchants understand the paid entry point as a site/funnel review that produces a prioritized action plan, with a clear bridge into the `$695/month` mentoring/coaching program where relevant.

## Non-Goals

- Do not build the full mentoring/coaching program delivery system in this task.
- Do not create broad agency or custom project positioning.
- Do not promise that the diagnostic will implement fixes live.
- Do not change unrelated lead magnet mechanics unless needed for offer/CTA consistency.

## Users & Context

- Shopify merchants and ecommerce operators evaluating JohnDetlefs.com from the homepage, booking flow, or report-style lead magnet results.
- Users should understand that the first paid step is a diagnostic review and action plan, not an open-ended live fix session.
- Qualified users should see the monthly mentoring/coaching program as the natural next step after the diagnostic, not as the primary homepage CTA.

## Requirements (Outcome-Focused)

- Homepage messaging presents the `$295 Shopify Fix-It Diagnostic` as the primary offer.
- Pricing references update from `$249 AUD` to `$295` wherever they describe the primary public paid entry point.
- The diagnostic promise is clear: review the store/site/funnel, identify the real bottleneck, and leave the customer with a prioritized action plan.
- Copy no longer over-emphasizes "get in there and fix something live" as the main promise.
- The booking path CTA language aligns with the new diagnostic offer.
- The `$695/month` mentoring/coaching program has an offer page or planned route that can be linked from appropriate post-diagnostic or secondary contexts.
- Lead magnet result-page CTA language can align to the diagnostic offer without creating a separate conflicting offer.

## Acceptance Criteria (Verifiable)

- Homepage hero and primary CTA use the new diagnostic positioning.
- Public pricing labels for the primary offer show `$295`.
- Booking/payment amount defaults are updated to match the displayed `$295` price.
- Existing references to the `$249` Fix-It Call are either removed, updated, or intentionally retained only where historically/contextually correct.
- The site includes a clear path or placeholder plan for the `$695/month` mentoring/coaching offer page.
- Lead magnet video/conversion planning no longer conflicts with live homepage/booking copy.
- Relevant focused validation, linting, and build checks pass or any unrelated pre-existing failures are documented.

## Open Questions (Answer Needed)

- Should the diagnostic duration be 45 minutes, 60 minutes, or another length?
- Should the mentoring/coaching offer page be public navigation, linked only after diagnostics, or both?
- What should the exact public name be: "Shopify Fix-It Diagnostic" or another variant?
- Should the satisfaction guarantee remain unchanged for the diagnostic?

## Decisions (Resolved)

- Move away from the `$249 AUD` Fix-It Call as the primary public offer.
- New intended primary offer: `$295 Shopify Fix-It Diagnostic`.
- The diagnostic is a review and action-plan session, not primarily a live implementation/fix session.
- Follow-on offer: `$695/month` mentoring/coaching program.
- The monthly program should be seeded after the diagnostic rather than replacing the diagnostic as the result-page CTA.

## Validation Plan

- Inspect `next/app/page.tsx`, booking pages, pricing helpers, payment lifecycle defaults, and lead magnet CTA copy for old offer references.
- Run targeted validation for pricing/helper changes if available.
- Run `npm run lint`.
- Run `npm run build` if implementation touches shared booking/payment or broad app copy.
