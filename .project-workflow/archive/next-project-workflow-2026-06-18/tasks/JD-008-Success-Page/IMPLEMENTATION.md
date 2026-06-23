## User Story

As a customer who has completed booking and payment, I want a success page with a prep video, a pre-call checklist I can track, and an optional Loom URL field, so that I can prepare effectively and share relevant context before the call.

## Goal

- Deliver a secure, no-account post-booking success experience where customers can complete pre-call tasks, save/edit a Loom URL, and revisit via signed token links.

## Approach

- Implement this as vertical slices: first secure access and data model, then user-facing interactions, then resilience/observability.
- Reuse existing booking record patterns and API conventions in `app/api/booking/*` to keep scope tight and reduce risk.
- Keep customer-only edit capability in-product; reserve internal DB edits for support-only exceptions.

## Phases

### Phase 1

- Changes: Add signed reusable booking token access model (30-day TTL), secure token verification on success data endpoints, and expired-token reissue flow that emails a fresh link to booking email.
- Validation: Verify valid token access works, cross-booking access is denied, and expired links can request and use refreshed links.
- Tracker updates: Keep story status as `Analysing` during planning and implementation prep.

### Phase 2

- Changes: Deliver success-page prep UX (video, checklist, Loom URL input), persist checklist status + `completed_at`, persist/edit Loom URL, hydrate saved data on revisit, add logging for save/reissue outcomes, and include security/release hardening deliverables.
- Validation: Verify AC-by-AC behavior for checklist persistence, Loom URL validation/editing, revisit data hydration, non-functional expectations, and release-readiness checks.
- Tracker updates: Move to `Plan Confirmed` only after user confirms this plan; then `In Progress` when implementation starts.

## Task List (for IMPLEMENTATION.md)

|  ID | Title                                          | Description                                                                                                                                                                                         | Acceptance Criteria                                                                                                                                                                                                                                                                                                                                                 | User Verification                                                                                                                                                                                                                                                                                                                                                    | Status   |
| --: | ---------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
|   1 | Secure token-gated success access              | Success-page data access uses signed reusable booking tokens (30-day validity) instead of identifier-only access so customers can revisit without accounts while preventing cross-booking exposure. | - Valid token grants access to matching booking success data (AC4, AC8).<br>- Invalid/tampered token is rejected with safe error state (AC5).<br>- Token is reusable until TTL expiry and bound to one booking context (AC5, AC8).                                                                                                                                  | - Complete a booking and open success link; confirm page loads prep data.<br>- Modify token value and confirm access is denied.<br>- Re-open same valid link next day and confirm access still works.                                                                                                                                                                | Complete |
|   2 | Expired-link recovery without accounts         | When token is expired, customer can request a new secure link sent to booking email so checklist/Loom updates remain possible without account creation.                                             | - Expired token path shows reissue option (AC9).<br>- Reissue sends fresh secure link to booking email on file (AC9).<br>- Fresh link grants access and keeps booking scoped correctly (AC5, AC9).                                                                                                                                                                  | - Force/simulate token expiry, open link, request new link, and confirm recovery email flow completes.<br>- Open refreshed link and confirm checklist/Loom data can be viewed/updated.                                                                                                                                                                               | Complete |
|   3 | Initial success-page content baseline          | Success page ships with finalized v1 content: prep video embed, checklist copy, and support messaging text, so the page is production-ready before persistence wiring.                              | - Success page displays finalized heading/body copy for post-booking context (AC1).<br>- Prep video is embedded using the approved source and renders on desktop/mobile (AC1).<br>- Checklist item text exactly matches approved v1 wording including support contact line (AC1).                                                                                   | - Complete booking flow and open success page on desktop and mobile widths; confirm heading/body copy, video, and checklist text match approved content.<br>- Confirm support instruction references john@johndetlefs.com in the checklist item text.                                                                                                                | Complete |
|   4 | Checklist persistence with timestamps          | Success page displays required checklist items and persists per-item status plus completed_at for reminder/reporting readiness.                                                                     | - Three required checklist items are displayed on success page (AC1).<br>- Toggling an item persists status to booking record and reloads correctly on revisit (AC2, AC4).<br>- Each completed item records completed_at timestamp in stored data (AC10).<br>- Setting an item incomplete clears completed_at; completing again writes a fresh completed_at (AC11). | - Toggle each checklist item, refresh page, and confirm persisted state remains.<br>- Mark an item complete and verify completed_at is present in persisted record.<br>- Set that item incomplete and verify completed_at clears, then complete again and verify a newer timestamp is stored.<br>- Revisit using token link and confirm checklist state is hydrated. | Complete |
|   5 | Customer Loom URL capture and update           | Customer can add and edit an optional Loom URL on success page with valid-URL checking and booking-scoped persistence.                                                                              | - Customer can save optional Loom URL to booking record (AC3).<br>- Input accepts valid URL formats and rejects invalid URL strings with clear feedback (AC6).<br>- Customer can edit previously saved URL and latest value persists on revisit (AC7, AC4).                                                                                                         | - Enter a valid Loom URL and save; refresh and confirm value persists.<br>- Try invalid text input and confirm validation message blocks save.<br>- Update saved URL and confirm new value is shown after revisit.                                                                                                                                                   | Complete |
|   6 | Accessibility and observability for prep flows | Success prep interactions (video, checklist, Loom save/reissue) meet baseline accessibility and produce actionable logs for support/debugging.                                                      | - Checklist and Loom interactions are keyboard-operable with understandable labels/messages (NFR accessibility).<br>- Save/reissue success and failure events are logged with booking correlation context (NFR observability).<br>- Primary success page content loads without blocking prep actions (NFR performance).                                             | - Navigate and operate checklist/Loom controls using keyboard only and confirm usable flow.<br>- Trigger successful and failing save/reissue actions and confirm logs are emitted with expected context.<br>- Complete end-to-end booking-to-success flow and confirm prep content is promptly available.                                                            | Complete |
|   7 | Reissue abuse protection and throttling        | The expired-link reissue flow is protected against spam/abuse with bounded retries and observability so support can detect misuse.                                                                  | - Reissue endpoint enforces rate limits/cooldown per booking and requester context.<br>- Excess attempts are denied with stable user-facing response that does not leak booking existence.<br>- Abuse and throttling outcomes are logged for monitoring and support triage.                                                                                         | - Trigger repeated reissue requests beyond threshold and confirm throttled response is returned.<br>- Confirm normal request still works within limits.<br>- Verify throttling and abuse events appear in logs.                                                                                                                                                      | Complete |
|   8 | Token key and lifecycle hardening              | Token signing and verification use managed secrets with documented rotation behavior so security posture is durable after launch.                                                                   | - Token signing key is sourced from required environment config and validated at startup.<br>- Rotation procedure is defined and tested so new tokens use new key while configured verification behavior for existing valid tokens is explicit.<br>- Missing/invalid key configuration fails safely with actionable error logging.                                  | - Start app with valid key config and confirm token issue/verify succeeds.<br>- Simulate missing/invalid key config and confirm safe failure path.<br>- Execute documented rotation test and confirm expected behavior for old/new links.                                                                                                                            | Complete |
|   9 | Release readiness AC signoff                   | A final release checklist confirms all acceptance criteria and critical failure paths are validated before marking story ready for implementation completion.                                       | - A single signoff pass covers AC1-AC14 end-to-end with pass/fail evidence.<br>- Critical negative-path checks are included (tampered token, expired token, invalid Loom URL, throttled reissue, invalid/missing token key configuration handling).<br>- Any failed check blocks completion until resolved or explicitly accepted as risk.                          | - Run the release checklist end-to-end in a staging-like environment and record outcomes for each AC.<br>- Verify negative-path scenarios are executed and results captured.<br>- Confirm unresolved failures are tracked before status can move toward Complete.                                                                                                    | Complete |

