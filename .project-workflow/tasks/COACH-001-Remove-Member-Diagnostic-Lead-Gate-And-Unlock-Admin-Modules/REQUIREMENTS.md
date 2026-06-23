# Requirements

## Summary

- Task: COACH-001
- Title: Remove Member Diagnostic Lead Gate, Unlock Admin Modules, And Add Student Work Review
- Last updated: 2026-06-22
- Primary repo: `next`
- Repos touched: expected `next` only
- Workflow owner: parent workspace tracker
- Branch/PR: not started
- Archived context: this continues the Shopify Growth Coaching member-area work migrated out of the archived child repo workflow state.

## Goal

Members running the Module 3 Golden Ratio diagnostic from the member area should get a coaching-native experience, not the public lead magnet email gate. Admin/operator users should be able to review all modules and student work read-only so John can inspect a student's saved module outputs before or during coaching.

## Non-Goals

- Do not remove or weaken the public Golden Ratio lead magnet flow for anonymous visitors.
- Do not remove public Sendy subscription, public setup email, public results email, or public operator notification behavior from the public lead magnet.
- Do not change student module locking rules except where the signed-in user is an admin/operator.
- Do not create admin impersonation or let admin review mutate a student's progress.
- Do not expose private student work to non-admin students or public visitors.
- Do not implement code until the owner approves these requirements and the implementation plan.

## Users & Context

- Student/coachees, such as Alex, open Module 3 from the member area after Modules 1 and 2. They should not be asked to sign up for the public Sendy list or re-enter known email/name details just to complete the diagnostic.
- Admin/operator users need to browse every coaching module regardless of student progression locks.
- Admin/operator users need to inspect a student's saved module work, especially Module 3 diagnostic outputs, saved notes, and linked report results, without asking the student to screenshot everything manually.
- The current app already saves module progress and response fields under member workspaces; the admin page lists progress but does not expose enough of the student's actual submitted work.

## Requirements (Outcome-Focused)

- Member-context Golden Ratio diagnostics must use authenticated member context where available instead of the public lead-capture gate.
- Member-context diagnostics must not subscribe the member to Sendy, create a newsletter sign-up side effect, or send public lead-nurture setup emails.
- Member-context diagnostics should not send the public customer "results ready" email; the member result should be available in the module and admin review view.
- Public `/shopify-bottleneck-analysis` behavior must remain unchanged for anonymous/public visitors.
- Member-context diagnostics must still persist the analysis and generate/load the signed report/results link required for the calculator and Module 3 write-back.
- Member-context diagnostics must still write the protected Module 3 summary back to the authenticated member's workspace when the result is generated.
- If member identity is known but store/admin details are missing, the recovery path should be member-friendly and should ask only for the missing store context, not route through the public lead form.
- Admin/operator users must be able to see and open all coaching modules from the member area, regardless of `allowedModuleIds`, sequential completion, or current module state.
- Non-admin students must continue to see the existing module locks and completion requirements.
- Admin/operator users must be able to open a read-only student work review from the admin member detail view.
- The student work review must show saved module progress, saved response fields, and key Module 3 outputs in a scannable way, including Golden Ratio report link, result date, overall status, bottleneck, revenue gap, current/expected revenue, top landing page type, measurement confidence, product focus notes, traffic notes, and brief notes where saved.
- Student work review must clearly handle missing data, multiple workspaces, and modules not started yet.
- Admin review must not mark tasks complete, update response timestamps, trigger student emails, or change workspace progress.
- Admin review must be protected by existing operator access checks.

## Acceptance Criteria (Verifiable)

- AC1: Opening the Golden Ratio diagnostic from Module 3 as an authenticated member does not show the public lead form requiring email/name/role when member identity exists.
- AC2: Member-context diagnostic entry does not call Sendy enrollment and does not create a newsletter subscription side effect.
- AC3: Member-context diagnostic entry does not send the public report setup email.
- AC4: Member-context result generation does not send the public customer results-ready email.
- AC5: Public lead magnet visitors still see the public lead form and the existing public Sendy/setup/results email behavior remains intact.
- AC6: Member-context diagnostic still creates or loads a signed analysis/report record and can calculate results.
- AC7: Member-context result generation still writes the Golden Ratio summary back into Module 3 progress only for the authenticated matching member/store context.
- AC8: If store/admin context is missing for a member, the UI asks for only the missing store context in member language rather than treating the member as a new public lead.
- AC9: Admin/operator users can see and enter every member module from the member dashboard and direct module URLs.
- AC10: Non-admin students still see locked modules according to the existing sequential progression rules.
- AC11: Admin/operator module browsing does not mutate checklist state, response fields, or student progress just by viewing.
- AC12: Admin/operator users can open a student detail view and inspect saved work for each module/workspace, including completed task states and saved response fields.
- AC13: Admin/operator users can inspect Alex-style Module 3 outputs directly from admin, including linked Golden Ratio report/results and the saved measurement/product/traffic notes when present.
- AC14: Student work review is read-only and remains blocked for non-admin users.
- AC15: Validation covers the member diagnostic path, public diagnostic path, admin all-modules path, student locked-module path, admin student-work review path, and workflow doctor.

## Open Questions (Answer Needed)

- None blocking after clarify pass on 2026-06-22.

## Decisions (Resolved)

- Coachees should not be forced through the public email/Sendy sign-up gate when launching the diagnostic from the member area.
- Admin/operator users should not have locked modules.
- Admin/operator users need a read-only way to review the actual student work saved inside modules, not only progress percentages.
- Member-context diagnostics should suppress public setup/results emails and rely on module write-back plus admin review for the coaching workflow.
- Implementation remains gated by owner approval of these requirements and the implementation plan.

## Validation Plan

- Run the member-context diagnostic flow from `/members/modules/measurement-signal-health` through result generation and verify no public lead gate, Sendy enrollment, setup email, or public customer results-ready email is triggered.
- Run the public `/shopify-bottleneck-analysis` flow and verify the existing lead gate and public email behavior still works.
- Verify Module 3 write-back updates only the authenticated member's workspace and only after result generation.
- Verify an admin/operator can open all modules from `/members` and direct module URLs.
- Verify a non-admin student remains locked out of future modules until prior modules are complete.
- Verify `/admin/members` and `/admin/members/[customerKey]` expose read-only student work details to admins and reject non-admin access.
- Run `npm run lint` and the relevant build/test command from `next` if available.
- Run `./.project-workflow/cli/workflow doctor` from the workspace root after workflow doc changes.
