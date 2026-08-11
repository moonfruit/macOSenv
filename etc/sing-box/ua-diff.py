#!/usr/bin/env python3
"""探测订阅在不同客户端 User-Agent 下能拉到多少 sing-box 可用的出站节点。

机场按 UA 下发不同内容：换格式、按客户端能力裁剪协议、改节点名、塞广告节点。
用 sing-box 自己的 UA 拉往往只拿到一小撮，换个 UA 常能拿到更全的列表，而多出来的
节点很多 sing-box 其实支持得了。这个脚本把它们找出来。

用法：./ua-diff.py [-f clash.txt] [--only 名字] [--dump 目录] [--json]
"""

from __future__ import annotations

import argparse
import base64
import binascii
import functools
import json
import re
import shutil
import subprocess
import sys
import threading
import time
import unicodedata
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed, wait as wait_futures
from dataclasses import dataclass, field
from pathlib import Path
from urllib.parse import unquote, urlparse

# ---------------------------------------------------------------- 常量表

# subscribe.sh 对 sing-box 客户端硬编码的 UA。这是 update.sh 当前实际发出去的串，
# 基准增量相对它计算，所以必须与 $WORKSPACE/proxy/sing-rules/subscribe.sh 保持一致。
SING_BOX_BASELINE_UA = "SFA/1.13.16 (sing-box 1.13.16)"

# 各客户端的最新版与「广泛使用的旧版」。旧版取上一个 minor 系列的末版——patch 之间
# 机场不会区别对待，minor 跨越才可能带来协议特性差异。改版本号只需改这张表。
UA_TABLE: dict[str, list[tuple[str, str]]] = {
    # GitHub Releases 实测（2026-08-10）。v1.19.29 发布于 2026-07-18。
    # v1.18.10 是 1.19 之前最后一个 minor 的末版。
    "mihomo": [
        ("1.19.29", "mihomo/v1.19.29"),
        ("1.18.10", "mihomo/v1.18.10"),
    ],
    # GitHub Releases 实测。v2.5.2 发布于 2026-07-19；v2.4.7 发布于 2026-03-21，是 2.4.x 末版。
    "clash-verge": [
        ("2.5.2", "clash-verge/v2.5.2"),
        ("2.4.7", "clash-verge/v2.4.7"),
    ],
    # 最新版由 iTunes Lookup API 实测（2.2.90，2026-07-07）。
    # 2.2.65 发布于 2025-04-20，约一年前；付费 App 更新率低，存量大。
    "shadowrocket": [
        ("2.2.90", "Shadowrocket/2.2.90 (iPhone; iOS 18.6; Scale/3.00)"),
        ("2.2.65", "Shadowrocket/2.2.65 (iPhone; iOS 18.6; Scale/3.00)"),
    ],
    # 最新版由 iTunes Lookup API 实测（3.5.0，2026-06-25）。
    # 3.2.6 是 3.2.x 末版（2025-02-03）；3.3.0 才加入 VLESS Reality，正好卡在分水岭上。
    "loon": [
        ("3.5.0", "Loon/3.5.0 (iPhone; iOS 18.6; Scale/3.00)"),
        ("3.2.6", "Loon/3.2.6 (iPhone; iOS 18.6; Scale/3.00)"),
    ],
    # GitHub Releases 实测（2026-08-10）。v1.13.18 发布于 2026-08-09。
    # v1.12.25 是 1.12.x 末版，大量机场配置生成器仍按 1.12 出配置。
    "sing-box": [
        ("1.13.18", "SFI/1.13.18 (sing-box 1.13.18)"),
        ("1.12.25", "SFI/1.12.25 (sing-box 1.12.25)"),
    ],
    # 最新版由 iTunes Lookup API 实测（1.6.0，2026-05-21）。
    # 1.5.1 发布于 2025-05-06，直到 1.6.0 才被取代，独占一年、装机量最大。
    "quantumult-x": [
        ("1.6.0", "Quantumult%20X/1.6.0 (iPhone; iOS 18.6)"),
        ("1.5.1", "Quantumult%20X/1.5.1 (iPhone; iOS 18.6)"),
    ],
}


# ---------------------------------------------------------------- 数据类


@dataclass(frozen=True)
class Subscription:
    """clash.txt 中的一行。"""

    name: str
    url: str
    client: str


@dataclass(frozen=True)
class Node:
    """一个出站节点。type 已经过 normalize_type 归一。"""

    name: str
    type: str
    server: str
    port: int


@dataclass
class Probe:
    """一次探测的原始结果。

    body_len / preview 只为 fmt == "unknown" 的诊断服务：响应看不懂时，「0 个节点」
    是解析器的沉默而不是事实，必须报出响应有多大、开头长什么样，用户才能判断是被
    挡了还是拿到了广告页。preview 已转义，控制字符不会原样喷到终端。
    """

    client: str
    version: str
    ua: str
    is_baseline: bool
    status: int
    fmt: str
    nodes: list[Node]
    error: str = ""
    body_len: int = 0
    preview: str = ""

    @property
    def ok(self) -> bool:
        return not self.error and self.status == 200 and self.fmt != "unknown"


@dataclass
class Row:
    """一次探测经分类与增量计算后的结果。

    names 是真实节点（已剔除伪节点）的名字集合。它与指纹集合正交：机场改节点名时
    指纹一模一样、names 不同，据此能把「同一份列表」和「同一份列表但改了名」分开。
    """

    probe: Probe
    usable: set[str]
    pending: set[str]
    unusable: set[str]
    pseudo: list[Node]
    names: set[str] = field(default_factory=set)
    added: set[str] = field(default_factory=set)
    removed: set[str] = field(default_factory=set)

    @property
    def all_fingerprints(self) -> frozenset[str]:
        return frozenset(self.usable | self.pending | self.unusable)


@dataclass
class Report:
    """一个订阅的完整报告。"""

    subscription: Subscription
    baseline: Row | None
    rows: list[Row]
    recommended: Row | None
    groups: list[list[Row]]


# ---------------------------------------------------------------- 清单解析


def parse_clash_txt(text: str) -> list[Subscription]:
    """解析 clash.txt，跳过空行与 # 开头的注释行。

    每行三个字段 NAME URL CLIENT。第三个字段缺失时按 subscribe.sh 的默认值
    补 sing-box。字段不足两个的行直接丢弃。
    """
    subscriptions = []
    for line in text.splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        fields = line.split()
        if len(fields) < 2:
            continue
        client = fields[2] if len(fields) > 2 else "sing-box"
        subscriptions.append(Subscription(fields[0], fields[1], client))
    return subscriptions


def baseline_ua(client: str) -> str:
    """复现 subscribe.sh 的 UA 构造规则。

    sing-box 走硬编码串，其余一律 <client>/*。客户端名**原样**使用，哪怕它看着像
    拼错了——clash.txt 里写的就是 update.sh 当前实际发出去的串，是有效的对照项，
    不能在这里「修正」。机场按子串匹配不上的 UA 会落进「无法识别」分支，而那个分支
    往往回退到节点最全的格式，这正是要测的东西。
    """
    if client == "sing-box":
        return SING_BOX_BASELINE_UA
    return f"{client}/*"


# ---------------------------------------------------------------- 格式嗅探

# 机场常把订阅响应标成 text/plain 或 application/octet-stream，Content-Type 不可信，
# 一律按响应体嗅探。
_BASE64_CHARS = re.compile(r"^[A-Za-z0-9+/=_\-\s]+$")
_LINK_SCHEME = re.compile(r"^[a-z][a-z0-9+.\-]*://", re.IGNORECASE)
_CONF_SECTION = re.compile(r"^\[(Proxy|server_local)\]\s*$", re.MULTILINE | re.IGNORECASE)

# 订阅响应里的 conf 通常**只有节点行、没有段头**——机场给的是节点清单，不是整份配置
# 文件。所以除了段头，还得认得裸节点行；两行起判，一行太容易撞上普通 `key = value`。
_BARE_CONF_MIN_LINES = 2


def decode_base64(text: str) -> bytes:
    """宽容地解 base64：去空白、兼容 urlsafe 变体、自动补填充。解不开返回 b""。"""
    data = re.sub(r"\s+", "", text).replace("-", "+").replace("_", "/")
    if not data:
        return b""
    data += "=" * (-len(data) % 4)
    try:
        return base64.b64decode(data, validate=False)
    except (binascii.Error, ValueError):
        return b""


def detect_format(body: bytes, _depth: int = 0) -> str:
    """嗅探订阅响应的格式。

    _depth 只给 base64 分支的内层递归用：解出来的明文还得再嗅探一次，才知道包的是
    链接表还是 conf。**只递归一层**——base64 套 base64 现实中不存在，无限递归倒是
    真会发生（全 base64 字符集的正文解码后还是全 base64 字符集）。
    """
    text = body.decode("utf-8", errors="replace")
    stripped = text.strip()
    if not stripped:
        return "unknown"

    if stripped.startswith("{"):
        try:
            data = json.loads(stripped)
        except json.JSONDecodeError:
            pass
        else:
            if isinstance(data, dict) and "outbounds" in data:
                return "sing-box"

    if re.search(r"^proxies:", text, re.MULTILINE):
        return "clash"

    first_line = next((l.strip() for l in text.splitlines() if l.strip()), "")
    if _LINK_SCHEME.match(first_line):
        return "links"

    # 明文链接含 : 和 #，不会通过 base64 字符集检查，所以顺序上放在 links 之后是安全的
    if _BASE64_CHARS.match(stripped):
        decoded = decode_base64(stripped)
        if decoded:
            if _depth == 0:
                # 内层是什么，外层就是什么的 base64 包装。Quantumult X 对某些订阅返回的
                # 就是 base64 包的 [server_local] 行（`vless=host:port,…`），里头一个
                # `://` 都没有——只看 `://` 会把它整份丢成 unknown。
                inner = detect_format(decoded, _depth=1)
                if inner == "links":
                    return "base64"
                if inner == "conf":
                    return "base64-conf"
            # 兜底：首行不是链接（如机场塞的 STATUS= 行）但正文确实是链接表
            if b"://" in decoded:
                return "base64"

    if _CONF_SECTION.search(text) or _count_conf_node_lines(text) >= _BARE_CONF_MIN_LINES:
        return "conf"

    return "unknown"


