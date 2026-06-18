## User Story

As a non-technical Shopify merchant in Shopify Growth Coaching, I want to log in and see the first setup checklist in plain language, so that I know exactly what to do before the next coaching call.

## Acceptance Criteria

- [ ] Visiting `/members` while logged out redirects to `/members/login`.
- [ ] Visiting `/members/login` shows a plain email plus invite-code form, expected development access guidance, and useful validation errors.
- [ ] Submitting valid MVP credentials creates a session and redirects to `/members`.
- [ ] The `/members` page greets the member, shows module cards, links to the Module 1 page, and includes a logout action.
- [ ] The `/members/modules/ai-assisted-shopify-setup` page shows Module 1 details, checklist progress, and a way back to the dashboard.
- [ ] The dashboard shows Module 2 as locked until Module 1 is complete.
- [ ] Directly visiting `/members/modules/measurement-signal-health` while Module 1 is incomplete shows a locked-module state.
- [ ] Each checklist item exposes the task, why it matters, step-by-step how-to guidance, done-when criteria, time estimate, and resource links in a single-column layout.
- [ ] Guide steps with actions include direct links at the point of instruction.
- [ ] Prompt steps include visible prompt text and a copy button.
- [ ] Every setup prompt is explicit, comprehensive, and scoped to the current checklist task rather than jumping ahead to later setup steps.
- [ ] The Shopify admin URL input and save button live inside the relevant checklist task, not in a separate module-level panel.
- [ ] Saving a Shopify admin URL generates store-specific Shopify admin links for later steps.
- [ ] Saving a duplicated approval theme name or ID inside the duplicate-theme task makes that value available in later Codex setup prompts.
- [ ] The local workspace setup prompt is pre-filled with the saved Shopify admin URL, derived store handle, and duplicated approval theme reference.
- [ ] Module 1 removes GitHub Desktop and treats GitHub as a behind-the-scenes history layer for Codex.
- [ ] Module 1 uses Shopify CLI owner login as the default access path for members working on their own store.
- [ ] Module 1 guides members toward a Codex-managed local Shopify CLI theme environment with `shopify.theme.toml`, local preview, and no-live-publish rules.
- [ ] Module 1 installs project-workflow guardrails before Codex edits theme files.
- [ ] Module 1 tells Codex to run the project-workflow constitution setup flow and create Shopify-specific `README.md`, `AGENTS.md`, `.project-workflow/CONSTITUTION.md`, and `.project-workflow/TRACKER.md`.
- [ ] Module 1 requires every new block, section, feature, or idea to start with project-workflow and a new branch.
- [ ] Source documentation exists for the coaching checklist sequence outside the app UI.
- [ ] Locked checklist steps cannot be marked complete and do not expose usable action links or prompt copy buttons.
- [ ] Marking checklist items complete updates the visible progress and survives a page refresh in the same browser.
- [ ] Resource links open official documentation or stable video/channel/search pages.
- [ ] `npm run lint` passes for the touched app code.
- [ ] A local dev server can be started so John can inspect the member flow in browser.

## Goal

Create the first usable member-area slice for Shopify Growth Coaching: login, dashboard, Module 1 checklist, researched resources, and local progress tracking.

## Approach

- Add a small server-side member session helper using signed cookies and an invite code.
- Add `/members/login` for the invite-code entry flow.
- Add `/members` as the protected student/member dashboard.
- Add dedicated module routes under `/members/modules/[moduleId]`.
- Add shared module/checklist data in code so the first modules are easy to review and later move into a database.
- Add source documentation for the checklist sequence so the app content follows a planned coaching workflow.
- Add a client checklist component that tracks browser-local progress and keeps the UI useful during dev preview.
- Enforce sequential module and checklist task access in the UI.

## Phases

### Phase 1

- Changes: member auth helper, login route, dashboard route, first checklist data, progress component, navigation entry.
- Validation: lint plus manual browser verification of login, redirect, dashboard, completion toggles, reload persistence, logout, desktop and mobile layout.
- Tracker updates: move TASK-004 to `In Progress` before coding and `Testing` after validation.

### Phase 2

- Changes: production membership persistence, member/customer profile linkage, invite or magic-link flow, admin checklist authoring, billing/subscription gate.
- Validation: future task.
- Tracker updates: future task.

## Tasks

