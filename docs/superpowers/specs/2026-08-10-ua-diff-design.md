# 订阅 User-Agent 差异探测（ua-diff）设计

日期：2026-08-10

## 目标

读取 `etc/sing-box/clash.txt` 中的每个有效订阅，分别用 6 个主流代理客户端 ×
2 个版本共 12 个 User-Agent 各拉取一次，比较不同 UA 拿到的出站节点是否有差异。

机场普遍按 UA 识别客户端并下发不同内容：换格式（clash YAML / sing-box JSON /
base64 链接表 / Loon conf）、按客户端能力裁剪协议、改节点名、塞广告节点。这个脚本
就是把这些差异摊开看。

## 交付物

- `etc/sing-box/ua-diff.py` — 可执行脚本
- `etc/sing-box/test_ua_diff.py` — 标准库 unittest 测试

## 约束

- **限速**：对单一订阅每分钟不得超过 8 次请求。
- **依赖**：系统 python3（3.14）没有 yaml/requests，env 仓库没有 venv。
  只用 Python 标准库 + 外部 `yq`（v4，已安装，仅在响应是 YAML 时调用）。
  不引入 venv，也不依赖 `$WORKSPACE/proxy/sing-rules`。

## 输入格式

`clash.txt` 每行三个字段 `NAME URL UA`，`#` 开头或空行为无效行，跳过。
当前有效行两条（`ash.b64` / `nanocloud.json`），第三条 `xipcloud.yaml` 已注释掉。
第三个字段是现有 `subscribe.sh` 用的客户端提示，本脚本忽略它——本脚本要遍历所有 UA。

## UA 表

内置在脚本顶部，6 客户端 × 2 版本 = 12 次请求/订阅。

| 客户端 | 最新 | 广泛使用的旧版 |
|---|---|---|
| mihomo | `mihomo/v1.19.29` | `mihomo/v1.18.10` |
| clash-verge | `clash-verge/v2.5.2` | `clash-verge/v2.4.7` |
| shadowrocket | `Shadowrocket/2.2.90 (iPhone; iOS 18.6; Scale/3.00)` | `Shadowrocket/2.2.65 (…)` |
| loon | `Loon/3.5.0 (iPhone; iOS 18.6; Scale/3.00)` | `Loon/3.2.6 (…)` |
| sing-box | `SFI/1.13.18 (sing-box 1.13.18)` | `SFI/1.12.25 (sing-box 1.12.25)` |
| quantumult-x | `Quantumult%20X/1.6.0 (iPhone; iOS 18.6)` | `Quantumult%20X/1.5.1 (…)` |

旧版选的是**上一个 minor 系列的末版**，而不是上一个 tag——patch 之间机场不会区别
对待，minor 跨越才可能带来协议特性差异。这些分界点恰好卡在分水岭上：Loon 3.3.0 才
加入 VLESS Reality，sing-box 1.13 与 1.12 的配置结构不同。

版本来源：mihomo / clash-verge / sing-box 由 GitHub Releases 实测；Shadowrocket /
Loon / Quantumult X 的最新版由 iTunes Lookup API 实测，旧版取约一年前有明确发布
记录的版本（闭源无公开版本分布数据）。表中每条带注释标注日期与来源，可手工修改。

## 架构

七个纯函数 + 一层 IO，便于单测：

1. `parse_clash_txt(text) -> list[Subscription]` — 解析订阅清单，跳过注释与空行
2. `RateLimiter(interval)` — 单订阅内的最小请求间隔，时钟可注入
3. `fetch(url, ua, timeout) -> Response` — `urllib.request`，唯一的网络 IO
4. `detect_format(body) -> str` — 响应体嗅探
5. `parse_nodes(body, fmt) -> list[Node]` — 按格式提取节点
6. `fingerprint(node) -> str` / `normalize_type(t) -> str` — 归一化
7. `group_results(results) -> list[Group]` — 按指纹集合分组并算差异

### 限速与并发

