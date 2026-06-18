# Project Workflow Guidance

Use this file for workspace-level workflow conventions that should survive project-workflow init refreshes.

## Workspace Ownership

- The workspace root `/Users/johndetlefs/repos/johndetlefs` is the project/control repo for JohnDetlefs.com.
- Keep the main backlog in this parent `.project-workflow/` directory.
- Use child repo trackers only for explicitly app-local work. Do not track parent-owned `product-ads/`, lead-magnet packet, roadmap, product memory, or cross-repo work inside `next/.project-workflow/` or `email/.project-workflow/`.
- Keep Git operations scoped to the repo that owns the changed files unless a task explicitly lists multiple repos.

## Required Task Metadata

Each workspace task should record these fields in its requirements or implementation notes:

- Primary repo: the repo that owns the main changed files.
- Repos touched: every repo expected to change.
- Branch/PR: branch names and pull request links or status for each touched repo.
- Workflow owner: whether the task belongs to the parent workspace tracker or a child app-local tracker.

## Owner Gates

- After creating a task or epic, treat all requirements, acceptance criteria, and implementation plans as drafts until the owner explicitly approves them.
- Do not move a task or epic into implementation, do not mark a plan confirmed, and do not edit product/code files for that work item until the owner has reviewed and approved the requirements and implementation plan.
- If the owner gives broad product context, capture it in the workflow docs first, summarize the proposed requirements and plan, then stop for approval before executing.
- This gate applies even when the scope seems obvious or low-risk.

## Validation

- Use `./.project-workflow/cli/workflow doctor` from the workspace root after tracker or task-doc changes.
- Use child repo validation from the child repo root when a task touches deployable app code.