|  ID | Title | Description | Acceptance Criteria | User Verification | Status |
| --: | ----- | ----------- | ------------------- | ----------------- | ------ |
|   1 | Inspectable member area MVP | A member can log in with MVP credentials, view Module 1, use the first checklist, and see progress persist in the same browser. | - Logged-out `/members` redirects to login.<br>- Valid login redirects to `/members`.<br>- Dashboard shows member greeting, module cards, module link, locked Module 2, and logout.<br>- Module 1 has a dedicated route.<br>- Module 2 direct route is locked until Module 1 is complete.<br>- Checklist items include single-column step-by-step how-to guidance.<br>- Checklist action links and prompt copy buttons are inline with the relevant guide step.<br>- Checklist steps are sequentially locked.<br>- Shopify admin URL input/save controls appear inside the Shopify admin URL checklist task.<br>- Module 1 no longer includes GitHub Desktop.<br>- Module 1 uses Shopify CLI owner login as the default access path.<br>- Module 1 guides the member toward a Codex-managed Shopify CLI local environment.<br>- Module 1 installs project-workflow guardrails before theme edits.<br>- Shopify admin URL can generate store-specific admin links.<br>- Checklist completion persists through refresh.<br>- Lint passes.<br>- Build passes.<br>- Dev server starts for browser review. | - Open `/members`, confirm redirect.<br>- Log in from `/members/login` using the development invite code.<br>- Confirm Module 2 is locked.<br>- Open Module 1 from the dashboard.<br>- Confirm later checklist steps are locked until previous steps are complete.<br>- Copy a prompt using the copy button.<br>- Save a Shopify admin URL from the checklist task and confirm generated admin links use it.<br>- Confirm Step 6 tells members to use their own Shopify login for Shopify CLI, not collaborator or Theme Access setup.<br>- Confirm Module 1 includes Shopify CLI local tooling, project-workflow guardrails, `shopify.theme.toml`, local preview, and no-live-publish rules.<br>- Confirm project-workflow setup requires a new branch and task for new blocks, sections, features, and ideas.<br>- Toggle checklist items, refresh, and confirm progress remains.<br>- Visit Module 2 directly and confirm locked state.<br>- Run `npm run lint`. | Testing |
|   2 | Production membership persistence | Replace browser-local MVP progress with account-linked persistence and real member authorization. | - Member progress persists across devices.<br>- Membership access is tied to approved members or paid subscription state.<br>- Existing customer identity patterns are reused. | - Future workflow task after the first three-client flow is validated. | To Do |

## Validation

