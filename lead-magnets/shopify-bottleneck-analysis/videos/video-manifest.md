# Shopify Bottleneck Analysis Video Manifest

This file maps script assets to the current app variants and route-local video config in `next/app/shopify-bottleneck-analysis/_components/BottleneckVideoSection.tsx`.

| Video | Variant key | Script file | App video config key | Current status |
| --- | --- | --- | --- | --- |
| How To Get Your Report Details | `reportSetup` | `scripts/00-report-setup.md` | `shopifyBottleneckVideoIds.reportSetup` | Hook selected; presenter-led hybrid visual plan added; not scripted |
| Product Page / Add-To-Cart Bottleneck | `addToCart` | `scripts/01-add-to-cart.md` | `shopifyBottleneckVideoIds.addToCart` | Full script drafted; review pending |
| Cart / Reach-Checkout Bottleneck | `reachCheckout` | `scripts/02-reach-checkout.md` | `shopifyBottleneckVideoIds.reachCheckout` | Hook selected; presenter-led Remotion overlay plan added; not scripted |
| Checkout Completion Bottleneck | `checkoutCompletion` | `scripts/03-checkout-completion.md` | `shopifyBottleneckVideoIds.checkoutCompletion` | Hook selected; presenter-led Remotion overlay plan added; not scripted |
| Healthy / No Major Bottleneck | `healthy` | `scripts/04-healthy.md` | `shopifyBottleneckVideoIds.healthy` | Hook selected; presenter-led Remotion overlay plan added; not scripted |

## Publishing Notes

- The component currently uses a placeholder YouTube video ID in `shopifyBottleneckVideoIds`.
- After upload, replace each placeholder ID in the route-local component config.
- Target result-video length is 4-6 minutes.
- Target result-page offer is the $295 Shopify Fix-It Diagnostic.
- Result videos should be presenter-led talking-head videos composited and enhanced in Remotion with generic funnel/store/cart/checkout visuals.
- Screen capture should be reserved for setup/process moments or showing the report state.
- Current app copy/price still needs alignment before publishing.
- After upload, record the final video title, hosting provider, video ID, visibility, and publish date here.
- After app config updates, verify the setup page renders `reportSetup`.
- After app config updates, verify each result state renders the correct result video and the booking CTA tracking still fires.
