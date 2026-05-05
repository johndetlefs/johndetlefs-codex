# JohnDetlefs.com Workspace

This directory is the shared workspace for the JohnDetlefs.com project.

Before making positioning, content, funnel, or cross-repo decisions, read `PROJECT_CONTEXT.md` in this directory for product memory.

Workspace-level Codex skills live in `.codex/skills/`. Use `.codex/skills/guide-video-pipeline` when planning or producing guide videos, guide pages, short-form repurposing, YouTube packages, or Meta Ads.

## Project Boundaries

- Treat `/Users/johndetlefs/repos/johndetlefs` as the overall JohnDetlefs.com project workspace.
- `next/` and `email/` are separate Git repositories and project components inside this workspace.
- Coordinate product, content, and implementation decisions across both repositories when the user refers to JohnDetlefs.com.
- Keep Git operations scoped to the relevant child repository unless the user explicitly asks for cross-repo work.

## Component Repositories

- `next/`: the website application.
- `email/`: email-related project code and assets.

When working inside a component repository, follow that repository's own instructions first, while preserving this workspace-level project context.
