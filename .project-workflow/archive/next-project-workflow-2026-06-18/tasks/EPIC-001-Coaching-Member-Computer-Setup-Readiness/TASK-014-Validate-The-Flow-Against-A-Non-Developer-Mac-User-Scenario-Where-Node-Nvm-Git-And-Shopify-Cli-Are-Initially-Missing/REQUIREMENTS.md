# Requirements

## Summary

- Task: TASK-014
- Title: Validate the flow against a non-developer Mac user scenario where Node, NVM, Git, and Shopify CLI are initially missing
- Parent AC Coverage: AC8
- Last updated: 2026-06-17

## Overview

This epic child delivers AC8 for EPIC-001 as part of the Shopify Growth Coaching computer setup readiness path.

## User Story

As a non-technical Shopify Growth Coaching member, I want the setup checklist to guide the model-operated computer setup safely, so that I can prepare my computer without needing to become a developer.

## Goal

Confirm the flow works for an Alex-style Mac user with no assumed developer setup.

## Non-Goals

- No done-for-you custom support path for one member computer.
- No manual shell-command tutorial aimed at non-technical members.
- No secret sharing with AI models.
- No Windows implementation unless specifically covered by this child scope.

## Users & Context

The member may have an ordinary Mac or PC with no known development setup. The active model, usually Codex or Claude, is expected to inspect, explain, install where approved, verify, and summarize.

## Requirements (Outcome-Focused)

- The readiness path accepts `not-sure` or missing tool statuses without shaming or blocking the user from recording honest answers.
- Mac setup steps explain what each tool is for before asking the model to install or verify it.
- The setup summary gives a clear handoff before Shopify setup.

## Acceptance Criteria (Verifiable)

- AC1: A non-developer Mac user can start with unknown/missing tool answers.
- AC2: The Mac path explains missing Command Line Tools, NVM, Node.js, Git, and Shopify CLI in plain language.
- AC3: The summary step identifies remaining blockers before Shopify work begins.

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
