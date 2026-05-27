#!/usr/bin/env python3
"""Serve the shared product ad editor and persist a selected ad project."""

from __future__ import annotations

import argparse
import datetime as dt
import json
from http import HTTPStatus
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from typing import Any
from urllib.parse import urlparse


PRODUCT_ADS_ROOT = Path(__file__).resolve().parents[2]
API_PROJECT_PATH = "/api/meta-image-ad-editor/project"
API_CONFIG_PATH = "/api/meta-image-ad-editor/config"
EDITOR_PATH = "/core/editor/meta-image-ad-editor.html"
LEGACY_EDITOR_PATH = "/meta-image-ad-editor.html"
MAX_BODY_BYTES = 12 * 1024 * 1024


def load_json(path: Path, default: Any) -> Any:
    if not path.exists():
        return default
    return json.loads(path.read_text(encoding="utf-8"))


def merge_asset_groups(*groups: dict[str, Any]) -> dict[str, Any]:
    merged: dict[str, Any] = {}
    for group in groups:
        for group_name, assets in group.items():
            if not isinstance(assets, dict):
                continue
            merged.setdefault(group_name, {})
            merged[group_name].update(assets)
    return merged


def background_from_stops(stops: Any) -> dict[str, Any]:
    if not isinstance(stops, list) or not stops:
        stops = ["#2079b8", "#184c94", "#123861"]
    return {
        "type": "linear",
        "angle": 180,
        "positionX": 50,
        "positionY": 50,
        "stops": stops,
    }


def build_context(args: argparse.Namespace) -> dict[str, Any]:
    template_dir = PRODUCT_ADS_ROOT / "templates" / args.template
    client_dir = PRODUCT_ADS_ROOT / "clients" / args.client
    product_dir = client_dir / "products" / args.product
    base_ad_dir = product_dir / "ads" / args.template
    ad_dir = base_ad_dir / "angles" / args.angle if args.angle else base_ad_dir
    state_file = ad_dir / "editor-state.json"

    template = load_json(template_dir / "template.json", {})
    brand = load_json(client_dir / "brand.json", {})
    product = load_json(product_dir / "product.json", {})
    template_assets = load_json(template_dir / "asset-groups.json", {})
    base_ad_assets = load_json(base_ad_dir / "asset-groups.json", {})
    ad_assets = load_json(ad_dir / "asset-groups.json", {})
    background_stops = product.get("backgroundStops") or template.get("defaultBackgroundStops") or ["#2079b8", "#184c94", "#123861"]
    background = product.get("background") or template.get("defaultBackground") or background_from_stops(background_stops)

    storage_key = f"{args.client}:{args.product}:{args.template}"
    if args.angle:
        storage_key = f"{storage_key}:{args.angle}"
    config = {
        "client": args.client,
        "product": args.product,
        "template": args.template,
        "angle": args.angle,
        "storageKey": storage_key,
        "title": product.get("editorTitle") or f"{brand.get('name', args.client)} - Meta Ad Editor",
        "subtitle": product.get("editorSubtitle") or "Edit the master creative, tune each ratio, then export all finished ad formats.",
        "referenceImage": template.get("referenceImage", ""),
        "referenceNote": template.get("referenceNote", ""),
        "exportPrefix": product.get("exportPrefix") or f"{args.client}-{args.product}-{args.template}",
        "backgroundStops": background_stops,
        "background": background,
        "backgroundPresets": product.get("backgroundPresets") or template.get("backgroundPresets") or [],
        "brandColors": product.get("brandColors") or brand.get("brandColors") or [],
        "generatedAssetGroups": merge_asset_groups(template_assets, base_ad_assets, ad_assets),
        "paths": {
            "stateFile": str(state_file.relative_to(PRODUCT_ADS_ROOT)),
            "templateDir": str(template_dir.relative_to(PRODUCT_ADS_ROOT)),
            "clientDir": str(client_dir.relative_to(PRODUCT_ADS_ROOT)),
            "productDir": str(product_dir.relative_to(PRODUCT_ADS_ROOT)),
            "baseAdDir": str(base_ad_dir.relative_to(PRODUCT_ADS_ROOT)),
            "adDir": str(ad_dir.relative_to(PRODUCT_ADS_ROOT)),
        },
    }
    if product.get("galleryUrl"):
        config["galleryUrl"] = product["galleryUrl"]

    return {
        "template_dir": template_dir,
        "client_dir": client_dir,
        "product_dir": product_dir,
        "ad_dir": ad_dir,
        "state_file": state_file,
        "config": config,
    }


