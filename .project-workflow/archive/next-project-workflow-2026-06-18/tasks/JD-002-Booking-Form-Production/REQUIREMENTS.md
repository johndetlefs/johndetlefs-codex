## Overview

- Goal (in user terms): Move the booking flow from mocked endpoints/data to production-ready integrations so users can complete real bookings end-to-end.
- Primary user(s): Prospective customers booking a consultation/session, and business operators who receive and manage bookings.
- Desired outcome: A user can select a real date/time, complete payment using Stripe-hosted UI, have booking completion finalized via Stripe webhook events, get persisted booking data in Firebase, be added to the Sendy marketing list, and receive transactional booking communication via Amazon SES.

## User Story

As a prospective customer, I want to enter payment details using Stripe-hosted payment UI and have my booking confirmed only after Stripe webhook-verified payment success, so that I can complete a secure, real booking request end-to-end.

## In Scope

- Replace mock booking API behavior with production integrations for availability, enrollment, flow transition, and payment completion paths.
- Use Google Calendar API for real date/time availability and slot validation.
- Use Stripe for real payment processing in the booking flow, including Stripe-hosted payment UI in the booking experience.
- Add and validate Stripe webhook handling so payment completion and booking confirmation are driven by Stripe webhook events.
- Persist booking records and payment-linked booking state in Firebase.
- Add the submitted email address to the Sendy marketing list for onboarding/welcome communication.
- Send post-booking transactional communication (confirmation/payment/booking details) through Amazon SES.
- Support at least one upcoming-meeting reminder communication path.

## Out of Scope

- Redesigning booking form UX beyond what is required to support production integrations.
- Building a new admin dashboard for booking management.
- Introducing additional providers beyond Sendy, Amazon SES, Google Calendar API, Firebase, and Stripe.

## Requirements

List requirements as outcomes/expectations, not implementation details.

### Functional Requirements

- The booking flow must use Google Calendar-backed availability instead of mocked availability data.
- The booking flow must treat the business timezone as the source of truth for slot interpretation and storage.
- The selected booking time must be validated at submission time against live availability before final confirmation.
- The booking flow must process payment through Stripe and only mark booking completion after successful Stripe completion.
- The booking flow must collect payment details using Stripe-hosted payment UI components (Stripe Checkout or Stripe Elements/Payment Element), not custom card-data inputs.
- Stripe payments must use immediate capture at booking time.
- Stripe webhook processing must be configured and active for payment lifecycle events needed to complete or fail bookings.
- Booking completion/confirmation must depend on webhook-verified Stripe success, not only client-side request flow.
- A successful booking must create/update a canonical booking record in Firebase with enough data to reconcile customer, time slot, and payment status.
- Firebase booking lifecycle must support at minimum the statuses `pending`, `paid`, `failed`, and `confirmed`.
- Firebase booking records must store Stripe linkage fields sufficient for webhook reconciliation (at minimum payment intent identifier and booking correlation identifier).
- After booking confirmation, the system must create the actual appointment as a Google Calendar event for the booked date/time.
- On initial booking form submission, the user's committed email address must be sent to Sendy and added to the configured marketing list; the booking flow must not enroll transient partially typed email values that only temporarily pass syntax validation.
- On successful payment/booking completion, a transactional booking confirmation email with relevant booking details must be sent via Amazon SES.
- The booking system must use a hybrid reminder approach: Google Calendar attendee notifications enabled plus an Amazon SES reminder as a controlled backup.
- Failed availability checks, payment failures, or Firebase persistence failures must return a clear user-facing error and prevent false "success" states.
- Sendy, SES, and reminder-channel failures must be treated as non-blocking after core booking success, with asynchronous retry and operations visibility.

### Non-Functional Requirements

- Performance / latency: Booking API responses should be fast enough to keep flow interactions responsive for typical user traffic.
- Security / permissions: Secrets for provider APIs must remain server-side; payment and booking data handling must avoid exposing sensitive data to clients.
- Security / permissions: Stripe webhook signature validation must be enforced server-side before mutating booking state.
- Accessibility: Existing booking flow accessibility must be preserved (no regression for keyboard and screen-reader operation).
- Observability (logs/metrics/audit expectations): Booking lifecycle events (availability check, Stripe hosted UI payment initiation, webhook result, persistence result, Sendy list result, SES transactional result, reminder trigger) should be logged with correlation identifiers for troubleshooting.

## Acceptance Criteria

- AC1: Users can only select and submit booking times that come from live Google Calendar availability.
- AC2: Payment details are captured via Stripe-hosted UI in the booking experience (no raw card capture by site-owned inputs).
- AC3: Successful Stripe payment (immediate capture) is required before a booking is marked complete.
- AC4: Booking completion/confirmation is driven by valid Stripe webhook events, including signature verification.
- AC5: On successful completion, a Firebase booking record is created/updated and includes booking + payment linkage used for webhook reconciliation.
- AC6: Booking submission adds the user's committed email address to the configured Sendy marketing list without enrolling transient partially typed email values.
- AC7: On successful completion, a transactional confirmation email is attempted via Amazon SES and retried asynchronously on failure.
- AC8: A confirmed booking creates a Google Calendar event for the selected slot and stores linkage needed for reconciliation.
- AC9: Upcoming meeting reminders follow the hybrid model (Google Calendar notifications + SES backup reminder).
- AC10: Core-path failures (calendar/payment/webhook/db) produce a user-visible failure outcome and no false completed booking state; comms failures (sendy/ses/reminder) do not block completion and are retried/logged.

