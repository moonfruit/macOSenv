#!/usr/bin/env bash
# shellcheck disable=SC2155
# IBM Cloud 个人资源状态速览。
#
# 用法：
#   ibmcloud-status.sh            概览：四类各简要显示
#   ibmcloud-status.sh billing    仅本月账单（详细）
#   ibmcloud-status.sh linux      仅 test-linux / VPC 虚拟服务器（详细）
#   ibmcloud-status.sh aix        仅 test-aix / PowerVS 主机（详细）
#   ibmcloud-status.sh gateway    仅 power-gw / Transit Gateway（详细）
#   ibmcloud-status.sh sg         仅 VPC 安全组白名单（update-ibmcloud-sg.sh 维护，详细）
#
# 依赖插件：vpc-infrastructure(is)、power-iaas(pi)、tg-cli(tg)、billing。
set -euo pipefail

# 经代理重跑自身：之后所有 ibmcloud 调用都继承 http_proxy/https_proxy 走代理，
# 既统一出口、也规避 billing.cloud.ibm.com 偶发 TLS 握手超时。
if [[ -z "${PROXY_ENABLED:-}" ]] && hash proxy >/dev/null 2>&1; then
    exec proxy "$0" "$@"
fi

# ---------- 固定资源标识 ----------
readonly REGION="jp-tok"
readonly LINUX_VSI="test-linux"
readonly PI_WS_CRN="crn:v1:bluemix:public:power-iaas:tok04:a/d79764355846493d8723847045326ce3:478517f4-0d5e-4e69-a25e-4e95f63981a1::"
readonly PI_INSTANCE="test"
readonly PI_DISPLAY="test-aix"
readonly TG_NAME="power-gw" # 按名称解析：冻结/重建（ibmcloud-freeze/thaw.sh）后 ID 会变
# 与 update-ibmcloud-sg.sh 保持一致：安全组 / 规则名前缀 / 槽位数
readonly SG="assure-playmaker-unlivable-drapery"
readonly SG_RULE_PREFIX="proxy-moon"
readonly SG_SLOTS=10
readonly MONTH="$(date +%Y-%m)"

# ---------- 颜色 / 输出辅助 ----------
if [[ -t 1 ]]; then
    readonly C1=$(tput setaf 6) OK=$(tput setaf 2) ERR=$(tput setaf 1) \
        DIM=$(tput setaf 8) BOLD=$(tput bold) N=$(tput sgr0)
else
    readonly C1='' OK='' ERR='' DIM='' BOLD='' N=''
fi
section() { echo; echo "${BOLD}${C1}$*${N}"; echo "${DIM}────────────────────────────────────────${N}"; }