class EditorRequestHandler(SimpleHTTPRequestHandler):
    server_version = "ProductAdsEditor/2.0"

    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(PRODUCT_ADS_ROOT), **kwargs)

    def end_headers(self):
        self.send_header("Cache-Control", "no-store")
        super().end_headers()

    def do_OPTIONS(self):
        if self._is_project_api() or self._is_config_api():
            self.send_response(HTTPStatus.NO_CONTENT)
            self.send_header("Access-Control-Allow-Methods", "GET, PUT, POST, OPTIONS")
            self.send_header("Access-Control-Allow-Headers", "Content-Type")
            self.end_headers()
            return
        super().do_OPTIONS()

    def do_GET(self):
        if self._is_config_api():
            self._send_json(self.server.context["config"])
            return

        if not self._is_project_api():
            if urlparse(self.path).path == LEGACY_EDITOR_PATH:
                self.path = EDITOR_PATH
            super().do_GET()
            return

        state_file = self.server.context["state_file"]
        if not state_file.exists():
            self._send_json({"ok": False, "error": "No saved editor project file"}, HTTPStatus.NOT_FOUND)
            return

        try:
            payload = json.loads(state_file.read_text(encoding="utf-8"))
        except json.JSONDecodeError:
            self._send_json({"ok": False, "error": "Saved editor project file is invalid JSON"}, HTTPStatus.INTERNAL_SERVER_ERROR)
            return

        self._send_json(payload)

    def do_POST(self):
        self._write_project()

    def do_PUT(self):
        self._write_project()

    def _is_project_api(self) -> bool:
        return urlparse(self.path).path == API_PROJECT_PATH

    def _is_config_api(self) -> bool:
        return urlparse(self.path).path == API_CONFIG_PATH

    def _write_project(self):
        if not self._is_project_api():
            self.send_error(HTTPStatus.NOT_FOUND)
            return

        content_length = int(self.headers.get("Content-Length", "0"))
        if content_length <= 0 or content_length > MAX_BODY_BYTES:
            self._send_json({"ok": False, "error": "Invalid request body size"}, HTTPStatus.BAD_REQUEST)
            return

        try:
            raw_body = self.rfile.read(content_length)
            payload = json.loads(raw_body.decode("utf-8"))
        except (UnicodeDecodeError, json.JSONDecodeError):
            self._send_json({"ok": False, "error": "Request body must be JSON"}, HTTPStatus.BAD_REQUEST)
            return

        project = payload.get("project") if isinstance(payload, dict) else None
        if not isinstance(project, dict) or not isinstance(project.get("elements"), list):
            self._send_json({"ok": False, "error": "Payload must include project.elements"}, HTTPStatus.BAD_REQUEST)
            return

        record = {
            "version": payload.get("version", 1),
            "storageKey": payload.get("storageKey") or self.server.context["config"]["storageKey"],
            "savedAt": payload.get("savedAt") or dt.datetime.now(dt.timezone.utc).isoformat(),
            "project": project,
        }

        state_file = self.server.context["state_file"]
        state_file.parent.mkdir(parents=True, exist_ok=True)
        tmp_file = state_file.with_suffix(".json.tmp")
        tmp_file.write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8")
        tmp_file.replace(state_file)

        self._send_json({"ok": True, "path": str(state_file), "savedAt": record["savedAt"]})

    def _send_json(self, payload: dict, status: HTTPStatus = HTTPStatus.OK):
        body = json.dumps(payload).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)


def main():
    parser = argparse.ArgumentParser(description="Serve the shared product ad editor with disk persistence.")
    parser.add_argument("--host", default="127.0.0.1")
    parser.add_argument("--port", type=int, default=8765)
    parser.add_argument("--client", default="get-rid-of-dad-bod")
    parser.add_argument("--product", default="chocolate-whey")
    parser.add_argument("--template", default="r01-feature-benefit-product-hero")
    parser.add_argument("--angle", default=None)
    args = parser.parse_args()

    context = build_context(args)
    if not context["state_file"].exists():
        raise SystemExit(f"Missing editor state file: {context['state_file']}")

    server = ThreadingHTTPServer((args.host, args.port), EditorRequestHandler)
    server.context = context
    print(f"Serving ad editor at http://{args.host}:{args.port}{EDITOR_PATH}")
    context_label = f"{args.client}/{args.product}/{args.template}"
    if args.angle:
        context_label = f"{context_label}/{args.angle}"
    print(f"Client/product/template: {context_label}")
    print(f"Persisting editor state to {context['state_file']}")
    server.serve_forever()


if __name__ == "__main__":
    main()
