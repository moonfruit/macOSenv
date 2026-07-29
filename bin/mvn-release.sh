#!/opt/homebrew/bin/bash
#
# mvn-release.sh — 交互式 Maven 发布。
#
# 读取当前版本 → 推导发布版本与下一开发版本 → 确认 → release:prepare → 桌面通知。
# 依赖 bash 5（nameref、read -i 预填）、$ENV/lib/bash/color.sh、notify.sh。
#
# 不依赖本仓库、可直接分享的版本见 bin/public/mvn-release.sh。

set -Eeuo pipefail
source "$ENV/lib/bash/color.sh"

readonly PROGRAM=${0##*/}
readonly PROJECT=${PWD##*/}
readonly SNAPSHOT_SUFFIX=-SNAPSHOT
readonly RELEASE_SUFFIX=${RELEASE_SUFFIX--RELEASE}

usage() {
    cat <<EOF
用法：$PROGRAM [选项] [-- <传给 mvn 的参数>]

选项：
  -r, --release <版本>   发布版本（默认由当前版本推导，交互时可编辑）
  -d, --develop <版本>   下一开发版本
  -t, --tag <标签>       Git 标签（默认与发布版本相同）
  -y, --yes              直接采用默认值，不询问
  -n, --dry-run          只打印将要执行的 mvn 命令
  -h, --help             显示此帮助

未列出的参数以及 -- 之后的内容原样传给 mvn release:prepare，
例如 $PROGRAM -y -Darguments=-DskipTests。
环境变量 RELEASE_SUFFIX 覆盖发布版本后缀（当前：${RELEASE_SUFFIX:-无}）。
EOF
}

die() {
    warn "$*" >&2
    exit 1
}

notify() {
    hash notify.sh 2>/dev/null && notify.sh "$@" &>/dev/null || true
}

run() {
    h2 "$(printf '%q ' "$@")"
    ((DRY_RUN)) || "$@"
}

# 给 $1 指向的变量补上后缀 $2（已有或后缀为空则不动）。
add-suffix() {
    local -n __var=$1
    [[ -z $__var || -z $2 || $__var == *"$2" ]] || __var+=$2
}

# 由当前版本推导 DEFAULT_RELEASE / DEFAULT_DEVELOP。
#
# patch 为 0 视为一个 minor 系列的开端：1.2.0-SNAPSHOT 发 1.2.0，开发转入 1.3.0；
# 1.2.3-SNAPSHOT 则发 1.2.3，开发转入 1.2.4。无法识别的版本不给开发版默认值。
derive-versions() {
    local version=$1 major minor patch

    DEFAULT_RELEASE=${version%"$SNAPSHOT_SUFFIX"}
    add-suffix DEFAULT_RELEASE "$RELEASE_SUFFIX"
    DEFAULT_DEVELOP=

    if [[ $version =~ ^([0-9]+)\.([0-9]+)(\.([0-9]+))?-SNAPSHOT$ ]]; then
        major=${BASH_REMATCH[1]}
        minor=${BASH_REMATCH[2]}
        patch=${BASH_REMATCH[4]}

        if [[ -z $patch ]]; then
            DEFAULT_DEVELOP=$major.$((minor + 1))
        elif ((10#$patch > 0)); then
            DEFAULT_DEVELOP=$major.$minor.$((10#$patch + 1))
        else
            DEFAULT_DEVELOP=$major.$((minor + 1)).0
        fi
        DEFAULT_DEVELOP+=$SNAPSHOT_SUFFIX
    fi
}

# ask <变量名> <提示> <默认值> <后缀>
# 变量已有值则沿用，否则交互读取（默认值预填在输入行上，可直接编辑），最后补齐后缀。
ask() {
    local -n __out=$1
    local label=$2 default=$3 suffix=$4

    if [[ -z $__out ]]; then
        if ((ASSUME_YES)) || [[ ! -t 0 ]]; then
            [[ -n $default ]] || die "无法推导${label}，请用参数显式指定"
            __out=$default
        else
            while [[ -z $__out ]]; do
                read -rep "$label: " -i "$default" __out
            done
        fi
    fi
    add-suffix "$1" "$suffix"
}

RELEASE=''
DEVELOP=''
TAG=''
ASSUME_YES=0
DRY_RUN=0

while (($#)); do
    case $1 in
        -r | --release) RELEASE=${2:?缺少发布版本}; shift 2 ;;
        -d | --develop) DEVELOP=${2:?缺少开发版本}; shift 2 ;;
        -t | --tag) TAG=${2:?缺少标签}; shift 2 ;;
        -y | --yes) ASSUME_YES=1; shift ;;
        -n | --dry-run) DRY_RUN=1; shift ;;
        -h | --help) usage; exit 0 ;;
        --) shift; break ;;
        *) break ;;
    esac
done

hash mvn 2>/dev/null || die '找不到 mvn'
[[ -f pom.xml ]] || die "$PWD 下没有 pom.xml"

# -B 关掉颜色，避免包装器的配色过滤器混进版本号
CURRENT=$(mvn -B -q -DforceStdout -Dexpression=project.version help:evaluate | tr -d '[:space:]')
[[ -n $CURRENT ]] || die '读不到 project.version'
h1 "当前版本 $CURRENT"

derive-versions "$CURRENT"
ask RELEASE '发布版本' "$DEFAULT_RELEASE" "$RELEASE_SUFFIX"
ask DEVELOP '开发版本' "$DEFAULT_DEVELOP" "$SNAPSHOT_SUFFIX"
[[ -n $TAG ]] || TAG=$RELEASE

SECONDS=0
trap 'notify "[$PROJECT] $RELEASE 发布失败" "release:prepare 未完成，见终端输出" Basso' ERR

run mvn clean release:clean
run mvn release:prepare \
    -Dtag="$TAG" -DreleaseVersion="$RELEASE" -DdevelopmentVersion="$DEVELOP" "$@"
run mvn release:clean

trap - ERR
printf -v ELAPSED '%d分%02d秒' $((SECONDS / 60)) $((SECONDS % 60))
h1 "$RELEASE 发布完成（耗时 ${ELAPSED}），下一开发版本 $DEVELOP"

# 两个版本提交和 tag 都还在本地，而 git push 不会带上 tag。
if ((DRY_RUN == 0)); then
    warn "$TAG 还留在本地，连同提交一起推送："
    echo "    git push --follow-tags"
    notify "[$PROJECT] $RELEASE 发布完成" "耗时 ${ELAPSED}，记得 git push --follow-tags"
fi