## Files / Areas Likely to Change

- `app/success/page.tsx`
- `app/api/booking/*` (new or updated success-data/token/reissue routes)
- `app/api/booking/_lib/payment-lifecycle.ts` (or adjacent booking data utilities)
- `app/booking/page.tsx` (redirect URL generation to tokenized success link)
- Potential shared helpers under `app/_lib/*` for token validation and URL validation

## Data / RLS / RPC / Migrations

- Persist new booking fields for success prep data: checklist item statuses + `completed_at` and Loom URL.
- If token metadata is stored server-side, add token expiry/reissue fields scoped to booking records.
- Firestore-backed data path is expected (no SQL/RLS migration in current architecture).
- Internal support edits to Loom URL remain out-of-band direct DB updates in v1 (not app-surface capability).

## Risks & Mitigations

- Risk: Token leakage could expose booking prep data.
  - Mitigation: Signed tokens, booking-bound claims, 30-day TTL, strict server-side verification, and safe error responses.
- Risk: Expired-link recovery could be abused for email spam.
  - Mitigation: Rate-limit reissue endpoint and log repeated failures/attempts.
- Risk: Inconsistent checklist timestamp behavior could break future reminder logic.
  - Mitigation: Define deterministic `completed_at` update rules and cover with explicit task-level validation.
- Risk: Scope creep into admin tooling delays delivery.
  - Mitigation: Keep admin editing out of product scope for v1; document support-only DB override path.

## Notes

- Task: JD-008
- Title: Success Page
- Created: 2026-03-18
- Work item 9 signoff artifact: `tasks/JD-008-Success-Page/RELEASE_SIGNOFF.md` (local validation run recorded 2026-03-19)
- Work item 9 marked Complete on 2026-03-19 after automated validation + user-confirmed manual checks.
