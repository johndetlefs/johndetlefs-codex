# Report Lead Magnet Diagnostic Videos

Use this pattern for videos embedded in report-style lead magnets. These are not generic founder-led VSLs. They are diagnostic videos: personal, specific, instructional, and explicit about the next paid step.

The job of the video is to move the viewer from curiosity to recognition, then to controlled concern, then to relief, then to action. The viewer should feel, "This is exactly what is happening in my store," before they are asked to book.

## Where Things Live

Keep the repeatable system in this doc:

- `lead-magnets/_frameworks/diagnostic-result-videos.md`

Keep scripts and production planning in a lead magnet packet:

- `lead-magnets/<lead-magnet-slug>/videos/`

Keep app implementation notes in the website repo:

- `next/docs/report-lead-magnet-videos.md`

Keep app wiring in the lead magnet implementation:

- video component config;
- route-local video ID config;
- tracking for results viewed, video engagement, and booking clicks where available;
- result variant keys used by the calculator.

Do not put long scripts directly in app components. App components should only know which result variant maps to which video ID, title, supporting copy, and CTA.

## Default Packet Shape

For each report lead magnet, create a video packet:

```text
lead-magnets/<lead-magnet-slug>/
  status.md
  brief.md
  conversion-plan.md
  videos/
    status.md
    brief.md
    hooks.md
    video-manifest.md
    scripts/
      _template.md
      00-report-setup.md
      01-<result-variant>.md
      02-<result-variant>.md
      03-<result-variant>.md
      04-healthy.md
    recording-checklist.md
    edit-brief.md
    retargeting-cutdowns.md
```

Create only the files needed for the current stage, but keep the lead magnet `status.md`, root `conversion-plan.md`, and video `video-manifest.md` current.

## Video Roles

Most report lead magnets need two classes of videos:

1. **Setup video**: helps the user enter or import the numbers correctly. It should be instructional, calm, and specific.
2. **Result videos**: one video per result state. These are diagnosis-led sales letters. They explain the single most important result, why it matters, what likely causes it, and why the paid diagnostic is the next rational step.

For result videos, keep the video useful even if the viewer never books. The authority comes from the diagnosis, not from withholding the useful part.

## Result Video Structure

Use this structure for result videos:

| Segment | Rough timing | What it must do |
| --- | ---: | --- |
| Immediate reveal | 0:00-0:20 | Confirm the report is theirs and state the top-line diagnosis fast. |
| Diagnosis | 0:20-1:20 | Explain the bottleneck in plain English. |
| Cost of inaction | 1:20-2:10 | Translate the issue into missed revenue, wasted effort, or leakage. Keep it conservative. |
| Fix path | 2:10-3:20 | Show that the issue is solvable and usually comes from a small number of causes. |
| Paid next step | 3:20-4:30 | Position the paid diagnostic as the logical implementation step. |
| Close | 4:30-5:30 | Give one specific CTA and remove ambiguity. |

The viewer should get the main reveal in the first minute. Do not meander into backstory, broad context, or founder credibility before stating the result.

## Sales Letter Arc

The structure above should still feel like a story:

1. **Immediate reveal**: "Here is the single bottleneck."
2. **Problem**: "Here is what that means in plain English."
3. **Recognition story**: "Here is how this usually feels inside the store."
4. **Controlled concern**: "Here is what this may be costing or wasting."
5. **Relief**: "Here are the likely fix categories, so this is not random."
6. **Paid next step**: "Here is the one paid step if you want the store inspected properly."

Use a but/therefore arc. Avoid list-shaped scripts where each section merely adds another point.

## Hook Rules

Create five hook options before writing the full script. A hook is not just a clear opening. A hook creates dissonance.

For result videos, use this structure:

1. **Belief**: state what the viewer probably believed before seeing the report.
2. **Reversal**: turn that belief over using their result.
3. **Curiosity gap**: open a question without answering it yet.
4. **Bridge**: point into the diagnosis.

The curiosity gap is the missing "why", not the result itself. It is acceptable to reveal the flagged funnel stage, because the page is already showing the result. It is not acceptable to reveal the likely causes in the hook. If the hook says "this is probably your imagery, price support, trust, shipping, payment methods, or discount behaviour", the hook has already spent the curiosity.

Use this test:

- **Pass:** the viewer thinks, "Hang on, if that is true, what is causing it?"
- **Fail:** the viewer thinks, "Okay, I know the answer now."

The belief should be something a real merchant would recognise, such as:

