# cmux 对 Claude Code 的集成机制分析（基于最新源码）

> cmux 终端（`com.cmuxterm.app`，Swift App + Bash wrapper）如何接管并集成 Claude Code：
> 命令拦截链、wrapper 防护、注入的 hooks、PermissionRequest 决策桥，以及叠加自定义
> `bin/claude` 包装脚本后的行为。
>
> - cmux 源码仓库：`~/Workspace.localized/xcode/cmux`（与 env dotfiles 仓库分开）
> - 本轮分析基于 **更新后的最新源码**（含提交 `19ddb2efb Fix Claude shim mutual exec loop #7010`）
> - 分析时间：2026-06-29（重做）
> - 关键源码文件：
>   - `Resources/bin/cmux-claude-wrapper` — **Bash 脚本（977 行），真正的 wrapper 实现**
>   - `Resources/shell-integration/cmux-zsh-integration.zsh` — zsh 函数 + PATH shim 安装
>   - `CLI/cmux.swift` — hook 处理、feed 决策桥（**34658 行**）
>   - `CLI/FeedEventClassifier.swift` — 事件分类器（本版从 cmux.swift 抽出）
>   - `CLI/CMUXCLI+AgentHookDefinitions.swift` — 各 agent hook 安装定义
>
> ⚠️ 勘误：早期分析曾误以为 wrapper 是 Swift（`CLI/ClaudeWrapper/`）。该目录**不存在**，纯属误判。

---

## 1. claude 命令的拦截链

cmux 装**两道**拦截，最终都汇入 `cmux-claude-wrapper`：zsh 函数（交互式键入）+ PATH shim（子进程/脚本经 PATH 解析）。

### 1.1 安装入口（`cmux-zsh-integration.zsh:340`）

```zsh
_cmux_install_cli_wrapper claude _CMUX_CLAUDE_WRAPPER cmux-claude-wrapper
```
计算 `wrapper_path = <bundle>/bin/cmux-claude-wrapper`（`:315-325`），仅对 `claude` 额外装 shim，并定义 shell 函数（`:330-338`）：
```zsh
eval "claude() { _cmux_claude_wrapper_command \"\$@\"; }"      # :335
```

### 1.2 shell 函数跳板（`:306-314`）

```zsh
_cmux_claude_wrapper_command() {
    if [[ -x "${CMUX_CLAUDE_WRAPPER_SHIM:-}" ]]; then "$CMUX_CLAUDE_WRAPPER_SHIM" "$@"
    elif [[ -x "${_CMUX_CLAUDE_WRAPPER:-}" ]]; then "$_CMUX_CLAUDE_WRAPPER" "$@"
    else command claude "$@"; fi      # 兜底：都不可用才直连 PATH 上的 claude
}
```

### 1.3 shim 生成、位置、PATH 插入（`_cmux_install_cli_command_shim :239-305`）

- 路径（每 surface 一个目录）`:242-243`：`${TMPDIR}/cmux-cli-shims/${CMUX_SURFACE_ID}/claude`
- shim 内容（`chmod 0700`，`:252-296`）：定位 wrapper 后 `exec "$cmux_wrapper" "$@"`（`:273-275`）；兜底从 PATH 剔除所有 `cmux-cli-shims` 目录后 `exec claude`（`:276-291`）
- 导出标识 + shim 目录置于 PATH 最前（`:298-304`）：`CMUX_CLAUDE_WRAPPER_SHIM` / `CMUX_CLAUDE_WRAPPER_SHIM_ROOT`

### 1.4 完整跳跃

```
claude (zsh 函数 :335)  /  子进程经 PATH 命中 shim
  → _cmux_claude_wrapper_command (:306)
  → $CMUX_CLAUDE_WRAPPER_SHIM  (临时 shim, PATH 最前)
  → exec cmux-claude-wrapper (:273)
  → find_real_claude 解析 → cmux_claude_wrapper_exec_resolved_claude (带重入护栏)
  → exec env/bin/claude   (用户包装，加载 secrets)
  → exec /opt/homebrew/bin/claude   (真实 claude)
```