- 2026-06-01: `npm run lint` passed.
- 2026-06-01: `npm run build` passed.
- 2026-06-01: Browser QA passed on `http://localhost:3000/members` and `http://localhost:3000/members/login`.
- 2026-06-01: Verified logged-out `/members` redirects to `/members/login`.
- 2026-06-01: Verified valid development login with `jane@example.com` and invite code `growth`.
- 2026-06-01: Verified dashboard greeting, current module cards, checklist items, progress counter, resource links, and logout action.
- 2026-06-01: Verified checklist completion updates visible progress and survives reload after client hydration.
- 2026-06-01: Updated reload state to show "Loading saved progress..." until local progress hydrates, then re-verified saved progress.
- 2026-06-01: Verified mobile layout at 390x844. No blocking overlap or unreadable checklist content found.
- 2026-06-01: Split `/members` into a module dashboard and `/members/modules/ai-assisted-shopify-setup` into the dedicated Module 1 page.
- 2026-06-01: Expanded Module 1 to 9 explicit tasks, including ChatGPT account setup, Codex sign-in, GitHub account setup, GitHub Desktop, safe Shopify theme copy, access path, theme editor orientation, low-risk change, and safe Codex prompt practice.
- 2026-06-01: Added step-by-step "How to do it" guidance for each checklist item and re-verified browser progress persistence at 2 of 9 tasks after reload.
- 2026-06-01: `npm run lint` passed after module route split.
- 2026-06-01: `npm run build` passed after module route split.
- 2026-06-01: Converted checklist cards to a single-column instruction flow.
- 2026-06-01: Added inline action links inside guide steps, visible prompt boxes with copy buttons, and a Shopify admin URL helper that generates store-specific admin links.
- 2026-06-01: Added Module 2 as a locked module and enforced sequential module access, including direct URL locking.
- 2026-06-01: Enforced sequential checklist task access. Later task buttons, action links, and copy buttons remain locked until the previous task is complete.
- 2026-06-01: `npm run lint` passed after sequential locking and copy/admin helper changes.
- 2026-06-01: `npm run build` passed after sequential locking and copy/admin helper changes.
- 2026-06-01: Browser QA passed with a fresh member email: Module 2 locked on dashboard, Module 1 starts at 0 of 10, first task has inline Open ChatGPT and copy prompt, later steps are locked, copy button changes to Copied, progress advances to 1 of 10, direct Module 2 URL shows locked state, saved Shopify admin URL generates `/store/sample-store/themes`, and mobile layout remains usable at 390x844.
- 2026-06-01: Moved the Shopify admin URL input/save controls into the "Save your Shopify admin link" checklist task and removed the separate module-level helper panel.
- 2026-06-01: `npm run lint` passed after moving the Shopify admin URL helper into the task.
- 2026-06-01: `npm run build` passed after moving the Shopify admin URL helper into the task.
- 2026-06-01: Browser QA passed on `http://localhost:3000/members/modules/ai-assisted-shopify-setup`: no top admin URL panel, task-level helper visible, saving `https://admin.shopify.com/store/updated-store` from Step 5 updates the later Themes link to `https://admin.shopify.com/store/updated-store/themes`, and no framework error overlay appeared.
- 2026-06-02: Added `docs/shopify-growth-coaching-checklists.md` as the source-of-truth planning document for member checklist sequence, Shopify CLI operator notes, and future Codex skill direction.
- 2026-06-02: Refined Module 1 to remove GitHub Desktop and replace theme-editor practice tasks with Codex-managed local Shopify CLI setup tasks: tooling check, local theme workspace, `shopify.theme.toml`, theme pull/dev preview, and publishing rules.
- 2026-06-02: `npm run lint` passed after the Shopify CLI checklist refinement.
- 2026-06-02: `npm run build` initially failed in the sandbox because Next could not fetch Google Fonts; rerunning outside the sandbox passed.
- 2026-06-02: Browser QA passed on `http://localhost:3000/members/modules/ai-assisted-shopify-setup`: Module 1 shows 0 of 11 tasks, the new Shopify CLI/Codex task headings and prompt copy buttons are present, GitHub Desktop and old theme-editor-practice tasks are absent, and no framework error overlay appeared.
- 2026-06-02: Simplified Step 6 from choosing an access path to using the member's own Shopify login when Shopify CLI prompts for store access. Collaborator access and Theme Access are now exception paths, not default member actions.
- 2026-06-02: `npm run lint` passed after the Step 6 owner-login refinement.
- 2026-06-02: `npm run build` passed after the Step 6 owner-login refinement.
- 2026-06-02: Browser QA passed on `http://localhost:3000/members/modules/ai-assisted-shopify-setup`: Step 6 renders as "Log into Shopify CLI for your own store", the old "Choose the safest Shopify access path" heading is absent, and Step 6 tells members to use their own Shopify login rather than creating collaborator access or Theme Access for their own store.
- 2026-06-02: Added a project-workflow setup task to Module 1 so Codex installs guardrails before theme edits, creates Shopify-specific README/AGENTS/Constitution/Tracker docs, and requires project-workflow plus a new branch for every new block, section, feature, or idea.
- 2026-06-02: `npm run lint` passed after adding the project-workflow guardrails task.
- 2026-06-02: `npm run build` passed after adding the project-workflow guardrails task.
- 2026-06-02: Browser QA passed on `http://localhost:3000/members/modules/ai-assisted-shopify-setup`: Module 1 now shows 0 of 12 tasks, "Install project workflow and Shopify guardrails" renders as Step 9, "Copy project workflow prompt" is present, Step 10 remains the Shopify CLI environment file, and the task includes README/AGENTS/Constitution/Tracker plus new-branch/project-workflow rules.
- 2026-06-02: Audited Module 1 setup prompts so Shopify CLI login, local tooling, local workspace, project-workflow constitution setup, `shopify.theme.toml`, local pull/preview, and publishing rules each have exact copyable prompts scoped to their own checklist step.
- 2026-06-02: `npm run lint` passed after the prompt audit refinement.
- 2026-06-02: `npm run build` passed after the prompt audit refinement.
- 2026-06-02: Browser QA passed on `http://localhost:3000/members/modules/ai-assisted-shopify-setup`: Module 1 shows 0 of 12 tasks, all prompt copy buttons render (`Copy Shopify CLI login prompt`, `Copy local tooling prompt`, `Copy workspace setup prompt`, `Copy project workflow prompt`, `Copy environment file prompt`, `Copy local preview prompt`, and `Copy Codex rules prompt`), the old workspace prompt that jumped into TOML/pull/preview is absent, and no console errors or framework overlay appeared.
- 2026-06-02: Added a saved duplicated approval theme field to Step 5 and updated later prompts to inject the saved admin URL, derived store handle, and approval theme reference instead of asking members to re-enter those details.
- 2026-06-02: `npm run lint` and `npm run build` passed after adding saved approval theme details and dynamic prompt replacement.
- 2026-06-02: Browser QA passed on `http://localhost:3000/members/modules/ai-assisted-shopify-setup`: saved sample admin URL `https://admin.shopify.com/store/spoonfed-demo` and duplicated theme `Coaching approval copy`, verified Step 8 renders the saved-details panel, copied the workspace setup prompt, and confirmed the copied prompt includes the saved admin URL, derived store handle `spoonfed-demo`, and approval theme while still excluding TOML/pull/preview work.

## Notes

- Console warnings during Browser QA were pre-existing Meta Pixel and Next smooth-scroll warnings, not member-area runtime errors.
- Work item 2 remains a follow-up for account-linked server persistence and real membership authorization.
