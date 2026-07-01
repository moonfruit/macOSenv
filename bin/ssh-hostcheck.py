#!/usr/bin/env python3
"""分析 ~/.ssh/saved_hosts 中各主机的可达性。

联合判断（TCP 连端口 + 真实 SSH 握手）给出综合状态：
  SSH_OK            TCP 通 且 读到 SSH banner（SSH 服务正常）
  PORT_OPEN_NO_SSH  TCP 通 但 未收到 SSH banner（端口通但非 SSH / 被劫持）
  UNREACH           解析成功但 TCP 连不上（超时 / 拒绝 / 无路由）
  DNS_FAIL          无法解析主机名（DNS / mDNS 失败）

每个条目先用 `ssh -G` 解析出真实 hostname / port，因此 ~/.ssh/config
里的别名（如 gpp@ibm-aix）和自定义端口都会被正确处理。
"""

import argparse
import json
import os
import socket
import subprocess
import sys
import time
from concurrent.futures import ThreadPoolExecutor

DEFAULT_HOSTS = os.path.expanduser("~/.ssh/saved_hosts")

# 状态常量
SSH_OK = "SSH_OK"
PORT_OPEN_NO_SSH = "PORT_OPEN_NO_SSH"
UNREACH = "UNREACH"
DNS_FAIL = "DNS_FAIL"

# 展示顺序、标签、颜色（前景色码）
STATUS_META = [
    (SSH_OK,           "✓ SSH 正常",         "32"),  # green
    (PORT_OPEN_NO_SSH, "⚠ 端口通但非 SSH",   "33"),  # yellow
    (UNREACH,          "✗ 不可达",           "31"),  # red
    (DNS_FAIL,         "✗ DNS 解析失败",     "35"),  # magenta
]
STATUS_LABEL = {k: v for k, v, _ in STATUS_META}
STATUS_COLOR = {k: c for k, _, c in STATUS_META}

USE_COLOR = sys.stdout.isatty()


def color(text, code):
    if not USE_COLOR or not code:
        return text
    return f"\033[{code}m{text}\033[0m"


def parse_hosts(path):
    """读取 saved_hosts，返回 [user@host, ...]，跳过空行与 # 注释。"""
    targets = []
    with open(path, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            targets.append(line)
    return targets


def resolve_via_ssh(target):
    """用 `ssh -G` 解析真实 hostname / port / 代理，吃到 ~/.ssh/config。

    失败或疑似 IPv6 字面量时回退到原始拆分（user@host, 22）。
    返回 (hostname, port, proxy)；proxy 为跳板/代理描述字符串，无则 ""。
    """
    # 拆出 host 部分用于 IPv6 判断
    raw_host = target.split("@", 1)[-1]
    # IPv6 字面量（多个冒号且非 host:port）交给 ssh -G 容易误解析，直接用原值
    if raw_host.count(":") >= 2:
        return raw_host, 22, ""
    try:
        out = subprocess.run(
            ["ssh", "-G", target],
            capture_output=True, text=True, timeout=8, check=False,
        ).stdout
    except Exception:  # noqa: BLE001
        return raw_host, 22, ""
    hostname, port, proxy = raw_host, 22, ""
    for ln in out.splitlines():
        if ln.startswith("hostname "):
            hostname = ln.split(None, 1)[1].strip()
        elif ln.startswith("port "):
            try:
                port = int(ln.split(None, 1)[1].strip())
            except ValueError:
                pass
        elif ln.startswith("proxyjump "):
            val = ln.split(None, 1)[1].strip()
            if val.lower() != "none":
                proxy = f"跳板 {val}"
        elif ln.startswith("proxycommand "):
            val = ln.split(None, 1)[1].strip()
            if val and val.lower() != "none" and not proxy:
                proxy = "ProxyCommand"
    return hostname, port, proxy


def probe_via_ssh(result, target, proxy, connect_timeout):
    """对需要 ProxyJump/ProxyCommand 的主机，用 ssh 子进程走完整代理链探测。

    直连 socket 无法穿过跳板，故这里让 ssh 自己处理整条链，
    通过退出码与 stderr 关键字判定综合状态。
    """
    # 每一跳的 ConnectTimeout；子进程总超时给足跳数余量
    ct = max(1, round(connect_timeout))
    proc_timeout = ct * 3 + 8
    cmd = [
        "ssh",
        "-o", "BatchMode=yes",
        "-o", f"ConnectTimeout={ct}",
        "-o", "StrictHostKeyChecking=accept-new",
        "-o", "NumberOfPasswordPrompts=0",
        target, "true",
    ]
    t0 = time.monotonic()
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, timeout=proc_timeout, check=False)
    except subprocess.TimeoutExpired:
        result["status"] = UNREACH
        result["detail"] = f"连接超时（经{proxy}）"
        return result
    result["latency_ms"] = int((time.monotonic() - t0) * 1000)
    err = (p.stderr or "").lower()

    if p.returncode == 0:
        result["status"] = SSH_OK
        result["detail"] = f"连接成功（经{proxy}）"
    elif "could not resolve hostname" in err:
        result["status"] = DNS_FAIL
        result["detail"] = f"无法解析（经{proxy}）"
    elif "permission denied" in err or "authentication" in err or \
            "host key verification failed" in err:
        # SSH 服务响应了，只是认证/主机密钥问题 —— 视为可达
        result["status"] = SSH_OK
        result["detail"] = f"可达（SSH 已响应，认证未通过；经{proxy}）"
    elif "connection refused" in err:
        result["status"] = UNREACH
        result["detail"] = f"连接被拒绝（经{proxy}）"
    elif "timed out" in err or "timeout" in err or "operation timed out" in err:
        result["status"] = UNREACH
        result["detail"] = f"连接超时（经{proxy}）"
    elif "no route to host" in err:
        result["status"] = UNREACH
        result["detail"] = f"无路由（经{proxy}）"
    elif "network is unreachable" in err:
        result["status"] = UNREACH
        result["detail"] = f"网络不可达（经{proxy}）"
    else:
        result["status"] = UNREACH
        snippet = " ".join((p.stderr or "").split())[:80]
        result["detail"] = f"失败（经{proxy}）：{snippet}" if snippet else f"失败（经{proxy}）"
    return result