> 只有命令名 **`claude`** 进入此链；`claude-glm`/`claude-mini` 等变体不装 shim/函数，直接走 `bin/claude` 软链。

---

## 2. cmux-claude-wrapper 的防护与定位逻辑

### 2.1 定位真实 claude — 经过 bin/claude，不绕过（`find_real_claude :187-210`）

```bash
custom="${CMUX_CUSTOM_CLAUDE_PATH:-}"  # :190 覆盖项(Settings>Automation>Claude Binary Path)
if [[ -n "$custom" && -f && -x ]] && ! is_self_or_shim "$custom"; then echo "$custom"; return; fi
self_dir="$(cd "$(dirname "$0")"&&pwd)"
for d in $PATH; do                                  # :201 按 PATH 顺序
    [[ "$d" == "$self_dir" ]] && continue           # 跳过自身目录
    candidate="$d/claude"; is_self_or_shim "$candidate" && continue   # :206 跳过 self/shim
    [[ -x "$candidate" ]] && echo "$candidate" && return              # :207 取第一个
done
```

- **覆盖项** `CMUX_CUSTOM_CLAUDE_PATH` 优先且校验非自引用。
- **自引用防护** `cmux_claude_wrapper_is_self_or_shim :9-34`：`-ef` 比对 `$0`/`CMUX_CLAUDE_WRAPPER_SHIM(_ROOT)`，按模式排除 `*/cmux-cli-shims/*/claude`、`*/Resources/bin/claude`。
- **不绕过 `env/bin/claude`**：PATH 中 `env/bin` 在 `/opt/homebrew/bin` 之前，`env/bin/claude` 非 self/shim，故 `REAL_CLAUDE = env/bin/claude`，secrets 正常。`ps` 看到的 homebrew 路径是 `bin/claude` 最后 `exec` 过去的结果。

### 2.2 提交 #7010 — 修复 shim 互相 exec 死循环

`git show 19ddb2efb`：改 3 文件，`cmux-claude-wrapper +202`，新增回归测试 `tests/test_claude_wrapper_mutual_shim_loop.py (+890)`。

**场景**：shim `exec` 出去后，若 PATH 上另一个 `claude` shim 或用户脚本又把 `claude` exec 回 cmux shim/wrapper，会在真实二进制启动前反复 `exec` 成无限环（*"per-surface claude shim re-entered before the real binary started"*）。

**修法**：所有裸 `exec "$REAL_CLAUDE"` 改为 `cmux_claude_wrapper_exec_resolved_claude`（5 处：`:548/:561/passthrough/:799/:973,976`），新增有界重入护栏：

- `..._target_looks_like_reexec_shim`（`:91-149`）：嗅探目标是否"会再 exec claude 的脚本"（magic `2321`=`#!`，snippet 命中 `exec claude`/`command claude`/`env claude`/`spawn|execFile|subprocess(...'claude')`/`=claude`+`exec "$...`）；**放行**真实 CLI（`@anthropic-ai/claude-code`、`claude-code/cli.js`、首行含 `node`、`.asdf/.mise/.volta` shim）。
- `..._exec_resolved_claude`（`:151-182`）：
  ```bash
  if ! ..._looks_like_reexec_shim "$target"; then
      unset ..._reexec_guard ..._reexec_targets   # 到达真实二进制边界，清零
      exec "$target" "$@"
  fi
  if ..._reexec_target_seen "$target"; then fail; fi   # 同一目标重复 = 环 → 中止
  if (( hops >= 16 )); then fail; fi                   # 跳数上限 16
  hops++; export ..._reexec_guard=$hops ..._reexec_targets=<history>   # 经 env 跨 exec 传递
  exec "$target" "$@"
  ```
- 命中环/超限 → `..._fail_reexec_guard`（`:51-60`）以 **exit 126** 退出 + 诊断（提示设 `CMUX_CUSTOM_CLAUDE_PATH`）。

**对你的链路**：`env/bin/claude` 以 `claude` 名运行时用 `exec "$CLAUDE"`/`CLAUDE=...` 赋值，**不命中** reexec-shim 模式 → 被视为"真实二进制边界"，清零护栏直接 exec。纯 `claude` **不构成环**。#7010 护栏的触发器是 `claude-glm` 等**非 claude** 名回指 cmux shim 的场景。

