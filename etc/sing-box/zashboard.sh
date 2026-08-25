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
    # shellcheck disable=SC2154
    if zashboard-iplabels.py >"$TEMP_DIR/labels.json"; then
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

# 二、无条件从缓存重新生成：ui 目录由 sing-box 定期重新下载，里面的文件会被清掉，
#     所以上一步没有变更并不代表 ui 里的文件还在
if [[ ! -d "$UI" ]]; then
    # 不能代为 mkdir：目录存在会让 sing-box 跳过 dashboard 下载
    warn "$UI not found - skipping $NAME"
    exit 0
fi

h2 "Generating $NAME from cache"

# shellcheck disable=SC2154
jq -n --arg key "$KEY" --rawfile labels "$CACHE" '{($key): ($labels | fromjson | tojson)}' >"$TEMP_DIR/$NAME" || exit 1

if [[ ! -e "$SETTINGS" ]]; then
    sudo touch "$SETTINGS"
fi
if [[ ! -w "$SETTINGS" ]]; then
    sudo chown "$(whoami)" "$SETTINGS"
    sudo chmod u+w "$SETTINGS"
fi

copy-if-diff "$TEMP_DIR/$NAME" "$UI" || true
