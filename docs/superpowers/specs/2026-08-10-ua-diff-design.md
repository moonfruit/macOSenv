# 订阅 User-Agent 差异探测（ua-diff）设计

日期：2026-08-10

## 目标

找出每个订阅**能拉到最多可用出站节点的 User-Agent**。

机场按 UA 下发不同内容：换格式、按客户端能力裁剪协议、改节点名、塞广告节点。
用 sing-box 自己的 UA 拉，往往只拿到机场认为 sing-box 支持的那一小撮；换成别的
客户端 UA 常能拿到更全的列表，而多出来的节点很多 sing-box 其实支持得了——
把它们捞回来是这个脚本的终极用途。

`clash.txt` 里 `ash` 配 `shadowsocket` 而不是 `sing-box`，正是这个思路的产物。

所以脚本读取 `clash.txt` 的每个有效订阅，用 6 个客户端 × 2 个版本共 12 个 UA
各拉一次，**外加一次当前配置的基准 UA**，比较各自能拿到多少 sing-box 用得上的
节点，给出相对当前配置的增量和推荐。

## 交付物

- `etc/sing-box/ua-diff.py` — 可执行脚本
- `etc/sing-box/test_ua_diff.py` — 标准库 unittest 测试

## 约束

- **限速**：对单一订阅每分钟不得超过 8 次请求。
- **依赖**：系统 python3（3.14）没有 yaml/requests，env 仓库没有 venv。
  只用 Python 标准库 + 外部 `yq`（v4，已安装，仅在响应是 YAML 时调用）。
  不引入 venv，也不依赖 `$WORKSPACE/proxy/sing-rules`。

## 输入格式

`clash.txt` 每行三个字段 `NAME URL CLIENT`，`#` 开头或空行为无效行，跳过。
当前有效行两条（`ash.b64` / `nanocloud.json`），第三条 `xipcloud.yaml` 已注释掉。

第三个字段是 `subscribe.sh` 用的客户端名，本脚本拿它构造**基准 UA**——即
`update.sh` 当前实际发出去的 UA，增量都相对它计算。必须**原样复现**
`subscribe.sh` 的构造规则，不能从 UA 表里挑个近似的，否则增量是假的：

```
CLIENT == "sing-box"  →  SFA/1.13.16 (sing-box 1.13.16)   # subscribe.sh 里硬编码
其他                   →  <CLIENT>/*
```

注意 `ash` 配的是 `shadowsocket`（`shadowrocket` 的拼写错误），所以它实际发的是
`shadowsocket/*`。机场按子串匹配 `shadowrocket` 会失败，落进「无法识别的 UA」
分支，而这类分支通常回退到 base64 链接表——恰恰是节点最全的格式。它能拿到 119 个
节点（sing-box UA 的 `nanocloud` 只有 40 个）多半是这个原因。这个畸形 UA 是有效
的对照项，脚本不能把它「修正」掉。

基准 UA 一般不等于表里任何一项，所以每订阅 12 + 1 = **13 次请求**。

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

纯函数 + 一层 IO，便于单测：

1. `parse_clash_txt(text) -> list[Subscription]` — 解析订阅清单，跳过注释与空行
2. `baseline_ua(client) -> str` — 复现 `subscribe.sh` 的 UA 构造规则
3. `RateLimiter(interval)` — 单订阅内的最小请求间隔，时钟可注入
4. `fetch(url, ua, timeout) -> Response` — `urllib.request`，唯一的网络 IO
5. `detect_format(body) -> str` — 响应体嗅探
6. `parse_nodes(body, fmt) -> list[Node]` — 按格式提取节点
7. `normalize_type(t) -> str` / `fingerprint(node) -> str` — 归一化
8. `is_pseudo_node(name) -> bool` — 伪节点识别
9. `tier_of(type) -> str` — 可用性分级，返回 `usable` / `pending` / `unusable`
10. `summarize(results, baseline) -> Report` — 算增量、分组、挑推荐

### 限速与并发

每个订阅一个 worker 线程；订阅内 13 次请求（12 个 UA + 1 个基准）**串行**，
相邻请求最小间隔 `--interval`（默认 8.0 秒 → 7.5 req/min，安全低于 8）；
订阅之间**并行**。限速是「对单一连接」的，所以订阅间并行不违反约束。
总耗时约 13×8 ≈ 104 秒，与订阅数量无关。

若基准 UA 恰好与表中某项完全相同，则复用该次请求，退化为 12 次。

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

节点计数一律按**指纹集合大小**，不按行数。机场的伪节点常复用真实节点的
`server:port`（`ash` 的前三行就是），按行数会虚高。

### 伪节点识别

机场把套餐信息塞成节点，`ash` 的前三条就是：

```
剩余流量：88.03 GB
距离下次重置剩余：24 天
套餐到期：2027-03-03
```

它们是合法的 `vless://` URL，但复用了真实节点的 server:port。按节点名关键词识别：
`流量`、`到期`、`过期`、`剩余`、`重置`、`套餐`、`续费`、`官网`、`订阅`、`通知`、
`机场`、`群组`、`客服`、`http://`、`https://`、`t.me/`。

命中的从「可用节点数」里剔除，但在报告中单独列一行告知识别了几个、都是谁——
关键词有误伤真节点的可能（比如名字里带「流量」的中转节点），静默过滤会让人看不见。

### 节点可用性分级

三档，判据是**这个节点最终能不能进 sing-box 配置**：

