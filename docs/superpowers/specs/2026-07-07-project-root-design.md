# project-root — 设计

## 目的

在 shell 中提供一个可靠的"项目根目录"查找能力，封装在 `lib/bash/` 中供其它脚本 source 使用，并在 `bin/` 中提供可执行包装。

## 用户故事

- 作为脚本作者，希望在自己的脚本中能写 `cd "$(project-root)"` 进入当前项目的根目录，无需手写向上遍历。
- 作为终端用户，希望执行 `find-project-root.sh` 能输出所在项目的根目录，配合 `cd $(find-project-root.sh)` 使用。

## 行为契约

### 函数 `project-root [start-dir]`

| 输入 | 行为 |
|---|---|
| 不传参数 | 起点 = `$PWD`（绝对路径化） |
| 传一个参数 | 起点 = 该路径（相对则相对 PWD，绝对则直接使用；最终 `realpath`） |
| 成功 | stdout 输出绝对路径；return 0 |
| 失败（找不到任何 marker 且不在 git 仓库） | stdout 空；return 1；stderr 默认空 |

### `bin/find-project-root.sh`

薄包装：source 库并把参数原样转发到 `project-root`。bin 包装不改变函数语义；用户可以直接在命令替换中调用：

```bash
cd "$(ENV/bin/find-project-root.sh)"
```

### 查找优先级

按以下顺序执行，命中即返回：

1. **git 仓库根**：`git -C "$start" rev-parse --show-toplevel`。仅在 `git` 可用且返回值非空时采用。
2. **IDE / claude / codex 工具的标志性根**（向上遍历）：
   - `.claude`（目录）
   - `.vscode`（目录）
   - `.idea`（目录）
   - `.envrc`（文件）
   - `.lazy.lua`（文件）
3. **语言标志性根**（向上遍历，每层按以下顺序匹配）：
   - **Gradle 多模块根**：`settings.gradle` 或 `settings.gradle.kts`（文件）
   - **Gradle 单模块 / 子模块**：`build.gradle` 或 `build.gradle.kts`（文件），且当前目录没有 `settings.gradle*`
     - 若是子模块（向上能找到 `settings.gradle*`），返回 `settings.gradle*` 所在目录
     - 若是单模块（向上找不到），返回当前目录
   - **Maven**：`pom.xml`（文件），用 climb_pom 上浮算法
   - **其他**：`package.json`、`go.mod`、`pyproject.toml`、`venv`、`Cargo.toml`

阶段 2 与阶段 3 都从 `$start` 起向上逐级遍历，每级依次判断，直到命中或抵达 `/`。

### `climb_pom`（Maven 多模块上浮）

```
function climb_pom(start):
    d = start
    while dirname(d) != "/" AND exists "$(dirname(d))/pom.xml":
        d = dirname(d)
    echo "$d"
```

等价于：在 `start` 的每个祖先 `a` 上，只要 `a/pom.xml` 存在就上移到 `a`；停在没有 `pom.xml` 的最深祖先。

### `climb_for_settings`（Gradle 子模块检测）

```
function climb_for_settings(start):
    d = dirname(start)
    while d != "/":
        if exists "$d/settings.gradle" OR exists "$d/settings.gradle.kts":
            echo "$d"; return 0
        d = dirname(d)
    return 1
```

注意：从 `start` 的**父目录**开始向上，不包括 `start` 本身。

## 文件清单

### 新增

| 文件 | 作用 |
|---|---|
| `lib/bash/project-root.sh` | 库文件，定义 `project-root`、`climb_pom`、`climb_for_settings` 等函数；source 后暴露 |
| `bin/find-project-root.sh` | 可执行包装脚本；source 库后 `project-root "$@"` |
| `lib/bash/test/test-project-root.sh` | smoke test，覆盖关键场景 |

### 修改

无（不修改任何已有文件）。

## 实现细节

### `lib/bash/project-root.sh`

头部按现有约定：

```bash
#!/bin/bash
# shellcheck disable=SC2155

[[ -z ${__ENV_LIB_PROJECT_ROOT:-} ]] && __ENV_LIB_PROJECT_ROOT=1 || return 0

source "$ENV/lib/bash/native.sh"
```

函数列表：

