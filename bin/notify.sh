#!/usr/bin/env bash
set -euo pipefail

# notify.sh — 发送桌面/终端通知，自动适配当前终端。
#
# 用法：
#   notify.sh <title> <message> [sound]
#   notify.sh <message>                       # 仅正文，标题用默认值
#   echo '{"title":"…","message":"…"}' | notify.sh   # 兼容 hook 的 JSON 输入
#
# 支持的终端：
#   cmux      →  cmux notify（仅凭 __CFBundleIdentifier=com.cmuxterm.app 探测）
#   iTerm2    →  OSC 9 通知 + OSC 1337 图标持续弹跳（直到激活到前台）
#   ghostty   →  OSC 777 桌面通知
#   其它      →  terminal-notifier（借用 __CFBundleIdentifier 身份，含 VSCode/JetBrains）；缺失则回退 osascript

usage() {
    sed -n '4,15p' "$0" | sed 's/^# \{0,1\}//'
    exit "${1:-0}"
}

has() { command -v -- "$1" &>/dev/null; }

# 将 OSC 转义序列写到控制终端（tmux/screen 下自动透传）。
# $1 = OSC 主体（不含前导 ESC] 与结尾 BEL）。
emit_osc() {
    local seq
    seq=$'\e]'"$1"$'\a'
    if [[ -n ${TMUX:-} ]]; then
        # tmux DCS 透传：内部 ESC 需翻倍
        seq=${seq//$'\e'/$'\e\e'}
        seq=$'\ePtmux;'"$seq"$'\e\\'
    elif [[ ${TERM:-} == screen* ]]; then
        seq=$'\eP'"$seq"$'\e\\'
    fi
    printf '%s' "$seq" >/dev/tty 2>/dev/null || printf '%s' "$seq"
}

# ---- 解析输入 ----------------------------------------------------------------

title="Notification"
message=""
sound="Glass"

case "${1:-}" in
-h | --help) usage 0 ;;
esac

case $# in
0)
    # 无参数：尝试从 stdin 读取 JSON（兼容 hook 的 {title,message} 格式）
    if [[ ! -t 0 ]]; then
        input=$(cat)
        if [[ -n $input ]]; then
            title=$(jq -r '.title // "Notification"' <<<"$input")
            message=$(jq -r '.message // ""' <<<"$input")
            s=$(jq -r '.sound // ""' <<<"$input")
            [[ -n $s ]] && sound=$s
        fi
    fi
    ;;
1)
    message=$1
    ;;
*)
    title=$1
    message=$2
    sound=${3:-$sound}
    ;;
esac

[[ -z $message ]] && usage 1

# ---- 分发 --------------------------------------------------------------------

notified=0
sender=""

case "${TERM_PROGRAM:-}" in
iTerm.app)
    # OSC 9 只有单一文本域，无独立标题，故把标题拼进正文
    if [[ $title == "Notification" ]]; then
        text=$message
    else
        text="$title: $message"
    fi
    emit_osc "9;$text"                   # 通知中心弹窗
    emit_osc "1337;RequestAttention=yes" # Dock 图标持续弹跳，直到激活到前台
    notified=1
    ;;
ghostty)
    # cmux 中 TERM_PROGRAM 同样是 ghostty，靠 __CFBundleIdentifier 区分；失败则降级到 OSC 777
    if [[ ${__CFBundleIdentifier:-} == com.cmuxterm.app ]] && has cmux; then
        cmux notify --title "$title" --body "$message" &>/dev/null && notified=1 || true
    fi
    if [[ $notified -eq 0 ]]; then
        emit_osc "777;notify;$title;$message" # 桌面通知（title;body）
        notified=1
    fi
    ;;
*)
    # 其它终端（VSCode、JetBrains 等）：只要有 bundle id 就借用其身份
    sender="${__CFBundleIdentifier:-}"
    ;;
esac

# 未原生通知的终端：优先 terminal-notifier，缺失则回退到内联 osascript
if [[ $notified -eq 0 ]]; then
    if has terminal-notifier; then
        # 未指定 -execute/-open/-activate 时不接点击回调，发完即退，无需 timeout
        exec terminal-notifier \
            -title "$title" \
            -message "$message" \
            -sound "$sound" \
            ${sender:+-sender "$sender"}
    else
        # display notification 同样即发即返、自行退出
        exec osascript \
            -e 'on run argv' \
            -e 'display notification (item 2 of argv) with title (item 1 of argv) sound name (item 3 of argv)' \
            -e 'end run' \
            -- "$title" "$message" "$sound"
    fi
fi
