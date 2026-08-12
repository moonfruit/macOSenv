# seqbox — sing-box 连接日志查询

`seqbox` 查询 Seq 中的 sing-box 连接日志（数据由 `sing2seq` 投递，配置复用 `etc/seqcli/SeqCli.json`）。

实现在 submodule `package/yyscripts/seqbox.py`（依赖 typer/requests/wcwidth，跑在该仓库的 venv 里），
`bin/seqbox` 是指向 `wrapper.sh` 的软链；测试在 `package/yyscripts/tests/`，用 `venv/bin/python -m pytest` 运行。

## 用法

支持位置参数全文匹配，或 `--domain`/`--process`/`--ip`/`--outbound`/`--rule` 组合过滤（多条件为 AND）。
另有 `--since`（时间窗，默认 1h）、`-n`（连接数上限）、`--wide`（不截断长内容）、`--json`、
`--trace <id>`（打印单连接完整事件时间线）。

## 输出

结果按 `ConnectionId` 折叠为每连接一行，含进程、域名、命中规则、路由组、出站节点、耗时。

DOMAIN 列是「入站目标 -> 出站目标」（相同时只显示一个）：fake-ip 场景是 `22.0.0.13 -> api.anthropic.com:443`，
sniff-override 是 `IP -> 域名`，域名解析出站则相反；端口相同时只在末尾标一次。

DNS 拦截连接（有 `inbound DNS packet` 或 dns 模块的 `exchange(d)` 事件）复用同样的列：
DOMAIN 是「查询域名 -> 应答 IP」，GROUP 显示 `DNS <查询类型>`，NODE 是 dns 规则的动作
（`dns-fakeip` / `predefined(NOERROR)`）。普通连接为出站做的 `lookup` 事件不算 DNS 请求。

表格宽度自适应终端：从表头宽度起步，把余量**均分**给还没到自然宽度的列（`fit_widths`），
够宽就不截断、不够就压缩且整表不换行；`--wide` 忽略终端宽度输出完整内容。

## 实现要点

多条件是分别查询后对 ConnectionId 取**交集**——因为 `ProcessName` 只出现在 router 事件、
`Tag` 只出现在 outbound 事件，单条 Seq filter 无法 AND；查询触顶时会向 stderr 输出结果可能不完整的警告。
