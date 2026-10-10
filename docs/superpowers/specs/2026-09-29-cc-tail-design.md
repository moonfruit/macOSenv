# cc-tail 设计

日期：2026-09-29

## 目标

在另一个终端里运行 `cc-tail`，实时看到所有活跃 Claude Code 会话中**正在执行的 Bash 命令**及其日志进度，
并在命令卡住（等待确认、等待授权、监听端口、疑似卡死）时及时提醒——赶在 Claude 的命令超时（默认 2 分钟）之前。

- 跟踪范围：本机所有活跃会话（含 subagent 发起的命令）
- 界面：默认 textual 仪表盘，`--stream` 切换为合并流式输出
- 处置：只提醒，不 kill、不代答

非目标：历史回溯、跨机器、解析 Bash 以外的工具（Monitor 等）。

## 背景事实（2026-09-29 基于 Claude Code 2.1.284 实测）

这些是设计依赖的前提，均属 Claude Code 内部实现，官方不保证跨版本稳定。

1. **会话登记**：`~/.claude/sessions/<pid>.json` 记录每个 claude 进程的
   `pid, sessionId, cwd, kind, entrypoint, name`（`name` 形如 `env-22`，可直接作显示名）。
2. **会话记录**：`~/.claude/projects/<编码后的 cwd>/<sessionId>.jsonl`，subagent 在
   `<sessionId>/subagents/*.jsonl`。Bash 调用是 `tool_use`（`input.command/description/timeout/run_in_background`），
   结果是对应 `tool_use_id` 的 `tool_result`。
3. **命令进程**：每条 Bash 命令是 claude 进程的子进程，cmdline 形如
   `zsh -c source <快照> 2>/dev/null || true && … && eval '<命令>' < /dev/null && pwd -P >| /tmp/claude-xxxx-cwd`。
   `eval '…'` 内部的单引号被写成 `'"'"'`，还原后与 `tool_use.input.command` 一致。
4. **stdin**：普通命令带显式 `< /dev/null`，交互提示读到 EOF 立即返回（`rm -i` 等被静默当作「否」，
   `rm` 退出码仍为 0）。**命令含 heredoc 时没有 `< /dev/null`，stdin 是 socket**，`cp -i` 等会一直阻塞到超时。
   已复现，历史上两次 `Exit code 143 … overwrite …? (y/n [n])` 超时即此原因。
5. **无控制终端**：命令进程 tty 为 `??`，打开 `/dev/tty` 报 `device not configured`；
   快照环境固定 `GIT_EDITOR=true`。因此 sudo/ssh 终端提示、git 调编辑器都不会卡住。
6. **后台命令**：`run_in_background` 的 tool_result 含
   `Output is being written to: <path>`（位于 `<session 临时目录>/tasks/<id>.output`），其 zsh 进程存活至任务结束。
7. **前台命令输出**：前台命令的 zsh 进程 fd 1/2 同样指向 `<session 临时目录>/tasks/<id>.output`（普通文件，
   stdin 为 `/dev/null`），但 tool_result 不写这个路径，只能经 psutil `open_files()` 取 fd 1 得到；
   命令结束后 Claude Code 会删除该文件。
   命令自己重定向（`cmd > "$log" 2>&1`，变量名不一定是 `L`）时 zsh 的 fd 1 几乎为空，
   真正的输出在子进程 fd 1 指向的文件里。
8. **`L=` 用法**：Claude 常写 `L=<scratchpad>/xxx.log; cmd > $L 2>&1; tail $L`，但 `L=` 也会是
   `$(...)`、`/usr/bin/log` 等非日志值，需要过滤。

另：env 仓库已提交 `efa004f`，Claude 环境下不再加载 `rm/cp/mv -i` 等 alias，
因此「等待确认」检测在新会话中是兜底——若再次触发，说明快照机制变了。

## 1. 数据源与对象模型

三个数据源，全部只读，**不调用任何外部程序**（进程信息全部经 psutil 原生接口获取）：

| 数据源 | 用途 | 刷新 |
|---|---|---|
| `~/.claude/sessions/*.json` + psutil 验证 pid 存活 | 活跃会话列表 | 2s |
| psutil 取 claude pid 的子进程树 | 正在执行的命令（每个 `zsh -c … eval '…'` 子进程一条）及其进程树；各进程 fd 1 的输出文件 | 1s |
| 会话 jsonl 及 `subagents/*.jsonl`（按偏移增量读） | 命令原文、description、timeout、是否后台；提取 `L=` 路径、后台输出路径；tool_result 的退出码与 `-i` 被拒痕迹 | 1s |

