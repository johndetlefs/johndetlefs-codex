# Requirements

## Overview

- Goal (in user terms): Receive internal email alerts when meaningful customer events occur so the business owner can react quickly.
- Primary user(s): Site owner and business operator.
- Desired outcome: Important events trigger clear, actionable notification emails without disrupting the customer-facing booking or signup flow.

## User Story

As the site owner, I want to receive email notifications when important customer events happen, so that I can respond quickly without manually checking multiple systems.

## In Scope

- Internal email notifications for confirmed booking purchases.
- Internal email notifications for newsletter signups that happen during the booking flow.
- Internal email notifications for newsletter signups that happen from guide/content pages.
- Internal email notifications for failed payment-related booking events.
- Internal email notifications when a success link is reissued.
- Meta/Facebook tracking for successful newsletter signups across supported signup surfaces.
- Notification content that clearly identifies what happened, who triggered it, and where it happened.
- Support for sending notification emails to multiple internal recipients.
- Logging of notification delivery success or failure for operational follow-up.

## Out of Scope

- Changes to customer-facing confirmation emails.
- SMS, Slack, push, or other non-email notification channels.
- Backfilling historical events that already happened before this feature exists.
- Defining every future event type now beyond the currently known purchase and newsletter signup surfaces.

## Requirements

List requirements as outcomes/expectations, not implementation details.

### Functional Requirements

- The system must send an internal email notification when a booking purchase is successfully completed.
- The system must send an internal email notification when a newsletter signup succeeds during the booking flow.
- The system must send an internal email notification when a newsletter signup succeeds from a guide/content page.
- The system must send an internal email notification for terminal customer-facing payment failures and for paid-but-not-confirmed mismatches where payment succeeds but booking confirmation does not complete.
- The system must send an internal email notification when a success link is reissued.
- The system must emit a Meta/Facebook event when a newsletter signup succeeds, including the booking-flow and guide/content-page signup surfaces.
- The system must support sending each notification to multiple internal recipient addresses.
- The system must support a shared default internal recipient list with optional event-specific recipient overrides for selected event types.
- The system should minimize duplicate internal email notifications in a pragmatic best-effort way for supported events.
- The system must deduplicate Meta/Facebook signup events as strictly as practical so one successful signup produces one advertising conversion signal.
- The system must emit newsletter-signup tracking into the shared client-side data layer so GTM can map that event to Meta/Facebook under the existing consent model.
- Each notification email must include enough context to understand the event without checking logs first, including event type, timestamp, customer email, and source surface. When relevant data exists, include customer name and booking or payment identifiers.
- Notification emails must distinguish event types clearly so the site owner can triage what happened at a glance.
- A failure to send an internal notification must not prevent the underlying purchase or newsletter signup from succeeding.

### Non-Functional Requirements

- Performance / latency: Notification handling must not materially slow down purchase completion or newsletter signup success.
- Security / permissions: Notification emails must avoid exposing unnecessary secrets or sensitive payment data and must only go to approved internal recipient addresses.
- Accessibility: No new accessibility regressions should be introduced in existing signup or booking flows.
- Observability (logs/metrics/audit expectations): Notification attempts must produce operational logs that record event type, outcome, and identifiers useful for tracing failures.

## Acceptance Criteria

- AC1: When a booking purchase is successfully completed, the site owner receives one internal email notification that identifies the purchase event and includes the customer email plus a booking or payment identifier when available.
- AC2: When a newsletter signup succeeds during the booking flow, the site owner receives one internal email notification that identifies the signup and its booking-flow source.
- AC3: When a newsletter signup succeeds from a guide/content page, the site owner receives one internal email notification that identifies the signup and its content-page source.
- AC4: When a terminal customer-facing payment failure or paid-but-not-confirmed mismatch occurs, the site owner receives one internal email notification that identifies the failure and includes the relevant customer and booking or payment context when available.
- AC5: When a success link is reissued, the site owner receives one internal email notification that identifies the reissue event and the affected customer.
- AC6: When notifications are configured for multiple internal recipients, each supported event sends one notification to each configured recipient.
- AC7: If internal notification delivery fails for any supported event, the customer-facing purchase or signup still completes successfully and the failure is logged.
- AC8: The notification content is clear enough that the site owner can tell which event occurred and whether follow-up is needed without reading application code.
- AC9: When a newsletter signup succeeds on a supported surface, a Meta/Facebook signup event is emitted for that successful signup.
- AC10: Supported internal email notifications are deduplicated on a best-effort basis so avoidable duplicate alerts are minimized.
- AC11: Successful newsletter signups emit at most one Meta/Facebook signup event per successful signup outcome.
- AC12: Successful newsletter signups emit their tracking signal through the shared client-side data layer, and GTM is the path that maps that signal to Meta/Facebook.
- AC13: Internal recipient routing uses a shared default list, and selected event types can override that default when different recipients are needed.

