# Requirements

## Summary

- Task: TASK-015
- Title: Provide exact copyable prompts for AI-assisted inspection, installation, verification, and setup summaries
- Parent AC Coverage: AC9
- Last updated: 2026-06-17

## Overview

This epic child delivers AC9 for EPIC-001 as part of the Shopify Growth Coaching computer setup readiness path.

## User Story

As a non-technical Shopify Growth Coaching member, I want the setup checklist to guide the model-operated computer setup safely, so that I can prepare my computer without needing to become a developer.

## Goal

Give members exact prompts that ask the active model to do the technical work safely.

## Non-Goals

- No done-for-you custom support path for one member computer.
- No manual shell-command tutorial aimed at non-technical members.
- No secret sharing with AI models.
- No Windows implementation unless specifically covered by this child scope.

## Users & Context

The member may have an ordinary Mac or PC with no known development setup. The active model, usually Codex or Claude, is expected to inspect, explain, install where approved, verify, and summarize.

## Requirements (Outcome-Focused)

- Every technical readiness step includes a copyable prompt.
- Prompts ask the model to inspect first, explain commands, request approval before changes, verify outputs, and summarize results.
- Prompts avoid asking the member to manually run developer installation instructions.

## Acceptance Criteria (Verifiable)

- AC1: Inspection, access education, Mac tools, NVM/Node, Shopify CLI, and setup summary prompts are present.
- AC2: Prompts include approval and verification instructions.
- AC3: The UI copy button pattern is reused for every prompt.

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
