## User Story

As a Shopify Growth Coaching member, I want to log in with my real email and have my checklist work saved, so that I can continue setup across visits and John can see what I have completed before coaching.

## Goal

Upgrade the Shopify Growth Coaching member area from the TASK-004 MVP into a pilot-ready system with Firebase Auth email-link login, Firestore-backed member access and progress, and a read-only operator view for John.

## Approach

- Use Firebase Auth email-link authentication as the verified identity source.
- Bridge the verified Firebase user into server-side member route protection and persistence.
- Replace production invite-code access with Firebase Auth, keeping any local fallback explicitly development-only.
- Store active member records at `shopifyGrowthMembers/{customerKey}` for person/access identity.
- Store member-store coaching workspaces at `shopifyGrowthWorkspaces/{workspaceId}`.
- Create or update the workspace when an active member first saves their Shopify admin URL/store handle in Module 1 Step 4.
- Use a deterministic primary workspace ID from customerKey for the first workspace so early Module 1 tasks can persist before store identity is saved.
- Store module progress at `shopifyGrowthWorkspaces/{workspaceId}/progress/{moduleId}`.
- Keep store-specific member tools, Shopify setup records, and future project workflow artifacts attached to the workspace where practical.
- Keep pre-membership reports and lead magnets in their existing collections, but link them to customerKey, storeKey, and optional workspaceId when available.
- Start Firestore progress clean; do not import existing browser-local MVP state.
- Keep checklist/module content code-defined for this task; persist only member state, saved responses, and timestamps.
- Add a protected, read-only `/admin/members` operator surface with member, workspace, and progress detail views.
- Reuse existing Firestore service-account REST patterns and customer identity helpers where practical.

## Phases

### Phase 1: Firebase Auth Bridge

- Build or wire the Firebase Auth email-link login flow into the member area.
- Verify Firebase identity server-side before creating or trusting a member session.
- Remove the invite-code path from production access.
- Validation: logged-out users redirect to login, Firebase-authenticated users resolve to the correct verified email, and typed-only email access is impossible.

### Phase 2: Member Access And Workspace Stores

- Add Firestore helpers for `shopifyGrowthMembers/{customerKey}` active member records.
- Add Firestore helpers for `shopifyGrowthWorkspaces/{workspaceId}` workspace records.
- Create or update a workspace from the saved Shopify admin URL/store handle in Module 1 Step 4.
- Add or document the first manual pilot member record for Alexandra Coccia.
- Validation: active member access passes, non-member access fails, workspace creation/update works, and service credentials remain server-only.

### Phase 3: Server-Backed Workspace Progress

- Hydrate Module 1 from Firestore.
- Persist task completion, timestamps, Shopify admin URL, store handle, and duplicated approval theme reference under the active workspace.
- Preserve sequential task and module locking.
- Validation: saved responses and completion state survive reload and still populate Step 8 prompt text.

### Phase 4: Operator Member And Workspace View

- Add `/admin/members` and member detail pages or equivalent route shape.
- Protect operator routes with Firebase Auth plus operator allowlist/role.
- Render read-only member, workspace, progress, and saved setup details.
- Validation: John/operator can inspect Alexandra's state; non-operators cannot access the view.

### Phase 5: Production Hardening And QA Gate

- Document required Firebase Auth and Firestore environment variables.
- Add clear auth/access/save failure states.
- Run lint, build, browser QA, and QA/code review before completion.

## Tasks

