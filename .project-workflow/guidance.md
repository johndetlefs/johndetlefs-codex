# Project Workflow Guidance

Use this file for workspace-level workflow conventions that should survive project-workflow init refreshes.

## Workspace Ownership

- The workspace root `/Users/johndetlefs/repos/johndetlefs` is the project/control repo for JohnDetlefs.com.
- Keep the only live backlog in this parent `.project-workflow/` directory.
- Do not create child repo trackers in `next/.project-workflow/` or `email/.project-workflow/`.
- Run project-workflow from the parent workspace even when a task's implementation touches only `next/` or only `email/`.
- Historical child workflow state is preserved under `.project-workflow/archive/` for lookup only. Do not update archived trackers as live workflow state.
- Keep Git operations scoped to the repo that owns the changed files unless a task explicitly lists multiple repos.

## Required Task Metadata

Each workspace task should record these fields in its requirements or implementation notes:

- Primary repo: the repo that owns the main changed files.
- Repos touched: every repo expected to change.
- Branch/PR: branch names and pull request links or status for each touched repo.
- Workflow owner: parent workspace tracker.
- Archived context: any archived child workflow document this task continues or supersedes.

## Owner Gates

- After creating a task or epic, treat all requirements, acceptance criteria, and implementation plans as drafts until the owner explicitly approves them.
- Do not move a task or epic into implementation, do not mark a plan confirmed, and do not edit product/code files for that work item until the owner has reviewed and approved the requirements and implementation plan.
- If the owner gives broad product context, capture it in the workflow docs first, summarize the proposed requirements and plan, then stop for approval before executing.
- This gate applies even when the scope seems obvious or low-risk.

## Validation

- Use `./.project-workflow/cli/workflow doctor` from the workspace root after tracker or task-doc changes.
- Use child repo validation from the child repo root when a task touches deployable app code.
