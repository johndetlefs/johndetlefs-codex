# Requirements

## Summary

- Task: TASK-008
- Title: Provide a Mac-first beginner setup path that installs the minimum required developer tools, preferring Xcode Command Line Tools over full Xcode unless full Xcode is proven necessary
- Parent AC Coverage: AC2
- Last updated: 2026-06-17

## Overview

This epic child delivers AC2 for EPIC-001 as part of the Shopify Growth Coaching computer setup readiness path.

## User Story

As a non-technical Shopify Growth Coaching member, I want the setup checklist to guide the model-operated computer setup safely, so that I can prepare my computer without needing to become a developer.

## Goal

Add the Mac-first setup path for minimum local tooling before Shopify setup.

## Non-Goals

- No done-for-you custom support path for one member computer.
- No manual shell-command tutorial aimed at non-technical members.
- No secret sharing with AI models.
- No Windows implementation unless specifically covered by this child scope.

## Users & Context

The member may have an ordinary Mac or PC with no known development setup. The active model, usually Codex or Claude, is expected to inspect, explain, install where approved, verify, and summarize.

## Requirements (Outcome-Focused)

- Module 1 includes a Mac command-line tools step that prefers Xcode Command Line Tools over full Xcode.
- Module 1 includes an NVM and Node.js step that asks the model to inspect first, then install only after approval.
- Module 1 includes a Shopify CLI install/verify step after Node, npm, and Git are available.

## Acceptance Criteria (Verifiable)

- AC1: Mac setup guidance prefers Command Line Tools over full Xcode unless the model explains a real need.
- AC2: NVM and Node.js setup is handled through copyable model prompts, not raw member-run install instructions.
- AC3: Shopify CLI setup is gated behind Node, npm, and Git verification.

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
