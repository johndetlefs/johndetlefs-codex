#!/usr/bin/env python3
"""Serve the ad editor and persist editor project JSON to disk."""

from __future__ import annotations

import argparse
import datetime as dt
import json
from http import HTTPStatus
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import urlparse


PROJECT_ROOT = Path(__file__).resolve().parents[1]
STATE_FILE = PROJECT_ROOT / "meta-image-ad-editor-state.json"
API_PATH = "/api/meta-image-ad-editor/project"
MAX_BODY_BYTES = 12 * 1024 * 1024


class EditorRequestHandler(SimpleHTTPRequestHandler):
    server_version = "GRDBEditor/1.0"

    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(PROJECT_ROOT), **kwargs)

    def end_headers(self):
        self.send_header("Cache-Control", "no-store")
        super().end_headers()

    def do_OPTIONS(self):
        if self._is_project_api():
            self.send_response(HTTPStatus.NO_CONTENT)
            self.send_header("Access-Control-Allow-Methods", "GET, PUT, POST, OPTIONS")
            self.send_header("Access-Control-Allow-Headers", "Content-Type")
            self.end_headers()
            return
        super().do_OPTIONS()

    def do_GET(self):
        if not self._is_project_api():
            super().do_GET()
            return

        if not STATE_FILE.exists():
            self._send_json({"ok": False, "error": "No saved editor project file"}, HTTPStatus.NOT_FOUND)
            return

        try:
            payload = json.loads(STATE_FILE.read_text(encoding="utf-8"))
        except json.JSONDecodeError:
            self._send_json({"ok": False, "error": "Saved editor project file is invalid JSON"}, HTTPStatus.INTERNAL_SERVER_ERROR)
            return

        self._send_json(payload)

    def do_POST(self):
        self._write_project()

    def do_PUT(self):
        self._write_project()

    def _is_project_api(self) -> bool:
        return urlparse(self.path).path == API_PATH

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
            "storageKey": payload.get("storageKey", ""),
            "savedAt": payload.get("savedAt") or dt.datetime.now(dt.timezone.utc).isoformat(),
            "project": project,
        }

        tmp_file = STATE_FILE.with_suffix(".json.tmp")
        tmp_file.write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8")
        tmp_file.replace(STATE_FILE)

        self._send_json({"ok": True, "path": str(STATE_FILE), "savedAt": record["savedAt"]})

    def _send_json(self, payload: dict, status: HTTPStatus = HTTPStatus.OK):
        body = json.dumps(payload).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)


def main():
    parser = argparse.ArgumentParser(description="Serve the Get Rid Of Dad Bod ad editor with disk persistence.")
    parser.add_argument("--host", default="127.0.0.1")
    parser.add_argument("--port", type=int, default=8765)
    args = parser.parse_args()

    server = ThreadingHTTPServer((args.host, args.port), EditorRequestHandler)
    print(f"Serving ad editor at http://{args.host}:{args.port}/meta-image-ad-editor.html")
    print(f"Persisting editor state to {STATE_FILE}")
    server.serve_forever()


if __name__ == "__main__":
    main()
