# ua-diff — 订阅 User-Agent 探测

`etc/sing-box/ua-diff.py` 探测每个订阅在不同代理客户端 User-Agent 下能拉到多少 sing-box
**可用**的出站节点，回答「换哪个 UA 能多捞到节点」。

机场按 UA 下发不同内容（换格式、按客户端能力裁剪协议、改节点名、塞广告节点），
用 sing-box 自己的 UA 往往只拿到一小撮。读 `etc/sing-box/clash.txt`，
4 客户端 × 2 版本 = 8 个 UA，外加一次当前配置的基准 UA（sing-box 订阅的基准与表里
最新的 `SFA` 项相同、合并掉），共 8 次请求/订阅（非 sing-box 客户端 9 次）。

## ⚠️ 不要随手跑它

每跑一次就消耗一轮订阅的限速额度（每订阅 8 次请求、约 56 秒）。
验证改动一律用离线单测，不要执行 `./ua-diff.py`，也不要用任何方式真实请求订阅 URL。
`clash.txt` 含订阅 token，不要把它的 URL 写进报告或提交。

## 基准 UA

运行时从 `subscribe.sh` 解析（`$WORKSPACE/proxy/sing-rules/subscribe.sh`，`--subscribe-sh` 可覆盖）：
取第一个不含 `$CLIENT` 的 `AGENT="…"`，并校验 else 分支仍是 `"$CLIENT/*"`（不是就告警到 stderr）。
读不到/格式变了一律安全退回内置兜底常量，绝不抛异常；报告表头标出来源
（`（读自 subscribe.sh）` / `（内置兜底，…）`）。

以前这里抄了一份常量，subscribe.sh 升版后脱节，报告里的基准 UA 是假的——**别再抄**。

UA 表里 sing-box 用 `SFA` 而不是 `SFI`，串一致才合并得掉；`loon` / `quantumult-x` 已从表里移除
（实测两个订阅都恒为 0 可用节点），但 `conf` / `base64-conf` 的嗅探、解析与分级**全部保留**，别顺手删。

## 限速是唯一的硬约束

对单一订阅每分钟不得超过 8 次请求，默认 `--interval 8.0`（7.5 次/分钟）。
低于 7.5 会被 `parser.error` 拒绝，压测须显式加 `--force-interval`。
订阅之间并行、订阅内串行——限速是「对单一连接」的。

## 可用性分级按订阅格式分裂

`clash-to-sing.py` 的转换分支是按格式分的（`clash` 收 hysteria2/ss/trojan/vmess，
`shadowrocket` 收 vless/trojan/anytls，`sing-box` 透传，`conf` / `base64-conf` 没有 loader），
且 `case _` 会 `raise ValueError` 而调用方无 try/except——把不支持的协议判成「可用」会让
`update.sh` 直接崩。那边加协议要同步 `USABLE_TYPES_BY_FORMAT`。

## 格式嗅探的两个坑

base64 分支要**递归嗅探内层一层**（QX 返回的是 base64 包着的 `[server_local]` 行，
里头没有 `://`，只看 `://` 会整份判成 unknown），内层是 conf 就是新格式 `base64-conf`；
conf 不能只认 `[Proxy]` / `[server_local]` 段头，订阅响应常常只有裸节点行，
所以「≥2 行长得像节点行」也算 conf。

## 伪节点判据

按「这个词会不会出现在真实节点名里」取舍：会出现的（`流量`/`到期`/`剩余`/`重置`/`套餐`/
`订阅`/`机场`/`群组`/`通知`）只能用词组或结构信号——`(流量)` / `(通用)` 是机场的计费档位标记，
裸词「流量」曾一次误杀 17 个真节点；几乎不可能出现的（`官网`/`客服`/`续费`）才留作裸词。
结构信号的单位表**不收裸 `G`/`M`/`T`**，否则 `香港01：100M`、`东京：1G专线` 这类带宽标注的
真节点会被误杀。

分组按指纹（与格式无关），但可用数是格式相关的，同组内不一致时标签报范围
「可用 2–21，随格式而异」并给每个成员标格式。

## 待支持样例

存在「待支持」节点时，报告按「格式 × 协议」各列一个节点的**原始形态**（`Node.raw`：dict 或原始行），
并标明来自哪个 UA——补 `clash-to-sing.py` 分支的入口，光有指纹写不出转换函数。
按格式分是因为要改的是具体某个 `*_proxy_to_outbound` 函数。
`Node.raw` 必须 `field(compare=False)`（不参与去重/分组，且 dict 不可哈希）。

样例里的凭据一律 `mask_credentials` 打码，口径是**只打真凭据**：打凭据名键的值（递归到列表套字典）、
Loon/Surge 定位置的裸引号密码、URL userinfo 与凭据名查询参数；
**不打** sni/servername/tls-name/host/tls-host/path/传输层参数/节点名与 tag/alterId/
public-key/pbk/short-id/sid/host-key（URL 与 dict 两条路径口径一致）。

两个踩过的坑：`username=` 就是 UUID（Surge/Loon 的 vmess 行这么写，conf 下必进样例）；
无差别打掉所有引号段会把 SNI 和节点名一起打没——先按键名打、再扫裸引号
（回看前一个非空白字符是不是 `=`/`:`），别用 lookbehind（会错位）。
键名判定全等+后缀、后缀表里没有裸 `key`。`--json` 的 `rows[].pending_samples` 同样打码，
顶层 `baseline_source` 带基准 UA 的 provenance。

## 实时进度

默认开，一律打到 stderr（`--json` 的 stdout 保持纯净可解析），`--no-progress` 关掉。
TTY 下每订阅一行、每 0.5 秒原地重画，显示**当前阶段已持续多久**（卡感来自限速的 8 秒空档，
只报「完成第几次」不够）；非 TTY 只在每次完成时打一行纯文本、不输出任何 ANSI。
工作线程只发 `on_progress` 回调，重画独立成 daemon 线程——`RateLimiter` 一行都没动。
进度行不含订阅 URL。

`ProgressRenderer` 里两把锁分得很死：`_lock` 只护状态、**持有期间绝不做 IO**，
`_io_lock` 护写流与 `_drawn`。否则终端一卡（SSH 卡顿、Ctrl-S 的 XOFF）就会把背压传导回探测，
`update()`/`stop()` 一起被拖住。worker 侧的告警（`--dump` 写盘失败）必须走
`on_warn` → `ProgressRenderer.log()`，裸 `print` 会被下一帧盖掉、整行消失。

## 其它

退出码：`0` 当前 UA 已最优 / `1` 存在更优 UA / `2` 结论不可信（基准探测失败、某订阅全部失败、
或 Ctrl-C 中断）。个别陌生 UA 拿到 HTML 是常态，不影响 0/1。

只用标准库（外部命令仅 `yq`，解析 clash YAML 用），无 venv。
测试：`cd etc/sing-box && /opt/homebrew/bin/python3 -m unittest test_ua_diff`（不联网）。
设计文档 `docs/superpowers/specs/2026-08-10-ua-diff-design.md`。
