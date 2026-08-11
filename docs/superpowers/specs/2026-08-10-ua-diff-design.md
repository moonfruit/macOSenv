# 订阅 User-Agent 差异探测（ua-diff）设计

日期：2026-08-10

## 目标

找出每个订阅**能拉到最多可用出站节点的 User-Agent**。

机场按 UA 下发不同内容：换格式、按客户端能力裁剪协议、改节点名、塞广告节点。
用 sing-box 自己的 UA 拉，往往只拿到机场认为 sing-box 支持的那一小撮；换成别的
客户端 UA 常能拿到更全的列表，而多出来的节点很多 sing-box 其实支持得了——
把它们捞回来是这个脚本的终极用途。

`clash.txt` 里 `ash` 配 `shadowsocket` 而不是 `sing-box`，正是这个思路的产物。

所以脚本读取 `clash.txt` 的每个有效订阅，用 4 个客户端 × 2 个版本共 8 个 UA
各拉一次，**外加一次当前配置的基准 UA**（与表中最新 sing-box 项相同时合并），
比较各自能拿到多少 sing-box 用得上的节点，给出相对当前配置的增量和推荐。

## 交付物

- `etc/sing-box/ua-diff.py` — 可执行脚本
- `etc/sing-box/test_ua_diff.py` — 标准库 unittest 测试

## 约束

- **限速**：对单一订阅每分钟不得超过 8 次请求。
- **依赖**：系统 python3（3.14）没有 yaml/requests，env 仓库没有 venv。
  只用 Python 标准库 + 外部 `yq`（v4，已安装，仅在响应是 YAML 时调用）。
  不引入 venv，也不 import `$WORKSPACE/proxy/sing-rules` 的任何代码
  （**读** `subscribe.sh` 的文本取基准 UA 不算依赖它的代码，见下）。

## 输入格式

`clash.txt` 每行三个字段 `NAME URL CLIENT`，`#` 开头或空行为无效行，跳过。
当前有效行两条（`ash.b64` / `nanocloud.json`），第三条 `xipcloud.yaml` 已注释掉。

第三个字段是 `subscribe.sh` 用的客户端名，本脚本拿它构造**基准 UA**——即
`update.sh` 当前实际发出去的 UA，增量都相对它计算。必须**原样复现**
`subscribe.sh` 的构造规则，不能从 UA 表里挑个近似的，否则增量是假的：

```
CLIENT == "sing-box"  →  从 subscribe.sh 里那行 AGENT="…" 解析出来的完整串
其他                   →  <CLIENT>/*
```

**基准串不再抄成常量**：脚本运行时解析 `$WORKSPACE/proxy/sing-rules/subscribe.sh`
（`--subscribe-sh` 可覆盖），取**第一个不含 `$CLIENT` 的 `AGENT="…"` 赋值**——另一个是
`"$CLIENT/*"` 模板。抄一份拷贝放在脚本里曾经脱节过：`subscribe.sh` 升到 1.13.18 之后
脚本里还写着 1.13.16，报告里那行「基准 UA」是假的，而每一个增量都相对它计算。

同时校验 else 分支仍是 `"$CLIENT/*"`——`baseline_ua` 的另一半也是规则拷贝，那边改了
这边不改，基准照样会漂。校验不过往 stderr 打一行告警，不中断。

另有两道防线：跳过**空**的 `AGENT=""` 赋值（初始化语句既不含 `$CLIENT` 又排在前面，
会把真串顶掉）；解析到的串若既不含 `sing-box` 也不像 `SF[AIM]/`，说明「取第一个」多半
取错了——note 标成「读自 subscribe.sh（形状可疑）」并告警，不让假基准冒充真基准。

文件不存在、没有读权限、格式变了、正则一个都没匹配上——一律**安全退回内置兜底常量**，
绝不抛异常。报告的表头把来源写出来，让漂移无处藏身：

```
▌ nanocloud.json   基准 UA: SFA/1.13.18 (sing-box 1.13.18)（读自 subscribe.sh）
▌ nanocloud.json   基准 UA: SFA/1.13.18 (sing-box 1.13.18)（内置兜底，读不了 …）
```

非 sing-box 订阅的基准是 `<client>/*`，不来自 `subscribe.sh` 那行赋值，所以不标来源。

第三列写什么就发什么，哪怕它看着像拼错了。机场按子串匹配不上的 UA 会落进「无法
识别的 UA」分支，而这类分支通常回退到 base64 链接表——恰恰是节点最全的格式。
`ash` 能拿到 119 个节点（sing-box UA 的 `nanocloud` 只有 40 个）多半就是这个原因。
这类畸形 UA 是有效的对照项，脚本不能把它「修正」掉。

