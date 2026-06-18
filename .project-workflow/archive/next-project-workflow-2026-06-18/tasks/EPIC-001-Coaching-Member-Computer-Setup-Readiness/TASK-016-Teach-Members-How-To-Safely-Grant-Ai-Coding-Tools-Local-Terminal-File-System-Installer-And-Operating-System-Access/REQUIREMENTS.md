# Requirements

## Summary

- Task: TASK-016
- Title: Teach members how to safely grant AI coding tools local terminal, file-system, installer, and operating-system access
- Parent AC Coverage: AC10
- Last updated: 2026-06-17

## Overview

This epic child delivers AC10 for EPIC-001 as part of the Shopify Growth Coaching computer setup readiness path.

## User Story

As a non-technical Shopify Growth Coaching member, I want the setup checklist to guide the model-operated computer setup safely, so that I can prepare my computer without needing to become a developer.

## Goal

Teach safe permission boundaries before model-operated local setup begins.

## Non-Goals

- No done-for-you custom support path for one member computer.
- No manual shell-command tutorial aimed at non-technical members.
- No secret sharing with AI models.
- No Windows implementation unless specifically covered by this child scope.

## Users & Context

The member may have an ordinary Mac or PC with no known development setup. The active model, usually Codex or Claude, is expected to inspect, explain, install where approved, verify, and summarize.

## Requirements (Outcome-Focused)

- Module 1 includes a dedicated permission education step before local install steps.
- The access prompt explains terminal access, file-system access, command approvals, installer prompts, and administrator prompts.
- Copy warns members to enter passwords directly into trusted OS/app prompts and never paste secrets into the AI chat.

## Acceptance Criteria (Verifiable)

- AC1: Permission education appears before local setup steps.
- AC2: The prompt covers terminal, file-system, command, installer, and admin access.
- AC3: Secret-handling rules are explicit in member-facing copy and prompts.

## Open Questions (Answer Needed)

- None blocking.

## Decisions (Resolved)

- Mac-first setup is the implementation target for V1.
- The model should inspect and explain before changing local computer state.
- Members approve commands intentionally and enter passwords only into trusted OS/app prompts.
- Exact command execution belongs in copyable prompts for the model, not as unsupported member homework.

## Validation Plan

- Run npm run lint.
- Run npm run build.
- Inspect Module 1 and Module 2 checklist ordering/content.
- Run ./.project-workflow/cli/workflow doctor.