## Assumptions

- Credentials and environment configuration for Sendy, Amazon SES, Google Calendar API, Firebase, and Stripe are available for the target environment.
- Existing booking form fields and flow steps are already acceptable for production and do not require major UX changes.
- Existing API route structure under `app/api/booking/**` remains the integration surface.

## Open Questions

- None.

## Decisions Log

- Decision:
  - Context: Production provider selection for booking flow integrations.
  - Options considered: Keep mocks, or connect production services.
  - Chosen: Connect production services.
  - Why: Task goal is to move from mocked APIs/values to real booking operations.
- Decision:
  - Context: Service providers for this story.
  - Options considered: Multiple provider combinations.
  - Chosen: Sendy for marketing list enrollment, Amazon SES for transactional booking email, Google Calendar API for date/time, Firebase for database, Stripe for payment.
  - Why: Explicitly required by stakeholder input.
- Decision:
  - Context: Timezone behavior for booking slot interpretation.
  - Options considered: user-local, business timezone, or mixed display/resolve strategy.
  - Chosen: Always business timezone.
  - Why: Reduces scheduling ambiguity and keeps operational calendars consistent.
- Decision:
  - Context: Stripe payment capture behavior.
  - Options considered: immediate capture vs authorize now/capture later.
  - Chosen: Immediate capture at booking.
  - Why: Simplifies reconciliation and guarantees paid state before completion.
- Decision:
  - Context: Stripe payment collection UX for booking flow.
  - Options considered: custom card-data form fields vs Stripe-hosted UI.
  - Chosen: Stripe-hosted UI.
  - Why: Improves security posture, PCI scope management, and payment UX consistency.
- Decision:
  - Context: Source of truth for booking completion after Stripe payment.
  - Options considered: client-flow-only confirmation vs webhook-driven confirmation.
  - Chosen: Webhook-driven confirmation with server-side signature validation.
  - Why: Ensures reliable, auditable payment finalization independent of client/network interruptions.
- Decision:
  - Context: Minimum Firebase booking lifecycle states.
  - Options considered: two-state, three-state, or four-state lifecycle.
  - Chosen: `pending`, `paid`, `failed`, `confirmed`.
  - Why: Supports clear lifecycle transitions and post-payment confirmation handling.
- Decision:
  - Context: Reminder pathway for upcoming meetings.
  - Options considered: Google Calendar-only, SES-only, or hybrid.
  - Chosen: Hybrid (Google Calendar attendee notifications enabled + SES backup reminder).
  - Why: Improves reminder delivery reliability while keeping calendar-native updates.
- Decision:
  - Context: Completion behavior when marketing/notification integrations fail.
  - Options considered: Hard dependency, soft dependency, or mixed dependency.
  - Chosen: B) Soft dependency.
  - Why: Protects paid booking completion when core path succeeds while handling comms failures through async retries and operations monitoring.
- Decision:
  - Context: Booking-flow Sendy enrollment timing for email addresses that become syntactically valid before the user has finished typing, such as `.co` before `.com.au`.
  - Options considered: Trigger as soon as the email field validates, debounce typing, or wait for a committed field value.
  - Chosen: Wait for a committed email field value before Sendy enrollment and payment initialization.
  - Why: Prevents partial-but-valid email addresses from being enrolled while preserving a simple booking flow without timing-based debounce assumptions.

## Validation Plan (User-Facing)

- How the user will verify "done": Run the booking flow with real integrations in target environment and confirm outcomes across UI and provider systems.
- AC1 -> verification step: Open booking flow, view available slots, and verify listed/accepted slots match live Google Calendar availability.
- AC2 -> verification step: In the booking flow, confirm payment entry is rendered by Stripe-hosted UI and no site-owned raw card fields are used.
- AC3 -> verification step: Complete payment with Stripe test/live credentials and verify booking is not marked complete when Stripe payment fails.
- AC4 -> verification step: Trigger Stripe webhook events in staging/test and verify only valid signature-verified events can transition booking completion.
- AC5 -> verification step: After successful payment + webhook processing, verify Firebase contains the booking record with correct user/time/payment linkage and valid status transitions (`pending` -> `paid` -> `confirmed`, with `failed` on error).
- AC6 -> verification step: Type an address that is temporarily valid before completion, such as `myname@store.co` before `myname@store.com.au`, continue editing before leaving the email field, then verify only the committed final email address is present in the configured Sendy list.
- AC7 -> verification step: After successful booking, verify SES confirmation attempt is recorded and email is delivered; if SES is unavailable, verify retry state is recorded without reversing completed booking.
- AC8 -> verification step: Complete a booking and verify a Google Calendar event is created for the exact selected date/time (business timezone) and linked to the booking record.
- AC9 -> verification step: Verify attendee reminder configuration on the created calendar event and verify SES backup reminder is scheduled/sent for the same booking.
- AC10 -> verification step: Simulate core-path failures (calendar/payment/webhook/db) and confirm user-facing failure with no completed booking; simulate comms failures (sendy/ses/reminder) and confirm booking remains complete with retry/log visibility.
- Rollout notes (if any): Validate Stripe publishable/secret keys, webhook endpoint registration, webhook signing secret, and provider credentials in staging before production cutover.
