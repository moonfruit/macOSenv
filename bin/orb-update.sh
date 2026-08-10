#!/usr/bin/env bash
# 不用 -e：某一步失败也要把剩下的跑完，最后统一汇总
set -uo pipefail

PREFIX=()
if [[ -z "${DARK_ENABLED:-}" ]] && command -v dark &>/dev/null; then
	PREFIX+=(dark)
fi
if [[ -z "${PROXY_ENABLED:-}" ]] && command -v proxy &>/dev/null; then
	PREFIX+=(proxy)
fi

# 在这里包一次就够了，子脚本看到 DARK_ENABLED/PROXY_ENABLED 便不会再套一层
if ((${#PREFIX[@]})); then
	exec "${PREFIX[@]}" "$0" "$@"
fi

source "$ENV/lib/bash/color.sh"

if [[ ${1:-} == -h || ${1:-} == --help ]]; then
	cat <<EOF
Usage: ${0##*/}

Update everything in the OrbStack default machine: apt packages first, then the
hand-installed Go toolchain. Each step runs even if an earlier one fails; the
exit status is non-zero when any of them did.
EOF
	exit 0
fi

STEPS=(
	orb-apt-up.sh
	orb-go-up.sh
)

FAILED=()
for step in "${STEPS[@]}"; do
	h1 "$step"
	"$ENV/bin/$step"
	status=$?
	if ((status)); then
		warn "$step exited with ${status}"
		FAILED+=("$step")
	fi
	echo
done

if ((${#FAILED[@]})); then
	warn "failed: ${FAILED[*]}"
	exit 1
fi

h1 "All updates finished"