# ---------------------------------------------------------------- 归一化与分级

# 各格式对同一协议的叫法不同，归一到 sing-box 的说法。键是去掉连字符下划线并小写后的形式。
_TYPE_ALIASES = {
    "shadowsocks": "ss",
    "shadowsocksr": "ssr",
    "hy": "hysteria",
    "hy2": "hysteria2",
    "socks5": "socks",
    "https": "http",
    "wg": "wireguard",
}

# sing-box 内核支持的出站协议全集。这是「⚠️ 待支持」与「✖️ 不可用」的分界线：
# 内核都不支持的类型（ssr、snell、juicity……）再怎么改管线也拉不回来。
SING_BOX_KERNEL_TYPES = frozenset({
    "anytls", "http", "hysteria", "hysteria2", "shadowtls", "socks", "ss",
    "ssh", "tor", "trojan", "tuic", "vless", "vmess", "wireguard",
})

# ✅ 可用：**在该订阅格式下** clash-to-sing.py 确实有转换分支。来源：
# $WORKSPACE/proxy/sing-rules/clash-to-sing.py 的 clash_proxy_to_outbound（:179）、
# shadowrocket_proxy_to_outbound（:251）、sing_box_proxy_to_outbound（:343，透传全收）。
# 两个非透传函数的 case _ 都 raise ValueError，而调用方 proxy_to_outbound（:131）
# 没有 try/except——误判为可用会让 update.sh 整个崩掉，不是跳过一个节点。
# 那边加了新协议要同步过来。
#
# 注意分支是按格式分裂的，不是一个全局集合：clash 收 vmess/ss 但不收 vless，
# shadowrocket 收 vless 但不收 ss/vmess，两边都没有 tuic。
# conf / base64-conf / links / unknown 不在表里——下游一个节点都进不了 config.json：
#   - conf / unknown：load_proxies（:1092）根本没有对应的 loader；
#   - base64-conf（base64 包着的 QX conf）：config.json 只能写 shadowrocket，而
#     load_shadowrocket_proxies（:1054）b64decode 之后按 `scheme://` 解析，
#     `vless=host:port,…` 会被 urlparse 解成 scheme 为空的垃圾，一个都进不去；
#   - links（明文链接表）：subscribe.sh 把响应体原样落盘，config.json 里该订阅的
#     format 只能写 shadowrocket，于是 load_shadowrocket_proxies（:1054）会对**明文**
#     无条件 base64.b64decode——明文链接表带 `:` `#` `/`，解码直接 binascii.Error
#     （Incorrect padding），那边没有 try/except，整个 clash-to-sing.py 崩掉。
# 所以 links 与 conf 同档：该格式下内核支持的类型全落 pending（补个 loader、或让
# subscribe.sh 多做一次 base64 编码就能捞回来），行动建议与 conf 一致。
USABLE_TYPES_BY_FORMAT: dict[str, frozenset[str]] = {
    "clash": frozenset({"hysteria2", "ss", "trojan", "vmess"}),
    "base64": frozenset({"vless", "trojan", "anytls"}),  # 走 shadowrocket loader
    # 透传：sing_box_proxy_to_outbound 原样吐出 outbound，管线不拦任何类型，
    # 但 sing-box 内核仍得认得它。拿内核全集当近似——严格说内核支持的类型可能比
    # 这张表更多（新版加的协议还没抄进来），近似只会偏保守，不会把不可用的判成可用。
    "sing-box": SING_BOX_KERNEL_TYPES,
}

# 机场把套餐信息塞成节点，它们是合法 URL 但复用真实节点的 server:port。
#
# 判据的取舍标准是**这个词会不会出现在真实节点名里**：
#   - 会出现的（`流量` `到期` `过期` `剩余` `重置` `套餐` `订阅` `机场` `群组`
#     `通知`）一律只能用词组或结构信号。裸词「流量」曾一次误杀 17 个真节点：
#     nanocloud 用 `(流量)` / `(通用)` 标计费档位，`❇️双鱼座-D(流量)`、
#     `🇭🇰香港-A(流量)` 全是真节点，却被整批剔出计数，基准的「21 可用」凭空少了一半。
#   - 几乎不可能出现的（`官网` `客服` `续费`）才允许留作裸词——没人会把节点叫
#     「香港客服」。
_PSEUDO_PHRASES = (
    "剩余流量", "总流量", "已用流量", "套餐流量", "流量重置", "距离下次", "重置剩余",
    "套餐到期", "到期时间", "过期时间",
    "续费", "官网", "客服", "http://", "https://", "t.me/",
)

# 结构信号：词组没穷举到的套餐行，靠形状兜住。
# 1) 日期：`2027-03-03` 或 `2027年3月3日`——真节点名不会写日期
# 2) 冒号（全角或半角）后跟「数字 + 流量/天数单位」——`剩余流量：86.89 GB` 的骨架
#
# 单位表**不收裸的 G / M / T**：机场按带宽命名节点是真实习惯（`香港01：100M`、
# `东京：1G专线`），收裸单字母就是把「流量误杀 17 个真节点」的错误换个入口重来一遍。
# 代价是漏掉 `剩余：88 G` 这类省了 B 的写法——流量单位一般不省 B，而且宁可漏一个
# 伪节点，也不能误杀真节点：误杀会低报可用数，那正是这次修复要根治的方向。
_PSEUDO_PATTERNS = (
    re.compile(r"\d{4}-\d{2}-\d{2}"),
    re.compile(r"\d{4}年\d{1,2}月\d{1,2}日"),
    re.compile(r"[：:]\s*[\d.]+\s*(?:GB|MB|TB|KB|天)", re.IGNORECASE),
)


def normalize_type(raw: str) -> str:
    """把各格式的协议名归一到 sing-box 的说法。未知类型原样小写返回。"""
    key = raw.strip().lower().replace("-", "").replace("_", "")
    return _TYPE_ALIASES.get(key, key)


# ------------------------------------------------ conf 行形状（嗅探与解析共用）

# 嗅探只问「这行长得像不像节点行」，不问 sing-box 用不用得上，所以内核不支持但机场
# 确实在下发的几种也得算数——否则一份全是 ssr 的 Loon 响应会被判成 unknown。
_CONF_EXTRA_TYPES = frozenset({"ssr", "snell", "juicity", "mieru", "hysteria2faketcp"})

_CONF_HOST = re.compile(r"^[A-Za-z0-9_.\-\[\]:]+$")


def _is_conf_type(text: str) -> bool:
    """这个词是不是已知的代理协议名（按 normalize_type 归一后判断）。"""
    normalized = normalize_type(text)
    return normalized in SING_BOX_KERNEL_TYPES or normalized in _CONF_EXTRA_TYPES


def _is_conf_port(text: str) -> bool:
    stripped = text.strip().strip('"')
    return stripped.isdigit() and 0 < int(stripped) <= 65535


def _is_conf_host(text: str) -> bool:
    """像不像主机名或 IP：无空格、只含主机名合法字符，且带 . 或 : （IPv6）。"""
    stripped = text.strip().strip('"')
    if not stripped or not _CONF_HOST.match(stripped):
        return False
    return "." in stripped or ":" in stripped


def _is_conf_host_port(text: str) -> bool:
    """像不像 `host:port`。"""
    host, sep, port = text.strip().strip('"').rpartition(":")
    return bool(sep) and _is_conf_host(host) and _is_conf_port(port)


def _conf_line_kind(line: str) -> str:
    """这行 conf 是哪种节点行：'qx' / 'loon' / ''（都不像）。

    段头缺失时（订阅响应的常态）只能靠形状认。两种形状的判别顺序不能反：QX 的
    `vless=1.2.3.4:443, method=none` 若先按 Loon 试，fields[0] 会是 `1.2.3.4:443`
    而不是协议名，认不出来。
    """
    head, sep, rest = line.partition("=")
    if not sep:
        return ""
    fields = [f.strip().strip('"') for f in rest.split(",")]
    # QX：`类型=服务器:端口, key=value, …`
    if _is_conf_type(head) and _is_conf_host_port(fields[0]):
        return "qx"
    # Loon / Surge：`节点名 = 类型, 服务器, 端口, …`
    if (
        len(fields) >= 3
        and _is_conf_type(fields[0])
        and _is_conf_host(fields[1])
        and _is_conf_port(fields[2])
    ):
        return "loon"
    return ""


