## User Story

As a content reader, I want eligible guide pages to show a newsletter signup sidebar, so that I can subscribe without losing my place in the article.

## Goal

- Deliver an opt-in content-page aside that shows a sticky newsletter signup on desktop, stacks after the article on tablet and smaller screens, and reuses the existing Sendy-backed submission flow with inline feedback.

## Approach

- Implement the feature in two safe vertical slices: layout opt-in first, then newsletter-card interaction and Sendy flow compatibility.
- Keep the change frontmatter-driven so existing content pages remain unchanged unless `aside: true` is set.
- Reuse the existing server-backed Sendy enrollment path so `SENDY_LIST_ID` remains server-owned and logging stays consistent.

## Phases

### Phase 1

- Changes: Add `aside` frontmatter support and conditionally render a content-page aside layout that shows a desktop sidebar and stacks the newsletter card after the article content on tablet and smaller screens.
- Validation: Verify story `AC1` and `AC2` by checking a page with `aside: true` on desktop and tablet/mobile, and confirm a page without the flag remains unchanged.
- Tracker updates: Keep story status `Analysing` during planning and early implementation.

### Phase 2

- Changes: Deliver the newsletter signup card UI with the requested styling, simple name + email inputs, inline submission states, and compatibility with the existing Sendy-backed enrollment path.
- Validation: Verify story `AC3` and `AC4` by checking card content/styling, confirming inline submitting/success/error feedback, and running `npm run lint`.
- Tracker updates: Move to `Plan Confirmed` only after explicit user confirmation, then progress through implementation/testing states.

## Task List

- Story acceptance criteria source: `REQUIREMENTS.md` `AC1` through `AC4`.

|  ID | Title                                         | Description                                                                                                                                                                                                                   | Acceptance Criteria                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | User Verification                                                                                                                                                                                                                                                                                                                                                 | Status   |
| --: | --------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
|   1 | Enable aside-driven content layout            | Content pages can opt into an aside layout via frontmatter, showing a desktop sidebar and a stacked mobile layout with the newsletter card placed after the article content. Covers story `AC1` and `AC2`.                    | - `aside: true` is accepted in content frontmatter without breaking existing pages.<br>- Pages with `aside: true` render article plus aside on desktop and pages without it remain unchanged, satisfying story `AC1`.<br>- On desktop, the aside card stays pinned near the top while the article scrolls, satisfying the desktop portion of story `AC2`.<br>- On tablet and smaller screens, the aside stacks after the article content, satisfying the mobile portion of story `AC2`.                                                                       | - Add `aside: true` to a guide page and open it in the browser.<br>- Confirm desktop shows a sidebar beside the article and the card stays near the top while scrolling.<br>- Reduce to tablet/mobile width and confirm the newsletter card moves below the article.<br>- Remove `aside: true` and confirm the page returns to the existing single-column layout. | Complete |
|   2 | Deliver the newsletter signup card experience | The aside renders a styled newsletter signup card with the requested content, simple fields, and accessible inline feedback states. Covers story `AC3` and the UX portion of story `AC4`.                                     | - The card includes a title, brief description, name field, email field, and primary CTA, satisfying story `AC3`.<br>- The card uses a light blue background with a dark blue dotted outline, satisfying story `AC3`.<br>- Submission feedback updates inline for submitting, success, and error states without a page reload, satisfying the feedback portion of story `AC4`.<br>- Form controls and status messaging remain keyboard accessible.                                                                                                            | - Open a page with `aside: true` and inspect the card content and styling.<br>- Submit the form and confirm the CTA enters a submitting state and resolves to either success or error messaging inline.<br>- Tab through the inputs and submit button to confirm keyboard accessibility.                                                                          | Complete |
|   3 | Reuse the Sendy-backed enrollment path safely | Newsletter submissions continue through the existing server-backed Sendy enrollment flow so the configured environment list ID remains authoritative and observable. Covers the backend/configuration portion of story `AC4`. | - The content-page signup uses the existing Sendy-backed enrollment path rather than a separate client-side list configuration, satisfying story `AC4`.<br>- The server remains responsible for sourcing `SENDY_LIST_ID` from environment configuration, satisfying the configuration requirement behind story `AC4`.<br>- Existing enrollment logging continues to capture request success and failure paths for this signup flow.<br>- The shared enrollment path remains compatible with existing usage so the new form does not regress the booking flow. | - Submit the newsletter form with valid details and confirm a successful inline response.<br>- Submit invalid input and confirm the error state renders inline without a reload.<br>- Run `npm run lint` and confirm the related files pass static checks.                                                                                                        | Complete |

## Files / Areas Likely to Change

- `app/_lib/content-pages.ts`
- `app/[...slug]/page.tsx`
- `components/SendySignupForm.tsx`
- `app/api/booking/enrollment/route.ts`
- `app/api/booking/_lib/sendy-enrollment.ts`
- Representative MDX content page(s) used for manual verification

## Data / RLS / RPC / Migrations

- No database, RLS, RPC, or migration changes are expected for this story.
- The only configuration dependency is the existing server-side `SENDY_LIST_ID` environment variable.

## Risks & Mitigations

- Risk: Updating the shared enrollment path could regress the existing booking flow.<br>Mitigation: Keep the server path backward-compatible and validate both the new newsletter form and the existing enrollment usage.
- Risk: The new two-column layout could change spacing or scroll behavior on pages without the feature enabled.<br>Mitigation: Gate the layout behind `aside: true` and verify pages without the flag remain unchanged.
- Risk: The sidebar card could miss the approved responsive order or inline feedback behavior.<br>Mitigation: Validate directly against the requirements doc acceptance criteria on desktop and smaller breakpoints.

## Notes

- Task: TASK-001
- Title: Content Aside w/ Newsletter Signup
- Created: 2026-04-04
- Clarified: On tablet and smaller screens, the stacked newsletter card appears after the article content.