|  ID | Title | Description | Acceptance Criteria | User Verification | Status |
| --: | ----- | ----------- | ------------------- | ----------------- | ------ |
|   1 | Firebase Auth member login | Replace production invite-code access with Firebase Auth email-link authentication and bridge the verified Firebase user into server-side member sessions or route checks. | - `/members/login` uses Firebase Auth email-link flow.<br>- Verified Firebase email is the only trusted member identity source.<br>- Production invite-code access is removed or explicitly local-only.<br>- Logout clears Firebase/member session state.<br>- Missing Firebase auth config fails closed. | - Visit `/members` logged out and confirm redirect to login.<br>- Request and complete Firebase email-link login.<br>- Confirm `/members` opens only after Firebase verification.<br>- Try typed-email-only access and confirm it fails. | Testing |
|   2 | Active member Firestore gate | Add active member lookup at `shopifyGrowthMembers/{customerKey}` and use it to gate member routes. | - Alexandra Coccia can be represented as active member `alex@alessavino.com.au`.<br>- Active member records include customerKey, email, displayName, status, timestamps, and allowed module access.<br>- Authenticated non-members cannot access member routes.<br>- Firestore service credentials are server-only. | - Create or seed Alexandra's active member document.<br>- Log in as Alexandra and confirm member access.<br>- Log in with a non-member test email and confirm no-access state.<br>- Inspect server/client bundles for no service credential exposure. | Testing |
|   3 | Coaching workspace Firestore model | Add top-level workspace records at `shopifyGrowthWorkspaces/{workspaceId}` for the member-store coaching context. | - Workspace records include workspaceId, customerKey, member email snapshot, storeKey, store handle, Shopify admin URL, approval theme reference, status, progress summary, and timestamps.<br>- Workspace IDs are deterministic from customerKey plus normalized store identity where practical.<br>- Saving Module 1 Step 4 creates or updates the same workspace for the same member/store.<br>- Member records keep only identity/access plus workspace summary or references. | - Log in as Alexandra and save a Shopify admin URL in Step 4.<br>- Inspect Firestore and confirm the workspace document exists with linked customerKey/storeKey.<br>- Save the same store again and confirm the workspace updates rather than duplicating. | Testing |
|   4 | Workspace progress Firestore persistence | Add progress reads/writes under `shopifyGrowthWorkspaces/{workspaceId}/progress/{moduleId}` for task states and saved setup responses. | - Progress document stores moduleId, task states, completedAt/updatedAt timestamps, and responses.<br>- Responses include shopifyAdminUrl, storeHandle, and approvalThemeReference.<br>- Existing browser-local progress is not imported.<br>- Firestore workspace progress is the source of truth after auth. | - Save sample Module 1 progress and inspect Firestore under the workspace.<br>- Reload and confirm state is loaded from Firestore.<br>- Confirm localStorage-only data does not create imported progress. | Testing |
|   5 | Server-backed checklist UI | Convert the Module 1 checklist to hydrate and save through server-backed workspace progress while preserving current UX. | - Sequential task locking still works.<br>- Module locking still works.<br>- Step 4 admin URL saves to the workspace and appears after reload.<br>- Step 5 duplicated approval theme saves to the same workspace and appears after reload.<br>- Step 8 prompt includes persisted admin URL, store handle, and approval theme after reload.<br>- Save failures show clear member-facing errors. | - Log in as Alexandra.<br>- Complete tasks, save Step 4 and Step 5 details, reload, and confirm state persists.<br>- Copy Step 8 prompt and confirm persisted values are included.<br>- Temporarily force a save failure and confirm a clear error state. | Testing |
|   6 | Read-only operator member and workspace view | Add protected `/admin/members` list/detail views for John to inspect pilot members, their workspaces, progress, and saved setup responses. | - Operator routes require Firebase Auth plus operator allowlist/role.<br>- Member list shows active members and high-level workspace/module progress.<br>- Detail view shows workspace details, task progress, current task, saved admin URL, store handle, duplicated theme, and updated timestamps.<br>- Non-operators are blocked. | - Log in as an operator and open `/admin/members`.<br>- Click Alexandra and confirm her workspace and Module 1 state are visible.<br>- Log in as non-operator and confirm admin routes are denied. | Testing |
|   7 | Production configuration and docs | Document and enforce Firebase Auth, Firestore, member collection, workspace collection, and operator allowlist configuration. | - Required env vars are documented.<br>- Missing auth or persistence config fails closed.<br>- Collection paths are documented as `shopifyGrowthMembers/{customerKey}`, `shopifyGrowthWorkspaces/{workspaceId}`, and workspace `progress/{moduleId}`.<br>- Local development fallback behavior is explicit. | - Review docs/env notes.<br>- Run with missing config and confirm protected routes do not open accidentally.<br>- Confirm production invite-code behavior is disabled. | Testing |
|   8 | Validation and QA/code review gate | Complete validation and QA/code review before marking TASK-005 complete. | - `npm run lint` passes.<br>- `npm run build` passes.<br>- Browser QA covers logged-out, active member, non-member, workspace creation/update, progress persistence, saved responses, Step 8 prompt, operator view, and non-operator admin denial.<br>- QA/code review findings are addressed or recorded. | - Review validation notes in this file.<br>- Confirm browser QA result covers the full member/admin flow.<br>- Run QA/code review before moving tracker status beyond Testing. | Testing |