def probe(target, connect_timeout, banner_timeout):
    """探测单个 target，返回结果 dict。"""
    hostname, port, proxy = resolve_via_ssh(target)
    result = {
        "target": target,
        "hostname": hostname,
        "port": port,
        "proxy": proxy,
        "status": None,
        "detail": "",
        "latency_ms": None,
    }

    # 需要跳板/代理的主机：直连 socket 探测会绕过代理导致误判，改用 ssh 走完整链
    if proxy:
        return probe_via_ssh(result, target, proxy, connect_timeout)

    # 1) DNS / 地址解析
    try:
        addrinfos = socket.getaddrinfo(hostname, port, proto=socket.IPPROTO_TCP)
    except socket.gaierror as e:
        result["status"] = DNS_FAIL
        result["detail"] = e.strerror or str(e)
        return result
    except Exception as e:  # noqa: BLE001
        result["status"] = DNS_FAIL
        result["detail"] = str(e)
        return result

    # 2) TCP 连接（逐个候选地址尝试）
    last_err = ""
    sock = None
    resolved_ip = ""
    for family, socktype, _proto, _canon, sockaddr in addrinfos:
        s = socket.socket(family, socktype)
        s.settimeout(connect_timeout)
        try:
            t0 = time.monotonic()
            s.connect(sockaddr)
            result["latency_ms"] = int((time.monotonic() - t0) * 1000)
            resolved_ip = sockaddr[0]
            sock = s
            break
        except TimeoutError:
            last_err = "连接超时"
            s.close()
        except ConnectionRefusedError:
            last_err = "连接被拒绝"
            s.close()
        except OSError as e:  # 无路由 / 网络不可达等
            last_err = e.strerror or str(e)
            s.close()

    if sock is None:
        result["status"] = UNREACH
        result["detail"] = last_err
        return result

    # 3) 读 SSH banner —— 协议级握手确认
    try:
        sock.settimeout(banner_timeout)
        banner = sock.recv(256)
    except TimeoutError:
        banner = b""
    except OSError:
        banner = b""
    finally:
        try:
            sock.close()
        except OSError:
            pass

    detail_ip = f"{resolved_ip}:{port}" if resolved_ip else f"{hostname}:{port}"
    # 只取 banner 首行（部分服务如 dropbear 会紧跟二进制 KEX 数据），并过滤不可打印字符
    first_line = banner.split(b"\n", 1)[0].split(b"\r", 1)[0]
    text = "".join(c for c in first_line.decode("ascii", "replace") if c.isprintable())
    if banner.startswith(b"SSH-"):
        result["status"] = SSH_OK
        result["detail"] = text
    else:
        result["status"] = PORT_OPEN_NO_SSH
        result["detail"] = f"{detail_ip} 无 SSH banner" + (f"（{text[:40]}）" if text else "（无响应）")
    return result


