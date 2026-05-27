# Shopify Bottleneck Analysis Brief

## Report Promise

Show Shopify merchants where their main funnel leak is likely happening, using their own store numbers.

## Target User

- Shopify store owners and ecommerce operators.
- Especially practical Australian merchants who need a plain-English diagnosis.
- Users who can provide sessions, add-to-carts, reached checkout, completed purchases, and AOV.

## Current App Implementation

- Landing page: `next/app/shopify-bottleneck-analysis/page.tsx`
- Report setup page: `next/app/shopify-bottleneck-analysis/report/page.tsx`
- Results page: `next/app/shopify-bottleneck-analysis/results/page.tsx`
- API route: `next/app/api/shopify-bottleneck-analysis/route.ts`

## Result States

- `addToCart`: Product Page / Add-To-Cart Bottleneck
- `reachCheckout`: Cart / Reach-Checkout Bottleneck
- `checkoutCompletion`: Checkout Completion Bottleneck
- `healthy`: Healthy / No Major Bottleneck

## Video Layer

The video layer lives in `lead-magnets/shopify-bottleneck-analysis/videos/` and follows `lead-magnets/_frameworks/diagnostic-result-videos.md`.

The goal is to make each result feel specific and useful while moving qualified merchants toward one paid diagnostic next step.

Tone should stay positive and reality-based. The report can name leaks, costs, and consequences, but it should never sell fear or shame the merchant. Building an ecommerce business is brave, the current result is understandable, every problem is fixable, and the next step should be clear.

## Acquisition Ad Layer

The ad layer lives in `lead-magnets/shopify-bottleneck-analysis/ads/` and follows `lead-magnets/_frameworks/lead-magnet-ad-videos.md`.

The goal is to sell the free Shopify Bottleneck Analysis before signup. These videos should create enough curiosity and urgency for the viewer to run the report, not try to sell the paid diagnostic directly.

Default Meta ad set:

1. Checkout myth / belief reversal.
2. More traffic trap / wasted effort.
3. Quick first read / fast useful result.

Each ad should point to the same promise: find the likely weak funnel stage before choosing what to fix.

## Conversion Layer

The conversion plan lives in `lead-magnets/shopify-bottleneck-analysis/conversion-plan.md` because offer name, pricing, CTA copy, booking path, and the coaching bridge affect the whole lead magnet, not only the videos.
