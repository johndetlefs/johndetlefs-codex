## User Story

As a Shopify Growth Coaching admin/operator, I want member diagnostics to stay inside the coaching workflow and I want read-only access to student module work, so that students are not treated as new public leads and I can review their saved results before coaching them.

As a coaching student, I want Module 3 to use my known member details and save my diagnostic result back to my module, so that I can complete the work without unnecessary sign-up steps or duplicate data entry.

## Goal

Fix the member-area diagnostic and admin visibility gaps without changing the public lead magnet. Member diagnostics should bypass public lead capture side effects while preserving signed report persistence and Module 3 write-back. Admin/operator users should be able to browse all modules and inspect saved student work read-only.

## Approach

- Keep public and member-context diagnostic behavior explicitly separated by the existing `context=member-module-3` signal plus authenticated member session checks.
- Prefer server-side member context for member diagnostics rather than trusting client-submitted email/name/role.
- Gate email/Sendy side effects by flow type: public lead magnet keeps current behavior; member-context diagnostics skip public Sendy/setup/results emails.
- Use existing member workspace/progress records for admin review instead of introducing impersonation.
- Apply the admin module-unlock rule at both module list and direct module page entry points.

## Clarify Pass

- Date: 2026-06-22
- Result: No blocking ambiguity.
- Decision confirmed: member-context diagnostics are coaching workflow actions, not public lead-magnet conversions, so public Sendy/setup/results email side effects should be suppressed for members.
- Decision confirmed: admin/operator review should be read-only and should expose saved module work, especially Module 3 diagnostic outputs, without impersonating a student.
- Scope boundary confirmed: public anonymous Golden Ratio behavior remains unchanged.

## Flow Map

- Member Module 3 links to `/shopify-bottleneck-analysis?context=member-module-3`.
- The diagnostic landing page can already load member defaults, but the client experience still starts at the public lead step and requires role/email/name/store form submission.
- `POST /api/shopify-bottleneck-analysis` currently validates public lead fields, creates the signed report link, enrolls in Sendy, persists Sendy status, and sends the setup email for every request.
- The report setup route already understands member context and can prefill the Shopify admin URL from the member workspace after a signed token exists.
- `PATCH /api/shopify-bottleneck-analysis` already writes member diagnostic results back to Module 3 when the persisted analysis results path carries `context=member-module-3`; it also currently sends the public customer results-ready email whenever an analysis email exists.
- Member dashboard/module locking already supports an `unlockAllModules` prop, but only passes it for the development fallback, not for `operator` users.
- Admin member detail already loads workspaces and module progress records, but it only shows task completion state, not the saved response fields or Module 3 diagnostic outputs.

## Phases

- Phase 1: Audit and map the current diagnostic, module locking, and admin progress views. Confirm the exact data fields already saved for Module 3 and where email side effects are triggered.
- Phase 2: Add a coaching-native member diagnostic entry path. Authenticated member diagnostics should start from known member/store context, request only missing store context, create/load the report record, and bypass public lead capture side effects.
- Phase 3: Preserve and test public diagnostic behavior. Ensure anonymous visitors still use the existing public lead form, Sendy enrollment, setup email, results email, report persistence, and operator notification behavior.
- Phase 4: Unlock admin module browsing. Treat `operator`/admin member context as `unlockAllModules` for dashboard and direct module pages without mutating progress.
- Phase 5: Add read-only admin student work review. Extend admin member detail to expose module saved responses and linked Module 3 outputs per workspace in a scannable way.
- Phase 6: Validate, QA review, and prepare handoff for owner review before merge.

## Acceptance Criteria

