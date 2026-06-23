# Requirements

## Summary

- Task: TASK-004
- Title: Shopify Growth Coaching Member Area MVP
- Last updated: 2026-06-02

## Overview

Create the first inspectable slice of the Shopify Growth Coaching member experience for three initial Shopify store-owner clients. The slice should let a member log in, reach a student/member area, open each module on its own page, and work through practical setup checklists with durable documentation links instead of John needing to record custom videos.

## User Story

As a non-technical Shopify merchant in Shopify Growth Coaching, I want to log in and see the first setup checklist in plain language, so that I know exactly what to do before the next coaching call.

## Goal

Ship a useful previewable MVP of the member area that establishes the member flow and first checklist structure without waiting for a full auth, billing, or learning-management-system build.

## Non-Goals

- No subscription billing or payment gating.
- No full production identity provider, magic-link email flow, or Shopify customer account integration.
- No cross-device checklist persistence in this first slice.
- No admin authoring UI for checklists.
- No promise that John will directly edit a member's store or theme.
- No custom recorded setup videos unless a durable third-party source is not available.

## Users & Context

- Initial users are three Shopify store owners who are not technical.
- They need a safe, step-by-step start for Codex, GitHub, Shopify access, and a local Shopify CLI theme workflow.
- The checklist should reduce coaching-call time spent on basic setup and make each client comfortable asking simple questions.
- John needs a local dev-server preview while the member area is being built.

## Requirements (Outcome-Focused)

- Members can access a dedicated login page and authenticate with email plus an invite code for the MVP.
- A logged-in member can reach a dedicated member/student area and can log out.
- Unauthenticated visitors to the member area are redirected to login.
- The member dashboard clearly presents available modules and links each module to its own dedicated page.
- Module 1: AI-Assisted Shopify Setup has a dedicated page at a stable route.
- Checklist items are written for non-technical Shopify merchants with a short task, why it matters, step-by-step "how to do it" guidance, done-when criteria, estimated effort, and resource links.
- Module 1 includes explicit setup tasks for creating or confirming a ChatGPT account, opening Codex, creating a GitHub account, saving the member's Shopify admin URL, creating a safe Shopify theme copy, logging into Shopify CLI with the member's own Shopify owner account, verifying local Shopify CLI tooling, creating a Codex-managed local theme workspace, installing project-workflow guardrails, creating `shopify.theme.toml`, pulling the duplicated theme locally, running a local Shopify CLI preview, and saving Codex publishing rules.
- The project-workflow setup should run through the constitution setup flow and create or update Shopify-specific repository guidance: `README.md`, `AGENTS.md`, `.project-workflow/CONSTITUTION.md`, and `.project-workflow/TRACKER.md`.
- Future Shopify theme ideas, including new blocks, sections, and feature changes, should start with project-workflow and a new branch before implementation.
- The canonical checklist sequence should be documented outside the app content so the member UI follows a planned coaching workflow rather than ad hoc copy changes.
- Guide steps should include direct action links in context, not only a generic resources area.
- Prompts that members should paste into ChatGPT or Codex should be shown with a copy-to-clipboard button.
- Every setup task that asks members to use ChatGPT or Codex should provide the exact prompt to copy, and that prompt should be scoped to the current task instead of jumping ahead to later setup work.
- The module page should let a member paste and save their Shopify admin URL so Shopify-specific step links can be generated for their store.
- The duplicated theme task should let a member save the duplicated approval theme name or ID so later Codex prompts can reuse it.
- Later setup prompts should inject the saved Shopify admin URL, derived store handle, and duplicated approval theme reference instead of asking the member to find or type those values again.
- Checklist task content should use a single-column flow: task summary, why it matters, how to do it, done-when criteria, resources, and coaching prompt.
- Checklist tasks should be sequential. A task cannot be marked complete, and its action links/copy buttons should not be usable, until the previous task is complete.
- Modules should be sequential. Module 2 should be visible but locked until Module 1 is complete, including direct URL access.
- Checklist content includes researched durable references for Shopify theme backups/duplicates, Shopify CLI owner login, Shopify CLI setup, Shopify CLI environments, theme pull/dev/push commands, Shopify-GitHub workflow, GitHub account setup, and Codex/OpenAI setup. Collaborator access and Theme Access are documented as exception paths, not default member tasks.
- Optional video help should point to durable channels or searches rather than relying on John-recorded videos that will date quickly.
- Checklist progress can be marked complete/incomplete and persists across reloads in the same browser for this MVP.
- The interface should be comfortable to scan on desktop and mobile, with no marketing-style landing page before the actual member work surface.

## Acceptance Criteria (Verifiable)