对象模型：

```
Session  pid, session_id, name, cwd
  └─ Command  （一条 Bash tool_use）
       id, text, description, started_at, timeout, background
       proc       → zsh 进程；None 表示已结束
       tree       → 子进程快照：name, argv, cpu 累计, status, listening
       stdin_open → cmdline 中没有 "< /dev/null"（heredoc 型）
       log        → Log | None
       result     → exit_code, denied_prompts（来自 tool_result）
       state      → 见第 2 节
Log  path, source(L= | background), size, mtime, last_growth_at, tail
```

关联规则：

- **进程 ↔ tool_use**：用还原后的命令原文精确匹配；匹配前先以进程身份显示，匹配后补全 description 等字段。
- **日志 ↔ 命令**：`L=` 日志属于声明它的那条 tool_use；后台输出文件属于对应的后台 tool_use。
  没有 `L=` 时每个 tick 扫进程树：取最新创建、fd 1 指向另一个普通文件的后代（`redirect`），步骤间隙保留上一个；
  都没有再用 zsh 自身的 fd 1（`stdout`）。优先级 `L=` > `redirect` > 后台输出 > `stdout`；
  每个进程的 fd 1 按（pid, 创建时间）只查一次；文件被删后保留最后大小。
- **`L=` 过滤**：只接受 `^\s*L=` 后紧跟的绝对路径（可带引号），排除 `$(`、反引号、以及指向可执行文件或目录的值。
- **已结束命令**：在列表中保留 `--keep-done`（默认 10 分钟），期间日志仍可查看。
- **启动时**：只对活跃会话的 jsonl 做一次全量扫描建立映射；逐行先用子串预检（`"tool_use"`/`"tool_result"`），命中才做 JSON 解析。

## 2. 状态判定与通知

每秒对运行中的命令采样：输出量（有日志取日志大小，否则为 0）、进程树累计 CPU（user+sys 之和）、
进程树中各进程的 name/argv/监听端口。判定基于一段时间内的增量。

状态按下表**自上而下**匹配，命中即停：

| 状态 | 图标 | 条件 | 默认阈值 | 通知 |
|---|---|---|---|---|
| 等待确认 | 🔴 | 树中有 `rm/cp/mv/ln` 等且 argv 含 `-i`/`-I`/`--interactive`，**并且** `stdin_open`，CPU 无增长 | 3s | ✅ |
| 等待授权 | 🔴 | 树中有 `pinentry*`/`ssh-askpass`/`osascript`/`security`/`codesign`/`sudo` 等（名单可配置），CPU 无增长 | 5s | ✅ |
| 监听中 | 🔵 | 树中有进程处于 LISTEN，且输出无增长（dev server、OAuth 回调） | 10s | 仅前台 ✅ |
| 疑似卡死 | 🟠 | 输出与 CPU 都无增长，且不属于以上几类；树中存在 `sleep`/`wait` 时豁免（Claude 自己的轮询） | 前台 30s / 后台 300s | ✅ |
| 安静工作 | 🟡 | 输出无增长但 CPU 在增长 | — | — |
| 运行中 | 🟢 | 输出在增长 | — | — |
| 成功结束 | ✅ | 进程已退出，tool_result 无错误或 `Exit code 0` | — | — |
| 失败结束 | ❌ | tool_result 为 `Exit code N`（N≠0） | — | — |
| `-i` 被自动拒绝 | 🚫 | 已结束，tool_result 含 `remove …?` 或 `overwrite …? (y/n [n]) not overwritten` | — | 只标记 |

- **超时倒计时**：前台命令显示距超时剩余时间（`tool_use.input.timeout`，缺省 120000ms）。
- **已知盲区**：psutil 在 macOS 上拿不到单个进程的网络 IO，CPU 为 0 但在下载的命令可能被判为 🟠。定位为提醒，接受误报。

通知：

