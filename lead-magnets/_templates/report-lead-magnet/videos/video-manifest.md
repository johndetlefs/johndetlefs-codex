# <Lead Magnet Name> Video Manifest

This file maps script assets to app variants and route-local video config.

| Video | Variant key | Script file | App video config key | Current status |
| --- | --- | --- | --- | --- |
| <Setup Video> | `<setupVariant>` | `scripts/00-report-setup.md` | `<configKey>` | Not scripted |
| <Result Video> | `<resultVariant>` | `scripts/01-<result-variant>.md` | `<configKey>` | Not scripted |

## Publishing Notes

- Record final video title, hosting provider, video ID, visibility, and publish date here.
- Add uploaded video IDs to the route-local component config rather than public environment variables.
- Verify each result state renders the correct video.
- Verify the primary CTA tracking still fires.