## Assumptions

- Email is the only notification channel required for the first release.
- The initial release should include the three known event surfaces plus failed payment-related events and success-link reissue events.
- A single internal notification format can be used across supported events as long as event-specific details remain clear.
- Payment-related failure coverage in v1 is limited to terminal customer-facing failures and paid-but-not-confirmed mismatches, not every transient infrastructure error.
- Internal email notifications should avoid duplicates where practical, but perfect deduplication is not required for v1.
- Meta/Facebook signup tracking should be as accurate and deduplicated as practical because it directly affects advertising optimization.
- Newsletter signup Meta/Facebook tracking should use the shared data-layer and GTM path rather than a direct Meta call from the form success handler.
- Recipient routing should default to one shared list, with overrides available only where an event genuinely needs different operational recipients.

## Open Questions

## Decisions Log

- Decision: Start the first-pass requirements around the currently known event surfaces.
  - Context: Discovery identified confirmed purchases, booking-flow newsletter signups, and guide-page newsletter signups as the current important events.
  - Options considered: Wait until all future event types are fully defined; start with the known high-signal events and expand later.
  - Chosen: Start with the known event surfaces.
  - Why: This gives the smallest useful release while leaving room to extend the engine in later tasks.
- Decision: Use email as the initial notification channel.
  - Context: The requested outcome is receiving notification emails for significant events.
  - Options considered: Multi-channel notifications now; email-only for the first release.
  - Chosen: Email-only for the first release.
  - Why: It matches the stated user need and keeps the first version focused.
- Decision: Support multiple internal recipients in v1.
  - Context: Clarification resolved whether notifications should go to one inbox or several recipients.
  - Options considered: One fixed internal inbox; multiple configurable internal recipients.
  - Chosen: Multiple configurable internal recipients.
  - Why: The user explicitly selected broader internal distribution for operational visibility.
- Decision: Include additional operational events in v1 beyond the three initially identified flows.
  - Context: Clarification resolved whether the first release should stay narrowly scoped or cover a broader event set.
  - Options considered: Only the three known events; those events plus additional operational events.
  - Chosen: Those events plus additional operational events.
  - Why: The user wants the first release to cover a broader set of important signals.
- Decision: Include failed payment-related events and success-link reissue events in v1.
  - Context: Clarification resolved which additional operational events matter in the first release.
  - Options considered: Failed payment-related events only; success-link reissue events only; both.
  - Chosen: Both failed payment-related events and success-link reissue events.
  - Why: The user selected broad enough coverage to capture both purchase problems and post-purchase access issues.
- Decision: Limit payment-failure notifications to terminal failures plus paid-but-not-confirmed mismatches.
  - Context: Clarification resolved how broad payment-failure alerting should be for this user story.
  - Options considered: Terminal failures only; terminal failures plus paid-but-not-confirmed mismatches; all payment-related failures including transient infrastructure noise.
  - Chosen: Terminal customer-facing failures plus paid-but-not-confirmed mismatches.
  - Why: This preserves operator visibility into actionable revenue-impacting issues without flooding notifications with transient system noise.
- Decision: Treat duplicate internal email notifications pragmatically.
  - Context: Clarification separated operator email noise from Meta advertising signal quality.
  - Options considered: Strict deduplication for all internal emails; pragmatic best-effort minimization of duplicate emails.
  - Chosen: Pragmatic best-effort minimization for internal email notifications.
  - Why: The user wants as few duplicate emails as practical without over-optimizing the implementation for perfect guarantees.
