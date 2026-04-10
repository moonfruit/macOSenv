# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 概述

这是一个 macOS 个人环境配置仓库（dotfiles），管理 shell 配置、开发工具、代理设置、Homebrew 包列表等。仓库通过 `$ENV` 环境变量引用，值为 `~/Workspace.localized/env`。

## 仓库结构

- **`bin/`** — 自定义可执行脚本和工具的包装器。许多是符号链接，指向 `package/yyscripts/wrapper.sh` 或 `bin/zoo/` 中的入口点。`bin/zoo/` 下的 `javan` 是多版本 Java/Maven 命令的统一入口（`java8`, `mvn21` 等通过符号链接名称区分版本）。`bin/claude` 及其符号链接变体（`claude-glm`, `claude-mini` 等）根据名称加载对应的 `etc/secret/*.env` 环境变量。
- **`etc/`** — 各类应用配置：`zsh/`（oh-my-zsh 自定义配置）、`git/`（gitconfig）、`sing-box/`（代理配置，使用分片 JSON）、`ssh/`、`hammerspoon/`、`claude/`、`Brewfile` 等。
- **`etc/zsh/`** — oh-my-zsh 的 `$ZSH_CUSTOM` 目录。`env.zsh` 设置环境变量，`alias.zsh` 定义别名，`tools.zsh` 配置开发工具，`proxy.zsh` 管理代理。
- **`etc/secret/`** — 通过 `git-secret` 加密的敏感文件（API key 等），`.env` 文件被 `bin/claude` 等脚本按需加载。
- **`lib/bash/`** — 可复用的 bash 函数库（`color.sh`, `console.sh`, `java.sh`, `native.sh` 等），通过 `source` 引入。
- **`package/`** — Git submodule：oh-my-zsh、powerlevel10k、fast-syntax-highlighting、zsh-autosuggestions、zsh-history-substring-search、yyscripts、archey-osx、custom-alfred-iterm-scripts。
- **`preferences/`** — 应用偏好设置备份（Alfred、Chrome、iTerm、mpv 等）。

## 常用命令

```bash
# 更新所有 submodule 和子目录中的 update.sh，以及 homebrew
./update.sh

# 仅更新 submodule，不更新 homebrew
./update.sh --no-brew

# 更新并执行 git gc
./update.sh --gc

# 解密 git-secret 文件
git secret reveal

# 加密 git-secret 文件
git secret hide
```

## 关键约定

- **Git 配置**：commit 签名默认开启（`gpgsign = true`），pager 使用 `delta`（side-by-side 模式）。
- **代理**：GitHub/GitLab/Bitbucket 的 HTTP 代理设置为 `http://127.0.0.1:7890`，SSH URL 统一重写为 HTTPS。
- **sing-box 配置**：`etc/sing-box/config/` 下为分片 JSON 文件，由 `sing.sh` 组装。修改配置后使用 `reload.sh` 重载。
- **Homebrew**：`etc/Brewfile` 记录所有已安装的包。`brew-up.sh` 和 `brew-livecheck.sh` 是自定义更新脚本。
- **Zsh 入口**：`etc/zshrc` 是 `.zshrc` 的实际内容，设置 `$ZSH_CUSTOM` 指向 `etc/zsh/`，主题根据终端选择 powerlevel10k 或 robbyrussell。
