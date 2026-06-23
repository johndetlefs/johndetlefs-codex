# Requirements

## Summary

- Task: TASK-012
- Title: Define the future Windows split path at the curriculum and data-model level so Mac and Windows setup instructions can diverge cleanly later
- Parent AC Coverage: AC6
- Last updated: 2026-06-17

## Overview

This epic child delivers AC6 for EPIC-001 as part of the Shopify Growth Coaching computer setup readiness path.

## User Story

As a non-technical Shopify Growth Coaching member, I want the setup checklist to guide the model-operated computer setup safely, so that I can prepare my computer without needing to become a developer.

## Goal

Prepare the curriculum and persisted readiness data for a future Windows path without building full Windows setup now.

## Non-Goals

- No done-for-you custom support path for one member computer.
- No manual shell-command tutorial aimed at non-technical members.
- No secret sharing with AI models.
- No Windows implementation unless specifically covered by this child scope.

## Users & Context

The member may have an ordinary Mac or PC with no known development setup. The active model, usually Codex or Claude, is expected to inspect, explain, install where approved, verify, and summarize.

## Requirements (Outcome-Focused)

- Readiness responses persist the selected operating system.
- Module 1 content explicitly says V1 is Mac-first and Windows users should save the OS answer and bring it to coaching.
- The data model can branch future setup instructions from the saved operating system field.

## Acceptance Criteria (Verifiable)

- AC1: Operating system is saved as structured member response data.
- AC2: Mac-specific steps tell non-Mac users not to follow the Mac path blindly.
- AC3: Future Windows implementation can branch from persisted readiness responses.

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