- "I thought checkout was the problem."
- "I thought I needed more traffic."
- "I thought people were abandoning because of price."
- "I thought no major leak meant there was nothing to fix."

The reversal should be specific to the result state:

- "But your biggest issue is earlier than checkout."
- "But these shoppers already showed interest and still did not continue."
- "But checkout is where high-intent shoppers are falling away."
- "But a healthy funnel changes the question from fixing a leak to choosing the best growth lever."

Good hook shape:

```text
Before you ran this report, I would not be surprised if you thought checkout was the problem. Most store owners do. But your result is pointing earlier than checkout: people are not adding to cart in the first place. So the question is not "why are they not finishing?" It is "why are they not even starting?"
```

Bad hook shape:

```text
Your report is ready. In this video, I will explain your add-to-cart bottleneck and what to do next.
```

That is an opening, not a hook. It gives information, but it does not create tension or curiosity.

Another bad hook shape:

```text
Before you ran this report, I would not be surprised if you thought checkout was the problem. But your result is add-to-cart, which means your product page, imagery, price support, trust signals, and traffic match are probably the issue.
```

That creates dissonance and then immediately kills it by answering the question. Save the explanation for the diagnosis section.

Do not confuse a hook with a summary. The hook should create an open question. The diagnosis section answers it.

Setup videos are different. If the viewer is already mid-process and just needs instructions, do not force a sales hook. Orient them, reassure them, and get them through the steps.

## One Bottleneck, One Next Step

Each result video should stay focused on one bottleneck and one next step. Do not turn the video into a buffet of insights, unrelated offers, or "you might also" advice.

The page below the video can show supporting details. The video should frame the result, create urgency, and make the paid step feel obvious.

## Length

Aim for:

- setup video: 2-4 minutes;
- result videos: 4-6 minutes;
- retargeting cutdowns: 15-30 seconds.

Result videos can be longer than a normal explainer because the viewer is warm, self-selected, and waiting for their result. The first minute still has to carry the reveal and value proposition.

## Offer And CTA Rules

The result page should sell one thing: a named, transparent paid diagnostic.

Default offer-language pattern:

- **Offer name:** `<Specific Diagnostic Name>`
- **Page headline:** Book your `<price>` `<Specific Diagnostic Name>`
- **Subhead:** We'll confirm the real bottleneck, prioritize the fastest fixes, and give you an action plan.
- **Microproof:** `<duration>`. Recording included. Prioritized recommendations. Optional ongoing support if relevant.
- **Button:** Book my `<price>` `<Specific Diagnostic Name>`

Do not call this a discovery call on the result page. "Discovery call" sounds sales-coded and does not name the deliverable.

Keep the spoken CTA, page headline, and button text as close to verbatim as possible. The viewer should hear and see the same action.

Avoid:

- broad agency language;
- promising a guaranteed revenue lift;
- hiding the price;
- asking the viewer to choose between multiple equal-weight offers;
- making the report sound worthless without the paid diagnostic;
- introducing the larger coaching offer as the main page CTA.

## Coaching Bridge

The result page sells the paid diagnostic. It can lightly seed ongoing support, but it should not sell the monthly coaching or mentoring program directly unless that is explicitly the lead magnet's primary conversion goal.

On the diagnostic call, the bridge can follow this pattern:

```text
Based on today's diagnostic, you've got two realistic paths. You can take this action plan and implement it yourself, or if you want ongoing help prioritizing and improving this month by month, I can stay involved through the ongoing program. You do not need to decide that on the result page. The purpose of today's diagnostic is to confirm whether ongoing support would actually be useful for you.
```

## Dynamic Result Language

These videos are usually pre-recorded, so do not pretend to know the viewer's exact numbers in the recording.

Use phrases like:

- "Your numbers below this video show..."
- "If this stage is the one flagged in your report..."
- "The exact dollar figure depends on your traffic and AOV, but the pattern is what matters..."
- "The report tells us where to look. The diagnostic is where we inspect the actual store."

Let the page handle exact metrics, revenue gap, and landing page breakdowns.

## Visual And Page Rules

Use a presenter-led diagnostic format:

- John's talking-head recording is the A-roll and should carry the authority, tone, and instruction;
- Remotion is the production and compositing layer for lower thirds, captions, callouts, diagrams, generic mockups, transitions, and CTA cards;
- full-screen Remotion graphics should be short cutaways when a concept is easier to understand visually;
- build supporting diagnostic visuals with reusable React components;
- use generic store/page/cart/checkout mockups rather than real merchant examples unless explicitly approved;
- use screen capture only where an exact platform process matters;
- show report state early, then use generated overlays and cutaways that explain the pattern;
- keep the visual language practical and "everyman", not polished agency case-study theatre.