（`clash.txt` 的实际取值会变，本文不指认具体是哪个值——规则是「原样复现」，
测试夹具里用一个刻意拼错的串来验证这条规则，与当前配置里写的是什么无关。）

sing-box 订阅的基准串与表中最新 sing-box 项**相同**，合并成一次请求，于是
每订阅 **8 次请求**；基准串落在表外时（非 sing-box 客户端，或 `subscribe.sh` 改了版本）
是 8 + 1 = **9 次**。

## UA 表

内置在脚本顶部，4 客户端 × 2 版本 = 8 个 UA。

| 客户端 | 最新 | 广泛使用的旧版 |
|---|---|---|
| mihomo | `mihomo/v1.19.29` | `mihomo/v1.18.10` |
| clash-verge | `clash-verge/v2.5.2` | `clash-verge/v2.4.7` |
| shadowrocket | `Shadowrocket/2.2.90 (iPhone; iOS 18.6; Scale/3.00)` | `Shadowrocket/2.2.65 (…)` |
| sing-box | `SFA/1.13.18 (sing-box 1.13.18)` | `SFA/1.12.25 (sing-box 1.12.25)` |

sing-box 用 **SFA**（for Android）而不是 SFI（for iOS）：`subscribe.sh` 实际发的就是
SFA，串一致才能与基准合并、每订阅省一次请求；写成 SFI 的话两串永远不等，合并逻辑
是死代码。

**loon 与 quantumult-x 已移除**（两轮真实探测后）：`nanocloud.json` 对这两个客户端
返回 0 字节；`ash.b64` 给的是同一批 113 个节点，但格式是 `conf` / `base64-conf`，
下游 `clash-to-sing.py` 对这两种**没有 loader**，可用节点恒为 0。两个订阅都永远拿不到
可用节点，白费每订阅 4 次请求（约 32 秒）。**只是不再探测它们**——`conf` / `base64-conf`
的嗅探、解析与分级全部保留：`detect_format` 与 UA 无关，别的客户端也可能返回这些格式，
而 `USABLE_TYPES_BY_FORMAT` 里对它们的分级仍然是正确知识。

旧版选的是**上一个 minor 系列的末版**，而不是上一个 tag——patch 之间机场不会区别
对待，minor 跨越才可能带来协议特性差异。sing-box 1.13 与 1.12 的配置结构不同，
正好卡在分水岭上。

版本来源：mihomo / clash-verge / sing-box 由 GitHub Releases 实测；Shadowrocket
的最新版由 iTunes Lookup API 实测，旧版取约一年前有明确发布记录的版本（闭源无公开
版本分布数据）。表中每条带注释标注日期与来源，可手工修改。

## 架构

纯函数 + 一层 IO，便于单测：

1. `parse_clash_txt(text) -> list[Subscription]` — 解析订阅清单，跳过注释与空行
2. `resolve_baseline_source(path) -> BaselineSource` — 从 `subscribe.sh` 解析基准 UA
   与来源说明，任何意外都退回内置兜底，绝不抛异常
3. `baseline_ua(client) -> str` — 复现 `subscribe.sh` 的 UA 构造规则
4. `RateLimiter(interval)` — 单订阅内的最小请求间隔，时钟可注入
5. `fetch(url, ua, timeout) -> Response` — `urllib.request`，唯一的网络 IO
6. `detect_format(body) -> str` — 响应体嗅探
7. `parse_nodes(body, fmt) -> list[Node]` — 按格式提取节点
8. `normalize_type(t) -> str` / `fingerprint(node) -> str` — 归一化
9. `is_pseudo_node(name) -> bool` — 伪节点识别
10. `tier_of(type, fmt) -> str` — 可用性分级，返回 `usable` / `pending` / `unusable`；
    **分级与订阅格式相关**，见「节点可用性分级」
11. `mask_credentials(raw) -> str` — 待支持样例的凭据打码，见「待支持样例」
12. `summarize(results, baseline) -> Report` — 算增量、分组、挑推荐

### 限速与并发

每个订阅一个 worker 线程；订阅内 8 次请求（8 个 UA，基准已合并）**串行**，
相邻请求最小间隔 `--interval`（默认 8.0 秒 → 7.5 req/min，安全低于 8）；
订阅之间**并行**。限速是「对单一连接」的，所以订阅间并行不违反约束。
总耗时约 7×8 ≈ 56 秒，与订阅数量无关。

若基准 UA 与表中任何一项都不同（非 sing-box 客户端），该订阅多发一次，共 9 次、约 64 秒。

### 格式嗅探

按响应体嗅探，不信 `Content-Type`——机场常返回 `text/plain` 或
`application/octet-stream`。判定顺序：

