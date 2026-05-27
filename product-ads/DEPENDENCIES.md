# Product Ads Dependencies

This folder contains the product-ad client packets, local editor, image asset tooling, and first-pass render/export scripts.

## Required Tools

- Git
- Python `3.11+`
- Python virtual environments: `python3 -m venv`
- Pillow, installed from `product-ads/requirements.txt`
- Node.js `20+`
- npm
- Sharp, installed from `product-ads/package.json`
- A modern browser for the local editor

## Optional Tools

- Swift with AppKit on macOS, only for the legacy `.swift` render helpers.
- curl, useful for downloading Shopify product images and reference assets.
- GPT Image access, used when a template needs new generated product scenes, backgrounds, props, or icon sheets.

## Setup

Run from the workspace root:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r product-ads/requirements.txt
cd product-ads
npm install
cd ..
```

## Verify

Run from the workspace root:

```bash
source .venv/bin/activate
python -c "from PIL import Image; print('Pillow', Image.__version__)"
cd product-ads
npm run check:node
cd ..
```

Expected result:

- Python can import `PIL`.
- Node reports a `v20` or newer version.
- Sharp reports an installed version.

## Running The Shared Editor

One shared editor/server serves every client packet. Select the target client, product, and template with arguments.

Get Rid Of Dad Bod R01:

```bash
source .venv/bin/activate
python product-ads/core/editor/editor-server.py \
  --client get-rid-of-dad-bod \
  --product chocolate-whey \
  --template r01-feature-benefit-product-hero \
  --port 8765
```

Alessa Vino R01:

```bash
source .venv/bin/activate
python product-ads/core/editor/editor-server.py \
  --client alessa-vino \
  --product visner-di-pergola-2024 \
  --template r01-feature-benefit-product-hero \
  --port 8765
```

Optional angle-specific variant:

```bash
source .venv/bin/activate
python product-ads/core/editor/editor-server.py \
  --client alessa-vino \
  --product visner-di-pergola-2024 \
  --template r01-feature-benefit-product-hero \
  --angle dessert-host \
  --port 8765
```

Then open:

```text
http://127.0.0.1:8765/core/editor/meta-image-ad-editor.html
```

## Dependency Roles

Pillow:

- Cuts product images out of white or chroma-key backgrounds.
- Crops transparent product and icon assets to their visible bounds.
- Converts source icon/image assets into transparent editor-ready PNGs.

Sharp:

- Slices GPT Image asset sheets into individual icons/arrows.
- Builds contact sheets for visual review.
- Removes chroma-key backgrounds in Node-based asset build scripts.

Swift/AppKit:

- Supports older macOS-only render helper scripts.
- Not required for the browser editor workflow.

## Client Setup Notes

- Do not rely on Codex's bundled Python or Node runtime for client installs. Use the local `.venv` and `product-ads/package.json`.
- Do not commit `.venv/`, `node_modules/`, `__pycache__/`, or `.swift-cache/`.
- If a client is not on macOS, avoid the `.swift` helpers and use the browser editor/export workflow.
- Keep shared editor code and source-template assets in `core/` and `templates/`; keep brand/product-specific assets in `clients/`.
