# Requirements

## Summary

- Task: TASK-007
- Title: Create a pre-Shopify readiness gate that records operating system, admin access, current tooling, and whether Node, NVM, Git, and Shopify CLI are already available
- Parent AC Coverage: AC1
- Last updated: 2026-06-17

## Overview

Add the first practical slice of the new computer setup readiness flow to the existing Shopify Growth Coaching member checklist.

This task creates the readiness gate only. It records the member's operating system, whether they can approve administrator-level changes, and whether Node, NVM, Git, and Shopify CLI are already available or still unknown. Later epic tasks will expand this into the full Mac-first installation flow, copyable install prompts, OS permission education, and Windows split path.

## User Story

As a non-technical Shopify Growth Coaching member, I want to record what kind of computer setup I already have before starting Shopify setup, so that Codex and the coaching checklist know what needs to be checked or installed next.

## Goal

Members encounter a readiness gate before Shopify-specific setup tasks and can save the basic setup facts needed to decide what happens next.

## Non-Goals

- No complete Mac installation flow.
- No Windows implementation beyond recording the operating system.
- No model-operated installer prompts beyond the readiness inspection prompt.
- No admin/operator authoring UI for readiness questions.
- No new database collection; use the existing module progress response storage.

## Users & Context

The affected user is a Shopify merchant entering coaching with an ordinary personal or business computer, not a prepared developer machine. They may not know whether they have Node, NVM, Git, or Shopify CLI, and they may not understand when Codex needs permission to make local changes.

The existing Module 1 already includes Shopify admin setup, theme duplication, Shopify CLI access, local tooling checks, and prompt copy buttons. This task moves the first readiness check ahead of Shopify-specific work and stores the answers as structured member responses.

## Requirements (Outcome-Focused)

- The first checklist step in the setup module captures computer readiness before Shopify admin URL, theme duplication, or Shopify CLI tasks.
- The readiness gate captures operating system, administrator/access confidence, and status for Node, NVM, Git, and Shopify CLI.
- The readiness gate should be plain-language and should not assume the member knows what those tools are.
- The readiness gate should include a copyable prompt that asks the active AI assistant to inspect the computer and report back without installing or changing anything yet.
- The saved readiness answers must persist through the existing member progress API and be available after refresh.
- Members should not be able to mark the readiness task complete until the required readiness answers have been saved.

## Acceptance Criteria (Verifiable)

- AC1: Covers parent AC(s) AC1: Module 1 starts with a computer readiness checklist item before Shopify-specific setup work.
- AC2: Covers parent AC(s) AC1: The readiness checklist item captures operating system, admin/access confidence, Node status, NVM status, Git status, and Shopify CLI status.
- AC3: Covers parent AC(s) AC1: Readiness answers save through `/api/members/progress`, persist in development fallback responses and Firestore responses, and rehydrate on reload.
- AC4: Covers parent AC(s) AC1: The readiness checklist item cannot be marked complete until all required readiness answers are saved.
- AC5: Covers parent AC(s) AC1: The readiness item includes a copyable inspection prompt that asks the model to check and report, not install or change anything yet.

## Open Questions (Answer Needed)

- None blocking for this first slice.

## Decisions (Resolved)

- Implement this as the first item in the existing `ai-assisted-shopify-setup` module for now, because module restructuring is tracked separately under EPIC-001 AC3.
- Store readiness fields inside the existing `MemberSavedResponses` response map instead of adding a new collection.
- Use plain select controls with an "I am not sure yet" option so non-technical members can proceed honestly before Codex inspects the machine.
- Keep exact installation flow and OS permission education out of this task; those are tracked by TASK-015 and TASK-016.

## Validation Plan

- Run `npm run lint`.
- Verify the setup module source shows the readiness item before Shopify admin and Shopify CLI tasks.
- Verify the progress API accepts readiness response fields and returns them in the saved progress response.
- Verify the completion requirement blocks the readiness task until required answers are saved.
- Run `./.project-workflow/cli/workflow doctor`.
