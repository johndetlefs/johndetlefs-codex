## Overview

- Goal (in user terms): Help customers prepare for their booked call after payment by giving them clear post-booking guidance and preparation tools.
- Primary user(s): Customers who completed booking and payment.
- Desired outcome: The customer can watch a prep video, complete preparation tasks, optionally share a Loom URL, and have progress saved to their booking record.

## User Story

As a customer who has completed booking and payment, I want a success page with a prep video, a pre-call checklist I can track, and an optional Loom URL field, so that I can prepare effectively and share relevant context before the call.

## In Scope

- Display a success page experience after successful booking/payment redirect.
- Show a prep video on the success page.
- Show a checklist of pre-call tasks on the success page, including:
  - Add john@johndetlefs.com as a collaborator to the customer's Shopify instance.
  - Create a Loom video showing the exact problem the customer needs to solve.
  - Verify the booking email has arrived; if not, contact john@johndetlefs.com for support.
- Allow checklist task status updates and persist status under the customer's booking record in the database.
- Allow the customer to provide an optional Loom URL and persist it under the same booking/customer context.

## Out of Scope

- Redesigning the booking/payment flow before redirect.
- Building call-delivery functionality itself.
- Replacing existing CRM/workflow systems beyond storing prep status and optional Loom URL.

## Requirements

List requirements as outcomes/expectations, not implementation details.

### Functional Requirements

- The product must route customers who complete booking/payment to a success page that includes preparation guidance.
- The success page must display at least one prep video intended to help customers prepare for the upcoming call.
- The success page must present a checklist of required or recommended preparation tasks.
- The checklist must include these v1 items:
  - Add john@johndetlefs.com as a collaborator to Shopify.
  - Create a Loom video showing the exact problem to solve.
  - Verify booking email receipt or contact john@johndetlefs.com for support.
- A customer must be able to mark checklist items complete/incomplete.
- Checklist completion state must be stored and retrievable for that specific booking/customer record.
- Checklist persistence must store per-item status plus completed_at timestamp in v1.
- When a checklist item is set to incomplete, `completed_at` must be cleared; when it is later set complete again, `completed_at` must be set to the new completion timestamp.
- The success page must provide an optional input for a Loom video URL.
- The Loom URL (when provided) must be stored and retrievable for that specific booking/customer record.
- On revisit, the success page must show the latest saved checklist status and Loom URL for the same booking/customer.
- The customer must be allowed to edit the Loom URL after initial save.
- Loom input must accept any valid URL.
- Customer access to success-page booking data must use a signed booking token link that does not require account creation/login.
- The signed booking token must be reusable and valid for 30 days.
- If token access is expired, the customer must be able to request a fresh secure link to the booking email address on file.
- Internal team edits to Loom URL are out-of-band for v1 and may be performed directly in the booking database record only for support exceptions.

### Non-Functional Requirements

- Performance / latency: The success page should render primary content quickly enough that customers can immediately begin prep; save operations should provide timely confirmation.
- Security / permissions: Stored checklist state and Loom URL must be scoped to the correct booking/customer context and not exposed across customers.
- Security / abuse protection: Expired-link reissue must be rate-limited and return non-enumerating responses that do not disclose whether a booking exists.
- Security / key management: Token signing key configuration must be required and validated, with documented/tested rotation behavior for active links.
- Accessibility: Video and checklist interactions must be keyboard accessible and screen-reader understandable.
- Observability (logs/metrics/audit expectations): Record success/failure of checklist and Loom URL save actions for debugging and support.
- Release governance: Story completion requires an explicit AC signoff pass across positive and negative-path scenarios before moving to Complete.

## Acceptance Criteria

- AC1: After successful booking/payment redirect, the customer sees a success page that includes a prep video and checklist.
- AC2: The customer can update checklist item status, and updates persist to the matching booking/customer record.
- AC3: The customer can save an optional Loom URL to the same booking/customer record.
- AC4: When the customer revisits the success page for the same booking/customer, previously saved checklist state and Loom URL are shown.
- AC5: Customers cannot view or modify checklist/Loom data for other customers' bookings.
- AC6: Loom URL input accepts any valid URL format.
- AC7: The customer can edit a previously saved Loom URL from the success-page flow.
- AC8: A customer can revisit and update checklist/Loom data via a valid signed booking token link without creating an account.
- AC9: If the signed token is expired, the customer can request and receive a new secure access link via booking email.
- AC10: Checklist records include per-item completion status and completed_at timestamp for reminder/reporting readiness.
- AC11: If an item is toggled to incomplete, completed_at is cleared; if toggled complete again, completed_at is repopulated with the latest completion time.
- AC12: Reissue endpoint enforces throttling/cooldown and returns safe non-enumerating responses under abuse conditions.
- AC13: Token key configuration is mandatory, fails safely when invalid/missing, and rotation behavior is documented and verified.
- AC14: A final release signoff checklist demonstrates AC1-AC13 coverage including required negative-path tests.

