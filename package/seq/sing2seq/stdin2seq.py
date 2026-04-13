#!/usr/bin/env python3
"""Stream sing-box logs from stdin to Seq."""
from __future__ import annotations

import argparse
import sys

from common import Batcher, add_common_args, build_ssl_ctx, ingest


def main() -> int:
    ap = argparse.ArgumentParser(description="Stream sing-box logs from stdin to Seq")
    add_common_args(ap)
    args = ap.parse_args()

    batcher = Batcher(args.url, args.api_key, ssl_ctx=build_ssl_ctx(args.insecure))
    ingest(sys.stdin, batcher)
    return 1 if batcher.failed else 0


if __name__ == "__main__":
    sys.exit(main())
