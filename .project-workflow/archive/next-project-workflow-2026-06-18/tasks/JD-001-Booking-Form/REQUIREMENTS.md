# Requirements

## Overview

- Goal (in user terms): Let visitors complete booking and payment in-product, while using Google Calendar availability data behind the scenes.
- Primary user(s): Prospective customers booking a paid Fix-It call.
- Desired outcome: A mobile-friendly 3-step booking flow captures email, captures booking date/time, takes payment, updates mock mailing-flow state, and redirects successful bookings to a tokenized success page.

## User Story

As a prospective Fix-It customer, I want to complete email capture, booking details, and payment directly in a guided on-site booking flow powered by Google Calendar availability, so that I can secure a session without leaving the site and receive immediate confirmation after successful payment.

## In Scope

- Replace current Google Calendar redirect path with an in-site booking route at `/booking`.
- Provide a vertically stacked 3-section form (Email capture, Booking date/time, Payment) designed to work on mobile.
- Implement progressive disclosure: section 2 appears only after section 1 validates; section 3 appears only after section 2 validates.
- Apply fade-in transition when sections 2 and 3 become visible.
- Trigger mock API call after step 1 validation to add the user to a Sendy pre-booking list.
- Implement server-side mock behavior using Next.js route handlers (`/api` routes under App Router).
- Use Google Calendar appointments schedule as the section-2 booking data source contract for available date/time options.
- Use the configured Google appointments schedule to expose four 60-minute call slots per available day with 15-minute gaps: 9:00am, 10:15am, 11:30am, and 12:45pm (Sydney time).
- Enforce no actual booking creation before payment success.
- Trigger mock API call after successful payment to remove from pre-booking and add to booked flow.
- Mock Stripe payment completion handling and redirect to `/success` with a verification token (`bookingToken`).
- Keep payment submit disabled until all required form inputs are valid.

## Out of Scope

- Real Sendy integration, authentication, webhook signing, or production list management.
- Real Stripe checkout/session creation, live payment processing, or production key management.
- Final token cryptographic design and long-term server-side validation implementation.
- Creating real Google Calendar bookings/events in this task.

## Requirements

### Functional Requirements

- The primary booking CTA must route users to `/booking` instead of redirecting to Google Calendar.
- Server-side mocks for enrollment, availability, payment completion, and flow transition must be exposed via Next.js `/api` route handlers.
- `/booking` must render 3 vertical sections in this order: Email capture, Booking date/time, Payment.
- Section 1 must validate email before the flow can progress.
- On successful section 1 validation, the system must invoke a mock endpoint that records user enrollment in a pre-booking Sendy flow.
- Section 2 must source date/time options from a Google Calendar appointment schedule contract for this booking page.
- Section 2 must interpret and display availability in `Australia/Sydney` timezone.
- Section 2 must validate that the selected date/time is both currently available in the Google schedule response and one of the configured slot windows (9:00am, 10:15am, 11:30am, 12:45pm).
- Section 2 must collect and validate booking date/time before section 3 can appear.
- Section 2 selection must be treated as provisional until payment is successful.
- Section 3 must remain present but payment submission must be blocked until all form sections are valid.
- On successful mock payment completion, the system must invoke mock endpoints to (1) remove from pre-booking flow and (2) add to booked flow.
- After successful mock payment, user must be redirected to `/success` and include a non-empty `bookingToken` query parameter.
- Any booking-finalization action (currently mocked) must occur only after successful payment outcome.

### Non-Functional Requirements

- Performance / latency: Section transitions and validation feedback should feel immediate (target under 300ms for UI state updates in local/mock environment).
- Security / permissions: No live secrets in client code; mock endpoints must avoid exposing production credentials and must validate minimal expected payload shape.
- Accessibility: Form fields must be keyboard reachable, include labels, and expose validation errors in accessible text.
- Observability (logs/metrics/audit expectations): Mock API handlers should log request outcome states for step-1 enrollment, calendar availability fetch, payment success handling, and post-payment flow switch/finalization.

## Acceptance Criteria

- AC1: Booking entry flow no longer sends users to Google Calendar and instead lands on `/booking`.
- AC2: `/booking` displays the 3 sections vertically and is usable on mobile viewport widths.
- AC3: Section 2 is hidden until section 1 email validation succeeds, then appears with fade-in.
- AC4: Section 3 is hidden until section 2 date/time validation succeeds, then appears with fade-in.
- AC5: Completing section 1 successfully triggers a mock “add to pre-booking flow” call.
- AC6: Section 2 reads booking availability from the Google Calendar schedule contract used by this page.
- AC7: Section 2 shows slot times in Sydney timezone and only allows the four configured slot windows (9:00am, 10:15am, 11:30am, 12:45pm) when those slots are available from the schedule API.
- AC8: Attempting to proceed with an unavailable or invalid slot selection is blocked with clear validation feedback.
- AC9: Selecting a date/time before payment does not create a real booking/event.
- AC10: Payment submit is disabled until all required data across sections 1–3 is valid.
- AC11: Successful mock payment triggers mock “remove from pre-booking” and “add to booked flow” calls.
- AC12: Successful payment redirects to `/success` with a non-empty `bookingToken` query parameter.
- AC13: All server-side mock operations in this story (enrollment, availability, payment completion, and flow transition) are implemented as Next.js `/api` route handlers.