def main():
    ap = argparse.ArgumentParser(description="分析 saved_hosts 中主机的可达性")
    ap.add_argument("path", nargs="?", default=DEFAULT_HOSTS,
                    help=f"hosts 文件路径（默认 {DEFAULT_HOSTS}）")
    ap.add_argument("-t", "--timeout", type=float, default=5.0,
                    help="TCP 连接超时秒数（默认 5）")
    ap.add_argument("-b", "--banner-timeout", type=float, default=3.0,
                    help="读取 SSH banner 超时秒数（默认 3）")
    ap.add_argument("-j", "--jobs", type=int, default=32,
                    help="并发探测数（默认 32）")
    ap.add_argument("--no-color", action="store_true", help="禁用彩色输出")
    ap.add_argument("--only-unreachable", action="store_true",
                    help="只打印不可达 / 异常的条目")
    ap.add_argument("--json", action="store_true",
                    help="以 JSON 输出结果（禁用彩色/分组文本）")
    args = ap.parse_args()

    global USE_COLOR
    if args.no_color:
        USE_COLOR = False

    if not os.path.exists(args.path):
        print(f"文件不存在: {args.path}", file=sys.stderr)
        return 2

    targets = parse_hosts(args.path)
    if not targets:
        print(f"未在 {args.path} 中找到任何主机", file=sys.stderr)
        return 1

    print(f"探测 {len(targets)} 个条目（{args.path}），并发 {args.jobs}，"
          f"超时 {args.timeout:g}s …\n", file=sys.stderr)

    with ThreadPoolExecutor(max_workers=args.jobs) as ex:
        results = list(ex.map(
            lambda t: probe(t, args.timeout, args.banner_timeout),
            targets,
        ))

    # 按状态分组
    groups = {k: [] for k, _, _ in STATUS_META}
    for r in results:
        groups[r["status"]].append(r)

    bad = len(groups[UNREACH]) + len(groups[DNS_FAIL])

    # JSON 输出
    if args.json:
        out_results = results
        if args.only_unreachable:
            out_results = [r for r in results if r["status"] != SSH_OK]
        payload = {
            "path": args.path,
            "total": len(results),
            "summary": {k: len(groups[k]) for k, _, _ in STATUS_META},
            "hosts": [
                {
                    "target": r["target"],
                    "hostname": r["hostname"],
                    "port": r["port"],
                    "proxy": r["proxy"],
                    "status": r["status"],
                    "reachable": r["status"] == SSH_OK,
                    "latency_ms": r["latency_ms"],
                    "detail": r["detail"],
                }
                for r in sorted(out_results, key=lambda x: (x["status"], x["target"]))
            ],
        }
        print(json.dumps(payload, ensure_ascii=False, indent=2))
        return 1 if bad else 0

    # target 列宽（ASCII 为主，用 len 足够）
    width = max((len(r["target"]) for r in results), default=0)

    show_ok = not args.only_unreachable
    for status, label, code in STATUS_META:
        items = groups[status]
        if not items:
            continue
        if status == SSH_OK and not show_ok:
            continue
        header = f"{label}  ({len(items)})"
        print(color(header, code))
        print(color("─" * max(len(header), 20), code))
        for r in sorted(items, key=lambda x: x["target"]):
            tgt = r["target"].ljust(width)
            if status == SSH_OK:
                lat = f"{r['latency_ms']}ms" if r["latency_ms"] is not None else ""
                print(f"  {tgt}  {lat:>7}  {r['detail']}")
            else:
                print(f"  {color(tgt, code)}  {r['detail']}")
        print()

    # 汇总
    summary = "  ".join(
        f"{STATUS_LABEL[k].split(' ', 1)[-1]}:{len(groups[k])}"
        for k, _, _ in STATUS_META
    )
    print(color(f"汇总: 共 {len(results)}  |  {summary}", "1"), file=sys.stderr)

    # 有任何不可达 / DNS 失败则返回非零，便于脚本判断
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