## Validation

- 2026-06-02: `npm run lint` passed.
- 2026-06-02: `npm run build` passed.
- 2026-06-02: Browser QA opened `http://localhost:3000/members/modules/ai-assisted-shopify-setup` through the local development session. The module rendered with the server-backed UI code, sequential task locking worked through the first three tasks, and no framework overlay appeared.
- 2026-06-03: Firestore member seed completed in `shopifyGrowthMembers`: Alexandra Coccia `alex@alessavino.com.au` as active member and John Detlefs `johnpdetlefs@gmail.com` as active operator.
- 2026-06-04: Local development preview login was made explicit opt-in via `SHOPIFY_GROWTH_COACHING_ENABLE_DEV_LOGIN=true` so local QA exercises the real Firebase email-link path by default.
- 2026-06-04: Added an operator-only callout on `/members` so John sees an admin entry point to `/admin/members` while still seeing the normal member modules.
- 2026-06-04: `npm run lint` passed.
- 2026-06-04: `npm run build` passed.
- 2026-06-04: Authenticated local render check for John's operator session confirmed `/members` returns 200 with `Admin access`, `View students`, `/admin/members`, and `Your modules`; `/admin/members` returns 200 and includes Alexandra's member record.
- 2026-06-05: Vercel production environment name check confirmed existing Firestore service credentials were present, while `MEMBER_SESSION_SECRET` and `FIREBASE_WEB_API_KEY`/`NEXT_PUBLIC_FIREBASE_API_KEY` were missing.
- 2026-06-05: Added Vercel production env vars `MEMBER_SESSION_SECRET`, `FIREBASE_WEB_API_KEY`, and `NEXT_PUBLIC_SITE_URL` for the live member login flow.
- 2026-06-05: Hardened Firebase magic-link origin resolution so a request from the public domain uses the request host before falling back to Vercel deployment URLs.
- 2026-06-05: `npm run lint` passed after the production-readiness hardening.
- 2026-06-05: `npm run build` passed after the production-readiness hardening.
- 2026-06-05: Final pre-main `npm run lint` and `npm run build` passed after adding the Vercel production env vars.
- Remaining production verification: complete a real Firebase email-link login for an active Firestore member, confirm the live Firestore workspace/progress write, and verify `/admin/members` with John's operator record.

## Notes

- Task: TASK-005
- Title: Shopify Growth Coaching Member Auth And Progress Persistence
- Created: 2026-06-02
- Requirements/clarification completed: 2026-06-02.
- Planner completed: 2026-06-02.
- Clarification rerun for member plus workspace/store shape: 2026-06-02; no blocking questions remain.
- Context: TASK-004 created the member-area MVP with localStorage progress, invite-code session gating, Module 1 checklist pages, saved Shopify admin URL, saved duplicated approval theme reference, and pre-filled Codex setup prompts.
