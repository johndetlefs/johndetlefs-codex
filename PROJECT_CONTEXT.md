# JohnDetlefs.com Project Context

This file is workspace-level memory for agents working on JohnDetlefs.com. Use it to understand the product, audience, offer, funnel, and content strategy before making positioning, content, or implementation decisions.

Last reviewed from `next/` source: 2026-05-05.

## Workspace Shape

- Workspace root: `/Users/johndetlefs/repos/johndetlefs`.
- `next/`: production website app for JohnDetlefs.com.
- `email/`: separate repository for email-related project code and assets.
- Treat the workspace as one JohnDetlefs.com project, but keep Git operations scoped to the relevant child repo.

## Site Summary

JohnDetlefs.com is a direct-response Shopify services site. Its primary job is to convert qualified Shopify merchants into paid "Fix-It Call" bookings. Supporting guide content educates Shopify store owners, builds trust, and can be used as landing pages for organic, YouTube, short-form, newsletter, and paid social traffic.

The site should feel practical, direct, experienced, and low-friction. It should not feel like a generic agency, broad marketing consultancy, or polished-but-vague service brochure.

## Primary Offer

Main offer: **Shopify Fix-It Call**.

- Format: online screen-share session.
- Default duration: 60 minutes.
- Default price: `$249 AUD`, sourced from `NEXT_PUBLIC_FIXIT_CALL_PRICE_AUD=24900` / `STRIPE_AMOUNT_AUD=24900`.
- Positioning: one focused session, one issue or a few small issues, scoped and fixed live where safe.
- Promise: if the issue is too large to fully solve during the session, the customer leaves with a clear, prioritized plan rather than a sales pitch.
- Guarantee: 100% satisfaction guarantee, full refund if the customer emails within 48 hours.
- Tone: "No agency nonsense", "paid problem solving", "No retainers", "No proposal unless you ask for one".

Important implementation files:

- `next/app/page.tsx`: homepage offer and proof.
- `next/app/booking/page.tsx`: booking and Stripe payment UI.
- `next/app/_lib/fix-it-call-pricing.ts`: default public price label.
- `next/app/api/booking/_lib/payment-lifecycle.ts`: backend amount default and lifecycle.

## Secondary Offer

Secondary offer: larger scoped Shopify/ecommerce projects.

- Intended for larger brands with custom theme builds, headless implementation, complex integrations, or similar work.
- Projects typically start at **$40k**.
- Intake path is email, not the booking checkout: `projects@johndetlefs.com`.
- This offer should not dilute the main Fix-It Call path. Treat it as a fit filter for larger brands, not the core CTA.

## Follow-On Work

Existing or first-call clients can book blocks/hours of additional work after the initial Fix-It Call.

- This is not the main public conversion path.
- Clients normally find out about this option after they have booked or completed their first call.
- Follow-on hours are arranged by email and invoice, not through the website booking/payment flow.
- Treat this as an operational/customer-success path, not something to foreground in homepage or guide CTAs unless the user explicitly asks.
- When a Fix-It Call uncovers work that is too large for the session, the practical next options are: DIY from the plan, book another Fix-It Call, request invoiced hours, or discuss a fixed-scope quote.

## Target Audience

Primary audience:

- Shopify merchants, ecommerce operators, and store owners.
- Especially Australian Shopify stores and smaller Australian brands.
- Often time-poor, practical, and frustrated by slow/expensive agency workflows.
- They may have urgent storefront, conversion, performance, theme, app, checkout-adjacent, or workflow issues.

Secondary audience:

- Larger brands evaluating scoped ecommerce projects.
- They want senior technical guidance and execution without agency overhead.

Local/personal positioning:

- John is based on the NSW Central Coast.
- The story emphasizes helping smaller Australian Shopify stores punch above their weight and supporting a thriving local retail culture.

## Buyer Problems

Common customer problems the site is built around:

- Broken add-to-cart, theme, storefront, or app behavior.
- Slow product pages or app bloat.
- Mobile conversion issues.
- Poor product page trust, objection handling, or CTA placement.
- Manual ecommerce workflows that have become painful.
- Small store owners who need expert help but cannot justify agency rates.
- Operators who are stuck trying to use AI/vibe coding themselves and need a senior developer to get them unstuck.