- [x] AC1: Opening the Golden Ratio diagnostic from Module 3 as an authenticated member does not show the public lead form requiring email/name/role when member identity exists.
- [x] AC2: Member-context diagnostic entry does not call Sendy enrollment and does not create a newsletter subscription side effect.
- [x] AC3: Member-context diagnostic entry does not send the public report setup email.
- [x] AC4: Member-context result generation does not send the public customer results-ready email.
- [x] AC5: Public lead magnet visitors still see the public lead form and the existing public Sendy/setup/results email behavior remains intact.
- [x] AC6: Member-context diagnostic still creates or loads a signed analysis/report record and can calculate results.
- [x] AC7: Member-context result generation still writes the Golden Ratio summary back into Module 3 progress only for the authenticated matching member/store context.
- [x] AC8: If store/admin context is missing for a member, the UI asks for only the missing store context in member language rather than treating the member as a new public lead.
- [x] AC9: Admin/operator users can see and enter every member module from the member dashboard and direct module URLs.
- [x] AC10: Non-admin students still see locked modules according to the existing sequential progression rules.
- [x] AC11: Admin/operator module browsing does not mutate checklist state, response fields, or student progress just by viewing.
- [x] AC12: Admin/operator users can open a student detail view and inspect saved work for each module/workspace, including completed task states and saved response fields.
- [x] AC13: Admin/operator users can inspect Alex-style Module 3 outputs directly from admin, including linked Golden Ratio report/results and the saved measurement/product/traffic notes when present.
- [x] AC14: Student work review is read-only and remains blocked for non-admin users.
- [x] AC15: Validation covers the member diagnostic path, public diagnostic path, admin all-modules path, student locked-module path, admin student-work review path, and workflow doctor.

## Validation

- AC1-AC4, AC6-AC8: Browser-test member Module 3 diagnostic from `/members/modules/measurement-signal-health`; inspect network/server logs or mocked side-effect calls to confirm member flow skips public lead email/Sendy paths and still persists report/write-back.
- AC5: Browser-test public `/shopify-bottleneck-analysis`; verify public form, persistence, Sendy/setup/results email branches remain reachable.
- AC9-AC11: Browser-test `/members` and direct module URLs as admin/operator and as non-admin student.
- AC12-AC14: Browser-test `/admin/members` and `/admin/members/[customerKey]` as admin/operator and verify non-admin rejection.
- AC15: Run `npm run lint` plus the relevant `next` build/test command if available, then run `./.project-workflow/cli/workflow doctor`.

## Task List

| ID | Title | Description | Acceptance Criteria | User Verification | Status |
| --: | ----- | ----------- | ------------------- | ----------------- | ------ |
| 1 | Map Existing Flows | Trace the member diagnostic entry, public diagnostic side effects, module locking, and admin progress view before making product code edits. | AC15: flow map exists and covers all changed paths | Review implementation notes before code changes | Done |
| 2 | Member Diagnostic Without Public Lead Gate | Create a member-context diagnostic path that uses authenticated member/store context, asks only for missing store details, and bypasses public lead capture, Sendy, setup email, and public results-ready email side effects. | AC1, AC2, AC3, AC4, AC6, AC7, AC8 | Run Module 3 diagnostic as a member and confirm the result saves back without public sign-up behavior | Done |
| 3 | Preserve Public Lead Magnet | Keep the anonymous Golden Ratio diagnostic behavior unchanged for public visitors. | AC5 | Run the public diagnostic and confirm the existing lead/email behavior remains | Done |
| 4 | Admin Module Unlock | Allow admin/operator users to see and open every module from dashboard and direct URLs while preserving student locks and avoiding progress mutation. | AC9, AC10, AC11 | Sign in as admin and student and compare module access | Done |
| 5 | Read-Only Student Work Review | Extend admin member detail so operators can inspect saved module task states, response fields, and key Module 3 diagnostic outputs per workspace. | AC12, AC13, AC14 | Open Alex's admin member detail and review Module 3 saved outputs without impersonating her | Done |
| 6 | Validation And QA Gate | Run automated checks, browser verification, workflow doctor, and code-review pass before marking complete. | AC15 | Review test evidence and QA findings | Testing |

## QA & Code Review

- Verdict: Pass; ready for owner review.
- Date: 2026-06-22
- Evidence: Reviewed the diff for public/member flow separation, email side-effect gating, module unlock scope, admin access boundaries, read-only student work rendering, progress mutation risk, the follow-up Module 3 admin saved-work refinement, long-form note readability, and structured Module 3 coaching brief sections.
- Findings: No blocking issues found.
- Residual risk: The member Sendy/setup/results email suppression branch was verified in code and by adjacent smoke tests rather than by creating a live diagnostic record during QA.

## Retro

- Reusable lessons: Coaching/member diagnostics that reuse public lead-magnet infrastructure need an explicit server-side member branch so public conversion side effects do not leak into the member workflow.
- Conventions or agent assets updated: None.
- Follow-up tasks: Consider adding automated integration coverage with mocked Sendy/email clients for public versus member diagnostic side effects.

## Notes

