# Shopify Bottleneck Analysis Video Conversion Plan

## Primary Page Goal

Sell one paid next step from the result page: the Shopify Fix-It Diagnostic.

Do not make the user choose between a discovery call, coaching, another report, a PDF, and a booking. The result page should have one primary commercial action.

## Target Offer Stack

- Headline: "Book your $295 Shopify Fix-It Diagnostic"
- Subhead: "We'll confirm the real bottleneck, prioritize the fastest fixes, and give you an action plan."
- Microproof: "45 minutes. Recording included. Prioritized recommendations. Optional ongoing support if relevant."
- Button: "Book my $295 Shopify Fix-It Diagnostic"

The spoken CTA in each result video should use the same wording as the headline and button.

## Current Implementation Gap

Current app code still describes the main public offer as the Shopify Fix-It Call at $249 AUD.

The intended direction is now:

- Reposition the homepage around the $295 Shopify Fix-It Diagnostic.
- Update pricing from $249 AUD to $295.
- Change the call promise from live fixing to site/funnel review plus prioritized action plan.
- Create an offer page for the $695/month mentoring/coaching program.

Do not record final scripts until homepage, booking, pricing, and CTA copy are aligned.

## Coaching Bridge

The $695/month coaching program should not be the result-page CTA. It should be positioned as optional ongoing support after the paid diagnostic confirms fit.

Suggested diagnostic-call transition:

```text
Based on today's diagnostic, you've got two realistic paths. You can take this action plan and implement it yourself, or if you want ongoing help prioritizing and fixing this month by month, I can stay involved through the coaching program at $695 a month. You do not need to decide that on the result page. The purpose of today's diagnostic is to confirm whether ongoing support would actually be useful for you.
```

## Result Page Layout Principle

- Personalized headline.
- Inline diagnostic video above the detailed report.
- One primary CTA immediately below the video.
- Report detail.
- Repeated primary CTA after the report.
- Minimal secondary navigation or competing links.

## Tracking Targets

Keep the existing events:

- `shopify_bottleneck_results_viewed`
- `shopify_bottleneck_booking_click`

Add or plan for video-player events where the hosting platform supports them:

- video play;
- 25% watched;
- 50% watched;
- 75% watched;
- completed;
- video CTA clicked.

Business funnel metrics to watch:

- result page to diagnostic click rate;
- diagnostic booking/purchase rate;
- diagnostic show rate;
- diagnostic to $695/month coaching conversion rate.

## Tests To Prioritize

1. CTA noun: "Shopify Fix-It Diagnostic" versus "Store Bottleneck Diagnostic".
2. Opening line: loss-framed versus control-framed.
3. Price in video and page versus price on page only.
4. Result-specific headline versus generic "Your Shopify Funnel Results".
5. Proof by category similarity versus proof by business-size similarity.