def _count_conf_node_lines(text: str, limit: int = _BARE_CONF_MIN_LINES) -> int:
    """数长得像节点行的行，够 limit 就提前收工（30KB 的响应不必逐行走完）。

    必须与 `_parse_conf` 用**同一套**「哪些行算数」的标准：只数无段头的行与节点段
    （`[Proxy]` / `[server_local]`）内的行，别的段一概不数。两套标准不一致的后果是
    嗅探说「这是 conf」而解析一个节点都取不出来，报告里既没有节点、也没有 unknown
    才会打的诊断行（响应多少字节、开头长什么样）——用户排查时唯一的线索被吞掉。
    `[General]` 里的 `socks = 127.0.0.1:1080` 就是这样一行：形状上完全合格，
    位置上不是节点。
    """
    count = 0
    section = ""
    for raw in text.splitlines():
        line = raw.strip()
        if not line or line.startswith(("#", ";", "//")):
            continue
        if line.startswith("[") and line.endswith("]"):
            section = line[1:-1].strip().lower()
            continue
        if section and section not in ("proxy", "server_local"):
            continue
        if _conf_line_kind(line):
            count += 1
            if count >= limit:
                break
    return count


def fingerprint(node: Node) -> str:
    """节点指纹。不含 uuid/password 等凭据——跨格式字段名不同，且不影响是不是同一个出口。

    server 必须归一：各解析器给出的形态不一致（urlparse 会小写化并剥掉 IPv6 方括号，
    YAML/conf 解析则原样保留），不归一的话同一个节点在两种格式的响应里会算成两个，
    凭空造出 added/removed 的幻影条目，分组也会把同一份列表拆成两组。
    """
    server = node.server.strip("[]").lower()
    return f"{node.type}://{server}:{node.port}"


def is_pseudo_node(name: str) -> bool:
    """是不是机场塞的套餐信息伪节点。词组命中或结构信号命中都算。"""
    lowered = name.lower()
    if any(phrase.lower() in lowered for phrase in _PSEUDO_PHRASES):
        return True
    return any(pattern.search(name) for pattern in _PSEUDO_PATTERNS)


def tier_of(node_type: str, fmt: str) -> str:
    """节点可用性分级：usable / pending / unusable。分级与订阅格式相关。

    - usable：这个格式的 loader + 转换函数确实能把它变成 sing-box 出站。
    - pending：sing-box 内核支持，但**在这个格式下**管线没有分支——包括「转换函数
      缺 case」（如 clash 格式的 vless）、「整个格式都没有 loader」（如 conf）、
      「loader 读得进但读出来是垃圾」（明文 links 会被 shadowrocket loader
      无条件 b64decode）三种。三者的行动建议是同一句：去 clash-to-sing.py 补，
      补了就能捞回来。
    - unusable：内核都不支持，补也没用。

    同一个类型在格式 A 下 pending、在格式 B 下 usable 是正常的——判据是「这个节点
    最终能不能进 config.json」，而这取决于它是从哪种响应里读出来的。
    """
    if node_type in USABLE_TYPES_BY_FORMAT.get(fmt, frozenset()):
        return "usable"
    if node_type in SING_BOX_KERNEL_TYPES:
        return "pending"
    return "unusable"


# ---------------------------------------------------------------- 节点解析

# sing-box 配置里这些出站不是真实节点
SKIP_OUTBOUND_TYPES = frozenset({"direct", "block", "dns", "selector", "urltest"})


class YqUnavailable(RuntimeError):
    """yq 不可用或执行失败。clash YAML 只能靠它解析。"""


