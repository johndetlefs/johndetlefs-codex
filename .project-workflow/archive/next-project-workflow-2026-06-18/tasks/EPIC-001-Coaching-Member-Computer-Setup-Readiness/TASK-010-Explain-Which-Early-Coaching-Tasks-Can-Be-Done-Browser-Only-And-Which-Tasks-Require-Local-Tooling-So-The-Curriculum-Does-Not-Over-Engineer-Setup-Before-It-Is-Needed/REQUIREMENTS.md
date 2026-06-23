# Requirements

## Summary

- Task: TASK-010
- Title: Explain which early coaching tasks can be done browser-only and which tasks require local tooling, so the curriculum does not over-engineer setup before it is needed
- Parent AC Coverage: AC4
- Last updated: 2026-06-17

## Overview

This epic child delivers AC4 for EPIC-001 as part of the Shopify Growth Coaching computer setup readiness path.

## User Story

As a non-technical Shopify Growth Coaching member, I want the setup checklist to guide the model-operated computer setup safely, so that I can prepare my computer without needing to become a developer.

## Goal

Label and explain browser-only, inspection-only, verification, permission, and local setup steps.

## Non-Goals

- No done-for-you custom support path for one member computer.
- No manual shell-command tutorial aimed at non-technical members.
- No secret sharing with AI models.
- No Windows implementation unless specifically covered by this child scope.

## Users & Context

The member may have an ordinary Mac or PC with no known development setup. The active model, usually Codex or Claude, is expected to inspect, explain, install where approved, verify, and summarize.

## Requirements (Outcome-Focused)

- Module 1 explains which setup work is browser-only and which work needs local access.
- Checklist items can display setup requirement labels.
- The UI renders the setup requirement label in each checklist card when present.

## Acceptance Criteria (Verifiable)

- AC1: Members can distinguish browser-only tasks from local setup tasks before approving changes.
- AC2: Checklist item data supports setup requirement labels.
- AC3: Checklist cards display the labels without changing the existing task flow.

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
