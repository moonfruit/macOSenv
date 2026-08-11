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

第三列写什么就发什么，哪怕它看着像拼错了。机场按子串匹配不上的 UA 会落进「无法
识别的 UA」分支，而这类分支通常回退到 base64 链接表——恰恰是节点最全的格式。
`ash` 能拿到 119 个节点（sing-box UA 的 `nanocloud` 只有 40 个）多半就是这个原因。
这类畸形 UA 是有效的对照项，脚本不能把它「修正」掉。

（`clash.txt` 的实际取值会变，本文不指认具体是哪个值——规则是「原样复现」，
测试夹具里用一个刻意拼错的串来验证这条规则，与当前配置里写的是什么无关。）

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
9. `tier_of(type, fmt) -> str` — 可用性分级，返回 `usable` / `pending` / `unusable`；
   **分级与订阅格式相关**，见「节点可用性分级」
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
  （`shadowsocks`→`ss`、`hy2`→`hysteria2`、大小写统一）；`server` 也必须归一
  （小写化、剥掉 IPv6 字面量的方括号）——各解析器给出的形态不一致：`urlparse.hostname`
  会小写化并剥方括号，YAML/conf 解析器原样保留。不归一的话同一节点跨格式会算成两个，
  凭空造出 `added`/`removed` 的幻影条目，分组也会被拆开。
- **名称集合** `NAMES` = `{node.name}`（不含伪节点）

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

三档，判据是**这个节点最终能不能进 sing-box 配置**。

关键：`clash-to-sing.py` 的转换分支是**按订阅格式分裂**的，不是一个全局集合。
同一个协议在格式 A 下能转、在格式 B 下会抛异常。所以 ✅ 档必须按格式索引：

| 订阅格式 | 下游 loader | ✅ 可用的类型 |
|---|---|---|
| `clash` | `load_clash_proxies` → `clash_proxy_to_outbound`（`:179`） | `hysteria2` `ss` `trojan` `vmess` |
| `base64` | `load_shadowrocket_proxies` → `shadowrocket_proxy_to_outbound`（`:251`） | `vless` `trojan` `anytls` |
| `sing-box` | `load_sing_box_proxies` → `sing_box_proxy_to_outbound`（`:343`） | 透传，全收 |
| `links` | `load_shadowrocket_proxies` 会对**明文**做无条件 b64decode → 抛异常 | 无 |
| `conf` / `unknown` | **没有 loader** | 无 |

注意 `clash` 收 `vmess`/`ss` 但**不收** `vless`，`shadowrocket` 收 `vless` 但**不收**
`ss`/`vmess`/`hysteria2`，两个函数**都没有** `tuic` 分支。

明文 `links` 与 `conf` 同档，一个可用节点都没有，原因值得写清楚：`subscribe.sh` 把
响应体**原样**落盘，`sing-rules/config/config.json` 里该订阅的 `format` 只能是
`shadowrocket`，于是明文链接表会走 `load_shadowrocket_proxies`（`:1054`）的**无条件**
`base64.b64decode`。明文里有 `:` `#` `/`，解码当场 `binascii.Error: Incorrect padding`，
那边**没有** try/except——不是「解出垃圾少几个节点」，是整个 `clash-to-sing.py` 崩掉。
所以「某个 UA 返回明文 links」永远不能算作收益，否则会给出一条照做就炸的建议。
（能捞回来的路子有两条：给下游补一个 links loader，或让 `subscribe.sh` 对明文补一次
base64 编码——正因为补得回来，才是 ⚠️ 待支持而不是 ✖️ 不可用。）

| 档 | 含义 |
|---|---|
| ✅ 可用 | **在该格式下**有转换分支（见上表） |
| ⚠️ 待支持 | sing-box 内核支持，但该格式下管线没有分支 |
| ✖️ 不可用 | sing-box 内核都不支持：`ssr` `snell` 及其余未知类型 |

「⚠️ 待支持」涵盖三种情况：转换函数缺 `case`（如 `clash` 格式下的 `vless`）、
整个格式都没有 loader（如 `conf`）、loader 读得进但读出来是垃圾（明文 `links`）。
三者的行动建议是同一句——去 `clash-to-sing.py` 补，补了就能捞回来。同一个类型在格式 A 下 `pending`、在格式 B 下
`usable` 是正常的，判据本来就是「从**这种**响应里读出来的它能不能进 config.json」。

这一档是重点：如果某个 UA 多拉到的是这类节点，结论不是「拉不回来」，而是
「值得去加个分支」。三种情况必须分开报，否则会白白放弃。

