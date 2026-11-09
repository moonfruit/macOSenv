#!/usr/bin/env bash
source "$ENV/lib/bash/color.sh"
source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/native.sh"

DIR=$(main-script-directory)
CACHE_DIR="$DIR/cache"
CACHE="$CACHE_DIR/zashboard-iplabels.json"
UI="$DIR/ui"
NAME=zashboard-settings.json
SETTINGS="$UI/$NAME"
KEY=config/source-ip-label-list
RETENTION=$((7 * 24 * 60 * 60))

FORCE=

OPTS=$(getopt -n "$0" -o f -l force -- "$@") || exit 1
eval set -- "$OPTS"
while true; do
    case "$1" in
    -f | --force)
        FORCE=1
        shift
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "Internal error!" >&2
        exit 1
        ;;
    esac
done

h1 "Updating $NAME"

create-temp-directory TEMP_DIR

# 一、刷新缓存：只有抓取成功且内容确实变了才改写 cache
if [[ -z $FORCE ]] && [[ -s "$CACHE" ]] && (($(stat -f %m "$CACHE") >= $(date -v-1d +%s))); then
    h2 "Skipping fetch - cache updated within 1 day (use -f to force)"
else
    h2 "Fetching IP labels from router"
    mkdir -p "$CACHE_DIR"
    # 只采集当前记录；不要使用采集器无限期补全旧 IPv4 的 --previous。
    # shellcheck disable=SC2154
    if zashboard-iplabels.py >"$TEMP_DIR/current.json"; then
        PREVIOUS="$CACHE"
        if [[ ! -s "$PREVIOUS" ]]; then
            PREVIOUS="$TEMP_DIR/previous.json"
            echo '[]' >"$PREVIOUS"
        fi
        # 按 IP 合并：重新注册立即替换旧映射；首次缺失时开始计时，后续不续期。
        jq --argjson now "$(date +%s)" --argjson retention "$RETENTION" \
            --slurpfile previous "$PREVIOUS" '
            (map(.key) | INDEX(.)) as $keys
            | (map(del(.invalid_since)) + [
                $previous[0][]
                | select($keys[.key] == null)
                | .invalid_since //= $now
                | select(.invalid_since + $retention > $now)
              ]) | sort_by(.label, .key)
            ' "$TEMP_DIR/current.json" >"$TEMP_DIR/labels.json" || exit 1
        # 先占位成空文件，让首次运行时的 diff 有个对比对象，不然 delta 会报访问不到
        [[ -e "$CACHE" ]] || : >"$CACHE"
        copy-if-diff "$TEMP_DIR/labels.json" "$CACHE" || true
        # 内容没变也刷新 mtime，否则每次跑都要重新连路由器
        touch "$CACHE"
    else
        warn "Failed to fetch IP labels - falling back to cache"
    fi
fi

if [[ ! -s "$CACHE" ]]; then
    warn "No cached IP labels - skipping $NAME"
    exit 0
fi

# 即使跳过抓取或抓取失败，已到保留期限的记录也应移除。
# copy-if-diff 在内容相同时不改 mtime，保留原来的抓取节奏。
jq --argjson now "$(date +%s)" --argjson retention "$RETENTION" '
    map(select(.invalid_since == null or .invalid_since + $retention > $now))
    ' "$CACHE" >"$TEMP_DIR/retained.json" || exit 1
if ! cmp -s "$TEMP_DIR/retained.json" "$CACHE"; then
    # 清理保留期不能冒充一次成功抓取。
    touch -r "$CACHE" "$TEMP_DIR/retained.json" || exit 1
    cp -p "$TEMP_DIR/retained.json" "$CACHE" || exit 1
fi

# 二、无条件从缓存重新生成：ui 目录由 sing-box 定期重新下载，里面的文件会被清掉，
#     所以上一步没有变更并不代表 ui 里的文件还在
if [[ ! -d "$UI" ]]; then
    # 不能代为 mkdir：目录存在会让 sing-box 跳过 dashboard 下载
    warn "$UI not found - skipping $NAME"
    exit 0
fi

h2 "Generating $NAME from cache"

# shellcheck disable=SC2154
jq -n --arg key "$KEY" --slurpfile labels "$CACHE" \
    '{($key): ($labels[0] | map(del(.invalid_since)) | tojson)}' >"$TEMP_DIR/$NAME" || exit 1

if [[ ! -e "$SETTINGS" ]]; then
    sudo touch "$SETTINGS"
fi
if [[ ! -w "$SETTINGS" ]]; then
    sudo chown "$(whoami)" "$SETTINGS"
    sudo chmod u+w "$SETTINGS"
fi

copy-if-diff "$TEMP_DIR/$NAME" "$UI" || true
