# Requirements

## Overview

- Goal (in user terms): Allow content publishers to author and publish site content through MDX files instead of creating a new code page per piece of content.
- Primary user(s): Internal content publisher/editor and end users consuming published pages.
- Desired outcome: Nested content files under a top-level content source are rendered as live routes in the app with reusable MDX components for rich content.

## User Story

As a content publisher, I want to create nested MDX content files with frontmatter in a top-level `content` directory, so that pages are published to the site from content files without requiring code changes for each page.

## In Scope

- A top-level content source folder and recursive/nested content structure.
- Route generation in `app` based on the nested content structure.
- Frontmatter + MDX body parsing for each content item.
- Rendering reusable MDX components (at minimum: video, Next.js links, Sendy signup form component).
- Publishing workflow where adding/updating MDX content makes it available to end users.

## Out of Scope

- Building a CMS UI/editor for managing content.
- Redesigning existing booking or legal pages.
- Implementing unrelated new page templates outside MDX content pages.
- Large-scale SEO strategy changes not required for content page publishing.

## Requirements

List requirements as outcomes/expectations, not implementation details.

### Functional Requirements

- The system must support a top-level content source with nested directories and index-based entries that map to routable root-level pages (for example `/<slug>` and `/<parent>/<slug>`).
- Content publishers must be able to define page metadata through frontmatter and page body through MDX.
- Required frontmatter fields at launch are `title`, `description`, and `published`; optional fields include `heroImage`, `heroVideo`, and `cta`.
- The app must render MDX content at user-accessible routes derived from the content path.
- Routing implementation in `app` should use a recursive catch-all pattern (e.g., `[...slug]`) for content pages, while preserving existing app routes.
- Directory index mapping is `content/<segment>/index.mdx` -> `/<segment>`.
- The system must protect reserved existing routes (such as booking, privacy, terms-of-use, success, and API paths) from being overridden by content slugs.
- The system must fail CI/build when any content-derived slug collides with a reserved existing route.
- The content renderer must support a safe, reusable set of MDX components including video embeds, internal/external links, and Sendy signup forms.
- Content changes must be publishable through repository content updates without requiring per-page route/component creation.
- Content authoring format is MDX-only (`.mdx`) for this story.

### Non-Functional Requirements

- Performance / latency: Content pages should render within current site performance expectations for static/dynamic routes.
- Security / permissions: MDX component usage must be controlled to avoid arbitrary component/script execution.
- Accessibility: Rendered content and reusable components must follow existing accessibility standards used in the app.
- Observability (logs/metrics/audit expectations): Invalid content/frontmatter must fail CI checks, and local/dev workflows must emit warnings with enough detail to identify the source file.

## Acceptance Criteria

- AC1: A nested content structure under a top-level content source can produce routable pages for top-level and second-level paths.
- AC2: Each content page is rendered from frontmatter + MDX content and is visible to end users at the expected URL.
- AC3: MDX content can use approved reusable components for video, links, and Sendy signup forms.
- AC4: Content pages are published at root-level routes derived from the content tree (without exposing `content` in the URL) and route correctly for top-level and second-level pages.
- AC5: A content publisher can add or update an MDX file and have the corresponding page reflect the change through the normal publish/deploy flow.
- AC6: Invalid content/frontmatter fails in CI and produces warnings (without hard failure) in local/dev.
- AC7: Reserved existing routes remain intact and are not overridden by content-derived slugs.
- AC8: Any reserved-route collision in content files causes CI/build failure with clear file-level diagnostics.
- AC9: Directory index pages use `index.mdx` naming and map to segment root URLs (for example `content/guides/index.mdx` -> `/guides`).

## Assumptions

- Content source files are version-controlled in this repository.
- Route structure will be derived deterministically from folder/file naming.
- Existing app styling/layout primitives can be reused for rendered content pages.

## Open Questions

- None at this time.

## Decisions Log

- Decision:
  - Context: Content authoring workflow for JD-004.
  - Options considered: Code-authored pages only vs markdown-only vs MDX-based content.
  - Chosen: MDX content files as the publishing source.
  - Why: Enables publisher-managed content with reusable rich components and consistent authoring format.
- Decision:
  - Context: Content hierarchy needs.
  - Options considered: Flat content list vs nested recursive folders.
  - Chosen: Nested recursive content folders.
  - Why: Supports top-level and second-level content organization and future growth.
- Decision:
  - Context: Public routing namespace for markdown/MDX pages.
  - Options considered: Root-level routes vs `/content/<...>`.
  - Chosen: Root-level routes with catch-all routing and reserved-route protection.
  - Why: Matches desired publisher/end-user URL structure while keeping existing application routes safe.
- Decision:
  - Context: Launch frontmatter schema.
  - Options considered: Minimal title-only vs expanded SEO schema.
  - Chosen: Required `title`, `description`, `published`; optional `heroImage`, `heroVideo`, `cta`.
  - Why: Provides sufficient content metadata with optional rich hero/CTA support.
- Decision:
  - Context: Content file format policy (Q2).
  - Options considered: `.md` only, mixed `.md`+`.mdx`, `.md` with shortcodes, and MDX-only.
  - Chosen: MDX-only (`.mdx`) content files.
  - Why: Simplest model for reusable components in body content with predictable tooling.
- Decision:
  - Context: Invalid content handling policy.
  - Options considered: Fail everywhere vs warnings only vs environment-specific strictness.
  - Chosen: Fail in CI, warn in local/dev.
  - Why: Protects production quality while preserving local authoring iteration speed.
- Decision:
  - Context: Root-level route collision handling for content-derived slugs (Q1).
  - Options considered: Runtime precedence only vs CI/build fail-fast vs explicit override.
  - Chosen: A) Hard fail in CI/build on any reserved-route collision.
  - Why: Prevents accidental shadowing of critical routes and catches misconfiguration before release.
- Decision:
  - Context: Recursive directory index URL mapping (Q3).
  - Options considered: `index.mdx`, `_index.mdx`, or no directory index pages.
  - Chosen: A) `content/<segment>/index.mdx` maps to `/<segment>`.
  - Why: Conventional, predictable routing with minimal authoring friction.

## Validation Plan (User-Facing)

- How the user will verify "done":
  - AC1 -> Create sample top-level and second-level content entries; confirm both route paths resolve successfully.
  - AC2 -> Confirm frontmatter fields and MDX body render on page as authored.
  - AC3 -> Place video, link, and Sendy components in MDX; verify each renders and behaves as expected.
  - AC4 -> Confirm pages are accessible at root-level URLs derived from content paths and do not include `content` in the URL.
  - AC5 -> Update an existing content file, run publish/deploy flow, and confirm end-user page reflects updates.
  - AC6 -> Introduce an invalid frontmatter/content case; verify CI fails while local/dev surfaces warnings.
  - AC7 -> Create a content slug that matches a reserved route and confirm reserved route behavior is preserved and the content slug is rejected or redirected per implementation policy.
  - AC8 -> Add a fixture content file that collides with a reserved route and confirm CI/build fails with clear source-file diagnostics.
  - AC9 -> Create `content/guides/index.mdx` and confirm it resolves to `/guides`; create `content/guides/getting-started/index.mdx` and confirm it resolves to `/guides/getting-started`.
- Rollout notes (if any): Start with a small content subset to validate routing and authoring before broad migration.
