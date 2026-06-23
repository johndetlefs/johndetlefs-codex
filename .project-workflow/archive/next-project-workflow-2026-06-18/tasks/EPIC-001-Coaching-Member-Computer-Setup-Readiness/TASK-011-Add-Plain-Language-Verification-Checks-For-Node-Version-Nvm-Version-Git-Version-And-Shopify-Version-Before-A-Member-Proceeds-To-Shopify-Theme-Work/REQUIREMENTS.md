# Requirements

## Summary

- Task: TASK-011
- Title: Add plain-language verification checks for node --version, nvm --version, git --version, and shopify version before a member proceeds to Shopify theme work
- Parent AC Coverage: AC5
- Last updated: 2026-06-17

## Overview

This epic child delivers AC5 for EPIC-001 as part of the Shopify Growth Coaching computer setup readiness path.

## User Story

As a non-technical Shopify Growth Coaching member, I want the setup checklist to guide the model-operated computer setup safely, so that I can prepare my computer without needing to become a developer.

## Goal

Make exact verification outputs part of the readiness handoff before Shopify theme work.

## Non-Goals

- No done-for-you custom support path for one member computer.
- No manual shell-command tutorial aimed at non-technical members.
- No secret sharing with AI models.
- No Windows implementation unless specifically covered by this child scope.

## Users & Context

The member may have an ordinary Mac or PC with no known development setup. The active model, usually Codex or Claude, is expected to inspect, explain, install where approved, verify, and summarize.

## Requirements (Outcome-Focused)

- Module 1 asks the model to report exact version outputs for NVM, Node.js, npm, Git, and Shopify CLI.
- Module 2 re-checks `node --version`, `nvm --version`, `git --version`, and `shopify version` before Shopify theme work.
- If tools are missing in Module 2, the user is directed back to Module 1 instead of installing from the Shopify setup step.

## Acceptance Criteria (Verifiable)

- AC1: Version checks are visible in Module 1 setup prompts and done-when criteria.
- AC2: Module 2 re-checks all required commands before theme work.
- AC3: Missing tools route the member back to Module 1.

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
