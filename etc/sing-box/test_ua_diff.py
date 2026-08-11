#!/usr/bin/env python3
"""ua-diff.py 的单元测试。运行：/opt/homebrew/bin/python3 -m unittest test_ua_diff -v"""

import base64
import contextlib
import importlib.util
import io
import json
import os
import re
import stat
import sys
import tempfile
import threading
import time
import unittest
from pathlib import Path

_spec = importlib.util.spec_from_file_location(
    "ua_diff", Path(__file__).with_name("ua-diff.py")
)
ua_diff = importlib.util.module_from_spec(_spec)
sys.modules["ua_diff"] = ua_diff
_spec.loader.exec_module(ua_diff)


# ---------------------------------------------------------------- 真实响应样本
#
# 下面两段照抄真实探测里被误判成 unknown 的响应形状（凭据已换成占位串）：
# Quantumult X 给的是 base64 包着的 [server_local] 行，Loon 给的是没有 [Proxy]
# 段头的裸节点行。两者的共同点是「没有段头、也没有 ://」。

QX_BARE = (
    "vless=172.81.111.224:10009,method=none,"
    "password=75caee81-fcef-4a2b-9c31-1d3e6f8a0b21,obfs=over-tls,"
    "obfs-host=cdn.example.org,tls-verification=false,fast-open=false,"
    "udp-relay=true,tag=🇭🇰香港-A(流量)\n"
    "vless=172.81.111.224:10010,method=none,"
    "password=75caee81-fcef-4a2b-9c31-1d3e6f8a0b21,obfs=over-tls,"
    "obfs-host=cdn.example.org,tls-verification=false,fast-open=false,"
    "udp-relay=true,tag=🇺🇸美国-B(流量)\n"
    "trojan=45.32.11.7:443,password=pw,over-tls=true,tls-verification=true,"
    "fast-open=false,udp-relay=true,tag=❇️双鱼座-D(流量)\n"
)

QX_BARE_B64 = base64.b64encode(QX_BARE.encode())

LOON_BARE = (
    "剩余流量：86.88 GB=vless,172.81.111.224,10009,"
    '"75caee81-fcef-4a2b-9c31-1d3e6f8a0b21",transport:tcp,over-tls:true\n'
    "距离下次重置剩余：23 天=vless,172.81.111.224,10009,"
    '"75caee81-fcef-4a2b-9c31-1d3e6f8a0b21",transport:tcp,over-tls:true\n'
    "🇭🇰香江-G(流量)=vless,172.81.111.225,10011,"
    '"75caee81-fcef-4a2b-9c31-1d3e6f8a0b21",transport:tcp,over-tls:true\n'
    "🇺🇸美国-D(流量)=trojan,45.32.11.7,443,"
    '"pw",over-tls:true,tls-name:cdn.example.org\n'
)


# subscribe.sh 的相关片段（照抄真实结构，UA 与仓库当前值一致）。基准 UA 运行时从
# 这里解析——测试一律显式指定 --subscribe-sh，免得结论随本机 $WORKSPACE 里那份真脚本漂。
SUBSCRIBE_SH = (
    "#!/usr/bin/env bash\n"
    "CLIENT=${3:-sing-box}\n"
    "if [[ $CLIENT == 'sing-box' ]]; then\n"
    '    AGENT="SFA/1.13.18 (sing-box 1.13.18)"\n'
    "else\n"
    '    AGENT="$CLIENT/*"\n'
    "fi\n"
    'OPTS=(-fL -H "User-Agent: $AGENT" -o "$OUTPUT")\n'
)


class ParseClashTxtTest(unittest.TestCase):
    def test_跳过注释行与空行(self):
        text = (
            "ash.b64 https://example.org/sub?token=aaa shadowsocket\n"
            "\n"
            "#xipcloud.yaml https://example.org/clash/bbb clash\n"
            "nanocloud.json https://example.org/verify?token=ccc sing-box\n"
        )
        subs = ua_diff.parse_clash_txt(text)
        self.assertEqual([s.name for s in subs], ["ash.b64", "nanocloud.json"])
        self.assertEqual(subs[0].client, "shadowsocket")
        self.assertEqual(subs[1].url, "https://example.org/verify?token=ccc")

    def test_缺少客户端字段时默认为_sing_box(self):
        subs = ua_diff.parse_clash_txt("only.json https://example.org/sub\n")
        self.assertEqual(subs[0].client, "sing-box")

    def test_字段不足两个的行被丢弃(self):
        self.assertEqual(ua_diff.parse_clash_txt("garbage\n"), [])


class BaselineUaTest(unittest.TestCase):
    def test_sing_box_跟随解析出来的基准来源(self):
        """基准串不再是文件里的常量，而是 subscribe.sh 解析结果。"""
        ua_diff.set_baseline_source(
            ua_diff.BaselineSource("SFA/9.9.9 (sing-box 9.9.9)", "读自 subscribe.sh", True))
        self.addCleanup(ua_diff.set_baseline_source, None)
        self.assertEqual(ua_diff.baseline_ua("sing-box"), "SFA/9.9.9 (sing-box 9.9.9)")

    def test_没设定来源时用内置兜底(self):
        ua_diff.set_baseline_source(None)
        # 手写字面量，不引用被测常量：常量被改成别的值时这条必须炸
        self.assertEqual(ua_diff.baseline_ua("sing-box"), "SFA/1.13.18 (sing-box 1.13.18)")

    def test_其余客户端走通配形式(self):
        self.assertEqual(ua_diff.baseline_ua("clash"), "clash/*")

    def test_看着像拼错的客户端名也原样保留(self):
        # 机场按子串匹配不上的 UA 会落进「无法识别」分支，那正是要测的对照项，不能修正
        self.assertEqual(ua_diff.baseline_ua("shadowsocket"), "shadowsocket/*")


class UaTableTest(unittest.TestCase):
    def test_四个客户端各两个版本(self):
        # 手写客户端名字面量：遍历表本身来断言等于没断言（删表项 = 删断言）
        self.assertEqual(sorted(ua_diff.UA_TABLE), ["clash-verge", "mihomo", "shadowrocket", "sing-box"])
        for client, entries in ua_diff.UA_TABLE.items():
            self.assertEqual(len(entries), 2, f"{client} 应有最新与旧版两项")
            for version, ua in entries:
                self.assertTrue(version and ua, f"{client} 的条目不完整")

    def test_不再探测_loon_与_quantumult_x(self):
        """两轮真实探测：nanocloud.json 对它们返回 0 字节，ash.b64 返回 conf /
        base64-conf——下游没有 loader，可用节点恒为 0。白费每订阅 4 次请求。"""
        self.assertNotIn("loon", ua_diff.UA_TABLE)
        self.assertNotIn("quantumult-x", ua_diff.UA_TABLE)
        uas = [ua for entries in ua_diff.UA_TABLE.values() for _, ua in entries]
        self.assertFalse([u for u in uas if u.startswith(("Loon/", "Quantumult"))])

    def test_sing_box_两项用_SFA_而不是_SFI(self):
        """subscribe.sh 实际发的是 SFA。写成 SFI 的话串永远不等于基准，
        build_ua_plan 的合并逻辑就是死代码，每订阅白发一次请求。"""
        self.assertEqual(
            [ua for _, ua in ua_diff.UA_TABLE["sing-box"]],
            ["SFA/1.13.18 (sing-box 1.13.18)", "SFA/1.12.25 (sing-box 1.12.25)"],
        )

    def test_八个_UA_串两两不同(self):
        """UA 串必须唯一。

        build_ua_plan 用 `ua == base` 判定基准去重，若表里有两条 UA 串相同，
        后一条会 last-match-wins 地覆盖掉基准项，悄悄改变基准是谁。
        """
        uas = [ua for entries in ua_diff.UA_TABLE.values() for _, ua in entries]
        self.assertEqual(len(uas), 8)
        self.assertEqual(len(set(uas)), 8, "UA 串有重复")


class DetectFormatTest(unittest.TestCase):
    def test_sing_box_json(self):
        body = b'{"log":{"level":"info"},"outbounds":[{"type":"vless","tag":"a"}]}'
        self.assertEqual(ua_diff.detect_format(body), "sing-box")

    def test_没有_outbounds_的_json_不算_sing_box(self):
        self.assertEqual(ua_diff.detect_format(b'{"foo":1}'), "unknown")

    def test_clash_yaml(self):
        body = b"mixed-port: 7890\nproxies:\n  - {name: a, server: 1.2.3.4, port: 443, type: vmess}\n"
        self.assertEqual(ua_diff.detect_format(body), "clash")

    def test_明文链接表(self):
        body = b"vless://uuid@1.2.3.4:443?type=tcp#node-a\nss://xxx@5.6.7.8:8388#node-b\n"
        self.assertEqual(ua_diff.detect_format(body), "links")

    def test_base64_链接表(self):
        import base64 as _b64
        raw = b"vless://uuid@1.2.3.4:443?type=tcp#node-a\n"
        self.assertEqual(ua_diff.detect_format(_b64.b64encode(raw)), "base64")

    def test_loon_conf(self):
        body = b"[Proxy]\n\xe8\x8a\x82\xe7\x82\xb9A = VMess,1.2.3.4,443\n"
        self.assertEqual(ua_diff.detect_format(body), "conf")

    def test_quantumult_x_conf(self):
        body = b"[server_local]\nvmess=1.2.3.4:443, method=none, tag=node-a\n"
        self.assertEqual(ua_diff.detect_format(body), "conf")

    def test_base64_包装的_quantumult_x_conf(self):
        """真实样本：QX 对 ash.b64 返回 50824 字节的 base64，解开是 [server_local] 行。

        里头一个 `://` 都没有（QX 用 `类型=host:port`），只看 `://` 会整份判成
        unknown 丢掉——而 QX 恰恰是脚本专门写了解析器的格式。
        """
        self.assertEqual(ua_diff.detect_format(QX_BARE_B64), "base64-conf")

    def test_base64_内层是链接表时仍是_base64(self):
        # 递归嗅探不能把原来的 base64 语义改掉
        raw = b"vless://uuid@1.2.3.4:443?type=tcp#node-a\ntrojan://pw@5.6.7.8:443#node-b\n"
        self.assertEqual(ua_diff.detect_format(base64.b64encode(raw)), "base64")

    def test_base64_首行不是链接时仍按链接表兜底(self):
        # 机场会在链接表最前面塞 STATUS= 行，首行认不出来但正文确实是链接表
        raw = b"STATUS=\xe5\x89\xa9\xe4\xbd\x99 86 GB\nvless://uuid@1.2.3.4:443#a\n"
        self.assertEqual(ua_diff.detect_format(base64.b64encode(raw)), "base64")

    def test_没有段头的_loon_裸节点行(self):
        """真实样本：Loon 对 ash.b64 返回 30460 字节，全是 `名字 = 类型,服务器,端口`
        的裸行，没有 [Proxy] 段头——订阅响应给的是节点清单，不是整份配置文件。"""
        self.assertEqual(ua_diff.detect_format(LOON_BARE.encode()), "conf")

    def test_没有段头的_quantumult_x_裸节点行(self):
        self.assertEqual(ua_diff.detect_format(QX_BARE.encode()), "conf")

    def test_只有一行像节点行时不算_conf(self):
        # 一行太容易撞上普通 key = value 配置行，门槛是两行
        body = "ip-mode = dual\nvless=1.2.3.4:443, tag=x\n".encode()
        self.assertEqual(ua_diff.detect_format(body), "unknown")

    def test_普通配置行不会被当成裸节点行(self):
        """放宽 conf 判定后，[General] 这类段的普通 key = value 不该被误判。"""
        body = (
            "ip-mode = dual\n"
            "skip-proxy = 127.0.0.1, localhost\n"
            "dns-server = 8.8.8.8, 1.1.1.1\n"
            "proxy-test-url = http://cp.cloudflare.com/generate_204\n"
            "test-timeout = 5\n"
        ).encode()
        self.assertEqual(ua_diff.detect_format(body), "unknown")

    def test_非节点段里形状合格的行不算数(self):
        """`[General]` 里的 socks/http 本地代理形状上完全像 QX 节点行。

        嗅探必须与 _parse_conf 用同一套标准（只数无段头的与节点段内的），
        否则这份响应会被判成 conf：解析出 0 个节点、又因为不是 unknown 而不打
        「共 N 字节，前 80 字节是……」的诊断行，用户排查时唯一的线索被吞掉。
        """
        body = (
            "[General]\n"
            "socks = 127.0.0.1:1080\n"
            "http = 127.0.0.1:8080\n"
        ).encode()
        self.assertEqual(ua_diff.detect_format(body), "unknown")

    def test_放宽_conf_判定不影响其他格式(self):
        """conf 在嗅探顺序上最后，前面几种不能被它抢走。"""
        cases = {
            b'{"outbounds":[{"type":"vless","tag":"a","server":"1.2.3.4","server_port":443}]}': "sing-box",
            b"proxies:\n  - {name: a, server: 1.2.3.4, port: 443, type: vmess}\n": "clash",
            b"vless://uuid@1.2.3.4:443#a\nvless://uuid@5.6.7.8:443#b\n": "links",
        }
        for body, expected in cases.items():
            self.assertEqual(ua_diff.detect_format(body), expected, body[:30])

    def test_空响应(self):
        self.assertEqual(ua_diff.detect_format(b"   \n"), "unknown")

    def test_html_错误页(self):
        self.assertEqual(ua_diff.detect_format(b"<html><body>403</body></html>"), "unknown")


class DecodeBase64Test(unittest.TestCase):
    def test_标准_base64(self):
        self.assertEqual(ua_diff.decode_base64("aGVsbG8="), b"hello")

    def test_缺少填充也能解(self):
        self.assertEqual(ua_diff.decode_base64("aGVsbG8"), b"hello")

    def test_urlsafe_变体(self):
        self.assertEqual(ua_diff.decode_base64("a-_w"), ua_diff.decode_base64("a+/w"))

    def test_含换行(self):
        self.assertEqual(ua_diff.decode_base64("aGVs\nbG8="), b"hello")

    def test_解不开返回空(self):
        self.assertEqual(ua_diff.decode_base64("!!!!"), b"")


class NormalizeTypeTest(unittest.TestCase):
    def test_别名归一(self):
        self.assertEqual(ua_diff.normalize_type("shadowsocks"), "ss")
        self.assertEqual(ua_diff.normalize_type("hy2"), "hysteria2")
        self.assertEqual(ua_diff.normalize_type("socks5"), "socks")

    def test_大小写与连字符(self):
        self.assertEqual(ua_diff.normalize_type("VMess"), "vmess")
        self.assertEqual(ua_diff.normalize_type("Shadow-TLS"), "shadowtls")

    def test_未知类型原样小写返回(self):
        self.assertEqual(ua_diff.normalize_type("Juicity"), "juicity")


class FingerprintTest(unittest.TestCase):
    def test_指纹不含凭据(self):
        node = ua_diff.Node("香港01", "vless", "1.2.3.4", 443)
        self.assertEqual(ua_diff.fingerprint(node), "vless://1.2.3.4:443")

    def test_改名不改指纹(self):
        a = ua_diff.Node("香港01", "vless", "1.2.3.4", 443)
        b = ua_diff.Node("HK-01", "vless", "1.2.3.4", 443)
        self.assertEqual(ua_diff.fingerprint(a), ua_diff.fingerprint(b))

    def test_主机名大小写归一(self):
        """_parse_url_link 走 urlparse.hostname 会小写化，clash/conf 解析器不会。

        不归一的话同一个节点在两种格式的响应里算成两个，凭空造出增量幻影。
        """
        a = ua_diff.Node("x", "vless", "node1.Example.com", 443)
        b = ua_diff.Node("x", "vless", "node1.example.com", 443)
        self.assertEqual(ua_diff.fingerprint(a), ua_diff.fingerprint(b))

    def test_IPv6_方括号归一(self):
        """urlparse 剥掉方括号，QX 的 rpartition 保留，两边必须算同一个节点。"""
        a = ua_diff.Node("x", "vless", "[2001:DB8::1]", 443)
        b = ua_diff.Node("x", "vless", "2001:db8::1", 443)
        self.assertEqual(ua_diff.fingerprint(a), ua_diff.fingerprint(b))

    def test_跨格式解析出的同一节点指纹相同(self):
        """集成层：同一节点分别经 links 与 conf 解析，指纹必须一致。"""
        link = ua_diff.parse_nodes(b"trojan://pw@Node1.Example.COM:443#HK\n", "links")
        conf = ua_diff.parse_nodes(b"[Proxy]\nHK = Trojan,Node1.Example.COM,443,\"pw\"\n", "conf")
        self.assertEqual(len(link), 1)
        self.assertEqual(len(conf), 1)
        self.assertEqual(ua_diff.fingerprint(link[0]), ua_diff.fingerprint(conf[0]))


class PreviewBytesTest(unittest.TestCase):
    def test_转义控制字符(self):
        self.assertEqual(ua_diff.preview_bytes(b"<html>\n<body>403</body>"),
                         "<html>\\n<body>403</body>")

    def test_超长截断并加省略号(self):
        text = ua_diff.preview_bytes(b"A" * 200)
        self.assertEqual(text, "A" * 80 + "…")

    def test_非_utf8_字节不抛异常(self):
        self.assertIn("\\", ua_diff.preview_bytes(b"\xff\xfe\x00abc"))


class MaskUrlTest(unittest.TestCase):
    def test_打掉路径与查询串(self):
        self.assertEqual(ua_diff.mask_url("https://example.org/verify?token=ccc"),
                         "https://example.org/***?***")

    def test_只有主机时保留主机(self):
        self.assertEqual(ua_diff.mask_url("https://example.org/"), "https://example.org")

    def test_不是_URL_时整体打码(self):
        self.assertEqual(ua_diff.mask_url("garbage"), "***")

    def test_打掉_netloc_里的_userinfo(self):
        """`user:token@host` 是 token 的另一个常见藏身处。

        原本只砍 path/query、netloc 整段保留，凭据就跟着 --json 一起流出去了。
        """
        self.assertEqual(ua_diff.mask_url("https://user:s3cret@example.org/sub?token=aaa"),
                         "https://example.org/***?***")
        self.assertEqual(ua_diff.mask_url("https://s3cret@example.org/"),
                         "https://example.org")
        self.assertNotIn("s3cret", ua_diff.mask_url("https://user:s3cret@example.org/sub"))

    def test_保留端口(self):
        self.assertEqual(ua_diff.mask_url("https://user:pw@example.org:8443/sub"),
                         "https://example.org:8443/***")

    def test_IPv6_主机补回方括号(self):
        self.assertEqual(ua_diff.mask_url("http://[2001:db8::1]:8080/sub"),
                         "http://[2001:db8::1]:8080/***")

    def test_畸形_netloc_整体打码(self):
        # 端口不是数字、只有 userinfo 没有主机——宁可整体打码，也别漏出半截
        self.assertEqual(ua_diff.mask_url("https://user:pw@example.org:notaport/sub"),
                         "https://example.org/***")
        self.assertEqual(ua_diff.mask_url("https://user:pw@/sub"), "***")


class IsPseudoNodeTest(unittest.TestCase):
    def test_识别真实伪节点名(self):
        # 取自 ash.b64 解码后的前三行
        for name in ("剩余流量：88.03 GB", "距离下次重置剩余：24 天", "套餐到期：2027-03-03"):
            self.assertTrue(ua_diff.is_pseudo_node(name), name)

    def test_识别推广类伪节点(self):
        self.assertTrue(ua_diff.is_pseudo_node("官网 https://example.org"))
        self.assertTrue(ua_diff.is_pseudo_node("客服 t.me/example"))

    def test_正常节点名不误伤(self):
        for name in ("🇭🇰HK-01", "🇺🇸US-04", "❇️双鱼座-A(通用)", "🇭🇰HK-06[HKBN]"):
            self.assertFalse(ua_diff.is_pseudo_node(name), name)

    def test_计费档位标记的真节点不被误杀(self):
        """真实回归：nanocloud 用 `(流量)` / `(通用)` 标计费档位，全是真节点。

        裸词「流量」曾把这 6 个（实际 17 个）一并剔出计数，基准的「21 可用」
        凭空少了一半，`伪` 列的 17 全是噪音。
        """
        for name in (
            "❇️双鱼座-D(流量)", "🇺🇸美国-B(流量)", "🇺🇸美国-D(流量)",
            "🇭🇰香江-G(流量)", "🇭🇰香江-H(流量)", "🇭🇰香港-A(流量)",
        ):
            self.assertFalse(ua_diff.is_pseudo_node(name), name)

    def test_ash_b64_的三个真实伪节点仍然命中(self):
        # 放宽误伤的同时不能放跑真的：这三行取自 ash.b64 的真实响应
        for name in ("剩余流量：86.89 GB", "距离下次重置剩余：23 天", "套餐到期：2027-03-03"):
            self.assertTrue(ua_diff.is_pseudo_node(name), name)

    def test_结构信号兜住词组没穷举到的套餐行(self):
        # 日期形状与「冒号 + 数字 + 单位」形状
        self.assertTrue(ua_diff.is_pseudo_node("有效期至 2027-03-03"))
        self.assertTrue(ua_diff.is_pseudo_node("可用：12.5 TB"))
        # 对照：节点名里的连字符编号不是日期
        self.assertFalse(ua_diff.is_pseudo_node("🇯🇵JP-2026-A"))

    def test_带宽标注的真节点不被误杀(self):
        """机场按带宽命名节点是真实习惯，裸单字母单位 G/M/T 会把它们误杀。

        这是收紧关键词时**新引入**的假阳性类别（老的裸词版反而不会误伤），
        与「流量」误杀 17 个真节点是同一类错误换了个入口，必须钉死。
        """
        for name in ("香港01：100M", "东京：1G专线", "🇭🇰HK-02：500M 直连", "US-01: 10G"):
            self.assertFalse(ua_diff.is_pseudo_node(name), name)

    def test_半角冒号与中文日期的套餐行不漏网(self):
        """结构信号只认全角冒号 + 连字符日期时，这三种写法会整批漏网。"""
        for name in ("剩余:88GB", "套餐流量 100GB", "过期：2027年3月3日"):
            self.assertTrue(ua_diff.is_pseudo_node(name), name)

    def test_裸词单独出现时也命中(self):
        """`官网`/`客服`/`续费` 是允许保留的裸词——它们几乎不可能是真节点名的一部分。

        原先的用例都带着 URL（`官网 https://…`），URL 判据独立命中，裸词本身
        从没被单独验证过：删掉它们全套测试照样全绿。这里只给裸词，不带任何
        其它信号。
        """
        for name in ("官网", "客服", "续费", "机场官网", "在线客服", "点此续费"):
            self.assertTrue(ua_diff.is_pseudo_node(name), name)

    # 判据表的**独立副本**。不能改成遍历 ua_diff._PSEUDO_PHRASES——那样删掉表里
    # 一项就等于同时删掉了对它的检查，测试永远绿。这份字面量必须手写。
    EXPECTED_PHRASES = (
        "剩余流量", "总流量", "已用流量", "套餐流量", "流量重置", "距离下次", "重置剩余",
        "套餐到期", "到期时间", "过期时间",
        "续费", "官网", "客服", "http://", "https://", "t.me/",
    )

    def test_每个词组单独出现时都能命中(self):
        """逐词钉住判据表：每个词组在没有任何其它信号陪伴时也必须自己命中。

        作用是让**数据表本身有人守卫**：此前删掉 `官网`/`客服`/`续费` 全套 220 个
        测试照样全绿，因为用例都带着 URL，URL 判据独立命中，裸词从没被单独验证过。
        """
        for phrase in self.EXPECTED_PHRASES:
            self.assertIn(phrase, ua_diff._PSEUDO_PHRASES, f"{phrase} 被从判据表删掉了")
            self.assertTrue(ua_diff.is_pseudo_node(phrase), phrase)
            # 保证上一行真的在验证词组：某个词组若恰好也被结构信号兜住，
            # 删掉它测试仍会绿，这条先一步把这种情况指出来
            self.assertFalse(
                any(p.search(phrase) for p in ua_diff._PSEUDO_PATTERNS),
                f"{phrase} 被结构信号兜住了，上一行断言就不再守卫词组本身",
            )

    def test_新增词组必须同时补测试(self):
        """判据表与上面那份字面量副本必须一一对应。

        新加一个词组却不补用例时这里会挂——否则表会慢慢长出一堆没人验证的条目，
        正是 `官网`/`客服` 变成盲区的过程。
        """
        self.assertEqual(sorted(ua_diff._PSEUDO_PHRASES), sorted(self.EXPECTED_PHRASES))


