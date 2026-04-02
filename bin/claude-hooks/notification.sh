#!/usr/bin/env bash
set -euo pipefail

case "${TERM_PROGRAM:-}" in
iTerm.app)
    if command -v it2attention &>/dev/null; then
        it2attention start
    fi
    sender="sent"
    ;;
ghostty)
    sender="sent"
    ;;
vscode)
    sender="com.microsoft.VSCode"
    ;;
*)
    case "${TERMINAL_EMULATOR:-}" in
    JetBrains-JediTerm)
        sender="${__CFBundleIdentifier:-}"
        ;;
    *)
        sender=""
        ;;
    esac
    ;;
esac

if [[ $sender != sent ]]; then
    read -r input
    exec timeout 1s terminal-notifier \
        -title "$(echo "$input" | jq -r .title)" \
        -message "$(echo "$input" | jq -r .message)" \
        -sound Glass \
        ${sender:+-sender "$sender"}
fi