### 2.3 防重入 / 防嵌套包装的 5 个决策闸门

| # | 闸门 | 行号 | 行为 |
|---|---|---|---|
| 1 | `IN_CMUX` = `[[ -n "$CMUX_SURFACE_ID" ]]` | `:535-538` | 在 cmux 内置 1 |
| 2 | `CMUX_CLAUDE_HOOKS_DISABLED == 1` | `:551-562` | passthrough（仍清 `CLAUDECODE`） |
| 3 | `IN_CMUX==0` 或 socket 不可用 | `:564-576` | passthrough；`cmux_socket_available`(`:213-227`)要求 socket 活且 `cmux ping` 0.75s 内成功 |
| 4 | **shim 链重入** `reexec_hops>0`（#7010） | `:786-800` | 只刷新元数据、**原样转发 argv，不二次注入** |
| 5 | 子命令（`--help/-v`、`config/mcp/doctor`…） | `:748-784,804-807` | `should_inject_claude_hooks` 非 0 则 passthrough |

### 2.4 ⭐ 关键真相：Bash 工具/子进程里再调 `claude` = 全新独立会话被全套注入

子进程**继承** `CMUX_SURFACE_ID`、socket 仍在 → 闸门 2/3 都不命中 → **不会 passthrough**，而被**有意当作一个全新独立会话**重新全套注入（新 `--session-id`、新 hooks）。`:811 unset CLAUDECODE` 正是为此：抹掉 Claude 写进子环境的 `CLAUDECODE=1`，避免被判"嵌套会话"。

真正的"不重复注入"**仅限单条 shim-bounce 链内**（闸门 4 的 hops 计数）；一旦 `exec_resolved_claude` 到达真实二进制边界（`:159-160`）就 `unset` 掉 guard，后续真正嵌套的 claude 从零开始重新注入。

> 这修正了早期"防重入会让子进程调用 passthrough"的错误结论。嵌套 claude 会带父 `CMUX_SURFACE_ID`/`CMUX_WORKSPACE_ID` 重新注入全套 hooks → 状态/通知/Feed 决策可能推到父会话标签页、PermissionRequest 在父面板 long-poll。详见 §5。

### 2.5 注入内容

环境变量（`:828-833`，重入分支 `:793-797`）：`CMUX_CLAUDE_PID=$$`、`CMUX_CLAUDE_HOOK_CMUX_BIN`、`CMUX_AGENT_LAUNCH_KIND/EXECUTABLE/ARGV_B64/CWD`；另有 `install_cmux_node_options`（`:680-695`）注入 `NODE_OPTIONS`（含 `restore-node-options.cjs`）。

`--settings`（`:861`）：`HOOKS_JSON` 含 `preferredNotifChannel:notifications_disabled` 与 SessionStart/Stop/SubagentStop/SessionEnd/Notification/UserPromptSubmit/PreToolUse/PermissionRequest hooks。用户自带 `--settings` 由 `:925-970` 的 node 脚本**深合并成单个** `--settings`。

passthrough 时 `exec_real_claude_passthrough`（`:540-549`）`unset` 所有 `CMUX_*` 和 `TERMINFO`。

---

## 3. cmux 注入给 Claude 的 hooks（cmux.swift 最新行号）

Claude **不在** `agentDefs` 通用表里；生命周期 hook 走专用 `runClaudeHook`（定义 `cmux.swift:22987`），阻塞决策走 `runFeedHook --source claude`。

分发入口：`cmux.swift:4893`（顶层 `claude-hook`）/ `cmux.swift:33925`（`hooks claude`），均调 `runClaudeHook`。stdin 读取+解析 `:23031`，主 switch `:23062`。支持的 event：

| event | 行号 | 性质 |
|---|---|---|
| session-start / active | `23063` | 异步遥测 |
| stop / idle | `23190` | |
| prompt-submit | `23301` | |
| auto-name | `23408` | 自动命名会话 |
| notification / notify | `23444` | 系统通知 |
| session-end | `23530` | |
| **cron-create-guard** | `23652` | **唯一会返回 deny 的** |
| **pre-tool-use** | `23659` | 状态同步，不拦截 |
| help | `23830` | |

