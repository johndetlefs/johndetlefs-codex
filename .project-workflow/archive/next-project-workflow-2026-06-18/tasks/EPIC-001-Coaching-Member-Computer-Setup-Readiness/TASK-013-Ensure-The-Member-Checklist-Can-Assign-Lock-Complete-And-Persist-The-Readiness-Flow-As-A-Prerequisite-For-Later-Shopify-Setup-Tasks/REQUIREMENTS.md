# Requirements

## Summary

- Task: TASK-013
- Title: Ensure the member checklist can assign, lock, complete, and persist the readiness flow as a prerequisite for later Shopify setup tasks
- Parent AC Coverage: AC7
- Last updated: 2026-06-17

## Overview

This epic child delivers AC7 for EPIC-001 as part of the Shopify Growth Coaching computer setup readiness path.

## User Story

As a non-technical Shopify Growth Coaching member, I want the setup checklist to guide the model-operated computer setup safely, so that I can prepare my computer without needing to become a developer.

## Goal

Use the existing module progress and locking system to make readiness a prerequisite.

## Non-Goals

- No done-for-you custom support path for one member computer.
- No manual shell-command tutorial aimed at non-technical members.
- No secret sharing with AI models.
- No Windows implementation unless specifically covered by this child scope.

## Users & Context

The member may have an ordinary Mac or PC with no known development setup. The active model, usually Codex or Claude, is expected to inspect, explain, install where approved, verify, and summarize.

## Requirements (Outcome-Focused)

- Readiness is assigned as Module 1 through the existing coaching module list.
- Module 2 is locked until Module 1 is complete.
- Readiness answers persist with member progress and completion is blocked until required answers are saved.

## Acceptance Criteria (Verifiable)

- AC1: Readiness tasks appear as the first assigned module.
- AC2: Shopify setup cannot be accessed until readiness is complete.
- AC3: Required readiness answers persist and gate completion.

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
