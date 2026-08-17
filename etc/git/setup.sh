#!/usr/bin/env bash
set -euo pipefail

# shellcheck source=lib/bash/color.sh
source "$ENV/lib/bash/color.sh"

h1 Installing git filters and hooks

# strip-automode filter 与 pre-commit hook 都依赖 jq，缺了会静默放行敏感内容。
if ! hash jq 2>/dev/null; then
    warn "jq not found — strip-automode filter and pre-commit hook both need it"
    echo "    brew install jq"
    exit 1
fi

# etc/claude/settings.json 软链为 ~/.claude/settings.json。Claude Code 的 auto mode
# 会往里写 .autoMode，内含探测到的内网服务名、secrets 文件路径等；本仓库公开，故
# 提交时剥离该字段，工作区保留以免影响本地 auto mode 的判断质量。
git -C "$ENV" config filter.strip-automode.clean 'jq --indent 2 "del(.autoMode)"'
echo "filter.strip-automode.clean configured"

# filter 配置只存在 .git/config，不随 clone 走，用 pre-commit 兜底。
ln -sf "$ENV/etc/git/hooks/pre-commit" "$ENV/.git/hooks/pre-commit"
echo "pre-commit hook linked"
echo