### 3.1 cron-create-guard（拦截 durable cron）

分发 `:23652`，实现 `claudeCronCreateGuardResponse` `:23843`：

```swift
guard let object, object["tool_name"] as? String == "CronCreate",
      let input = object["tool_input"] as? [String: Any],
      claudeCronCreateDurableRequested(input["durable"]) else { return "{}" }
return jsonString(["hookSpecificOutput": [
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "cmux does not support durable Claude Code cron jobs. ..."]])
```

拦截条件：`CronCreate` 且 `tool_input.durable` 为真（`claudeCronCreateDurableRequested :23860` 把 Bool/NSNumber/`"1"|"true"|"yes"` 视为 true）；否则 `"{}"` 放行。

### 3.2 pre-tool-use（状态同步，不拦截）

分发 `:23659`，注释 `:23661`：*"Clears 'Needs input' status... Runs async so it doesn't block tool execution."* 解析 session→workspace/surface，做 stale 检测与嵌套 agent 抑制（`:23693`/`:23698` 打印 `OK` 提前返回），末尾把 tab 标记 `.running`。

**AskUserQuestion / ExitPlanMode 特例**（`:23715`，issue #6606）：在 `--dangerously-skip-permissions`(bypassPermissions) 下，Claude 对这两个工具既不发 PermissionRequest 也不发 Notification，故此 PreToolUse 是唯一 needs-input 信号 → 这里把状态设为 **needs-input**（而非 running）并存问题/计划摘要供 Notification 复用。仍是状态修正，非决策拦截。

---

## 4. PermissionRequest 决策桥 runFeedHook（cmux.swift 最新行号）

定义 `cmux.swift:33008`（MARK 注释 `:32990`）。入口：`cmux hooks feed --source claude` → case "feed" `:33914`（也走 `:4907`）。

### 4.1 数据流

1. **先决条件**（`:33023`）：无 `CMUX_SURFACE_ID`（不在 cmux 终端）→ `print("{}")` no-op。
2. **读 stdin**（`:33028-33052`）：non-codex 直接 `readDataToEndOfFile`；codex 走 `readBoundedFeedHookStdin`（1MB 上限 `:33270`）。`JSONSerialization` 失败 → `print("{}")`。
3. **事件映射 + isBlocking**（`:33055,:33068`）：
   ```swift
   let (hookEventName, isActionable) = FeedEventClassifier.classify(source:, event:, toolName:)
   ```
   `FeedEventClassifier.swift:34` 用**类型化注册表**把 `(source,event)` 映射到语义枚举。Claude 表（`:172`）：`PermissionRequest→approvalRequest`(actionable)、`PreToolUse→toolStart`(telemetry)、`PostToolUse→toolEnd`(**telemetry, 非 actionable**)。`approvalRequest` 在 `wireMapping`(`:117`)按 toolName 分派：`ExitPlanMode`/`AskUserQuestion`/其余→`PermissionRequest`，均 actionable。`isActionable` 即 isBlocking。
4. **payload 内联构建**（本版无独立 `buildFeedPushPayload`，eventDict `:33094-33135`）：`session_id`(`"<source>-<sessionId>"`)、`hook_event_name`、`_source`、`_ppid`（agent PID，用于被杀时过期卡片）、`workspace_id`、`cwd`、`tool_name`、`tool_input`（PostToolUse 走 `sanitizedPostToolUseFeedValue` 截断）、`context`、prompt、`_opencode_request_id`。
5. **阻塞/非阻塞**（`:33156-33205`）：
   ```swift
   let waitTimeout: Double = isActionable ? 120 : 0
   request = ["method":"feed.push", "params":["event":eventDict, "wait_timeout_seconds":waitTimeout]]
   if waitTimeout > 0 { request["id"] = UUID().uuidString }   // 有 id → 请求/响应
   ```
   - 非阻塞：`client.sendOneWay(...)` fire-and-forget → `print("{}")`。
   - 阻塞：socket verb 仍是 **`feed.push`**，带 id，`send(command:responseTimeout: waitTimeout+5)` long-poll，App 最多挂 120s（hook timeout 125s，确保 socket 先返回）。
