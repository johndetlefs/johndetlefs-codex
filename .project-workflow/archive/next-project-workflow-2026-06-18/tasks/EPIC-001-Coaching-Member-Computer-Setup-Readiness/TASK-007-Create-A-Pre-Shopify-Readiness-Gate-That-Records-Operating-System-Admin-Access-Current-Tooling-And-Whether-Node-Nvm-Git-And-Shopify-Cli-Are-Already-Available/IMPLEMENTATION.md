## User Story

As a non-technical Shopify Growth Coaching member, I want to record what kind of computer setup I already have before starting Shopify setup, so that Codex and the coaching checklist know what needs to be checked or installed next.

## Goal

Add a first checklist readiness gate that records the member's operating system, admin/access confidence, and current Node/NVM/Git/Shopify CLI status before Shopify-specific setup begins.

## Approach

- Reuse the existing module/checklist model and member progress response storage.
- Add structured readiness response fields to the existing `MemberSavedResponses` shape.
- Add a first checklist item with plain-language explanation and a copyable no-change inspection prompt.
- Add a small response form to `MemberChecklist` for the readiness item.
- Block readiness completion until required readiness responses are saved.

## Phases

1. Persist readiness responses through the existing progress API and Firestore response map.
2. Add the readiness checklist content before Shopify-specific setup.
3. Render and validate the readiness response form in the member checklist.
4. Run lint and workflow doctor.

## Parent AC Coverage

- AC1

## Acceptance Criteria

- [x] AC1: Covers parent AC(s) AC1: Module 1 starts with a computer readiness checklist item before Shopify-specific setup work.
- [x] AC2: Covers parent AC(s) AC1: The readiness checklist item captures operating system, admin/access confidence, Node status, NVM status, Git status, and Shopify CLI status.
- [x] AC3: Covers parent AC(s) AC1: Readiness answers save through `/api/members/progress`, persist in development fallback responses and Firestore responses, and rehydrate on reload.
- [x] AC4: Covers parent AC(s) AC1: The readiness checklist item cannot be marked complete until all required readiness answers are saved.
- [x] AC5: Covers parent AC(s) AC1: The readiness item includes a copyable inspection prompt that asks the model to check and report, not install or change anything yet.

## Validation

- AC1 / parent AC(s) AC1: `moduleOneChecklist.checklist` now starts with `computer-readiness-gate` before account, Shopify admin, theme, or Shopify CLI setup work.
- AC2 / parent AC(s) AC1: `MemberChecklist` renders readiness select controls for operating system, admin access, Node.js, NVM, Git, and Shopify CLI.
- AC3 / parent AC(s) AC1: `MemberSavedResponses`, Firestore response serialization/parsing, API response parsing, and the development fallback now include readiness response fields.
- AC4 / parent AC(s) AC1: `getMissingCompletionRequirement` blocks `computer-readiness-gate` completion until all readiness answers are saved.
- AC5 / parent AC(s) AC1: `computerReadinessPrompt` is attached to the first checklist item and explicitly says inspection only: no install, update, delete, file creation, connection, or settings changes.
- Automated validation: `npm run lint` passed.
- Automated validation: `npm run build` passed.
- Dev server: `npm run dev` started successfully at `http://localhost:3000`.

## Task List

| ID | Title | Description | Acceptance Criteria | User Verification | Status |
| --: | ----- | ----------- | ------------------- | ----------------- | ------ |
| 1 | Persist readiness responses | Extend the saved member response model, API parser, development fallback, Firestore serialization, and Firestore parsing for readiness fields. | AC2: readiness fields are represented in saved responses<br>AC3: responses persist and rehydrate | `npm run lint`; inspect `/api/members/progress` and `member-store` response handling | Done |
| 2 | Add readiness checklist content | Add a first checklist item that explains computer readiness and includes a copyable inspection prompt before Shopify setup tasks. | AC1: readiness comes first<br>AC5: copyable no-change inspection prompt exists | Inspect `shopify-growth-coaching.ts` checklist order and prompt copy | Done |
| 3 | Render readiness gate controls | Add member checklist controls for OS, admin/access confidence, Node, NVM, Git, and Shopify CLI status, with save messaging and completion blocking. | AC2: controls capture all fields<br>AC3: saved values rehydrate<br>AC4: incomplete answers block completion | `npm run lint`; inspect member checklist behavior in code or browser | Done |

## Parent AC Evidence

- AC1: Implemented a pre-Shopify readiness gate as the first setup checklist item; readiness fields are persisted as member progress responses; completion is blocked until the required readiness answers are saved; validation passed with lint and build.

## QA & Code Review

- Verdict: Pass
- Evidence: npm run lint passed on 2026-06-17. npm run build passed on 2026-06-17 with 39 generated pages and dynamic member module routes. Protected route smoke checks returned 307 login redirects for /members/modules/computer-setup-readiness and /members/modules/ai-assisted-shopify-setup. workflow doctor passed with only pre-existing warnings outside EPIC-001. Shopify CLI requirement copy was checked against Shopify developer docs showing Node.js 22.12+, a Node package manager, and Git 2.28.0+.
- Findings: No blocking findings. Browser-plugin screenshot validation was unavailable because the node_repl browser control tool was not exposed in this session; code review plus build, lint, and route smoke checks covered the changed surfaces.

## Retro

- Reusable lessons: Model-operated setup steps need explicit no-change inspection, approval, installation, verification, and summary boundaries for non-technical members.
- Conventions or agent assets updated: EPIC-001 workflow evidence now records the Mac-first readiness sequence and the safe local-access prompt pattern.
- Follow-up tasks: Build the Windows-specific setup path when the programme is ready to support Windows local tooling.

## Notes

- Task: TASK-007
- Title: Create a pre-Shopify readiness gate that records operating system, admin access, current tooling, and whether Node, NVM, Git, and Shopify CLI are already available
- Created: 2026-06-17