- Task: COACH-001
- Title: Remove Member Diagnostic Lead Gate, Unlock Admin Modules, And Add Student Work Review
- Created: 2026-06-22
- Status: QA pass recorded; ready for owner review.

## Implementation Notes

- Member-context diagnostics now branch server-side on authenticated member context and `context=member-module-3`, derive member identity from the session, ask only for missing store/admin URL context, and skip public Sendy/setup/results customer email side effects.
- Public anonymous diagnostics retain the existing lead form, Sendy enrollment path, setup email path, results-ready customer email path, report persistence, and operator notification behavior.
- Admin/operator members now pass the same all-module unlock flag as development preview users on the member dashboard and direct module pages.
- Admin member detail now shows read-only saved response fields for each module/workspace. For Module 3, the single Saved work section is a curated Golden Ratio diagnostic summary with the `Open result` action in the section header, avoiding a duplicate second panel.
- Admin Module 3 note fields now render as full-width long-form note cards with preserved line breaks and increased line height, instead of being flattened into compact one-line metric cards.
- Admin Module 3 brief notes now parse the known coaching brief headings into separate sections: Golden Ratio result, Measurement confidence, First Module 4 product/page focus, Traffic caveat for Module 5, What I should not change yet, and Questions for coaching.
- The Module 3 student coaching brief textarea and Codex prompt now ask for the same headings on separate lines so future saved briefs are easier to scan and less likely to miss useful coaching context.

## Validation Evidence

- `npm run lint` from `next`: passed.
- `npm run build` from `next`: passed.
- `npm run validate:important-event-notifications` from `next`: passed. The command emitted the expected local warning about missing `BOOKING_SUCCESS_TOKEN_SECRET`, then completed successfully.
- `git -C next diff --check`: passed.
- `curl -I http://localhost:3000/shopify-bottleneck-analysis?context=member-module-3`: unauthenticated member-context access redirects to `/members/login?next=%2Fshopify-bottleneck-analysis%3Fcontext%3Dmember-module-3`.
- Public `/shopify-bottleneck-analysis` render smoke test: public lead form remains visible with first name, email address, and role fields.
- Development member login plus `/shopify-bottleneck-analysis?context=member-module-3` render smoke test: member-specific diagnostic view appears with no public email/name/role form and only the store/admin URL field.
- Authenticated `/members` render smoke test: admin/operator view shows later modules as `Admin view` with open module links rather than locked state.
- Student locked-module behavior code review: when `unlockAllModules` is false, the dashboard and direct module page still use the existing previous-module completion checks.
- Authenticated `/admin/members/[customerKey]` render smoke test for Alex-style member data: saved work sections and Module 3 diagnostic outputs render with saved Golden Ratio and measurement fields.
- Side-effect suppression for member Sendy/setup/results emails was verified in code path rather than by writing a live diagnostic record during smoke testing.
- Follow-up Module 3 admin refinement: `npm run lint -- 'app/admin/members/[customerKey]/page.tsx'` passed.
- Follow-up Module 3 admin refinement: `npm run build` from `next` passed.
- Follow-up Module 3 admin refinement: `git -C next diff --check` passed.
- Follow-up Module 3 admin refinement: authenticated local render smoke test for Alex's admin detail shows `Saved work`, `Golden Ratio diagnostic summary`, and `Open result`, and no longer renders the duplicate `Module 3 diagnostic outputs` heading.
- Follow-up Module 3 note readability: `npm run lint -- 'app/admin/members/[customerKey]/page.tsx'` passed.
- Follow-up Module 3 note readability: `npm run build` from `next` passed.
- Follow-up Module 3 note readability: `git -C next diff --check` passed.
- Follow-up Module 3 note readability: authenticated local render smoke test for Alex's admin detail shows all Module 3 note fields rendered with `md:col-span-2` and `whitespace-pre-wrap`.
- Follow-up structured brief refinement: `npm run lint -- 'app/admin/members/[customerKey]/page.tsx' app/members/MemberChecklist.tsx app/members/_lib/shopify-growth-coaching.ts` passed.
- Follow-up structured brief refinement: `npm run build` from `next` passed.
- Follow-up structured brief refinement: `git -C next diff --check` passed.
- Follow-up structured brief refinement: authenticated local render smoke test and in-app browser refresh for Alex's admin detail show all six Module 3 coaching brief sections.