6. **解析回传**（`:33232-33258`）：`result.status`，`status=="resolved"` → 取 `decision` → `renderAgentDecision(...)` → `print`；否则 `print("{}")`（fail-open）。

### 4.2 决策映射 renderAgentDecision（`:33460`，source=="claude"）

信封 `permissionRequestHookDecision`（`:33478`）：`{"hookSpecificOutput":{"hookEventName":"PermissionRequest","decision":{behavior, message?, updatedInput?, updatedPermissions?}}}`。

| kind | 行号 | 用户选择 → 输出 |
|---|---|---|
| **permission** | `:33548` | deny→`deny`+message；allow→`allow`；always/all→`allow`+`updatedPermissions`(取 `permission_suggestions`) |
| **exit_plan** | `:33603` | feedback/deny→`deny`+消息；ultraplan→`deny`+引导；autoAccept→`allow`+`updatedInput`+`updatedPermissions:[{type:setMode,mode:auto,destination:session}]`；通过→`allow`+`updatedInput`(原样) |
| **question** | `:33688` | `skipInterviewAndPlanAnswer`→`deny`+引导直接写计划；否则 `claudeAskUserQuestionInput`(`:33761`)把 selections 按问题文本组装成 `answers` 塞回 `updatedInput`→`allow` |

非 claude 源走 `nonClaudePreToolDecision`（`:33505`）。default→`"{}"`（`:33744`）。

### 4.3 约束

- **三段管道**：stdin → socket `feed.push` → stdout。
- **决策来源唯一**：完全来自用户在 Feed 侧边栏操作。
- **三重 fail-open**：不在 cmux 终端 / socket 错误·`ok!=true` / status 非 resolved·kind 未知 → 一律 `print("{}")`，回退原生 TUI 权限提示。

### 4.4 能否篡改工具执行后的输出？— 不能

- Claude 的 `feedHookEvents`（`CMUXCLI+AgentHookDefinitions.swift:167`）**包含 PostToolUse**，但分类器把它映射为 `toolEnd→("PostToolUse", false)`（`FeedEventClassifier.swift:175/:134`），**非 actionable** → 走非阻塞 fire-and-forget 遥测，仅推 Feed 展示（`tool_input` 截断），**不读取也不回写 `tool_response`**。
- `tool_response` 的特殊处理**只对 codex** 生效（`:33110`），且仅用于 Feed 展示，非改写。
- `renderAgentDecision` 只有 permission/exit_plan/question 三类输出，**无 PostToolUse 分支**、不写 `tool_response`/`output`。

结论：PermissionRequest/PreToolUse 只能在执行**前**决定 allow/deny 或通过 `updatedInput`(及 exit_plan 的 `updatedPermissions`)改输入；**无法修改 `tool_response`**。

### 4.5 时序图

```mermaid
sequenceDiagram
    autonumber
    participant CC as Claude Code
    participant Hook as cmux hooks feed (runFeedHook)
    participant App as cmux App (socket/Feed)
    participant U as 用户

    CC->>Hook: cmux hooks feed --source claude (hook JSON 经 stdin, t=125s)
    activate Hook
    Hook->>Hook: 读 stdin → 解析 ; FeedEventClassifier.classify → (event, isActionable)
    Hook->>Hook: 内联构建 eventDict (+session/workspace/_ppid/tool_input...)
    alt isActionable == false (telemetry: PreToolUse/PostToolUse/Stop...)
        Hook->>App: sendOneWay feed.push (waitTimeout=0)
        Hook-->>CC: print "{}"
    else isActionable == true (PermissionRequest/ExitPlanMode/AskUserQuestion)
        Hook->>App: send feed.push (id + wait_timeout=120) long-poll
        activate App
        App->>U: Feed 侧边栏渲染可操作项
        U->>App: 点选裁决
        App-->>Hook: result { status, decision }
        deactivate App
        alt status == "resolved"
            Hook->>Hook: renderAgentDecision (permission/exit_plan/question)
            Hook-->>CC: print(hookSpecificOutput)
        else 非 resolved
            Hook-->>CC: print "{}"
        end
    end
    deactivate Hook
    opt 不在 cmux终端 / socket错误 / ok!=true (fail-open)
        Hook-->>CC: print "{}" → 回退原生权限提示
    end
```

