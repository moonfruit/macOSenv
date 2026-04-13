"""Shared helpers for file2seq / stdin2seq."""
from __future__ import annotations

import argparse
import json
import os
import ssl
import sys
import time
import urllib.request
from collections.abc import Iterable
from pathlib import Path

from parser import parse_line

DEFAULT_SEQ_URL = os.environ.get("SEQ_URL", "http://localhost:5341")
DEFAULT_API_KEY = os.environ.get("SEQ_API_KEY", "")
DEFAULT_STATE_DIR = Path(os.environ.get("SING2SEQ_STATE_DIR", Path.home() / ".cache" / "sing2seq"))
BATCH_SIZE = 200
BATCH_INTERVAL = 2.0


def post_clef(url: str, api_key: str, events: list[dict], ctx: ssl.SSLContext | None = None) -> None:
    if not events:
        return
    body = "\n".join(json.dumps(e, ensure_ascii=False) for e in events).encode("utf-8")
    req = urllib.request.Request(
        url.rstrip("/") + "/ingest/clef",
        data=body,
        method="POST",
        headers={"Content-Type": "application/vnd.serilog.clef"},
    )
    if api_key:
        req.add_header("X-Seq-ApiKey", api_key)
    with urllib.request.urlopen(req, timeout=30, context=ctx) as resp:
        if resp.status >= 300:
            raise RuntimeError(f"seq ingest failed: {resp.status} {resp.read()!r}")


class Batcher:
    def __init__(
        self,
        url: str,
        api_key: str,
        ssl_ctx: ssl.SSLContext | None = None,
        size: int = BATCH_SIZE,
        interval: float | None = BATCH_INTERVAL,
    ):
        self.url = url
        self.api_key = api_key
        self.ssl_ctx = ssl_ctx
        self.size = size
        self.interval = interval
        self.buf: list[dict] = []
        self.last = time.monotonic()
        self.failed = False

    def add(self, ev: dict) -> None:
        self.buf.append(ev)
        if len(self.buf) >= self.size:
            self.flush()
        elif self.interval is not None and (time.monotonic() - self.last) >= self.interval:
            self.flush()

    def flush(self) -> None:
        if not self.buf:
            return
        try:
            post_clef(self.url, self.api_key, self.buf, self.ssl_ctx)
        except Exception as e:
            print(f"[sing2seq] flush failed: {e}", file=sys.stderr)
            self.failed = True
            return
        self.buf.clear()
        self.last = time.monotonic()


def add_common_args(ap: argparse.ArgumentParser) -> None:
    ap.add_argument("--url", default=DEFAULT_SEQ_URL, help="Seq base URL (default %(default)s)")
    ap.add_argument("--api-key", default=DEFAULT_API_KEY, help="Seq API key")
    ap.add_argument("--insecure", action="store_true", help="skip TLS verification")


def build_ssl_ctx(insecure: bool) -> ssl.SSLContext | None:
    if not insecure:
        return None
    ctx = ssl.create_default_context()
    ctx.check_hostname = False
    ctx.verify_mode = ssl.CERT_NONE
    return ctx


def ingest(lines: Iterable[str], batcher: Batcher) -> None:
    for line in lines:
        ev = parse_line(line)
        if ev is not None:
            batcher.add(ev)
    batcher.flush()
