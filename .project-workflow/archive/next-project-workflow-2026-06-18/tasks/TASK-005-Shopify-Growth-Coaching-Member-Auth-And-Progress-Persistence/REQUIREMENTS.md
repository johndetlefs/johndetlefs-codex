# Requirements

## Summary

- Task: TASK-005
- Title: Shopify Growth Coaching Member Auth And Progress Persistence
- Last updated: 2026-06-02

## Overview

Upgrade the Shopify Growth Coaching member area from the TASK-004 MVP into a real pilot-ready member system. The current MVP has invite-code access and browser-local progress. This task should use the enabled email magic-link authentication, restrict access to approved coaching members, persist member checklist progress and saved setup responses in Firestore, and give John a practical way to review member readiness before coaching calls.

## User Story

As a Shopify Growth Coaching member, I want to log in with my real email and have my checklist work saved, so that I can continue setup across visits and John can see what I have completed before coaching.

## Goal

Replace the MVP invite-code/member-area storage with a real Shopify Growth Coaching member access and persistence flow: members authenticate by email magic link, only approved members can access the member area, their checklist progress and saved setup responses persist in Firestore, and John can inspect member progress before coaching calls.

## Non-Goals

- No billing or subscription enforcement in this task.
- No full learning-management-system build.
- No checklist authoring UI for John.
- No multi-role team permissions beyond a practical operator/admin progress view.
- No Shopify store OAuth or Shopify customer-account login.
- No migration of historical browser-local progress unless a specific pilot member needs manual recovery.

## Users & Context

- Initial users are the first Shopify Growth Coaching members who are non-technical Shopify store owners.
- Authentication has moved toward real email magic-link login, so the member area should stop relying on a shared invite code as the main gate.
- The current Module 1 checklist captures meaningful setup responses: Shopify admin URL, derived store handle, duplicated approval theme reference, checklist completion state, and future task/module answers.
- John needs to see whether each member is stuck, which tasks are complete, and which saved details they have entered before coaching calls.
- The app already has Firestore service-account patterns, customer identity helpers, and a browser-local member-area MVP that can be extended.
- A coaching workspace represents one member-store coaching context. Most pilot members will have one workspace, but the data model should support multiple stores later without reshaping member identity records.

## Requirements (Outcome-Focused)

- A visitor can request a magic login link with their email address.
- A visitor cannot access `/members` or `/members/modules/*` unless their authenticated email belongs to an active coaching member record.
- The member session should be tied to the verified Firebase Auth magic-link email, not just a typed email plus shared code.
- Firebase Auth should be the source of verified identity. The member area should bridge the verified Firebase user into server-side route protection, member access checks, and Firestore progress persistence.
- Member records should live in Firestore at `shopifyGrowthMembers/{customerKey}` and include at minimum: normalized email, customerKey, display name or first name when known, status, created/updated timestamps, operator role/flags where relevant, and allowed module access.
- For the first pilot, active member records should be created manually in Firestore rather than through a new member-management UI.
- Store-specific coaching workspaces should live in a top-level Firestore collection at `shopifyGrowthWorkspaces/{workspaceId}`.
- Workspace records should include at minimum: workspaceId, customerKey, normalized member email, member display-name snapshot where useful, storeKey, Shopify store handle, Shopify admin URL, duplicated approval theme reference, status, current module or task summary, progress summary, created/updated timestamps, and lastActivityAt.
- When an active member first saves their Shopify admin URL/store handle in Module 1 Step 4, the app should create or update the matching workspace and link it to the member record.
- Workspace IDs should be deterministic where practical from the member customerKey plus normalized store identity, so repeated saves for the same member/store update the same workspace rather than creating duplicates.
- Checklist progress should persist in Firestore by workspace and module under `shopifyGrowthWorkspaces/{workspaceId}/progress/{moduleId}`.
- Saved member responses should persist in Firestore, including Shopify admin URL, store handle, duplicated approval theme name or ID, and future per-task response fields.
- Task completion should store completion state plus useful timestamps such as completedAt and updatedAt.
- The member UI should hydrate from Firestore on load and continue to enforce sequential task and module locking.
- The member UI should save changes to Firestore as the member works through tasks, while keeping the interface responsive.
- Existing browser-local progress should not be imported. Firestore-backed members should start from clean persisted state.
- Future member tools, feature ideas, and Shopify-specific project workflow setup records should attach to the workspace where they are store-specific.
- Reports or lead magnets that may exist before membership can remain in their existing top-level collections, but should link forward by customerKey, storeKey, and workspaceId when a member workspace exists.
- John should have a simple way to inspect member progress and saved responses for the initial pilot members.
- The operator progress view should be an in-app read-only admin-style area, such as `/admin/members`, where an approved operator can see a list of members and click into member progress details.
- The operator progress view should be protected by Firebase Auth plus an operator allowlist/role, not by public URLs or obscurity.
- Firestore writes should reuse existing service-account REST patterns where practical and avoid exposing Firebase service credentials to the browser.
- Customer identity should reuse existing `customerKey` conventions so member records can later connect to bookings, reports, and payment data.
- Production configuration should fail closed if auth or Firestore member persistence is missing.
- The old invite-code login should either be removed or clearly demoted to a local-development fallback only.