`sing-box` 格式是透传，管线不拦任何类型，但内核仍得认得它，所以用「内核支持全集」
作近似。这个近似只会偏保守（新版内核加的协议还没抄进来 → 判成不可用），不会把真正
不可用的判成可用。

两个非透传函数的 `case _` 都 `raise ValueError`，而调用方 `proxy_to_outbound`
（`:131`）**没有 try/except**。所以误判为可用的后果不是「跳过一个节点」，而是
`clash-to-sing.py` 崩溃、`update.sh` 生成不出 `config.json`。这张表写在脚本顶部常量
里并注明来源行号，那边加了新协议必须同步过来。

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

格式认不出来时（`fmt=unknown`）计数列一律记 `-`——那时的「0 个节点」是解析器的
沉默而不是事实——并在下方给出诊断行：响应多少字节、开头长什么样（转义后截断）。

```
▌ ash.b64   基准 UA: shadowsocket/*
  CLIENT          VERSION   STATUS  FORMAT   可用   Δ   待支持  不可用  伪
  shadowrocket    2.2.90       200  base64   119    +3      0       0    3
  (基准)          —            200  base64   116     —      0       0    3  ←当前
  loon            3.5.0        200  conf       0    -116  127       0    3
  sing-box        1.13.18      200  sing-box  40   -76      0       0    0
  mihomo          1.19.29      200  unknown    -     —      -       -    -
  …

  ✘ mihomo 1.19.29：无法识别的响应格式，共 1024 字节，前 80 字节：<html><head><title>403 F…

  ✔ 推荐 shadowrocket（+3 可用节点）
      多出的 3 个：vless×3
      建议行：ash.b64 https://staticasset.flowaccess.org/... shadowrocket
      注意：subscribe.sh 会把它渲染成 shadowrocket/*，不是实测用的完整 UA，见「已知限制」

  ℹ shadowrocket 2.2.90 识别到 3 个伪节点（已从计数剔除）：剩余流量：88.03 GB / 距离下次重置剩余：24 天 / 套餐到期：2027-03-03（另有 3 个 UA 也识别到伪节点）

  ℹ 3 组不同的节点列表：
      组 A（119 可用）  shadowrocket 2.2.90, shadowrocket 2.2.65  ← 仅命名差异
      组 B（116 可用）  (基准) —
      组 C（40 可用）   sing-box 1.13.18, sing-box 1.12.25
```

注意示例里的 `loon`：它拿到 127 个节点，但格式是 `conf`——下游没有 loader，
一个都用不上，所以 ✅ 列是 `0`、全部落进「待支持」，也不会被推荐。伪节点提示带上
是哪个 UA 的，因为这是逐 UA 统计的，不是全局结论。

`--json` 输出结构化结果供脚本消费（订阅 URL 默认打码，`--show-url` 还原）；
`--dump DIR` 保存原始响应（`<name>.<client>.<version>.raw`）供事后排查，目录按 `0700`
创建。默认不落盘，因为响应含订阅 token。

脚本只打印建议行，不改 `clash.txt`——机场的下发策略随时会变，自动写回风险高。

## CLI

```
ua-diff.py [-f FILE] [--only NAME]... [--client NAME]...
           [--interval SECONDS] [--timeout SECONDS] [--force-interval]
           [--dump DIR] [--json] [--show-url] [--wide] [--no-proxy]
```

`--client` 的取值必须是 UA 表里的键（全小写）。写错名字会让计划只剩基准一项，
然后发一次请求就自信地宣布「当前 UA 已最优」，所以未知客户端一律 `parser.error`
并列出可选值，不接受静默退化。

`--interval` 低于 `7.5` 会被拒绝——限速是本项目唯一的硬约束，唯一的执行点不能只是
一句 stderr 告警然后照跑。确实要压测得显式加 `--force-interval`；非正的间隔即便加了
也不放行。默认 `8.0` 秒。

`--json` 默认把订阅 URL 打码（`--json > report.json` 常被顺手分享出去，而 URL 含
token）；`--show-url` 还原。终端里的建议行始终是全量 URL——它要能直接复制粘贴回
`clash.txt`。

`--dump` 的目录按 `0700` 创建（已存在则收紧），落盘内容是完整订阅响应，含全部节点
凭据。写盘失败只记一行告警，不中断该订阅剩余的探测。

退出码：`0` 当前 UA 已最优 / `1` 存在更优 UA / `2` 结论不可信。多个订阅取最大值。

