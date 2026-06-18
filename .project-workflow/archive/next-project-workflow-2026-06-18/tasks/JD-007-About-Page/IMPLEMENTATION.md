## User Story

As an Australian Shopify merchant evaluating a Fix-It session, I want a clear About page that explains who is behind the service, what expertise is offered, and why the approach is trustworthy, so that I can decide whether to book with confidence.

## Goal

- Deliver a public About experience at `/about` that builds trust with a detailed founder narrative, is discoverable from the global header, and guides users to booking.

## Approach

- Implement as two incremental vertical slices: first deliver the About page content and booking CTA, then add navigation discoverability and complete accessibility/performance validation.

## Phases

### Phase 1

- Changes:
  - Add the About page at `/about` with the approved long-form narrative themes and clear trust positioning.
  - Include a prominent booking CTA on the About page.
- Validation:
  - Confirm `/about` renders successfully.
  - Confirm required narrative themes are present and understandable.
  - Confirm About-page CTA routes to the booking destination.
- Tracker updates:
  - Keep story status as `Analysing` while planning is under review.
  - Move to `In Progress` only when implementation work starts.

### Phase 2

- Changes:
  - Add About discoverability in global header navigation.
  - Ensure semantic heading structure and keyboard-friendly navigation behavior for About experience.
- Validation:
  - Confirm header About link navigates to `/about` on desktop and mobile header states.
  - Confirm keyboard-only traversal and heading semantics on `/about`.
  - Confirm no regression to baseline page-load behavior for static marketing content.
- Tracker updates:
  - Keep story at `Analysing` until plan is explicitly confirmed.
  - Set to `Plan Confirmed` only after explicit user confirmation.

## Task List (for IMPLEMENTATION.md)

|  ID | Title                                                               | Description                                                                                                                           | Acceptance Criteria                                                                                                                                                                                                                                                                                                           | User Verification                                                                                                                                                                                                                       | Status   |
| --: | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
|   1 | Publish About page at /about                                        | A new public About page is available with the approved long-form founder narrative and clear trust positioning for potential clients. | - `/about` route renders successfully in production build.<br>- Page copy is published exactly as provided by the user with no wording changes.<br>- Named clients (Guess, Camilla, Sukin, Tigerlily, Early Settler) are included as written.<br>- Content remains understandable without requiring context from other pages. | - Open `/about` and compare text against the approved source copy line-by-line; confirm no wording changes.<br>- Confirm named clients appear as supplied.<br>- Confirm the page is publicly reachable without auth.                    | Complete |
|   2 | Add booking CTA on About page                                       | The About page gives users a clear next action by linking directly to the internal booking route.                                     | - About page includes a prominent CTA with clear booking intent text.<br>- CTA click navigates to `/booking`.<br>- CTA remains visible and functional on desktop and mobile layouts.                                                                                                                                          | - Visit `/about` on desktop and mobile viewport sizes.<br>- Click the CTA and confirm navigation to `/booking`.                                                                                                                         | Complete |
|   3 | Add About link to global header navigation                          | Users can discover the About page from the global header navigation where header navigation is shown.                                 | - Global header contains an `About` nav item.<br>- Header About link points to `/about` and loads the About page on click/tap.<br>- Existing header navigation items continue to work as before.                                                                                                                              | - From home page, click header `About` and confirm `/about` loads.<br>- Open mobile menu, tap `About`, and confirm `/about` loads.<br>- Spot-check one existing nav item still works.                                                   | Complete |
|   4 | Validate accessibility and baseline UX quality for About experience | The new About experience meets baseline accessibility and quality expectations aligned to existing static marketing pages.            | - `/about` uses semantic heading structure in logical order.<br>- Keyboard-only users can tab through interactive elements in sensible order, including header navigation and About CTA.<br>- No obvious regression to baseline static-page load behavior relative to existing content pages.                                 | - On `/about`, use Tab and Shift+Tab to navigate and confirm focus order is logical.<br>- Use browser accessibility inspector to verify heading order.<br>- Run `npm run build` and confirm successful build with the new page present. | Complete |

## Files / Areas Likely to Change

- `app/about/page.tsx`
- `app/_lib/global-header-config.ts`
- Potentially `components/GlobalHeader.tsx` (only if nav behavior adjustments are needed)

## Data / RLS / RPC / Migrations

- None expected. This is a static content and navigation update with no database or backend schema impact.

## Risks & Mitigations

- Risk: Long-form copy may reduce scannability.
  - Mitigation: Structure content with clear sections/subheadings while preserving the approved narrative.
- Risk: Header nav changes could regress existing links or mobile behavior.
  - Mitigation: Explicitly verify existing nav item behavior on desktop/mobile after adding About.
- Risk: CTA wording may be clear in copy but low prominence visually.
  - Mitigation: Reuse established CTA styling conventions and verify in desktop/mobile viewports.

## Notes

- Task: JD-007
- Title: About Page
- Created: 2026-03-17