def run_yq(body: bytes) -> str:
    """把 YAML 转成 JSON 文本。用外部 yq v4，避免为一个格式引入 PyYAML 依赖。"""
    if shutil.which("yq") is None:
        raise YqUnavailable("yq 不在 PATH 中，无法解析 clash YAML")
    try:
        proc = subprocess.run(
            ["yq", "-p", "yaml", "-o", "json", "."],
            input=body,
            capture_output=True,
            timeout=30,
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        raise YqUnavailable(f"调用 yq 失败：{exc}") from exc
    if proc.returncode != 0:
        stderr = proc.stderr.decode("utf-8", errors="replace").strip()
        raise YqUnavailable(f"yq 退出码 {proc.returncode}：{stderr}")
    return proc.stdout.decode("utf-8", errors="replace")


def _parse_sing_box(body: bytes) -> list[Node]:
    try:
        config = json.loads(body.decode("utf-8", errors="replace"))
    except json.JSONDecodeError:
        return []
    if not isinstance(config, dict):
        return []
    nodes = []
    outbounds = config.get("outbounds")
    if not isinstance(outbounds, list):
        outbounds = []
    for outbound in outbounds:
        if not isinstance(outbound, dict):
            continue
        if outbound.get("type") in SKIP_OUTBOUND_TYPES:
            continue
        server = outbound.get("server")
        port = outbound.get("server_port")
        if not server or not port:
            continue
        try:
            port = int(port)
        except (TypeError, ValueError):
            continue
        nodes.append(
            Node(
                str(outbound.get("tag") or ""),
                normalize_type(str(outbound.get("type") or "")),
                str(server),
                port,
            )
        )
    return nodes


def _parse_clash(body: bytes, yq_runner) -> list[Node]:
    try:
        config = json.loads(yq_runner(body))
    except json.JSONDecodeError:
        return []
    if not isinstance(config, dict):
        return []
    nodes = []
    proxies = config.get("proxies")
    if not isinstance(proxies, list):
        proxies = []
    for proxy in proxies:
        if not isinstance(proxy, dict):
            continue
        server = proxy.get("server")
        port = proxy.get("port")
        if not server or not port:
            continue
        try:
            port = int(port)
        except (TypeError, ValueError):
            continue
        nodes.append(
            Node(
                str(proxy.get("name") or ""),
                normalize_type(str(proxy.get("type") or "")),
                str(server),
                port,
            )
        )
    return nodes


def _parse_url_link(line: str, index: int) -> Node | None:
    url, _, fragment = line.partition("#")
    parsed = urlparse(url)
    try:
        port = parsed.port
    except ValueError:
        return None
    if not parsed.hostname or not port:
        return None
    name = unquote(fragment) if fragment else f"Line#{index}"
    return Node(name, normalize_type(parsed.scheme), parsed.hostname, port)


def _parse_vmess_link(line: str, index: int) -> Node | None:
    """vmess:// 的载荷通常是 base64 编码的 JSON，少数是普通 URL 形式。"""
    payload = line.split("://", 1)[1].split("#", 1)[0]
    decoded = decode_base64(payload)
    if decoded:
        try:
            config = json.loads(decoded.decode("utf-8", errors="replace"))
        except json.JSONDecodeError:
            config = None
        if isinstance(config, dict):
            server = config.get("add")
            port = config.get("port")
            if server and port:
                try:
                    port = int(port)
                except (TypeError, ValueError):
                    return None
                name = str(config.get("ps") or f"Line#{index}")
                return Node(name, "vmess", str(server), port)
    return _parse_url_link(line, index)


def _parse_links(text: str) -> list[Node]:
    nodes = []
    for index, raw in enumerate(text.splitlines()):
        line = raw.strip()
        if not line or line.startswith("#") or line.startswith("STATUS="):
            continue
        if "://" not in line:
            continue
        if line.split("://", 1)[0].lower() == "vmess":
            node = _parse_vmess_link(line, index)
        else:
            node = _parse_url_link(line, index)
        if node is not None:
            nodes.append(node)
    return nodes


def _parse_loon_proxy_line(line: str) -> Node | None:
    """Loon / Surge 的 [Proxy] 段：节点名 = TYPE, server, port, ..."""
    name, sep, rest = line.partition("=")
    if not sep:
        return None
    fields = [f.strip().strip('"') for f in rest.split(",")]
    if len(fields) < 3:
        return None
    try:
        port = int(fields[2])
    except (TypeError, ValueError):
        return None
    return Node(name.strip(), normalize_type(fields[0]), fields[1], port)


def _parse_qx_server_line(line: str) -> Node | None:
    """Quantumult X 的 [server_local] 段：TYPE=server:port, key=value, ..., tag=节点名"""
    head, sep, rest = line.partition("=")
    if not sep:
        return None
    fields = [f.strip() for f in rest.split(",")]
    if not fields:
        return None
    server, _, port_text = fields[0].rpartition(":")
    if not server:
        return None
    try:
        port = int(port_text)
    except (TypeError, ValueError):
        return None
    name = server
    for field in fields[1:]:
        key, _, value = field.partition("=")
        if key.strip().lower() == "tag":
            name = value.strip()
            break
    return Node(name, normalize_type(head), server, port)


def _parse_conf(text: str) -> list[Node]:
    """Loon / Surge / Quantumult X 的 conf 格式。只看节点段，其余段跳过。

    订阅响应通常只有裸节点行、没有段头，所以还没见过任何段头时按行形状自行判别
    （`_conf_line_kind`）。段头一旦出现就以段头为准——`[General]` 里的
    `ip-mode = dual` 不该因为长得有点像而被当成节点。
    """
    nodes = []
    section = ""
    for raw in text.splitlines():
        line = raw.strip()
        if not line or line.startswith(("#", ";", "//")):
            continue
        if line.startswith("[") and line.endswith("]"):
            section = line[1:-1].strip().lower()
            continue
        if section == "proxy":
            node = _parse_loon_proxy_line(line)
        elif section == "server_local":
            node = _parse_qx_server_line(line)
        elif not section:
            kind = _conf_line_kind(line)
            if kind == "qx":
                node = _parse_qx_server_line(line)
            elif kind == "loon":
                node = _parse_loon_proxy_line(line)
            else:
                continue
        else:
            continue
        if node is not None:
            nodes.append(node)
    return nodes


def parse_nodes(body: bytes, fmt: str, yq_runner=None) -> list[Node]:
    """按格式提取节点。yq_runner 可注入替身，默认走真 yq。"""
    if fmt == "sing-box":
        return _parse_sing_box(body)
    if fmt == "clash":
        return _parse_clash(body, yq_runner or run_yq)
    if fmt == "links":
        return _parse_links(body.decode("utf-8", errors="replace"))
    if fmt == "base64":
        return _parse_links(decode_base64(body.decode("utf-8", errors="replace")).decode("utf-8", errors="replace"))
    if fmt == "conf":
        return _parse_conf(body.decode("utf-8", errors="replace"))
    if fmt == "base64-conf":
        # base64 包着的 conf（Quantumult X 对某些订阅就这么给）：先脱壳再按 conf 解
        return _parse_conf(decode_base64(body.decode("utf-8", errors="replace")).decode("utf-8", errors="replace"))
    return []


# ---------------------------------------------------------------- 限速


class RateLimiter:
    """单订阅内的最小请求间隔。

    限速要求是「对单一连接每分钟不超过 8 次」，默认间隔 8 秒即 7.5 次/分钟。
    时钟与 sleep 可注入，便于测试。
    """

    def __init__(self, interval: float, clock=time.monotonic, sleeper=time.sleep):
        # 限速是这个项目唯一的硬约束，非正的间隔等于没有限速，在这里就拦死，
        # 不能只在 CLI 里喊一声然后照跑。
        if interval <= 0:
            raise ValueError(f"限速间隔必须为正数，收到 {interval}")
        self._interval = interval
        self._clock = clock
        self._sleeper = sleeper
        self._last: float | None = None

    def wait(self) -> None:
        """必要时阻塞到距上次调用满 interval 秒。"""
        if self._last is not None:
            remaining = self._interval - (self._clock() - self._last)
            if remaining > 0:
                self._sleeper(remaining)
        self._last = self._clock()


# ---------------------------------------------------------------- 网络


@dataclass
class Response:
    """一次 HTTP 响应。status 为 0 表示请求根本没发出去。"""

    status: int
    body: bytes
    error: str = ""


def fetch(url: str, ua: str, timeout: float, opener=None) -> Response:
    """拉一次订阅。代理沿用环境变量（http_proxy / https_proxy）。"""
    request = urllib.request.Request(url, headers={"User-Agent": ua})
    opener = opener or urllib.request.urlopen
    try:
        with opener(request, timeout=timeout) as response:
            return Response(response.status, response.read())
    except urllib.error.HTTPError as exc:
        body = b""
        try:
            body = exc.read()
        except Exception:  # noqa: BLE001 —— 读不出响应体不影响记录状态码
            pass
        return Response(exc.code, body, f"HTTP {exc.code}")
    except Exception as exc:  # noqa: BLE001 —— 网络错误五花八门，一律记下来继续
        return Response(0, b"", str(exc))


def _direct_opener(request, timeout):
    """--no-proxy 用的 opener：装一个空 ProxyHandler，盖掉环境变量里的代理设置直连。

    签名与 urllib.request.urlopen 兼容，可以原样传给 fetch() 的 opener 参数。
    """
    opener = urllib.request.build_opener(urllib.request.ProxyHandler({}))
    return opener.open(request, timeout=timeout)


def build_fetcher(no_proxy: bool):
    """按 --no-proxy 决定要不要绕开环境变量代理。默认直接复用 fetch（走 urlopen，沿用环境变量）。"""
    if not no_proxy:
        return fetch

    def fetcher(url: str, ua: str, timeout: float) -> Response:
        return fetch(url, ua, timeout, opener=_direct_opener)

    return fetcher


def build_ua_plan(
    subscription: Subscription, clients: list[str] | None
) -> list[tuple[str, str, str, bool]]:
    """列出这个订阅要发的 (客户端, 版本, UA, 是否基准)，基准排最前。

    基准 UA 若与表中某项完全相同，则合并成一项，避免白发一次请求。
    """
    base = baseline_ua(subscription.client)
    plan: list[tuple[str, str, str, bool]] = [("(基准)", "—", base, True)]
    for client, entries in UA_TABLE.items():
        if clients and client not in clients:
            continue
        for version, ua in entries:
            if ua == base:
                plan[0] = (client, version, ua, True)
                continue
            plan.append((client, version, ua, False))
    return plan


PREVIEW_LIMIT = 80


def preview_bytes(body: bytes, limit: int = PREVIEW_LIMIT) -> str:
    """把响应开头转成可安全打印的一行。

    这段内容来自机场的响应，可能是 HTML、可能是二进制，直接喷到终端会打乱排版
    甚至触发转义序列。逐字符转义不可打印字符，并压成单行。
    """
    text = body[:limit].decode("utf-8", errors="backslashreplace")
    escaped = "".join(
        ch if ch.isprintable() else ch.encode("unicode_escape").decode("ascii") for ch in text
    )
    return escaped + ("…" if len(body) > limit else "")


def _notify(on_progress, phase: str, done: int, total: int, detail: str) -> None:
    """调一次进度回调。**必须异常安全**：显示是附属功能，渲染器出任何问题
    （流关了、终端尺寸取不到、回调本身有 bug）都不能影响探测，更不能把 worker 线程
    弄死——那会让整个订阅静默消失。"""
    if on_progress is None:
        return
    try:
        on_progress(phase, done, total, detail)
    except Exception:  # noqa: BLE001
        pass


def _warn(on_warn, text: str) -> None:
    """发一条 worker 侧告警。

    TTY 下不能直接 print 到 stderr：进度块正占着屏幕底部，裸 print 会被下一帧盖掉
    （详见 `ProgressRenderer.log`）。所以走注入的 `on_warn`；它出问题就退回直接
    print——**告警本身不能丢**，那是 spec 里「写盘失败只记一行告警、不中断」的全部实现。
    """
    if on_warn is not None:
        try:
            on_warn(text)
            return
        except Exception:  # noqa: BLE001
            pass
    print(text, file=sys.stderr)


def probe_subscription(
    subscription: Subscription,
    *,
    interval: float,
    timeout: float,
    clients: list[str] | None = None,
    fetcher=None,
    dump_dir: Path | None = None,
    yq_runner=None,
    clock=time.monotonic,
    sleeper=time.sleep,
    cancel_event: threading.Event | None = None,
    on_progress=None,
    on_warn=None,
) -> list[Probe]:
    """按限速串行探测一个订阅的所有 UA。单次失败不影响其余。

    cancel_event 被 set 后立刻停止，已完成的探测照常返回——Ctrl-C 时主线程靠它
    让 worker 提前收工，而不是干等最长 12×interval 秒。

    on_progress(phase, done, total, detail) 在每个阶段边界被调用，供实时进度显示用。
    它由外部注入，出任何问题都不该拖垮探测，所以调用点一律吞异常（`_notify`）。

    on_warn(text) 收 worker 侧的告警。默认（None）就是直接 print 到 stderr；进度块
    活着时必须传进来，否则告警会被下一帧盖掉（见 `_warn` 与 `ProgressRenderer.log`）。
    """
    fetcher = fetcher or fetch
    if cancel_event is not None and sleeper is time.sleep:
        # 真实 sleep 换成事件等待：中断时立刻醒，不用睡满一整个间隔
        sleeper = cancel_event.wait
    limiter = RateLimiter(interval, clock=clock, sleeper=sleeper)
    probes = []
    plan = build_ua_plan(subscription, clients)
    total = len(plan)
    for done, (client, version, ua, is_baseline) in enumerate(plan):
        if cancel_event is not None and cancel_event.is_set():
            break
        label = f"{client} {version}"
        # 限速的空档是全程最长的一段静默，进度必须在**进入等待之前**就报出来
        _notify(on_progress, PHASE_WAIT, done, total, f"下一个 {label}")
        limiter.wait()
        # 限速可能睡了很久，睡醒后再确认一次，别在已经中断之后还发请求
        if cancel_event is not None and cancel_event.is_set():
            break
        _notify(on_progress, PHASE_FETCH, done, total, label)
        response = fetcher(subscription.url, ua, timeout)

        if dump_dir is not None and response.body:
            # 落盘是附带产物，写不进去（目录只读、盘满、文件名过长）只该少一份存档，
            # 不该中断这个订阅剩下的探测。
            safe = f"{subscription.name}.{client}.{version}.raw".replace("/", "_")
            try:
                (dump_dir / safe).write_bytes(response.body)
            except OSError as exc:
                _warn(on_warn, f"⚠️ 保存原始响应失败（{safe}）：{exc}")

        error = response.error
        fmt = "unknown"
        nodes: list[Node] = []
        if not error:
            _notify(on_progress, PHASE_PARSE, done, total, label)
            fmt = detect_format(response.body)
            try:
                nodes = parse_nodes(response.body, fmt, yq_runner=yq_runner)
            except YqUnavailable as exc:
                error = str(exc)
            except Exception as exc:  # noqa: BLE001 —— 机场返回什么都有可能，别让解析炸掉整轮
                error = f"解析失败：{exc}"

        probes.append(
            Probe(
                client, version, ua, is_baseline, response.status, fmt, nodes, error,
                body_len=len(response.body),
                # 只有认不出格式时才留存开头——其余情况响应内容全是节点凭据，不该带进报告
                preview=preview_bytes(response.body) if fmt == "unknown" else "",
            )
        )
        if error:
            # 异常字符串偶尔会把请求 URL 带上，而订阅 URL 含 token，先擦一遍
            summary = f"{label} 失败：{scrub_urls(error)}"
        else:
            summary = f"{label} {response.status} {fmt} {len(nodes)} 节点"
        _notify(on_progress, PHASE_DONE, done + 1, total, summary)
    return probes


# ---------------------------------------------------------------- 汇总


def classify(nodes: list[Node], fmt: str) -> tuple[set[str], set[str], set[str], list[Node], set[str]]:
    """把节点分成可用、待支持、不可用三档指纹集合，外加伪节点列表与名称集合。

    分级依赖 fmt——同一个协议在不同订阅格式下走的是 clash-to-sing.py 的不同分支。

    计数按指纹集合，不按行数——机场的伪节点常复用真实节点的 server:port。
    """
    usable: set[str] = set()
    pending: set[str] = set()
    unusable: set[str] = set()
    pseudo: list[Node] = []
    names: set[str] = set()
    for node in nodes:
        if is_pseudo_node(node.name):
            pseudo.append(node)
            continue
        names.add(node.name)
        fp = fingerprint(node)
        tier = tier_of(node.type, fmt)
        if tier == "usable":
            usable.add(fp)
        elif tier == "pending":
            pending.add(fp)
        else:
            unusable.add(fp)
    return usable, pending, unusable, pseudo, names


def summarize(subscription: Subscription, probes: list[Probe]) -> Report:
    """算增量、分组、挑推荐。"""
    rows = [Row(probe, *classify(probe.nodes, probe.fmt)) for probe in probes]

    # 基准探测失败时 baseline.usable 不代表真实基准（可能是空集合），
    # 增量会虚假地把「未知」算成「全部新增」，所以必须一并守卫 baseline.probe.ok。
    baseline = next((r for r in rows if r.probe.is_baseline), None)
    if baseline is not None and baseline.probe.ok:
        for row in rows:
            if row is baseline:
                continue
            row.added = row.usable - baseline.usable
            row.removed = baseline.usable - row.usable

    # 次键 r.probe.ok 让失败探测（False < True）排到同可用数的成功探测之后，
    # reverse=True 对元组整体降序，两个字段同时生效。
    rows.sort(key=lambda r: (len(r.usable), r.probe.ok), reverse=True)

    # 推荐：可用节点最多的成功探测。与基准并列时不推荐——换 UA 没收益。
    recommended = None
    candidates = [r for r in rows if r.probe.ok and not r.probe.is_baseline]
    if candidates and baseline is not None and baseline.probe.ok:
        best = max(candidates, key=lambda r: len(r.usable))
        if len(best.usable) > len(baseline.usable):
            recommended = best

    grouped: dict[frozenset[str], list[Row]] = {}
    for row in rows:
        if not row.probe.ok:
            continue
        grouped.setdefault(row.all_fingerprints, []).append(row)
    # 组内可用数可能不一致（同一批节点、不同响应格式），排序取组内最大值——
    # 取第一行的数字会让排序随组内顺序抖动。
    groups = sorted(grouped.values(), key=lambda g: max(len(r.usable) for r in g), reverse=True)

    return Report(subscription, baseline, rows, recommended, groups)


# ---------------------------------------------------------------- 渲染


def display_width(text: str) -> int:
    """终端显示宽度。中文与全角占两格，国旗 emoji 由两个区域指示符各占一格凑成两格。"""
    width = 0
    for char in text:
        if char == "\ufe0f":  # 变体选择符 VS16：把前一个字符提升为全宽
            width += 1
            continue
        if unicodedata.combining(char):
            continue
        width += 2 if unicodedata.east_asian_width(char) in ("W", "F") else 1
    return width


def pad(text: str, width: int) -> str:
    """按显示宽度右侧补空格。超宽不截断。"""
    return text + " " * max(0, width - display_width(text))


def _delta_text(row: Row, baseline: Row | None) -> str:
    # 基准探测失败时 baseline.usable 是空集合、不代表真实基准，若不守卫
    # baseline.probe.ok 会把「未知」误算成「全部新增」——与 summarize() 里
    # added/removed 的守卫保持一致，这里也必须守卫。
    if baseline is None or row.probe.is_baseline or not baseline.probe.ok:
        return "—"
    delta = len(row.usable) - len(baseline.usable)
    return f"{delta:+d}" if delta else "0"


# clash-to-sing.py 的 load_proxies（:1092）只认这三种 format，其余格式下游读不了：
# conf 没有任何 loader；明文 links 会被 shadowrocket loader 无条件 b64decode 当场抛
# binascii.Error（所以 links 也不在 USABLE_TYPES_BY_FORMAT 里，压根不会被推荐）。
# 键是本脚本嗅探出的格式，值是 sing-rules/config/config.json 里该写的 format 字段。
DOWNSTREAM_LOADERS = {
    "clash": "clash",
    "base64": "shadowrocket",
    "sing-box": "sing-box",
}


def _type_histogram(fingerprints: set[str]) -> str:
    counts: dict[str, int] = {}
    for fp in fingerprints:
        proto = fp.split("://", 1)[0]
        counts[proto] = counts.get(proto, 0) + 1
    return " ".join(f"{t}×{n}" for t, n in sorted(counts.items(), key=lambda kv: -kv[1]))


def render_report(report: Report, wide: bool = False) -> str:
    """渲染一个订阅的终端报告。"""
    lines = []
    # 优先用实际探测到的 ua——它才是这份报告真正对照的那个基准（与
    # report_to_dict 的 baseline_ua 字段同构）；只有在基准探测完全缺失时
    # （report.baseline is None，理论上不会发生，因为 build_ua_plan 总会排入
    # 基准项）才退回按 client 重算。
    base_ua = report.baseline.probe.ua if report.baseline else baseline_ua(report.subscription.client)
    lines.append(f"▌ {report.subscription.name}   基准 UA: {base_ua}")

    headers = ["CLIENT", "VERSION", "STATUS", "FORMAT", "可用", "Δ", "待支持", "不可用", "伪"]
    table = [headers]
    for row in report.rows:
        status = str(row.probe.status) if row.probe.status else "ERR"
        if row.probe.fmt == "unknown":
            # 响应根本没被识别（HTML 广告页、被挡的提示页……）。此时「0 个节点」是
            # 解析器的沉默而不是事实，一律记 -，真正的诊断走下面的 ✘ 行。
            counts = ["-", "—", "-", "-", "-"]
        else:
            counts = [
                str(len(row.usable)),
                _delta_text(row, report.baseline),
                str(len(row.pending)),
                str(len(row.unusable)),
                str(len(row.pseudo)),
            ]
        table.append([row.probe.client, row.probe.version, status, row.probe.fmt] + counts)

    widths = [max(display_width(r[i]) for r in table) for i in range(len(headers))]
    for index, cells in enumerate(table):
        line = "  " + "  ".join(pad(c, w) for c, w in zip(cells, widths))
        if index > 0 and report.rows[index - 1].probe.is_baseline:
            line += "  ←当前"
        lines.append(line.rstrip())

    for row in report.rows:
        if row.probe.error:
            lines.append(f"  ✘ {row.probe.client} {row.probe.version}：{row.probe.error}")
        elif row.probe.fmt == "unknown":
            # HTTP 200 + 一段看不懂的正文时 error 是空的，不报这一行用户就只能看到
            # 一排「-」，无从判断是被挡了还是拿到了广告页。
            lines.append(
                f"  ✘ {row.probe.client} {row.probe.version}：无法识别的响应格式，"
                f"共 {row.probe.body_len} 字节，前 {PREVIEW_LIMIT} 字节：{row.probe.preview}"
            )

    lines.append("")
    if report.recommended is not None:
        rec = report.recommended
        lines.append(f"  ✔ 推荐 {rec.probe.client}（+{len(rec.added)} 可用节点）")
        if rec.added:
            lines.append(f"      多出的 {len(rec.added)} 个：{_type_histogram(rec.added)}")
        if rec.removed:
            lines.append(f"      但少了 {len(rec.removed)} 个：{_type_histogram(rec.removed)}")
        if rec.pending:
            lines.append(
                f"      另有 {len(rec.pending)} 个属「待支持」（{_type_histogram(rec.pending)}）"
                "——sing-box 支持，clash-to-sing.py 缺分支"
            )
        lines.append(
            f"      建议行：{report.subscription.name} {report.subscription.url} {rec.probe.client}"
        )
        lines.append(
            f"      注意：subscribe.sh 会把它渲染成 {rec.probe.client}/*，"
            f"不是实测用的 {rec.probe.ua}"
        )
        # 换 UA 换来的响应格式，下游未必读得了。不提这一层的话，用户照着建议行改完
        # update.sh 就会炸——比不给推荐还糟。
        if rec.probe.fmt not in DOWNSTREAM_LOADERS:
            lines.append(
                f"      ⚠ 下游 clash-to-sing.py 无法解析此格式（{rec.probe.fmt}，"
                f"load_proxies 只认 clash/shadowrocket/sing-box），本推荐不可直接采用"
            )
        elif report.baseline is not None and rec.probe.fmt != report.baseline.probe.fmt:
            lines.append(
                f"      ⚠ 响应格式从 {report.baseline.probe.fmt} 变成了 {rec.probe.fmt}，"
                f"还需把 sing-rules/config/config.json 里该订阅的 format 改成 "
                f"{DOWNSTREAM_LOADERS[rec.probe.fmt]}，否则 update.sh 一样会失败"
            )
    elif report.baseline is not None and report.baseline.probe.ok:
        lines.append("  ✔ 当前 UA 已最优，没有别的 UA 能多拉到可用节点")
    else:
        lines.append("  ✘ 基准 UA 探测失败，无法给出推荐")

    # 伪节点是逐 UA 统计的，不同 UA 拿到的可能不一样。只列一例，但必须写清是谁的，
    # 否则会被当成全局结论。
    pseudo_rows = [r for r in report.rows if r.pseudo]
    if pseudo_rows:
        sample = pseudo_rows[0]
        names = " / ".join(n.name for n in sample.pseudo)
        if not wide and len(names) > 120:
            names = names[:120] + "…"
        line = (
            f"  ℹ {sample.probe.client} {sample.probe.version} 识别到 "
            f"{len(sample.pseudo)} 个伪节点（已从计数剔除）：{names}"
        )
        if len(pseudo_rows) > 1:
            line += f"（另有 {len(pseudo_rows) - 1} 个 UA 也识别到伪节点）"
        lines.append(line)

    if len(report.groups) > 1:
        lines.append(f"  ℹ {len(report.groups)} 组不同的节点列表：")
        for index, group in enumerate(report.groups):
            # 分组按指纹集合（与格式无关：它回答「谁拿到了同一份列表」），但可用数是
            # 格式相关的——同一批节点在 sing-box 格式下 21 个可用、在 clash 格式下只有
            # 2 个。取组内第一行的数字当标签会把这个差异藏起来，所以不一致时报范围，
            # 并给每个成员标上自己的格式。
            counts = {len(r.usable) for r in group}
            formats = {r.probe.fmt for r in group}
            if len(counts) > 1:
                label = f"可用 {min(counts)}–{max(counts)}，随格式而异"
            else:
                label = f"{len(group[0].usable)} 可用"
            if len(formats) > 1:
                members = ", ".join(f"{r.probe.client} {r.probe.version} [{r.probe.fmt}]" for r in group)
            else:
                members = ", ".join(f"{r.probe.client} {r.probe.version}" for r in group)
            line = f"      组 {chr(ord('A') + index)}（{label}）  {members}"
            # 指纹集合相同、名称集合不同 = 机场只改了节点名。这是机场四种行为之一，
            # 不标出来就会被当成「完全同一份列表」。
            if any(r.names != group[0].names for r in group[1:]):
                line += "  ← 仅命名差异"
            lines.append(line)

    return "\n".join(lines)


def mask_url(url: str) -> str:
    """把订阅 URL 里可能藏 token 的部分打码，只留 scheme 与主机名。

    终端里的建议行要能直接复制粘贴进 clash.txt，所以那里保留全量 URL；
    但 --json 的输出常被重定向成文件再顺手分享出去，默认不该带 token。

    netloc 里的 userinfo（`user:token@host`）也是凭据的常见藏身处，一并去掉——
    只留 host[:port]。拿不到 hostname 就整体打码，不冒险漏出半截。
    """
    parsed = urlparse(url)
    if not parsed.scheme or not parsed.netloc:
        return "***"
    try:
        host = parsed.hostname
    except ValueError:  # 畸形 IPv6 字面量等
        return "***"
    if not host:
        return "***"
    try:
        port = parsed.port
    except ValueError:  # 端口不是数字
        port = None
    if ":" in host:  # IPv6 字面量，urlparse 会剥掉方括号，得补回去
        host = f"[{host}]"
    masked = f"{parsed.scheme}://{host}" + (f":{port}" if port else "")
    if parsed.path and parsed.path != "/":
        masked += "/***"
    if parsed.query:
        masked += "?***"
    return masked


def report_to_dict(report: Report, show_url: bool = False) -> dict:
    """结构化输出，供 --json 使用。show_url 为假时订阅 URL 打码。"""

    def row_dict(row: Row) -> dict:
        return {
            "client": row.probe.client,
            "version": row.probe.version,
            "ua": row.probe.ua,
            "is_baseline": row.probe.is_baseline,
            "status": row.probe.status,
            "format": row.probe.fmt,
            "error": row.probe.error,
            "body_len": row.probe.body_len,
            "preview": row.probe.preview,
            "usable": sorted(row.usable),
            "pending": sorted(row.pending),
            "unusable": sorted(row.unusable),
            "names": sorted(row.names),
            "pseudo": [n.name for n in row.pseudo],
            "added": sorted(row.added),
            "removed": sorted(row.removed),
        }

    return {
        "subscription": {
            "name": report.subscription.name,
            "url": report.subscription.url if show_url else mask_url(report.subscription.url),
            "url_masked": not show_url,
            "client": report.subscription.client,
        },
        "baseline_ua": report.baseline.probe.ua if report.baseline else None,
        "rows": [row_dict(r) for r in report.rows],
        "recommended": row_dict(report.recommended) if report.recommended else None,
        "groups": [[r.probe.ua for r in g] for g in report.groups],
    }


def exit_code(reports: list[Report]) -> int:
    """0 当前 UA 已最优 / 1 存在更优 UA / 2 结论不可信。取最大值。

    只有**基准探测失败**或**该订阅全部探测失败**才算 2——这两种情况下报告没有可信的
    参照物，0/1 都是瞎说。个别陌生 UA 拿到 HTML（fmt=unknown）是 12 个 UA 里的常态，
    不是异常：若它也算 2，退出码就退化成常量，0/1 永远不可达。这类失败在报告里已经
    有 ✘ 行逐条告知。
    """
    code = 0
    for report in reports:
        baseline_failed = report.baseline is None or not report.baseline.probe.ok
        all_failed = not any(r.probe.ok for r in report.rows)
        if baseline_failed or all_failed:
            return 2
        if report.recommended is not None:
            code = max(code, 1)
    return code


# ---------------------------------------------------------------- 进度显示

# 卡感的来源是限速的 8 秒空档，不是请求本身。所以进度不能只在「每完成一次请求」时
# 打一行——那 8 秒里屏幕仍然是死的。必须报出**当前阶段已经持续了多久**，那是证明
# 「它还活着」的唯一信号；剩余时间反而不重要。
PHASE_QUEUED = "排队中"
PHASE_WAIT = "等待限速"
PHASE_FETCH = "请求中"
PHASE_PARSE = "解析中"
PHASE_DONE = "完成"
PROGRESS_PHASES = (PHASE_QUEUED, PHASE_WAIT, PHASE_FETCH, PHASE_PARSE, PHASE_DONE)

# 阶段列按最宽的阶段名对齐，阶段之间切换时列不会左右跳
PHASE_WIDTH = max(display_width(p) for p in PROGRESS_PHASES)
ELAPSED_WIDTH = 5  # 够放 "99.9s"
PROGRESS_TICK = 0.5  # 重画周期，秒

# stop() 里每次「等**别人**」的上限：等重画线程退出（join）、等在途的那次 write 交还
# _io_lock。抢不到就放弃收尾——收不干净的残影只是化妆品，而 Ctrl-C 的响应速度是硬要求。
#
# 注意它**封不住 stop() 自己那次清屏 write**：Python 没法给阻塞式 write 设超时。
# 详见 ProgressRenderer.stop() 的说明。
_STOP_WAIT = 0.5

_URL_IN_TEXT = re.compile(r"[a-z][a-z0-9+.\-]*://\S+", re.IGNORECASE)


def scrub_urls(text: str) -> str:
    """把文本里的 URL 换成 ***。

    进度行的失败摘要来自 urllib 的异常字符串，个别异常会把请求 URL 原样带上，
    而订阅 URL 里有 token。进度是直接喷到终端、也可能被重定向进日志的，
    不该成为 token 的泄漏点。
    """
    return _URL_IN_TEXT.sub("***", text)


def truncate_display(text: str, width: int) -> str:
    """按显示宽度截断，真截掉了才补 …（… 自己占一格）。"""
    if width <= 0:
        return ""
    if display_width(text) <= width:
        return text
    kept: list[str] = []
    used = 0
    for char in text:
        char_width = display_width(char)
        if used + char_width > width - 1:
            break
        kept.append(char)
        used += char_width
    return "".join(kept) + "…"


def format_progress_line(
    name: str,
    phase: str,
    done: int,
    total: int,
    detail: str,
    elapsed: float,
    *,
    name_width: int,
    max_width: int = 0,
) -> str:
    """拼一行进度。纯函数，不碰任何状态，好单独测对齐与截断。

    `max_width <= 0` 表示不限宽（非 TTY，或取不到终端尺寸）。限宽时**优先只截 detail**，
    因为前面几列是对齐骨架，截了就错位；只有终端窄到连骨架都放不下时才连骨架一起截——
    那时对齐已经无从谈起，而**绝不能让行折行**是硬约束：原地重画靠「上移 N 行」定位，
    多折一行整块显示就全乱了。
    """
    digits = len(str(total)) if total > 0 else 1
    counter = f"[{done:>{digits}}/{total}]"
    head = (
        "  "
        + pad(name, name_width)
        + "  " + counter
        + "  " + pad(phase, PHASE_WIDTH)
        + " " + pad(f"{elapsed:.1f}s", ELAPSED_WIDTH)
        + "  "
    )
    if max_width <= 0:
        return head + detail
    room = max_width - display_width(head)
    if room <= 0:
        # 终端窄到连骨架都放不下：宁可把骨架截了，也不能折行
        return truncate_display(head + detail, max_width)
    return head + truncate_display(detail, room)


class ProgressRenderer:
    """实时进度显示。工作线程只调 `update()` 发布状态，重画由本类独立的线程负责。

    这样分工是为了不碰 `RateLimiter`——它是整个项目唯一的安全闸（单订阅每分钟不超过
    8 次请求），不该为了显示去动它的计时或 `cancel_event` 逻辑。

    两种模式：
    - TTY：每个订阅占一行，后台线程每 `tick` 秒原地重画（ANSI 上移 + 清行）。
    - 非 TTY（重定向、管道、CI）：**不起线程、不输出任何 ANSI**，只在每次探测完成时
      打一行纯文本。

    两把锁，职责分开，为的是**别把显示的背压传导回探测**：

    - `_lock` 只护状态（`_state` / `_names` / `_stopped`），持有期间**绝不做 IO**。
      热路径 `update()` 每个订阅要走 4×13 次，它只该等一次字典赋值，不该等终端。
      （早先版本把 write 放在 `_lock` 里：终端一卡——SSH 卡顿、Ctrl-S 的 XOFF、
      终端模拟器 hang——`update()` 和 `stop()` 就一起被拖住，实测各卡 5 秒。）
    - `_io_lock` 护「往流里写」这件事本身，顺带护 `_drawn`。`_drawn` 记的是「屏幕上
      现在有几行进度」，它必须和**实际写出去的字节**严格同步，所以只在这把锁里读写。
    """

    def __init__(
        self,
        items,
        *,
        stream=None,
        tick: float = PROGRESS_TICK,
        clock=time.monotonic,
        isatty: bool | None = None,
        width: int | None = None,
    ):
        # stream 默认在**构造时**取 sys.stderr，这样测试里的 redirect_stderr 能接住
        self._stream = stream if stream is not None else sys.stderr
        self._tick = tick
        self._clock = clock
        self._width = width  # 固定宽度，只给测试用；None 表示每次重画都问终端
        if isatty is None:
            try:
                isatty = bool(self._stream.isatty())
            except Exception:  # noqa: BLE001 —— 流不支持 isatty 就当非 TTY
                isatty = False
        self._isatty = isatty

        self._lock = threading.RLock()
        self._io_lock = threading.RLock()
        self._names: list[str] = []
        self._state: dict[str, list] = {}
        # keys 与传入的 items 同序，调用方拿它当 update() 的第一个参数。
        # clash.txt 允许重名，而重名的两个 worker 若写进同一行，计数会互相覆盖、
        # 看上去像在反复横跳，所以这里把重名的行加后缀区分开。
        self.keys: list[str] = []
        now = self._clock()
        for name, total in items:
            key = name
            serial = 2
            while key in self._state:
                key = f"{name}#{serial}"
                serial += 1
            self.keys.append(key)
            self._names.append(key)
            self._state[key] = [PHASE_QUEUED, 0, total, "", now]
        self._name_width = max((display_width(n) for n in self._names), default=0)

        self._stop_event = threading.Event()
        self._thread: threading.Thread | None = None
        self._drawn = 0
        self._stopped = False

    # ---- 对外 ----

    def start(self) -> None:
        """铺出第一帧并起重画线程。非 TTY 模式不起线程——那时压根没有「原地重画」这回事。

        第一帧在这里**同步**画掉，之后才交给线程：否则「探测 N 个订阅……」那行会孤零零
        地挂上最多一个 tick，正是最需要看见反馈的时刻。顺带让「屏幕上有几行进度」从
        `start()` 返回那一刻起就是确定的，不必看线程的调度运气。

        代价是这次 write 发生在调用者的线程里，终端卡住时 `start()` 就跟着卡（没有超时
        可设，同 `stop()`）。可以接受：紧邻的那行汇总 `print` 写的是同一个终端，本来就
        一样会卡。
        """
        if not self._isatty or self._thread is not None or self._stopped:
            return
        self._redraw()
        self._thread = threading.Thread(target=self._loop, name="ua-diff-progress", daemon=True)
        self._thread.start()

    def update(self, name: str, phase: str, done: int, total: int, detail: str = "") -> None:
        """发布一个订阅的最新状态。工作线程调用，必须线程安全。

        TTY 模式下这里**一个字节都不写**——写全交给重画线程，终端再卡也卡不到探测。
        """
        plain_line = ""
        with self._lock:
            if self._stopped:
                return
            previous = self._state.get(name)
            # 阶段没变就沿用原起始时刻，「已持续多久」才会一直往上走
            since = self._clock() if previous is None or previous[0] != phase else previous[4]
            self._state[name] = [phase, done, total, detail, since]
            if previous is None:
                self._names.append(name)
                self._name_width = max(self._name_width, display_width(name))
            if not self._isatty and phase == PHASE_DONE:
                plain_line = f"  {pad(name, self._name_width)}  [{done}/{total}]  {detail}\n"
        if plain_line:  # 非 TTY 没有重画线程，不存在与谁抢 _io_lock 的问题
            self._write(plain_line)

    def log(self, text: str) -> None:
        """在进度块**之上**插一行日志，并让下一帧重新铺。

        worker 直接 print 到同一个流会把日志弄丢：它把光标推下一行，而 `_drawn` 不知情，
        下一帧的 `\\033[{drawn}A` 就少上移一行，重写时正好把日志和一行进度一起盖掉；
        `stop()` 的清屏也从错位置清起，顶上那行进度留成残影压在报告上面。
        后果不只是难看——spec 里「`--dump` 写盘失败只记一行告警、不中断」这条保证会在
        TTY 下**静默失效**，用户以为都存下来了。

        与重画共用 `_io_lock`：终端卡住时这里会等在途的那次 write。告警只在出错时出现、
        不在热路径上，宁可等，也不能让它乱序或丢失。
        """
        if not text.endswith("\n"):
            text += "\n"
        with self._io_lock:
            prefix = f"\033[{self._drawn}A\033[J" if self._isatty and self._drawn else ""
            self._drawn = 0  # 进度块已被收掉，下一帧从头铺
            self._write_locked(prefix + text)

    def stop(self) -> None:
        """停掉重画并清干净已画的行。幂等，可以放心搁在 finally 里。

        **不等待重画周期**：重画线程等在 `Event.wait(tick)` 上，置位后立刻醒。

        `_STOP_WAIT` 封住的是「等**别人**」的两处——`join`（等重画线程退出）和
        `_io_lock.acquire`（等在途的那次 write 交还锁）；抢不到锁就不清了，收不干净的
        残影只是化妆品，而 Ctrl-C 的响应速度是硬要求。

        **但清屏那次 write 本身没有上限**：Python 没法给阻塞式 write 设超时，终端卡死
        （SSH 卡顿、Ctrl-S 的 XOFF、终端模拟器 hang）时它会一直卡着。实测终端写卡 3 秒
        时 `stop()` 就是 3 秒——不是等锁，是自己那次 write。这是有意接受的取舍：清屏
        必须写终端，而紧随其后 `main()` 打印报告要写的是同一个卡死的终端，同样会卡，
        所以这里的边际延迟不显著；真要根治得上非阻塞写，为一个「终端本来就已经不可用」
        的场景不值得。`start()` 同步画第一帧有完全相同的性质。

        总之：`stop()` 不会因为**等待重画周期或等锁**而慢，但终端本身卡住时它一样卡。
        """
        with self._lock:  # 只碰状态，不做 IO，所以这把锁永远等不久
            if self._stopped:
                return
            self._stopped = True
        self._stop_event.set()
        thread, self._thread = self._thread, None
        if thread is not None and thread is not threading.current_thread():
            thread.join(timeout=_STOP_WAIT)
        if not self._isatty:
            return
        if self._io_lock.acquire(timeout=_STOP_WAIT):
            try:
                if self._drawn:
                    # 上移到进度块开头，再清到屏幕末尾——报告不会和残影混在一起
                    self._write_locked(f"\033[{self._drawn}A\033[J")
                    self._drawn = 0
            finally:
                self._io_lock.release()

    # ---- 内部 ----

    def _write_locked(self, text: str) -> None:
        """真正往流里写。调用方必须已持有 `_io_lock`。

        显示出任何问题都不该影响探测本身：写失败（管道断了、流已关）一律吞掉。
        """
        try:
            self._stream.write(text)
            self._stream.flush()
        except Exception:  # noqa: BLE001
            pass

    def _write(self, text: str) -> None:
        with self._io_lock:
            self._write_locked(text)

    def _loop(self) -> None:
        # 先等一个 tick 再画：第一帧已经由 start() 同步画掉了
        while not self._stop_event.wait(self._tick):
            self._redraw()

    def _max_width(self) -> int:
        if self._width is not None:
            return self._width
        try:
            # 留一格，别顶到最后一列触发折行。夹到 >=1：极窄终端下 columns-1 会是
            # 0 或负数，而那正好是 format_progress_line 眼里的「不限宽」，
            # 整行原样喷出去必然折行——把「防折行」直接翻成了「保证折行」。
            return max(1, shutil.get_terminal_size().columns - 1)
        except Exception:  # noqa: BLE001 —— 真问不出尺寸就只能不限宽
            return 0

    def _redraw(self) -> None:
        max_width = self._max_width()
        with self._lock:  # 只算，不写：慢终端拖不住 update()
            if self._stopped:
                return
            now = self._clock()
            lines = [
                format_progress_line(
                    name,
                    self._state[name][0],
                    self._state[name][1],
                    self._state[name][2],
                    self._state[name][3],
                    max(0.0, now - self._state[name][4]),
                    name_width=self._name_width,
                    max_width=max_width,
                )
                for name in self._names
            ]
        with self._io_lock:
            # 上移几行必须按**写这一帧的那一刻**的 _drawn 算，不能用锁外的旧值：
            # log() 可能刚把进度块收掉并把它归零。
            out = f"\033[{self._drawn}A" if self._drawn else ""
            out += "".join(f"\r\033[K{line}\n" for line in lines)
            self._write_locked(out)
            self._drawn = len(lines)


# ---------------------------------------------------------------- CLI


def main(argv: list[str] | None = None, *, fetcher=None, sleeper=None, clock=None) -> int:
    """CLI 入口。

    fetcher / sleeper / clock 是测试注入点，默认全为 None 即走真实网络与真实时钟。
    测试传入替身就能离线、零等待地跑完整条主流程（--only/--client 过滤、参数校验、
    落盘、JSON、退出码），不必真的发请求。
    """
    parser = argparse.ArgumentParser(
        description="探测订阅在不同客户端 UA 下能拉到多少 sing-box 可用的出站节点"
    )
    default_list = Path(__file__).resolve().parent / "clash.txt"
    parser.add_argument("-f", "--file", type=Path, default=default_list, help="订阅清单，默认 clash.txt")
    parser.add_argument("--only", action="append", metavar="名字", help="只测指定订阅，可重复")
    parser.add_argument("--client", action="append", metavar="客户端", help="只测指定客户端，可重复")
    parser.add_argument("--interval", type=float, default=8.0, help="单订阅内请求间隔秒数，默认 8.0")
    parser.add_argument("--timeout", type=float, default=20.0, help="单次请求超时秒数，默认 20")
    parser.add_argument("--dump", type=Path, metavar="目录", help="保存原始响应，默认不保存（含订阅 token）")
    parser.add_argument("--json", action="store_true", help="输出 JSON 而不是终端报告")
    parser.add_argument("--show-url", action="store_true", dest="show_url",
                        help="--json 输出里保留完整订阅 URL（默认打码，因为含 token）")
    parser.add_argument("--wide", action="store_true", help="不截断长内容")
    parser.add_argument(
        "--force-interval", action="store_true", dest="force_interval",
        help="允许低于 7.5s 的间隔（会突破机场限速，仅供压测，后果自负）",
    )
    parser.add_argument(
        "--no-proxy", action="store_true", dest="no_proxy",
        help="忽略 http_proxy/https_proxy 环境变量，直连拉取",
    )
    parser.add_argument(
        "--no-progress", action="store_true", dest="no_progress",
        help="关闭实时进度显示（进度默认打到 stderr）",
    )
    args = parser.parse_args(argv)

    # 限速是这个项目唯一的硬约束，唯一的执行点不能只是一句 stderr 告警然后照跑。
    if args.interval <= 0:
        parser.error(f"--interval 必须为正数，收到 {args.interval}")
    if args.interval < 7.5 and not args.force_interval:
        parser.error(
            f"--interval {args.interval}s 会突破「每分钟不超过 8 次」的限速要求"
            "（最小 7.5）；确实要压测请显式加 --force-interval"
        )

    # 写错客户端名会让 build_ua_plan 只剩基准一项，然后自信地报「当前 UA 已最优」——
    # 只发了一次请求就下结论。表键是小写，Loon / loonn 都得当错误拦下。
    if args.client:
        unknown = [c for c in args.client if c not in UA_TABLE]
        if unknown:
            parser.error(
                f"未知客户端：{'、'.join(unknown)}；可选值：{'、'.join(UA_TABLE)}"
            )

    try:
        text = args.file.read_text(encoding="utf-8")
    except OSError as exc:
        print(f"读不了订阅清单 {args.file}：{exc}", file=sys.stderr)
        return 2

    subscriptions = parse_clash_txt(text)
    if args.only:
        subscriptions = [s for s in subscriptions if s.name in args.only]
    if not subscriptions:
        print("没有可测的订阅", file=sys.stderr)
        return 2

    dump_dir = None
    if args.dump:
        dump_dir = args.dump
        # 落盘的是完整订阅响应，含全部节点凭据，只能自己可读。
        # 建目录失败（路径被普通文件占了、上级只读、盘满）给一行人话，别喷 traceback——
        # 紧随其后的 chmod 已经这么做了，两处不该一个有 try 一个没有。
        try:
            dump_dir.mkdir(parents=True, exist_ok=True, mode=0o700)
        except OSError as exc:
            print(f"无法创建 --dump 目录 {dump_dir}：{exc}", file=sys.stderr)
            return 2
        try:
            dump_dir.chmod(0o700)  # 目录已存在时 mkdir 不改权限，这里补一刀
        except OSError as exc:
            print(f"⚠️ 无法收紧 {dump_dir} 的权限：{exc}", file=sys.stderr)

    fetcher = fetcher or build_fetcher(args.no_proxy)
    cancel_event = threading.Event()

    probe_kwargs = {}
    if sleeper is not None:
        probe_kwargs["sleeper"] = sleeper
    if clock is not None:
        probe_kwargs["clock"] = clock

    # 各订阅按 --only/--client 筛选后实际的请求数可能不同（第三列 client 不同、
    # 是否与 UA_TABLE 合并都会影响 build_ua_plan 的长度），一律按实际算。
    plan_sizes = [(s.name, len(build_ua_plan(s, args.client))) for s in subscriptions]

    # 进度一律写 stderr：--json 的 stdout 必须保持纯净可解析。
    renderer = None if args.no_progress else ProgressRenderer(plan_sizes)
    # 重名订阅会被 renderer 加后缀区分，所以进度用的键要从它那里取，不能直接用 name
    progress_keys = renderer.keys if renderer is not None else [s.name for s in subscriptions]

    def run(subscription: Subscription, progress_key: str) -> Report:
        # partial 把这一行的键绑死在第一个位置参数上，签名正好是
        # on_progress(phase, done, total, detail)；顺带避开「闭包里捕获 Optional」
        # 触发的类型检查告警（pyright 不跨作用域传播捕获变量的窄化）。
        on_progress = (
            None if renderer is None
            else functools.partial(renderer.update, progress_key)
        )
        # 进度块活着时告警必须从渲染器走，裸 print 会被下一帧盖掉
        on_warn = None if renderer is None else renderer.log

        probes = probe_subscription(
            subscription,
            interval=args.interval,
            timeout=args.timeout,
            clients=args.client,
            dump_dir=dump_dir,
            fetcher=fetcher,
            cancel_event=cancel_event,
            on_progress=on_progress,
            on_warn=on_warn,
            **probe_kwargs,
        )
        return summarize(subscription, probes)

    if not args.json:
        # 订阅间是并行的（ThreadPoolExecutor），墙钟时间取决于请求最多的那个，
        # 所以用 max 而不是求和。
        max_requests = max((n for _, n in plan_sizes), default=0)
        eta = int(max(0, max_requests - 1) * args.interval)
        print(f"探测 {len(subscriptions)} 个订阅，最多每个 {max_requests} 次请求、间隔 "
              f"{args.interval}s，约需 {eta} 秒……", file=sys.stderr)

    # 不能用 with ThreadPoolExecutor：它的 __exit__ 是 shutdown(wait=True)，异常传播时
    # 会先把所有 worker 等完；而 max_workers == 订阅数意味着每个订阅都在跑、一个都取消
    # 不掉，Ctrl-C 于是先卡住最长 12×interval 秒再丢掉全部结果。改成显式 submit +
    # cancel_event：中断时让 worker 自己收工，已完成的照常输出（spec「错误处理」节）。
    pool = ThreadPoolExecutor(max_workers=max(1, len(subscriptions)))
    futures = [pool.submit(run, s, k) for s, k in zip(subscriptions, progress_keys)]
    interrupted = False
    if renderer is not None:
        renderer.start()
    try:
        try:
            for _ in as_completed(futures):
                pass
            pool.shutdown(wait=True)
        except KeyboardInterrupt:
            interrupted = True
            cancel_event.set()
            # 先收掉进度块再说话，否则「已中断」会插进正在原地重画的那几行里
            if renderer is not None:
                renderer.stop()
            print("\n已中断，等待进行中的请求收尾……", file=sys.stderr)
            try:
                # worker 看到 cancel_event 会立刻跳出循环，只剩已经发出去的那次请求要等，
                # 用 --timeout 兜底。不等的话 f.done() 是个竞态：worker 明明马上就返回了，
                # 结果却因为查得太早被当成「没跑完」丢掉。再按一次 Ctrl-C 可以跳过这段等待。
                wait_futures(futures, timeout=args.timeout + 1)
            except KeyboardInterrupt:
                pass
            pool.shutdown(wait=False, cancel_futures=True)
            print("输出已完成的部分", file=sys.stderr)
    finally:
        # stop() 幂等、不等重画周期，放这里保证任何退出路径都不会把重画线程和残影留下
        if renderer is not None:
            renderer.stop()

    # 按订阅原顺序取回已完成的结果；未完成/被取消的直接略过。
    # worker 抛异常的那个订阅必须出声：静默略过等于让报告少一行、退出码照报 0，
    # 用户会以为「已最优」，而事实是那个订阅根本没测——和 --client 拼错是同一类
    # 「静默退化成一个自信的错误结论」。出声之后退出码强制 2。
    reports = []
    failed = False
    for future, subscription in zip(futures, subscriptions):
        if not future.done() or future.cancelled():
            continue
        exc = future.exception()
        if exc is not None:
            failed = True
            print(f"✘ 订阅 {subscription.name} 探测过程出错，已从报告中略过："
                  f"{type(exc).__name__}: {exc}", file=sys.stderr)
            continue
        reports.append(future.result())

    if args.json:
        print(json.dumps(
            [report_to_dict(r, show_url=args.show_url) for r in reports],
            ensure_ascii=False, indent=2,
        ))
    else:
        for index, report in enumerate(reports):
            if index:
                print()
            print(render_report(report, wide=args.wide))

    if interrupted or failed or not reports:
        return 2
    return exit_code(reports)


if __name__ == "__main__":
    sys.exit(main())