Useful Remotion component families:

- presenter frame;
- lower thirds;
- key phrase captions;
- funnel stage rail;
- animated leak highlight;
- visitor dots moving through or dropping out of the funnel;
- metric cards and benchmark comparisons;
- generic storefront, cart, and checkout mockups;
- cause-category checklist cards;
- final diagnostic CTA card.

## Journey Continuity

Result videos should feel like the natural continuation of the lead-generation ad and landing page. Use the same visual system, but slow it down and make it more diagnostic.

Keep these consistent where possible:

- presenter-led talking-head style;
- lower thirds and section labels;
- key phrase caption treatment;
- funnel rail and stage-card design;
- generic store/page/cart/checkout mockups;
- CTA card style and wording;
- colour, typography, spacing, and animation tempo.

The result video can be calmer and more detailed than the ad, but it should not feel like a different product experience.

Use screen share or platform capture where useful:

- face on screen as the main source of explanation;
- actual report visible early;
- one metric or stage highlighted;
- cursor-led explanation;
- short labels, not dense slides.

The video should sit inline and above the main report detail. Do not use autoplay. Use a thumbnail with John's face plus the result or report state, not a generic logo or deck preview.

The strongest CTA should appear:

- at the end of the video;
- directly below the video;
- again after the report detail where useful.

Keep the page sparse around the video:

- personalized headline;
- inline diagnostic video;
- one primary CTA;
- brief proof or reassurance;
- booking/payment flow.

Avoid full navigation, unrelated links, and secondary offers on the result page.

## Retargeting Assets

The on-page result video and retargeting clips should not be the same asset.

Create 15-30 second vertical cutdowns for Meta/Instagram retargeting. Each cutdown should focus on one result line only, assume sound off, use captions, and get the key message in within the first few seconds.

## Email Support

Results-ready and recovery emails should support the page rather than replace it.

When possible, use a video thumbnail that links back to the result page and restates the single diagnosis in the subject line or preview text.

## Tracking

Track the video funnel the same way the report tracks the store funnel:

- play rate;
- 25%, 50%, and 75% watch rate where the player supports it;
- CTA click rate;
- paid diagnostic booking rate;
- paid diagnostic purchase rate;
- show rate;
- conversion from paid diagnostic to coaching.

At minimum, keep the existing result-viewed and booking-click events intact.

## Tests To Prioritize

Start with tests that affect attention and clarity:

- opening line: loss-framed versus control-framed;
- CTA noun: Fix-It Diagnostic versus Store Bottleneck Diagnostic versus Discovery Call;
- price visible in video and page versus page only;
- proof by category similarity versus proof by business-size similarity;
- result-specific headline versus generic results headline.

## Script Template

Each script file should use this structure:

```markdown
# <Video Title>

## Metadata

- Lead magnet:
- Variant key:
- App location:
- Target length:
- Primary viewer state:
- Offer:
- CTA:
- App video config key:

## Purpose

## Five Hook Options

1.
2.
3.
4.
5.

## Hook Discipline

- Belief:
- Reversal:
- Open question:
- What this hook deliberately does not answer yet:

## Selected Hook

## Diagnostic Arc

- Hook:
- Immediate reveal:
- Diagnosis:
- Cost of inaction:
- Fix path:
- Paid next step:
- Close:

## Diagnosis Notes

## Likely Causes

## First Checks

## Screen Beats

## On-Screen Callouts

## Full Script

## Retargeting Cutdown Lines

## Claims To Avoid
```

## Production Workflow

1. Create or update the packet brief.
2. Confirm variant keys against the code.
3. Confirm the offer name, price, duration, and CTA in the app.
4. Write five belief/reversal hooks for each result video, and a simple orienting opening for setup videos.
5. Pick the strongest hook per video.
6. Write the scripts using the diagnostic arc.
7. Create recording notes and screen beats.
8. Record and upload the videos.
9. Add video IDs to the route-local component config.
10. Verify every result state renders the correct video and CTA tracking.
11. Create 15-30 second retargeting cutdowns for each result state.

## Current Reference Implementation

Use each lead magnet packet for implementation-specific details such as:

- app route;
- video component;
- setup and result variant keys;
- video ID config keys;
- offer name, price, CTA, and booking path;
- follow-on coaching or mentoring bridge.