---

## 5. 叠加 bin/claude 后的问题结论

> `bin/claude` 按调用名 `$0` 从 `etc/secret/<name>.env` 加载 secrets 后 exec 真实 claude。

| 编号 | 问题 | 最新结论 | 风险 |
|---|---|---|---|
| A | Bash 工具/脚本里调 `claude` 被重新包装 | **确实会**：子进程 `IN_CMUX=1`+socket 在 → 当作**全新独立会话全套注入**（新 session-id/hooks）。§2.4 | 🟠 真实存在 |
| B | 嵌套会话复用父 surface/workspace 致状态串台 | 嵌套 claude 带父 `CMUX_SURFACE_ID` 重新注入 hooks → 状态/通知/Feed 决策可能推到父标签页；PermissionRequest 在父面板 long-poll | 🟠 真实存在 |
| C | shim 在 TMPDIR，跨重启/清理失效 | `CMUX_CLAUDE_WRAPPER_SHIM` 失效则 `-x` 失败回退；socket 失效另有 0.75s 超时兜底（`:213-227`） | 🟡 |
| D | 仅 `claude` 进 cmux 链，变体不对称 | `claude-glm` 等不被包装；非 claude 名回指 cmux shim 正是 #7010 的环触发器 | 🟡 |
| E | 多层 exec 是否绕过 bin/claude 丢 secrets | **不绕过**（§2.1，PATH 顺序先命中 bin/claude）；仅 PATH 异常缺 bin/claude 时兜底 homebrew 才丢 | 🟢 安全 |
| F | shim 互相 exec 死循环 | #7010 已加护栏：reexec-shim 嗅探 + 环检测 + 16 跳上限 + exit 126（§2.2） | 🟢 已修复 |
| G | cmux 篡改工具输出结果 | **不能**：PostToolUse 是非 actionable 遥测、不回写 tool_response；决策只能改输入（§4.4） | 🟢 安全 |

### 重要澄清：subagent 不重走调用链

Claude Code 的 subagent（Task/Agent 工具）在**同一 claude CLI 进程内**以独立上下文运行，**不 spawn 新 `claude` 进程**。所以"主 agent 派生 subagent"不重走链 1→5。真正重走链的是**主 agent 或 subagent 通过 Bash 工具执行的命令里（直接/间接）调用了 `claude`**（git hook、Makefile、子脚本、或被要求"用 claude 跑子任务"）——此时触发问题 A/B。

### 缓解（在 Bash 里需要干净调用 claude 时）

1. 绝对路径绕开 shim：`/opt/homebrew/bin/claude` 或 `env/bin/claude`。
2. 子调用前清环境：从 PATH 剔除 `*cmux-cli-shims*`，`unset CMUX_SURFACE_ID CMUX_CLAUDE_WRAPPER_SHIM`，避免被当新会话注入与状态串台。
3. 完全脱离：`unset -f claude` 并移除 shim 目录。

---

## 6. claude-mini 等符号链接变体的链路与 CMUX_PRESERVE 握手

`claude-mini`/`claude-glm` 等是指向 `bin/claude` 的符号链接，`bin/claude` 按 `$0` 的 basename 用 sops 解密 `etc/secrets/<name>.env` 加载该账号的 secrets。这些名字**不进 cmux 的 zsh 函数/shim**（cmux 只为 `claude` 安装），但 `bin/claude` 内部有一段**主动回指 cmux** 的握手逻辑。

### 6.1 决定走向的分支（`bin/claude:20-32`）