## Assumptions

- A stable booking/customer identifier is available on success-page load to scope reads/writes.
- The success page may be revisited by the same customer after the initial redirect.
- The prep video source/content is available by launch.

## Open Questions

- None currently.

## Decisions Log

- Decision:
  - Context: Post-booking customer success experience.
  - Options considered: Keep current minimal success page vs add preparation workflow.
  - Chosen: Add prep video, checklist, and optional Loom URL on success page.
  - Why: User stated these are required to prepare customers before the call.
- Decision:
  - Context: Data ownership for preparation progress.
  - Options considered: Client-only transient state vs persistence per booking/customer.
  - Chosen: Persist checklist status and Loom URL under customer/booking in the database.
  - Why: User explicitly requested status be stored under that customer/booking.
- Decision:
  - Context: v1 checklist content.
  - Options considered: Generic placeholder checklist vs specific operational checklist.
  - Chosen: Use three specific tasks (Shopify collaborator, Loom problem video, booking email verification/support path).
  - Why: User provided concrete checklist items for launch.
- Decision:
  - Context: Loom URL validation strictness.
  - Options considered: loom.com only vs any valid URL vs free text.
  - Chosen: Accept any valid URL.
  - Why: User selected any valid URL.
- Decision:
  - Context: Revisit access model for success-page checklist and Loom URL without customer accounts.
  - Options considered: Signed token link vs account login vs booking reference/email lookup.
  - Chosen: Signed, reusable booking token link (30-day validity), with expired-link recovery by emailing a fresh secure link to the booking email on file.
  - Why: Preserves low-friction no-account UX while improving access control versus identifier-only links.
- Decision:
  - Context: Internal-team Loom URL edits for v1 scope.
  - Options considered: Internal admin UI vs direct DB/tooling edits vs shared customer route with elevated auth.
  - Chosen: Keep customer-only Loom URL editing in product flow for v1; allow direct DB record updates only for exceptional support cases.
  - Why: Reduces auth/UI complexity while preserving a practical support fallback.
- Decision:
  - Context: Checklist persistence depth needed for future reminder workflows.
  - Options considered: Status-only vs status+completed_at vs full event history.
  - Chosen: Store status plus completed_at timestamp per checklist item in v1.
  - Why: Supports future daily reminder logic and useful reporting while keeping complexity moderate.
- Decision:
  - Context: `completed_at` semantics when checklist items are toggled incomplete and later re-completed.
  - Options considered: Reset/rewrite timestamp vs preserve original timestamp forever vs dual-timestamp model.
  - Chosen: Clear `completed_at` on incomplete, then set a fresh `completed_at` on re-completion.
  - Why: Best matches reminder timing and current-state accuracy with minimal schema complexity.
- Decision:
  - Context: Planning completeness for security and launch quality controls.
  - Options considered: Keep hardening/signoff implicit vs make them explicit deliverables.
  - Chosen: Add explicit deliverables for reissue abuse protection, token key lifecycle hardening, and release AC signoff.
  - Why: User requested these be specifically tracked and verifiable in the work items.

## Validation Plan (User-Facing)

- How the user will verify "done":
  - AC1 -> Complete a booking/payment flow and confirm success page shows prep video and checklist.
  - AC2 -> Mark checklist items complete/incomplete, refresh/reopen the page, and verify state remains.
  - AC3 -> Enter a Loom URL, save, refresh/reopen, and verify the URL remains linked to the same booking/customer.
  - AC4 -> Return later to the same booking success page and confirm previously saved data is loaded.
  - AC5 -> Attempt access with a different customer/booking context and confirm data is not exposed or mutable.
  - AC6 -> Enter representative valid URLs and confirm they are accepted and saved.
  - AC7 -> Update Loom URL as customer and confirm latest value persists on revisit.
  - AC8 -> Open success page via valid token link the next day and confirm checklist/Loom edits still persist without account login.
  - AC9 -> Use an expired token link, request a new link, then access and update data using the refreshed link.
  - AC10 -> Complete a checklist item, verify completed_at is populated; uncomplete/recomplete and verify status/timestamp behavior matches expected save rules.
  - AC11 -> Complete an item, then set it incomplete and verify completed_at clears; complete it again and verify completed_at is a newer timestamp.
  - AC12 -> Submit repeated reissue requests beyond threshold and verify throttled, non-enumerating response behavior and logging.
  - AC13 -> Validate token operations with correct key config, then simulate missing/invalid key and verify safe failure behavior; execute rotation test scenario.
  - AC14 -> Run and record a release signoff checklist covering AC1-AC13 plus negative-path scenarios before marking the story complete.
