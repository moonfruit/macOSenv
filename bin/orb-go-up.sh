#!/usr/bin/env bash
set -euo pipefail

PREFIX=()
if [[ -z "${DARK_ENABLED:-}" ]] && command -v dark &>/dev/null; then
	PREFIX+=(dark)
fi
if [[ -z "${PROXY_ENABLED:-}" ]] && command -v proxy &>/dev/null; then
	PREFIX+=(proxy)
fi

if ((${#PREFIX[@]})); then
	exec "${PREFIX[@]}" "$0" "$@"
fi

source "$ENV/lib/bash/color.sh"

usage() {
	cat <<EOF
Usage: ${0##*/} [-m MACHINE] [-f]

Upgrade the Go toolchain in an OrbStack Linux machine, the same way it was
installed by hand: fetch the official tarball, verify its SHA256, then replace
/usr/local/go. Not managed by apt, so apt upgrade never touches it.

  -m MACHINE  target machine (default: OrbStack default machine)
  -f          reinstall even when already up to date
  -h          show this help
EOF
}

MACHINE=
FORCE=
while getopts ":m:fh" opt; do
	case $opt in
	m) MACHINE=$OPTARG ;;
	f) FORCE=1 ;;
	h)
		usage
		exit 0
		;;
	*)
		usage >&2
		exit 2
		;;
	esac
done

ORB=(orb)
[[ $MACHINE ]] && ORB+=(-m "$MACHINE")

# Go 的 tarball 用 GOARCH 命名，跟 uname -m 的叫法对不上
ARCH=$("${ORB[@]}" uname -m | tr -d '\r')
case $ARCH in
aarch64 | arm64) GOARCH=arm64 ;;
x86_64 | amd64) GOARCH=amd64 ;;
*)
	echo "unsupported machine architecture: $ARCH" >&2
	exit 1
	;;
esac

# sudo 走的是 heredoc 占用的 stdin，读不了密码，先确认免密
if ! "${ORB[@]}" sudo -n true 2>/dev/null; then
	echo "passwordless sudo is required inside the machine" >&2
	exit 1
fi

h1 "Checking installed Go"
CURRENT=$("${ORB[@]}" bash -lc 'go version 2>/dev/null' | awk '{print $3}')
echo "${_BLUE}current$_RESET  ${CURRENT:-not installed} ($GOARCH)"

h1 "Querying latest Go release"
JSON=$(curl -fsSL --max-time 30 'https://go.dev/dl/?mode=json')
IFS=$'\t' read -r LATEST FILENAME SHA256 < <(
	jq -r --arg arch "$GOARCH" '
		[.[] | select(.stable)][0] as $release |
		$release.files[]
		| select(.os == "linux" and .arch == $arch and .kind == "archive")
		| [$release.version, .filename, .sha256]
		| @tsv
	' <<<"$JSON"
)
if [[ -z ${LATEST:-} ]]; then
	echo "no linux/$GOARCH archive found in the release feed" >&2
	exit 1
fi
echo "${_BLUE}latest$_RESET   $LATEST"

if [[ $CURRENT == "$LATEST" && -z $FORCE ]]; then
	h1 "Already up to date"
	exit 0
fi

# 宿主机的 $TMPDIR 在机器内看不见，临时文件得落在 $HOME 下才能被 tar 读到
WORK=$(mktemp -d "$HOME/.cache/orb-go-up.XXXXXX")
trap 'rm -rf "$WORK"' EXIT

h1 "Downloading $FILENAME"
curl -fL --progress-bar -o "$WORK/$FILENAME" "https://go.dev/dl/$FILENAME"

h1 "Verifying checksum"
(cd "$WORK" && echo "$SHA256  $FILENAME" | shasum -a 256 -c -)

h1 "Installing ${LATEST} into ${MACHINE:-the default machine}"
"${ORB[@]}" bash -s -- "$WORK/$FILENAME" <<'INSTALL'
set -euo pipefail
TARBALL=$1

if [[ ! -f $TARBALL ]]; then
	echo "tarball is not visible inside the machine: $TARBALL" >&2
	exit 1
fi

rollback() {
	sudo rm -rf /usr/local/go
	if [[ -d /usr/local/go.bak ]]; then
		sudo mv /usr/local/go.bak /usr/local/go
		echo "rolled back to the previous toolchain" >&2
	fi
	exit 1
}

# 先挪开而不是直接删，解压失败还能退回去
sudo rm -rf /usr/local/go.bak
if [[ -d /usr/local/go ]]; then
	sudo mv /usr/local/go /usr/local/go.bak
fi

sudo tar -C /usr/local -xzf "$TARBALL" || rollback

# 软链是相对路径，重装后依然有效，只在缺失时补建
for cmd in go gofmt; do
	if [[ ! -e /usr/local/bin/$cmd ]]; then
		sudo ln -sfn "../go/bin/$cmd" "/usr/local/bin/$cmd"
	fi
done

/usr/local/go/bin/go version || rollback

sudo rm -rf /usr/local/go.bak
INSTALL

h1 "Verifying installation"
"${ORB[@]}" bash -lc 'go version'
