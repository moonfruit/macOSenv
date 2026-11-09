#!/usr/bin/env bash
source "$ENV/lib/bash/color.sh"
source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/native.sh"

# 退出码：0 = 配置已更新，2 = 无变化，1 = 失败并保留旧配置。
DIR=$(main-script-directory)
CACHE_DIR="$DIR/cache"
CACHE="$CACHE_DIR/ashnet-loon.lpx"
ETAG="$CACHE.etag"
UNCHANGED=2

h1 "Updating ash.json"

create-temp-directory TEMP_DIR
# shellcheck disable=SC2154
PLUGIN="$TEMP_DIR/ashnet-loon.lpx"

h2 "Fetching Ash DNS plugin"
COND=()
if [[ -s "$CACHE" && -s "$ETAG" ]]; then
    COND=(--etag-compare "$ETAG")
fi
if ! CODE=$(proxy curl --fail --silent --show-error --location --connect-timeout 15 --max-time 60 \
    "${COND[@]}" --etag-save "$TEMP_DIR/etag" --write-out '%{http_code}' \
    https://client.ash.do/downloads/ashnet-loon.lpx -o "$PLUGIN"); then
    warn "Failed to download Ash plugin - keeping existing ash.json"
    exit 1
fi

case "$CODE" in
    304)
        [[ -s "$CACHE" ]] || { warn "Ash returned 304 without cached plugin"; exit 1; }
        h2 "Ash DNS plugin unchanged - using cache"
        cp "$CACHE" "$PLUGIN" || exit 1
        ;;
    200) ;;
    *) warn "Unexpected Ash HTTP $CODE - keeping existing ash.json"; exit 1 ;;
esac

# Python 只修改临时副本，正式配置统一经 copy-if-diff 展示差异并安装。
cp "$DIR/config/ash.json" "$TEMP_DIR/ash.json" || exit 1
if /opt/homebrew/bin/python3 "$DIR/ash.py" "$PLUGIN" "$TEMP_DIR/ash.json"; then
    :
else
    STATUS=$?
    [[ $STATUS -eq $UNCHANGED ]] || exit 1
fi

CHANGED=
mark-changed() {
    CHANGED=1
}

if ! copy-if-diff "$TEMP_DIR/ash.json" "$DIR/config" mark-changed; then
    warn "Failed to install ash.json"
    exit 1
fi

# 配置成功处理后才记录响应，解析失败时下次仍会重新下载。
save-cache() {
    mkdir -p "$CACHE_DIR" || return 1
    cp "$PLUGIN" "$CACHE" || return 1
    if [[ -s "$TEMP_DIR/etag" ]]; then
        cp "$TEMP_DIR/etag" "$ETAG" || return 1
    else
        rm -f "$ETAG" || return 1
    fi
}
if [[ $CODE == 200 ]] && ! save-cache; then
    # 配置已经安装成功，缓存写入失败不能丢掉重启标记。
    rm -f "$ETAG"
    warn "Failed to cache Ash plugin - next update will download again"
fi

[[ -n $CHANGED ]] || exit "$UNCHANGED"