## Acceptance Criteria (Verifiable)

- Visiting `/members` while logged out redirects to the real magic-link login/request flow.
- Submitting an email for magic-link login uses Firebase Auth email-link authentication.
- A verified active member email can open `/members` and `/members/modules/ai-assisted-shopify-setup`.
- A verified email that is not an active member cannot access the member area and sees a clear access message.
- A signed-in active member can complete checklist tasks and refresh the page without losing progress.
- The Shopify admin URL saved in Step 4 creates or updates the member's workspace record and still appears after reload.
- The duplicated approval theme reference saved in Step 5 persists against the same workspace and still appears after reload.
- Step 8 continues to inject the saved admin URL, derived store handle, and duplicated approval theme into the copyable Codex prompt after reload.
- Module 2 remains locked until Module 1 is complete, using Firestore-backed progress.
- John can view each pilot member, their workspace, module progress, completed tasks, saved Shopify admin URL, store handle, and duplicated approval theme reference.
- The implementation does not expose Firestore service-account credentials, magic-link secrets, or private member data to the browser.
- `npm run lint` passes.
- `npm run build` passes.
- Browser QA covers login, unauthorized member access, authorized member progress persistence, saved response persistence, and operator progress visibility.

## Open Questions (Answer Needed)

- None blocking.

## Decisions (Resolved)

- Firestore should be the source of truth for member progress once real authentication is active.
- Firebase Auth email-link authentication is the verified identity source for members.
- TASK-005 should bridge the verified Firebase Auth user into server-side member route protection and Firestore persistence. The app must not trust an email typed into a form without Firebase Auth verification.
- The implementation may add the Firebase client SDK and a server-side Firebase token/session verification path if those are not already present locally.
- Active member records should be created manually in Firestore for the first pilot rather than adding a member-management UI in this task.
- Initial active pilot member: Alexandra Coccia, `alex@alessavino.com.au`.
- TASK-005 includes a read-only operator progress view, likely under `/admin/members`, with a member list and member detail view.
- Operator access should use the same Firebase Auth identity model with an operator allowlist or role in Firestore.
- Existing browser-local MVP progress should not be imported. Firestore-backed authenticated member progress starts clean.
- Firestore member records should use `shopifyGrowthMembers/{customerKey}`.
- Firestore store-specific coaching workspaces should use top-level records at `shopifyGrowthWorkspaces/{workspaceId}`.
- Firestore progress records should use a workspace-owned subcollection at `shopifyGrowthWorkspaces/{workspaceId}/progress/{moduleId}`.
- Member records are for person/access identity. Workspace records are for a member-store coaching context, including store setup details, progress summary, and links to store-specific tools or future project workflow records.
- A workspace should be created or updated when an active member first saves the Shopify admin URL/store handle in Module 1 Step 4.
- Workspace IDs should be deterministic from customerKey plus normalized store identity where practical, to avoid duplicate workspace records for the same member/store.
- The initial implementation may use a deterministic primary workspace ID from customerKey so early Module 1 tasks can persist before Step 4 captures store identity. Step 4 then populates the store handle, storeKey, and Shopify admin URL on that workspace.
- Future member tools and Shopify-specific project workflow artifacts should attach to the workspace when they are store-specific.
- Pre-membership reports and lead magnets can remain in their existing top-level collections, then link to a workspace by customerKey, storeKey, and optional workspaceId when available.
- Member identity should be keyed from normalized email using the existing `customerKey` pattern.
- Module/checklist content can remain code-defined for this task; persistence stores member state and responses, not checklist authoring content.
- The first production-grade persistence target is the current Module 1 setup checklist, including admin URL, store handle, duplicated theme reference, task completion, and timestamps.
- Clarification rerun on 2026-06-02 found no new blocking questions after adopting the member plus top-level workspace/store model.

## Validation Plan

- Confirm required auth and Firestore environment variables are documented and fail closed when missing.
- Use one active pilot test member and one inactive/non-member email in browser QA.
- Verify authorized member login, dashboard access, module access, sequential task locking, workspace creation/update, completion persistence, saved response persistence, and Step 8 prompt replacement after reload.
- Verify unauthorized authenticated users cannot access member routes.
- Verify John/operator progress view shows the test member, workspace, current module state, and saved setup details.
- Run `npm run lint`.
- Run `npm run build`.