`2` 只留给**基准探测失败**（没有参照物）或**某订阅全部探测失败**（没有数据）这两种
情形。个别陌生 UA 拿到 HTML（`fmt=unknown`）是 12 个 UA 里的常态而非异常——若它也
算 `2`，退出码就退化成常量 `2`，`0`/`1` 永远不可达。这类失败在报告里已有 ✘ 行逐条
告知。Ctrl-C 中断同样返回 `2`（结果不完整）。

## 已知限制

`subscribe.sh` 把 `clash.txt` 第三列渲染成 `<CLIENT>/*`（`sing-box` 除外），
所以脚本推荐的 UA 和 `update.sh` 实际会发出的 UA **不是一回事**。推荐 `loon` 时，
实测用的是 `Loon/3.5.0 (iPhone; iOS 18.6; Scale/3.00)`，而 `update.sh` 会发
`loon/*`——机场对这两者的响应可能不同。

报告在建议行下方明确提示这一点。要真正吃到实测结果，得改 `subscribe.sh` 支持完整
UA，或在 `clash.txt` 第三列直接写完整 UA 串。这两项都超出本脚本范围，由使用者决定。

### 推荐的 UA 可能返回下游读不了的格式

`clash-to-sing.py` 的输入格式在 `sing-rules/config/config.json` 里**按订阅写死**
（如 `"format": "shadowrocket"`），`load_proxies`（`:1092`）只认 `clash` /
`shadowrocket` / `sing-box` 三种，其中 `shadowrocket` 会对响应体**无条件**
`base64.b64decode`。于是换 UA 有三种翻车法：

- 推荐 `loon`（响应是 `conf`）→ 下游没有任何 loader 能读
- 推荐一个返回**明文** `links` 的 UA → 对明文做 b64decode，`binascii.Error` 崩掉
  （所以 `links` 格式的节点一律记 ⚠️ 待支持，见「节点可用性分级」，压根不会被推荐）
- 推荐一个格式变了但仍受支持的 UA（`base64` → `clash`）→ 用户还得同步改
  `config.json` 的 `format` 字段，否则一样炸

所以推荐块必须自检：格式不在 `{base64, clash, sing-box}` 里就标注「下游
`clash-to-sing.py` 无法解析此格式，本推荐不可直接采用」；格式与基准不同但仍受支持，
就提示「还需把 `sing-rules/config/config.json` 里该订阅的 `format` 改成 X」。

## 错误处理

单个请求失败（超时、非 200、解析失败）只记录该行状态，不中断同订阅的其余请求，
也不影响其他订阅。某订阅全部请求失败时在报告中单独标出。

Ctrl-C 优雅退出，已完成的部分照常输出。**不能**用 `with ThreadPoolExecutor(...)`：
它的 `__exit__` 是 `shutdown(wait=True)`，异常传播时会先把所有 worker 等完，而
`max_workers == 订阅数`意味着每个订阅都在跑、一个都取消不掉，于是 Ctrl-C 先卡住
最长 12×`interval` 秒再把结果全丢掉——比不处理还糟。正确做法是显式
`submit` + `as_completed`，配一个 `threading.Event`：worker 在循环里检查它（限速前后
各一次），主线程收到 `KeyboardInterrupt` 就置位、短暂等在途请求收尾（避免
`future.done()` 的竞态），再渲染已完成的部分。

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
- `tier_of` — **逐格式**取样，含「clash 下 vless 不可用」「shadowrocket 下 ss 不可用」
  「conf 一律不可用」这几条会让 `update.sh` 崩掉的回归
- `RateLimiter` — 注入假时钟，断言间隔不小于设定值；非正间隔构造即抛
- `summarize` — 增量计算、分组、推荐选择，含「基准已最优」的情况
- `render_report` — 推荐块正文逐字断言（`多出的 3 个：vless×3` 之类），下游格式警告、
  `unknown` 诊断行、分组与「仅命名差异」标注、`--wide` 截断
- `main(argv)` — 参数级测试，`fetcher`/`sleeper`/`clock` 走注入点，离线零等待：
  `--only`/`--client` 过滤、`--client` 非法值、`--interval` 校验、`--dump` 落盘与目录
  权限、`--json` 与 URL 打码、退出码三档的真实返回路径、中断路径

每条修复都配变异测试验证：把实现改坏，确认测试真的会失败。「测试看似覆盖实则不敏感」
在这个项目里反复出现过（`main()` 曾经零覆盖，`--client` 写错名字得出自信的错误结论
就是从那个缺口漏出来的）。

网络与 `yq` 调用注入替身，测试不联网。测试样本用 `ash.b64` / `nanocloud.json`
的真实片段（脱敏后内联在测试文件里）。
