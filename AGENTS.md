# JohnDetlefs.com Workspace

This directory is the shared workspace for the JohnDetlefs.com project.

Before making positioning, content, funnel, or cross-repo decisions, read `PROJECT_CONTEXT.md` in this directory for product memory.

Workspace-level Codex skills live in `.codex/skills/`. Use `.codex/skills/project-workflow` for workspace-level project workflow commands. Use `.codex/skills/guide-video-pipeline` when planning or producing guide videos, guide pages, short-form repurposing, YouTube packages, or Meta Ads.

The `next/` repo also has component-level Codex skills. Use `next/.codex/skills/report-lead-magnet` when planning, building, auditing, or extending interactive report-style lead magnets, analyzers, calculators, signed report links, report emails, operator notifications, or report conversion tracking.

Reusable lead-magnet frameworks and production packets live in `lead-magnets/`. Use `lead-magnets/_frameworks/` for systems that apply across multiple lead magnets, `lead-magnets/_templates/` when scaffolding a new lead magnet packet, and `lead-magnets/<lead-magnet-slug>/` for assets and decisions specific to one report.

## Project Boundaries

- Treat `/Users/johndetlefs/repos/johndetlefs` as the overall JohnDetlefs.com project workspace.
- Keep the only live JohnDetlefs.com project workflow state in `/.project-workflow/`. Parent-owned work includes website work, email work, product memory, roadmaps, lead magnets, guide/video packets, `product-ads/`, and cross-repo coordination.
- `next/` and `email/` are separate Git repositories and project components inside this workspace.
- Do not add `.project-workflow/` or `.codex/skills/project-workflow/` back to `next/` or `email/`; run project-workflow from the parent workspace even when the implementation files live in a child repo.
- Coordinate product, content, and implementation decisions across both repositories when the user refers to JohnDetlefs.com.
- Keep Git operations scoped to the relevant child repository unless the user explicitly asks for cross-repo work.
- When a workflow task spans repositories, record `Primary repo`, `Repos touched`, and branch/PR state in the task docs before implementation or handoff.
- Historical workflow state removed from child repos is preserved under `/.project-workflow/archive/`.

## Component Repositories

- `next/`: the website application.
- `email/`: email-related project code and assets.

When working inside a component repository, follow that repository's own instructions first, while preserving this workspace-level project context.