class TierOfTest(unittest.TestCase):
    """分级按订阅格式分裂——clash-to-sing.py 的转换分支本身就是按格式分裂的。

    这些断言逐条对应 $WORKSPACE/proxy/sing-rules/clash-to-sing.py 的实际 case：
    clash_proxy_to_outbound（:179）只有 hysteria2/ss/trojan/vmess，
    shadowrocket_proxy_to_outbound（:251）只有 vless/trojan/anytls，
    两个函数的 case _ 都 raise ValueError 且调用方 proxy_to_outbound（:131）无
    try/except——把不支持的类型判成 ✅ 可用会让 update.sh 直接崩，不是跳过一个节点。
    """

    def test_clash_格式的可用档(self):
        for t in ("hysteria2", "ss", "trojan", "vmess"):
            self.assertEqual(ua_diff.tier_of(t, "clash"), "usable", t)

    def test_clash_格式没有_vless_anytls_tuic_分支(self):
        # clash_proxy_to_outbound 没有这三个 case，判成可用就会让 update.sh 抛 ValueError
        for t in ("vless", "anytls", "tuic"):
            self.assertEqual(ua_diff.tier_of(t, "clash"), "pending", t)

    def test_base64_走_shadowrocket_loader(self):
        for t in ("vless", "trojan", "anytls"):
            self.assertEqual(ua_diff.tier_of(t, "base64"), "usable", t)

    def test_明文_links_一个可用节点都没有(self):
        """subscribe.sh 原样落盘 + config.json 只能写 shadowrocket，于是明文链接表
        会走 load_shadowrocket_proxies（:1054）的**无条件** base64.b64decode：

            base64.b64decode("vless://u@a.example.com:443#A\\n…")
            → binascii.Error: Incorrect padding

        那边没有 try/except，整个 clash-to-sing.py 崩掉——一个节点都进不了 config.json。
        所以 links 与 conf 同档：内核认得的类型全落 pending（补个 loader 就能捞回来），
        判成 usable 会给出一条照做就炸的建议。
        """
        for t in ("vless", "trojan", "anytls", "ss", "vmess", "hysteria2"):
            self.assertEqual(ua_diff.tier_of(t, "links"), "pending", t)

    def test_links_不在可用表里(self):
        # 上一条是行为断言，这条钉住数据本身：整格移出，而不是留个空集合装样子
        self.assertNotIn("links", ua_diff.USABLE_TYPES_BY_FORMAT)

    def test_shadowrocket_格式没有_ss_vmess_hysteria2_tuic_分支(self):
        # ash.b64 就走这条路：某 UA 多返回一堆 ss://，判成可用会推荐用户换 UA，
        # 换完 clash-to-sing.py 就 ValueError: Unknown type 'ss'
        for t in ("ss", "vmess", "hysteria2", "tuic"):
            self.assertEqual(ua_diff.tier_of(t, "base64"), "pending", t)

    def test_sing_box_格式透传全收(self):
        for t in ("vless", "ss", "vmess", "tuic", "anytls", "hysteria2", "wireguard", "socks"):
            self.assertEqual(ua_diff.tier_of(t, "sing-box"), "usable", t)

    def test_conf_格式下游没有_loader_一律不算可用(self):
        # load_proxies（:1092）只认 clash/shadowrocket/sing-box，conf 读都读不进去
        for t in ("vless", "ss", "trojan", "vmess", "hysteria2"):
            self.assertEqual(ua_diff.tier_of(t, "conf"), "pending", t)

    def test_base64_conf_下游一个节点都读不进来(self):
        """base64 包着的 QX conf：config.json 只能写 shadowrocket，而
        load_shadowrocket_proxies b64decode 之后按 `scheme://` 解析，
        `vless=host:port,…` 会被 urlparse 解成 scheme 为空的垃圾。

        判成可用会给出一条照做就白改的建议，所以与 conf 同档。
        """
        self.assertNotIn("base64-conf", ua_diff.USABLE_TYPES_BY_FORMAT)
        self.assertNotIn("base64-conf", ua_diff.DOWNSTREAM_LOADERS)
        for t in sorted(ua_diff.SING_BOX_KERNEL_TYPES | {"ssr", "snell"}):
            self.assertEqual(
                ua_diff.tier_of(t, "base64-conf"), ua_diff.tier_of(t, "conf"), t
            )

    def test_下游读不了的格式分级完全一致(self):
        """conf 与 links 是同一类事实（下游一个节点都读不进来），结论必须同一个。

        曾经 links 在可用表里、conf 不在，于是同样进不了 config.json 的两种格式，
        一个被排到第一给出推荐、另一个 0 分不推荐。
        """
        for t in sorted(ua_diff.SING_BOX_KERNEL_TYPES | {"ssr", "snell"}):
            self.assertEqual(ua_diff.tier_of(t, "links"), ua_diff.tier_of(t, "conf"), t)

    def test_内核不支持的类型在任何格式下都是不可用(self):
        for fmt in ("clash", "base64", "links", "sing-box", "conf", "unknown"):
            for t in ("ssr", "snell", "juicity"):
                self.assertEqual(ua_diff.tier_of(t, fmt), "unusable", f"{fmt}/{t}")

    def test_可用集合不得超出内核支持范围(self):
        for fmt, types in ua_diff.USABLE_TYPES_BY_FORMAT.items():
            self.assertTrue(types <= ua_diff.SING_BOX_KERNEL_TYPES, fmt)


class ParseSingBoxTest(unittest.TestCase):
    # 取自 cache/nanocloud.json 的真实结构（凭据已脱敏）
    BODY = b"""{
      "log": {"level": "info"},
      "outbounds": [
        {"type": "tuic", "tag": "\\u2747\\ufe0f\\u53cc\\u9c7c\\u5ea7-A(\\u901a\\u7528)",
         "server": "1.2.3.4", "server_port": 443, "uuid": "x"},
        {"type": "vless", "tag": "US-01", "server": "5.6.7.8", "server_port": 8443},
        {"type": "hysteria2", "tag": "HK-01", "server": "9.10.11.12", "server_port": 34567},
        {"type": "selector", "tag": "\\u8282\\u70b9\\u9009\\u62e9", "outbounds": ["US-01"]},
        {"type": "urltest", "tag": "auto", "outbounds": ["US-01"]},
        {"type": "direct", "tag": "direct"}
      ]
    }"""

    def test_只取真实出站(self):
        nodes = ua_diff.parse_nodes(self.BODY, "sing-box")
        self.assertEqual(len(nodes), 3)
        self.assertEqual({n.type for n in nodes}, {"tuic", "vless", "hysteria2"})

    def test_tag_作为节点名(self):
        nodes = ua_diff.parse_nodes(self.BODY, "sing-box")
        self.assertIn("❇️双鱼座-A(通用)", {n.name for n in nodes})

    def test_端口取_server_port(self):
        nodes = ua_diff.parse_nodes(self.BODY, "sing-box")
        by_name = {n.name: n for n in nodes}
        self.assertEqual(by_name["US-01"].port, 8443)
        self.assertEqual(by_name["US-01"].server, "5.6.7.8")

    def test_缺少_server_的出站被跳过(self):
        body = b'{"outbounds":[{"type":"vless","tag":"broken","server_port":443}]}'
        self.assertEqual(ua_diff.parse_nodes(body, "sing-box"), [])

    def test_server_port_非数字字符串被跳过(self):
        """畸形输入：server_port 是非数字字符串，该出站应被跳过而不抛异常。"""
        body = b'{"outbounds":[{"type":"vless","tag":"x","server":"1.2.3.4","server_port":"abc"}]}'
        nodes = ua_diff.parse_nodes(body, "sing-box")
        self.assertEqual(nodes, [])

    def test_顶层_json_是数组时返回空(self):
        """畸形输入：顶层 JSON 是数组而非对象，应返回空列表而不抛 AttributeError。"""
        body = b'[1, 2, 3]'
        nodes = ua_diff.parse_nodes(body, "sing-box")
        self.assertEqual(nodes, [])

    def test_outbounds_是标量时返回空(self):
        """畸形输入：outbounds 键的值是标量（非列表），应返回空列表而不抛 TypeError。"""
        body = b'{"outbounds": 5}'
        nodes = ua_diff.parse_nodes(body, "sing-box")
        self.assertEqual(nodes, [])


class ParseClashTest(unittest.TestCase):
    BODY = (
        b"mixed-port: 7890\n"
        b"proxies:\n"
        b"  - {name: HK-01, server: 1.2.3.4, port: 443, type: vmess, uuid: x}\n"
        b"  - {name: US-01, server: 5.6.7.8, port: 8443, type: ss, cipher: aes-128-gcm}\n"
    )

    @staticmethod
    def fake_yq(body):
        return (
            '{"mixed-port":7890,"proxies":['
            '{"name":"HK-01","server":"1.2.3.4","port":443,"type":"vmess"},'
            '{"name":"US-01","server":"5.6.7.8","port":8443,"type":"ss"}]}'
        )

    def test_从_proxies_取节点(self):
        nodes = ua_diff.parse_nodes(self.BODY, "clash", yq_runner=self.fake_yq)
        self.assertEqual(len(nodes), 2)
        self.assertEqual(nodes[0].name, "HK-01")
        self.assertEqual(nodes[0].type, "vmess")
        self.assertEqual(nodes[1].type, "ss")
        self.assertEqual(nodes[1].port, 8443)

    def test_没有_proxies_键时返回空(self):
        nodes = ua_diff.parse_nodes(b"foo: 1\n", "clash", yq_runner=lambda body: '{"foo":1}')
        self.assertEqual(nodes, [])

    def test_yq_不可用时抛出_YqUnavailable(self):
        def broken(body):
            raise ua_diff.YqUnavailable("yq 不在 PATH 中")

        with self.assertRaises(ua_diff.YqUnavailable):
            ua_diff.parse_nodes(self.BODY, "clash", yq_runner=broken)

    def test_proxies_是标量时返回空(self):
        """畸形输入：proxies 键的值是标量（非列表），应返回空列表而不抛 TypeError。"""
        nodes = ua_diff.parse_nodes(b"", "clash", yq_runner=lambda body: '{"proxies": 5}')
        self.assertEqual(nodes, [])


class ParseLinksTest(unittest.TestCase):
    # 取自 cache/ash.b64 解码后的真实形态（凭据已脱敏）
    REAL = (
        "vless://11111111-2222-3333-4444-555555555555@172.81.111.224:10009"
        "?type=tcp&security=reality&flow=xtls-rprx-vision&sni=www.ebay.com"
        "#%E5%89%A9%E4%BD%99%E6%B5%81%E9%87%8F%EF%BC%9A88.03%20GB\n"
        "vless://11111111-2222-3333-4444-555555555555@172.81.111.225:10009"
        "?type=tcp&security=reality#%F0%9F%87%AD%F0%9F%87%B0HK-01\n"
        "trojan://password@1.2.3.4:443?sni=example.org#US-01\n"
    )

    def test_解析明文链接表(self):
        nodes = ua_diff.parse_nodes(self.REAL.encode(), "links")
        self.assertEqual(len(nodes), 3)
        self.assertEqual(nodes[0].type, "vless")
        self.assertEqual(nodes[0].server, "172.81.111.224")
        self.assertEqual(nodes[0].port, 10009)

    def test_片段解码为节点名(self):
        nodes = ua_diff.parse_nodes(self.REAL.encode(), "links")
        self.assertEqual(nodes[0].name, "剩余流量：88.03 GB")
        self.assertEqual(nodes[1].name, "🇭🇰HK-01")

    def test_base64_包装(self):
        import base64 as _b64
        body = _b64.b64encode(self.REAL.encode())
        self.assertEqual(len(ua_diff.parse_nodes(body, "base64")), 3)

    def test_跳过_STATUS_行与空行(self):
        text = "STATUS=剩余 88GB\n\nvless://uuid@1.2.3.4:443#a\n"
        nodes = ua_diff.parse_nodes(text.encode(), "links")
        self.assertEqual(len(nodes), 1)

    def test_没有端口的链接被跳过(self):
        nodes = ua_diff.parse_nodes(b"vless://uuid@1.2.3.4#a\n", "links")
        self.assertEqual(nodes, [])

    def test_无片段时用行号占位(self):
        nodes = ua_diff.parse_nodes(b"vless://uuid@1.2.3.4:443\n", "links")
        self.assertEqual(nodes[0].name, "Line#0")

    def test_urlparse_自己抛_ValueError_时只跳过该行(self):
        """netloc 含 CJK 等字符时 urlparse 的 NFKC 校验会抛 ValueError。
        不接住的话整次探测被记成「解析失败」，而本该只是少一行节点。"""
        text = (
            "vless://uuid@例\u2100子.com:443#坏行\n"
            "vless://uuid@1.2.3.4:443#好行\n"
        )
        nodes = ua_diff.parse_nodes(text.encode(), "links")
        self.assertEqual([n.name for n in nodes], ["好行"])

    def test_越界端口后跟合法行(self):
        """畸形输入：端口越界（99999），应被跳过不抛异常，后面的合法行应被解析。"""
        text = "vless://uuid@1.2.3.4:99999#bad\nvless://uuid@5.6.7.8:443#good\n"
        nodes = ua_diff.parse_nodes(text.encode(), "links")
        self.assertEqual(len(nodes), 1)
        self.assertEqual(nodes[0].name, "good")
        self.assertEqual(nodes[0].server, "5.6.7.8")
        self.assertEqual(nodes[0].port, 443)

    def test_非数字端口后跟合法行(self):
        """畸形输入：端口非数字（abc），应被跳过不抛异常，后面的合法行应被解析。"""
        text = "vless://uuid@1.2.3.4:abc#bad\nvless://uuid@5.6.7.8:443#good\n"
        nodes = ua_diff.parse_nodes(text.encode(), "links")
        self.assertEqual(len(nodes), 1)
        self.assertEqual(nodes[0].name, "good")
        self.assertEqual(nodes[0].server, "5.6.7.8")
        self.assertEqual(nodes[0].port, 443)


class ParseVmessTest(unittest.TestCase):
    def test_base64_内嵌_json_载荷(self):
        import base64 as _b64, json as _json
        payload = _json.dumps(
            {"v": "2", "ps": "🇯🇵JP-01", "add": "1.2.3.4", "port": "443", "id": "x", "net": "ws"}
        )
        line = "vmess://" + _b64.b64encode(payload.encode()).decode()
        nodes = ua_diff.parse_nodes(line.encode(), "links")
        self.assertEqual(len(nodes), 1)
        self.assertEqual(nodes[0].name, "🇯🇵JP-01")
        self.assertEqual(nodes[0].type, "vmess")
        self.assertEqual(nodes[0].server, "1.2.3.4")
        self.assertEqual(nodes[0].port, 443)

    def test_url_形式的_vmess_回退解析(self):
        nodes = ua_diff.parse_nodes(b"vmess://uuid@5.6.7.8:8443?type=ws#JP-02\n", "links")
        self.assertEqual(len(nodes), 1)
        self.assertEqual(nodes[0].server, "5.6.7.8")
        self.assertEqual(nodes[0].port, 8443)
        self.assertEqual(nodes[0].name, "JP-02")

    def test_载荷缺少_add_时跳过(self):
        import base64 as _b64, json as _json
        line = "vmess://" + _b64.b64encode(_json.dumps({"ps": "x", "port": "443"}).encode()).decode()
        self.assertEqual(ua_diff.parse_nodes(line.encode(), "links"), [])


class ParseConfTest(unittest.TestCase):
    LOON = (
        "[General]\n"
        "ip-mode = dual\n"
        "\n"
        "[Proxy]\n"
        "DIRECT = direct\n"
        "🇭🇰HK-01 = VMess,1.2.3.4,443,chacha20-ietf-poly1305,\"uuid\",transport:ws\n"
        "🇺🇸US-01 = Trojan,5.6.7.8,8443,\"password\",skip-cert-verify:true\n"
        "🇯🇵JP-01 = Hysteria2,9.10.11.12,34567,\"password\"\n"
        "\n"
        "[Proxy Group]\n"
        "节点选择 = select,🇭🇰HK-01\n"
    )

    QX = (
        "[general]\n"
        "network_check_url=http://example.org\n"
        "\n"
        "[server_local]\n"
        "vmess=1.2.3.4:443, method=none, password=uuid, obfs=ws, tag=🇭🇰HK-01\n"
        "trojan=5.6.7.8:8443, password=pw, tls-verification=false, tag=🇺🇸US-01\n"
        "shadowsocks=9.10.11.12:8388, method=aes-128-gcm, password=pw, tag=🇯🇵JP-01\n"
    )

    def test_loon_proxy_段(self):
        nodes = ua_diff.parse_nodes(self.LOON.encode(), "conf")
        self.assertEqual(len(nodes), 3)
        by_name = {n.name: n for n in nodes}
        self.assertEqual(by_name["🇭🇰HK-01"].type, "vmess")
        self.assertEqual(by_name["🇭🇰HK-01"].server, "1.2.3.4")
        self.assertEqual(by_name["🇭🇰HK-01"].port, 443)
        self.assertEqual(by_name["🇯🇵JP-01"].type, "hysteria2")

    def test_loon_忽略_DIRECT_与其他段(self):
        nodes = ua_diff.parse_nodes(self.LOON.encode(), "conf")
        self.assertNotIn("DIRECT", {n.name for n in nodes})
        self.assertNotIn("节点选择", {n.name for n in nodes})

    def test_quantumult_x_server_local_段(self):
        nodes = ua_diff.parse_nodes(self.QX.encode(), "conf")
        self.assertEqual(len(nodes), 3)
        by_name = {n.name: n for n in nodes}
        self.assertEqual(by_name["🇭🇰HK-01"].type, "vmess")
        self.assertEqual(by_name["🇭🇰HK-01"].port, 443)
        self.assertEqual(by_name["🇯🇵JP-01"].type, "ss")
        self.assertEqual(by_name["🇯🇵JP-01"].server, "9.10.11.12")

    def test_quantumult_x_缺少_tag_时用_server_占位(self):
        body = b"[server_local]\nvmess=1.2.3.4:443, method=none\n"
        nodes = ua_diff.parse_nodes(body, "conf")
        self.assertEqual(nodes[0].name, "1.2.3.4")

    def test_跳过注释行(self):
        body = "[Proxy]\n# 注释\n; 另一种注释\nHK = VMess,1.2.3.4,443\n".encode()
        self.assertEqual(len(ua_diff.parse_nodes(body, "conf")), 1)

    def test_字段不足的行被跳过(self):
        body = b"[Proxy]\nbroken = VMess,1.2.3.4\n"
        self.assertEqual(ua_diff.parse_nodes(body, "conf"), [])

    def test_loon_非数字端口后跟合法行(self):
        """畸形输入：端口非数字（abc），应被跳过不抛异常，后面的合法行应被解析。"""
        body = b"[Proxy]\nbad = VMess,1.2.3.4,abc\ngood = VMess,5.6.7.8,443\n"
        nodes = ua_diff.parse_nodes(body, "conf")
        self.assertEqual(len(nodes), 1)
        self.assertEqual(nodes[0].name, "good")
        self.assertEqual(nodes[0].server, "5.6.7.8")
        self.assertEqual(nodes[0].port, 443)

    def test_loon_缺少等号的行被跳过(self):
        """畸形输入：缺少等号分隔符，应被跳过不抛异常。"""
        body = b"[Proxy]\nno_sep VMess 1.2.3.4 443\n"
        self.assertEqual(ua_diff.parse_nodes(body, "conf"), [])

    def test_quantumult_x_非数字端口后跟合法行(self):
        """畸形输入：端口非数字（xyz），应被跳过不抛异常，后面的合法行应被解析。"""
        body = b"[server_local]\nvmess=1.2.3.4:xyz, tag=bad\nvmess=5.6.7.8:443, tag=good\n"
        nodes = ua_diff.parse_nodes(body, "conf")
        self.assertEqual(len(nodes), 1)
        self.assertEqual(nodes[0].name, "good")
        self.assertEqual(nodes[0].server, "5.6.7.8")

    def test_quantumult_x_缺少冒号后跟合法行(self):
        """畸形输入：缺少冒号分隔，server 为空，应被跳过不抛异常。"""
        body = b"[server_local]\nvmess=1.2.3.4, tag=bad\nvmess=5.6.7.8:443, tag=good\n"
        nodes = ua_diff.parse_nodes(body, "conf")
        self.assertEqual(len(nodes), 1)
        self.assertEqual(nodes[0].name, "good")

    def test_没有段头的_loon_裸节点行按形状解析(self):
        nodes = ua_diff.parse_nodes(LOON_BARE.encode(), "conf")
        self.assertEqual(len(nodes), 4)
        by_name = {n.name: n for n in nodes}
        self.assertEqual(by_name["🇭🇰香江-G(流量)"].type, "vless")
        self.assertEqual(by_name["🇭🇰香江-G(流量)"].server, "172.81.111.225")
        self.assertEqual(by_name["🇭🇰香江-G(流量)"].port, 10011)
        self.assertEqual(by_name["🇺🇸美国-D(流量)"].type, "trojan")

    def test_没有段头的_quantumult_x_裸节点行按形状解析(self):
        nodes = ua_diff.parse_nodes(QX_BARE.encode(), "conf")
        self.assertEqual(len(nodes), 3)
        by_name = {n.name: n for n in nodes}
        self.assertEqual(by_name["🇭🇰香港-A(流量)"].type, "vless")
        self.assertEqual(by_name["🇭🇰香港-A(流量)"].server, "172.81.111.224")
        self.assertEqual(by_name["🇭🇰香港-A(流量)"].port, 10009)
        self.assertEqual(by_name["❇️双鱼座-D(流量)"].type, "trojan")

    def test_base64_包装的_conf_先脱壳再解析(self):
        nodes = ua_diff.parse_nodes(QX_BARE_B64, "base64-conf")
        self.assertEqual(len(nodes), 3)
        self.assertEqual({n.type for n in nodes}, {"vless", "trojan"})

    def test_有段头时以段头为准而不是行形状(self):
        """`[general]` 里的 http=host:port 形状上像 QX 节点行，但它在非节点段里。

        段头一旦出现就该以段头为准，否则 Surge/QX 配置里的本地代理、DNS 之类
        会被算成节点，把计数抬高。
        """
        body = (
            "[general]\n"
            "http=127.0.0.1:8080, tag=local\n"
            "\n"
            "[server_local]\n"
            "vmess=5.6.7.8:443, method=none, tag=🇭🇰HK-01\n"
        ).encode()
        nodes = ua_diff.parse_nodes(body, "conf")
        self.assertEqual([n.name for n in nodes], ["🇭🇰HK-01"])

    def test_裸行里的普通配置行被跳过(self):
        body = "ip-mode = dual\n剩余流量：86.88 GB=vless,1.2.3.4,443\ntest-timeout = 5\n".encode()
        nodes = ua_diff.parse_nodes(body, "conf")
        self.assertEqual([n.name for n in nodes], ["剩余流量：86.88 GB"])

    def test_空行和多种注释风格被跳过(self):
        """支持 #、;、// 三种注释形式。"""
        body = (
            "[Proxy]\n"
            "# 井号注释\n"
            "; 分号注释\n"
            "// 斜杠注释\n"
            "   \n"
            "HK = VMess,1.2.3.4,443\n"
        ).encode()
        nodes = ua_diff.parse_nodes(body, "conf")
        self.assertEqual(len(nodes), 1)
        self.assertEqual(nodes[0].name, "HK")


