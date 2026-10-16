#!/usr/bin/env bash
set -o pipefail

# shellcheck source=lib/bash/color.sh
source "$ENV/lib/bash/color.sh"
# shellcheck source=lib/bash/fs.sh
source "$ENV/lib/bash/fs.sh"

# 懒猫浏览器扩展分发站（Caddy file_server，内网直连，不走 proxy）
BASE_URL=https://extensions-ai.dkmooncat.heiyu.space

APPS=(
    cloud.lazycat.app.ai
    cloud.lazycat.app.browser.audio
    cloud.lazycat.app.browser.summarize
    cloud.lazycat.app.browser.translation
    cloud.lazycat.app.downloader
)

SCRIPT_DIR="$(current-script-directory)"
ETAGS_FILE="$SCRIPT_DIR/.etags"

# 服务器不可达时整体跳过（exit 0），让根 update.sh 继续处理其它目录
if ! curl -fsSI --connect-timeout 5 -o /dev/null "$BASE_URL/${APPS[0]}.zip"; then
    warn "$BASE_URL unreachable, skipping"
    exit 0
fi

create-temp-directory TMP_DIR

# etag 原样含引号存储，如 cloud.lazycat.app.ai="dm5w6jx1oaxz3kj0i"
read_etag() {
    [[ -f $ETAGS_FILE ]] && sed -n "s/^$1=//p" "$ETAGS_FILE" | tail -n 1
}

save_etag() {
    local tmp
    tmp=$(mktemp "$SCRIPT_DIR/.etags.XXXXXX") || return
    { grep -v "^$1=" "$ETAGS_FILE" 2>/dev/null; printf '%s=%s\n' "$1" "$2"; } >"$tmp" &&
        mv -f "$tmp" "$ETAGS_FILE"
}

update_app() {
    local name=$1
    local old_etag etag code
    local -a cond=()

    # 有记录时带上 If-None-Match，一个请求同时完成「检查是否有更新」和「下载」
    old_etag=$(read_etag "$name")
    [[ -n $old_etag ]] && cond=(-H "If-None-Match: $old_etag")
    if ! code=$(curl -sS "${cond[@]}" -o "$TMP_DIR/$name.zip" \
            -D "$TMP_DIR/$name.headers" -w '%{http_code}' \
            --connect-timeout 5 --max-time 300 "$BASE_URL/$name.zip"); then
        warn "$name download failed"
        return 1
    fi

    if [[ $code == 304 ]]; then
        echo "  $name up to date"
        return 0
    fi

    if [[ $code != 200 ]]; then
        warn "$name unexpected HTTP $code"
        return 1
    fi

    # 解压到临时目录内的 staging，校验通过再原子替换，失败不动现有目录
    if ! extract "$TMP_DIR/$name.zip" "$TMP_DIR/$name" >/dev/null; then
        warn "$name extract failed"
        return 1
    fi
    if [[ ! -f "$TMP_DIR/$name/manifest.json" ]]; then
        warn "$name missing manifest.json after extract"
        return 1
    fi

    if ! rm -rf "${SCRIPT_DIR:?}/${name:?}"; then
        warn "$name remove old failed"
        return 1
    fi
    if ! mv "$TMP_DIR/$name" "$SCRIPT_DIR/$name"; then
        warn "$name install failed"
        return 1
    fi

    # etag 拿不到就不记录，下次自动退化为无条件下载
    etag=$(sed -n 's/^[Ee][Tt][Aa][Gg]: *//p' "$TMP_DIR/$name.headers" | tail -n 1 | tr -d '\r')
    [[ -n $etag ]] && save_etag "$name" "$etag"
    echo "  $name updated"
}

h1 "Updating lazycat browser extensions"

FAIL=0
for app in "${APPS[@]}"; do
    update_app "$app" || FAIL=1
done
exit "$FAIL"
