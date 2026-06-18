---
name: project-workflow
description: "Use a repository's project-workflow commands in Codex. Trigger when the user asks for project.task, project.epic, project.requirements, project.clarify, project.planner, project.implement, project.delegate, project.qa-review, project.retro, project.constitution, task scaffolding, epic lifecycle management, requirements capture, clarification, implementation planning, tracked implementation, delegated work coordination, QA review, retro, or constitution updates."
---

# Project Workflow

Use this skill to run project-workflow from Codex.

## Before Acting

- Read `AGENTS.md` for repository-wide Codex guidance.
- Read the relevant reference file below before taking action.
- Treat files under `/.project-workflow/` as workflow state; update them exactly as the selected command requires.
- Ask only the minimum questions required by the selected workflow.
- Keep tracker status changes within the limits documented in the selected workflow reference.

## Repo-Scoped Skills First

When the current repository contains `.agents/skills/project-*`, prefer those repo-scoped skills over the bundled reference files. They are the installed operating contract for that repo and may include repo-specific CLI requirements, tracker rules, and task conventions.

Use this routing when present:

- Constitution work: `.agents/skills/project-constitution/SKILL.md`
- Task/story scaffolding: `.agents/skills/project-task/SKILL.md`
- Legacy task/story scaffolding alias: `.agents/skills/project-scaffold/SKILL.md`
- Epic lifecycle work: `.agents/skills/project-epic/SKILL.md`
- Requirements capture: `.agents/skills/project-requirements/SKILL.md`
- Implementation planning: `.agents/skills/project-planner/SKILL.md`
- Clarification: `.agents/skills/project-clarify/SKILL.md`
- Delegated implementation coordination: `.agents/skills/project-delegate/SKILL.md`
- Tracked implementation: `.agents/skills/project-implement/SKILL.md`
- QA/code review gate: `.agents/skills/project-qa-review/SKILL.md`
- Retro/convention updates: `.agents/skills/project-retro/SKILL.md`

Always read the repository `AGENTS.md` before acting. If it defines CLI requirements, use the local `.project-workflow/cli/workflow` command for every workflow operation it supports. Do not manually recreate CLI-supported task scaffolding or tracker-safe operations.

If repo-scoped skills are missing, fall back to the bundled Command Map below.

## Command Map

- `project.task`: read `references/project-task.md`.
- `project.epic`: read `references/project-epic.md`.
- `project.requirements`: read `references/project-requirements.md`.
- `project.clarify`: read `references/project-clarify.md`.
- `project.planner`: read `references/project-planner.md`.
- `project.implement`: read `references/project-implement.md`.
- `project.delegate`: read `references/project-delegate.md`.
- `project.qa-review`: read `references/project-qa-review.md`.
- `project.retro`: read `references/project-retro.md`.
- `project.constitution`: read `references/project-constitution.md`.

## Codex Adaptation Notes

- Where a copied reference says to read agent guidance, prefer `AGENTS.md` and repo-scoped `.agents/skills/project-*` files.
- Where a reference says to use another `project.*` workflow, continue within this `project-workflow` skill and load the mapped reference.
- Where a reference says "agent", interpret that as the current Codex skill workflow.
- Run local workflow commands from the repository root.
- Preserve the workflow gates around requirements, clarification, planning, validation, QA/code review, retro, tracker updates, and explicit user approval for marking work complete.