class RateLimiterTest(unittest.TestCase):
    def setUp(self):
        self.now = 0.0
        self.slept = []

    def clock(self):
        return self.now

    def sleeper(self, seconds):
        self.slept.append(seconds)
        self.now += seconds

    def test_首次调用不等待(self):
        limiter = ua_diff.RateLimiter(8.0, clock=self.clock, sleeper=self.sleeper)
        limiter.wait()
        self.assertEqual(self.slept, [])

    def test_连续调用补足间隔(self):
        limiter = ua_diff.RateLimiter(8.0, clock=self.clock, sleeper=self.sleeper)
        limiter.wait()
        limiter.wait()
        self.assertEqual(self.slept, [8.0])

    def test_已经过了足够久就不等待(self):
        limiter = ua_diff.RateLimiter(8.0, clock=self.clock, sleeper=self.sleeper)
        limiter.wait()
        self.now += 20.0
        limiter.wait()
        self.assertEqual(self.slept, [])

    def test_只过了一部分时间就补差额(self):
        limiter = ua_diff.RateLimiter(8.0, clock=self.clock, sleeper=self.sleeper)
        limiter.wait()
        self.now += 3.0
        limiter.wait()
        self.assertEqual(self.slept, [5.0])

    def test_非正的间隔直接拒绝(self):
        """限速是唯一的硬约束，interval<=0 等于没限速，构造时就得炸。"""
        for bad in (0.0, -1.0):
            with self.assertRaises(ValueError):
                ua_diff.RateLimiter(bad, clock=self.clock, sleeper=self.sleeper)

    def test_九次请求的总跨度不低于限速要求(self):
        # 单订阅最多 9 次请求（8 个 UA + 未合并的基准），即 8 个间隔 × 8 秒 = 64 秒跨度。
        limiter = ua_diff.RateLimiter(8.0, clock=self.clock, sleeper=self.sleeper)
        start = self.now
        for _ in range(9):
            limiter.wait()
        self.assertGreaterEqual(self.now - start, 8 * 8.0)

    def test_任意60秒窗口内请求数不超过8(self):
        # 直接断言核心不变量：任意 60 秒滑动窗口内的请求数 ≤ 8。
        # 8 秒间隔下，[t, t+60) 内最多装下 8 次请求（余量为零）。
        limiter = ua_diff.RateLimiter(8.0, clock=self.clock, sleeper=self.sleeper)
        timestamps = []

        # 执行 30 次请求，记录每次 wait() 返回时的时刻
        for _ in range(30):
            limiter.wait()
            timestamps.append(self.now)

        # 扫描所有可能的 60 秒窗口，确认每个窗口内最多 8 次请求
        for window_start in timestamps:
            window_end = window_start + 60.0
            count = sum(1 for t in timestamps if window_start <= t < window_end)
            self.assertLessEqual(count, 8,
                f"窗口 [{window_start}, {window_end}) 包含 {count} 次请求，超过 8 的上限")


# 默认 fmt 用 base64：它是唯一「vless 真能进 config.json」的格式（走 shadowrocket
# loader）。别用 links——明文链接表在下游会被无条件 b64decode 崩掉，一个可用节点都没有。
def _probe(client, version, nodes, *, is_baseline=False, status=200, fmt="base64", error="",
           ua=None, body_len=0, preview=""):
    return ua_diff.Probe(
        client=client, version=version, ua=ua if ua is not None else f"{client}/{version}",
        is_baseline=is_baseline, status=status, fmt=fmt, nodes=nodes, error=error,
        body_len=body_len, preview=preview,
    )


class ClassifyTest(unittest.TestCase):
    def test_按可用性三档归入不同集合(self):
        nodes = [
            ua_diff.Node("HK-01", "vless", "1.1.1.1", 443),
            ua_diff.Node("HK-02", "shadowtls", "2.2.2.2", 443),
            ua_diff.Node("HK-03", "ssr", "3.3.3.3", 443),
        ]
        usable, pending, unusable, pseudo, names = ua_diff.classify(nodes, "base64")
        self.assertEqual(usable, {"vless://1.1.1.1:443"})
        self.assertEqual(pending, {"shadowtls://2.2.2.2:443"})
        self.assertEqual(unusable, {"ssr://3.3.3.3:443"})
        self.assertEqual(pseudo, [])
        self.assertEqual(names, {"HK-01", "HK-02", "HK-03"})

    def test_同一批节点在不同格式下分级不同(self):
        """同一个 vless 节点：base64（shadowrocket loader）可用，clash 下没有分支。"""
        nodes = [ua_diff.Node("HK-01", "vless", "1.1.1.1", 443)]
        self.assertEqual(ua_diff.classify(nodes, "base64")[0], {"vless://1.1.1.1:443"})
        self.assertEqual(ua_diff.classify(nodes, "base64")[1], set())
        self.assertEqual(ua_diff.classify(nodes, "clash")[0], set())
        self.assertEqual(ua_diff.classify(nodes, "clash")[1], {"vless://1.1.1.1:443"})

    def test_伪节点单独收集且不进任何一档(self):
        nodes = [
            ua_diff.Node("剩余流量：88.03 GB", "vless", "1.1.1.1", 443),
            ua_diff.Node("HK-01", "vless", "2.2.2.2", 443),
        ]
        usable, _, _, pseudo, names = ua_diff.classify(nodes, "base64")
        self.assertEqual(usable, {"vless://2.2.2.2:443"})
        self.assertEqual([n.name for n in pseudo], ["剩余流量：88.03 GB"])
        # 伪节点的名字不进 names——否则「仅命名差异」会被套餐余量的波动带偏
        self.assertEqual(names, {"HK-01"})

    def test_重复指纹只算一次(self):
        nodes = [
            ua_diff.Node("HK-01", "vless", "1.1.1.1", 443),
            ua_diff.Node("HK-01-备用", "vless", "1.1.1.1", 443),
        ]
        usable, _, _, _, names = ua_diff.classify(nodes, "base64")
        self.assertEqual(len(usable), 1)
        # 指纹去重，但两个名字都留在 names 里
        self.assertEqual(names, {"HK-01", "HK-01-备用"})