- 每条命令每进入一个需告警的状态只通知一次；回到非告警状态后再次进入，重新通知。
- 默认渠道（`--notify auto`）：在 cmux 里（有 `CMUX_SURFACE_ID` 且能找到 `cmux`）用 `cmux notify --json` 发送，`--notify-timeout`（默认 10s）后 `cmux dismiss-notification --id` 撤回；其它终端写 OSC 9 + BEL（Ghostty、iTerm2 支持，无法撤回）。仪表盘内同时弹 textual toast，同样按 `--notify-timeout` 消失。
- 可选渠道：`--notify osc|cmux` 强制指定；`--notify osascript`（系统 `osascript`，默认关闭）；`--notify none` 关闭。
- 通知内容：会话名、状态、description、卡住的进程（name + pid + 精简 argv）、超时剩余。

所有阈值均可通过命令行参数或环境变量覆盖（参照 cc-stat 的 `IDLE_GAP`）。

## 3. 界面

### 宽度与图标

- 所有显示宽度用 `wcwidth` 计算，集中在 `cells.py`：
  - `width(s)`：`wcwidth.wcswidth`；遇不可打印字符返回 -1 时，逐字符 `wcwidth` 兜底，负值计 0。
  - `fit(s, n, align)`：按显示宽度截断并补 `…`，不足补空格；截断点落在宽字符中间时用空格补齐，不切半个字。
- 仪表盘各列内容先经 `fit()` 处理，列宽用 `width()` 计算后固定，不依赖 textual 自动测量。
- East Asian Ambiguous 字符（`… · — ↑ ↓` 及制表符 `─ │`）按 1 列计算，前提是终端未开启「ambiguous 按宽字符显示」（各终端默认如此）；数据列中的空值用 ASCII `-`。
- 图标只用**单码点、默认 emoji 呈现、宽度为 2** 的字符（见第 2 节表格，后台标记为 ⏳ U+23F3）；
  不使用带 VS16 的序列（`⚠️`、`⚙️`，各终端渲染宽度不一）和窄文本符号（`✔ ✘ ⚠`）。

### 仪表盘（默认）

```
┌ cc-tail - 2 个会话 / 3 条运行中 / 1 告警 ─────────────────────────────────────┐
│ 状态 后台 会话              命令                        运行  超时  输出 静默 │
│ 🔴        env-22            插入端口探测与输出函数      0:47  1:13  1.2K  44s │
│ 🟢        gingkoo-root-c7   mvn17 clean verify -T 1C    3:12  6:48  3.1M   0s │
│ 🟡   ⏳   gingkoo-root-c7   npm run build               1:05     -    8K  12s │
│ ✅        env-22            检查 Bash 工具的 stdin         -     -   420    - │
├ [日志]  进程树   命令 ────────────────────────────────────────────────────────┤
│ overwrite entrypoint.sh? (y/n [n])█                                           │
├───────────────────────────────────────────────────────────────────────────────┤
│ ↑↓ 选择  Tab 面板  f 跟随  n 结束后跟随  a 已结束  c 复制路径  q 退出         │
└───────────────────────────────────────────────────────────────────────────────┘
```

- 命令表排序：告警 > 运行中（按开始时间倒序）> 已结束。「命令」列优先显示 description，否则取命令原文首行。
- 详情三个页签：
  - **日志**：末尾最多 64KB，保留 ANSI 颜色，新内容自动滚到底；无日志时显示「无日志文件」。
  - **进程树**：pid、name、状态、CPU、监听端口、argv，高亮导致告警的进程。
  - **命令**：完整原文、description、日志路径。
- 默认页签：选中记录时，有日志 → 日志；无日志且运行中 → 进程树；无日志已结束 → 命令。选中的记录从运行变为结束时按同一规则重选；其余时候保持手动切换的页签。
- 跟随模式（`f`，默认开）：有新告警时自动选中告警命令，否则选中最新启动的命令；手动 ↑↓ 暂停跟随，再按 `f` 恢复。
- 结束后跟随（`n`，默认开）：手动选择模式下，选中的记录**在选中期间**结束后，若有运行中的命令（或之后出现新命令）则自动回到跟随模式；选中本来就已结束的记录不触发，等待期间手动移动光标则取消。
- `c`：通过 OSC 52 把日志路径复制到剪贴板（不调用 `pbcopy`）。

### 流式模式（`--stream`）