| 档 | 含义 | 类型 |
|---|---|---|
| ✅ 可用 | `clash-to-sing.py` 已有转换分支 | `anytls` `hysteria2` `shadowsocks`(ss) `trojan` `tuic` `vless` `vmess` |
| ⚠️ 待支持 | sing-box 内核支持，但 `clash-to-sing.py` 没写分支 | `hysteria`(v1) `shadowtls` `wireguard` `ssh` `tor` `http` `socks` |
| ✖️ 不可用 | sing-box 不支持 | `ssr` `snell` 及其余未知类型 |

「⚠️ 待支持」这一档是重点：如果某个 UA 多拉到的是这类节点，结论不是「拉不回来」，
而是「值得去 `clash-to-sing.py` 加个分支」。两种情况必须分开报，否则会白白放弃。

✅ 档的清单来自 `$WORKSPACE/proxy/sing-rules/clash-to-sing.py` 的
`clash_proxy_to_outbound` / `url_proxy_to_outbound` 实际分支，写在脚本顶部常量里
并注明来源，那边加了新协议要同步过来。

### 比较

以基准 UA（`clash.txt` 当前配置）的可用节点集合为参照，每个 UA 算：

- 可用节点数（✅ 档、去伪节点、按指纹去重）
- 相对基准的**增量**：多了哪些指纹、少了哪些指纹
- 增量中 ⚠️ 待支持 与 ✖️ 不可用 各有多少，分别列出类型分布

同时按 `FP` 集合给 13 个结果分组，展示哪些 UA 拿到的是同一份列表；`FP` 相同但
`NAMES` 不同的标注为「仅命名差异」。

## 输出

终端表格，中文/Emoji 宽度用 `unicodedata.east_asian_width` 自算对齐。按可用节点数
从多到少排序，基准行标 `←当前`：

```
▌ ash.b64   基准 UA: shadowsocket/*
  CLIENT          VERSION   STATUS  FORMAT   可用   Δ   待支持  不可用  伪
  loon            3.5.0        200  conf     127   +11      4       0    3
  shadowrocket    2.2.90       200  base64   119    +3      0       0    3
  (基准)          —            200  base64   116     —      0       0    3  ←当前
  sing-box        1.13.18      200  sing-box  40   -76      0       0    0
  …

  ✔ 推荐 loon（+11 可用节点）
      多出的 11 个：vless×7 trojan×4
      另有 4 个 shadowtls 属「待支持」——sing-box 支持，clash-to-sing.py 缺分支
      建议行：ash.b64 https://staticasset.flowaccess.org/... loon
      注意：subscribe.sh 会把它渲染成 loon/*，不是实测用的完整 UA，见「已知限制」

  ℹ 识别到 3 个伪节点（已从计数剔除）：剩余流量：88.03 GB / 距离下次重置剩余：24 天 / 套餐到期：2027-03-03
```

`--json` 输出结构化结果供脚本消费；`--dump DIR` 保存原始响应
（`<name>.<client>.<version>.raw`）供事后排查。默认不落盘，因为响应含订阅 token。

脚本只打印建议行，不改 `clash.txt`——机场的下发策略随时会变，自动写回风险高。

## CLI

```
ua-diff.py [-f FILE] [--only NAME]... [--client NAME]...
           [--interval SECONDS] [--timeout SECONDS]
           [--dump DIR] [--json] [--wide] [--no-proxy]
```

退出码：`0` 当前 UA 已最优 / `1` 存在更优 UA / `2` 有请求或解析失败。
同时满足多条时取最大值，即有失败一律返回 `2`。

## 已知限制

`subscribe.sh` 把 `clash.txt` 第三列渲染成 `<CLIENT>/*`（`sing-box` 除外），
所以脚本推荐的 UA 和 `update.sh` 实际会发出的 UA **不是一回事**。推荐 `loon` 时，
实测用的是 `Loon/3.5.0 (iPhone; iOS 18.6; Scale/3.00)`，而 `update.sh` 会发
`loon/*`——机场对这两者的响应可能不同。

报告在建议行下方明确提示这一点。要真正吃到实测结果，得改 `subscribe.sh` 支持完整
UA，或在 `clash.txt` 第三列直接写完整 UA 串。这两项都超出本脚本范围，由使用者决定。

## 错误处理

单个请求失败（超时、非 200、解析失败）只记录该行状态，不中断同订阅的其余请求，
也不影响其他订阅。某订阅全部请求失败时在报告中单独标出。Ctrl-C 优雅退出，
已完成的部分照常输出。

`yq` 不在 PATH 时，clash YAML 格式降级为 `unknown` 并给出明确提示，其余格式不受影响。

## 测试

`test_ua_diff.py`，标准库 unittest，`python3 -m unittest` 运行，零第三方依赖。
覆盖全部纯函数：

- `parse_clash_txt` — 注释行、空行、字段缺失
- `baseline_ua` — `sing-box` 走硬编码串，其余走 `<client>/*`，含 `shadowsocket` 这例
- `detect_format` — 六种格式各一例 + 边界（空响应、HTML 错误页）
- `parse_nodes` — sing-box JSON / clash YAML / base64 / conf 四类，含 `vmess://`
  的 base64 内嵌 JSON 载荷
- `normalize_type` / `fingerprint` — 别名、大小写
- `is_pseudo_node` — 三个真实伪节点名命中，正常节点名不命中
- `tier_of` — 三档各取样，未知类型落 `unusable`
- `RateLimiter` — 注入假时钟，断言间隔不小于设定值
- `summarize` — 增量计算、分组、推荐选择，含「基准已最优」的情况

网络与 `yq` 调用注入替身，测试不联网。测试样本用 `ash.b64` / `nanocloud.json`
的真实片段（脱敏后内联在测试文件里）。
