#!/opt/homebrew/bin/bash

# sing-box
#SING_BOX="/opt/homebrew/opt/sing-box@2/bin/sing-box"
SING_BOX="/opt/homebrew/opt/sing-box-ref1nd/bin/sing-box"

# 健康检查配置
HEALTH_CHECK_URL="http://127.0.0.1:9999/version"
# 检查间隔（秒）
CHECK_INTERVAL=1

log() {
    if [[ "$1" = "INFO" || "$1" = "WARN" || "$1" = "ERROR" ]]; then
        local level=$1
        shift
    else
        local level="INFO"
    fi
    echo "$(date "+%z %Y-%m-%d %H:%M:%S") $level wrapper:" "$@"
}

# DNS 刷新函数
flush_dns() {
    log "Flushing DNS cache"
    dscacheutil -flushcache 2>/dev/null || log WARN "Failed to flush DNS cache"
    killall -HUP mDNSResponder 2>/dev/null || log WARN "Failed to restart mDNSResponder"
}

# 健康检查函数
wait_for_health_check() {
    log "Waiting for service to be ready at $HEALTH_CHECK_URL"

    while true; do
        # 检查子进程是否还在运行
        if ! kill -0 "$SING_PID" 2>/dev/null; then
            log WARN "Program exited before health check passed"
            return 1
        fi

        # 进行健康检查
        if OUTPUT=$(curl -fs "$HEALTH_CHECK_URL" 2>/dev/null); then
            VERSION=$(echo "$OUTPUT" | jq -r ".version" 2>/dev/null)
            log "Service is ready: $VERSION"
            return 0
        fi

        sleep $CHECK_INTERVAL
    done
}

# 信号处理函数
# shellcheck disable=SC2329
forward_signal() {
    local signal_name="${1:-UNKNOWN}"
    log "Received $signal_name signal, forwarding to program (PID: $SING_PID)"
    if [ ! -z "$SING_PID" ] && kill -0 "$SING_PID" 2>/dev/null; then
        kill "-$signal_name" "$SING_PID" 2>/dev/null
    fi
}

# 设置信号处理
trap 'forward_signal TERM' TERM EXIT
trap 'forward_signal HUP' HUP
trap 'forward_signal INT' INT
trap 'forward_signal QUIT' QUIT

log "Starting program: $SING_BOX $*"

# 在后台启动程序
"$SING_BOX" "$@" &
SING_PID=$!

log "Program started with PID: $SING_PID"

# 等待健康检查通过后刷新 DNS
if wait_for_health_check; then
    log "Health check passed, flushing DNS cache"
    flush_dns
    log "Waiting for program to exit..."
fi

# 等待程序退出
wait "$SING_PID"
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    log "Program exited normally with code: $EXIT_CODE"
else
    log WARN "Program exited with error code: $EXIT_CODE"
fi

# 程序退出后刷新 DNS
log "Program exited, flushing DNS cache"
flush_dns

exit $EXIT_CODE
