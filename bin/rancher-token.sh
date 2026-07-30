#!/opt/homebrew/bin/bash
#
# rancher-token.sh — 刷新 ~/.kube/config 中 k8s-autotest 的 user token。
#
# Rancher 的 API token 最长只能签 90 天，过期后 kubectl 就全线 401。
# 本脚本用 openldap 域账号登录 Rancher，新建一个 token 写回 kubeconfig。
#
# 现有 token 剩余有效期还够（默认 > 7 天）时直接退出，可以放心地反复跑；
# 用 --force 强制刷新。
#
# 凭据取自 $ENV/etc/secrets/rancher.env（sops 加密，含 RANCHER_USER / RANCHER_PASSWORD），
# 只在真的要刷新时才解密。
#
# 依赖 bash 5、curl、jq、yq、kubectl、$ENV/bin/sops-env、$ENV/lib/bash/color.sh。

set -Eeuo pipefail
# shellcheck source=lib/bash/color.sh
source "$ENV/lib/bash/color.sh"

readonly PROGRAM=${0##*/}
readonly RANCHER=https://10.0.6.171
readonly CLUSTER_ID=c-ddd59
readonly KUBE_USER=k8s-autotest
readonly KUBECONFIG_FILE=${KUBECONFIG:-$HOME/.kube/config}
readonly BACKUP_FILE=$KUBECONFIG_FILE.bak
readonly SECRET=rancher

# 新建 token 的描述。清理旧 token 时按它精确匹配，
# 所以只会删掉本脚本自己建的，UI session、jenkins 之类一律不碰。
readonly DESCRIPTION="rancher-token.sh: $KUBE_USER kubeconfig"

# 剩余有效期低于这么多天才刷新。
readonly RENEW_DAYS=${RENEW_DAYS:-7}

# 取不到 auth-token-max-ttl-minutes 时的回退值（90 天）。
readonly FALLBACK_TTL_MINUTES=129600

FORCE=0
DRY_RUN=0

# curl 用的 CA 证书与临时文件，退出时清理。
CA_FILE=
TMP_FILES=()

usage() {
    cat <<EOF
用法：${PROGRAM} [选项]

选项：
  -f, --force     不检查剩余有效期，直接刷新
  -n, --dry-run   只检查并打印将要做的事，不登录、不改文件
  -h, --help      显示此帮助

集群：${KUBE_USER}（${RANCHER}，${CLUSTER_ID}）
配置：${KUBECONFIG_FILE}
凭据：\$ENV/etc/secrets/${SECRET}.env
环境变量 RENEW_DAYS 覆盖刷新阈值（当前：${RENEW_DAYS} 天）。
EOF
}

die() {
    warn "$*" >&2
    exit 1
}

cleanup() {
    logout
    local file
    for file in "${TMP_FILES[@]}"; do
        [[ -n $file ]] && rm -f "$file"
    done
}
trap cleanup EXIT

mktemp-tracked() {
    local file
    file=$(mktemp "${TMPDIR:-/tmp}/$PROGRAM.XXXXXX")
    TMP_FILES+=("$file")
    echo "$file"
}

# 打印 token 时只留可公开的名字部分，密文用 * 代替。
mask-token() {
    echo "${1%%:*}:****"
}

require-commands() {
    local cmd missing=()
    for cmd in "$@"; do
        hash "$cmd" 2>/dev/null || missing+=("$cmd")
    done
    ((${#missing[@]} == 0)) || die "缺少命令：${missing[*]}，请先安装"
}

# 调用 Rancher API。
#
# 用法：api <方法> <路径> [请求体] —— 结果放进 HTTP_CODE / API_BODY。
# 认证 token 取自全局 $AUTH_TOKEN，为空则不带 Authorization 头（登录接口用）。
api() {
    local method=$1 path=$2 data=${3:-} response
    local args=(-sS --noproxy '*' --cacert "$CA_FILE" -X "$method" -w $'\n%{http_code}')

    [[ -n ${AUTH_TOKEN:-} ]] && args+=(-H "Authorization: Bearer $AUTH_TOKEN")
    [[ -n $data ]] && args+=(-H 'Content-Type: application/json' -d "$data")

    response=$(curl "${args[@]}" "$RANCHER$path") || die "请求 $method $path 失败，检查是否连得上 $RANCHER"
    HTTP_CODE=${response##*$'\n'}
    API_BODY=${response%$'\n'*}
}

# 从 kubeconfig 里取出集群 CA，写成临时文件供 curl --cacert 用。
# Rancher 站点和 /k8s/clusters/ 代理是同一张证书，所以不需要 curl -k。
extract-ca() {
    local data
    data=$(yq -r ".clusters[] | select(.name == \"$KUBE_USER\") | .cluster.\"certificate-authority-data\"" "$KUBECONFIG_FILE")
    [[ -n $data && $data != null ]] || die "$KUBECONFIG_FILE 里没有集群 $KUBE_USER 的 certificate-authority-data"

    CA_FILE=$(mktemp-tracked)
    base64 -d <<<"$data" >"$CA_FILE" || die "集群 CA 证书解码失败"
}

# 查现有 token 还剩几天，结果放进 REMAINING_DAYS。
# token 已失效（401/404）或读不出剩余天数时置 -1，表示必须刷新。
check-remaining-days() {
    local token=$1

    AUTH_TOKEN=$token
    api GET "/v3/tokens/${token%%:*}"
    AUTH_TOKEN=

    if [[ $HTTP_CODE == 401 || $HTTP_CODE == 404 ]]; then
        REMAINING_DAYS=-1
        return
    fi
    [[ $HTTP_CODE == 200 ]] || die "查询 token 状态失败（HTTP ${HTTP_CODE}）：$API_BODY"

    # expiresAt 形如 2026-09-28T10:13:24Z；交给 jq 算，避开 BSD/GNU date 的差异。
    REMAINING_DAYS=$(jq -r '
        if .expired then -1
        elif (.expiresAt // "") == "" then 36500
        else ((.expiresAt | fromdateiso8601) - now) / 86400 | floor
        end' <<<"$API_BODY")
    [[ $REMAINING_DAYS =~ ^-?[0-9]+$ ]] || REMAINING_DAYS=-1
}

# 用域账号登录，拿一个临时 session token（16 小时），放进 SESSION_TOKEN。
login() {
    local body

    # 只在这里解密，检查阶段就退出的话根本不碰密码。
    local user password
    eval "$("$ENV/bin/sops-env" "$SECRET")"
    user=${RANCHER_USER:-}
    password=${RANCHER_PASSWORD:-}
    [[ -n $user && -n $password ]] ||
        die "$ENV/etc/secrets/$SECRET.env 里缺少 RANCHER_USER 或 RANCHER_PASSWORD，用 sops 编辑补上"

    body=$(jq -n --arg u "$user" --arg p "$password" '{username: $u, password: $p, responseType: "json"}')
    AUTH_TOKEN=
    api POST "/v3-public/openLdapProviders/openldap?action=login" "$body"

    case $HTTP_CODE in
    200 | 201) ;;
    401) die "登录被拒绝（HTTP 401），检查 $SECRET.env 里的账号密码是否还有效" ;;
    *) die "登录失败（HTTP ${HTTP_CODE}）：$API_BODY" ;;
    esac

    SESSION_TOKEN=$(jq -r '.token // empty' <<<"$API_BODY")
    [[ -n $SESSION_TOKEN ]] || die "登录响应里没有 token 字段"
}

# session token 用完就注销，否则每跑一次都会在 Rancher 里留一条 16 小时的记录。
#
# 必须走 ?action=logout：DELETE /v3/tokens/<name> 删自己会被拒，
# Rancher 回 400 "Cannot delete token for current session"。
#
# 挂在 EXIT trap 上，中途 die 也不会漏。这里不走 api()：
# api 失败会 die，在 trap 里再触发一次退出就套娃了。
logout() {
    [[ -n ${SESSION_TOKEN:-} ]] || return 0

    curl -sS --noproxy '*' --cacert "$CA_FILE" -X POST \
        -H "Authorization: Bearer $SESSION_TOKEN" \
        "$RANCHER/v3/tokens?action=logout" &>/dev/null || true
    SESSION_TOKEN=
}

# 取 Rancher 允许的最大 TTL，结果放进 TTL_MINUTES。
# 请求超过上限时 Rancher 会自己截断，所以直接照上限申请即可。
max-ttl-minutes() {
    local value

    AUTH_TOKEN=$SESSION_TOKEN
    api GET "/v3/settings/auth-token-max-ttl-minutes"
    if [[ $HTTP_CODE == 200 ]]; then
        value=$(jq -r '.value // .default // empty' <<<"$API_BODY")
        if [[ $value =~ ^[0-9]+$ && $value != 0 ]]; then
            TTL_MINUTES=$value
            return
        fi
    fi

    warn "读不到 auth-token-max-ttl-minutes，按 ${FALLBACK_TTL_MINUTES} 分钟申请"
    TTL_MINUTES=$FALLBACK_TTL_MINUTES
}

# 新建 API token，完整值放进 NEW_TOKEN（Rancher 只在创建时返回这一次）。
create-token() {
    local ttl_minutes=$1 body

    body=$(jq -n --arg d "$DESCRIPTION" --argjson ttl "$((ttl_minutes * 60000))" \
        '{type: "token", description: $d, ttl: $ttl}')

    AUTH_TOKEN=$SESSION_TOKEN
    api POST "/v3/tokens" "$body"
    [[ $HTTP_CODE == 200 || $HTTP_CODE == 201 ]] || die "创建 token 失败（HTTP ${HTTP_CODE}）：$API_BODY"

    NEW_TOKEN=$(jq -r '.token // empty' <<<"$API_BODY")
    [[ -n $NEW_TOKEN ]] || die "创建 token 的响应里没有 token 字段"

    # 刚创建时 expiresAt 可能还是空串（jq 的 // 只兜 null），那就按 ttl 自己算。
    NEW_EXPIRES=$(jq -r --argjson ttl "$((ttl_minutes * 60))" '
        if (.expiresAt // "") != "" then .expiresAt
        else (now + $ttl) | todateiso8601
        end' <<<"$API_BODY")
}

# 只改 kubeconfig 里 token 那一行，缩进和文件其余部分原样保留。
write-token() {
    local token=$1 line output

    line=$(yq ".users[] | select(.name == \"$KUBE_USER\") | .user.token | line" "$KUBECONFIG_FILE")
    [[ $line =~ ^[0-9]+$ && $line -gt 0 ]] || die "$KUBECONFIG_FILE 里定位不到用户 $KUBE_USER 的 token 行"

    cp -p "$KUBECONFIG_FILE" "$BACKUP_FILE"

    output=$(mktemp-tracked)
    awk -v n="$line" -v t="$token" '
        NR == n {
            match($0, /^[[:space:]]*/)
            printf "%stoken: %s\n", substr($0, 1, RLENGTH), t
            next
        }
        { print }
    ' "$KUBECONFIG_FILE" >"$output"

    cat "$output" >"$KUBECONFIG_FILE"
}

# 拿新 token 真连一次集群；连不上就把备份还回去。
verify-token() {
    if kubectl --kubeconfig "$KUBECONFIG_FILE" --context "$KUBE_USER" get namespace >/dev/null 2>&1; then
        return 0
    fi

    warn "新 token 无法访问集群，已回滚 $KUBECONFIG_FILE"
    cat "$BACKUP_FILE" >"$KUBECONFIG_FILE"
    return 1
}

# 删掉本脚本以前建的、已经过期的 token（描述精确匹配，别的一律不动）。
cleanup-expired-tokens() {
    local names name count=0

    api GET "/v3/tokens"
    [[ $HTTP_CODE == 200 ]] || {
        warn "读取 token 列表失败（HTTP ${HTTP_CODE}），跳过清理"
        return 0
    }

    names=$(jq -r --arg d "$DESCRIPTION" '.data[] | select(.description == $d and .expired == true) | .name' <<<"$API_BODY")
    [[ -n $names ]] || return 0

    while read -r name; do
        [[ -n $name ]] || continue
        api DELETE "/v3/tokens/$name"
        if [[ $HTTP_CODE == 200 || $HTTP_CODE == 204 ]]; then
            ((++count))
        else
            warn "删除过期 token $name 失败（HTTP ${HTTP_CODE}）"
        fi
    done <<<"$names"

    ((count == 0)) || h2 "已清理 $count 个过期的旧 token"
}

main() {
    while (($# > 0)); do
        case $1 in
        -f | --force) FORCE=1 ;;
        -n | --dry-run) DRY_RUN=1 ;;
        -h | --help)
            usage
            return 0
            ;;
        *)
            usage >&2
            die "无法识别的参数：$1"
            ;;
        esac
        shift
    done

    require-commands curl jq yq kubectl base64 awk
    [[ -n ${ENV:-} ]] || die "环境变量 ENV 未设置"
    [[ -f $KUBECONFIG_FILE ]] || die "找不到 $KUBECONFIG_FILE"
    [[ -f $ENV/etc/secrets/$SECRET.env ]] || die "找不到 $ENV/etc/secrets/$SECRET.env，请先用 sops 创建"

    # 内网直连，别走代理。
    unset http_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY

    extract-ca

    local current
    current=$(yq -r ".users[] | select(.name == \"$KUBE_USER\") | .user.token" "$KUBECONFIG_FILE")
    [[ -n $current && $current != null ]] || die "$KUBECONFIG_FILE 里没有用户 $KUBE_USER 的 token"

    h1 "检查 $KUBE_USER 的 token $(mask-token "$current")"
    check-remaining-days "$current"

    if ((REMAINING_DAYS < 0)); then
        h2 "当前 token 已失效"
    else
        h2 "当前 token 还有 $REMAINING_DAYS 天到期"
        if ((FORCE == 0 && REMAINING_DAYS > RENEW_DAYS)); then
            echo "剩余有效期超过 $RENEW_DAYS 天，无需刷新（要强制刷新用 --force）"
            return 0
        fi
    fi

    if ((DRY_RUN)); then
        warn "dry-run：将登录 Rancher 新建 token 并写入 $KUBECONFIG_FILE 第 $(
            yq ".users[] | select(.name == \"$KUBE_USER\") | .user.token | line" "$KUBECONFIG_FILE"
        ) 行"
        return 0
    fi

    h1 "登录 $RANCHER"
    login

    max-ttl-minutes

    h1 "创建新 token（有效期 $((TTL_MINUTES / 1440)) 天）"
    create-token "$TTL_MINUTES"
    h2 "新 token $(mask-token "$NEW_TOKEN")，到期时间 $NEW_EXPIRES"

    h1 "写入 $KUBECONFIG_FILE"
    write-token "$NEW_TOKEN"
    h2 "原文件已备份到 $BACKUP_FILE"

    verify-token || die "刷新失败"
    h2 "已用新 token 成功访问集群"

    AUTH_TOKEN=$NEW_TOKEN
    cleanup-expired-tokens

    h1 "完成"
}

main "$@"
