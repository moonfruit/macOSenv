#!/usr/bin/env bash
# shellcheck disable=SC2155
# 将代理出口 IP 加入 IBM Cloud VPC 安全组白名单（滚动维护至多 SLOTS 个）。
#
#   - 出口 IP 探测逻辑提取自 bin/test-proxy（fetch-info：经 proxy 访问 ipinfo.io 取 .ip）
#   - 规则名为 proxy-moon-00 .. proxy-moon-09，序号即年龄（00 最旧，序号越大越新）
#   - 每次探测一个出口 IP：
#       · 已在任意槽位        → 不变更
#       · 不在且尚有空槽      → 填入最小空槽
#       · 不在且 10 槽已满    → FIFO，挤掉最旧（00），其余前移，新 IP 落在末槽
#   - 规则形态参考 proxy-gingkoo：inbound / icmp_tcp_udp / 全端口 / --remote <ip>
#   - 兼容迁移：遗留的无后缀 proxy-moon 规则会被改名到最小空槽
#
# 用法：
#   sg-proxy-moon [PROXY_LABEL]      # PROXY_LABEL 默认 global，即 test-proxy global
#
# 可用环境变量覆盖：SG（安全组名/ID）、RULE_PREFIX（规则名前缀）、SLOTS（槽位数）、REGION。
set -euo pipefail

if [[ -z "${PROXY_ENABLED:-}" ]] && hash proxy >/dev/null 2>&1; then
    exec proxy "$0" "$@"
fi

readonly SG="${SG:-assure-playmaker-unlivable-drapery}"
readonly RULE_PREFIX="${RULE_PREFIX:-proxy-moon}"
readonly SLOTS="${SLOTS:-10}"
readonly REGION="${REGION:-jp-tok}"
readonly PROXY_LABEL="${1:-global}"
readonly INFO_URL="https://ipinfo.io"

if [[ -t 1 ]]; then
    readonly R=$(tput setaf 1) G=$(tput setaf 2) Y=$(tput setaf 3) B=$(tput setaf 4) N=$(tput sgr0)
else
    readonly R='' G='' Y='' B='' N=''
fi
info() { echo "${B}==>${N} $*"; }
ok() { echo "${G}✓${N} $*"; }
die() {
    echo "${R}✗${N} $*" >&2
    exit 1
}

# 槽位名：00 .. (SLOTS-1)，两位补零
slot_name() { printf '%s-%02d' "$RULE_PREFIX" "$1"; }

# 0. 确保已登录：以 target -r <REGION> 探测登录状态（顺带切到目标区域）；
#    未登录则用 IBMCLOUD_API_KEY 自动登录（-r <REGION> -g Default），无该环境变量则报错退出
ensure_login() {
    local region=$1
    ibmcloud target -r "$region" >/dev/null 2>&1 && return 0
    [[ -n "${IBMCLOUD_API_KEY:-}" ]] || die "未登录 IBM Cloud，且未设置环境变量 IBMCLOUD_API_KEY"
    info "未登录 IBM Cloud，正使用 IBMCLOUD_API_KEY 登录..."
    ibmcloud login -r "$region" -g Default >/dev/null || die "ibmcloud login 失败"
    ok "已登录"
}
ensure_login "$REGION"

# 1. 探测出口 IP（提取自 test-proxy 的核心逻辑）
info "通过代理 '${PROXY_LABEL}' 探测出口 IP..."
ip=$(proxy "$PROXY_LABEL" curl --fail --connect-timeout 3 --max-time 10 -s "$INFO_URL" | jq -r '.ip // empty')
[[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]] || die "未能探测到合法的出口 IP（得到：'${ip:-<空>}'）"
ok "出口 IP：${Y}${ip}${N}"

# 2. 读取安全组规则（一次拉取，后续基于此 JSON 解析）
rules_json=$(ibmcloud is security-group-rules "$SG" --output json)

# 解析现有槽位：slot_ip[NN]=ip，slot_id[NN]=ruleId（NN 为去零前的整数索引）
declare -A slot_ip slot_id
while IFS=$'\t' read -r idx ip2 id; do
    [[ -n $idx ]] || continue
    slot_ip[$idx]=$ip2
    slot_id[$idx]=$id
done < <(jq -r --arg p "$RULE_PREFIX" '
    .[] | select(.name | test("^" + $p + "-[0-9][0-9]$"))
        | "\(.name | ltrimstr($p + "-") | tonumber)\t\(.remote.address // .remote.cidr_block // "")\t\(.id)"
' <<<"$rules_json")

# 返回最小空槽索引（0 .. SLOTS-1），无空槽则返回空
lowest_free_slot() {
    local i
    for ((i = 0; i < SLOTS; i++)); do
        [[ -z ${slot_id[$i]:-} ]] && {
            echo "$i"
            return 0
        }
    done
    return 1
}

# 3. 兼容迁移：遗留的无后缀 proxy-moon 规则 → 最小空槽（满了则删除）
legacy=$(jq -r --arg p "$RULE_PREFIX" \
    '.[] | select(.name == $p) | "\(.remote.address // .remote.cidr_block // "")\t\(.id)"' <<<"$rules_json")
if [[ -n $legacy ]]; then
    IFS=$'\t' read -r legacy_ip legacy_id <<<"$legacy"
    if free=$(lowest_free_slot); then
        info "迁移遗留规则 '${RULE_PREFIX}' → '$(slot_name "$free")'（IP：${legacy_ip}）..."
        ibmcloud is security-group-rule-update "$SG" "$legacy_id" --name "$(slot_name "$free")" >/dev/null
        slot_ip[$free]=$legacy_ip
        slot_id[$free]=$legacy_id
    else
        info "槽位已满，删除遗留规则 '${RULE_PREFIX}'（IP：${legacy_ip}）..."
        ibmcloud is security-group-rule-delete "$SG" "$legacy_id" -f >/dev/null
    fi
fi

# 4. 若出口 IP 已在某槽位，直接返回
for idx in "${!slot_ip[@]}"; do
    if [[ ${slot_ip[$idx]} == "$ip" ]]; then
        ok "出口 IP ${ip} 已在白名单（$(slot_name "$idx")），无需变更。"
        exit 0
    fi
done

# 5. 入白：有空槽则填最小空槽；否则 FIFO 挤掉最旧（00），其余前移，新 IP 落末槽
if free=$(lowest_free_slot); then
    info "新增规则 '$(slot_name "$free")' → ${ip}（inbound / icmp_tcp_udp / 全端口）..."
    ibmcloud is security-group-rule-add "$SG" inbound icmp_tcp_udp \
        --remote "$ip" --name "$(slot_name "$free")" >/dev/null
    ok "完成：$(slot_name "$free") = ${ip}"
else
    info "槽位已满，挤掉最旧 '$(slot_name 0)'（原 IP：${slot_ip[0]}），其余前移..."
    # 原地改写各槽 remote：slot[i] := slot[i+1] 的 IP，末槽写入新 IP（规则 id/name 不变）
    for ((i = 0; i < SLOTS - 1; i++)); do
        next_ip=${slot_ip[$((i + 1))]}
        [[ ${slot_ip[$i]} == "$next_ip" ]] && continue
        ibmcloud is security-group-rule-update "$SG" "${slot_id[$i]}" --remote "$next_ip" >/dev/null
    done
    ibmcloud is security-group-rule-update "$SG" "${slot_id[$((SLOTS - 1))]}" --remote "$ip" >/dev/null
    ok "完成：$(slot_name "$((SLOTS - 1))") = ${ip}（已淘汰 ${slot_ip[0]}）"
fi
