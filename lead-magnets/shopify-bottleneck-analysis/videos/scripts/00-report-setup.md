# How To Get Your Report Details

## Metadata

- Lead magnet: Shopify Bottleneck Analysis
- Variant key: `reportSetup`
- App location: `next/app/shopify-bottleneck-analysis/report/ShopifyBottleneckReportExperience.tsx`
- Target length: 2-4 minutes
- Primary viewer state: already signed up and ready to follow the report page instructions to get their results
- Offer: none in this video
- CTA: complete the report setup
- App video config key: `shopifyBottleneckVideoIds.reportSetup`

## Purpose

Help the user follow the report page process: paste their Shopify Admin URL, open the generated Shopify report links, export/upload the funnel CSV, enter average order value, and submit.

## Core Message

"Follow along with this page open. Over the next five minutes, we’ll grab the data we need from Shopify so we can get you the most useful result possible. There’s nothing too technical here. You’ve got this. Let’s get started."

## Five Setup Opening Options

Draft in `../hooks.md`.

## Selected Opening

"Follow along with this page open. In this step we’re just going to grab the data we need from Shopify, add your average order value, and then we’ll head into the results page so you can see where the biggest leak is likely happening."

## Instructional Arc

- Immediate reveal: follow along with the page open; this should take about five minutes, there is nothing too technical, and the user can do it.
- Context: the user has already signed up and is on Part 2 of the process.
- Friction: they need to know what to click, what to export, where to upload it, and when to submit.
- Fix path: paste the Shopify Admin URL, open the generated funnel report, export/upload the CSV, open the generated AOV report, enter AOV, and submit.
- Close: the analyzer extracts the funnel numbers and shows the likely leak.

## Required Coverage

- Open the report page from the email link.
- Paste the Shopify Admin store URL.
- Explain that the page generates the Shopify funnel report link automatically.
- Open the generated funnel report in Shopify.
- Export the funnel report as a CSV.
- Upload the CSV back into the report page.
- Explain that the CSV import extracts sessions, add to carts, reached checkout, completed purchases, and landing page type breakdown automatically.
- Open the generated average order value report.
- Enter the AOV number.
- Submit and wait for the results page.

## Remotion Visual Plan

- Production approach: presenter-led hybrid. John talks the viewer through the process; Remotion packages the instruction with lower thirds, step tracking, callouts, zooms, and data panels. Use screen capture only where exact Shopify or report-page clicks matter.
- Presenter/A-roll role: John stays visible for reassurance at the start, then alternates between talking-head guidance and process cutaways so the user feels guided rather than abandoned in a UI demo.
- Core Remotion components: `PresenterFrame`, `LowerThird`, `SetupStepRail`, `BrowserFrame`, `ShopifyAdminUrlCallout`, `GeneratedReportLinkCard`, `CsvUploadPanel`, `ExtractedMetricsPanel`, `AovInputCard`, `ResultsLoadingTransition`.
- Suggested scene flow: start with a five-minute follow-along title; show a five-step progress rail; demonstrate admin URL paste; open generated funnel report; export/upload CSV; animate extracted metrics appearing; enter AOV; transition into "your result is ready".
- Screen capture needs: likely useful for the Shopify report export step and the actual report page flow. Use a dummy store/account, crop sensitive UI, and avoid showing a real merchant's store data.
- Continuity notes: reuse the same lower-third, caption, browser-frame, metric-card, and CTA-card treatment from the ad and landing page.
- Avoid: turning this into a sales video, adding fake complexity, or showing more Shopify UI than the user needs to complete the step.

## Screen Beats

- Email link to report page.
- Paste Shopify Admin URL.
- Generated funnel report link.
- Open Shopify report.
- Export CSV.
- Upload CSV and show extracted funnel numbers.
- Generated AOV report link.
- Enter average order value.
- Submit action.

## On-Screen Callouts

- Paste admin URL.
- Open generated report.
- Export CSV.
- Upload CSV.
- Enter AOV.
- Submit for results.

## Retargeting Cutdown Lines

Not required for the setup video unless completion drop-off becomes a problem.

## Claims To Avoid

- Do not imply the report is a financial audit.
- Do not introduce concerns the page does not create.
- Do not turn this setup video into a sales video.