class SummarizeTest(unittest.TestCase):
    SUB = ua_diff.Subscription("ash.b64", "https://example.org/sub", "shadowsocket")

    @staticmethod
    def vless_nodes(count, start=1):
        return [ua_diff.Node(f"N-{i}", "vless", f"10.0.0.{i}", 443) for i in range(start, start + count)]

    def test_按可用节点数降序排列(self):
        probes = [
            _probe("baseline", "—", self.vless_nodes(2), is_baseline=True),
            _probe("loon", "3.5.0", self.vless_nodes(5)),
            _probe("mihomo", "1.19.29", self.vless_nodes(3)),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        self.assertEqual([len(r.usable) for r in report.rows], [5, 3, 2])

    def test_增量相对基准计算(self):
        probes = [
            _probe("baseline", "—", self.vless_nodes(2), is_baseline=True),
            _probe("loon", "3.5.0", self.vless_nodes(5)),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        loon = next(r for r in report.rows if r.probe.client == "loon")
        self.assertEqual(len(loon.added), 3)
        self.assertEqual(loon.removed, set())

    def test_某UA同时拿到三档节点时增量只算usable(self):
        baseline_nodes = self.vless_nodes(2)  # vless://10.0.0.1:443, vless://10.0.0.2:443
        probe_nodes = self.vless_nodes(3) + [
            ua_diff.Node("HK-shadowtls", "shadowtls", "5.5.5.5", 443),  # pending
            ua_diff.Node("HK-ssr", "ssr", "6.6.6.6", 443),  # unusable
        ]
        probes = [
            _probe("baseline", "—", baseline_nodes, is_baseline=True),
            _probe("loon", "3.5.0", probe_nodes),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        loon = next(r for r in report.rows if r.probe.client == "loon")
        # 只有新增的 usable 指纹 vless://10.0.0.3:443 进 added；pending/unusable 档
        # （shadowtls、ssr）即便也是新出现的指纹，也不该混进 added。
        self.assertEqual(loon.added, {"vless://10.0.0.3:443"})
        self.assertEqual(loon.removed, set())

    def test_基准探测失败时不计算虚假增量(self):
        probes = [
            _probe("baseline", "—", [], is_baseline=True, status=0, fmt="unknown", error="连接超时"),
            _probe("loon", "3.5.0", self.vless_nodes(5)),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        loon = next(r for r in report.rows if r.probe.client == "loon")
        # 基准探测失败，真实基准未知，不能把 loon 的全部可用节点当成「新增」。
        self.assertEqual(loon.added, set())
        self.assertEqual(loon.removed, set())

    def test_节点更少的_UA_算作负增量(self):
        probes = [
            _probe("baseline", "—", self.vless_nodes(5), is_baseline=True),
            _probe("sing-box", "1.13.18", self.vless_nodes(2)),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        singbox = next(r for r in report.rows if r.probe.client == "sing-box")
        self.assertEqual(len(singbox.removed), 3)
        self.assertEqual(singbox.added, set())

    def test_推荐可用节点最多的_UA(self):
        probes = [
            _probe("baseline", "—", self.vless_nodes(2), is_baseline=True),
            _probe("loon", "3.5.0", self.vless_nodes(5)),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        self.assertIsNotNone(report.recommended)
        self.assertEqual(report.recommended.probe.client, "loon")

    def test_基准已最优时不给推荐(self):
        probes = [
            _probe("baseline", "—", self.vless_nodes(5), is_baseline=True),
            _probe("loon", "3.5.0", self.vless_nodes(3)),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        self.assertIsNone(report.recommended)

    def test_与基准并列时不给推荐(self):
        probes = [
            _probe("baseline", "—", self.vless_nodes(5), is_baseline=True),
            _probe("loon", "3.5.0", self.vless_nodes(5)),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        self.assertIsNone(report.recommended)

    def test_失败的探测不参与推荐(self):
        probes = [
            _probe("baseline", "—", self.vless_nodes(2), is_baseline=True),
            _probe("loon", "3.5.0", [], status=0, fmt="unknown", error="连接超时"),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        self.assertIsNone(report.recommended)

    def test_拿到同一份列表的_UA_归为一组(self):
        same = self.vless_nodes(3)
        probes = [
            _probe("baseline", "—", same, is_baseline=True),
            _probe("mihomo", "1.19.29", list(same)),
            _probe("loon", "3.5.0", self.vless_nodes(5)),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        sizes = sorted(len(g) for g in report.groups)
        self.assertEqual(sizes, [1, 2])

    def test_只改了节点名时指纹相同而名称集合不同(self):
        """机场四种行为之一就是「改节点名」：FP 一致、NAMES 不同。

        只有 FP 的话这两个 UA 看着完全一样，看不出机场动过手脚。
        """
        original = self.vless_nodes(3)
        renamed = [ua_diff.Node(f"HK-{i}", n.type, n.server, n.port)
                   for i, n in enumerate(original)]
        probes = [
            _probe("baseline", "—", original, is_baseline=True),
            _probe("loon", "3.5.0", renamed),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        self.assertEqual(len(report.groups), 1)  # FP 相同，同一组
        group = report.groups[0]
        self.assertEqual(group[0].all_fingerprints, group[1].all_fingerprints)
        self.assertNotEqual(group[0].names, group[1].names)

    def test_跨格式的同一节点不产生幻影增量(self):
        """基准走 base64（urlparse 小写化主机名），对照走 conf（原样保留）。

        fingerprint 不归一 server 的话，added/removed 会各多出一个幻影条目。
        """
        base_nodes = ua_diff.parse_nodes(b"trojan://pw@Node1.Example.COM:443#HK\n", "links")
        conf_nodes = ua_diff.parse_nodes(
            b"[Proxy]\nHK = Trojan,Node1.Example.COM,443,\"pw\"\n", "conf")
        probes = [
            _probe("baseline", "—", base_nodes, is_baseline=True, fmt="base64"),
            _probe("loon", "3.5.0", conf_nodes, fmt="base64"),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        loon = next(r for r in report.rows if r.probe.client == "loon")
        self.assertEqual(loon.added, set())
        self.assertEqual(loon.removed, set())
        self.assertEqual(len(report.groups), 1)  # 同一份列表，不该被拆成两组

    def test_conf_格式的节点不算可用因此不会被推荐(self):
        """Critical 回归：conf 下游没有 loader，多拉到再多节点也不能推荐。

        照着推荐去改 clash.txt，clash-to-sing.py 连读都读不进去。
        """
        probes = [
            _probe("baseline", "—", self.vless_nodes(3), is_baseline=True, fmt="base64"),
            _probe("loon", "3.5.0", self.vless_nodes(20), fmt="conf"),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        loon = next(r for r in report.rows if r.probe.client == "loon")
        self.assertEqual(loon.usable, set())
        self.assertEqual(len(loon.pending), 20)
        self.assertIsNone(report.recommended)

    def test_links_格式的节点不算可用因此不会被推荐(self):
        """Critical 回归：明文 links 与 conf 同样进不了 config.json，不能给推荐。

        曾经 links 在 USABLE_TYPES_BY_FORMAT 里，于是「返回明文链接表」的 UA 会
        因为可用数最多被排到第一、给出推荐、退出码 1；而同样读不了的 conf 是 0 分
        不推荐——同一类事实两种结论。照着这条推荐去改 clash.txt，下游会对明文做
        base64.b64decode 直接 binascii.Error。
        """
        probes = [
            _probe("baseline", "—", self.vless_nodes(3), is_baseline=True, fmt="base64"),
            _probe("loon", "3.5.0", self.vless_nodes(20), fmt="links"),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        loon = next(r for r in report.rows if r.probe.client == "loon")
        self.assertEqual(loon.usable, set())
        self.assertEqual(len(loon.pending), 20)
        self.assertIsNone(report.recommended)
        # 排序看的是可用数，links 那行不该因为「节点多」占到第一
        self.assertTrue(report.rows[0].probe.is_baseline)
        self.assertEqual(ua_diff.exit_code([report]), 0)

    def test_clash_格式多返回的_vless_不算可用(self):
        """Critical 回归：clash_proxy_to_outbound 没有 vless 分支。

        算成可用就会推荐用户换 UA，换完 update.sh 抛 ValueError 退出。
        """
        probes = [
            _probe("baseline", "—", self.vless_nodes(3), is_baseline=True, fmt="base64"),
            _probe("mihomo", "1.19.29", self.vless_nodes(10), fmt="clash"),
        ]
        report = ua_diff.summarize(self.SUB, probes)
        mihomo = next(r for r in report.rows if r.probe.client == "mihomo")
        self.assertEqual(mihomo.usable, set())
        self.assertIsNone(report.recommended)


class BuildUaPlanTest(unittest.TestCase):
    def test_基准排最前且标记为基准(self):
        sub = ua_diff.Subscription("ash.b64", "https://example.org/sub", "shadowsocket")
        plan = ua_diff.build_ua_plan(sub, None)
        self.assertTrue(plan[0][3])
        self.assertEqual(plan[0][2], "shadowsocket/*")
        self.assertEqual(len(plan), 9)  # 8 个 UA + 1 个基准（基准串不在表里，不合并）

    def test_基准与表中最新_sing_box_项合并(self):
        """subscribe.sh 的串与表里最新 SFA 项一致，两者必须合并成一次请求：
        8 个 UA 而不是 9。合并没生效的话每订阅白发一次、多等 8 秒。"""
        ua_diff.set_baseline_source(ua_diff.BaselineSource(
            "SFA/1.13.18 (sing-box 1.13.18)", "读自 subscribe.sh", True))
        self.addCleanup(ua_diff.set_baseline_source, None)
        sub = ua_diff.Subscription("x", "https://example.org/sub", "sing-box")
        plan = ua_diff.build_ua_plan(sub, None)
        self.assertEqual(len(plan), 8)
        self.assertEqual(sum(1 for entry in plan if entry[3]), 1)
        self.assertEqual(plan[0][0], "sing-box")
        self.assertEqual(plan[0][1], "1.13.18")

    def test_基准串与表里都不同时不合并(self):
        ua_diff.set_baseline_source(ua_diff.BaselineSource(
            "SFA/9.9.9 (sing-box 9.9.9)", "读自 subscribe.sh", True))
        self.addCleanup(ua_diff.set_baseline_source, None)
        sub = ua_diff.Subscription("x", "https://example.org/sub", "sing-box")
        self.assertEqual(len(ua_diff.build_ua_plan(sub, None)), 9)

    def test_按客户端过滤时基准仍保留(self):
        sub = ua_diff.Subscription("ash.b64", "https://example.org/sub", "shadowsocket")
        plan = ua_diff.build_ua_plan(sub, ["mihomo"])
        self.assertEqual(len(plan), 3)  # 基准 + mihomo 两个版本
        self.assertTrue(plan[0][3])


class ProbeSubscriptionTest(unittest.TestCase):
    SUB = ua_diff.Subscription("ash.b64", "https://example.org/sub", "shadowsocket")

    def test_每个_UA_探测一次且限速被调用(self):
        seen = []

        def fetcher(url, ua, timeout):
            seen.append(ua)
            return ua_diff.Response(200, b"vless://uuid@1.2.3.4:443#a\n")

        slept = []
        probes = ua_diff.probe_subscription(
            self.SUB, interval=8.0, timeout=20.0, fetcher=fetcher,
            sleeper=slept.append, clock=lambda: 0.0,
        )
        self.assertEqual(len(probes), 9)
        self.assertEqual(len(seen), 9)
        self.assertEqual(len(slept), 8)  # 首次不等待，其余 8 次各等一轮
        self.assertTrue(all(s == 8.0 for s in slept))

    def test_失败请求也不打断限速节奏(self):
        """核心不变量：每次请求前都必须限速，即便上一次请求失败。

        用事件序列记录 fetch/sleep 的交替顺序（而不是只数 sleep 总次数），
        直接断言「每次请求前都限速」这个规则本身：序列必须严格是
        fetch, sleep, fetch, sleep, ...，第 2、5 次请求失败也不打断这个节奏。
        """
        events = []
        calls = {"n": 0}

        def fetcher(url, ua, timeout):
            calls["n"] += 1
            events.append("fetch")
            if calls["n"] in (2, 5):
                return ua_diff.Response(0, b"", "连接超时")
            return ua_diff.Response(200, b"vless://uuid@1.2.3.4:443#a\n")

        def sleeper(seconds):
            events.append("sleep")

        probes = ua_diff.probe_subscription(
            self.SUB, interval=8.0, timeout=20.0, fetcher=fetcher,
            sleeper=sleeper, clock=lambda: 0.0,
        )
        self.assertEqual(len(probes), 9)
        # 首次请求前不限速，其余 8 次请求前各限速一次，失败不改变这个节奏
        expected = ["fetch"] + ["sleep", "fetch"] * 8
        self.assertEqual(events, expected)

    def test_解析结果写入_probe(self):
        def fetcher(url, ua, timeout):
            return ua_diff.Response(200, b"vless://uuid@1.2.3.4:443#HK-01\n")

        probes = ua_diff.probe_subscription(
            self.SUB, interval=8.0, timeout=20.0, fetcher=fetcher,
            sleeper=lambda s: None, clock=lambda: 0.0,
        )
        self.assertEqual(probes[0].fmt, "links")
        self.assertEqual(probes[0].nodes[0].name, "HK-01")
        self.assertTrue(probes[0].is_baseline)

    def test_单次失败不影响其余(self):
        calls = {"n": 0}

        def fetcher(url, ua, timeout):
            calls["n"] += 1
            if calls["n"] == 2:
                return ua_diff.Response(0, b"", "连接超时")
            return ua_diff.Response(200, b"vless://uuid@1.2.3.4:443#a\n")

        probes = ua_diff.probe_subscription(
            self.SUB, interval=8.0, timeout=20.0, fetcher=fetcher,
            sleeper=lambda s: None, clock=lambda: 0.0,
        )
        self.assertEqual(len(probes), 9)
        failed = [p for p in probes if p.error]
        self.assertEqual(len(failed), 1)
        self.assertEqual(failed[0].error, "连接超时")

    def test_yq_不可用时保留嗅探到的格式并记录错误不抛出(self):
        """实现比 spec 的「降级为 unknown」更好：格式仍记 clash，另置 error。

        这样报告里能看出「这确实是个 clash 订阅，只是环境缺 yq」，而不是含糊的
        unknown。probe.ok 由 error 非空保证为假，不会被误当成有效结果。
        """
        def fetcher(url, ua, timeout):
            return ua_diff.Response(200, b"proxies:\n  - {name: a, server: 1.2.3.4, port: 443, type: vmess}\n")

        def broken_yq(body):
            raise ua_diff.YqUnavailable("yq 不在 PATH 中")

        probes = ua_diff.probe_subscription(
            self.SUB, interval=8.0, timeout=20.0, fetcher=fetcher,
            sleeper=lambda s: None, clock=lambda: 0.0, yq_runner=broken_yq,
        )
        self.assertEqual(probes[0].nodes, [])
        self.assertEqual(probes[0].fmt, "clash")
        self.assertFalse(probes[0].ok)
        self.assertIn("yq", probes[0].error)

    def test_unknown_格式记录字节数与开头(self):
        html = b"<html><head><title>403</title></head><body>\x00blocked</body></html>"

        def fetcher(url, ua, timeout):
            return ua_diff.Response(200, html)

        probes = ua_diff.probe_subscription(
            self.SUB, interval=8.0, timeout=20.0, fetcher=fetcher,
            sleeper=lambda s: None, clock=lambda: 0.0,
        )
        self.assertEqual(probes[0].fmt, "unknown")
        self.assertEqual(probes[0].body_len, len(html))
        self.assertTrue(probes[0].preview.startswith("<html>"))
        self.assertNotIn("\x00", probes[0].preview)  # 控制字符必须转义

    def test_能识别的格式不留存响应开头(self):
        """preview 只为 unknown 的诊断服务；正常响应全是节点凭据，不该带进报告。"""
        def fetcher(url, ua, timeout):
            return ua_diff.Response(200, b"vless://uuid@1.2.3.4:443#a\n")

        probes = ua_diff.probe_subscription(
            self.SUB, interval=8.0, timeout=20.0, fetcher=fetcher,
            sleeper=lambda s: None, clock=lambda: 0.0,
        )
        self.assertEqual(probes[0].preview, "")

    def test_落盘失败不中断该订阅剩余探测(self):
        """--dump 是附带产物，写不进去只该少一份存档，不该吃掉剩下 12 次探测。"""
        def fetcher(url, ua, timeout):
            return ua_diff.Response(200, b"vless://uuid@1.2.3.4:443#a\n")

        with tempfile.TemporaryDirectory() as tmp:
            blocked = Path(tmp) / "not-a-dir"
            blocked.write_bytes(b"")  # 当成目录用会抛 NotADirectoryError（OSError）
            stderr = io.StringIO()
            with contextlib.redirect_stderr(stderr):
                probes = ua_diff.probe_subscription(
                    self.SUB, interval=8.0, timeout=20.0, fetcher=fetcher,
                    sleeper=lambda s: None, clock=lambda: 0.0, dump_dir=blocked,
                )
        self.assertEqual(len(probes), 9)
        self.assertTrue(all(p.ok for p in probes))
        self.assertIn("保存原始响应失败", stderr.getvalue())

    def test_取消事件置位后不再限速也不再请求(self):
        """Ctrl-C 时 worker 要立刻收工，已完成的照常返回。

        断言的是事件序列而不只是请求数：取消之后连一次 sleep 都不该再发生。
        只数请求数的话，「先睡满一个间隔再发现被取消」也能蒙混过关——而正是那个
        多余的等待让 Ctrl-C 卡住最长 96 秒。
        """
        event = threading.Event()
        events = []
        calls = {"n": 0}

        def fetcher(url, ua, timeout):
            calls["n"] += 1
            events.append("fetch")
            if calls["n"] == 3:
                event.set()  # 模拟第 3 次请求期间用户按下 Ctrl-C
            return ua_diff.Response(200, b"vless://uuid@1.2.3.4:443#a\n")

        probes = ua_diff.probe_subscription(
            self.SUB, interval=8.0, timeout=20.0, fetcher=fetcher,
            sleeper=lambda s: events.append("sleep"), clock=lambda: 0.0,
            cancel_event=event,
        )
        # 取消后立刻退出循环：最后一个事件是第 3 次 fetch，后面什么都没有
        self.assertEqual(events, ["fetch", "sleep", "fetch", "sleep", "fetch"])
        self.assertEqual(len(probes), 3)  # 前三次的结果保留

    def test_限速等待期间被取消则不再发请求(self):
        """Ctrl-C 常常正好落在两次请求之间的 8 秒等待里。

        睡醒后必须复查一次，否则会在用户已经中断之后再打出去一次请求。
        """
        event = threading.Event()
        events = []
        sleeps = {"n": 0}

        def fetcher(url, ua, timeout):
            events.append("fetch")
            return ua_diff.Response(200, b"vless://uuid@1.2.3.4:443#a\n")

        def sleeper(seconds):
            sleeps["n"] += 1
            events.append("sleep")
            if sleeps["n"] == 2:
                event.set()  # 第 2 次等待期间用户按下 Ctrl-C

        probes = ua_diff.probe_subscription(
            self.SUB, interval=8.0, timeout=20.0, fetcher=fetcher,
            sleeper=sleeper, clock=lambda: 0.0, cancel_event=event,
        )
        self.assertEqual(events, ["fetch", "sleep", "fetch", "sleep"])
        self.assertEqual(len(probes), 2)

    def test_没有取消事件时不受影响(self):
        """cancel_event 默认为 None，行为与从前完全一致。"""
        def fetcher(url, ua, timeout):
            return ua_diff.Response(200, b"vless://uuid@1.2.3.4:443#a\n")

        probes = ua_diff.probe_subscription(
            self.SUB, interval=8.0, timeout=20.0, fetcher=fetcher,
            sleeper=lambda s: None, clock=lambda: 0.0,
        )
        self.assertEqual(len(probes), 9)

    def test_没注入_sleeper_时限速等待走_cancel_event_wait(self):
        """限速等待必须是可打断的 cancel_event.wait，不能是 time.sleep。

        换回 time.sleep 时全部旧测试照样绿（它们都注入了假 sleeper），但 Ctrl-C
        的响应时间会退化成一整个 interval（生产 interval=8，最坏 8 秒）。
        所以这里**不注入** sleeper，直接钉住真实默认路径。
        """
        captured = {}
        original = ua_diff.RateLimiter

        class Spy(original):
            def __init__(self, interval, clock=None, sleeper=None):
                captured["sleeper"] = sleeper
                super().__init__(interval, clock=clock, sleeper=sleeper)

        event = threading.Event()
        event.set()  # 限速器建好后立刻收工，测试本身一秒都不睡
        ua_diff.RateLimiter = Spy
        try:
            probes = ua_diff.probe_subscription(
                self.SUB, interval=8.0, timeout=20.0,
                fetcher=lambda url, ua, timeout: ua_diff.Response(200, b""),
                clock=lambda: 0.0, cancel_event=event,
            )
        finally:
            ua_diff.RateLimiter = original
        self.assertEqual(probes, [])
        # 绑定方法之间用 == 比（每次取属性都是新对象，is 恒为假）
        self.assertEqual(captured["sleeper"], event.wait)
        self.assertNotEqual(captured["sleeper"], time.sleep)

    def test_中断后限速等待立刻返回而不是睡满一个间隔(self):
        """上一条的行为侧：置位后等待必须马上醒，实测耗时远小于 interval。"""
        event = threading.Event()
        interval = 3.0
        # 第一次 fetch 之后、正卡在限速等待里时置位，模拟 Ctrl-C 落在两次请求之间
        timer = threading.Timer(0.05, event.set)
        timer.daemon = True

        def fetcher(url, ua, timeout):
            return ua_diff.Response(200, b"vless://uuid@1.2.3.4:443#a\n")

        started = time.monotonic()
        timer.start()
        try:
            probes = ua_diff.probe_subscription(
                self.SUB, interval=interval, timeout=20.0, fetcher=fetcher,
                cancel_event=event,  # clock/sleeper 都用真的
            )
        finally:
            timer.cancel()
        elapsed = time.monotonic() - started
        self.assertEqual(len(probes), 1)      # 睡醒后复查，不再发第二次
        self.assertLess(elapsed, interval / 2)  # time.sleep 版会睡满 3 秒

    def test_取消事件一开始就置位则一次请求都不发(self):
        event = threading.Event()
        event.set()
        calls = {"n": 0}

        def fetcher(url, ua, timeout):
            calls["n"] += 1
            return ua_diff.Response(200, b"")

        probes = ua_diff.probe_subscription(
            self.SUB, interval=8.0, timeout=20.0, fetcher=fetcher,
            sleeper=lambda s: None, clock=lambda: 0.0, cancel_event=event,
        )
        self.assertEqual(calls["n"], 0)
        self.assertEqual(probes, [])


class FetchTest(unittest.TestCase):
    def test_成功响应(self):
        class FakeResponse:
            status = 200
            def read(self):
                return b"body"
            def __enter__(self):
                return self
            def __exit__(self, *args):
                return False

        captured = {}

        def opener(request, timeout):
            captured["ua"] = request.get_header("User-agent")
            return FakeResponse()

        resp = ua_diff.fetch("https://example.org/sub", "loon/*", 20.0, opener=opener)
        self.assertEqual(resp.status, 200)
        self.assertEqual(resp.body, b"body")
        self.assertEqual(captured["ua"], "loon/*")

    def test_网络异常转成错误响应(self):
        def opener(request, timeout):
            raise OSError("连接被拒绝")

        resp = ua_diff.fetch("https://example.org/sub", "loon/*", 20.0, opener=opener)
        self.assertEqual(resp.status, 0)
        self.assertIn("连接被拒绝", resp.error)


class DisplayWidthTest(unittest.TestCase):
    def test_ascii(self):
        self.assertEqual(ua_diff.display_width("HK-01"), 5)

    def test_中文占两格(self):
        self.assertEqual(ua_diff.display_width("香港"), 4)

    def test_国旗_emoji_占两格(self):
        self.assertEqual(ua_diff.display_width("🇭🇰"), 2)

    def test_带变体选择符的符号占两格(self):
        self.assertEqual(ua_diff.display_width("❇️"), 2)

    def test_混排(self):
        self.assertEqual(ua_diff.display_width("🇭🇰HK-01"), 7)


class PadTest(unittest.TestCase):
    def test_按显示宽度补齐(self):
        self.assertEqual(ua_diff.pad("香港", 6), "香港  ")
        self.assertEqual(ua_diff.pad("HK", 6), "HK    ")

    def test_超宽不截断(self):
        self.assertEqual(ua_diff.pad("香港节点", 4), "香港节点")


class ExitCodeTest(unittest.TestCase):
    """退出码语义：2 只留给「结论不可信」，不是「有任何一次失败」。

    12 个陌生 UA 里出现 fmt=unknown 是常态而非异常。若它也算 2，退出码就退化成
    常量 2，0/1 永远不可达。只有基准失败（没有参照物）或全部失败（没有数据）才是
    真正不可信。
    """

    SUB = ua_diff.Subscription("ash.b64", "https://example.org/sub", "shadowsocket")

    def _report(self, *, recommended=False, other_failed=False, baseline_failed=False):
        nodes = [ua_diff.Node("a", "vless", "1.1.1.1", 443)]
        base = _probe(
            "(基准)", "—", [] if baseline_failed else nodes, is_baseline=True,
            status=0 if baseline_failed else 200,
            error="连接超时" if baseline_failed else "",
        )
        other = _probe(
            "loon", "3.5.0",
            nodes + [ua_diff.Node("b", "vless", "2.2.2.2", 443)] if recommended else nodes,
            status=0 if other_failed else 200,
            error="连接超时" if other_failed else "",
        )
        return ua_diff.summarize(self.SUB, [base, other])

    def test_基准已最优返回_0(self):
        self.assertEqual(ua_diff.exit_code([self._report()]), 0)

    def test_存在更优_UA_返回_1(self):
        self.assertEqual(ua_diff.exit_code([self._report(recommended=True)]), 1)

    def test_个别_UA_失败仍按_0_返回(self):
        # 报告里已有 ✘ 行逐条告知，不该把整次运行标成失败
        self.assertEqual(ua_diff.exit_code([self._report(other_failed=True)]), 0)

    def test_基准探测失败返回_2(self):
        self.assertEqual(ua_diff.exit_code([self._report(baseline_failed=True)]), 2)

    def test_全部探测失败返回_2(self):
        nodes = []
        probes = [
            _probe("(基准)", "—", nodes, is_baseline=True, status=0, error="连接超时"),
            _probe("loon", "3.5.0", nodes, status=0, error="连接超时"),
        ]
        self.assertEqual(ua_diff.exit_code([ua_diff.summarize(self.SUB, probes)]), 2)

    def test_多个订阅取最大值(self):
        reports = [self._report(recommended=True), self._report(baseline_failed=True)]
        self.assertEqual(ua_diff.exit_code(reports), 2)

    def test_一个订阅有差异另一个没有时返回_1(self):
        reports = [self._report(recommended=True), self._report()]
        self.assertEqual(ua_diff.exit_code(reports), 1)


class TypeHistogramTest(unittest.TestCase):
    def test_按数量降序列出协议分布(self):
        fps = {"vless://1.1.1.1:443", "vless://2.2.2.2:443", "vless://3.3.3.3:443",
               "trojan://4.4.4.4:443"}
        self.assertEqual(ua_diff._type_histogram(fps), "vless×3 trojan×1")

    def test_空集合给出空串(self):
        self.assertEqual(ua_diff._type_histogram(set()), "")


class RenderReportTest(unittest.TestCase):
    SUB = ua_diff.Subscription("ash.b64", "https://example.org/sub", "shadowsocket")

    def _report(self, rec_fmt="base64"):
        base_nodes = [ua_diff.Node(f"N-{i}", "vless", f"10.0.0.{i}", 443) for i in range(3)]
        more = base_nodes + [
            ua_diff.Node("N-9", "vless", "10.0.0.9", 443),
            ua_diff.Node("待支持", "shadowtls", "10.0.1.1", 443),
            ua_diff.Node("剩余流量：88.03 GB", "vless", "10.0.0.0", 443),
        ]
        return ua_diff.summarize(self.SUB, [
            _probe(
                "(基准)", "—", base_nodes, is_baseline=True, fmt="base64",
                ua=ua_diff.baseline_ua(self.SUB.client),
            ),
            _probe("loon", "3.5.0", more, fmt=rec_fmt),
        ])

    def _sized_report(self, base_count, rec_count, fmt="base64", rec_fmt=None):
        """基准 base_count 个 vless、对照 rec_count 个 vless，序号从 1 开始重叠。"""
        def nodes(n, start=1):
            return [ua_diff.Node(f"N-{i}", "vless", f"10.0.0.{i}", 443)
                    for i in range(start, start + n)]
        return ua_diff.summarize(self.SUB, [
            _probe("(基准)", "—", nodes(base_count), is_baseline=True, fmt=fmt,
                   ua=ua_diff.baseline_ua(self.SUB.client)),
            _probe("loon", "3.5.0", nodes(rec_count), fmt=rec_fmt or fmt),
        ])

    def test_含订阅名与基准_UA(self):
        text = ua_diff.render_report(self._report())
        self.assertIn("ash.b64", text)
        self.assertIn("shadowsocket/*", text)

    def test_标出推荐与增量(self):
        text = ua_diff.render_report(self._report())
        self.assertIn("✔ 推荐 loon（+1 可用节点）", text)

    def test_多出的节点逐条列出类型分布(self):
        text = ua_diff.render_report(self._sized_report(2, 5))
        self.assertIn("      多出的 3 个：vless×3", text)

    def test_少了的节点也逐条列出(self):
        # 基准 5 个、对照 2 个（且仍有别的 UA 更优才会进推荐块），这里直接看行本身
        report = self._sized_report(5, 2)
        loon = next(r for r in report.rows if r.probe.client == "loon")
        self.assertEqual(len(loon.removed), 3)
        self.assertEqual(ua_diff._type_histogram(loon.removed), "vless×3")

    def test_单独提示待支持节点(self):
        text = ua_diff.render_report(self._report())
        self.assertIn("另有 1 个属「待支持」（shadowtls×1）", text)
        self.assertIn("clash-to-sing.py 缺分支", text)

    def test_告知伪节点并标明来自哪个_UA(self):
        text = ua_diff.render_report(self._report())
        line = next(l for l in text.splitlines() if "伪节点" in l)
        # 伪节点是逐 UA 统计的，不写清归属会被当成全局结论
        self.assertIn("loon 3.5.0", line)
        self.assertIn("识别到 1 个伪节点", line)
        self.assertIn("剩余流量：88.03 GB", line)

    def test_非wide时超长伪节点名被截断(self):
        nodes = [ua_diff.Node("HK", "vless", "1.1.1.1", 443)] + [
            ua_diff.Node(f"套餐到期：2027-03-{i:02d}", "vless", f"10.0.0.{i}", 443)
            for i in range(1, 12)
        ]
        report = ua_diff.summarize(self.SUB, [
            _probe("(基准)", "—", nodes, is_baseline=True, fmt="base64"),
        ])
        narrow = next(l for l in ua_diff.render_report(report).splitlines() if "伪节点" in l)
        wide = next(l for l in ua_diff.render_report(report, wide=True).splitlines() if "伪节点" in l)
        self.assertTrue(narrow.endswith("…"))
        self.assertFalse(wide.endswith("…"))
        self.assertLess(len(narrow), len(wide))
        self.assertIn("套餐到期：2027-03-11", wide)      # 完整内容只在 --wide 下出现
        self.assertNotIn("套餐到期：2027-03-11", narrow)

    def test_给出建议行并提示_subscribe_sh_的差异(self):
        text = ua_diff.render_report(self._report())
        self.assertIn(
            "      建议行：ash.b64 https://example.org/sub loon", text)
        self.assertIn("subscribe.sh 会把它渲染成 loon/*", text)

    def test_下游读不了的格式明确标注不可直接采用(self):
        """兜底断言：推荐块里出现下游读不了的格式时必须标注。

        summarize 现在已经不会推荐这类格式了（links/conf 一个可用节点都没有），
        所以这里手工把 recommended 指过去——USABLE_TYPES_BY_FORMAT 与
        DOWNSTREAM_LOADERS 是两张表，哪天有人只改了一张，这一层还得兜住。
        """
        report = self._report(rec_fmt="links")
        self.assertIsNone(report.recommended)  # 先钉住：links 本来就不会被推荐
        report.recommended = next(r for r in report.rows if r.probe.client == "loon")
        text = ua_diff.render_report(report)
        self.assertIn("推荐 loon", text)
        self.assertIn("下游 clash-to-sing.py 无法解析此格式（links", text)
        self.assertIn("本推荐不可直接采用", text)

    def test_格式变了但仍受支持时提示改_config_json(self):
        base = [ua_diff.Node(f"T-{i}", "trojan", f"10.0.0.{i}", 443) for i in range(3)]
        more = base + [ua_diff.Node("T-9", "trojan", "10.0.0.9", 443)]
        report = ua_diff.summarize(self.SUB, [
            _probe("(基准)", "—", base, is_baseline=True, fmt="base64",
                   ua=ua_diff.baseline_ua(self.SUB.client)),
            _probe("mihomo", "1.19.29", more, fmt="clash"),
        ])
        text = ua_diff.render_report(report)
        self.assertIn("推荐 mihomo", text)
        self.assertIn("响应格式从 base64 变成了 clash", text)
        self.assertIn("format 改成 clash", text)

    def test_格式没变时不啰嗦格式提示(self):
        text = ua_diff.render_report(self._report())
        self.assertNotIn("无法解析此格式", text)
        self.assertNotIn("响应格式从", text)

    def test_unknown_格式节点数记横杠并报出字节数与开头(self):
        nodes = [ua_diff.Node("HK", "vless", "1.1.1.1", 443)]
        report = ua_diff.summarize(self.SUB, [
            _probe("(基准)", "—", nodes, is_baseline=True, fmt="base64",
                   ua=ua_diff.baseline_ua(self.SUB.client)),
            _probe("loon", "3.5.0", [], fmt="unknown", status=200,
                   body_len=1234, preview="<html>\\n<body>403</body>"),
        ])
        text = ua_diff.render_report(report)
        row_line = next(l for l in text.splitlines() if l.lstrip().startswith("loon"))
        # 表里记 - 而不是 0：0 是解析器的沉默，不是「机场真的给了 0 个节点」。
        # 前四列是 client/version/status/format，后五列才是计数列。
        counts = row_line.split()[4:]
        self.assertEqual(counts, ["-", "—", "-", "-", "-"], row_line)
        # 对照：格式认得出来的行，计数列是真数字
        base_line = next(l for l in text.splitlines() if l.lstrip().startswith("(基准)"))
        self.assertEqual(base_line.split()[4], "1")
        # HTTP 200 + 看不懂的正文时 error 为空，仍必须打诊断行
        diag = next(l for l in text.splitlines() if "无法识别的响应格式" in l)
        self.assertIn("共 1234 字节", diag)
        self.assertIn("<html>\\n<body>403</body>", diag)

    def test_多组节点列表时逐组列出成员(self):
        same = [ua_diff.Node(f"N-{i}", "vless", f"10.0.0.{i}", 443) for i in range(3)]
        report = ua_diff.summarize(self.SUB, [
            _probe("(基准)", "—", same, is_baseline=True, fmt="base64",
                   ua=ua_diff.baseline_ua(self.SUB.client)),
            _probe("mihomo", "1.19.29", list(same), fmt="base64"),
            _probe("loon", "3.5.0", same + [ua_diff.Node("N-9", "vless", "10.0.0.9", 443)],
                   fmt="base64"),
        ])
        text = ua_diff.render_report(report)
        self.assertIn("  ℹ 2 组不同的节点列表：", text)
        self.assertIn("      组 A（4 可用）  loon 3.5.0", text)
        self.assertIn("      组 B（3 可用）  (基准) —, mihomo 1.19.29", text)

    def test_组内可用数随格式不同时标注范围与各自格式(self):
        """真实回归：分组按指纹（与格式无关），可用数却是格式相关的。

        同一批节点在 sing-box 格式下 21 个可用、在 clash 格式下只有 2 个，被分进
        同一组后标签只取了第一行的数字，于是「组 A（21 可用）」里赫然列着一个表里
        写着 2 可用的成员。这个差异是有价值的信息，必须显式呈现。
        """
        same = [ua_diff.Node(f"N-{i}", "vless", f"10.0.0.{i}", 443) for i in range(3)]
        same.append(ua_diff.Node("S-1", "ss", "10.0.1.1", 8388))
        other = [ua_diff.Node("X", "vless", "10.0.9.9", 443)]
        report = ua_diff.summarize(self.SUB, [
            # sing-box 格式透传全收：vless×3 + ss×1 = 4 可用
            _probe("(基准)", "—", same, is_baseline=True, fmt="sing-box",
                   ua=ua_diff.baseline_ua(self.SUB.client)),
            # clash 格式没有 vless 分支：只剩 ss×1 = 1 可用
            _probe("clash-verge", "2.4.7", list(same), fmt="clash"),
            _probe("mihomo", "1.19.29", other, fmt="sing-box"),
        ])
        group_line = next(l for l in ua_diff.render_report(report).splitlines()
                          if "clash-verge" in l and "组 " in l)
        self.assertIn("可用 1–4，随格式而异", group_line)
        # 每个成员标上自己的格式，否则读者无从知道 1 和 4 分别是谁
        self.assertIn("(基准) — [sing-box]", group_line)
        self.assertIn("clash-verge 2.4.7 [clash]", group_line)

    def test_组内可用数一致时保持简洁标签(self):
        same = [ua_diff.Node(f"N-{i}", "vless", f"10.0.0.{i}", 443) for i in range(3)]
        report = ua_diff.summarize(self.SUB, [
            _probe("(基准)", "—", same, is_baseline=True, fmt="base64",
                   ua=ua_diff.baseline_ua(self.SUB.client)),
            _probe("mihomo", "1.19.29", list(same), fmt="base64"),
            _probe("loon", "3.5.0", [ua_diff.Node("X", "vless", "10.0.9.9", 443)],
                   fmt="base64"),
        ])
        text = ua_diff.render_report(report)
        self.assertIn("组 A（3 可用）  (基准) —, mihomo 1.19.29", text)
        self.assertNotIn("随格式而异", text)

    def test_组内格式不同但可用数相同时仍标出格式(self):
        # vless 在 sing-box 与 base64 两种格式下都算可用，数字一样，但格式差异本身
        # 也是结论的一部分（换 UA 要不要同步改 config.json 的 format）
        same = [ua_diff.Node(f"N-{i}", "vless", f"10.0.0.{i}", 443) for i in range(3)]
        report = ua_diff.summarize(self.SUB, [
            _probe("(基准)", "—", same, is_baseline=True, fmt="base64",
                   ua=ua_diff.baseline_ua(self.SUB.client)),
            _probe("mihomo", "1.19.29", list(same), fmt="sing-box"),
            _probe("loon", "3.5.0", [ua_diff.Node("X", "vless", "10.0.9.9", 443)],
                   fmt="base64"),
        ])
        group_line = next(l for l in ua_diff.render_report(report).splitlines()
                          if "mihomo" in l and "组 " in l)
        self.assertIn("（3 可用）", group_line)
        self.assertIn("(基准) — [base64]", group_line)
        self.assertIn("mihomo 1.19.29 [sing-box]", group_line)

    def test_只有一组时不打印分组块(self):
        text = ua_diff.render_report(self._sized_report(3, 3))
        self.assertNotIn("组不同的节点列表", text)

    def test_指纹相同但节点名不同的组标注仅命名差异(self):
        original = [ua_diff.Node(f"N-{i}", "vless", f"10.0.0.{i}", 443) for i in range(3)]
        renamed = [ua_diff.Node(f"HK-{i}", "vless", f"10.0.0.{i}", 443) for i in range(3)]
        other = [ua_diff.Node("X", "vless", "10.0.9.9", 443)]
        report = ua_diff.summarize(self.SUB, [
            _probe("(基准)", "—", original, is_baseline=True, fmt="base64",
                   ua=ua_diff.baseline_ua(self.SUB.client)),
            _probe("loon", "3.5.0", renamed, fmt="base64"),
            _probe("mihomo", "1.19.29", other, fmt="base64"),
        ])
        text = ua_diff.render_report(report)
        renamed_line = next(l for l in text.splitlines() if "loon 3.5.0" in l and "组 " in l)
        self.assertIn("仅命名差异", renamed_line)
        # 只有一个成员的组不该被标注
        solo_line = next(l for l in text.splitlines() if "mihomo" in l and "组 " in l)
        self.assertNotIn("仅命名差异", solo_line)

    def test_节点名一模一样的组不标注仅命名差异(self):
        same = [ua_diff.Node(f"N-{i}", "vless", f"10.0.0.{i}", 443) for i in range(3)]
        report = ua_diff.summarize(self.SUB, [
            _probe("(基准)", "—", same, is_baseline=True, fmt="base64",
                   ua=ua_diff.baseline_ua(self.SUB.client)),
            _probe("loon", "3.5.0", list(same), fmt="base64"),
            _probe("mihomo", "1.19.29", [ua_diff.Node("X", "vless", "10.0.9.9", 443)],
                   fmt="base64"),
        ])
        self.assertNotIn("仅命名差异", ua_diff.render_report(report))

    def test_基准探测失败时增量列显示未知而非虚假数字(self):
        """基准 probe 失败时 baseline.usable 是空集合，不代表真实基准。

        Δ 列若不守卫 baseline.probe.ok，会把「未知」误算成「全部新增」，
        与 summarize() 里 added/removed 的守卫不一致，误导用户。
        """
        nodes = [ua_diff.Node("a", "vless", "1.1.1.1", 443)]
        report = ua_diff.summarize(self.SUB, [
            _probe("(基准)", "—", [], is_baseline=True, status=0, error="连接超时"),
            _probe("loon", "3.5.0", nodes),
        ])
        text = ua_diff.render_report(report)
        loon_line = next(line for line in text.splitlines() if "loon" in line)
        self.assertNotIn("+1", loon_line)
        self.assertIn("—", loon_line)


def _json_dumps(data) -> str:
    import json as _json
    return _json.dumps(data, ensure_ascii=False)


class ReportToDictTest(unittest.TestCase):
    def test_可以_json_序列化(self):
        import json as _json
        sub = ua_diff.Subscription("ash.b64", "https://example.org/sub", "shadowsocket")
        nodes = [ua_diff.Node("a", "vless", "1.1.1.1", 443)]
        report = ua_diff.summarize(sub, [
            _probe("(基准)", "—", nodes, is_baseline=True),
            _probe("loon", "3.5.0", nodes + [ua_diff.Node("b", "vless", "2.2.2.2", 443)]),
        ])
        data = ua_diff.report_to_dict(report)
        _json.dumps(data)  # 不抛异常即可
        self.assertEqual(data["subscription"]["name"], "ash.b64")
        self.assertEqual(data["recommended"]["client"], "loon")

    def test_默认打码订阅_URL(self):
        sub = ua_diff.Subscription("ash.b64", "https://example.org/sub?token=aaa", "shadowsocket")
        nodes = [ua_diff.Node("a", "vless", "1.1.1.1", 443)]
        report = ua_diff.summarize(sub, [_probe("(基准)", "—", nodes, is_baseline=True)])
        data = ua_diff.report_to_dict(report)
        # --json 常被重定向成文件再顺手分享，默认不该带 token
        self.assertNotIn("token=aaa", _json_dumps(data))
        self.assertTrue(data["subscription"]["url_masked"])

    def test_show_url_时还原完整_URL(self):
        sub = ua_diff.Subscription("ash.b64", "https://example.org/sub?token=aaa", "shadowsocket")
        nodes = [ua_diff.Node("a", "vless", "1.1.1.1", 443)]
        report = ua_diff.summarize(sub, [_probe("(基准)", "—", nodes, is_baseline=True)])
        data = ua_diff.report_to_dict(report, show_url=True)
        self.assertEqual(data["subscription"]["url"], "https://example.org/sub?token=aaa")
        self.assertFalse(data["subscription"]["url_masked"])

    def test_名称集合进入结构化输出(self):
        sub = ua_diff.Subscription("ash.b64", "https://example.org/sub", "shadowsocket")
        nodes = [ua_diff.Node("🇭🇰HK-01", "vless", "1.1.1.1", 443)]
        report = ua_diff.summarize(sub, [_probe("(基准)", "—", nodes, is_baseline=True)])
        data = ua_diff.report_to_dict(report)
        self.assertEqual(data["rows"][0]["names"], ["🇭🇰HK-01"])


class RenderReportAlignmentTest(unittest.TestCase):
    """整合测试：验证 render_report 输出的表格在真实显示宽度下逐列对齐。

    CLIENT 列塞进国旗 emoji（🇭🇰HK-01）、带变体选择符的符号（❇️双鱼座-A(通用)）、
    纯 ASCII（plainascii）三种混排内容——这是 display_width 最容易出错的组合。
    用正则定位每行每个 token 的字符起点，再用 display_width 换算成显示宽度偏移；
    这个偏移量的计算独立于 render_report 内部怎么 pad，只要输出在视觉上真的对齐，
    所有行同一列的偏移量就必须相等。如果 render_report 退化成用 len() 而不是
    display_width 对齐，这里就会露馅（DisplayWidthTest/PadTest 只测了单元，测不出
    这种集成层的错位）。
    """

    SUB = ua_diff.Subscription("ash.b64", "https://example.org/sub", "shadowsocket")

    @staticmethod
    def _token_offsets(line: str) -> list[int]:
        """每个非空白 token 的起始位置，按显示宽度（而不是字符数）计算。"""
        return [ua_diff.display_width(line[: m.start()]) for m in re.finditer(r"\S+", line)]

    def test_混排宽字符列对齐(self):
        nodes = [ua_diff.Node("a", "vless", "1.1.1.1", 443)]
        report = ua_diff.summarize(self.SUB, [
            _probe(
                "(基准)", "—", nodes, is_baseline=True,
                ua=ua_diff.baseline_ua(self.SUB.client),
            ),
            _probe("🇭🇰HK-01", "1.0", nodes),
            _probe("❇️双鱼座-A(通用)", "2.0", nodes),
            _probe("plainascii", "3.0", nodes),
        ])
        text = ua_diff.render_report(report)
        lines = text.splitlines()

        header_line = next(l for l in lines if l.startswith("  CLIENT"))
        names = ("(基准)", "🇭🇰HK-01", "❇️双鱼座-A(通用)", "plainascii")
        data_lines = [l for l in lines if any(l.lstrip(" ").startswith(n) for n in names)]
        self.assertEqual(len(data_lines), 4)  # 一行不多、一行不少

        header_offsets = self._token_offsets(header_line)
        self.assertEqual(len(header_offsets), 9)  # 9 列表头
        for line in data_lines:
            offsets = self._token_offsets(line)
            # 数据行至少 9 列；基准行还多一个「←当前」token，只比较前 9 列的起点
            self.assertEqual(offsets[:9], header_offsets, f"列错位：{line!r}")


class BuildFetcherTest(unittest.TestCase):
    """--no-proxy 的取舍逻辑：build_fetcher 决定要不要绕开环境变量代理。"""

    def test_默认沿用环境变量代理(self):
        # 不额外包一层，直接就是 fetch 本身——probe_subscription 传 fetcher=None
        # 时也会退回 fetch，行为不变。
        self.assertIs(ua_diff.build_fetcher(False), ua_diff.fetch)

    def test_no_proxy_时传入绕开代理的_opener(self):
        captured = {}

        def fake_fetch(url, ua, timeout, opener=None):
            captured["url"] = url
            captured["ua"] = ua
            captured["timeout"] = timeout
            captured["opener"] = opener
            return ua_diff.Response(200, b"body")

        original_fetch = ua_diff.fetch
        ua_diff.fetch = fake_fetch
        try:
            fetcher = ua_diff.build_fetcher(True)
            resp = fetcher("https://example.org/sub", "loon/*", 5.0)
        finally:
            ua_diff.fetch = original_fetch

        self.assertEqual(resp.status, 200)
        self.assertEqual(captured["url"], "https://example.org/sub")
        self.assertEqual(captured["ua"], "loon/*")
        self.assertEqual(captured["timeout"], 5.0)
        # 传下去的 opener 必须是绕开代理的那个，不是默认的 None（urlopen）
        self.assertIs(captured["opener"], ua_diff._direct_opener)


class MainTest(unittest.TestCase):
    """main(argv) 的参数级测试。

    这一层原本零覆盖，`--client` 写错名字会静默退化成「只测基准」然后自信地报
    「当前 UA 已最优」就是从这个缺口漏出来的。全部离线：fetcher / sleeper / clock
    走 main 的注入点，一次真实请求都不发、一秒都不睡。
    """

    LIST = (
        "ash.b64 https://example.org/sub?token=aaa shadowsocket\n"
        "# 注释掉的订阅不该被测\n"
        "#xipcloud.yaml https://example.org/clash/bbb clash\n"
        "nanocloud.json https://example.org/verify?token=ccc sing-box\n"
    )
    LINKS = b"vless://uuid@1.2.3.4:443#HK-01\n"

    @staticmethod
    def b64(links: bytes) -> bytes:
        """包成 base64 订阅体。

        主流程的默认响应必须是 base64 而不是明文 links：只有 base64 走
        shadowrocket loader、vless 才真进得了 config.json。用明文的话每个 UA 的
        可用数都是 0，「存在更优 UA」这条路径根本测不到。
        """
        return base64.b64encode(links)

    BODY = base64.b64encode(LINKS)

    def setUp(self):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.root = Path(tmp.name)
        self.list_file = self.root / "clash.txt"
        self.list_file.write_text(self.LIST, encoding="utf-8")
        self.subscribe_sh = self.root / "subscribe.sh"
        self.subscribe_sh.write_text(SUBSCRIBE_SH, encoding="utf-8")
        # main() 会设定全局基准来源，不复位会污染后面的测试
        self.addCleanup(ua_diff.set_baseline_source, None)
        self.requests = []

    def _fetcher(self, url, ua, timeout):
        self.requests.append((url, ua))
        return ua_diff.Response(200, self.BODY)

    def run_main(self, *argv, fetcher=None):
        """跑一次 main，返回 (退出码, stdout, stderr)。"""
        out, err = io.StringIO(), io.StringIO()
        with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
            code = ua_diff.main(
                ["-f", str(self.list_file), "--subscribe-sh", str(self.subscribe_sh), *argv],
                fetcher=fetcher or self._fetcher,
                sleeper=lambda seconds: None,
                clock=lambda: 0.0,
            )
        return code, out.getvalue(), err.getvalue()

    # ---- --only / --client 过滤 ----

    def test_默认测清单里全部有效订阅(self):
        code, out, _ = self.run_main()
        self.assertEqual(code, 0)
        # ash.b64（shadowsocket）9 次 + nanocloud.json（sing-box，基准与最新 SFA 合并）8 次
        self.assertEqual(len(self.requests), 17)
        self.assertIn("ash.b64", out)
        self.assertIn("nanocloud.json", out)
        self.assertNotIn("xipcloud", out)  # 注释行不该被测

    def test_only_只测指定订阅(self):
        code, out, _ = self.run_main("--only", "ash.b64")
        self.assertEqual(code, 0)
        self.assertEqual({url for url, _ in self.requests},
                         {"https://example.org/sub?token=aaa"})
        self.assertNotIn("nanocloud.json", out)

    def test_only_没有匹配项时返回_2(self):
        code, _, err = self.run_main("--only", "不存在的订阅")
        self.assertEqual(code, 2)
        self.assertEqual(self.requests, [])
        self.assertIn("没有可测的订阅", err)

    def test_client_过滤只发该客户端的_UA(self):
        code, _, _ = self.run_main("--only", "ash.b64", "--client", "mihomo")
        self.assertEqual(code, 0)
        # 基准 + mihomo 两个版本
        self.assertEqual(len(self.requests), 3)
        uas = [ua for _, ua in self.requests]
        self.assertEqual(uas[0], "shadowsocket/*")
        self.assertTrue(all(u.startswith("mihomo/") for u in uas[1:]))

    def test_client_写错名字直接报错而不是静默退化(self):
        """写错名字会让计划只剩基准一项，然后发一次请求就宣布「已最优」。"""
        for bad in ("mihomoo", "Mihomo", "MIHOMO"):
            with self.subTest(bad=bad):
                with self.assertRaises(SystemExit) as ctx:
                    self.run_main("--client", bad)
                self.assertEqual(ctx.exception.code, 2)  # argparse 的 error 用 2
                self.assertEqual(self.requests, [])

    def test_client_报错时列出可选值(self):
        err = io.StringIO()
        with contextlib.redirect_stderr(err), self.assertRaises(SystemExit):
            ua_diff.main(["-f", str(self.list_file), "--client", "mihomoo"],
                         fetcher=self._fetcher, sleeper=lambda s: None, clock=lambda: 0.0)
        for client in ua_diff.UA_TABLE:
            self.assertIn(client, err.getvalue())

    # ---- 限速校验 ----

    def test_间隔低于阈值直接拒绝而不是仅告警(self):
        """限速是唯一的硬约束，唯一的执行点不能只是一句 stderr。"""
        for bad in ("0", "1.5", "7.4"):
            with self.subTest(interval=bad):
                with self.assertRaises(SystemExit):
                    self.run_main("--interval", bad)
                self.assertEqual(self.requests, [])

    def test_负间隔也拒绝(self):
        with self.assertRaises(SystemExit):
            self.run_main("--interval", "-5")
        self.assertEqual(self.requests, [])

    def test_默认间隔是_8_秒(self):
        # 8.0 是用户明确定过的值（7.5 次/分钟，安全低于 8 次/分钟的限速要求）
        code, _, err = self.run_main("--only", "ash.b64")
        self.assertEqual(code, 0)
        self.assertIn("间隔 8.0s", err)

    def test_force_interval_显式放行压测(self):
        code, _, _ = self.run_main("--only", "ash.b64", "--interval", "0.1", "--force-interval")
        self.assertEqual(code, 0)
        self.assertEqual(len(self.requests), 9)

    def test_force_interval_也不放行非正间隔(self):
        with self.assertRaises(SystemExit):
            self.run_main("--interval", "0", "--force-interval")
        self.assertEqual(self.requests, [])

    # ---- --dump ----

    def test_默认不落盘(self):
        self.run_main("--only", "ash.b64")
        self.assertEqual(sorted(p.name for p in self.root.iterdir()),
                         ["clash.txt", "subscribe.sh"])

    def test_dump_写盘且目录权限为_700(self):
        dump = self.root / "dump"
        code, _, _ = self.run_main("--only", "ash.b64", "--dump", str(dump))
        self.assertEqual(code, 0)
        files = sorted(p.name for p in dump.iterdir())
        self.assertEqual(len(files), 9)
        self.assertTrue(all(f.startswith("ash.b64.") and f.endswith(".raw") for f in files))
        self.assertEqual((dump / files[0]).read_bytes(), self.BODY)
        # 落盘内容是完整订阅响应，含全部节点凭据，别人不该读得到
        self.assertEqual(stat.S_IMODE(dump.stat().st_mode), 0o700)

    def test_dump_目录已存在且权限过松时收紧(self):
        dump = self.root / "dump"
        dump.mkdir(mode=0o755)
        self.run_main("--only", "ash.b64", "--dump", str(dump))
        self.assertEqual(stat.S_IMODE(dump.stat().st_mode), 0o700)

    def test_dump_目录建不出来时给人话而不是_traceback(self):
        """路径被一个普通文件占了。紧随其后的 chmod 早就有 try，这里不该裸奔。"""
        blocked = self.root / "occupied"
        blocked.write_text("我是个文件不是目录", encoding="utf-8")
        code, out, err = self.run_main("--only", "ash.b64", "--dump", str(blocked))
        self.assertEqual(code, 2)
        self.assertIn("无法创建 --dump 目录", err)
        self.assertIn(str(blocked), err)
        self.assertNotIn("Traceback", err)
        self.assertEqual(self.requests, [])  # 建不出来就别开始探测
        self.assertEqual(out, "")

    # ---- 输出分支 ----

    def test_json_分支输出可解析且默认打码(self):
        import json as _json
        code, out, _ = self.run_main("--only", "ash.b64", "--json")
        self.assertEqual(code, 0)
        data = _json.loads(out)
        self.assertEqual(len(data), 1)
        self.assertEqual(data[0]["subscription"]["name"], "ash.b64")
        self.assertNotIn("token=aaa", out)
        self.assertNotIn("▌", out)  # 不该混进终端报告

    def test_json_里带基准_UA_的来源(self):
        """机器可读那一路也该看得见 provenance：读自 subscribe.sh 还是内置兜底，
        决定了整份增量可不可信。"""
        import json as _json
        _, out, _ = self.run_main("--only", "nanocloud.json", "--json")
        source = _json.loads(out)[0]["baseline_source"]
        self.assertEqual(source["ua"], "SFA/1.13.18 (sing-box 1.13.18)")
        self.assertEqual(source["note"], "读自 subscribe.sh")
        self.assertTrue(source["from_file"])

    def test_json_里的来源在兜底时也说清楚(self):
        import json as _json
        _, out, _ = self.run_main(
            "--only", "nanocloud.json", "--json", "--subscribe-sh", str(self.root / "缺失.sh"))
        source = _json.loads(out)[0]["baseline_source"]
        self.assertFalse(source["from_file"])
        self.assertIn("内置兜底", source["note"])

    def test_json_加_show_url_时保留完整_URL(self):
        code, out, _ = self.run_main("--only", "ash.b64", "--json", "--show-url")
        self.assertEqual(code, 0)
        self.assertIn("token=aaa", out)

    # ---- 报告排版与基准 UA 来源 ----

    def test_首份报告前也有空行(self):
        """汇总行（stderr）与第一份报告贴在一起时读起来像同一段，
        而订阅之间是空开的，节奏不一致。"""
        code, out, _ = self.run_main("--only", "ash.b64")
        self.assertEqual(code, 0)
        self.assertTrue(out.startswith("\n▌ ash.b64"), repr(out[:40]))

    def test_订阅之间仍然空一行(self):
        code, out, _ = self.run_main()
        self.assertEqual(code, 0)
        self.assertIn("\n\n▌ nanocloud.json", out)

    def test_报告标明基准_UA_读自_subscribe_sh(self):
        code, out, _ = self.run_main("--only", "nanocloud.json")
        self.assertEqual(code, 0)
        self.assertIn("基准 UA: SFA/1.13.18 (sing-box 1.13.18)（读自 subscribe.sh）", out)

    def test_基准_UA_跟着_subscribe_sh_改而不是钉在常量上(self):
        """subscribe.sh 升过版而这边没跟上，报告里的基准 UA 就是假的——
        而每一个增量都是相对它算的。"""
        self.subscribe_sh.write_text(
            SUBSCRIBE_SH.replace("1.13.18", "9.9.9"), encoding="utf-8")
        code, out, _ = self.run_main("--only", "nanocloud.json")
        self.assertEqual(code, 0)
        self.assertIn("基准 UA: SFA/9.9.9 (sing-box 9.9.9)（读自 subscribe.sh）", out)
        # 真发出去的也得是它
        self.assertIn("SFA/9.9.9 (sing-box 9.9.9)", [ua for _, ua in self.requests])
        # 与表里最新项不再相同，于是不合并：9 次而不是 8 次
        self.assertEqual(len(self.requests), 9)

    def test_subscribe_sh_不存在时报告标明内置兜底(self):
        code, out, _ = self.run_main(
            "--only", "nanocloud.json", "--subscribe-sh", str(self.root / "缺失.sh"))
        self.assertEqual(code, 0)
        self.assertIn("SFA/1.13.18 (sing-box 1.13.18)", out)
        self.assertIn("内置兜底", out)
        self.assertNotIn("读自 subscribe.sh", out)

    def test_非_sing_box_订阅不标来源(self):
        """shadowsocket/* 是本脚本的内置规则，不来自 subscribe.sh 的那行赋值。"""
        code, out, _ = self.run_main("--only", "ash.b64")
        self.assertEqual(code, 0)
        self.assertIn("基准 UA: shadowsocket/*", out)
        self.assertNotIn("读自 subscribe.sh", out)

    def test_subscribe_sh_的_else_分支变了时告警但不中断(self):
        self.subscribe_sh.write_text(
            SUBSCRIBE_SH.replace('AGENT="$CLIENT/*"', 'AGENT="$CLIENT/1.0"'),
            encoding="utf-8",
        )
        code, out, err = self.run_main("--only", "ash.b64")
        self.assertEqual(code, 0)                 # 只告警，照跑
        self.assertIn("$CLIENT/*", err)
        self.assertIn("▌ ash.b64", out)
        self.assertNotIn("$CLIENT/*", out)        # 告警走 stderr，别混进报告

    def test_默认走终端报告而不是_JSON(self):
        code, out, _ = self.run_main("--only", "ash.b64")
        self.assertEqual(code, 0)
        self.assertIn("▌ ash.b64", out)
        self.assertIn("CLIENT", out)

    def test_读不了清单文件返回_2(self):
        out, err = io.StringIO(), io.StringIO()
        with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
            code = ua_diff.main(["-f", str(self.root / "nope.txt")],
                                fetcher=self._fetcher, sleeper=lambda s: None,
                                clock=lambda: 0.0)
        self.assertEqual(code, 2)
        self.assertIn("读不了订阅清单", err.getvalue())
        self.assertEqual(self.requests, [])

    # ---- 退出码的三条真实返回路径 ----

    def test_退出码_0_当前_UA_已最优(self):
        code, out, _ = self.run_main("--only", "ash.b64")
        self.assertEqual(code, 0)
        self.assertIn("当前 UA 已最优", out)

    def test_退出码_1_存在更优_UA(self):
        def fetcher(url, ua, timeout):
            links = self.LINKS
            if ua.startswith("mihomo/v1.19.29"):
                links += b"vless://uuid@5.6.7.8:443#HK-02\n"
            return ua_diff.Response(200, self.b64(links))

        code, out, _ = self.run_main("--only", "ash.b64", fetcher=fetcher)
        self.assertEqual(code, 1)
        self.assertIn("推荐 mihomo", out)

    def test_返回明文_links_的_UA_节点再多也不推荐(self):
        """集成回归：links 下游会被无条件 b64decode 崩掉，不算收益。

        曾经 links 在可用表里：这个 UA 会因为「可用数最多」排第一、给出推荐、
        退出码 1，用户照做后 clash-to-sing.py 直接 binascii.Error。
        """
        def fetcher(url, ua, timeout):
            if ua.startswith("mihomo/v1.19.29"):
                # 明文链接表，而且节点数是基准的 5 倍
                return ua_diff.Response(200, b"".join(
                    b"vless://uuid@10.0.0.%d:443#N-%d\n" % (i, i) for i in range(1, 6)))
            return ua_diff.Response(200, self.BODY)

        code, out, _ = self.run_main("--only", "ash.b64", fetcher=fetcher)
        self.assertEqual(code, 0)
        self.assertNotIn("推荐 mihomo", out)
        self.assertIn("当前 UA 已最优", out)
        # 但不能装作没看见：那 5 个节点要出现在「待支持」列里
        row_line = next(l for l in out.splitlines() if "mihomo" in l and "1.19.29" in l)
        self.assertIn("links", row_line)
        self.assertRegex(row_line, r"\s0\s")   # 可用 0
        self.assertIn("5", row_line)            # 待支持 5

    def test_退出码_2_基准探测失败(self):
        def fetcher(url, ua, timeout):
            if ua == "shadowsocket/*":
                return ua_diff.Response(0, b"", "连接超时")
            return ua_diff.Response(200, self.BODY)

        code, out, _ = self.run_main("--only", "ash.b64", fetcher=fetcher)
        self.assertEqual(code, 2)
        self.assertIn("基准 UA 探测失败", out)

    def test_个别_UA_拿到_HTML_不影响退出码(self):
        """8 个陌生 UA 里出现 unknown 是常态，不该把退出码钉死在 2。"""
        def fetcher(url, ua, timeout):
            if ua.startswith("Shadowrocket/"):
                return ua_diff.Response(200, b"<html><body>403 forbidden</body></html>")
            return ua_diff.Response(200, self.BODY)

        code, out, _ = self.run_main("--only", "ash.b64", fetcher=fetcher)
        self.assertEqual(code, 0)
        self.assertIn("无法识别的响应格式", out)  # 但报告里必须说清楚

    def test_中断时输出已完成的部分并返回_2(self):
        """spec「错误处理」节：Ctrl-C 优雅退出，已完成的部分照常输出。

        从前用 `with ThreadPoolExecutor`，__exit__ 是 shutdown(wait=True)，异常传播时
        先把所有 worker 等完（max_workers == 订阅数，一个都取消不掉），于是 Ctrl-C
        先卡住最长 12×interval 秒、再把结果全丢掉——比不处理还糟。
        """
        original = ua_diff.as_completed

        def interrupt_after_all(fs, *args, **kwargs):
            for done in original(fs, *args, **kwargs):
                yield done
            raise KeyboardInterrupt  # 模拟主线程收到 SIGINT

        ua_diff.as_completed = interrupt_after_all
        try:
            code, out, err = self.run_main("--only", "ash.b64")
        finally:
            ua_diff.as_completed = original

        self.assertEqual(code, 2)
        self.assertIn("已中断", err)
        self.assertIn("▌ ash.b64", out)  # 已完成的报告照常输出，不是空手而归

    def test_worker_抛异常时出声并把退出码抬到_2(self):
        """worker 异常不能被静默吞掉。

        原本按 `f.exception() is None` 过滤：抛异常的订阅从报告里**整个消失**、
        stderr 一个字都没有、退出码还是 0「当前 UA 已最优」——和 --client 拼错
        是同一类「静默退化成一个自信的错误结论」。
        """
        def fetcher(url, ua, timeout):
            if "verify" in url:  # nanocloud.json 那条
                raise RuntimeError("worker 内部炸了")
            self.requests.append((url, ua))
            return ua_diff.Response(200, self.BODY)

        code, out, err = self.run_main(fetcher=fetcher)
        self.assertEqual(code, 2)
        self.assertIn("nanocloud.json", err)          # 说清是哪个订阅
        self.assertIn("RuntimeError", err)            # 说清异常是什么
        self.assertIn("worker 内部炸了", err)
        self.assertIn("▌ ash.b64", out)               # 另一个订阅照常出报告
        self.assertNotIn("▌ nanocloud.json", out)

    def test_中断落在请求进行中时仍输出已完成的部分(self):
        """SIGINT 落在 fetch 进行中——现实里绝大多数 Ctrl-C 都是这个时刻。

        main 收到 KeyboardInterrupt 时 future 还没 done，必须先 wait 在途的那一下，
        否则 `f.done()` 一律为假、报告一行都没有。原有的中断测试是在所有 future
        跑完之后才抛 KeyboardInterrupt，钉不住这条。
        """
        in_fetch = threading.Event()

        def fetcher(url, ua, timeout):
            self.requests.append((url, ua))
            in_fetch.set()
            time.sleep(0.3)  # 请求在途
            return ua_diff.Response(200, self.BODY)

        original = ua_diff.as_completed

        def interrupt_mid_flight(fs, *args, **kwargs):
            in_fetch.wait(5)       # 等到 worker 确实卡在请求里
            raise KeyboardInterrupt
            yield  # noqa —— 让它是个生成器

        ua_diff.as_completed = interrupt_mid_flight
        try:
            code, out, err = self.run_main("--only", "ash.b64", fetcher=fetcher)
        finally:
            ua_diff.as_completed = original

        self.assertEqual(code, 2)
        self.assertIn("已中断", err)
        # 关键断言：在途请求收尾后，那一次探测的结果照常进报告，不是空手而归
        self.assertIn("▌ ash.b64", out)
        self.assertIn("CLIENT", out)
        self.assertGreaterEqual(len(out.splitlines()), 4)

    def test_预估耗时按实际请求数算(self):
        _, _, err = self.run_main("--only", "ash.b64", "--client", "mihomo")
        self.assertIn("最多每个 3 次请求", err)


# ---------------------------------------------------------------- 进度显示

# 进度行里除了 detail 之外的部分都是对齐骨架，detail 的**起始列**必须与订阅名无关。
ANSI = re.compile(r"\x1b\[")


def replay_ansi(text: str) -> list[str]:
    """把一段带 ANSI 的输出回放成「最终屏幕上长什么样」。

    只实现本脚本用得到的几个序列，够用即可：`\\r`、`\\n`（终端 ONLCR，当 CRLF 算）、
    `CUU`（`\\033[NA` 上移）、`EL`（`\\033[K` 清到行尾）、`ED`（`\\033[J` 清到屏幕尾）。

    有它才测得了「进度块活着时插进来的输出会不会被下一帧盖掉」——光看字节流是看不出
    这件事的，被盖掉的字节仍然在流里。
    """
    screen: list[list[str]] = [[]]
    row = col = 0
    index = 0

    def ensure(target: int) -> None:
        while len(screen) <= target:
            screen.append([])

    while index < len(text):
        char = text[index]
        if char == "\x1b" and text[index + 1:index + 2] == "[":
            end = index + 2
            while end < len(text) and not text[end].isalpha():
                end += 1
            params, cmd = text[index + 2:end], text[end:end + 1]
            count = int(params) if params.isdigit() else 1
            if cmd == "A":
                row = max(0, row - count)
            elif cmd == "K":
                ensure(row)
                del screen[row][col:]
            elif cmd == "J":
                ensure(row)
                del screen[row][col:]
                del screen[row + 1:]
            index = end + 1
            continue
        if char == "\r":
            col = 0
        elif char == "\n":
            row += 1
            col = 0
            ensure(row)
        else:
            ensure(row)
            line = screen[row]
            while len(line) < col:
                line.append(" ")
            if col < len(line):
                line[col] = char
            else:
                line.append(char)
            col += 1
        index += 1
    return ["".join(line).rstrip() for line in screen]


class ReplayAnsiTest(unittest.TestCase):
    """回放器自己也得测——它是下面几条断言的量具。"""

    def test_上移后重写会覆盖原内容(self):
        self.assertEqual(replay_ansi("一\n二\n\x1b[2A\r\x1b[K三\n"), ["三", "二", ""])

    def test_清屏到末尾(self):
        self.assertEqual(replay_ansi("一\n二\n三\n\x1b[2A\x1b[J"), ["一", ""])

    def test_回车覆盖本行(self):
        self.assertEqual(replay_ansi("abcdef\rxy"), ["xycdef"])


class ScrubUrlsTest(unittest.TestCase):
    def test_擦掉_http_URL(self):
        self.assertEqual(
            ua_diff.scrub_urls("<urlopen error https://a.example.org/sub?token=aaa>"),
            "<urlopen error ***",
        )

    def test_多个_URL_全擦(self):
        out = ua_diff.scrub_urls("http://a.org/x 和 https://b.org/y?token=zzz 都不该留")
        self.assertNotIn("token=zzz", out)
        self.assertNotIn("a.org", out)
        self.assertNotIn("b.org", out)

    def test_没有_URL_时原样返回(self):
        self.assertEqual(ua_diff.scrub_urls("连接超时"), "连接超时")


class TruncateDisplayTest(unittest.TestCase):
    def test_没超宽就原样返回(self):
        self.assertEqual(ua_diff.truncate_display("abc", 10), "abc")

    def test_超宽时截断并补省略号(self):
        out = ua_diff.truncate_display("abcdefghij", 5)
        self.assertEqual(out, "abcd…")
        self.assertEqual(ua_diff.display_width(out), 5)

    def test_中文按显示宽度截断而不是字符数(self):
        # 「香港节点一二三」7 个字符 = 14 格；限 7 格只放得下 3 个字 + …
        out = ua_diff.truncate_display("香港节点一二三", 7)
        self.assertLessEqual(ua_diff.display_width(out), 7)
        self.assertTrue(out.endswith("…"))

    def test_宽度为零或负时返回空(self):
        self.assertEqual(ua_diff.truncate_display("abc", 0), "")
        self.assertEqual(ua_diff.truncate_display("abc", -3), "")

    def test_不会切出半个宽字符(self):
        for width in range(1, 16):
            with self.subTest(width=width):
                out = ua_diff.truncate_display("🇭🇰香港-A(流量)测试节点", width)
                self.assertLessEqual(ua_diff.display_width(out), width)


class FormatProgressLineTest(unittest.TestCase):
    """行格式化是纯函数，单独测对齐与截断——它是「不折行」这条硬约束的唯一执行点。"""

    NAMES = ["ash.b64", "nanocloud.json", "🇭🇰香港机场", "中文订阅"]

    def _lines(self, max_width=0):
        width = max(ua_diff.display_width(n) for n in self.NAMES)
        return [
            ua_diff.format_progress_line(
                name, ua_diff.PHASE_WAIT, 4, 13, "下一个 loon 3.5.0", 3.2,
                name_width=width, max_width=max_width,
            )
            for name in self.NAMES
        ]

    def test_中文与_emoji_订阅名不影响后续列的起始位置(self):
        starts = set()
        for line in self._lines():
            head, sep, _ = line.partition("下一个")
            self.assertTrue(sep, f"detail 没出现在行里：{line!r}")
            starts.add(ua_diff.display_width(head))
        self.assertEqual(len(starts), 1, f"detail 列起始位置不一致：{starts}")

    def test_计数列右对齐(self):
        line = ua_diff.format_progress_line(
            "x", ua_diff.PHASE_WAIT, 4, 13, "d", 1.0, name_width=1)
        self.assertIn("[ 4/13]", line)
        line = ua_diff.format_progress_line(
            "x", ua_diff.PHASE_WAIT, 12, 13, "d", 1.0, name_width=1)
        self.assertIn("[12/13]", line)

    def test_显示当前阶段已持续多久(self):
        """「还活着」的唯一证据。限速空档里其余字段一动不动，只有这个秒数在走。"""
        line = ua_diff.format_progress_line(
            "x", ua_diff.PHASE_WAIT, 4, 13, "d", 3.24, name_width=1)
        self.assertIn("3.2s", line)

    def test_阶段切换不会让后面的列左右跳(self):
        starts = set()
        for phase in ua_diff.PROGRESS_PHASES:
            line = ua_diff.format_progress_line(
                "x", phase, 4, 13, "DETAIL", 1.0, name_width=1)
            starts.add(ua_diff.display_width(line.partition("DETAIL")[0]))
        self.assertEqual(len(starts), 1, f"阶段列宽不固定：{starts}")

    def test_限宽时整行不超宽(self):
        """折行会把原地重画的行数算错，整块显示就乱了——这是硬约束。"""
        for max_width in (20, 40, 60, 80, 120):
            with self.subTest(max_width=max_width):
                for line in self._lines(max_width=max_width):
                    self.assertLessEqual(
                        ua_diff.display_width(line), max_width,
                        f"行超宽会折行：{line!r}")

    def test_窄到骨架都放不下时也不超宽(self):
        for max_width in range(1, 20):
            with self.subTest(max_width=max_width):
                line = ua_diff.format_progress_line(
                    "nanocloud.json", ua_diff.PHASE_FETCH, 7, 13,
                    "sing-box 1.13.18", 1.1, name_width=14, max_width=max_width)
                self.assertLessEqual(ua_diff.display_width(line), max_width)

    def test_超长_detail_被截断而不是折行(self):
        line = ua_diff.format_progress_line(
            "ash.b64", ua_diff.PHASE_DONE, 13, 13, "x" * 500, 0.1,
            name_width=7, max_width=80)
        self.assertLessEqual(ua_diff.display_width(line), 80)
        self.assertTrue(line.endswith("…"))

    def test_不限宽时不截断(self):
        line = ua_diff.format_progress_line(
            "ash.b64", ua_diff.PHASE_DONE, 13, 13, "y" * 300, 0.1,
            name_width=7, max_width=0)
        self.assertIn("y" * 300, line)

    def test_行内不含任何_ANSI(self):
        for line in self._lines(max_width=80):
            self.assertIsNone(ANSI.search(line))


class ProgressRendererNonTtyTest(unittest.TestCase):
    """非 TTY（重定向、管道、CI）：只打纯文本完成行，绝不输出 ANSI，也不起线程。"""

    def _renderer(self):
        self.stream = io.StringIO()
        return ua_diff.ProgressRenderer(
            [("ash.b64", 13), ("nanocloud.json", 13)],
            stream=self.stream, isatty=False, clock=lambda: 0.0,
        )

    def test_只有完成阶段打行(self):
        renderer = self._renderer()
        renderer.start()
        renderer.update("ash.b64", ua_diff.PHASE_WAIT, 0, 13, "下一个 loon 3.5.0")
        renderer.update("ash.b64", ua_diff.PHASE_FETCH, 0, 13, "loon 3.5.0")
        renderer.update("ash.b64", ua_diff.PHASE_PARSE, 0, 13, "loon 3.5.0")
        self.assertEqual(self.stream.getvalue(), "")
        renderer.update("ash.b64", ua_diff.PHASE_DONE, 1, 13, "loon 3.5.0 200 base64 3 节点")
        renderer.stop()
        lines = self.stream.getvalue().splitlines()
        self.assertEqual(len(lines), 1)
        self.assertIn("[1/13]", lines[0])
        self.assertIn("200 base64 3 节点", lines[0])

    def test_不输出任何_ANSI(self):
        renderer = self._renderer()
        renderer.start()
        for i in range(1, 4):
            renderer.update("ash.b64", ua_diff.PHASE_WAIT, i - 1, 13, "等")
            renderer.update("ash.b64", ua_diff.PHASE_DONE, i, 13, "完")
        renderer.stop()
        self.assertIsNone(ANSI.search(self.stream.getvalue()))

    def test_不起重画线程(self):
        before = threading.active_count()
        renderer = self._renderer()
        renderer.start()
        self.assertEqual(threading.active_count(), before)
        renderer.stop()


class ProgressRendererTtyTest(unittest.TestCase):
    """TTY：每订阅一行，原地重画，且必须显示当前阶段已持续多久。"""

    def setUp(self):
        self.stream = io.StringIO()
        self.now = 0.0
        self.renderer = ua_diff.ProgressRenderer(
            [("ash.b64", 13), ("nanocloud.json", 13)],
            stream=self.stream, isatty=True, clock=lambda: self.now, width=80,
        )

    def test_首次重画打两行且不含上移(self):
        self.renderer._redraw()
        out = self.stream.getvalue()
        self.assertEqual(out.count("\n"), 2)  # 不能用 splitlines：它也在 \r 处断
        self.assertNotIn("\x1b[2A", out)
        self.assertIn("ash.b64", out)
        self.assertIn("nanocloud.json", out)

    def test_再次重画先上移_N_行(self):
        self.renderer._redraw()
        self.stream.truncate(0)
        self.stream.seek(0)
        self.renderer._redraw()
        self.assertTrue(self.stream.getvalue().startswith("\x1b[2A"))
        self.assertIn("\r\x1b[K", self.stream.getvalue())

    def test_阶段持续时间随时钟增长(self):
        self.renderer.update("ash.b64", ua_diff.PHASE_WAIT, 4, 13, "下一个 loon 3.5.0")
        self.now = 3.2
        self.renderer._redraw()
        line = next(l for l in self.stream.getvalue().splitlines() if "ash.b64" in l)
        self.assertIn("等待限速", line)
        self.assertIn("3.2s", line)

    def test_阶段不变时起始时刻不重置(self):
        self.renderer.update("ash.b64", ua_diff.PHASE_WAIT, 4, 13, "a")
        self.now = 2.0
        self.renderer.update("ash.b64", ua_diff.PHASE_WAIT, 4, 13, "b")
        self.now = 5.0
        self.renderer._redraw()
        line = next(l for l in self.stream.getvalue().splitlines() if "ash.b64" in l)
        self.assertIn("5.0s", line)

    def test_阶段切换时起始时刻重置(self):
        self.renderer.update("ash.b64", ua_diff.PHASE_WAIT, 4, 13, "a")
        self.now = 8.0
        self.renderer.update("ash.b64", ua_diff.PHASE_FETCH, 4, 13, "a")
        self.now = 9.5
        self.renderer._redraw()
        line = next(l for l in self.stream.getvalue().splitlines() if "ash.b64" in l)
        self.assertIn("1.5s", line)

    def test_每行都不超终端宽度(self):
        self.renderer.update("ash.b64", ua_diff.PHASE_DONE, 13, 13, "详情" * 200)
        self.renderer._redraw()
        for line in self.stream.getvalue().splitlines():
            plain = re.sub(r"\x1b\[[0-9;]*[A-Za-z]|\r", "", line)
            self.assertLessEqual(ua_diff.display_width(plain), 80)

    def test_stop_清掉已画的行(self):
        self.renderer._redraw()
        self.stream.truncate(0)
        self.stream.seek(0)
        self.renderer.stop()
        self.assertEqual(self.stream.getvalue(), "\x1b[2A\x1b[J")

    def test_stop_幂等(self):
        self.renderer._redraw()
        self.renderer.stop()
        marker = len(self.stream.getvalue())
        self.renderer.stop()
        self.renderer.stop()
        self.assertEqual(len(self.stream.getvalue()), marker)

    def test_stop_之后的_update_不再输出(self):
        self.renderer.stop()
        self.renderer.update("ash.b64", ua_diff.PHASE_DONE, 13, 13, "迟到的更新")
        self.assertNotIn("迟到的更新", self.stream.getvalue())

    def test_重画线程是_daemon_且_stop_后退出(self):
        self.renderer._tick = 0.01
        self.renderer.start()
        thread = self.renderer._thread
        self.assertTrue(thread.daemon)
        self.renderer.stop()
        thread.join(2.0)
        self.assertFalse(thread.is_alive())

    def test_写流失败不抛异常(self):
        class Broken:
            def isatty(self):
                return True

            def write(self, _text):
                raise OSError("管道断了")

            def flush(self):
                pass

        renderer = ua_diff.ProgressRenderer(
            [("a", 3)], stream=Broken(), isatty=True, clock=lambda: 0.0, width=80)
        renderer._redraw()          # 不该抛
        renderer.update("a", ua_diff.PHASE_DONE, 1, 3, "x")
        renderer.stop()


class ProgressBackpressureTest(unittest.TestCase):
    """终端卡住时（SSH 卡顿、Ctrl-S 的 XOFF、终端模拟器 hang），显示的背压**不能**
    传导回探测。曾经 `_write` 在状态锁里，重画线程握着锁卡在 write 上，
    `update()` 和 `stop()` 一起被拖住（实测各 5 秒），而 `stop()` 的 docstring
    还写着「不阻塞」。"""

    class SlowStream:
        """第二次写开始就卡住的流。

        第一次放行，是因为 `start()` 会在调用者的线程里同步画第一帧；要模拟的是
        「**重画线程**卡在 write 里」，卡住第一帧只会卡住测试自己。
        """

        def __init__(self):
            self.entered = threading.Event()
            self.release = threading.Event()
            self.chunks = []

        def isatty(self):
            return True

        def write(self, text):
            self.chunks.append(text)
            if len(self.chunks) < 2:
                return
            self.entered.set()
            self.release.wait(5.0)

        def flush(self):
            pass

    def test_慢终端拖不住_update_和_stop(self):
        stream = self.SlowStream()
        self.addCleanup(stream.release.set)
        renderer = ua_diff.ProgressRenderer(
            [("ash.b64", 3)], stream=stream, isatty=True, tick=0.01, clock=lambda: 0.0)
        renderer.start()
        self.assertTrue(stream.entered.wait(2.0), "重画线程没进到 write 里")

        start = time.monotonic()
        renderer.update("ash.b64", ua_diff.PHASE_FETCH, 1, 3, "loon 3.5.0")
        update_cost = time.monotonic() - start
        self.assertLess(update_cost, 0.5, f"update() 被显示的背压拖住了：{update_cost:.2f}s")

        start = time.monotonic()
        renderer.stop()
        stop_cost = time.monotonic() - start
        # 这里量的是「等**别人**」的部分：join 等一次 + 抢 _io_lock 等一次，各 _STOP_WAIT。
        # 本例里 stop() 抢不到锁、直接放弃清屏，所以它自己不发起 write。
        # 注意 stop() 并非事事有上限：真轮到它写清屏时那次 write 没有超时可设（见其
        # docstring），终端卡多久它就卡多久——那条路这个断言量不到，也不该被读成量到了。
        self.assertLess(stop_cost, 3 * ua_diff._STOP_WAIT,
                        f"stop() 被显示的背压拖住了：{stop_cost:.2f}s")
        self.assertTrue(stream.chunks, "根本没写过，那不叫「没被拖住」")

    def test_update_在_TTY_下一个字节都不写(self):
        """写全交给重画线程，热路径才不会碰到终端。"""
        stream = self.SlowStream()
        self.addCleanup(stream.release.set)
        renderer = ua_diff.ProgressRenderer(
            [("ash.b64", 3)], stream=stream, isatty=True, clock=lambda: 0.0)
        for phase in ua_diff.PROGRESS_PHASES:
            renderer.update("ash.b64", phase, 1, 3, "loon 3.5.0")
        self.assertEqual(stream.chunks, [])  # start() 都没调，更不该有人写


class ProgressFirstFrameTest(unittest.TestCase):
    """第一帧必须由 `start()` 同步画掉。

    否则「探测 N 个订阅……」那行会孤零零挂上最多一个 tick——正是最需要反馈的时刻；
    而且「屏幕上有几行进度」会取决于线程的调度运气，收尾清屏跟着一起变成看运气。
    """

    def test_start_返回时第一帧已经在屏幕上(self):
        stream = io.StringIO()
        renderer = ua_diff.ProgressRenderer(
            [("ash.b64", 13), ("nanocloud.json", 13)],
            stream=stream, isatty=True, tick=30.0, clock=lambda: 0.0, width=80)
        self.addCleanup(renderer.stop)
        renderer.start()
        # tick 是 30 秒，线程这会儿绝无可能画过任何东西
        screen = [l for l in replay_ansi(stream.getvalue()) if l.strip()]
        self.assertEqual(len(screen), 2, screen)
        self.assertIn("ash.b64", screen[0])
        self.assertIn("nanocloud.json", screen[1])

    def test_非_TTY_的_start_什么都不画(self):
        stream = io.StringIO()
        renderer = ua_diff.ProgressRenderer(
            [("ash.b64", 13)], stream=stream, isatty=False, clock=lambda: 0.0)
        renderer.start()
        self.assertEqual(stream.getvalue(), "")


class ProgressLogTest(unittest.TestCase):
    """进度块活着时，往同一个流里插第三方输出。

    这是原先的盲区：worker 直接 print 的告警会被下一帧盖掉——整行消失，而且
    `stop()` 从错位置清起、顶上留一行残影压在报告上面。后果不只是难看：spec 里
    「`--dump` 写盘失败只记一行告警、不中断」这条保证在 TTY 下静默失效。
    """

    WARN = "⚠️ 保存原始响应失败（x.raw）：磁盘满了"

    def _renderer(self, stream):
        return ua_diff.ProgressRenderer(
            [("ash.b64", 3), ("nanocloud.json", 3)],
            stream=stream, isatty=True, clock=lambda: 0.0, width=80)

    def test_告警回放后仍在屏幕上且不留残影(self):
        stream = io.StringIO()
        renderer = self._renderer(stream)
        renderer._redraw()
        renderer.log(self.WARN)
        renderer._redraw()
        renderer.stop()
        stream.write("▌ ash.b64   基准 UA: shadowsocket/*\n")  # 紧随其后的报告

        screen = replay_ansi(stream.getvalue())
        self.assertIn(self.WARN, screen, f"告警被下一帧盖掉了：{screen}")
        self.assertIn("▌ ash.b64   基准 UA: shadowsocket/*", screen)
        # 进度块必须被收干净，不能有半行压在报告上面
        residue = [l for l in screen if "[0/3]" in l or "[1/3]" in l]
        self.assertEqual(residue, [], f"进度残影：{screen}")

    def test_告警之后进度块从头铺(self):
        stream = io.StringIO()
        renderer = self._renderer(stream)
        renderer._redraw()
        renderer.log(self.WARN)
        stream.truncate(0)
        stream.seek(0)
        renderer._redraw()
        # _drawn 已归零，这一帧不能再上移——上移就会盖掉刚打的告警
        self.assertNotIn("\x1b[2A", stream.getvalue())

    def test_非_TTY_下告警是纯文本(self):
        stream = io.StringIO()
        renderer = ua_diff.ProgressRenderer(
            [("ash.b64", 3)], stream=stream, isatty=False, clock=lambda: 0.0)
        renderer.log(self.WARN)
        self.assertEqual(stream.getvalue(), self.WARN + "\n")

    def test_已有换行不会补第二个(self):
        stream = io.StringIO()
        renderer = ua_diff.ProgressRenderer(
            [("ash.b64", 3)], stream=stream, isatty=False, clock=lambda: 0.0)
        renderer.log(self.WARN + "\n")
        self.assertEqual(stream.getvalue(), self.WARN + "\n")


class WarnHelperTest(unittest.TestCase):
    """`_warn` 的回退：渲染器出问题时告警本身不能丢。"""

    def test_有回调时走回调(self):
        got = []
        ua_diff._warn(got.append, "⚠️ 出事了")
        self.assertEqual(got, ["⚠️ 出事了"])

    def test_没有回调时打到_stderr(self):
        err = io.StringIO()
        with contextlib.redirect_stderr(err):
            ua_diff._warn(None, "⚠️ 出事了")
        self.assertEqual(err.getvalue(), "⚠️ 出事了\n")

    def test_回调抛异常时退回_stderr_而不是丢掉(self):
        def boom(_text):
            raise RuntimeError("渲染器炸了")

        err = io.StringIO()
        with contextlib.redirect_stderr(err):
            ua_diff._warn(boom, "⚠️ 出事了")
        self.assertIn("⚠️ 出事了", err.getvalue())


class ProgressTerminalWidthTest(unittest.TestCase):
    """极窄终端：`columns - 1` 会掉到 0/负数，而那正好是「不限宽」的信号——
    「防折行」直接翻成「保证折行」。"""

    def setUp(self):
        self.original = os.environ.get("COLUMNS")
        self.addCleanup(self._restore)

    def _restore(self):
        if self.original is None:
            os.environ.pop("COLUMNS", None)
        else:
            os.environ["COLUMNS"] = self.original

    def test_终端极窄时不会退化成不限宽(self):
        for columns in ("1", "2", "3", "10"):
            with self.subTest(columns=columns):
                os.environ["COLUMNS"] = columns
                stream = io.StringIO()
                renderer = ua_diff.ProgressRenderer(
                    [("nanocloud.json", 13)], stream=stream, isatty=True, clock=lambda: 0.0)
                limit = renderer._max_width()
                self.assertGreaterEqual(limit, 1, "退化成了「不限宽」")
                renderer.update("nanocloud.json", ua_diff.PHASE_FETCH, 7, 13,
                                "sing-box 1.13.18 " * 5)
                renderer._redraw()
                for line in replay_ansi(stream.getvalue()):
                    self.assertLessEqual(ua_diff.display_width(line), limit)


class ProgressDuplicateNameTest(unittest.TestCase):
    """clash.txt 允许重名。重名的两个 worker 若写进同一行，计数会互相覆盖。"""

    def test_重名订阅各占一行(self):
        stream = io.StringIO()
        renderer = ua_diff.ProgressRenderer(
            [("dup", 3), ("dup", 3), ("other", 3), ("dup", 3)],
            stream=stream, isatty=True, clock=lambda: 0.0, width=120)
        self.assertEqual(renderer.keys, ["dup", "dup#2", "other", "dup#3"])
        for index, key in enumerate(renderer.keys):
            renderer.update(key, ua_diff.PHASE_DONE, index + 1, 3, f"第 {index} 个")
        renderer._redraw()
        screen = [l for l in replay_ansi(stream.getvalue()) if l.strip()]
        self.assertEqual(len(screen), 4, f"重名订阅没有各占一行：{screen}")
        for index in range(4):
            self.assertTrue(any(f"第 {index} 个" in l for l in screen), screen)


class ProbeProgressCallbackTest(unittest.TestCase):
    """probe_subscription 的 on_progress 回调：时机、内容、异常安全。"""

    SUB = ua_diff.Subscription("ash.b64", "https://example.org/sub?token=aaa", "sing-box")
    BODY = base64.b64encode(b"vless://uuid@1.2.3.4:443#HK-01\n")

    def _run(self, fetcher, on_progress, clients=None):
        return ua_diff.probe_subscription(
            self.SUB, interval=8.0, timeout=1.0, clients=clients or ["mihomo"],
            fetcher=fetcher, sleeper=lambda s: None, clock=lambda: 0.0,
            on_progress=on_progress,
        )

    def test_四个阶段按顺序上报(self):
        events = []
        self._run(lambda u, a, t: ua_diff.Response(200, self.BODY),
                  lambda *args: events.append(args))
        phases = [e[0] for e in events]
        # 基准 + mihomo 两个版本 = 3 次请求 × 4 个阶段
        self.assertEqual(phases, [
            ua_diff.PHASE_WAIT, ua_diff.PHASE_FETCH, ua_diff.PHASE_PARSE, ua_diff.PHASE_DONE,
        ] * 3)
        self.assertEqual([e[2] for e in events], [3] * 12)  # total
        self.assertEqual([e[1] for e in events if e[0] == ua_diff.PHASE_DONE], [1, 2, 3])

    def test_等待限速在_wait_之前上报(self):
        """限速的 8 秒空档是全程最长的静默，进度必须在进入等待之**前**就报出来，
        否则那 8 秒屏幕上什么都没有——正是这次要治的病。"""
        timeline = []
        self._run(
            lambda u, a, t: ua_diff.Response(200, self.BODY),
            lambda phase, *rest: timeline.append(("progress", phase)),
        )
        # 用一个会记录顺序的 sleeper 更直接
        timeline.clear()
        ua_diff.probe_subscription(
            self.SUB, interval=8.0, timeout=1.0, clients=["mihomo"],
            fetcher=lambda u, a, t: ua_diff.Response(200, self.BODY),
            sleeper=lambda s: timeline.append(("sleep", s)),
            clock=lambda: 0.0,
            on_progress=lambda phase, *rest: timeline.append(("progress", phase)),
        )
        first_sleep = next(i for i, e in enumerate(timeline) if e[0] == "sleep")
        before = [e[1] for e in timeline[:first_sleep] if e[0] == "progress"]
        self.assertEqual(before[-1], ua_diff.PHASE_WAIT)

    def test_完成时的摘要含状态码格式与节点数(self):
        events = []
        self._run(lambda u, a, t: ua_diff.Response(200, self.BODY),
                  lambda *args: events.append(args))
        detail = next(e[3] for e in events if e[0] == ua_diff.PHASE_DONE)
        self.assertIn("200", detail)
        self.assertIn("base64", detail)
        self.assertIn("1 节点", detail)

    def test_失败时摘要擦掉_URL(self):
        """异常字符串偶尔会把请求 URL 原样带上，而订阅 URL 含 token。"""
        events = []
        self._run(
            lambda u, a, t: ua_diff.Response(
                0, b"", f"<urlopen error timed out for {u}>"),
            lambda *args: events.append(args),
        )
        for _, _, _, detail in [e for e in events if e[0] == ua_diff.PHASE_DONE]:
            self.assertNotIn("token=aaa", detail)
            self.assertNotIn("example.org", detail)
            self.assertIn("失败", detail)

    def test_回调抛异常不影响探测(self):
        """显示是附属功能，渲染器有 bug 不能把 worker 弄死、让整个订阅静默消失。"""
        def boom(*_args):
            raise RuntimeError("渲染器炸了")

        probes = self._run(lambda u, a, t: ua_diff.Response(200, self.BODY), boom)
        self.assertEqual(len(probes), 3)
        self.assertTrue(all(p.ok for p in probes))

    def test_不传回调时行为不变(self):
        probes = self._run(lambda u, a, t: ua_diff.Response(200, self.BODY), None)
        self.assertEqual(len(probes), 3)

    def test_落盘失败的告警走_on_warn_而不是裸_print(self):
        """裸 print 会被下一帧进度盖掉，spec 的「只记一行告警」就静默失效了。"""
        warnings = []
        with tempfile.TemporaryDirectory() as tmp:
            dump = Path(tmp)
            (dump / "ash.b64.mihomo.1.19.29.raw").mkdir()  # 占住文件名 → IsADirectoryError
            stderr = io.StringIO()
            with contextlib.redirect_stderr(stderr):
                probes = ua_diff.probe_subscription(
                    self.SUB, interval=8.0, timeout=1.0, clients=["mihomo"],
                    fetcher=lambda u, a, t: ua_diff.Response(200, self.BODY),
                    sleeper=lambda s: None, clock=lambda: 0.0, dump_dir=dump,
                    on_warn=warnings.append,
                )
        self.assertEqual(len(probes), 3)  # 落盘失败不吃掉剩余探测
        self.assertTrue(any("保存原始响应失败" in w for w in warnings), warnings)
        self.assertEqual(stderr.getvalue(), "")  # 没绕过 on_warn 直接喷 stderr


class MainProgressTest(unittest.TestCase):
    """main 里的进度：输出流、开关、与 --json 的隔离、不泄漏 URL。

    全部离线：fetcher/sleeper/clock 走 main 的注入点。stdout/stderr 都被 redirect
    成 StringIO（isatty() 为假），所以走的是非 TTY 分支。
    """

    DONE_LINE = re.compile(r"\[\d+/\d+\]")

    LIST = (
        "ash.b64 https://example.org/sub?token=aaa shadowsocket\n"
        "nanocloud.json https://example.org/verify?token=ccc sing-box\n"
    )
    BODY = base64.b64encode(b"vless://uuid@1.2.3.4:443#HK-01\n")

    def setUp(self):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.root = Path(tmp.name)
        self.list_file = self.root / "clash.txt"
        self.list_file.write_text(self.LIST, encoding="utf-8")
        self.subscribe_sh = self.root / "subscribe.sh"
        self.subscribe_sh.write_text(SUBSCRIBE_SH, encoding="utf-8")
        self.addCleanup(ua_diff.set_baseline_source, None)

    def _fetcher(self, url, ua, timeout):
        return ua_diff.Response(200, self.BODY)

    def run_main(self, *argv, fetcher=None):
        out, err = io.StringIO(), io.StringIO()
        with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
            code = ua_diff.main(
                ["-f", str(self.list_file), "--subscribe-sh", str(self.subscribe_sh), *argv],
                fetcher=fetcher or self._fetcher,
                sleeper=lambda seconds: None,
                clock=lambda: 0.0,
            )
        return code, out.getvalue(), err.getvalue()

    def test_每完成一次请求在_stderr_打一行(self):
        code, _, err = self.run_main("--only", "ash.b64")
        self.assertEqual(code, 0)
        self.assertEqual(len(self.DONE_LINE.findall(err)), 9)

    def test_多个订阅各自计数(self):
        code, _, err = self.run_main()
        self.assertEqual(code, 0)
        # shadowsocket 9 次 + sing-box 8 次（基准与最新 SFA 合并）
        self.assertEqual(len(self.DONE_LINE.findall(err)), 17)
        self.assertIn("ash.b64", err)
        self.assertIn("nanocloud.json", err)

    def test_非_TTY_下不输出任何_ANSI(self):
        """管道/重定向/CI 里 ANSI 会变成一堆乱码，必须走纯文本分支。"""
        _, out, err = self.run_main("--only", "ash.b64")
        self.assertIsNone(ANSI.search(err))
        self.assertIsNone(ANSI.search(out))

    def test_进度只走_stderr_不碰_stdout(self):
        _, out, _ = self.run_main("--only", "ash.b64")
        self.assertIsNone(self.DONE_LINE.search(out))

    def test_json_的_stdout_是纯净可解析的(self):
        """--json 常被重定向进文件再喂给别的脚本，混进一行进度就整份废掉。"""
        import json as _json
        code, out, err = self.run_main("--only", "ash.b64", "--json")
        self.assertEqual(code, 0)
        data = _json.loads(out)  # 整份解析，不是逐行找
        self.assertEqual(data[0]["subscription"]["name"], "ash.b64")
        # --json 的 stdout 连开头那个空行都不该有：整份必须是一个 JSON 数组
        self.assertTrue(out.startswith("["), f"stdout 开头不是 JSON：{out[:20]!r}")
        self.assertEqual(len(self.DONE_LINE.findall(err)), 9)  # 进度照常，只是在 stderr

    def test_no_progress_彻底关掉进度(self):
        _, _, err = self.run_main("--only", "ash.b64", "--no-progress")
        self.assertIsNone(self.DONE_LINE.search(err))
        self.assertIn("探测 1 个订阅", err)  # 开头那行汇总保留

    def test_进度不泄漏订阅_URL(self):
        """clash.txt 的 URL 含 token，进度是直接喷到终端、也可能被重定向进日志的。"""
        _, _, err = self.run_main("--only", "ash.b64")
        self.assertNotIn("token=aaa", err)
        self.assertNotIn("example.org", err)

    def test_请求失败时进度也不泄漏_URL(self):
        def fetcher(url, ua, timeout):
            return ua_diff.Response(0, b"", f"<urlopen error timed out for {url}>")

        _, _, err = self.run_main("--only", "ash.b64", fetcher=fetcher)
        self.assertNotIn("token=aaa", err)
        self.assertNotIn("example.org", err)

    def test_进度行里有客户端与版本(self):
        _, _, err = self.run_main("--only", "ash.b64", "--client", "mihomo")
        self.assertIn("mihomo 1.19.29", err)

    def test_重名订阅各占一行不互相覆盖(self):
        """clash.txt 允许重名，两个 worker 写进同一行会让计数互相覆盖。"""
        self.list_file.write_text(
            "dup https://example.org/a?token=aaa sing-box\n"
            "dup https://example.org/b?token=bbb sing-box\n",
            encoding="utf-8",
        )
        code, _, err = self.run_main()
        self.assertEqual(code, 0)
        self.assertIn("dup#2", err)
        self.assertEqual(len(self.DONE_LINE.findall(err)), 16)  # 2 个 sing-box 订阅 × 8

    def test_落盘失败的告警照常出现(self):
        dump = self.root / "dump"
        dump.mkdir()
        (dump / "ash.b64.mihomo.1.19.29.raw").mkdir()  # 占住文件名 → 写盘必失败
        code, out, err = self.run_main(
            "--only", "ash.b64", "--client", "mihomo", "--dump", str(dump))
        self.assertEqual(code, 0)
        self.assertIn("保存原始响应失败", err)
        self.assertIn("▌ ash.b64", out)  # 告警不中断探测

    def test_中断时进度不影响已完成部分的输出(self):
        """既有的 Ctrl-C 行为不能因为多了个渲染线程而回退。"""
        original = ua_diff.as_completed

        def interrupt_after_all(fs, *args, **kwargs):
            for done in original(fs, *args, **kwargs):
                yield done
            raise KeyboardInterrupt

        ua_diff.as_completed = interrupt_after_all
        try:
            code, out, err = self.run_main("--only", "ash.b64")
        finally:
            ua_diff.as_completed = original

        self.assertEqual(code, 2)
        self.assertIn("已中断", err)
        self.assertIn("▌ ash.b64", out)


class _FakeTty(io.StringIO):
    """假装自己是终端的 StringIO，用来在离线测试里走 main 的 TTY 分支。"""

    def isatty(self):
        return True


class MainProgressTtyTest(MainProgressTest):
    """把 stderr 换成「是 TTY」的流，逼 main 走原地重画分支。

    非 TTY 分支不起线程、stop() 也没有残影要清，所以「main 忘了 stop 渲染器」
    在非 TTY 测试里完全观察不到——那条路只有在这里才钉得住。
    """

    def run_main(self, *argv, fetcher=None):
        out, err = io.StringIO(), _FakeTty()
        with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
            code = ua_diff.main(
                ["-f", str(self.list_file), "--subscribe-sh", str(self.subscribe_sh), *argv],
                fetcher=fetcher or self._fetcher,
                sleeper=lambda seconds: None,
                clock=lambda: 0.0,
            )
        return code, out.getvalue(), err.getvalue()

    # 下面这几条是非 TTY 专属断言，在 TTY 分支下不成立，覆盖掉
    def test_每完成一次请求在_stderr_打一行(self):
        self.skipTest("TTY 分支是原地重画，不是每次完成打一行")

    def test_多个订阅各自计数(self):
        self.skipTest("TTY 分支是原地重画，不是每次完成打一行")

    def test_非_TTY_下不输出任何_ANSI(self):
        self.skipTest("这条是非 TTY 分支专属")

    def test_进度行里有客户端与版本(self):
        # TTY 是原地重画：屏幕上只留最后一次画的内容，逐次完成行看非 TTY 那组
        _, _, err = self.run_main("--only", "ash.b64", "--client", "mihomo")
        self.assertRegex(err, r"mihomo \d+\.\d+\.\d+")

    def test_进度只走_stderr_不碰_stdout(self):
        _, out, _ = self.run_main("--only", "ash.b64")
        self.assertIsNone(ANSI.search(out))
        self.assertIsNone(self.DONE_LINE.search(out))

    def test_json_的_stdout_是纯净可解析的(self):
        import json as _json
        code, out, err = self.run_main("--only", "ash.b64", "--json")
        self.assertEqual(code, 0)
        self.assertEqual(_json.loads(out)[0]["subscription"]["name"], "ash.b64")
        self.assertIsNotNone(ANSI.search(err))  # 进度确实画了，只是画在 stderr

    def test_no_progress_彻底关掉进度(self):
        _, _, err = self.run_main("--only", "ash.b64", "--no-progress")
        self.assertIsNone(ANSI.search(err))
        self.assertIsNone(self.DONE_LINE.search(err))
        self.assertIn("探测 1 个订阅", err)

    def test_重名订阅各占一行不互相覆盖(self):
        self.list_file.write_text(
            "dup https://example.org/a?token=aaa sing-box\n"
            "dup https://example.org/b?token=bbb sing-box\n",
            encoding="utf-8",
        )
        code, _, err = self.run_main()
        self.assertEqual(code, 0)
        # 收尾时进度块被清掉了，所以看字节流：每帧两行、两个不同的行名、收尾按 2 行上移。
        # 不数 [n/13]：TTY 是原地重画，两行的计数取决于抓拍到的那一刻，本来就可以不同。
        self.assertIn("dup#2", err)
        rows = err.count("\r\x1b[K")
        self.assertGreaterEqual(rows, 2, err)
        self.assertEqual(rows % 2, 0, f"每帧应当正好 2 行，实际画了 {rows} 行：{err!r}")
        self.assertTrue(err.endswith("\x1b[2A\x1b[J"), repr(err[-20:]))

    def test_落盘失败的告警照常出现(self):
        """TTY 下裸 print 的告警会被下一帧盖掉、整行消失，而 spec 保证它「只记一行
        告警、不中断」。`start()` 已经同步铺好了进度块，所以告警必然落在会被盖掉的时刻。"""
        dump = self.root / "dump"
        dump.mkdir()
        (dump / "ash.b64.mihomo.1.19.29.raw").mkdir()  # 占住文件名 → 写盘必失败
        code, out, err = self.run_main(
            "--only", "ash.b64", "--client", "mihomo", "--dump", str(dump))
        self.assertEqual(code, 0)
        screen = replay_ansi(err)
        self.assertTrue(any("保存原始响应失败" in l for l in screen),
                        f"告警被下一帧盖掉了：{screen}")
        self.assertEqual([l for l in screen if self.DONE_LINE.search(l)], [],
                         f"进度残影压在报告上面：{screen}")
        self.assertIn("▌ ash.b64", out)

    def test_TTY_下用原地重画(self):
        _, _, err = self.run_main("--only", "ash.b64")
        self.assertIn("\r\x1b[K", err)   # 逐行清行重写
        self.assertIn("\x1b[1A", err)    # 一个订阅 = 上移 1 行

    def test_收尾时清掉进度块(self):
        """不清的话进度残影会和紧随其后的报告混在一起。"""
        _, _, err = self.run_main("--only", "ash.b64")
        self.assertTrue(err.endswith("\x1b[1A\x1b[J"), repr(err[-40:]))

    def test_main_返回后重画线程已收掉(self):
        """渲染线程是 daemon 且 main 一定会 stop() 它，否则它会一直画下去、
        进程也退不干净。"""
        code, _, _ = self.run_main("--only", "ash.b64")
        self.assertEqual(code, 0)
        alive = [t for t in threading.enumerate() if t.name == "ua-diff-progress"]
        self.assertEqual(alive, [], "重画线程没被收掉")

    def test_中断路径也会收掉重画线程(self):
        original = ua_diff.as_completed

        def interrupt_after_all(fs, *args, **kwargs):
            for done in original(fs, *args, **kwargs):
                yield done
            raise KeyboardInterrupt

        ua_diff.as_completed = interrupt_after_all
        try:
            code, out, err = self.run_main("--only", "ash.b64")
        finally:
            ua_diff.as_completed = original

        self.assertEqual(code, 2)
        self.assertIn("▌ ash.b64", out)
        alive = [t for t in threading.enumerate() if t.name == "ua-diff-progress"]
        self.assertEqual(alive, [])
        # 「已中断」必须在进度块被收掉之后才打，否则会插进正在重画的那几行里
        self.assertLess(err.index("\x1b[J"), err.index("已中断"))


# ---------------------------------------------------------------- 基准 UA 来源


class BaselineSourceTest(unittest.TestCase):
    """基准 UA 从 subscribe.sh 解析：解析成功、各种取不到、格式漂移告警。

    这条路上任何异常都会炸掉整轮探测，所以「绝不抛异常」是硬要求，逐个情形钉死。
    """

    def setUp(self):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.root = Path(tmp.name)
        self.addCleanup(ua_diff.set_baseline_source, None)

    def _write(self, body):
        path = self.root / "subscribe.sh"
        path.write_text(body, encoding="utf-8")
        return path

    def _set_workspace(self, value):
        previous = os.environ.get("WORKSPACE")

        def restore():
            if previous is None:
                os.environ.pop("WORKSPACE", None)
            else:
                os.environ["WORKSPACE"] = previous

        self.addCleanup(restore)
        if value is None:
            os.environ.pop("WORKSPACE", None)
        else:
            os.environ["WORKSPACE"] = value

    # ---- 解析成功 ----

    def test_解析出_sing_box_那一串(self):
        # 用 9.9.9 而不是仓库当前值：解析失败退回兜底时这条必炸
        source = ua_diff.resolve_baseline_source(
            self._write(SUBSCRIBE_SH.replace("1.13.18", "9.9.9")))
        self.assertEqual(source.ua, "SFA/9.9.9 (sing-box 9.9.9)")
        self.assertTrue(source.from_file)
        self.assertEqual(source.note, "读自 subscribe.sh")
        self.assertEqual(source.warnings, ())

    def test_跳过_CLIENT_模板那一条(self):
        """两条 AGENT= 赋值，取的必须是不含 $CLIENT 的那条。"""
        source = ua_diff.resolve_baseline_source(self._write(
            "if [[ $CLIENT == 'sing-box' ]]; then\n"
            '    AGENT="$CLIENT/*"\n'   # 故意把模板排在前面
            "else\n"
            '    AGENT="SFA/7.7.7 (sing-box 7.7.7)"\n'
            "fi\n"
        ))
        self.assertEqual(source.ua, "SFA/7.7.7 (sing-box 7.7.7)")

    # ---- 取不到：一律兜底 ----

    def test_文件不存在时退回兜底(self):
        source = ua_diff.resolve_baseline_source(self.root / "没有这个文件.sh")
        # 手写字面量，不引用被测常量
        self.assertEqual(source.ua, "SFA/1.13.18 (sing-box 1.13.18)")
        self.assertFalse(source.from_file)
        self.assertIn("内置兜底", source.note)
        self.assertIn("读不了", source.note)

    def test_没有读权限时退回兜底(self):
        path = self._write(SUBSCRIBE_SH)
        path.chmod(0o000)
        self.addCleanup(path.chmod, 0o600)
        if os.access(path, os.R_OK):
            self.skipTest("以 root 运行，chmod 000 也读得了")
        source = ua_diff.resolve_baseline_source(path)
        self.assertEqual(source.ua, "SFA/1.13.18 (sing-box 1.13.18)")
        self.assertFalse(source.from_file)
        self.assertIn("内置兜底", source.note)

    def test_格式变了取不到时退回兜底(self):
        source = ua_diff.resolve_baseline_source(self._write(
            "AGENT=$SOME_VARIABLE\n"          # 没有引号，不是本脚本认得的形状
            "USER_AGENT='SFA/1.0'\n"
        ))
        self.assertEqual(source.ua, "SFA/1.13.18 (sing-box 1.13.18)")
        self.assertFalse(source.from_file)
        self.assertIn("没找到", source.note)

    def test_只剩_CLIENT_模板时也算取不到(self):
        source = ua_diff.resolve_baseline_source(self._write('AGENT="$CLIENT/*"\n'))
        self.assertFalse(source.from_file)
        self.assertIn("内置兜底", source.note)

    def test_WORKSPACE_没设置时定位不到(self):
        self._set_workspace(None)
        self.assertIsNone(ua_diff.default_subscribe_sh())
        source = ua_diff.resolve_baseline_source(ua_diff.default_subscribe_sh())
        self.assertFalse(source.from_file)
        self.assertIn("WORKSPACE", source.note)

    def test_默认路径挂在_WORKSPACE_下(self):
        self._set_workspace("/tmp/假的工作区")
        self.assertEqual(
            ua_diff.default_subscribe_sh(),
            Path("/tmp/假的工作区/proxy/sing-rules/subscribe.sh"),
        )

    def test_前置的空_AGENT_赋值不会顶掉真串(self):
        """`AGENT=""` 这类初始化既不含 $CLIENT 又排在前面，会被 next() 选中，
        于是整份解析静默退回兜底。"""
        source = ua_diff.resolve_baseline_source(self._write(
            'AGENT=""\n' + SUBSCRIBE_SH.replace("1.13.18", "9.9.9")))
        self.assertEqual(source.ua, "SFA/9.9.9 (sing-box 9.9.9)")
        self.assertTrue(source.from_file)

    def test_取到的串不像_sing_box_UA_时出声(self):
        """脚本里多出一处写死的 UA 时「取第一个」会静默取错串，而报告仍然标
        「读自 subscribe.sh」——假基准冒充真基准。"""
        source = ua_diff.resolve_baseline_source(self._write(
            'AGENT="mihomo/v1.19.29"\n' + SUBSCRIBE_SH))
        self.assertEqual(source.ua, "mihomo/v1.19.29")
        self.assertIn("形状可疑", source.note)
        self.assertTrue(any("形状可疑" in w for w in source.warnings), source.warnings)

    def test_形状正常时不喊可疑(self):
        for ua in ("SFA/1.13.18 (sing-box 1.13.18)", "SFI/1.12.25 (sing-box 1.12.25)",
                   "SFM/1.13.18 (sing-box 1.13.18)", "sing-box 1.13.18"):
            with self.subTest(ua=ua):
                source = ua_diff.resolve_baseline_source(self._write(
                    f'if [[ $CLIENT == \'sing-box\' ]]; then\n'
                    f'    AGENT="{ua}"\n'
                    f'else\n    AGENT="$CLIENT/*"\n fi\n'))
                self.assertEqual(source.note, "读自 subscribe.sh")
                self.assertEqual(source.warnings, ())

    def test_两种漂移同时发生时两条告警都在(self):
        source = ua_diff.resolve_baseline_source(self._write(
            'AGENT="mihomo/v1.19.29"\n'
            + SUBSCRIBE_SH.replace('AGENT="$CLIENT/*"', 'AGENT="$CLIENT/1.0"')))
        self.assertEqual(len(source.warnings), 2)

    def test_读文件抛出非_OSError_也不炸(self):
        """兜底得真的兜得住：只接 OSError 的话，别的异常会一路炸穿整轮探测。"""
        class 会爆炸的路径:
            def read_text(self, *args, **kwargs):
                raise RuntimeError("boom")

        source = ua_diff.resolve_baseline_source(会爆炸的路径())
        self.assertEqual(source.ua, "SFA/1.13.18 (sing-box 1.13.18)")
        self.assertIn("解析 subscribe.sh 失败", source.note)
        self.assertFalse(source.from_file)

    def test_任何情形都不抛异常(self):
        binary = self.root / "binary.sh"
        binary.write_bytes(b"\xff\xfe\x00AGENT=\x00")
        empty = self.root / "empty.sh"
        empty.write_text("", encoding="utf-8")
        for path in (None, self.root, binary, empty, self.root / "缺失.sh"):
            with self.subTest(path=path):
                source = ua_diff.resolve_baseline_source(path)  # 不抛就是通过
                self.assertEqual(source.ua, "SFA/1.13.18 (sing-box 1.13.18)")

    # ---- else 分支漂移 ----

    def test_else_分支不再是_CLIENT_模板时告警(self):
        """baseline_ua 的另一半（<client>/*）也是 subscribe.sh 的规则拷贝，
        那边改了这边不改，基准照样会漂，只是漂在另一半上。"""
        source = ua_diff.resolve_baseline_source(self._write(
            SUBSCRIBE_SH.replace('AGENT="$CLIENT/*"', 'AGENT="$CLIENT/1.0"')))
        self.assertEqual(source.ua, "SFA/1.13.18 (sing-box 1.13.18)")
        self.assertTrue(source.from_file)          # 仍然解析出来，不中断
        self.assertEqual(len(source.warnings), 1)
        self.assertIn("$CLIENT/*", source.warnings[0])

    def test_else_分支正常时不告警(self):
        source = ua_diff.resolve_baseline_source(self._write(SUBSCRIBE_SH))
        self.assertEqual(source.warnings, ())

    # ---- 与 baseline_ua 的联动 ----

    def test_baseline_ua_用的是设定进去的来源(self):
        ua_diff.set_baseline_source(
            ua_diff.BaselineSource("SFA/5.5.5 (sing-box 5.5.5)", "读自 subscribe.sh", True))
        self.assertEqual(ua_diff.baseline_ua("sing-box"), "SFA/5.5.5 (sing-box 5.5.5)")
        self.assertEqual(ua_diff.baseline_ua("clash"), "clash/*")

    def test_没设定时不做文件_IO(self):
        """库层调用（含单测）不该因为环境里有没有 $WORKSPACE 而给出不同的基准。"""
        self._set_workspace(str(self.root))
        self._write(SUBSCRIBE_SH.replace("1.13.18", "9.9.9"))
        ua_diff.set_baseline_source(None)
        self.assertEqual(ua_diff.baseline_ua("sing-box"), "SFA/1.13.18 (sing-box 1.13.18)")


# ---------------------------------------------------------------- conf 支持仍在


class ConfSupportRetainedTest(unittest.TestCase):
    """loon / quantumult-x 从 UA 表里删了，但 conf 与 base64-conf 的支持必须留着。

    `detect_format` 与 UA 无关，别的客户端也可能返回这些格式；而
    `USABLE_TYPES_BY_FORMAT` 里对它们的分级仍然是正确知识——把不支持的协议判成
    「可用」会让 update.sh 直接崩（clash-to-sing.py 的 `case _` 是 raise）。
    """

    def test_conf_嗅探仍然认得(self):
        self.assertEqual(ua_diff.detect_format(LOON_BARE.encode()), "conf")

    def test_base64_conf_嗅探仍然认得(self):
        self.assertEqual(ua_diff.detect_format(QX_BARE_B64), "base64-conf")

    def test_conf_解析器仍然出得了节点(self):
        nodes = ua_diff.parse_nodes(LOON_BARE.encode(), "conf")
        self.assertEqual(len(nodes), 4)
        self.assertEqual(nodes[-1].type, "trojan")

    def test_base64_conf_解析器仍然出得了节点(self):
        nodes = ua_diff.parse_nodes(QX_BARE_B64, "base64-conf")
        self.assertEqual(len(nodes), 3)
        self.assertEqual(nodes[0].type, "vless")

    def test_conf_与_base64_conf_仍然一个可用节点都没有(self):
        for fmt in ("conf", "base64-conf"):
            for proto in ("vless", "trojan", "ss", "vmess", "hysteria2"):
                with self.subTest(fmt=fmt, proto=proto):
                    self.assertEqual(ua_diff.tier_of(proto, fmt), "pending")
            self.assertNotIn(fmt, ua_diff.USABLE_TYPES_BY_FORMAT)
            self.assertNotIn(fmt, ua_diff.DOWNSTREAM_LOADERS)

    def test_内核不支持的类型在_conf_下仍是不可用(self):
        self.assertEqual(ua_diff.tier_of("ssr", "conf"), "unusable")


# ---------------------------------------------------------------- 凭据打码


class MaskCredentialsTest(unittest.TestCase):
    """待支持样例是原始形态，凭据必须打码——报告会被贴进 issue、聊天、日志文件。"""

    def test_dict_按键名打码但保留结构(self):
        text = ua_diff.mask_credentials({
            "name": "🇭🇰HK-01", "type": "vless", "server": "1.2.3.4", "port": 443,
            "uuid": "75caee81-fcef-4a2b-9c31-1d3e6f8a0b21",
        })
        self.assertNotIn("75caee81", text)
        self.assertIn('"uuid": "***"', text)
        # 非凭据字段必须留着，否则样例对补分支毫无帮助
        self.assertIn('"server": "1.2.3.4"', text)
        self.assertIn('"type": "vless"', text)

    def test_password_键打码(self):
        text = ua_diff.mask_credentials({"type": "trojan", "password": "hunter2"})
        self.assertNotIn("hunter2", text)

    def test_id_键打码(self):
        text = ua_diff.mask_credentials({"type": "vmess", "id": "deadbeef-0000"})
        self.assertNotIn("deadbeef", text)

    def test_合成键名按后缀打码(self):
        text = ua_diff.mask_credentials(
            {"obfs-password": "op", "private-key": "pk", "auth_str": "as"})
        for secret in ("op", "pk", "as"):
            self.assertNotIn(f'"{secret}"', text)

    def test_嵌套字典也打码(self):
        text = ua_diff.mask_credentials(
            {"type": "vless", "reality-opts": {"private-key": "PRIVKEY", "public-key": "PUBKEY"}})
        self.assertNotIn("PRIVKEY", text)
        self.assertIn("reality-opts", text)
        # 公钥不是凭据，本来就随分享链接公开——打了纯属帮倒忙
        self.assertIn("PUBKEY", text)

    def test_列表里的字典也递归打码(self):
        """clash 的 `wireguard.peers: [{public-key, pre-shared-key}]`、
        sing-box 的 `users: [{uuid}]` 都是列表套字典，不递归就整段漏出去。"""
        text = ua_diff.mask_credentials({
            "type": "wireguard",
            "peers": [{"public-key": "PUBKEY", "pre-shared-key": "PSKSECRET"}],
            "users": [{"name": "u1", "uuid": "UUIDSECRET"}],
        })
        self.assertNotIn("PSKSECRET", text)
        self.assertNotIn("UUIDSECRET", text)
        self.assertIn("PUBKEY", text)
        self.assertIn("u1", text)

    def test_Surge_的_username_就是_UUID_必须打掉(self):
        """Surge / Loon 的 vmess 节点行把 UUID 写在 username= 上，而 conf 格式下
        vmess 恒为 pending——必进样例。集合里只有 userid 没有 username 就整串漏出去。"""
        text = ua_diff.mask_credentials(
            "HK = vmess, v.example.com, 443, username=11111111-2222-3333-4444-555555555555, "
            "transport=ws, path=/ray, tls=true")
        self.assertNotIn("11111111-2222", text)
        self.assertIn("username=***", text)
        self.assertIn("path=/ray", text)          # 传输层参数一个都不许打
        self.assertIn("transport=ws", text)
        self.assertIn("v.example.com", text)

    def test_passphrase_也算凭据(self):
        text = ua_diff.mask_credentials(
            {"passphrase": "PHRASE", "private-key-passphrase": "PHRASE2"})
        self.assertNotIn("PHRASE", text)

    def test_URL_的_userinfo_打码(self):
        text = ua_diff.mask_credentials(
            "vless://75caee81-fcef-4a2b-9c31-1d3e6f8a0b21@1.2.3.4:443?sni=a.example#🇭🇰HK-01")
        self.assertNotIn("75caee81", text)
        self.assertIn("@1.2.3.4:443", text)
        self.assertIn("sni=a.example", text)
        self.assertIn("🇭🇰HK-01", text)

    def test_查询串里的具名凭据打码(self):
        text = ua_diff.mask_credentials("trojan://h.example:443?password=hunter2&sni=a.example")
        self.assertNotIn("hunter2", text)
        self.assertIn("sni=a.example", text)

    def test_vmess_载荷解开后按键名打码(self):
        payload = base64.b64encode(
            b'{"ps":"HK-01","add":"1.2.3.4","port":"443","id":"deadbeef-1111","net":"ws"}')
        text = ua_diff.mask_credentials("vmess://" + payload.decode())
        self.assertNotIn("deadbeef", text)
        self.assertNotIn(payload.decode(), text)   # 原样的 base64 也不能留
        self.assertIn('"add": "1.2.3.4"', text)

    def test_conf_行定位置的裸引号密码打掉(self):
        text = ua_diff.mask_credentials(
            '🇭🇰HK-01 = vless,1.2.3.4,10009,"75caee81-fcef-4a2b",transport:tcp')
        self.assertNotIn("75caee81", text)
        self.assertIn("1.2.3.4", text)
        self.assertIn("transport:tcp", text)

    def test_有键名的引号字段一律保留(self):
        """无差别打掉所有引号段会把 SNI / tls-host / path / 节点名一起打没，
        这一节也就废了——而 conf 正是 ash 实际返回的格式，这条路径是活的。"""
        text = ua_diff.mask_credentials(
            'JP-02 = trojan,5.6.7.8,443,"secretpw",tls-name="a.example",'
            'tls-host="b.example",path="/ray",tag="🇯🇵日本-02"')
        self.assertNotIn("secretpw", text)        # 定位置的密码照打
        self.assertIn('tls-name="a.example"', text)
        self.assertIn('tls-host="b.example"', text)
        self.assertIn('path="/ray"', text)
        self.assertIn('tag="🇯🇵日本-02"', text)

    def test_QX_行的传输层参数与_tag_保留(self):
        text = ua_diff.mask_credentials(
            "vmess=1.2.3.4:443, method=chacha20, password=hunter2, "
            'obfs-host="cdn.example.org", obfs-uri="/ws", tag="🇭🇰香港-A"')
        self.assertNotIn("hunter2", text)
        self.assertIn('obfs-host="cdn.example.org"', text)
        self.assertIn('obfs-uri="/ws"', text)
        self.assertIn('tag="🇭🇰香港-A"', text)

    def test_URL_与_dict_两条路径口径一致(self):
        """reality 的公钥/short-id 随分享链接公开，两边都不该打。"""
        url = ua_diff.mask_credentials(
            "vless://uuid@1.2.3.4:443?pbk=PUBKEY&sid=SHORTID&sni=a.example#HK")
        mapping = ua_diff.mask_credentials(
            {"type": "vless", "public-key": "PUBKEY", "short-id": "SHORTID"})
        for text in (url, mapping):
            with self.subTest(text=text):
                self.assertIn("PUBKEY", text)
                self.assertIn("SHORTID", text)

    def test_QX_conf_的具名凭据打码(self):
        text = ua_diff.mask_credentials(
            "vless=1.2.3.4:10009,method=none,password=75caee81-fcef,obfs=over-tls,tag=HK-01")
        self.assertNotIn("75caee81", text)
        self.assertIn("obfs=over-tls", text)
        self.assertIn("tag=HK-01", text)

    def test_节点名含_id_或_pass_不会把整行打掉(self):
        """键名用全等/后缀判定而不是子串：Madrid 含 id、Passau 含 pass。"""
        text = ua_diff.mask_credentials('Madrid = vless,1.2.3.4,443,"pw"')
        self.assertIn("vless,1.2.3.4,443", text)
        self.assertNotIn('"pw"', text)

    def test_键名判定的正反例(self):
        for key in ("uuid", "id", "userid", "username", "pass", "password", "passwd",
                    "passphrase", "psk", "pre-shared-key", "token", "secret", "key",
                    "private-key", "wireguard-private-key", "auth", "auth_str",
                    "auth-string", "auth-payload", "api-key", "credential",
                    "obfs-password", "client-secret", "ss-uuid"):
            with self.subTest(key=key):
                self.assertTrue(ua_diff.is_credential_key(key))
        # 这些是写转换分支必须看见的东西，或者本来就公开，一个都不许打
        for key in ("name", "type", "server", "port", "sni", "servername", "tls-name",
                    "host", "tls-host", "path", "network", "transport", "obfs", "tag",
                    "alterId", "public-key", "pbk", "short-id", "sid", "host-key",
                    "Madrid", "Passau", "Users-HK"):
            with self.subTest(key=key):
                self.assertFalse(ua_diff.is_credential_key(key))


# ---------------------------------------------------------------- 原始形态与样例


class NodeRawTest(unittest.TestCase):
    """Node.raw 必须 compare=False：它不参与身份认定，而身份认定就是本工具的结论。"""

    def test_raw_不参与相等与哈希(self):
        a = ua_diff.Node("HK", "vless", "1.2.3.4", 443, raw={"uuid": "x"})
        b = ua_diff.Node("HK", "vless", "1.2.3.4", 443, raw="vless://x@1.2.3.4:443#HK")
        self.assertEqual(a, b)
        self.assertEqual(len({a, b}), 1)      # dict raw 参与哈希的话这里直接 TypeError

    def test_解析器都带上了原始形态(self):
        self.assertEqual(
            ua_diff.parse_nodes(b'{"outbounds":[{"type":"vless","tag":"a",'
                                b'"server":"1.2.3.4","server_port":443}]}', "sing-box")[0].raw,
            {"type": "vless", "tag": "a", "server": "1.2.3.4", "server_port": 443},
        )
        links = ua_diff.parse_nodes(b"vless://uuid@1.2.3.4:443#HK\n", "links")
        self.assertEqual(links[0].raw, "vless://uuid@1.2.3.4:443#HK")
        conf = ua_diff.parse_nodes(LOON_BARE.encode(), "conf")
        self.assertTrue(all("=" in n.raw for n in conf))
        qx = ua_diff.parse_nodes(QX_BARE_B64, "base64-conf")
        self.assertTrue(all(n.raw.startswith(("vless=", "trojan=")) for n in qx))

    def test_clash_解析出的节点带得动样例(self):
        """clash 是最主流的格式。`raw=proxy` 断了不会报错，只会让报告静默降级成
        「（无原始形态）节点名」——所以要走到样例那一步才算钉住。"""
        body = json.dumps({"proxies": [
            {"name": "HK-01", "type": "vless", "server": "1.2.3.4", "port": 443,
             "uuid": "75caee81-fcef-4a2b", "servername": "a.example"},
        ]}).encode()
        nodes = ua_diff.parse_nodes(body, "clash", yq_runner=lambda b: b.decode())
        samples = ua_diff.collect_pending_samples(nodes, "clash")   # clash 下 vless 是待支持
        text = ua_diff.mask_credentials(samples["vless"].raw)
        self.assertIn('"type"', text)
        self.assertIn("1.2.3.4", text)
        self.assertIn("a.example", text)
        self.assertNotIn("75caee81", text)

    def test_vmess_链接解析出的节点带得动样例(self):
        payload = base64.b64encode(
            b'{"ps":"JP-01","add":"2.2.2.2","port":"443","id":"deadbeef-9999","net":"ws"}')
        # base64 格式下 shadowrocket loader 只收 vless/trojan/anytls，vmess 是待支持
        nodes = ua_diff.parse_nodes(base64.b64encode(b"vmess://" + payload), "base64")
        samples = ua_diff.collect_pending_samples(nodes, "base64")
        text = ua_diff.mask_credentials(samples["vmess"].raw)
        self.assertIn("2.2.2.2", text)
        self.assertIn('"net"', text)
        self.assertNotIn("deadbeef", text)

    def test_raw_不同不改变去重与分组(self):
        """同一批节点、两种原始形态：仍是同一份列表，没有幻影增删。"""
        def nodes(raw_style):
            return [
                ua_diff.Node(f"N-{i}", "vless", f"10.0.0.{i}", 443,
                             raw=({"name": f"N-{i}"} if raw_style else f"vless://x@10.0.0.{i}:443"))
                for i in range(3)
            ]

        report = ua_diff.summarize(
            ua_diff.Subscription("x", "https://example.org/sub", "shadowsocket"),
            [
                _probe("(基准)", "—", nodes(False), is_baseline=True, fmt="base64"),
                _probe("mihomo", "1.19.29", nodes(True), fmt="base64"),
            ],
        )
        self.assertEqual(len(report.groups), 1)
        other = next(r for r in report.rows if not r.probe.is_baseline)
        self.assertEqual(other.added, set())
        self.assertEqual(other.removed, set())


class PendingSampleTest(unittest.TestCase):
    """待支持样例：按「格式 × 协议」各取一个，标明来源 UA，凭据打码。"""

    SUB = ua_diff.Subscription("ash.b64", "https://example.org/sub", "shadowsocket")

    CLASH_NODES = [
        ua_diff.Node("HK-01", "vless", "1.2.3.4", 443,
                     raw={"name": "HK-01", "type": "vless", "server": "1.2.3.4",
                          "port": 443, "uuid": "75caee81-fcef-4a2b"}),
        ua_diff.Node("HK-02", "vless", "1.2.3.5", 443,
                     raw={"name": "HK-02", "type": "vless", "server": "1.2.3.5",
                          "port": 443, "uuid": "aaaaaaaa-bbbb"}),
        ua_diff.Node("TU-01", "tuic", "1.2.3.6", 443,
                     raw={"name": "TU-01", "type": "tuic", "server": "1.2.3.6",
                          "port": 443, "password": "hunter2"}),
    ]
    LINK_NODES = [
        ua_diff.Node("JP-01", "vless", "2.2.2.2", 443,
                     raw="vless://deadbeef-2222@2.2.2.2:443#JP-01"),
    ]
    # base64 格式下 vless 是可用的（走 shadowrocket loader），一个待支持都没有
    USABLE_NODES = [ua_diff.Node("OK-01", "vless", "3.3.3.3", 443, raw="vless://x@3.3.3.3:443")]

    def _report(self, rows):
        return ua_diff.summarize(self.SUB, rows)

    def _mixed(self):
        return self._report([
            _probe("(基准)", "—", self.USABLE_NODES, is_baseline=True, fmt="base64"),
            _probe("clash-verge", "2.5.2", self.CLASH_NODES, fmt="clash"),
            _probe("mihomo", "1.19.29", self.LINK_NODES, fmt="links"),
        ])

    def test_有待支持节点时才出现这一节(self):
        text = ua_diff.render_report(self._mixed())
        self.assertIn("待支持样例", text)

    def test_没有待支持节点时不出现(self):
        text = ua_diff.render_report(self._report([
            _probe("(基准)", "—", self.USABLE_NODES, is_baseline=True, fmt="base64"),
            _probe("mihomo", "1.19.29", self.USABLE_NODES, fmt="base64"),
        ]))
        self.assertNotIn("待支持样例", text)

    def test_同格式同协议只出一个样例(self):
        text = ua_diff.render_report(self._mixed())
        self.assertEqual(text.count("clash / vless"), 1)
        self.assertNotIn("HK-02", text)

    def test_同协议跨两种格式出两个样例(self):
        """补分支时改的是具体某个 *_proxy_to_outbound 函数，两个格式要补两处。"""
        text = ua_diff.render_report(self._mixed())
        self.assertIn("clash / vless", text)
        self.assertIn("links / vless", text)

    def test_同格式的不同协议各出一个(self):
        text = ua_diff.render_report(self._mixed())
        self.assertIn("clash / tuic", text)

    def test_样例标明来自哪个_UA(self):
        text = ua_diff.render_report(self._mixed())
        line = next(l for l in text.splitlines() if "clash / vless" in l)
        self.assertIn("来自 clash-verge 2.5.2", line)
        line = next(l for l in text.splitlines() if "links / vless" in l)
        self.assertIn("来自 mihomo 1.19.29", line)

    def test_样例里没有明文凭据(self):
        text = ua_diff.render_report(self._mixed(), wide=True)
        for secret in ("75caee81", "aaaaaaaa", "hunter2", "deadbeef"):
            self.assertNotIn(secret, text)
        self.assertIn("***", text)

    def test_样例保留了字段结构(self):
        """光有指纹写不出转换函数，得看得见有哪些键。"""
        text = ua_diff.render_report(self._mixed(), wide=True)
        self.assertIn('"server": "1.2.3.4"', text)

    def test_默认按宽度截断_wide_给全(self):
        long_raw = {"name": "L", "type": "vless", "server": "1.2.3.4", "port": 443,
                    "备注": "很长的说明" * 40}
        rows = [
            _probe("(基准)", "—", self.USABLE_NODES, is_baseline=True, fmt="base64"),
            _probe("clash-verge", "2.5.2",
                   [ua_diff.Node("L", "vless", "1.2.3.4", 443, raw=long_raw)], fmt="clash"),
        ]
        narrow = ua_diff.render_report(self._report(rows))
        wide = ua_diff.render_report(self._report(rows), wide=True)
        sample = next(l for l in narrow.splitlines() if l.strip().startswith("{"))
        self.assertLessEqual(ua_diff.display_width(sample.strip()), ua_diff.SAMPLE_LIMIT)
        self.assertTrue(sample.strip().endswith("…"))
        # 量的必须是**样例本身**：整行带 8 个缩进空格，截断后照样「超宽」，
        # 拿整行做断言的话「--wide 也截断」这个变异杀不掉。
        wide_sample = next(l for l in wide.splitlines() if l.strip().startswith("{"))
        self.assertFalse(wide_sample.strip().endswith("…"))
        self.assertIn("很长的说明" * 40, wide_sample)
        self.assertGreater(ua_diff.display_width(wide_sample.strip()), ua_diff.SAMPLE_LIMIT)

    def test_失败的探测不贡献样例(self):
        text = ua_diff.render_report(self._report([
            _probe("(基准)", "—", self.USABLE_NODES, is_baseline=True, fmt="base64"),
            _probe("clash-verge", "2.5.2", self.CLASH_NODES, fmt="unknown",
                   status=200, body_len=10, preview="<html>"),
        ]))
        self.assertNotIn("待支持样例", text)

    def test_伪节点不当样例(self):
        text = ua_diff.render_report(self._report([
            _probe("(基准)", "—", self.USABLE_NODES, is_baseline=True, fmt="base64"),
            _probe("clash-verge", "2.5.2", [
                ua_diff.Node("剩余流量：88.03 GB", "vless", "9.9.9.9", 443,
                             raw={"name": "剩余流量：88.03 GB"}),
                ua_diff.Node("HK-01", "vless", "1.2.3.4", 443,
                             raw={"name": "HK-01", "server": "1.2.3.4"}),
            ], fmt="clash"),
        ]))
        self.assertIn("HK-01", text.split("待支持样例", 1)[1])
        self.assertNotIn("88.03", text.split("待支持样例", 1)[1])

    def test_样例取自可用数最高的那一行(self):
        """docstring 明写这条承诺，实现却全靠 setdefault 三个字母——改成直接赋值
        会悄悄变成「取最后一行」。"""
        def clash_row(marker, ss_count):
            nodes = [ua_diff.Node(f"S-{i}", "ss", f"7.7.7.{i}", 8388, raw={"name": f"S-{i}"})
                     for i in range(ss_count)]
            nodes.append(ua_diff.Node("V-1", "vless", "8.8.8.8", 443,
                                      raw={"来源": marker, "type": "vless"}))
            return nodes

        report = self._report([
            _probe("(基准)", "—", self.USABLE_NODES, is_baseline=True, fmt="base64"),
            _probe("mihomo", "1.19.29", clash_row("拿得少", 1), fmt="clash"),
            _probe("clash-verge", "2.5.2", clash_row("拿得多", 4), fmt="clash"),
        ])
        text = ua_diff.render_report(report, wide=True)
        block = text.split("待支持样例", 1)[1]
        self.assertIn("拿得多", block)
        self.assertNotIn("拿得少", block)
        self.assertIn("来自 clash-verge 2.5.2", block)

    def test_低信息量的键挪到末尾(self):
        """截断从末尾切，name/server/port 在表里已经看得到，真正要看的
        reality-opts / ws-opts 不能被它们挤到刀口上。"""
        text = ua_diff.mask_credentials(
            {"name": "HK", "type": "vless", "server": "1.2.3.4", "port": 443,
             "reality-opts": {"public-key": "PUBKEY"}})
        self.assertLess(text.index("reality-opts"), text.index('"server"'))
        self.assertLess(text.index("reality-opts"), text.index('"name"'))

    def test_json_里带样例且同样打码(self):
        data = ua_diff.report_to_dict(self._mixed())
        row = next(r for r in data["rows"] if r["client"] == "clash-verge")
        samples = row["pending_samples"]
        self.assertEqual(sorted(s["type"] for s in samples), ["tuic", "vless"])
        self.assertTrue(all(s["format"] == "clash" for s in samples))
        blob = json.dumps(data, ensure_ascii=False)
        for secret in ("75caee81", "hunter2", "deadbeef"):
            self.assertNotIn(secret, blob)
        self.assertIn("***", blob)


if __name__ == "__main__":
    unittest.main()