```bash
# 主入口
project-root() {
    local start=${1:-$PWD}
    start=$(to-absolute-path "$start")
    [[ -d $start ]] || return 1

    # 阶段 1: git
    if has-command git; then
        local git_root
        if git_root=$(git -C "$start" rev-parse --show-toplevel 2>/dev/null) && [[ -n $git_root ]]; then
            echo "$git_root"
            return 0
        fi
    fi

    # 阶段 2: 工具标志
    local d
    d=$start
    while [[ $d != "/" ]]; do
        if [[ -d $d/.claude || -d $d/.vscode || -d $d/.idea \
            || -f $d/.envrc || -f $d/.lazy.lua ]]; then
            echo "$d"; return 0
        fi
        d=$(simple-dirname "$d")
    done

    # 阶段 3: 语言标志
    d=$start
    while [[ $d != "/" ]]; do
        # Gradle 多模块根
        if [[ -f $d/settings.gradle || -f $d/settings.gradle.kts ]]; then
            echo "$d"; return 0
        fi
        # Gradle 单模块 / 子模块
        if [[ -f $d/build.gradle || -f $d/build.gradle.kts ]]; then
            local r
            r=$(climb_for_settings "$d")
            if [[ -n $r ]]; then
                echo "$r"
            else
                echo "$d"
            fi
            return 0
        fi
        # Maven
        if [[ -f $d/pom.xml ]]; then
            climb_pom "$d"
            return 0
        fi
        # 其他语言
        if [[ -f $d/package.json || -f $d/go.mod || -f $d/pyproject.toml \
            || -d $d/venv || -f $d/Cargo.toml ]]; then
            echo "$d"; return 0
        fi
        d=$(simple-dirname "$d")
    done

    return 1
}

climb_pom() {
    local d=$1
    while [[ $(simple-dirname "$d") != "/" && -f "$(simple-dirname "$d")/pom.xml" ]]; do
        d=$(simple-dirname "$d")
    done
    echo "$d"
}

climb_for_settings() {
    local d
    d=$(simple-dirname "$1")
    while [[ $d != "/" ]]; do
        if [[ -f $d/settings.gradle || -f $d/settings.gradle.kts ]]; then
            echo "$d"; return 0
        fi
        d=$(simple-dirname "$d")
    done
    return 1
}
```

实现要点：
- 用 `simple-dirname`（项目原生函数）而非外部 `dirname`，保持依赖最少
- 阶段 1 中 `git -C` 让 git 操作的目标目录可控，不依赖当前 shell 的 cwd
- 阶段 2 / 阶段 3 同一遍历，但因为阶段 2 优先，命中即停，阶段 3 在阶段 2 完全 miss 时才跑

### `bin/find-project-root.sh`

```bash
#!/usr/bin/env bash

source "$ENV/lib/bash/project-root.sh"
exec project-root "$@"
```

### `lib/bash/test/test-project-root.sh`

每个用例：
1. 在临时目录构造场景
2. `cd` 到测试起点
3. 断言 `project-root` 的输出与期望一致
4. cleanup 临时目录

测试场景清单（详见 §"测试用例"）。

## 测试用例

每个用例都使用 `trap` + 临时目录做隔离，函数失败时非零退出。

| # | 场景 | 起点 | 期望 |
|---|---|---|---|
| 1 | git 仓库根 | `$REPO` | `$REPO` |
| 2 | git 仓库子目录 | `$REPO/sub` | `$REPO` |
| 3 | git 仓库 + `.claude/` 在子目录 | `$REPO` | `$REPO`（git 优先） |
| 4 | 非 git + 含 `.claude/` | `$D/.claude/..` | `$D` |
| 5 | 非 git + 子目录向上找 `.vscode/` | `$D/sub/deeper` | `$D` |
| 6 | Gradle 单模块（仅 `build.gradle`） | `$D` | `$D` |
| 7 | Gradle 多模块根（含 `settings.gradle`） | `$D` | `$D` |
| 8 | Gradle 多模块子模块 | `$D/sub` | `$D`（climb_for_settings 命中） |
| 9 | Maven 单模块（含 `pom.xml`，父目录无） | `$D` | `$D` |
| 10 | Maven 多模块（嵌套 pom.xml） | `$D/sub` | `$D`（climb_pom 上浮） |
| 11 | 含 `package.json` 但无工具标志 | `$D` | `$D` |
| 12 | 同时含 `.claude/` 和 `pom.xml` | `$D` | `$D`（阶段 2 优先） |
| 13 | 啥都没有，遍历到 `/` | `mktemp -d` 临时空目录 | 空 stdout + exit 1 |
| 14 | 起点参数为相对路径 | `sub` | realpath 后正确 |
| 15 | `bin/find-project-root.sh` 端到端 | 命令替换调用 | 与函数结果一致 |

## 非目标（YAGNI）

- **不**解析 `build.gradle` / `pom.xml` 内容判断子模块归属（成本高、容易错）
- **不**支持调用方自定义 marker 列表（按用户决定）
- **不**支持 monorepo / workspace 的特殊识别（如 pnpm-workspace.yaml、lerna.json）
- **不**支持"项目根的语义版本"或"项目类型推断"
- **不**输出 JSON 等结构化数据，仅输出路径
- **不**修改当前 shell 的工作目录（`cd` 由调用方决定）
- **不**在找不到时输出 stderr（保持静默；调用方可加 wrapper）
- **不**支持多起点并行查找

## 依赖

- `git`（可选；不可用时跳过阶段 1）
- 现有 `lib/bash/native.sh`（提供 `simple-dirname`、`to-absolute-path`、`has-command`）

## 风险与权衡

1. **`git rev-parse` 在某些 monorepo 子目录中可能不是用户期望的"项目根"**——按用户需求，git 优先；如未来需要子项目级支持，再扩展。
2. **Gradle 单模块与子模块的区分采用启发式**：仅在没有 settings.gradle 时向上找，找到就用其所在目录。这对绝大多数 Gradle 项目正确，但理论上存在边界情况（例如单模块项目被嵌套在另一个项目的子目录里而没有 settings.gradle）——按 YAGNI 不处理。
3. **climb_pom 的边界**：当前目录 `pom.xml` 存在且父目录 `pom.xml` 也存在时上移；如果 `/` 下也有 `pom.xml`，会一路爬到 `/` 自身——但 `dirname "/"` 在脚本中需要保持 `/`，避免无限循环。