| 格式 | 判定 | 节点提取 |
|---|---|---|
| `sing-box` | 可 json 解析且含 `outbounds` | `outbounds` 中排除 direct/block/dns/selector/urltest |
| `clash` | 含 `proxies:` | `yq -p yaml -o json` 后取 `.proxies[]` |
| `base64` | 纯 base64 字符集，解码后**递归嗅探一层**得到 `links`（或首行认不出但正文含 `://` 的兜底） | 解码后逐行 `urlparse` |
| `base64-conf` | 同上，但内层递归嗅探出来是 `conf` | 解码后按 `conf` 解析 |
| `links` | 行首是 `ss://` `vmess://` `vless://` `trojan://` `hysteria2://` 等 | 逐行 `urlparse` |
| `conf` | 含 `[Proxy]` / `[server_local]` 段头，**或**有 ≥2 行裸节点行 | 有段头按段头，无段头按行形状 |
| `unknown` | 其余 | 节点数记 `-`，报告字节数与前 80 字节 |

base64 分支必须**递归嗅探内层**而不是只看 `://`：Quantumult X 对某些订阅返回的是
base64 包着的 `[server_local]` 行（`vless=172.81.111.224:10009,method=none,…`），
QX 的语法里一个 `://` 都没有，只看 `://` 会把整份 50KB 响应判成 `unknown` 丢掉——
丢的正好是脚本专门写了解析器的格式。递归**只递一层**，防止「全 base64 字符集的正文
解码后还是全 base64 字符集」造成无限递归。

`conf` 也不能只认段头：订阅响应给的是**节点清单**而不是整份配置文件，Loon 返回的
30KB 里全是 `剩余流量：86.88 GB=vless,172.81.111.224,10009,…` 这样的裸行，没有
`[Proxy]`。所以补一条「≥2 行长得像节点行」的判据，两种形状各认一种：

- Loon / Surge：`名字 = 类型, 服务器, 端口, …`（等号右边第一个逗号字段是已知协议名，
  第二、三字段像 host 和 port）
- Quantumult X：`类型=服务器:端口, …`（等号左边是已知协议名，右边第一个字段像 `host:port`）

门槛是 **2 行**：一行太容易撞上普通的 `key = value` 配置行。`[General]` 里的
`ip-mode = dual` 两种形状都不像（`dual` 不是协议名，右边也不是 `host:port`），
不会被误判。`conf` 在嗅探顺序上最后，放宽它不影响前面的 sing-box / clash / links。

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

它们是合法的 `vless://` URL，但复用了真实节点的 server:port。

**取舍标准是「这个词会不会出现在真实节点名里」**，不是「裸词一律禁止」：

- **会出现的词只能用词组或结构信号**：`流量`、`到期`、`过期`、`剩余`、`重置`、
  `套餐`、`订阅`、`机场`、`群组`、`通知` 都是真节点名里出得来的字。
- **几乎不可能出现的词才允许留作裸词**：`官网`、`客服`、`续费`——没人会把节点叫
  「香港客服」。

于是判据分两层：

- 词组：`剩余流量`、`总流量`、`已用流量`、`套餐流量`、`流量重置`、`距离下次`、
  `重置剩余`、`套餐到期`、`到期时间`、`过期时间`，加上允许的裸词 `续费`、`官网`、
  `客服`，以及 `http://`、`https://`、`t.me/`
- 结构信号：日期 `2027-03-03` 或 `2027年3月3日`；冒号（**全角或半角**）后跟数字 +
  单位（`GB`/`MB`/`TB`/`KB`/`天`）

裸词是踩过的坑：`流量` 一次误杀 17 个真节点。nanocloud 用 `(流量)` / `(通用)` 标**计费
档位**，`❇️双鱼座-D(流量)`、`🇭🇰香港-A(流量)` 全是真节点，却被整批剔出计数，基准的
「21 可用」凭空少了一半，报告的 `伪` 列 17 全是噪音。

**单位表不收裸的 `G`/`M`/`T`**：机场按带宽命名节点是真实习惯（`香港01：100M`、
`东京：1G专线`），收裸单字母就是把同一个错误换个入口重来一遍——而且这类假阳性是
收紧关键词时**新引入**的，老的裸词版反而不会误伤。代价是漏掉 `剩余：88 G` 这种省了
B 的写法，可以接受：流量单位一般不省 B，且宁可漏一个伪节点也不能误杀真节点——
误杀会低报可用数，正是这套判据要根治的方向。

命中的从「可用节点数」里剔除，但在报告中单独列一行告知识别了几个、都是谁——
误伤的可能永远消不掉，静默过滤会让人看不见。

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
| `base64-conf` | `load_shadowrocket_proxies` b64decode 后按 `scheme://` 解析 → `vless=host:port,…` 被 `urlparse` 解成垃圾 | 无 |
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

