#!/usr/bin/env bash
source "$ENV/lib/bash/color.sh"
source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/native.sh"

DIR=$(main-script-directory)
NAME=gingkoo.json
SECRET="$DIR/secrets/$NAME"
CONFIG="$DIR/config"
CACHE_DIR="$DIR/cache"
CACHE="$CACHE_DIR/gingkoo-otp.json"
# 剩余有效期低于该阈值就找机器人要新口令
MIN_TTL=$((24 * 3600))
# 退出码：0 = config/gingkoo.json 已更新，1 = 失败，UNCHANGED = 没有变化
# 重启由 update.sh 按这个退出码统一决定
UNCHANGED=2

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

if [[ ! -r "$SECRET" ]]; then
    warn "$SECRET not found - skipping $NAME"
    exit "$UNCHANGED"
fi

iso-to-epoch() {
    # BSD date 的 %z 认 +0800 不认 +08:00，先把时区里的冒号去掉
    date -j -f '%Y-%m-%dT%H:%M:%S%z' \
        "$(sed -E 's/([+-][0-9]{2}):([0-9]{2})$/\1\2/' <<<"$1")" +%s
}

# 一、口令：缓存里剩余有效期还够就直接用，否则找机器人要新的
#     --refresh 会短暂前台化企业微信，能不打扰就不打扰
REFRESH=1
if [[ -z $FORCE ]] && [[ -s "$CACHE" ]]; then
    EXPIRES_AT=$(jq -r '.expiresAt // empty' "$CACHE")
    if [[ -n $EXPIRES_AT ]] && EXPIRES=$(iso-to-epoch "$EXPIRES_AT" 2>/dev/null); then
        TTL=$((EXPIRES - $(date +%s)))
        if ((TTL >= MIN_TTL)); then
            h2 "Skipping refresh - cached password valid for $((TTL / 3600))h (use -f to force)"
            REFRESH=
        fi
    fi
fi

if [[ -n $REFRESH ]]; then
    h2 "Refreshing VPN password"
    create-temp-file OTP
    # shellcheck disable=SC2154
    if wecom-vpn-otp --json --refresh --verbose >"$OTP" && jq -e '.password | strings | length > 0' "$OTP" >/dev/null; then
        mkdir -p "$CACHE_DIR"
        cp "$OTP" "$CACHE" && chmod 600 "$CACHE"
    elif [[ -s "$CACHE" ]]; then
        warn "Failed to refresh VPN password - using cached copy"
    else
        echo "Failed to refresh VPN password and no cached copy exists" >&2
        exit 1
    fi
fi

PASSWORD=$(jq -r '.password // empty' "$CACHE")
if [[ -z $PASSWORD ]]; then
    echo "No VPN password in $CACHE" >&2
    exit 1
fi

# 二、把口令填进解密出来的模板
h2 "Generating $NAME"

create-temp-directory TEMP_DIR
# shellcheck disable=SC2154
sops decrypt "$SECRET" >"$TEMP_DIR/template.json" || exit 1
jq --arg password "$PASSWORD" \
    '.endpoints |= map(if .type == "openvpn-client" then .password = $password else . end)' \
    "$TEMP_DIR/template.json" >"$TEMP_DIR/$NAME" || exit 1

CHANGED=

mark-changed() {
    CHANGED=1
}

# 回调只在内容确实变了、且 cp 成功之后才会被调用，正好用来区分「更新了」和「没变」
if ! copy-if-diff "$TEMP_DIR/$NAME" "$CONFIG" mark-changed; then
    echo "Failed to install $NAME" >&2
    exit 1
fi

[[ -n $CHANGED ]] || exit "$UNCHANGED"
