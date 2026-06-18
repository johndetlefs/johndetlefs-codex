## User Story

As a non-technical Shopify Growth Coaching member, I want the setup checklist to guide the model-operated computer setup safely, so that I can prepare my computer without needing to become a developer.

## Goal

Prepare the curriculum and persisted readiness data for a future Windows path without building full Windows setup now.

## Approach

- Reuse the code-backed coaching module model.
- Keep the member-facing copy plain-language and model-operated.
- Reuse the existing prompt copy controls and sequential checklist locking.
- Validate with lint, build, and workflow doctor.

## Phases

1. Update coaching module data and prompt copy.
2. Update shared checklist rendering or response persistence where needed.
3. Validate the member flow and workflow state.

## Parent AC Coverage

- AC6

## Acceptance Criteria

- [x] AC1: Operating system is saved as structured member response data.
- [x] AC2: Mac-specific steps tell non-Mac users not to follow the Mac path blindly.
- [x] AC3: Future Windows implementation can branch from persisted readiness responses.

## Validation

- AC6 / parent evidence: AC6: `computerOperatingSystem` is persisted in member responses, and Mac steps explicitly route Windows/other users to the future split path.
- Automated validation: npm run lint passed.
- Automated validation: npm run build passed.

## Task List

| ID | Title | Description | Acceptance Criteria | User Verification | Status |
| --: | ----- | ----------- | ------------------- | ----------------- | ------ |
| 1 | Deliver child acceptance criteria | Update module data, prompts, response handling, or checklist rendering needed for this child scope. | AC1: implemented and verified<br>AC2: implemented and verified<br>AC3: implemented and verified | npm run lint; npm run build; inspect module content | Done |

## Parent AC Evidence

- AC6: AC6: `computerOperatingSystem` is persisted in member responses, and Mac steps explicitly route Windows/other users to the future split path.

## QA & Code Review

- Verdict: Pass
- Evidence: npm run lint passed on 2026-06-17. npm run build passed on 2026-06-17 with 39 generated pages and dynamic member module routes. Protected route smoke checks returned 307 login redirects for /members/modules/computer-setup-readiness and /members/modules/ai-assisted-shopify-setup. workflow doctor passed with only pre-existing warnings outside EPIC-001. Shopify CLI requirement copy was checked against Shopify developer docs showing Node.js 22.12+, a Node package manager, and Git 2.28.0+.
- Findings: No blocking findings. Browser-plugin screenshot validation was unavailable because the node_repl browser control tool was not exposed in this session; code review plus build, lint, and route smoke checks covered the changed surfaces.

## Retro

- Reusable lessons: Model-operated setup steps need explicit no-change inspection, approval, installation, verification, and summary boundaries for non-technical members.
- Conventions or agent assets updated: EPIC-001 workflow evidence now records the Mac-first readiness sequence and the safe local-access prompt pattern.
- Follow-up tasks: Build the Windows-specific setup path when the programme is ready to support Windows local tooling.

## Notes

- Task: TASK-012
- Title: Define the future Windows split path at the curriculum and data-model level so Mac and Windows setup instructions can diverge cleanly later
- Created: 2026-06-17