同时按 `FP` 集合给这一轮的结果分组，展示哪些 UA 拿到的是同一份列表；`FP` 相同但
`NAMES` 不同的标注为「仅命名差异」。

分组键是 `FP`，**与格式无关**——它回答的是「哪些 UA 拿到了同一份列表」。但可用数是
**格式相关**的（✅ 档按格式索引），于是同一组里的成员可用数可能不同：同一批节点在
`sing-box` 格式下 21 个可用、在 `clash` 格式下只有 2 个。这时组标签必须报**范围**并
点明原因，且给每个成员标上自己的格式，否则「组 A（21 可用）」里会赫然列着一个表里
写着 2 可用的成员。可用数一致时保持简洁形式；组内格式不止一种时无论如何都标格式，
因为「换 UA 要不要同步改 `config.json` 的 `format`」本身就是结论的一部分。

组间排序取**组内最大可用数**（不是第一行的，那会随组内顺序抖动）。权衡：一个跨度很大
的组（如 2–21）会靠最大值排到前面，看着比某些全组稳定在 10 的组更「靠前」。接受这个
偏差，因为标签已经把范围摊开了，没有藏信息；若改取最小值或均值，则会把「某个 UA 确实
能拿到 21 个」这条最该被看见的结论压到下面。

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
  clash-verge     2.5.2        200  clash      2   -114  117       0    3
  sing-box        1.13.18      200  sing-box  40   -76      0       0    0
  mihomo          1.19.29      200  unknown    -     —      -       -    -
  …

  ✘ mihomo 1.19.29：无法识别的响应格式，共 1024 字节，前 80 字节：<html><head><title>403 F…

  ✔ 推荐 shadowrocket（+3 可用节点）
      多出的 3 个：vless×3
      建议行：ash.b64 https://staticasset.flowaccess.org/... shadowrocket
      注意：subscribe.sh 会把它渲染成 shadowrocket/*，不是实测用的完整 UA，见「已知限制」

  ℹ shadowrocket 2.2.90 识别到 3 个伪节点（已从计数剔除）：剩余流量：88.03 GB / 距离下次重置剩余：24 天 / 套餐到期：2027-03-03（另有 3 个 UA 也识别到伪节点）

  ⚠️ 待支持样例（每种「格式 × 协议」一个，供补 clash-to-sing.py 分支参考）
      clash / vless   来自 clash-verge 2.5.2
        {"name": "🇭🇰HK-01", "type": "vless", "server": "1.2.3.4", "port": 443, "uuid": "***"}

  ℹ 3 组不同的节点列表：
      组 A（119 可用）  shadowrocket 2.2.90, shadowrocket 2.2.65  ← 仅命名差异
      组 B（116 可用）  (基准) —
      组 C（可用 2–40，随格式而异）  sing-box 1.13.18 [sing-box], clash-verge 2.4.7 [clash]
```

注意示例里的 `clash-verge`：它拿到 119 个节点，但格式是 `clash`，而 `clash` 分支
不收 `vless`——所以 ✅ 列只有 `2`、其余全落进「待支持」，也不会被推荐。伪节点提示带上
是哪个 UA 的，因为这是逐 UA 统计的，不是全局结论。

### 待支持样例

「待支持 117」这个数字本身不可行动：用户看到它之后要做的是去 `clash-to-sing.py`
补一个转换分支，而光凭指纹 `vless://1.2.3.4:443` 写不出转换函数——得看见节点的
**原始形态**，才知道要解析哪些字段。所以存在待支持节点时，报告加一节，
按「**格式 × 协议**」各列一个样例（`--wide` 给完整内容，默认按宽度截断）。

按「格式 × 协议」而不是只按协议：`USABLE_TYPES_BY_FORMAT` 本来就是按格式分裂的，
补分支时改的是具体某个 `*_proxy_to_outbound` 函数（`clash_proxy_to_outbound` /
`shadowrocket_proxy_to_outbound`），可操作的单元就是「哪个格式下的哪个协议」，
同一个协议在两种格式下要补两处。每行标明样例来自哪个 UA——用户得知道去哪儿复现。

原始形态由 `Node.raw` 承载（sing-box / clash 是那个 dict，links / conf 是原始那一行）。
该字段**必须 `field(compare=False)`**：去重、增量、分组是这个工具的核心结论，让 raw
参与相等性会把同一个节点的两种写法算成两个；而且 dict 不可哈希，参与 `__hash__` 就
再也进不了 set。

**凭据一律打码**（`mask_credentials`）：这和订阅 URL 是同一类泄漏面，报告会被贴进
issue、聊天、日志。但打码口径必须**一头不漏、一头不废**，两边都翻过车：

- **打**：凭据名键的值（任意位置、任意嵌套层级，含列表套字典如
  `wireguard.peers[].pre-shared-key`、`users[].uuid`）、Loon/Surge conf 里**定位置的裸
  引号密码**（`节点名 = 类型,server,port,"密码"`）、URL 的 userinfo、URL query 里的凭据名参数
- **不打**：`type` / `server` / `port` / `sni` / `servername` / `tls-name` / `host` /
  `tls-host` / `path` / 传输层参数 / 节点名与 `tag` / `alterId`（纯数字，写 vmess 转换要看）/
  `public-key` / `pbk` / `short-id` / `sid` / `host-key`（本来就随分享链接公开）

URL 形态与 dict 形态**口径一致**（`pbk`/`sid` 与 `public-key`/`short-id` 都不打）。

两个必踩的坑：

1. `username=` **就是 UUID**——Surge / Loon 的 vmess 节点行这么写，而 conf 下 vmess 恒为
   pending、必进样例。键表里只有 `userid` 时整串明文漏进报告。`passphrase` 同理。
2. 无差别打掉所有引号段会把 SNI（`tls-name`）、`tls-host`、`path`、连节点名 `tag=` 一起
   打成 `***`，这一节就废了。正确做法是**先按键名打（`_KEY_VALUE`）、再一遍扫过去处理裸
   引号**：每个引号段回看前面最近的非空白字符，是 `=`/`:` 就说明它有键名、放行。
   定长 lookbehind 会错位——`_KEY_VALUE` 跑完之后凭据的引号已经被换掉了。

键名判定用**全等 + 已知后缀**而不是子串（`Madrid` 含 `id`、`Passau` 含 `pass`），
且**后缀表里没有裸 `key`**（否则 `public-key` / `host-key` 全遭殃）。全等表只列后缀覆盖
不到的词，避免死条目——两张表里每一项删掉都有测试变红。

样例呈现前把 `name` / `tag` / `type` / `server` / `port` 挪到末尾：截断从末尾切，
而这几个键在表里已经看得到，真正要看的 `reality-opts` / `ws-opts` 不该被它们挤到刀口上。

`--json` 的 `rows[].pending_samples` 带同样打码后的样例，顶层 `baseline_source`
（`ua` / `note` / `from_file`）带基准 UA 的 provenance。

### 实时进度

全程十几次请求静默会让人以为卡死。卡感的来源是**限速的 8 秒空档**而不是请求本身，
所以「每完成一次请求打一行」不够——那 8 秒里屏幕仍然是死的。进度行必须报出
**当前阶段已经持续了多久**，那是证明「它还活着」的唯一信号；剩余时间反而不重要。

工作线程只发布状态（`probe_subscription` 的 `on_progress(phase, done, total, detail)`
回调，四个时机：`等待限速`（在 `limiter.wait()` **之前**）/ `请求中` / `解析中` /
`完成`），重画交给 `ProgressRenderer` 自己的 daemon 线程。这样分工是为了**一行都不动
`RateLimiter`**——它是整个项目唯一的安全闸，不该为了显示去改它的计时或 `cancel_event`
逻辑。回调调用点（`_notify`）一律吞异常：显示是附属功能，渲染器有 bug 不能把 worker
弄死、让整个订阅静默消失。

TTY 下每个订阅占一行，每 0.5 秒原地重画（ANSI 上移 N 行 + `\r\033[K` 逐行重写）。
第一帧由 `start()` **同步**画掉，之后才交给线程——否则「探测 N 个订阅……」那行会孤零零
挂上最多一个 tick，正是最需要看见反馈的时刻；顺带让「屏幕上有几行进度」从 `start()`
返回那刻起就是确定的，不必看线程的调度运气（测试也因此不必靠 sleep 对齐）：

```
  ash.b64         [4/9]  等待限速 3.2s   下一个 clash-verge 2.5.2
  nanocloud.json  [7/8]  请求中   1.1s   sing-box 1.13.18
```

对齐用与报告同一套 `display_width` / `pad`（订阅名含中文/emoji 时不能错位）。
行宽取 `max(1, shutil.get_terminal_size().columns - 1)`——夹到 `>= 1` 是必须的，
极窄终端下 `columns - 1` 会掉到 `0`/负数，而那正好是 `format_progress_line` 眼里的
「不限宽」，整行原样喷出去必然折行，「防折行」直接翻成「保证折行」。超宽时**优先只截
`detail`**（前面几列是对齐骨架，截了就错位）；只有窄到连骨架都放不下时才连骨架一起截，
那时对齐已无从谈起，而**绝不能折行**是硬约束：原地重画靠「上移 N 行」定位，多折一行整块
显示就全乱了。行格式化是纯函数 `format_progress_line`，单独测对齐与截断。

`clash.txt` 允许重名。重名的两个 worker 若写进同一行，计数会互相覆盖、看着像在反复
横跳，所以 `ProgressRenderer` 构造时给重名行加 `#2` / `#3` 后缀，并把最终的行键按原序
放在 `.keys` 里供调用方使用。

非 TTY（重定向、管道、CI）**不起重画线程、不输出任何 ANSI**，只在每次探测完成时打
一行纯文本。进度**一律写 stderr**，`--json` 的 stdout 必须保持纯净可解析。`--no-progress`
完全关闭。进度行只显示订阅名、客户端、版本、结果摘要——**不含订阅 URL**；失败摘要来自
urllib 的异常字符串，会先过一遍 `scrub_urls`，因为个别异常会把带 token 的请求 URL 原样带上。

#### 两把锁：别把显示的背压传导回探测

`_lock` 只护状态（`_state` / `_names` / `_stopped`），**持有期间绝不做 IO**；`_io_lock`
护「往流里写」这件事本身，顺带护 `_drawn`（它记的是「屏幕上现在有几行进度」，必须与实际
写出去的字节严格同步）。热路径 `update()` 每个订阅要走 4×9 次，TTY 下它**一个字节都不
写**——写全交给重画线程。

这不是洁癖：早先 `_write` 在 `_lock` 里，终端一卡（SSH 卡顿、用户按了 Ctrl-S 的 XOFF、
终端模拟器 hang），重画线程就握着状态锁卡在 write 上，`update()` 和 `stop()` 一起被拖住，
实测各 5 秒——而 `stop()` 的 docstring 还写着「不阻塞」。

`stop()` 幂等，**不等待重画周期**（重画线程等在 `Event.wait(tick)` 上，置位后立刻醒）。
`_STOP_WAIT` 封住的是「等**别人**」的两处：`join`（等重画线程退出）与 `_io_lock.acquire`
（等在途的那次 write 交还锁）；抢不到锁就干脆不清了——收不干净的残影只是化妆品，而
Ctrl-C 的响应速度是硬要求。

**但清屏那次 write 本身没有上限**，`start()` 同步画第一帧同理：Python 没法给阻塞式
write 设超时，终端卡死时它会一直卡着。实测终端写卡 3 秒时 `start()` / `stop()` 各是
3 秒——不是等锁，是它们自己那次 write。这是有意接受的取舍：清屏必须写终端，而紧随其后
`main()` 打印报告要写的是同一个卡死的终端、同样会卡，边际延迟不显著；真要根治得上非阻塞
写，为一个「终端本来就已经不可用」的场景不值得。**所以别把这里读成「Ctrl-C 的延迟被封住
了」**——被封住的只有「等重画周期」和「等锁」这两项。

`stop()` 搁在 `finally` 里保证任何退出路径都收得干净；Ctrl-C 分支里先 `stop()` 再打
「已中断」，否则那句话会插进正在重画的几行中间。

#### 进度块活着时的第三方输出

worker 侧的告警（目前只有「`--dump` 保存原始响应失败」）**不能**直接 print 到 stderr：
它把光标推下一行，而 `_drawn` 不知情，下一帧的 `\033[{drawn}A` 就少上移一行，重写时正好
把告警和一行进度一起盖掉；`stop()` 的清屏也从错位置清起，顶上留一行残影压在报告上面。
**告警整行消失**，于是「`--dump` 写盘失败只记一行告警、不中断」这条保证在 TTY 下静默
失效，用户以为都存下来了。

所以 `probe_subscription` 收一个 `on_warn(text)` 回调，`main` 把它接到
`ProgressRenderer.log()`：先 `\033[{_drawn}A\033[J` 收掉进度块、写日志行、`_drawn` 归零
让下一帧重新铺。`on_warn` 缺省（`None`）就是直接 print，回调抛异常也退回 print——
**告警本身不能丢**，那是这条保证的全部实现。

`--json` 输出结构化结果供脚本消费（订阅 URL 默认打码，`--show-url` 还原）；
`--dump DIR` 保存原始响应（`<name>.<client>.<version>.raw`）供事后排查，目录按 `0700`
创建。默认不落盘，因为响应含订阅 token。

脚本只打印建议行，不改 `clash.txt`——机场的下发策略随时会变，自动写回风险高。

## CLI

```
ua-diff.py [-f FILE] [--only NAME]... [--client NAME]...
           [--interval SECONDS] [--timeout SECONDS] [--force-interval]
           [--dump DIR] [--json] [--show-url] [--wide] [--no-proxy]
           [--no-progress]
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

`--no-progress` 关掉实时进度（见「实时进度」）。进度默认开着、一律打到 stderr，
所以 `--json > report.json` 既能看见进度、又不会污染 JSON。

退出码：`0` 当前 UA 已最优 / `1` 存在更优 UA / `2` 结论不可信。多个订阅取最大值。

`2` 只留给**基准探测失败**（没有参照物）或**某订阅全部探测失败**（没有数据）这两种
情形。个别陌生 UA 拿到 HTML（`fmt=unknown`）是 8 个 UA 里的常态而非异常——若它也
算 `2`，退出码就退化成常量 `2`，`0`/`1` 永远不可达。这类失败在报告里已有 ✘ 行逐条
告知。Ctrl-C 中断同样返回 `2`（结果不完整）。

## 已知限制

`subscribe.sh` 把 `clash.txt` 第三列渲染成 `<CLIENT>/*`（`sing-box` 除外），
所以脚本推荐的 UA 和 `update.sh` 实际会发出的 UA **不是一回事**。推荐 `mihomo` 时，
实测用的是 `mihomo/v1.19.29`，而 `update.sh` 会发 `mihomo/*`——机场对这两者的响应
可能不同。

报告在建议行下方明确提示这一点。要真正吃到实测结果，得改 `subscribe.sh` 支持完整
UA，或在 `clash.txt` 第三列直接写完整 UA 串。这两项都超出本脚本范围，由使用者决定。

### 推荐的 UA 可能返回下游读不了的格式

`clash-to-sing.py` 的输入格式在 `sing-rules/config/config.json` 里**按订阅写死**
（如 `"format": "shadowrocket"`），`load_proxies`（`:1092`）只认 `clash` /
`shadowrocket` / `sing-box` 三种，其中 `shadowrocket` 会对响应体**无条件**
`base64.b64decode`。于是换 UA 有三种翻车法：

- 推荐一个返回 `conf` 的 UA → 下游没有任何 loader 能读
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
- `baseline_ua` / `resolve_baseline_source` — `sing-box` 跟随 `subscribe.sh` 的解析结果、
  其余走 `<client>/*`（含 `shadowsocket` 这例）；解析成功 / 文件不存在 / 无读权限 /
  格式变了取不到 / 只剩 `$CLIENT` 模板 / `$WORKSPACE` 未设置 / 读文件抛非 `OSError`
  逐个断言，且**任何情形都不抛异常**；else 分支不再是 `"$CLIENT/*"` 时告警；
  报告里显示来源（`读自 subscribe.sh` / `内置兜底，…`），非 sing-box 订阅不标来源。
  兜底常量在测试里是**手写字面量**，常量被改动时这些断言必须炸
- `detect_format` — 七种格式各一例 + 边界（空响应、HTML 错误页）、真实样本的
  `base64-conf` 与无段头裸 conf、「只有一行像节点行不算 conf」「`[General]` 的普通
  配置行不是节点行」「放宽 conf 不抢走 sing-box/clash/links」
- `parse_nodes` — sing-box JSON / clash YAML / base64 / base64-conf / conf 五类，含
  `vmess://` 的 base64 内嵌 JSON 载荷、无段头按行形状判别、有段头时段头优先
- `normalize_type` / `fingerprint` — 别名、大小写
- `is_pseudo_node` — 三个真实伪节点名命中，正常节点名不命中，`(流量)` / `(通用)`
  计费档位的 6 个真实节点名逐个断言不命中（裸词误杀 17 个的回归）；带宽标注
  （`香港01：100M`、`东京：1G专线`）逐个断言不命中；半角冒号 / 无冒号 / 中文日期
  三种写法逐个断言命中；裸词 `官网`/`客服`/`续费` 不带任何其它信号时单独命中；
  判据表与测试里手写的字面量副本一一对应（删表里任何一项都会挂——曾经删掉
  `官网`/`客服` 全套测试照样全绿）
- `tier_of` — **逐格式**取样，含「clash 下 vless 不可用」「shadowrocket 下 ss 不可用」
  「conf / base64-conf 一律不可用」这几条会让 `update.sh` 崩掉的回归
- UA 表 — 客户端名与 sing-box 的两个 UA 串都用**手写字面量**断言（遍历表本身来断言
  等于没断言：删表项就等于同时删断言）；`loon` / `quantumult-x` 不在表里；
  移除它们之后 `conf` / `base64-conf` 的嗅探、解析、分级仍然存在且正确（专门一组守卫，
  防止顺手把解析器一起删了）
- `mask_credentials` — 两个方向都要钉：**漏码**（dict/列表递归、URL userinfo 与具名查询
  参数、conf 的具名凭据与定位置裸引号密码、`vmess://` 载荷解开后打码、Surge 的
  `username=` 就是 UUID）与**过度打码**（`tls-name` / `tls-host` / `path` / `tag` /
  `alterId` / `public-key` / `pbk` / `short-id` 必须原样保留，URL 与 dict 口径一致）；
  `is_credential_key` 的正反例（`Madrid` / `Passau` / `Users-HK` 不算凭据键），
  两张键名表**逐条删除都有测试变红**
- `Node.raw` — `compare=False` 的两条理由各有一条测试：raw 不同的两个 Node 相等且进
  同一个 set（漏写 `compare=False` 时 dict raw 会直接 `TypeError`）；raw 不同不改变
  去重与分组结果
- 待支持样例 — 有待支持节点才出现、「格式 × 协议」去重（同格式同协议出一个、同协议
  跨两格式出两个）、标注来源 UA、**样例取自可用数最高的那一行**、伪节点不当样例、
  失败探测不贡献样例、默认截断 `--wide` 给全（量样例本身而不是整行）、低信息量的键
  挪到末尾、`--json` 里带样例且同样打码；`raw` 的接线**六个解析器逐个走到样例那一步**
  （断了不会报错，只会静默降级成「（无原始形态）节点名」）
- `RateLimiter` — 注入假时钟，断言间隔不小于设定值；非正间隔构造即抛
- `summarize` — 增量计算、分组、推荐选择，含「基准已最优」的情况
- `render_report` — 推荐块正文逐字断言（`多出的 3 个：vless×3` 之类），下游格式警告、
  `unknown` 诊断行、分组与「仅命名差异」标注、组内可用数不一致时的范围标签与
  逐成员格式标注、`--wide` 截断
- `main(argv)` — 参数级测试，`fetcher`/`sleeper`/`clock` 走注入点，离线零等待：
  `--only`/`--client` 过滤、`--client` 非法值、`--interval` 校验、`--dump` 落盘与目录
  权限、`--json` 与 URL 打码、退出码三档的真实返回路径、中断路径
- 进度 — `format_progress_line`（中文/emoji 名的列起始位置一致、阶段切换列不跳、
  `detail` 截断、窄到骨架都放不下时也不超宽）、`truncate_display`（不切出半个宽字符）、
  `scrub_urls`、`ProgressRenderer` 两种模式（非 TTY 不起线程/不输出 ANSI/只打完成行；
  TTY 上移重画、`stop()` 清残影且幂等、写流失败不抛）、`on_progress` 的四阶段时机与
  「`等待限速` 在 `limiter.wait()` 之**前**」、回调抛异常不影响探测；
  `main` 层用一个 `isatty()` 返假的 StringIO 走非 TTY 分支、再用返真的走 TTY 分支
  （**「main 忘了 stop 渲染器」只有 TTY 那组钉得住**——非 TTY 压根不起线程、
  也没有残影要清）。
- 进度的背压与插话 — 一个「写一次就卡 5 秒」的假流断言 `update()`/`stop()` 都不被拖住；
  测试里自带一个极小的 ANSI 回放器（`replay_ansi`，只实现 `\r` / `\n` / `CUU` / `EL` /
  `ED`，且**它自己也有测试**），把字节流还原成「最终屏幕」，才断言得了「告警有没有被下
  一帧盖掉」「收尾有没有留残影」——光看字节流看不出来，被盖掉的字节仍然在流里。
  改完做过变异验证：28 处逐一改坏，全部有测试变红。
- 基准来源 / UA 表瘦身 / 待支持样例这一轮又做了 29 处变异（含「永远走兜底」「不跳过
  `$CLIENT` 模板」「兜底 try 去掉」「SFA 换回 SFI」「加回 loon」「删掉 conf 解析」
  「conf 判成可用」「`Node.raw` 参与比较」「不打码」「键名判定改子串匹配」「样例只按
  协议去重」「首份报告不空行」「`--json` 也打空行」），全部被测试杀死。
- review 之后的打码口径修正又做了 29 处变异（含 reviewer 自选存活的 6 条：clash 与
  vmess link 的 `raw` 接线、`raw` 造假、list 不递归、`setdefault` 改直接赋值、
  `--wide` 也截断），加上两张键名表**逐条删除**的 20 次 sweep，全部被测试杀死。
  `--wide` 那条原先杀不掉是因为断言量的是整行——8 个缩进空格让截断后的行照样「超宽」，
  必须量样例本身。

每条修复都配变异测试验证：把实现改坏，确认测试真的会失败。「测试看似覆盖实则不敏感」
在这个项目里反复出现过（`main()` 曾经零覆盖，`--client` 写错名字得出自信的错误结论
就是从那个缺口漏出来的）。

网络与 `yq` 调用注入替身，测试不联网。测试样本用 `ash.b64` / `nanocloud.json`
的真实片段（脱敏后内联在测试文件里）。