每个订阅一个 worker 线程；订阅内 12 次请求**串行**，相邻请求最小间隔
`--interval`（默认 8.0 秒 → 7.5 req/min，安全低于 8）；订阅之间**并行**。
限速是「对单一连接」的，所以订阅间并行不违反约束。总耗时约 12×8 ≈ 88 秒，
与订阅数量无关。

### 格式嗅探

按响应体嗅探，不信 `Content-Type`——机场常返回 `text/plain` 或
`application/octet-stream`。判定顺序：

| 格式 | 判定 | 节点提取 |
|---|---|---|
| `sing-box` | 可 json 解析且含 `outbounds` | `outbounds` 中排除 direct/block/dns/selector/urltest |
| `clash` | 含 `proxies:` | `yq -p yaml -o json` 后取 `.proxies[]` |
| `base64` | 纯 base64 字符集，解码后含 `://` | 解码后逐行 `urlparse` |
| `links` | 行首是 `ss://` `vmess://` `vless://` `trojan://` `hysteria2://` 等 | 逐行 `urlparse` |
| `conf` | 含 `[Proxy]` 或 `[server_local]` 段 | 段内 `name = type, server, port, …` |
| `unknown` | 其余 | 节点数记 `-`，报告字节数与前 80 字节 |

### 节点归一化

节点归一为 `Node(name, type, server, port)`，产出两个集合：

- **指纹集合** `FP` = `{type://server:port}`，type 做别名归一
  （`shadowsocks`→`ss`、`hy2`→`hysteria2`、大小写统一）
- **名称集合** `NAMES` = `{node.name}`

指纹不含 uuid/password 等凭据——同一节点在不同格式下凭据字段名不同，且不影响
「是不是同一个出口」的判断。

### 比较

按 `FP` 集合把 12 个结果分组。只有一组 → 一致；多组 → 以节点数最多的组为基准，
逐组列出「独有」与「缺失」的指纹。

`NAMES` 单独一节比较：`FP` 相同但 `NAMES` 不同标注为「仅命名差异」——机场对不同
客户端改节点名、塞广告节点很常见。

## 输出

终端表格，中文/Emoji 宽度用 `unicodedata.east_asian_width` 自算对齐：

```
▌ ash.b64
  CLIENT           VERSION    STATUS  FORMAT       NODES  FP-HASH   NAME-HASH
  mihomo           1.19.29       200  clash          128  a1b2c3d4  9f8e7d6c
  shadowrocket     2.2.90        200  base64         135  5e4d3c2b  1a2b3c4d
  …
  ✘ 发现 2 组不同的出站节点集合
    组 A (128)  mihomo×2, clash-verge×2, sing-box×2
    组 B (135)  shadowrocket×2, loon×2, quantumult-x×2
      B 独有 7 个：vless://1.2.3.4:443, trojan://5.6.7.8:443, …
```

`--json` 输出结构化结果供脚本消费；`--dump DIR` 保存原始响应
（`<name>.<client>.<version>.raw`）供事后排查。默认不落盘，因为响应含订阅 token。

## CLI

```
ua-diff.py [-f FILE] [--only NAME]... [--client NAME]...
           [--interval SECONDS] [--timeout SECONDS]
           [--dump DIR] [--json] [--wide] [--no-proxy]
```

退出码：`0` 无差异 / `1` 有差异 / `2` 有请求或解析失败。同时满足多条时取最大值，
即有失败一律返回 `2`。

## 错误处理

单个请求失败（超时、非 200、解析失败）只记录该行状态，不中断同订阅的其余请求，
也不影响其他订阅。某订阅全部请求失败时在报告中单独标出。Ctrl-C 优雅退出，
已完成的部分照常输出。

`yq` 不在 PATH 时，clash YAML 格式降级为 `unknown` 并给出明确提示，其余格式不受影响。

## 测试

`test_ua_diff.py`，标准库 unittest，`python3 -m unittest` 运行，零第三方依赖。
覆盖全部纯函数：clash.txt 解析（含注释行、空行、字段缺失）、格式嗅探（六种格式
各一例 + 边界）、四种主要格式的节点提取、指纹归一化（别名、大小写）、限速器
（注入假时钟，断言间隔）、分组与差异计算。网络与 `yq` 调用注入替身，测试不联网。
