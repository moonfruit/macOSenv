# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 概述

这是一个 macOS 个人环境配置仓库（dotfiles），管理 shell 配置、开发工具、代理设置、Homebrew 包列表等。仓库通过 `$ENV` 环境变量引用，值为 `~/Workspace.localized/env`。

## 仓库结构

- **`bin/`** — 自定义可执行脚本和工具的包装器。许多是符号链接，指向 `package/yyscripts/wrapper.sh` 或 `bin/zoo/` 中的入口点。`bin/zoo/` 下的 `javan` 是多版本 Java/Maven 命令的统一入口（`java8`, `mvn21` 等通过符号链接名称区分版本）。`bin/claude` 及其符号链接变体（`claude-glm`, `claude-mini` 等）根据名称加载对应的 `etc/secret/*.env` 环境变量。
- **`etc/`** — 各类应用配置：`zsh/`（oh-my-zsh 自定义配置）、`git/`（gitconfig）、`sing-box/`（代理配置，使用分片 JSON）、`ssh/`、`hammerspoon/`、`claude/`、`Brewfile` 等。
- **`etc/zsh/`** — oh-my-zsh 的 `$ZSH_CUSTOM` 目录。`env.zsh` 设置环境变量，`alias.zsh` 定义别名，`tools.zsh` 配置开发工具，`proxy.zsh` 管理代理。
- **`etc/secrets/`** — 通过 `sops` 加密的 `.env` 文件（`secret.env` 在 zsh 启动时自动 source；`claude-*.env`、`gemini*.env` 由对应包装器按 wrapper 名按需加载）。规则在仓库根 `.sops.yaml`。
- **`etc/claude/`** — Claude Code 的全局配置源（`settings.json`、`CLAUDE.md` 等），通过软链同步到 `~/.claude/`。
- **`lib/bash/`** — 可复用的 bash 函数库：`color.sh`、`console.sh`、`docker.sh`、`fs.sh`、`github.sh`、`java.sh`、`json.sh`、`native.sh`，通过 `source` 引入。
- **`package/`** — Git submodule。zsh 相关在 `package/zsh/` 下（`oh-my-zsh`、`powerlevel10k`、`fast-syntax-highlighting`、`zsh-autosuggestions`、`zsh-history-substring-search`），其余在 `package/` 顶层（`yyscripts`、`archey-osx`、`custom-alfred-iterm-scripts`、`gost`）。
- **`preferences/`** — 应用偏好设置备份（Alfred、Chrome、iTerm、mpv 等）。

## 常用命令

```bash
# 更新所有 submodule 和子目录中的 update.sh，以及 homebrew
./update.sh

# 仅更新 submodule，不更新 homebrew
./update.sh --no-brew

# 更新并执行 git gc
./update.sh --gc

# 跳过指定子目录（可重复，按路径后缀匹配，如 sing-box 或 etc/sing-box）
./update.sh --skip sing-box

# 解密 sops 加密的 env 并 export 到当前 shell
eval "$(sops-env <name>)"   # 例如 sops-env claude-glm

# 直接查看明文
sops decrypt etc/secrets/<name>.env
```

## 关键约定

- **Git 配置**：commit 默认启用 SSH 签名（`gpg.format = ssh`，`signingkey = ~/.ssh/id_ed25519.pub`），pager 使用 `delta`（side-by-side 模式）。
- **代理**：GitHub/GitLab/Bitbucket 的 HTTP 代理设置为 `http://127.0.0.1:7890`，SSH URL 统一重写为 HTTPS。
- **sing-box 配置**：`etc/sing-box/config/` 下为分片 JSON 文件，由 `sing.sh` 组装。修改配置后使用 `reload.sh` 重载。
- **Homebrew**：`etc/Brewfile` 记录所有已安装的包。`brew-up.sh` 和 `brew-livecheck.sh` 是自定义更新脚本。
- **Zsh 入口**：`etc/zshrc` 是 `.zshrc` 的实际内容，设置 `$ZSH_CUSTOM` 指向 `etc/zsh/`，主题根据终端选择 powerlevel10k 或 robbyrussell。
- **Secrets 加载**：`bin/claude`（及 `claude-glm`/`claude-mini`/`claude-open`/`claude-xiaomi` 等同名软链）按调用名 `$0` 从 `etc/secrets/<name>.env` 中 `sops decrypt` 出 env 并 export，再 exec 真实 claude；同样模式适用于 `gemini`/`gemini-x`。
- **多版本 Java**：`bin/zoo/javan` 是统一入口，调用名按正则 `<cmd><version>` 解析（如 `mvn21`、`java8`、`ijhttp21`、`mvn-release-17.sh`），最终通过 `java-home -v <version>` 选版本执行。
- **日志查询**：`seqbox` 查询 Seq 中的 sing-box 连接日志（数据由 `sing2seq` 投递，配置复用 `etc/seqcli/SeqCli.json`）。
  实现在 submodule `package/yyscripts/seqbox.py`（依赖 typer/requests/wcwidth，跑在该仓库的 venv 里），
  `bin/seqbox` 是指向 `wrapper.sh` 的软链；测试在 `package/yyscripts/tests/`，用 `venv/bin/python -m pytest` 运行。
  支持位置参数全文匹配，或 `--domain`/`--process`/`--ip`/`--outbound`/`--rule` 组合过滤（多条件为 AND）。
  结果按 `ConnectionId` 折叠为每连接一行，含进程、域名、命中规则、路由组、出站节点、耗时。
  DOMAIN 列是「入站目标 -> 出站目标」（相同时只显示一个）：fake-ip 场景是 `22.0.0.13 -> api.anthropic.com:443`，
  sniff-override 是 `IP -> 域名`，域名解析出站则相反；端口相同时只在末尾标一次。
  DNS 拦截连接（有 `inbound DNS packet` 或 dns 模块的 `exchange(d)` 事件）复用同样的列：
  DOMAIN 是「查询域名 -> 应答 IP」，GROUP 显示 `DNS <查询类型>`，NODE 是 dns 规则的动作
  （`dns-fakeip` / `predefined(NOERROR)`）。普通连接为出站做的 `lookup` 事件不算 DNS 请求。
  表格宽度自适应终端：从表头宽度起步，把余量**均分**给还没到自然宽度的列（`fit_widths`），
  够宽就不截断、不够就压缩且整表不换行；`--wide` 忽略终端宽度输出完整内容。
  另有 `--since`（时间窗，默认 1h）、`-n`（连接数上限）、`--wide`（不截断长内容）、`--json`、`--trace <id>`（打印单连接完整事件时间线）。
  实现要点：多条件是分别查询后对 ConnectionId 取**交集**——因为 `ProcessName` 只出现在 router 事件、`Tag` 只出现在 outbound 事件，
  单条 Seq filter 无法 AND；查询触顶时会向 stderr 输出结果可能不完整的警告。
