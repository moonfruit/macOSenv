#!/usr/bin/env python3
import fcntl
import hashlib
import json
import os
import sys
import time
from collections.abc import Callable
from contextlib import contextmanager
from pathlib import Path
from urllib.request import Request, urlopen

CACHE_DIR = Path("~/.cache/ccstatusline").expanduser()


def get_api_key() -> str:
    key = os.environ.get("ANTHROPIC_AUTH_TOKEN") or os.environ.get("MINIMAX_API_KEY")
    if not key:
        print("Error: No API key found in ANTHROPIC_AUTH_TOKEN or MINIMAX_API_KEY", file=sys.stderr)
        sys.exit(1)
    return key


def get_key_hash(key: str) -> str:
    return hashlib.sha256(key.encode()).hexdigest()[:16]


def get_cache_path(key_hash: str) -> Path:
    CACHE_DIR.mkdir(parents=True, exist_ok=True)
    return CACHE_DIR / f"usage-minimax-{key_hash}.json"


def get_lock_path(key_hash: str) -> Path:
    CACHE_DIR.mkdir(parents=True, exist_ok=True)
    return CACHE_DIR / f"usage-minimax-{key_hash}.lock"


def is_cache_valid(cache_path: Path) -> bool:
    if not cache_path.exists():
        return False
    mtime = cache_path.stat().st_mtime
    return (time.time() - mtime) < 30


def fetch_and_cache(key, cache_path: Path):
    url = "https://www.minimaxi.com/v1/api/openplatform/coding_plan/remains"
    headers = {"Authorization": f"Bearer {key}", "Content-Type": "application/json"}

    req = Request(url, headers=headers, method="GET")
    try:
        with urlopen(req, timeout=30) as resp:
            if resp.status == 200:
                data = json.loads(resp.read().decode())
                if data.get("base_resp", {}).get("status_code") == 0:
                    model_remains = data.get("model_remains", [])
                    result = {item["model_name"]: item for item in model_remains}
                    cache_path.write_text(json.dumps(result))
                    return result
    except Exception as e:
        print(f"Error fetching data: {e}", file=sys.stderr)
    return None


def load_cache(cache_path: Path):
    if not cache_path.exists():
        return None
    return json.loads(cache_path.read_text())


@contextmanager
def flock(path: Path):
    fd = os.open(path, os.O_CREAT | os.O_RDWR)
    try:
        fcntl.flock(fd, fcntl.LOCK_EX)
        yield
    finally:
        fcntl.flock(fd, fcntl.LOCK_UN)
        os.close(fd)
        try:
            path.unlink()
        except FileNotFoundError:
            pass


def usage(usage_key: str, total_key: str, remains_key: str) -> Callable[[dict], str]:
    def _print(result: dict) -> str:
        usage = result.get(usage_key, 0)
        total = result.get(total_key, 0)
        remains = result.get(remains_key, 0)

        if usage < total:
            pct = (total - usage) / total * 100
            pct_str = f"{pct:.1f}%"
        else:
            pct_str = "0.0%"

        ms = int(remains)
        seconds = ms // 1000
        minutes = seconds // 60
        hours = minutes // 60
        minutes = minutes % 60

        if hours > 0:
            time_str = f"{hours}h{minutes}m"
        else:
            time_str = f"{minutes}m"

        return f"{pct_str}->{time_str}"

    return _print


VIRTUAL_KEYS: dict = {
    "usage": usage("current_interval_usage_count", "current_interval_total_count", "remains_time"),
    "weekly_usage": usage("current_weekly_usage_count", "current_weekly_total_count", "weekly_remains_time"),
}


def main():
    if len(sys.argv) < 2:
        print("Usage: ccstatusline-minimax-usage.py <model_name> [key]", file=sys.stderr)
        sys.exit(1)

    model_name = sys.argv[1]
    key = sys.argv[2] if len(sys.argv) > 2 else None

    api_key = get_api_key()
    key_hash = get_key_hash(api_key)
    cache_path = get_cache_path(key_hash)
    lock_path = get_lock_path(key_hash)

    data = None
    if not is_cache_valid(cache_path):
        with flock(lock_path):
            if not is_cache_valid(cache_path):
                data = fetch_and_cache(api_key, cache_path)

    if data is None:
        data = load_cache(cache_path)
        if data is None:
            print("Error: Failed to load cache data", file=sys.stderr)
            sys.exit(1)

    if model_name == "-":
        input_json = json.loads(sys.stdin.read())
        model_name = input_json.get("model", {}).get("id", "")
        if not model_name:
            print("Error: stdin JSON missing model.id", file=sys.stderr)
            sys.exit(1)

    if model_name.startswith("MiniMax-M"):
        model_name = "MiniMax-M*"

    result = data.get(model_name)
    if not result:
        sys.exit(1)

    if key:
        handler = VIRTUAL_KEYS.get(key)
        if handler:
            print(handler(result))
        else:
            val = result.get(key)
            if val is None:
                sys.exit(1)
            if isinstance(val, (str, int, float)):
                print(val)
            else:
                print(json.dumps(val))
    else:
        print(json.dumps(result))


if __name__ == "__main__":
    main()
