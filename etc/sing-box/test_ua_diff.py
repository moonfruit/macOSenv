#!/usr/bin/env python3
"""ua-diff.py 的单元测试。运行：/opt/homebrew/bin/python3 -m unittest test_ua_diff -v"""

import base64
import contextlib
import importlib.util
import io
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
    def test_sing_box_走硬编码串(self):
        self.assertEqual(ua_diff.baseline_ua("sing-box"), "SFA/1.13.16 (sing-box 1.13.16)")

    def test_其余客户端走通配形式(self):
        self.assertEqual(ua_diff.baseline_ua("clash"), "clash/*")

    def test_看着像拼错的客户端名也原样保留(self):
        # 机场按子串匹配不上的 UA 会落进「无法识别」分支，那正是要测的对照项，不能修正
        self.assertEqual(ua_diff.baseline_ua("shadowsocket"), "shadowsocket/*")


class UaTableTest(unittest.TestCase):
    def test_六个客户端各两个版本(self):
        self.assertEqual(len(ua_diff.UA_TABLE), 6)
        for client, entries in ua_diff.UA_TABLE.items():
            self.assertEqual(len(entries), 2, f"{client} 应有最新与旧版两项")
            for version, ua in entries:
                self.assertTrue(version and ua, f"{client} 的条目不完整")

    def test_十二个_UA_串两两不同(self):
        """UA 串必须唯一。

        build_ua_plan 用 `ua == base` 判定基准去重，若表里有两条 UA 串相同，
        后一条会 last-match-wins 地覆盖掉基准项，悄悄改变基准是谁。
        """
        uas = [ua for entries in ua_diff.UA_TABLE.values() for _, ua in entries]
        self.assertEqual(len(uas), 12)
        self.assertEqual(len(set(uas)), 12, "UA 串有重复")


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

    def test_十三次请求的总跨度不低于限速要求(self):
        # 13 次请求 × 8 秒间隔 = 96 秒跨度，即 12 个间隔。
        # 以 8 秒间隔调度的请求恰好填满 60 秒窗口，无富余。
        limiter = ua_diff.RateLimiter(8.0, clock=self.clock, sleeper=self.sleeper)
        start = self.now
        for _ in range(13):
            limiter.wait()
        self.assertGreaterEqual(self.now - start, 12 * 8.0)

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
        self.assertEqual(len(plan), 13)  # 12 个 UA + 1 个基准

    def test_基准与表中某项相同时复用不重复请求(self):
        sub = ua_diff.Subscription("x", "https://example.org/sub", "sing-box")
        original = ua_diff.SING_BOX_BASELINE_UA
        try:
            # 把基准串改成与表中最新 sing-box 项一致，验证去重
            ua_diff.SING_BOX_BASELINE_UA = "SFI/1.13.18 (sing-box 1.13.18)"
            plan = ua_diff.build_ua_plan(sub, None)
        finally:
            ua_diff.SING_BOX_BASELINE_UA = original
        self.assertEqual(len(plan), 12)
        self.assertEqual(sum(1 for entry in plan if entry[3]), 1)

    def test_按客户端过滤时基准仍保留(self):
        sub = ua_diff.Subscription("ash.b64", "https://example.org/sub", "shadowsocket")
        plan = ua_diff.build_ua_plan(sub, ["loon"])
        self.assertEqual(len(plan), 3)  # 基准 + loon 两个版本
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
        self.assertEqual(len(probes), 13)
        self.assertEqual(len(seen), 13)
        self.assertEqual(len(slept), 12)  # 首次不等待，其余 12 次各等一轮
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
        self.assertEqual(len(probes), 13)
        # 首次请求前不限速，其余 12 次请求前各限速一次，失败不改变这个节奏
        expected = ["fetch"] + ["sleep", "fetch"] * 12
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
        self.assertEqual(len(probes), 13)
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
        self.assertEqual(len(probes), 13)
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
        self.assertEqual(len(probes), 13)

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
        self.requests = []

    def _fetcher(self, url, ua, timeout):
        self.requests.append((url, ua))
        return ua_diff.Response(200, self.BODY)

    def run_main(self, *argv, fetcher=None):
        """跑一次 main，返回 (退出码, stdout, stderr)。"""
        out, err = io.StringIO(), io.StringIO()
        with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
            code = ua_diff.main(
                ["-f", str(self.list_file), *argv],
                fetcher=fetcher or self._fetcher,
                sleeper=lambda seconds: None,
                clock=lambda: 0.0,
            )
        return code, out.getvalue(), err.getvalue()

    # ---- --only / --client 过滤 ----

    def test_默认测清单里全部有效订阅(self):
        code, out, _ = self.run_main()
        self.assertEqual(code, 0)
        self.assertEqual(len(self.requests), 26)  # 2 个订阅 × 13 次
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
        code, _, _ = self.run_main("--only", "ash.b64", "--client", "loon")
        self.assertEqual(code, 0)
        # 基准 + loon 两个版本
        self.assertEqual(len(self.requests), 3)
        uas = [ua for _, ua in self.requests]
        self.assertEqual(uas[0], "shadowsocket/*")
        self.assertTrue(all(u.startswith("Loon/") for u in uas[1:]))

    def test_client_写错名字直接报错而不是静默退化(self):
        """写错名字会让计划只剩基准一项，然后发一次请求就宣布「已最优」。"""
        for bad in ("loonn", "Loon", "LOON"):
            with self.subTest(bad=bad):
                with self.assertRaises(SystemExit) as ctx:
                    self.run_main("--client", bad)
                self.assertEqual(ctx.exception.code, 2)  # argparse 的 error 用 2
                self.assertEqual(self.requests, [])

    def test_client_报错时列出可选值(self):
        err = io.StringIO()
        with contextlib.redirect_stderr(err), self.assertRaises(SystemExit):
            ua_diff.main(["-f", str(self.list_file), "--client", "loonn"],
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
        self.assertEqual(len(self.requests), 13)

    def test_force_interval_也不放行非正间隔(self):
        with self.assertRaises(SystemExit):
            self.run_main("--interval", "0", "--force-interval")
        self.assertEqual(self.requests, [])

    # ---- --dump ----

    def test_默认不落盘(self):
        self.run_main("--only", "ash.b64")
        self.assertEqual([p.name for p in self.root.iterdir()], ["clash.txt"])

    def test_dump_写盘且目录权限为_700(self):
        dump = self.root / "dump"
        code, _, _ = self.run_main("--only", "ash.b64", "--dump", str(dump))
        self.assertEqual(code, 0)
        files = sorted(p.name for p in dump.iterdir())
        self.assertEqual(len(files), 13)
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

    def test_json_加_show_url_时保留完整_URL(self):
        code, out, _ = self.run_main("--only", "ash.b64", "--json", "--show-url")
        self.assertEqual(code, 0)
        self.assertIn("token=aaa", out)

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
            if ua.startswith("Loon/3.5.0"):
                links += b"vless://uuid@5.6.7.8:443#HK-02\n"
            return ua_diff.Response(200, self.b64(links))

        code, out, _ = self.run_main("--only", "ash.b64", fetcher=fetcher)
        self.assertEqual(code, 1)
        self.assertIn("推荐 loon", out)

    def test_返回明文_links_的_UA_节点再多也不推荐(self):
        """集成回归：links 下游会被无条件 b64decode 崩掉，不算收益。

        曾经 links 在可用表里：这个 UA 会因为「可用数最多」排第一、给出推荐、
        退出码 1，用户照做后 clash-to-sing.py 直接 binascii.Error。
        """
        def fetcher(url, ua, timeout):
            if ua.startswith("Loon/3.5.0"):
                # 明文链接表，而且节点数是基准的 5 倍
                return ua_diff.Response(200, b"".join(
                    b"vless://uuid@10.0.0.%d:443#N-%d\n" % (i, i) for i in range(1, 6)))
            return ua_diff.Response(200, self.BODY)

        code, out, _ = self.run_main("--only", "ash.b64", fetcher=fetcher)
        self.assertEqual(code, 0)
        self.assertNotIn("推荐 loon", out)
        self.assertIn("当前 UA 已最优", out)
        # 但不能装作没看见：那 5 个节点要出现在「待支持」列里
        loon_line = next(l for l in out.splitlines() if "loon" in l and "3.5.0" in l)
        self.assertIn("links", loon_line)
        self.assertRegex(loon_line, r"\s0\s")   # 可用 0
        self.assertIn("5", loon_line)           # 待支持 5

    def test_退出码_2_基准探测失败(self):
        def fetcher(url, ua, timeout):
            if ua == "shadowsocket/*":
                return ua_diff.Response(0, b"", "连接超时")
            return ua_diff.Response(200, self.BODY)

        code, out, _ = self.run_main("--only", "ash.b64", fetcher=fetcher)
        self.assertEqual(code, 2)
        self.assertIn("基准 UA 探测失败", out)

    def test_个别_UA_拿到_HTML_不影响退出码(self):
        """12 个陌生 UA 里出现 unknown 是常态，不该把退出码钉死在 2。"""
        def fetcher(url, ua, timeout):
            if ua.startswith("Loon/"):
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
        _, _, err = self.run_main("--only", "ash.b64", "--client", "loon")
        self.assertIn("最多每个 3 次请求", err)


if __name__ == "__main__":
    unittest.main()
