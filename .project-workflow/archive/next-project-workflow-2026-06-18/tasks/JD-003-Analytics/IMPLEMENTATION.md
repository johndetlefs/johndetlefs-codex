## User Story

As a prospective coaching client visiting the site, I want privacy-compliant analytics and marketing tracking to run consistently across all pages, so that the business can measure funnel performance and improve conversion decisions with reliable data.

## Goal

- Deliver a privacy-compliant, GTM-based analytics foundation across the site that captures pageviews and core booking conversions in GA and Meta with verifiable launch evidence.

## Approach

- Ship in two safe increments: first establish site-wide GTM + event contract instrumentation, then enforce consent gating and complete end-to-end verification in vendor debug tools.

## Phases

### Phase 1

- Changes: Add GTM integration at app layout level, environment-backed IDs/config, booking funnel data-layer events (`booking_start`, `booking_slot_selected`, `booking_submit`, `booking_success`), a standard `purchase` event on confirmed booking success, homepage booking CTA click event (`booking_cta_click`), plus route pageview hooks.
- Validation: Confirm GTM loads once per page and booking events emit consistently in browser/network debug.
- Tracker updates: Keep story status as `Analysing` while this plan is under review.

### Phase 2

- Changes: Build and integrate a minimal in-app consent mechanism for region-aware strict non-essential tag gating, then complete GTM tag wiring for GA + Meta with a lightweight pass/fail verification note in `IMPLEMENTATION.md`.
- Validation: Confirm pre-consent blocking and post-consent firing; validate GA/Meta pageviews and booking events end-to-end.
- Tracker updates: Move to `Plan Confirmed` only after explicit user confirmation; then implementation can move to `In Progress`.

## Task List (for IMPLEMENTATION.md)

|  ID | Title                                                       | Description                                                                                                                                                                                | Acceptance Criteria                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | User Verification                                                                                                                                                                                                                                                                                                                                                                                                        | Status   |
| --: | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
|   1 | Site-wide GTM foundation loads once                         | Visitors receive a consistent tracking foundation across all public routes via app-level GTM integration with environment-based configuration.                                             | - GTM snippet/container is included on all intended pages.<br>- GTM initializes once per page load with no duplicate injections.<br>- Missing required GTM config fails in a controlled, visible way.                                                                                                                                                                                                                                                                                                                                                                                             | - Open home, booking, success, privacy, and terms pages; confirm GTM appears once in Tag Assistant preview.<br>- Navigate between routes and confirm no duplicate GTM bootstrap in network/devtools.                                                                                                                                                                                                                     | Complete |
|   2 | Booking funnel event contract is emitted                    | The app emits consistent booking and homepage CTA events so downstream tags can map conversion and intent signals predictably.                                                             | - `booking_start`, `booking_slot_selected`, `booking_submit`, and `booking_success` fire at intended booking milestones.<br>- A standard `purchase` event fires alongside `booking_success` once the booking is confirmed so ad platforms can optimize against a standard conversion.<br>- Homepage booking CTA clicks fire `booking_cta_click` on all instrumented CTA links.<br>- Event naming is consistent and documented for GTM mapping.<br>- Booking events include launch schema: `event_name`, `page_path`, `timestamp`, `booking_step`, `session_id`, `source_medium` (when available). | - Run through the booking journey and use GTM preview/data layer inspector to confirm milestone events appear exactly once at the right step.<br>- Confirm a `purchase` event appears once on confirmed success with value/currency details.<br>- Click homepage booking CTAs and confirm `booking_cta_click` appears for each instrumented CTA location.<br>- Inspect payloads and confirm required fields are present. | Complete |
|   3 | Region-aware consent gating controls non-essential tags     | A new in-app consent mechanism is introduced so non-essential analytics/marketing tags follow the selected legal model: strict consent for GDPR/EEA and lawful relaxed behavior elsewhere. | - Consent UI/state is implemented and available where required for strict regions.<br>- Before consent in strict regions, GA/Meta tags do not fire.<br>- After consent in strict regions, GA/Meta tags fire as configured.<br>- Consent interaction remains keyboard/screen-reader operable where presented.                                                                                                                                                                                                                                                                                      | - Simulate an EEA visitor session; verify consent UI is shown and no GA/Meta events fire pre-consent.<br>- Grant consent and confirm expected events post-consent.<br>- Test consent UI via keyboard-only navigation and screen reader basics.                                                                                                                                                                           | Complete |
|   4 | GA + Meta receive validated pageview and conversion signals | GTM is configured so GA and Meta both receive required pageview, booking, and homepage CTA events, with a lightweight pass/fail verification note for sign-off.                            | - GA receives pageviews across main journey routes (AC2).<br>- Meta receives pageviews across main journey routes (AC3).<br>- GA and Meta receive mapped events for `booking_start`, `booking_slot_selected`, `booking_submit`, `booking_success`, `purchase`, and `booking_cta_click` (AC4).<br>- Pass/fail verification note is recorded in `IMPLEMENTATION.md` covering all AC checks (AC6).                                                                                                                                                                                                   | - In staging, navigate key routes and confirm GA DebugView and Meta Pixel test events for pageviews.<br>- Complete booking flow and click homepage CTAs, then confirm mapped events in both platforms, including standard `purchase` on confirmed success.<br>- Review the pass/fail verification note in `IMPLEMENTATION.md`.                                                                                           | Complete |

## Files / Areas Likely to Change

- `app/layout.tsx` for site-wide script/bootstrap placement.
- `app/booking/page.tsx` and related booking flow client logic where milestone events are emitted.
- Booking API route handlers under `app/api/booking/**` only if server-confirmed success events need backend signal support.
- New consent/cookie handling component(s) and related shared utility.
- Documentation for verification checklist under `.project-workflow/tasks/JD-003-Analytics/`.

## Data / RLS / RPC / Migrations

- No database schema, RLS, RPC, or migration changes expected for this story.

## Risks & Mitigations

- Risk: Duplicate event firing due to mixed route/page lifecycle hooks. Mitigation: define single event ownership points and validate with GTM preview before release.
- Risk: Consent behavior mismatches legal expectations by region. Mitigation: explicitly test EEA strict path and document fallback behavior by region.
- Risk: Missing/incorrect environment IDs causes silent tracking failure. Mitigation: add startup/runtime guardrails and pre-release config checklist.
- Risk: Divergence between data-layer event names and GTM tag mappings. Mitigation: keep a single event contract doc and verify both platforms during staging.

## Validation Note (AC6)

- Validation date: 2026-03-09
- AC2 (GA pageviews): Pass
- AC3 (Meta pageviews): Pass
- AC4 (booking + CTA mapped events): Pass
- AC5 (consent gating pre/post): Pass
- Overall JD-003 status for validated items: Pass

## Notes

- Task: JD-003
- Title: Analytics
- Created: 2026-03-07
