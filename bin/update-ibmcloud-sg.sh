#!/usr/bin/env bash
# shellcheck disable=SC2155
# 将代理出口 IP 加入 IBM Cloud VPC 安全组白名单。
#
#   - 出口 IP 探测逻辑提取自 bin/test-proxy（fetch-info：经 proxy 访问 ipinfo.io 取 .ip）
#   - 规则名固定为 proxy-moon，已存在则替换（IP 未变则跳过）
#   - 规则形态参考 proxy-gingkoo：inbound / icmp_tcp_udp / 全端口 / --remote <ip>
#
# 用法：
#   sg-proxy-moon [PROXY_LABEL]      # PROXY_LABEL 默认 global，即 test-proxy global
#
# 可用环境变量覆盖：SG（安全组名/ID）、RULE_NAME（规则名）、REGION。
set -euo pipefail

if [[ -z "${PROXY_ENABLED:-}" ]] && hash proxy >/dev/null 2>&1; then
    exec proxy "$0" "$@"
fi

readonly SG="${SG:-assure-playmaker-unlivable-drapery}"
readonly RULE_NAME="${RULE_NAME:-proxy-moon}"
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

# 1. 探测出口 IP（提取自 test-proxy 的核心逻辑）
info "通过代理 '${PROXY_LABEL}' 探测出口 IP..."
ip=$(proxy "$PROXY_LABEL" curl --fail --connect-timeout 3 --max-time 10 -s "$INFO_URL" | jq -r '.ip // empty')
[[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]] || die "未能探测到合法的出口 IP（得到：'${ip:-<空>}'）"
ok "出口 IP：${Y}${ip}${N}"

# 确保操作落在安全组所在区域
ibmcloud target -r "$REGION" >/dev/null

# 2. 查现有同名规则（安全组内规则名唯一，理论上至多一条）
existing=$(ibmcloud is security-group-rules "$SG" --output json |
    jq -r --arg n "$RULE_NAME" '.[] | select(.name==$n) | "\(.id)\t\(.remote.address // .remote.cidr_block // "")"')

if [[ -n $existing ]]; then
    cur_ip=$(head -1 <<<"$existing" | cut -f2)
    if [[ $cur_ip == "$ip" ]]; then
        ok "规则 '${RULE_NAME}' 已是 ${ip}，无需变更。"
        exit 0
    fi
    info "删除旧规则 '${RULE_NAME}'（原 IP：${cur_ip:-未知}）..."
    while IFS=$'\t' read -r id _; do
        [[ -n $id ]] && ibmcloud is security-group-rule-delete "$SG" "$id" -f >/dev/null
    done <<<"$existing"
fi

# 3. 添加新规则（形态参考 proxy-gingkoo）
info "添加规则 '${RULE_NAME}' → ${ip}（inbound / icmp_tcp_udp / 全端口）..."
ibmcloud is security-group-rule-add "$SG" inbound icmp_tcp_udp \
    --remote "$ip" --name "$RULE_NAME" >/dev/null
ok "完成：${RULE_NAME} = ${ip}"