```bash
if [[ $NAME != claude && -z $CMUX_PRESERVE_CLAUDE_AUTH_SELECTION_ENV && -n $CMUX_SURFACE_ID ]]; then
    if [[ -x $CMUX_CLAUDE_WRAPPER_SHIM ]]; then
        CLAUDE=$CMUX_CLAUDE_WRAPPER_SHIM
        export CMUX_PRESERVE_CLAUDE_AUTH_SELECTION_ENV=1   # ← 回指同时设保留开关
    elif [[ -x $_CMUX_CLAUDE_WRAPPER ]]; then
        CLAUDE=$_CMUX_CLAUDE_WRAPPER
        export CMUX_PRESERVE_CLAUDE_AUTH_SELECTION_ENV=1
    fi
fi
if [[ -z $CLAUDE ]]; then
    CLAUDE=/opt/homebrew/bin/claude
    unset CMUX_PRESERVE_CLAUDE_AUTH_SELECTION_ENV
fi
exec "$CLAUDE" "$@"
```

- **在 cmux 内**（`CMUX_SURFACE_ID` 非空）且名字非 `claude` 且开关未设 → 回指 `CMUX_CLAUDE_WRAPPER_SHIM`，**同时 `export CMUX_PRESERVE_CLAUDE_AUTH_SELECTION_ENV=1`**。
- **不在 cmux** → 直接 `/opt/homebrew/bin/claude`，完全不经过 cmux。

### 6.2 实际逐跳链路（cmux 内，已验证 PATH 中 env/bin 位置 3 先于 homebrew 位置 21）

| 跳 | 进程 | `$0`/NAME | 行为 |
|---|---|---|---|
| 1 | `bin/claude`（经 `claude-mini` 链接） | `claude-mini` | 载 `claude-3rd.sh` + `sops decrypt claude-mini.env`（`set -a` 导出）；命中 `:20` → `export CMUX_PRESERVE_…=1` → `exec $CMUX_CLAUDE_WRAPPER_SHIM` |
| 2 | shim → `cmux-claude-wrapper` | — | `find_real_claude` 按 PATH 取首个 `claude` = `env/bin/claude`（非 self/shim）→ 注入 hooks/`--session-id/--settings` |
| 3 | `bin/claude`（第 2 次） | **`claude`** | `NAME==claude` → `:7`/`:20` 分支均不成立 → `CLAUDE=/opt/homebrew/bin/claude` → `exec` |
| 4 | `/opt/homebrew/bin/claude` | — | 真实 claude，带 cmux 注入参数 + mini secrets |

用户猜测链路 `claude-mini → claude → $CMUX_CLAUDE_WRAPPER_SHIM → claude → /opt/homebrew/bin/claude` **完全成立**。

### 6.3 三个潜在风险点均被挡住

1. **不循环/不重复进 cmux**：第 2 次进 `bin/claude` 时 `$0` 已是绝对路径 `env/bin/claude` → `NAME==claude` 跳过回指分支；且 `CMUX_PRESERVE_…=1` 使 `:20` 条件再多一道不成立（双闸门）。
2. **不触发 #7010 重入护栏**：wrapper 的 reexec-shim 嗅探只匹配字面量 `exec claude`/`=claude`，而 `bin/claude` 用 `exec "$CLAUDE"`（变量）+ `CLAUDE=/opt/homebrew/bin/claude`（子串 `bin/claude` 非 `=claude`）→ 不命中 → 判为"真 Claude 边界"，清零 guard 直接 exec，hops 不自增。
3. **mini secrets 不丢**：`claude-mini.env` 第 1 跳即 export 进环境，靠 exec 链继承；第 2 跳 `NAME==claude` 不会重载 `claude.env` 覆盖它。

**结论**：链路成立、无循环、不触发护栏、secrets 正确保留。代价是 mini 会被 cmux 完整接管（注入 hooks/连 Feed/新 session-id），但这是主动回指 shim 的预期行为。

### 6.4 CMUX_PRESERVE_CLAUDE_AUTH_SELECTION_ENV 的作用

这是 `bin/claude` 与 cmux wrapper 之间**刻意的握手信号**，防止 secrets 注入的账号选择被 cmux 清掉。

