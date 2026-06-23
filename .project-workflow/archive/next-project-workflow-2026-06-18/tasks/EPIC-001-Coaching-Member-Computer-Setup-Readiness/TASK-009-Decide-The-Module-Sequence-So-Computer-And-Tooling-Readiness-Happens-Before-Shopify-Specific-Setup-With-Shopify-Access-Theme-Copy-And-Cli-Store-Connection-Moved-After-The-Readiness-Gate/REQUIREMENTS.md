# Requirements

## Summary

- Task: TASK-009
- Title: Decide the module sequence so computer and tooling readiness happens before Shopify-specific setup, with Shopify access, theme copy, and CLI store connection moved after the readiness gate
- Parent AC Coverage: AC3
- Last updated: 2026-06-17

## Overview

This epic child delivers AC3 for EPIC-001 as part of the Shopify Growth Coaching computer setup readiness path.

## User Story

As a non-technical Shopify Growth Coaching member, I want the setup checklist to guide the model-operated computer setup safely, so that I can prepare my computer without needing to become a developer.

## Goal

Make computer setup readiness the first module and move Shopify setup behind it.

## Non-Goals

- No done-for-you custom support path for one member computer.
- No manual shell-command tutorial aimed at non-technical members.
- No secret sharing with AI models.
- No Windows implementation unless specifically covered by this child scope.

## Users & Context

The member may have an ordinary Mac or PC with no known development setup. The active model, usually Codex or Claude, is expected to inspect, explain, install where approved, verify, and summarize.

## Requirements (Outcome-Focused)

- Computer Setup Readiness is Module 1.
- AI-Assisted Shopify Setup is Module 2 and remains locked until Module 1 is complete.
- Measurement And Signal Health becomes Module 3 and remains locked until Module 2 is complete.

## Acceptance Criteria (Verifiable)

- AC1: The module list orders computer readiness before Shopify setup.
- AC2: Shopify admin, theme copy, and Shopify CLI store connection tasks live in Module 2.
- AC3: Module locking continues to use the existing previous-module completion rule.

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