# 按显示宽度左对齐输出 “label  value”（中文/英文混合也能对齐）；
# 列宽由 wcwidth 计算（CJK/全角记 2、ASCII 记 1），缺失时回退字符数
readonly LABEL_W=12
kv() {
    local label=$1 val=$2 w pad
    w=$(wcwidth "$label" 2>/dev/null) || w=${#label}
    pad=$((LABEL_W - w))
    if ((pad < 0)); then pad=0; fi
    printf "  %s%*s %s\n" "$label" "$pad" "" "$val"
}

# ---------- 当月用量（resource-instances-usage 拉一次，多处复用）----------
# IBM Cloud API 经网络偶发 TLS 握手超时，对查询类调用重试至多 3 次，回显其 stdout
try3() {
    local out _
    for _ in 1 2 3; do
        if out=$(timeout 40 "$@" 2>/dev/null) && [[ -n $out && $out != null ]]; then
            printf '%s' "$out"
            return 0
        fi
    done
    return 1
}

USAGE_JSON=""
load_usage() {
    [[ -n $USAGE_JSON ]] && return 0
    USAGE_JSON=$(try3 ibmcloud billing resource-instances-usage -d "$MONTH" --output json) || return 1
    return 0
}
# 按字段取某实例/服务的本月 cost 合计；$1=字段名 $2=值
cost_by() {
    load_usage || { echo "N/A"; return; }
    jq -r --arg f "$1" --arg v "$2" \
        '[.[] | select(.[$f]==$v) | .usage[]?.cost // 0] | add // 0 | "USD \(.*100|round/100)"' \
        <<<"$USAGE_JSON" 2>/dev/null || echo "N/A"
}
# PowerVS 总费用（虚拟机 + 卷）
cost_power() {
    load_usage || { echo "N/A"; return; }
    jq -r '[.[] | select(.resource_name|test("Power Virtual Server")) | .usage[]?.cost // 0] | add // 0 | "USD \(.*100|round/100)"' \
        <<<"$USAGE_JSON" 2>/dev/null || echo "N/A"
}

# ---------- 1. 账单 ----------
cmd_billing() {
    local detail=$1
    section "本月账单  ($MONTH)"
    if ! load_usage; then echo "  ${ERR}无法获取账单数据${N}"; return; fi
    local total; total=$(jq -r '[.[].usage[]?.cost // 0] | add // 0 | .*100|round/100' <<<"$USAGE_JSON")
    kv "已发生" "${BOLD}USD ${total}${N}  ${DIM}(billable，截至此刻)${N}"
    if ((detail)); then
        echo "  ${DIM}按服务：${N}"
        jq -r 'group_by(.resource_name)[]
               | [ .[0].resource_name, ([.[].usage[]?.cost//0]|add//0|.*100|round/100) ] | @tsv' \
            <<<"$USAGE_JSON" \
            | sort -t$'\t' -k2 -rn \
            | awk -F'\t' '$2+0>0 {printf "    %-44s USD %s\n", $1, $2}'
    fi
}

# ---------- 2. test-linux (VPC VSI) ----------
cmd_linux() {
    local detail=$1 j
    section "test-linux  (VPC 虚拟服务器)"
    j=$(try3 ibmcloud is instance "$LINUX_VSI" --output json) || true
    if [[ -z $j || $j == null ]]; then
        echo "  ${DIM}实例不存在（已冻结/已删除，ibmcloud-thaw.sh 可重建）${N}"
        return
    fi
    local st=$(jq -r '.status' <<<"$j")
    kv "状态" "$([[ $st == running ]] && echo "${OK}${st}${N}" || echo "$st")"
    kv "规格" "$(jq -r '.profile.name' <<<"$j")  ($(jq -r '.vcpu.count' <<<"$j") vCPU / $(jq -r '.memory' <<<"$j") GiB)"
    kv "区域" "$(jq -r '.zone.name' <<<"$j")"
    kv "内网 IP" "$(jq -r '.primary_network_interface.primary_ip.address' <<<"$j")"
    kv "本月费用" "$(cost_by resource_instance_name "$LINUX_VSI")"
    if ((detail)); then
        kv "映像" "$(jq -r '.image.name' <<<"$j")"
        kv "安全组" "$(jq -r '[.primary_network_interface.security_groups[].name]|join(", ")' <<<"$j")"
        local nic=$(ibmcloud is instance-network-interfaces "$LINUX_VSI" --output json 2>/dev/null || true)
        local fip=$(jq -r '[.[].floating_ips[]?.address] | if length>0 then join(", ") else "无" end' <<<"$nic" 2>/dev/null || echo "无")
        kv "Floating IP" "${fip:-无}"
    fi
}

# ---------- 3. test-aix (PowerVS) ----------
cmd_aix() {
    local detail=$1 j
    section "$PI_DISPLAY  (PowerVS 主机，实例名 $PI_INSTANCE)"
    try3 ibmcloud pi workspace target "$PI_WS_CRN" >/dev/null || true
    j=$(try3 ibmcloud pi instance get "$PI_INSTANCE" --json) || true
    if [[ -z $j || $j == null ]]; then
        echo "  ${DIM}实例不存在（已冻结/已删除，ibmcloud-thaw.sh 可重建）${N}"
        return
    fi
    local st=$(jq -r '.status' <<<"$j")
    kv "状态" "$([[ $st == ACTIVE ]] && echo "${OK}${st}${N}" || echo "$st") / 健康 $(jq -r '.health.status' <<<"$j")"
    kv "系统" "$(jq -r '.operatingSystem' <<<"$j")"
    kv "规格" "$(jq -r '.processors' <<<"$j") 核($(jq -r '.procType' <<<"$j")) / $(jq -r '.memory' <<<"$j") GiB / $(jq -r '.sysType' <<<"$j")"
    kv "本月费用" "$(cost_power)  ${DIM}(虚拟机+卷)${N}"
    if ((detail)); then
        echo "  ${DIM}网络：${N}"
        jq -r '.networks[]? | "    - \(.networkName): \(.ipAddress)" + (if .externalIP then "  → 外网 \(.externalIP)" else "" end)' <<<"$j"
        kv "卷数" "$(jq -r '.volumeIDs|length' <<<"$j")"
    fi
}

# ---------- 4. power-gw (Transit Gateway) ----------
cmd_gateway() {
    local detail=$1 j
    section "power-gw  (Transit Gateway)"
    j=$(try3 ibmcloud tg gateways --output json \
        | jq -e --arg n "$TG_NAME" '.[]|select(.name==$n)') || true
    if [[ -z $j || $j == null ]]; then
        echo "  ${DIM}网关不存在（已冻结，ibmcloud-thaw.sh 可重建）${N}"
        kv "本月费用" "$(cost_by resource_name "Transit Gateway")"
        return
    fi
    local st=$(jq -r '.status' <<<"$j") id=$(jq -r '.id' <<<"$j")
    kv "名称" "$(jq -r '.name' <<<"$j")"
    kv "区域" "$(jq -r '.location' <<<"$j")"
    kv "状态" "$([[ $st == available ]] && echo "${OK}${st}${N}" || echo "$st")"
    kv "连接数" "$(jq -r '.connection_count' <<<"$j")"
    kv "本月费用" "$(cost_by resource_name "Transit Gateway")"
    if ((detail)); then
        echo "  ${DIM}连接：${N}"
        ibmcloud tg connections "$id" --output json 2>/dev/null \
            | jq -r '.[]? | "    - \(.name) [\(.network_type)]  \(.status)"' 2>/dev/null \
            || echo "    (无法获取连接)"
    fi
}

# ---------- 5. 安全组白名单 (update-ibmcloud-sg.sh) ----------
cmd_sg() {
    local detail=$1 j
    section "安全组白名单  (VPC，update-ibmcloud-sg.sh 维护)"
    j=$(try3 ibmcloud is security-group-rules "$SG" --output json) || true
    if [[ -z $j || $j == null ]]; then echo "  ${ERR}无法获取安全组规则${N}"; return; fi
    local n=$(jq -r --arg p "$SG_RULE_PREFIX" \
        '[.[] | select(.name | test("^" + $p + "-[0-9][0-9]$"))] | length' <<<"$j")
    kv "安全组" "$SG"
    kv "占用槽位" "${n} / ${SG_SLOTS}  ${DIM}(序号越大越新)${N}"
    if ((n == 0)); then
        echo "  ${DIM}(暂无 ${SG_RULE_PREFIX}-NN 规则)${N}"
        return
    fi
    echo "  ${DIM}规则：${N}"
    if ((detail)); then
        jq -r --arg p "$SG_RULE_PREFIX" '
            [.[] | select(.name | test("^" + $p + "-[0-9][0-9]$"))] | sort_by(.name)[]
            | "    - \(.name)  \(.remote.address // .remote.cidr_block // "?")  [\(.direction)/\(.protocol)]  \(.id)"' \
            <<<"$j"
    else
        jq -r --arg p "$SG_RULE_PREFIX" '
            [.[] | select(.name | test("^" + $p + "-[0-9][0-9]$"))] | sort_by(.name)[]
            | "    - \(.name)  \(.remote.address // .remote.cidr_block // "?")"' \
            <<<"$j"
    fi
}

# ---------- 主流程 ----------
usage() { sed -n '3,15p' "$0" | sed 's/^# \{0,1\}//'; }

# 以 target -r <REGION> 探测登录状态（顺带切到目标区域）；未登录则用
# IBMCLOUD_API_KEY 自动登录（-r <REGION> -g Default）；无该环境变量则报错退出
ensure_login() {
    local region=$1
    ibmcloud target -r "$region" >/dev/null 2>&1 && return 0
    if [[ -n "${IBMCLOUD_API_KEY:-}" ]]; then
        echo "${DIM}未登录 IBM Cloud，正使用 IBMCLOUD_API_KEY 登录...${N}" >&2
        ibmcloud login -r "$region" -g Default >/dev/null || { echo "${ERR}ibmcloud login 失败${N}" >&2; exit 1; }
    else
        echo "${ERR}未登录 IBM Cloud，且未设置环境变量 IBMCLOUD_API_KEY${N}" >&2
        exit 1
    fi
}

ensure_login "$REGION"

case "${1:-}" in
    billing) cmd_billing 1 ;;
    linux)   cmd_linux 1 ;;
    aix)     cmd_aix 1 ;;
    gateway) cmd_gateway 1 ;;
    sg)      cmd_sg 1 ;;
    "" | overview | all)
        cmd_billing 0
        cmd_linux 0
        cmd_aix 0
        cmd_gateway 0
        cmd_sg 0
        echo
        echo "${DIM}提示：附加 billing|linux|aix|gateway|sg 查看某一类详情。${N}"
        ;;
    -h | --help | help) usage ;;
    *) echo "${ERR}未知子命令：$1${N}" >&2; usage; exit 1 ;;
esac