- Visiting `/members` while logged out redirects to `/members/login`.
- Visiting `/members/login` shows a plain email plus invite-code form, expected development access guidance, and useful validation errors.
- Submitting valid MVP credentials creates a session and redirects to `/members`.
- The `/members` page greets the member, shows module cards, links to the Module 1 page, and includes a logout action.
- The `/members/modules/ai-assisted-shopify-setup` page shows Module 1 details, checklist progress, and a way back to the dashboard.
- The dashboard shows Module 2 as locked until Module 1 is complete.
- Directly visiting `/members/modules/measurement-signal-health` while Module 1 is incomplete shows a locked-module state.
- Each checklist item exposes the task, why it matters, step-by-step how-to guidance, done-when criteria, time estimate, and resource links in a single-column layout.
- Guide steps with actions include direct links at the point of instruction.
- Prompt steps include visible prompt text and a copy button.
- Saving a Shopify admin URL generates store-specific Shopify admin links for later steps.
- Saving the duplicated approval theme name or ID makes it available in later Codex setup prompts.
- The local workspace setup prompt includes the saved admin URL, detected store handle, and duplicated approval theme reference.
- Module 1 no longer asks members to install GitHub Desktop or learn GitHub branching manually.
- Module 1 treats Shopify CLI owner login as the default access path for members working on their own store.
- Module 1 ends with a Codex-managed local Shopify CLI environment and explicit no-live-publish rules.
- Module 1 requires project-workflow setup before Codex edits theme files.
- Module 1 includes Shopify-specific instructions for `README.md`, `AGENTS.md`, `.project-workflow/CONSTITUTION.md`, and future branch/task workflow.
- Module 1 instructs Codex to run through the project-workflow constitution setup flow so `README.md`, `AGENTS.md`, `.project-workflow/CONSTITUTION.md`, and `.project-workflow/TRACKER.md` are created or updated as part of the setup.
- Checklist source documentation exists for the coaching team to review and update.
- Locked checklist steps cannot be marked complete and do not expose usable action links or prompt copy buttons.
- Marking checklist items complete updates the visible progress and survives a page refresh in the same browser.
- Resource links open official documentation or stable video/channel/search pages.
- `npm run lint` passes for the touched app code.
- A local dev server can be started so John can inspect the member flow in browser.

## Open Questions (Answer Needed)

- None blocking for the first inspectable MVP.

## Decisions (Resolved)

- MVP auth will use email plus a shared invite code, backed by a signed HTTP-only cookie. Production deployments must set `SHOPIFY_GROWTH_COACHING_ACCESS_CODE` and `MEMBER_SESSION_SECRET`; local development may use safe preview defaults.
- Checklist progress will persist in browser storage for the MVP. Server persistence tied to `customerKey`/Firestore is the future source of truth once the first three-client workflow is confirmed, so John can view member progress.
- Each module will have its own URL and should be structured as database-shaped module/checklist data even while the MVP stores content in code.
- The first checklist will use official docs as primary resources and optional YouTube/channel/search links as secondary help.
- The student area will be named "Member Area" in UI copy to match the coaching membership direction.

## Research Notes

- Shopify collaborator accounts: https://help.shopify.com/en/manual/your-account/staff-accounts/collaborator-accounts
- Shopify partner request-access flow: https://help.shopify.com/en/partners/dashboard/request-access
- Shopify Theme Access app docs: https://shopify.dev/docs/storefronts/themes/tools/theme-access
- Shopify Theme Access app listing: https://apps.shopify.com/theme-access
- Shopify theme management, duplicates, preview, and publishing: https://help.shopify.com/en/manual/online-store/themes/managing-themes
- Shopify CLI overview: https://shopify.dev/docs/storefronts/themes/tools/cli
- Shopify CLI installation and requirements: https://shopify.dev/docs/api/shopify-cli
- Shopify CLI environments: https://shopify.dev/docs/storefronts/themes/tools/cli/environments
- Shopify CLI theme pull: https://shopify.dev/docs/api/shopify-cli/theme/theme-pull
- Shopify CLI theme dev: https://shopify.dev/docs/api/shopify-cli/theme/theme-dev
- Shopify CLI theme push: https://shopify.dev/docs/api/shopify-cli/theme/theme-push
- Shopify customize existing merchant theme tutorial: https://shopify.dev/docs/storefronts/themes/getting-started/customize
- Shopify GitHub integration for themes: https://shopify.dev/docs/storefronts/themes/tools/github
- GitHub account setup: https://docs.github.com/en/get-started/onboarding/getting-started-with-your-github-account
- ChatGPT sign-in/sign-up: https://chatgpt.com
- OpenAI Codex help: https://help.openai.com/en/articles/11369540-using-codex-with-your-chatgpt-plan
- OpenAI Codex documentation: https://developers.openai.com/codex
- Optional Shopify video source: https://www.youtube.com/@learnwithshopify
- Optional Shopify developer video source: https://www.youtube.com/@ShopifyDevs

## Validation Plan

- Run `npm run lint`.
- Manually inspect `/members/login` and `/members` in the dev server.
- Verify logged-out redirect, valid login, logout, checklist completion toggles, reload persistence, and responsive layout.
