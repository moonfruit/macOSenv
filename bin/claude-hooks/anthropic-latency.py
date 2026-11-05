#!/usr/bin/env python3
"""跨会话每分钟最多探测一次；状态栏只读缓存，探测在后台进行。"""
import fcntl
import json
import os
from pathlib import Path
import subprocess
import sys
import time

CACHE_DIR = Path.home() / '.cache' / 'ccstatusline'
CACHE = CACHE_DIR / 'anthropic-latency.json'
LOCK = CACHE_DIR / 'anthropic-latency.lock'


def read_cache():
    try:
        return json.loads(CACHE.read_text())
    except (OSError, ValueError):
        return {}


def save_cache(data):
    temporary = CACHE.with_suffix('.tmp')
    temporary.write_text(json.dumps(data))
    os.replace(temporary, CACHE)


def refresh():
    CACHE_DIR.mkdir(parents=True, exist_ok=True)
    with LOCK.open('a') as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            return
        cached = read_cache()
        now = time.time()
        if now - cached.get('attempted_at', 0) < 60:
            return
        # 发请求前记录时间，失败或进程中断也不会立即重试。
        save_cache({'attempted_at': now, 'value': cached.get('value', '')})
        value = ''
        try:
            result = subprocess.run(
                ['curl', '--silent', '--output', '/dev/null',
                 '--connect-timeout', '2', '--max-time', '3',
                 '--write-out', '%{time_starttransfer}',
                 'https://api.anthropic.com/'],
                capture_output=True, text=True, timeout=4,
            )
            if result.returncode == 0:
                value = f'{float(result.stdout) * 1000:.0f}ms'
        except (OSError, ValueError, subprocess.TimeoutExpired):
            pass
        save_cache({'attempted_at': now, 'value': value})


if __name__ == '__main__':
    if '--refresh' in sys.argv:
        refresh()
    else:
        cached = read_cache()
        value = cached.get('value', '')
        print('' if value == '--' else value)
        if time.time() - cached.get('attempted_at', 0) >= 60:
            subprocess.Popen(
                [sys.executable, str(Path(__file__).resolve()), '--refresh'],
                stdin=subprocess.DEVNULL, stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL, start_new_session=True,
            )