```
09:41:02 [gingkoo-root-c7 · mvn17 clean verify   ] [INFO] Building gingkoo-facility 1.2.0
09:41:05 !!! 🔴 等待确认 [env-22 · 插入端口探测与输出函数] cp -i entrypoint.sh … (pid 83758) 超时剩余 1:13
09:41:30 ✅ [gingkoo-root-c7 · mvn17 clean verify   ] 退出码 0，用时 3:40
```

- 合并输出各命令日志的新增行，前缀 `[会话 · 命令]` 经 `fit()` 补齐到统一宽度；同一命令固定颜色。
- 状态变化（开始、告警、结束）单独插入一行醒目显示。
- stdout 不是终端时自动关闭颜色，便于接 `rg`。
- 与仪表盘共用判定与通知逻辑。

### 命令行

```
cc-tail [--stream] [--session 名字或ID片段]... [--notify auto|osc|cmux|osascript|none] [--notify-timeout 秒]
        [--confirm-after 3] [--gui-after 5] [--listen-after 10]
        [--hung-fg 30] [--hung-bg 300] [--keep-done 10m]
```

`--session` 可重复，用于只看指定会话；默认跟踪所有活跃会话。

## 4. 代码结构、依赖与测试

沿用 yyscripts 惯例（参照 `brew-outdated.py` 的 `from common import …`）：顶层放入口脚本，逻辑放在同级包里。

```
package/yyscripts/
├─ cc-tail.py        # typer 入口：解析参数，选择仪表盘或流式模式
├─ cctail/
│  ├─ cells.py       # width() / fit()
│  ├─ sources.py     # 纯解析：sessions json、jsonl 增量读取、cmdline 还原与 stdin_open 判断、
│  │                 #         L= 提取、后台输出路径、tool_result 退出码与 -i 被拒痕迹
│  ├─ procs.py       # 唯一接触 psutil 的模块，返回纯数据类 ProcInfo
│  ├─ model.py       # Tracker：每个 tick 汇总数据源，维护 Session / Command / Log
│  ├─ detect.py      # 纯函数 classify(采样历史, now, 阈值) → State；通知去重
│  ├─ notify.py      # cmux notify（定时撤回）/ OSC 9 + BEL；可选 osascript
│  ├─ tui.py         # textual 界面
│  └─ stream.py      # 流式模式
└─ tests/test_cc_tail_{cells,sources,detect,model,ui,procs}.py
```

- 边界：只有 `procs.py` 和 `sources.py` 接触真实系统与文件；`model.py`、`detect.py` 通过注入的数据提供者和时钟运行。
- 依赖：`requirements.txt` 新增 `textual`、`psutil`（`wcwidth` 已有）。**实现前先验证 textual 在 venv 的 Python 3.14 上可安装、可运行。**
- 测试全部离线，`venv/bin/python -m pytest`，风格同 `test_cc_stat.py`：

| 测试 | 覆盖 |
|---|---|
| cells | 中文/emoji 截断不切半字；所有图标与样例中文在 wcwidth 与 rich 下宽度一致（防止任一方宽度表变化导致界面错位） |
| sources | cmdline 还原（`'"'"'` 转义、多行、heredoc 型无 `< /dev/null`）；`L=` 提取及误判排除；后台输出路径；`Exit code`；`-i` 被拒文本。样例取自真实格式并脱敏 |
| detect | 表格驱动：各状态阈值前后 1 秒、多条件同时满足时的优先级、`sleep` 豁免、通知去重与重新触发 |
| model | 假进程提供者 + 假 jsonl：进程 ↔ tool_use 匹配、日志归属、已结束命令淡出 |
| ui | textual `App.run_test()` 冒烟：表格渲染、按键、跟随切换；流式模式输出格式与前缀对齐 |
| procs | 唯一使用真实进程的测试：临时目录中起 `sleep` 写临时日志，验证能取到进程树、argv 与 CPU |

env 仓库侧：

- `bin/cc-tail -> ../package/yyscripts/wrapper.sh`（同 cc-stat）。
- `CLAUDE.md`「关键约定」增加 cc-tail 一条：实现位置、测试方法，并注明依赖 Claude Code 内部格式（jsonl、zsh cmdline 结构）。

提交：先在 yyscripts 子模块提交实现，再在 env 提交子模块版本、软链与文档；均不 push。