## Assumptions

- This task implements scaffolding/mocks only; production integrations are deferred to a follow-up task.
- Mock APIs can return deterministic success/failure payloads to support front-end flow testing.
- Section-2 Google Calendar integration in this task is contract-level scaffolding suitable for replacement/refinement in a real integration pass.
- Slot definitions for this story are fixed at four 60-minute sessions with 15-minute gaps and may be expanded in a later scheduling story.
- Existing site navigation/CTA location can be updated without additional content or IA changes.

## Open Questions

- None.

## Decisions Log

- Decision: Replace Google Calendar redirect with an on-site booking flow.
  - Context: Current booking sends users externally; desired flow is in-product.
  - Options considered: Keep external redirect; embed Google Calendar; implement new `/booking` flow.
  - Chosen: Implement new `/booking` flow.
  - Why: Reduces user drop-off and allows staged validation plus integration hooks.

- Decision: Use a 3-step vertical progressive form.
  - Context: Booking requires email capture, scheduling info, and payment.
  - Options considered: Single long form; modal wizard; vertical progressive sections.
  - Chosen: Vertical progressive sections with fade-in progression.
  - Why: Works on mobile and enforces required sequence.

- Decision: Use mocks for Sendy and Stripe in this task.
  - Context: Team requested scaffolding only in this story.
  - Options considered: Full live integration now; mixed live/mock; full mock.
  - Chosen: Full mock scaffolding.
  - Why: Enables UX and flow validation quickly while deferring external-system risk.

- Decision: Standardize success token query key as `bookingToken`.
  - Context: Success page needs a stable verification identifier independent of payment-provider object IDs.
  - Options considered: `token`; `bookingToken`; `session_token`.
  - Chosen: `bookingToken`.
  - Why: Clear app-owned contract and future-proofing against payment-provider implementation details.

- Decision: Keep booking creation after payment only.
  - Context: Booking date/time is selected in step 2 but should not reserve a slot until payment is complete.
  - Options considered: reserve on selection; reserve on form completion; finalize after payment.
  - Chosen: Finalize after payment.
  - Why: Prevents unpaid holds and aligns with requested booking/payment sequencing.

- Decision: Use strict Sydney-time slot validation from Google availability.
  - Context: Booking options are preconfigured as 9:00am, 10:15am, 11:30am, and 12:45pm with 60-minute duration and 15-minute gaps.
  - Options considered: future date/time only; timezone-only validation; fixed slot + timezone + API availability validation.
  - Chosen: Fixed slot + timezone + API availability validation.
  - Why: Matches live booking pattern and ensures users can only select valid, currently available times.

- Decision: Use Next.js `/api` route handlers for all server-side mocks in this story.
  - Context: We need mock server behavior for Sendy flow updates, Google availability proxying, payment completion, and success verification while keeping implementation aligned with Next.js conventions.
  - Options considered: client-only mocks; separate mock server; Next.js `/api` route handlers.
  - Chosen: Next.js `/api` route handlers.
  - Why: Keeps mock contracts colocated with the app and reduces rework when replacing mocks with real integrations.

## Validation Plan (User-Facing)

- How the user will verify "done":
  - AC1 -> Click booking CTA and confirm navigation target is `/booking` (not Google Calendar).
  - AC2 -> Open `/booking` on mobile viewport and verify sections are vertically stacked and readable.
  - AC3 -> Enter invalid then valid email; verify section 2 appears only after valid email and fades in.
  - AC4 -> Complete/validate date-time input; verify section 3 appears only after section 2 and fades in.
  - AC5 -> Complete section 1 and verify mock pre-booking API call success is recorded.
  - AC6 -> Verify section 2 displays date/time options from the Google Calendar schedule contract source configured for this task.
  - AC7 -> Verify displayed slot times are interpreted in Sydney timezone and limited to 9:00am, 10:15am, 11:30am, and 12:45pm when available.
  - AC8 -> Try selecting an unavailable or non-slot time and verify progression is blocked with validation messaging.
  - AC9 -> Select date/time and verify no booking-finalization call is made before payment success.
  - AC10 -> Attempt payment submit before full valid form and verify button remains disabled; verify enabled only when full form valid.
  - AC11 -> Complete mock payment and verify both mock flow-switch calls succeed.
  - AC12 -> After successful payment, verify redirect to `/success` includes non-empty `bookingToken` query parameter.
  - AC13 -> Trigger each mocked operation and verify requests are served by app-owned Next.js `/api` routes for enrollment, availability, payment, and flow transition.
- Rollout notes (if any): Internal/mock rollout only; no production external integration toggles required in this task.
