# Requirements

## Summary

- Task: EPIC-001
- Title: Coaching Member Computer Setup Readiness
- Last updated: 2026-06-17

## Goal

Make sure a non-technical Shopify Growth Coaching member has the minimum computer setup needed before they are asked to use Codex, GitHub, Shopify CLI, or local theme workflows.

The first version should assume a regular consumer Mac with no developer tooling already installed. The curriculum should later split cleanly between Mac and Windows, but the immediate implementation should focus on a Mac-first path that is simple enough for someone like Alex from Alessa Vino to follow without John taking over.

The member should not be expected to perform developer setup manually. The assumed operating model is that the active AI coding assistant, whether Codex, Claude, or another capable model, guides and performs the setup where the tool has permission to do so. The member's role is to understand what is being installed, grant intentional access, approve commands, enter their own password or credentials when the operating system asks, and verify that the model completed the step.

## Non-Goals

This epic does not require John to provide done-for-you setup, remote desktop support, or custom debugging for every member's computer. It does not require a complete Windows implementation in the first pass. It should not force full Xcode installation if Command Line Tools or another lighter path is enough for Git and Shopify CLI.

This epic should not turn the checklist into a technical installation tutorial that asks the member to copy shell commands by hand unless there is no safer agent-assisted option. It should not ask members to share passwords, recovery keys, private tokens, or Shopify credentials with an AI model.

## Users & Context

Primary user: a Shopify merchant joining coaching who is comfortable running a business but may have never installed Node, NVM, Git, Xcode Command Line Tools, Shopify CLI, or a package manager.

This replaces the assumption that members already have a developer-style computer. The setup flow should start with checks, explain what is missing in plain language, and only install what is actually needed for the coaching workflow.

Member-facing setup tasks should avoid language like "go install NVM" as the main instruction. They should say what the next tool is, why it is needed for Shopify Growth Coaching, what access the model may need, and provide an exact copyable prompt that asks the model to inspect the computer, install the tool, verify it, and explain what changed.

## Requirements (Outcome-Focused)

The coaching curriculum must introduce a computer-readiness step before Shopify-specific setup. This can become Module 1, with Shopify access/theme setup moving to Module 2, or it can be an explicit first section of Module 1 if that is cleaner for the product. The epic should make that sequencing decision visible and testable before implementation starts.

The experience should keep the setup as light as practical. Browser-only tasks should stay browser-only. Local developer tooling should only be required when the member needs it for Codex-managed local Shopify theme work, Shopify CLI preview, Git-backed changes, or similar workflows.

Each technical setup task should include:

- A plain-language "what this is" explanation.
- A short "why you need this" explanation tied to the coaching workflow.
- A copyable prompt for the member's current AI coding assistant.
- A short explanation of any terminal, file-system, installer, administrator, or operating-system permission the member may need to grant.
- A verification result the model must report back before the member marks the task complete.

## Acceptance Criteria (Verifiable)

- AC1: Create a pre-Shopify readiness gate that records operating system, admin access, current tooling, and whether Node, NVM, Git, and Shopify CLI are already available.
- AC2: Provide a Mac-first beginner setup path that installs the minimum required developer tools, preferring Xcode Command Line Tools over full Xcode unless full Xcode is proven necessary.
- AC3: Decide the module sequence so computer and tooling readiness happens before Shopify-specific setup, with Shopify access, theme copy, and CLI store connection moved after the readiness gate.
- AC4: Explain which early coaching tasks can be done browser-only and which tasks require local tooling, so the curriculum does not over-engineer setup before it is needed.
- AC5: Add plain-language verification checks for `node --version`, `nvm --version`, `git --version`, and `shopify version` before a member proceeds to Shopify theme work.
- AC6: Define the future Windows split path at the curriculum and data-model level so Mac and Windows setup instructions can diverge cleanly later.
- AC7: Ensure the member checklist can assign, lock, complete, and persist the readiness flow as a prerequisite for later Shopify setup tasks.
- AC8: Validate the flow against a non-developer Mac user scenario where Node, NVM, Git, and Shopify CLI are initially missing.
- AC9: For every technical setup step, provide exact copyable prompts that ask the active model to inspect, install, verify, and summarize the required setup work instead of asking the member to manually perform developer installation steps.
- AC10: Teach members how to grant AI coding tools safe, intentional access to make local computer changes, including terminal access, file-system access, command approvals, installer/admin prompts, and the rule that passwords and credentials are entered by the member, not shared with the model.

## Open Questions (Answer Needed)

- Should this be named Module 1: Computer Setup Readiness, with the current AI-Assisted Shopify Setup becoming Module 2, or should it be a prerequisite section inside Module 1?
- Which exact installer path should be recommended for Mac users: Homebrew plus NVM, direct NVM install, or another lighter approach?
- Do members need GitHub account setup before local tooling, or should GitHub move after Node/Git verification?
- Which AI tools should get first-class prompt variants in V1: Codex only, Codex and Claude, or a generic prompt with tool-specific notes?
- What is the safest member-facing wording for granting operating-system access on Mac now, and what should be deferred until the Windows path is implemented?

## Decisions (Resolved)

- Mac-first implementation is the immediate priority.
- Windows support is in scope for the epic design, but not required in the first implementation pass.
- Assume members may have no development tooling installed.
- Assume the AI coding assistant performs or coordinates technical setup wherever it has permission, rather than the member following raw installation commands.
- Do not require full Xcode by default; prefer the smallest reliable Git/CLI prerequisite path.
- Member-facing setup steps must include copyable prompts and visible verification criteria.
- Members must approve local computer changes intentionally and keep secrets private; the model can request access and explain commands, but the member enters passwords and credentials directly into trusted OS/app prompts.
- Keep the coaching model intact: John provides structure and review, while members complete their own setup steps.

## Validation Plan

- Run project-workflow decomposition and confirm each proposed child row maps to one or more parent AC IDs.
- Review the drafted curriculum against the Alex / Alessa Vino scenario: a Mac user with no Node, no NVM, no confirmed Git setup, and no assumed developer background.
- Review the drafted checklist language to confirm it explains what/why first, then gives an exact model prompt, instead of instructing the member to manually run developer setup.
- Verify prompt copy controls copy the full intended prompt and that the prompt asks the model to report verification output back to the member.
- Review OS-access instructions for safety: command approvals are explicit, admin/password entry stays with the member, and the model explains changes before making them where practical.
- Verify checklist state can persist readiness completion before later Shopify setup tasks unlock.
- Run `./.project-workflow/cli/workflow doctor` after epic tracker or child task changes.
