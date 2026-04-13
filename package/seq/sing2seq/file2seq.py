#!/usr/bin/env python3
"""Ship sing-box log file to Seq, tracking inode+offset for resumable reads."""
from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections.abc import Iterator
from pathlib import Path

from common import (
    DEFAULT_STATE_DIR,
    Batcher,
    add_common_args,
    build_ssl_ctx,
    ingest,
)


def state_file(path: Path) -> Path:
    DEFAULT_STATE_DIR.mkdir(parents=True, exist_ok=True)
    h = hashlib.sha1(str(path.resolve()).encode()).hexdigest()[:16]
    return DEFAULT_STATE_DIR / f"{h}.state"


def load_state(sf: Path) -> tuple[int, int]:
    if not sf.exists():
        return (0, 0)
    try:
        data = json.loads(sf.read_text())
        return (int(data.get("inode", 0)), int(data.get("offset", 0)))
    except (OSError, ValueError):
        return (0, 0)


def save_state(sf: Path, inode: int, offset: int) -> None:
    sf.write_text(json.dumps({"inode": inode, "offset": offset}))


class FileReader:
    """Reads from saved offset; caller must invoke commit() after successful ingest."""

    def __init__(self, path: Path):
        self.path = path
        self.sf = state_file(path)
        prev_inode, prev_offset = load_state(self.sf)
        st = path.stat()
        self.inode = st.st_ino
        self.start_offset = (
            prev_offset if st.st_ino == prev_inode and st.st_size >= prev_offset else 0
        )
        self.end_offset = self.start_offset

    def lines(self) -> Iterator[str]:
        with self.path.open("r", encoding="utf-8", errors="replace") as f:
            f.seek(self.start_offset)
            self.end_offset = self.start_offset
            for line in f:
                yield line
                self.end_offset += len(line.encode("utf-8", errors="replace"))

    def commit(self) -> None:
        save_state(self.sf, self.inode, self.end_offset)


def main() -> int:
    ap = argparse.ArgumentParser(description="Ship sing-box log file to Seq")
    ap.add_argument("file", type=Path, help="path to sing-box log file")
    ap.add_argument("--reset", action="store_true", help="ignore saved offset")
    add_common_args(ap)
    args = ap.parse_args()

    path: Path = args.file
    if args.reset:
        sf = state_file(path)
        if sf.exists():
            sf.unlink()
    if not path.exists():
        print(f"[file2seq] file not found: {path}", file=sys.stderr)
        return 1

    # interval=None: file read is tight-loop, only size threshold matters; a trailing
    # flush at EOF ships any remainder.
    batcher = Batcher(args.url, args.api_key, ssl_ctx=build_ssl_ctx(args.insecure), interval=None)
    reader = FileReader(path)
    ingest(reader.lines(), batcher)

    if batcher.failed:
        print(
            f"[file2seq] ingest failed; offset not advanced (stays at {reader.start_offset})",
            file=sys.stderr,
        )
        return 1
    reader.commit()
    return 0


if __name__ == "__main__":
    sys.exit(main())
