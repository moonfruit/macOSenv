#!/usr/bin/env python3
import fcntl
import hashlib
import json
import os
import sys
import time
from contextlib import contextmanager
from pathlib import Path
from urllib.request import Request, urlopen

CACHE_DIR = Path("~/.cache/ccstatusline").expanduser()

# quota/limit 返回 limits[] 里 unit 标识窗口粒度：3=小时（number=5 即 5h 编码
# 限额），6=周（number=1）。映射成与 minimax-usage.py 相同的虚拟键。
UNIT_KEYS = {3: "usage", 6: "weekly_usage"}


def get_api_key() -> str:
    key = os.environ.get("ANTHROPIC_AUTH_TOKEN") or os.environ.get("Z_AI_API_KEY")
    if not key:
        print("Error: No API key found in ANTHROPIC_AUTH_TOKEN or Z_AI_API_KEY", file=sys.stderr)
        sys.exit(1)
    return key


def get_key_hash(key: str) -> str:
    return hashlib.sha256(key.encode()).hexdigest()[:16]


def get_cache_path(key_hash: str) -> Path:
    CACHE_DIR.mkdir(parents=True, exist_ok=True)
    return CACHE_DIR / f"usage-glm-{key_hash}.json"


def get_lock_path(key_hash: str) -> Path:
    CACHE_DIR.mkdir(parents=True, exist_ok=True)
    return CACHE_DIR / f"usage-glm-{key_hash}.lock"


def is_cache_valid(cache_path: Path) -> bool:
    if not cache_path.exists():
        return False
    mtime = cache_path.stat().st_mtime
    return (time.time() - mtime) < 30


def fetch_and_cache(key, cache_path: Path):
    url = "https://bigmodel.cn/api/monitor/usage/quota/limit"
    headers = {"Authorization": f"Bearer {key}", "Content-Type": "application/json"}

    req = Request(url, headers=headers, method="GET")
    try:
        with urlopen(req, timeout=30) as resp:
            if resp.status == 200:
                data = json.loads(resp.read().decode())
                if data.get("success"):
                    info = data.get("data", {})
                    # limits[] 条目：usage=窗口总额度（credits），currentValue=已用，
                    # remaining=剩余，nextResetTime=窗口重置时刻（epoch ms）。
                    result = {
                        UNIT_KEYS[item["unit"]]: item
                        for item in info.get("limits", [])
                        if item.get("unit") in UNIT_KEYS
                    }
                    result["level"] = info.get("level", "")
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


def usage_str(item: dict) -> str:
    # 已用% 自算而不采用服务端 percentage：实测其与本组字段推算值有出入。
    total = int(item.get("usage", 0))
    remaining = int(item.get("remaining", 0))
    used_pct = (total - remaining) / total * 100 if total > 0 else 0
    pct_str = f"{round(used_pct)}%"

    reset_ms = int(item.get("nextResetTime", 0))
    seconds = int(max(0, (reset_ms - time.time() * 1000) // 1000))
    minutes = seconds // 60
    hours, minutes = minutes // 60, minutes % 60
    days, hours = hours // 24, hours % 24

    if days > 0:
        time_str = f"{days}d{hours}h{minutes}m"
    elif hours > 0:
        time_str = f"{hours}h{minutes}m"
    else:
        time_str = f"{minutes}m"

    return f"{pct_str}->{time_str}"


def main():
    if len(sys.argv) < 2:
        print("Usage: glm-usage.py [-] [usage|weekly_usage|level|...]", file=sys.stderr)
        sys.exit(1)

    # 第一个参数与 minimax-usage.py 的 model_name 占位对齐（ccstatusline 传 "-"）；
    # GLM 配额不区分模型，忽略。仅 stdin 非 tty 时读掉，保持管道卫生也不阻塞手动调试。
    if sys.argv[1] == "-" and not sys.stdin.isatty():
        sys.stdin.read()

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

    if key is None:
        print(json.dumps(data))
    elif key in UNIT_KEYS.values():
        item = data.get(key)
        if not item:
            sys.exit(1)
        print(usage_str(item))
    else:
        val = data.get(key)
        if val is None:
            sys.exit(1)
        if isinstance(val, (str, int, float)):
            print(val)
        else:
            print(json.dumps(val))


if __name__ == "__main__":
    main()