**背景**：cmux wrapper 在 `IN_CMUX==1` 时调 `clear_inherited_claude_auth_selection_env`（wrapper `:521-531`），`unset` 这组"认证选择"变量（`CLAUDE_AUTH_SELECTION_ENV_KEYS`，wrapper `:253-259`）：

```
ANTHROPIC_API_KEY  ANTHROPIC_MODEL  ANTHROPIC_SMALL_FAST_MODEL
CLAUDE_CODE_USE_BEDROCK  CLAUDE_CODE_USE_VERTEX
```

目的：每个 surface 是独立会话，防止子会话继承父会话/启动终端的账号选择而用错账号。

**冲突**：`claude-mini.env` 解密出的正是 `ANTHROPIC_API_KEY` 等——全在这张清单里。不打招呼就会被 cmux 清掉 → mini 退回默认账号/"未登录"。

**开关行为**（wrapper `:262-320`）：
- 归一化接受 `1/true/yes`；为真时 `should_preserve_claude_auth_selection_key` 对**每个 key 都返回保留** → 清除循环全跳过。
- 可选 `CMUX_PRESERVE_CLAUDE_AUTH_SELECTION_ENV_KEYS`（逗号/空格分隔）改成只保留指定 key 的 allow-list。
- 即使开关为 false，`CLAUDE_CODE_USE_VERTEX/BEDROCK` 为真时相关 key 仍自动保留（issue #3641/#3638）。

**与 mini 的关系**：`bin/claude` 在回指 shim 的同一行（`:23/:26`）自动 `export CMUX_PRESERVE_…=1`，等于对 cmux 声明"这些认证变量是我故意载入的，别动"；直连 homebrew 路径（`:32`）则 `unset`。**所以这个保留是 `bin/claude` 替你自动完成的握手，无需手动设置**——也正是 6.3 中"mini secrets 不被清掉"的保障来源。

| source key | 说明 |
|---|---|
| 设置方 | `bin/claude:23/:26`（回指时 =1）、`:32`（直连时 unset） |
| 读取方 | wrapper `:262-320`（归一化+保留判断）；`bin/claude:20`（当"已处理"护栏） |
| 被保护的变量 | `CLAUDE_AUTH_SELECTION_ENV_KEYS`（wrapper `:253-259`，5 个认证/后端/模型选择变量） |
| 清除逻辑 | `clear_inherited_claude_auth_selection_env`（wrapper `:521-531`，`IN_CMUX==1` 时触发） |

---

## 7. 与旧版（cmux.swift 21065 行）的主要逻辑变化

1. **新增 `cron-create-guard`**（`:23652/:23843`）——旧版无；专门拦截 `CronCreate durable:true`。
2. **事件分类重构**为独立 `FeedEventClassifier.swift`（类型化枚举 + per-agent 注册表，区分 `toolStart` vs `toolStartMaybeApproval`），修复 issue #4985（tool-start 误判为审批）；函数名 `classifyFeedEvent` → `FeedEventClassifier.classify`。
3. **`buildFeedPushPayload` 被内联**为 `runFeedHook` 内的 `eventDict`。
4. **AskUserQuestion/ExitPlanMode 在 pre-tool-use 的特例**（`:23715`，issue #6606，针对 `--dangerously-skip-permissions`）。
5. **PostToolUse feed 值清洗/截断**（`sanitizedPostToolUseFeedValue :33273-33408`，512B 标量上限）+ codex 1MB stdin 上限。
6. **exit_plan 的 ultraplan / autoAccept→setMode**、**question 的 skipInterview** 等更细决策模式。
7. **renderAgentDecision 按 source 多分支**（claude/codex/hermes-agent/antigravity/kiro）。
8. **wrapper #7010 重入护栏**（见 §2.2）。

---

## 8. TODO（下次继续，可选）

1. 复核 §2/§3/§4 行号（来自两个子代理对最新源码的探索 + `git show #7010` 实证，可信度高，但未逐行亲验）。
2. 实测当前 GUI 会话从 Bash 工具调 `claude` 的实际行为，复现验证问题 A/B。
3. 如需更底层细节：`send(command:responseTimeout:)` 的 socket 帧格式、App 端 Feed store 如何 resolve 并回传 decision。
</content>