## Value Proposition

Core value:

- Senior Shopify development expertise applied quickly and directly.
- 30 years of coding experience combined with AI-assisted workflows.
- Practical fixes and clear priorities, not discovery-heavy consulting.
- Lower-risk, low-commitment entry point compared with agency retainers or large projects.

## Positioning

John's role is best understood as a translator and conduit between big-brand ecommerce practice and smaller Shopify stores.

- He works with large agencies that serve some of the largest ecommerce brands in Australia.
- He has legitimate hands-on familiarity with large, serious ecommerce websites and how major brands think about storefronts, conversion, trust, customer journeys, and technical execution.
- He should not position himself as "I am JB Hi-Fi" or "I am Oz Hair and Beauty"; the point is "I work in that world, I see how those teams think, and I can translate the useful parts for smaller stores."
- The credibility signal is: big brands and large agencies trust John's judgement, so small stores can also trust him.
- The emotional position is approachable and advocate-like, not distant expert or agency consultant.
- He is the practical middleman: he speaks to the big-brand ecommerce world and brings those lessons back to small Australian Shopify store owners in plain language.
- Future content may lean into an interview/podcast style where John asks big brands, agencies, and ecommerce operators the questions smaller stores would want answered.

Tone to preserve:

- Personable, warm, direct, and useful.
- Senior enough to be trusted by big brands, but approachable enough that a small store owner feels safe asking basic questions.
- More "let me translate what the big end of town knows" than "look how clever I am".
- Avoid sounding like John represents big brands formally unless that is explicitly true for the specific context.

Proof points currently used:

- Client list includes Guess, Camilla, Sukin, Tigerlily, Haymes Paint, Early Settler, UTS, Mission Australia, Massey, Macros, Soulara, DEPT, Acidgreen, Omnicom.
- Shopify Partner badge.
- Testimonial from Zacarie Carr, Head of Shopify at Acidgreen.

## Funnel

Main customer path:

1. Visitor lands on homepage or guide content.
2. Visitor understands the Fix-It Call offer, price, scope, and guarantee.
3. Visitor clicks "Book your Fix-It Call".
4. Visitor enters contact details.
5. Visitor chooses an available Sydney time slot.
6. Visitor pays with Stripe.
7. System confirms booking, creates calendar event, and sends transactional email.
8. Success page asks the customer to prepare:
   - add JohnDetlefs.com as a Shopify collaborator;
   - record a quick Loom;
   - check confirmation email/calendar invite.

Post-booking success experience:

- Success page uses signed token links.
- Customer prep progress and Loom URL persist against the booking.
- Success links can be reissued with throttling if expired.

Operational integrations:

- Stripe for payment.
- Google Calendar for availability and event creation.
- Firebase/Firestore for booking persistence.
- AWS SES for transactional email.
- Sendy for newsletter/enrollment.
- Google Tag Manager/dataLayer events for analytics.

## Booking Availability

- Timezone: `Australia/Sydney`.
- Booking window: 28 days.
- Weekends excluded.
- Standard slot windows:
  - 9:00am
  - 10:15am
  - 11:30am
  - 12:45pm
- Each slot is 60 minutes.

## Content System

The `next` app has an MDX content system under `next/content/`.

- Content pages use `content/**/index.mdx`.
- Routes are generated from folder paths unless they collide with reserved app routes.
- Guide pages can have YouTube or Wistia hero videos.
- Supported frontmatter includes:
  - `title`
  - `description`
  - `published`
  - `updated`
  - `heroImage`
  - `heroImageOverlayOpacity`
  - `heroGradient`
  - `heroImageAlignment`
  - `heroVideo`
  - `showProgressBar`
  - `showReadTime`
  - `readTime`
  - `aside`
  - `cta`
- If `aside: true`, the page renders a sticky Sendy newsletter signup form.
- Current guide example most relevant to the commercial content strategy: `next/content/guides/optimising-your-shopify-store-mobile-experience/index.mdx`.

Content style:

