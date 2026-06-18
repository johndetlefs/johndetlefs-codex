## User Story

As a prospective customer, I want to enter payment details using Stripe-hosted payment UI and have my booking confirmed only after Stripe webhook-verified payment success, so that I can complete a secure, real booking request end-to-end.

## Goal

- Deliver a production-ready booking flow that replaces mocked behavior with real Google Calendar availability, Stripe immediate capture, Firebase booking persistence, Sendy marketing enrollment, Amazon SES transactional messaging, and hybrid reminders.

## Approach

- Implement vertical slices around user-critical outcomes (availability, payment + persistence, communications + reminders) while keeping existing booking UX and API route structure stable.
- Enforce server-side orchestration and status transitions so user-visible completion reflects real downstream success.
- Add explicit failure handling and event logging for each integration boundary to avoid false-positive completion states and speed troubleshooting.

## Phases

### Phase 1

- Changes: Replace mocked availability with Google Calendar-backed slot read + submit-time validation in business timezone; return clear user-facing responses for unavailable/invalid slots.
- Validation: Confirm only live slots are selectable/submittable and stale/invalid slots are rejected gracefully.
- Tracker updates: Keep story status as `Analysing` until this plan is reviewed and confirmed.

### Phase 2

- Changes: Implement Stripe immediate capture flow, Firebase booking lifecycle persistence (`pending` -> `paid` -> `confirmed` / `failed`), Sendy list enrollment on submission, SES transactional confirmation on completion, and hybrid reminders (Google attendee notifications + SES backup).
- Validation: Confirm payment-gated completion, canonical record lifecycle, marketing enrollment, transactional confirmation delivery, reminder behavior, and fail-safe behavior for integration outages.
- Tracker updates: Move to `Plan Confirmed` only after explicit user approval of this plan.

## Task List (for IMPLEMENTATION.md)

|  ID | Title                                                  | Description                                                                                                                                               | Acceptance Criteria                                                                                                                                                                                                                                                                                                                                                                    | User Verification                                                                                                                                                                                                                                                                                                                                              | Status   |
| --: | ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
|   1 | Live Calendar Availability Enforcement                 | Booking form availability and submission use Google Calendar as source of truth in business timezone, replacing mocked slot logic.                        | - Availability options shown in booking flow are sourced from live Google Calendar data.<br>- Submission re-validates selected slot against live availability before continuing.<br>- Unavailable or stale slots are blocked with a clear user-facing error and no booking completion state.                                                                                           | - Open booking flow and verify available times match calendar source.<br>- Select a valid slot and proceed successfully.<br>- Attempt a now-unavailable slot (or simulate conflict) and confirm clear failure message with no successful booking.                                                                                                              | Complete |
|   2 | Stripe Immediate Capture + Canonical Booking Lifecycle | Booking completion is gated by successful Stripe immediate capture and persisted in Firebase with required lifecycle statuses and payment linkage.        | - Payment details are captured via Stripe-hosted UI (no raw card capture by site-owned inputs).<br>- Booking is not marked complete unless Stripe payment succeeds and valid Stripe webhook events confirm completion.<br>- Firebase record is created/updated with `pending`, `paid`, `failed`, `confirmed` transitions and payment linkage fields needed for webhook reconciliation. | - Start payment from booking flow and confirm embedded Stripe-hosted Elements UI is used on the booking page.<br>- Complete payment and verify webhook-verified booking transitions to `confirmed` (with `pending`/`paid` intermediate states) in Firebase.<br>- Trigger failed payment/webhook signature mismatch and confirm booking is not marked complete. | Complete |
|   3 | Marketing Enrollment via Sendy                         | Initial booking submission adds the provided committed email to the configured Sendy marketing list for welcome/onboarding communication.                  | - Submission sends the committed email field value to the configured Sendy list once per successful submission event.<br>- Sendy enrollment does not fire for transient partially typed values that only temporarily pass email syntax validation.<br>- Sendy integration result is logged with booking correlation details.<br>- Sendy failure is non-blocking to completed core booking and is queued/retried asynchronously.                         | - Type an address that is temporarily valid before completion, such as `myname@store.co` before `myname@store.com.au`, and verify only the committed final email appears in target Sendy list.<br>- Validate duplicate prevention behavior by re-submitting same email per expected policy.<br>- Simulate Sendy error and confirm booking completion remains valid while retry/log records are created.                         | Complete |
|   4 | Transactional Confirmation via Amazon SES              | Successful booking triggers a transactional confirmation email via Amazon SES with booking details.                                                       | - SES confirmation attempt runs after payment success and booking completion criteria are met.<br>- Email payload includes key booking details (time, timezone, payment confirmation context).<br>- SES failure is non-blocking to completed core booking and is logged/retried asynchronously.                                                                                        | - Complete a valid paid booking and confirm SES confirmation email is delivered.<br>- Verify message content includes expected booking details.<br>- Simulate SES failure and confirm booking stays complete while retry/log records are created.                                                                                                              | Complete |
|   5 | Calendar Event Creation on Confirmation                | Confirmed bookings create a real Google Calendar event for the selected slot and persist event linkage to the booking record.                             | - On confirmed booking, a Google Calendar event is created for the exact selected slot in business timezone.<br>- The created event includes booking participant linkage required by the product flow.<br>- Calendar creation failure on the core path prevents false completed-booking state and is logged for operations visibility.                                                 | - Complete a booking and confirm a calendar event exists for the exact selected slot and timezone.<br>- Verify booking record stores calendar linkage/reference needed for reconciliation.<br>- Simulate calendar event creation failure and confirm booking is not falsely marked as completed.                                                               | Complete |
|   6 | Hybrid Reminder Reliability                            | Upcoming-meeting reminders use hybrid model: Google Calendar attendee notifications enabled plus SES backup reminder scheduling/sending.                  | - Calendar event attendee notification behavior is enabled for booking participants.<br>- SES backup reminder is scheduled/sent for the same booking according to reminder timing rule.<br>- Reminder failures are non-blocking to completed core booking and are logged/retried.                                                                                                      | - Confirm created event has attendee notification/reminder configuration applied.<br>- Verify SES backup reminder is queued/sent for booked session.<br>- Simulate reminder channel failure and confirm booking remains valid while retry/log records are created.                                                                                             | To Do    |
|   7 | End-to-End Failure Safety and Observability            | Integration boundaries (calendar, stripe, firebase, sendy, ses, reminders) return deterministic outcomes and logs that prevent false-success experiences. | - Core-path failures (calendar/stripe/firebase) return clear user-visible failure outcomes and prevent completion.<br>- Comms failures (sendy/ses/reminders) are non-blocking after core success, with async retry and operations visibility.<br>- Logs include correlation identifiers across booking lifecycle events for troubleshooting.                                           | - Run core-path failure checks and confirm no completed booking is shown.<br>- Run comms failure checks and confirm booking remains complete with retries/logs present.<br>- Review logs and confirm correlation identifiers link request to integration outcomes.                                                                                             | To Do    |

