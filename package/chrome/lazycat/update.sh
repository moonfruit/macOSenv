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

# Chrome 重载方式：
#   open     打开 chrome://extensions，由人工点「重新加载」（默认）
#   prompt   只在输出里提示，不动浏览器
RELOAD_MODE=open

usage() {
    cat <<'EOF'
Usage: update.sh [--reload=open|prompt]

  --reload=open     open chrome://extensions, click "Reload" on each extension (default)
  --reload=prompt   only print a hint, leave the browser alone

Note: Chrome loads this directory as unpacked extensions and never reloads them
on its own. The new files only take effect after the extensions are reloaded
(or Chrome is restarted).
EOF
}

while [[ $# -gt 0 ]]; do
    case $1 in
    --reload=*)
        RELOAD_MODE=${1#*=}
        case $RELOAD_MODE in
        prompt | open) ;;
        *)
            warn "unknown --reload value: ${RELOAD_MODE}"
            usage
            exit 2
            ;;
        esac
        shift
        ;;
    -h | --help)
        usage
        exit 0
        ;;
    *)
        warn "unknown argument: $1"
        usage
        exit 2
        ;;
    esac
done

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

# 读 manifest 里的 version；目录/文件不存在或解析失败时返回 none
manifest_version() {
    local manifest=$1
    [[ -f $manifest ]] || {
        echo none
        return
    }
    jq -r '.version // "none"' "$manifest" 2>/dev/null || echo none
}

# 有版本变化的扩展：名字 + 旧版本 + 新版本
declare -a CHANGES=()

update_app() {
    local name=$1
    local old_etag etag code old_version new_version
    local -a cond=()

    local target="$SCRIPT_DIR/$name"
    old_version=$(manifest_version "$target/manifest.json")

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
        echo "  ${name}  v${old_version} up to date"
        return 0
    fi

    if [[ $code != 200 ]]; then
        warn "$name unexpected HTTP $code"
        return 1
    fi

    # 解压到临时目录内的 staging，校验通过再替换，失败不动现有目录
    if ! extract "$TMP_DIR/$name.zip" "$TMP_DIR/$name" >/dev/null; then
        warn "$name extract failed"
        return 1
    fi
    if [[ ! -f "$TMP_DIR/$name/manifest.json" ]]; then
        warn "$name missing manifest.json after extract"
        return 1
    fi

    new_version=$(manifest_version "$TMP_DIR/$name/manifest.json")

    # 比一遍文件内容看是否真的有差异：etag 变了不代表内容变了（镜像可能只是重传同一份 zip），
    # 版本号没变也不代表内容没变。diff 比 rsync 干跑可靠，rsync 默认按时间戳判定，
    # 解压出来的目录 mtime 每次都不同，会误报成有变化
    local changed_files
    changed_files=$(diff -rq "$TMP_DIR/$name" "$target" 2>/dev/null)

    # 原地同步而不是删目录再 mv：Chrome 按路径加载这些扩展，
    # 目录瞬间消失可能让 Chrome 把扩展判为「已损坏」而禁用。
    # manifest.json 最后写，保证 Chrome 读到的 manifest 与文件内容一致。
    if ! mkdir -p "$target" ||
        ! rsync -a --delete --exclude 'manifest.json' "$TMP_DIR/$name/" "$target/"; then
        warn "$name sync failed"
        return 1
    fi
    if ! cp -f "$TMP_DIR/$name/manifest.json" "$target/manifest.json"; then
        warn "$name install manifest failed"
        return 1
    fi

    # etag 拿不到就不记录，下次自动退化为无条件下载
    etag=$(sed -n 's/^[Ee][Tt][Aa][Gg]: *//p' "$TMP_DIR/$name.headers" | tail -n 1 | tr -d '\r')
    [[ -n $etag ]] && save_etag "$name" "$etag"

    if [[ $old_version != "$new_version" ]]; then
        echo "  ${name}  v${old_version} → v${new_version}"
        CHANGES+=("${name} v${old_version} → v${new_version}")
    elif [[ -n $changed_files ]]; then
        echo "  ${name}  v${new_version} (files changed, version unchanged)"
        CHANGES+=("${name} v${new_version} (files changed, version unchanged)")
    else
        echo "  ${name}  v${new_version} (no changes)"
    fi
}

# Chrome 重载：解压扩展不会自动更新，必须显式重载
chrome_reload() {
    case $RELOAD_MODE in
    open)
        if open -a "Google Chrome" "chrome://extensions"; then
            echo "  opened chrome://extensions, click \"Reload\" on each extension to apply"
        else
            warn "failed to open chrome://extensions, reload the extensions manually"
        fi
        ;;
    *)
        echo "  reload the extensions in chrome://extensions for the new version to apply"
        ;;
    esac
}

h1 "Updating lazycat browser extensions"

FAIL=0
for app in "${APPS[@]}"; do
    update_app "$app" || FAIL=1
done

if ((${#CHANGES[@]} > 0)); then
    echo
    h2 "Updated ${#CHANGES[@]} extension(s)"
    for change in "${CHANGES[@]}"; do
        echo "  ${change}"
    done
    echo
    chrome_reload
    if [[ $RELOAD_MODE == prompt ]]; then
        "$ENV/bin/notify.sh" "LazyCat extensions updated" \
            "$(printf '%s; ' "${CHANGES[@]}")reload the extensions in chrome://extensions" >/dev/null 2>&1 || true
    fi
fi

echo
exit "$FAIL"