- Decision: Treat Meta/Facebook signup deduplication as high-importance.
  - Context: Clarification confirmed Meta signup events directly affect audience optimization and ad delivery.
  - Options considered: Best-effort Meta deduplication; strict as-practical deduplication for Meta signup events.
  - Chosen: Strict as-practical deduplication for Meta signup events.
  - Why: The user explicitly said this data directly drives advertising outcomes and needs to be as accurate as possible.
- Decision: Emit newsletter signup Meta tracking through the shared data layer and GTM.
  - Context: Clarification resolved whether Meta signup tracking should follow the existing GTM-based analytics path or bypass it with direct client calls.
  - Options considered: Shared data-layer event mapped by GTM; direct Meta call from the signup success path; both paths together.
  - Chosen: Shared data-layer event mapped by GTM.
  - Why: This keeps signup tracking aligned with the repo's current GTM and consent approach and avoids splitting attribution across multiple emission paths.
- Decision: Use a shared default recipient list with optional event-specific overrides.
  - Context: Clarification resolved how much recipient-routing flexibility is needed for internal notifications.
  - Options considered: One shared recipient list for all events; a shared default list with optional overrides; separate required recipient lists for every event type.
  - Chosen: A shared default recipient list with optional event-specific overrides for selected event types.
  - Why: This keeps default configuration simple while preserving a clean path for routing high-urgency notifications differently when needed.
- Decision: Add Meta/Facebook tracking for successful newsletter signups.
  - Context: A code check of the shared newsletter signup form confirmed successful signup currently updates UI state but does not dispatch a Meta/Facebook event.
  - Options considered: Leave newsletter signup untracked in Meta/Facebook; require a Meta/Facebook event on successful signup.
  - Chosen: Require a Meta/Facebook event on successful signup.
  - Why: The user explicitly asked to confirm the current behavior and add the missing requirement if absent.

## Validation Plan (User-Facing)

- How the user will verify “done”: Trigger each supported event in a test-safe way and confirm the internal notification email arrives with the expected event details while the underlying user action still succeeds.
- Rollout notes (if any): Start with the currently known event surfaces plus failed payment-related events and success-link reissue events.
- AC1 -> Complete a successful booking purchase and verify one internal email arrives with purchase context, customer email, and available booking or payment identifier.
- AC2 -> Submit a successful newsletter signup from the booking flow and verify one internal email arrives identifying the booking-flow signup.
- AC3 -> Submit a successful newsletter signup from a guide/content page and verify one internal email arrives identifying the content-page signup.
- AC4 -> Trigger or simulate a terminal customer-facing payment failure and a paid-but-not-confirmed mismatch, then verify one internal email arrives for each scenario with the relevant failure context.
- AC5 -> Trigger a success-link reissue and verify one internal email arrives identifying the reissue event and affected customer.
- AC6 -> Configure multiple internal recipients and verify each supported event sends one notification to each configured recipient.
- AC7 -> Simulate or observe a notification delivery failure and verify the purchase or signup still succeeds while a traceable failure log is recorded.
- AC8 -> Review the delivered email content for each supported event and verify the event type and required follow-up are clear without consulting application logs or code.
- AC9 -> Complete a successful newsletter signup from each supported surface and verify the expected Meta/Facebook signup event appears in the configured test/debug tooling.
- AC10 -> Exercise supported event flows with retry or replay conditions where practical and verify obvious duplicate internal emails are avoided for the same outcome.
- AC11 -> Replay or re-trigger a successful newsletter signup outcome under duplicate-risk conditions and verify Meta/Facebook records only one effective signup conversion for that outcome.
- AC12 -> Complete a successful newsletter signup and verify the signup tracking first appears in the shared client-side data layer, then confirm GTM maps that signal to Meta/Facebook in the configured debug tooling.
- AC13 -> Configure a shared default recipient list plus one event-specific override, then verify default-routed events use the shared list and the overridden event uses its specific recipient routing.