## Files / Areas Likely to Change

- `app/booking/page.tsx`
- `app/api/booking/availability/route.ts`
- `app/api/booking/enrollment/route.ts`
- `app/api/booking/flow-transition/route.ts`
- `app/api/booking/payment-completion/route.ts`
- Shared integration utilities under `app/api/booking/**` or `components/**` as needed for provider clients and payload normalization.

## Data / RLS / RPC / Migrations

- Firebase data model update for canonical booking record lifecycle (`pending`, `paid`, `failed`, `confirmed`) and payment linkage fields.
- No SQL RLS/RPC/migrations expected in this Next.js repo unless Firebase backend definitions are versioned here.
- Ensure idempotency keys/guards for external calls (Stripe, Sendy, SES) to avoid duplicate side effects.

## Risks & Mitigations

- Risk: Slot race conditions between selection and payment completion.<br>Mitigation: Re-validate slot server-side at submit/payment boundary and fail fast on conflicts.
- Risk: Duplicate emails/reminders due to retries/webhook replays.<br>Mitigation: Add idempotency keys and persisted send-state checks before sending.
- Risk: Communication provider outage causes missed emails/reminders after successful booking.<br>Mitigation: Keep completion gate on core operations (calendar/payment/firebase), and use async retries + alerting for sendy/ses/reminder channels.
- Risk: Timezone drift between UI, calendar, and reminders.<br>Mitigation: Store and operate on business timezone canonical values and include timezone explicitly in all outbound messages.

## Notes

- Task: JD-002
- Title: Booking Form Production
- Created: 2026-02-27
- Outcome update: On 2026-05-07, booking-flow Sendy enrollment was tightened so the client waits for a committed email field value before enrollment and payment initialization. This prevents partial-but-valid addresses, such as `.co` while a user is still typing `.com.au`, from being subscribed or tracked as the successful booking-flow enrollment.