- Practical, plain-spoken, specific advice for Shopify owners.
- Uses examples from recognizable ecommerce sites where useful.
- Should end with clear action steps or a checklist.
- Avoid fluff, broad marketing claims, and generic ecommerce advice.
- Should naturally connect back to the Fix-It Call when the reader may need expert help.

Guide/content purpose:

- Educate Shopify operators.
- Build trust in John's expertise.
- Support YouTube videos and short-form social clips.
- Provide landing pages for Meta Ads or other paid traffic.
- Feed the newsletter list through practical Shopify tips.
- Move qualified readers toward a Fix-It Call when they have a problem worth solving.

## Current Content Inventory

Commercial/real guide:

- `/guides/optimising-your-shopify-store-mobile-experience`: Shopify mobile UX/conversion guide with YouTube hero video.

Project Workflow guides:

- `/guides/getting-started`
- `/guides/project-workflow-setup`
- `/guides/project-workflow-first-tasks`

Validation/sample content:

- `/guides/gradient-image-video`
- `/guides/hero-opacity-low`
- `/guides/plain-content`
- `/guides/youtube-hero`

When creating new public marketing content, avoid treating validation/sample pages as strategic content examples.

## Brand Voice

Preferred voice:

- Direct, practical, experienced.
- Friendly but not fluffy.
- Confident but transparent about scope.
- Australian spelling and phrasing where natural.
- Uses concrete examples and operational language.

Good phrases and ideas already present:

- "No agency nonsense."
- "Paid problem-solving."
- "Fix what is safe during the session."
- "If it is bigger than the session, leave with a clear plan."
- "No proposal unless you ask."
- "Small Australian Shopify stores punch above their weight."

Avoid:

- Generic agency language.
- Overstated guarantees that every issue will be fully solved in one session.
- Broad claims about marketing, branding, or ecommerce growth that are not tied to practical Shopify fixes.
- Making the Fix-It Call sound like a free consultation.

## Content Production Workflow Context

The expected recurring workflow is:

1. Generate guide video ideas.
2. Write the script and recording plan.
3. Record and edit in CapCut.
4. Upload/publish on YouTube.
5. Repurpose into YouTube Shorts and Meta short-form creative.
6. Turn the video/transcript into a guide page in `next/content/guides/.../index.mdx`.
7. Deploy the site.
8. Create Meta Ads that send traffic to the guide page.
9. Use the guide page to convert visitors to newsletter signups and/or Fix-It Call bookings.

Preferred optimization:

- Treat each guide as a reusable "content packet" with brief, script, edit plan, YouTube package, shorts plan, guide page, and ads.
- Keep one canonical topic/angle so YouTube, short-form, page content, newsletter, and ads reinforce each other.
- Guide pages should be useful even without watching the video.
- Ads should send traffic to a specific guide page, not the homepage, unless the campaign is explicitly bottom-of-funnel.

Likely workspace-level skills to create later:

- `guide-video-pipeline`
- `guide-idea-planner`
- `guide-script-writer`
- `capcut-edit-brief`
- `youtube-publisher`
- `shorts-repurposer`
- `guide-page-builder`
- `meta-ads-builder`
- `content-ops-tracker`

## Technical Stack

`next/` stack:

- Next.js 16 App Router.
- TypeScript strict mode.
- React 19.
- Tailwind CSS v4.
- ESLint 9 with `eslint-config-next`.
- npm with `package-lock.json`.

Validation expectations:

- Run the smallest relevant checks first.
- For code changes, prefer `npm run lint`; use `npm run build` for broad route/type safety.

Important local instructions:

- `next/AGENTS.md` has repo-specific engineering rules.
- `next/.project-workflow/CONSTITUTION.md` has product decision filters.

## Decision Filters

When changing the site, content, or funnel, prefer work that:

- makes the Fix-It Call easier for the right customer to understand and book;
- improves trust by making scope, pricing, access, timeline, and guarantee clearer;
- helps Shopify operators solve real, specific problems;
- keeps the main offer focused instead of turning the site into a generic agency site;
- improves the quality or conversion path of guide-led traffic;
- preserves the simple, senior-expert, low-friction positioning.

If a proposed change adds complexity, ask whether it directly improves clarity, speed to value, trust, qualified bookings, or guide-page conversion.
