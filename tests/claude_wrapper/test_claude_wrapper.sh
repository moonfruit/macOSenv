#!/usr/bin/env bash
# 验证 bin/claude 在不同入参/环境下的 profile 解析与 cmux 握手分支。
# 关键回归:cmux 回环到 env/bin/claude 时 basename 退化为 "claude",
# 必须靠 CLAUDE_PROFILE 透传保留原链接名(profile 名),不被默认改写覆盖。
set -euo pipefail

ENV_REPO=/Users/moon/Workspace.localized/env
TESTDIR=$(mktemp -d -t claude_wrapper_test)
trap 'rm -rf "$TESTDIR"' EXIT

# ---- fixture: secrets ----
SECRETS=$TESTDIR/etc/secrets
mkdir -p "$SECRETS"
cp "$ENV_REPO/etc/secrets/claude-3rd.sh" "$SECRETS/"
cat > "$SECRETS/claude-glm.env" <<'EOF'
ANTHROPIC_API_KEY=glm-key
EOF
cat > "$SECRETS/claude-mini.env" <<'EOF'
ANTHROPIC_API_KEY=mini-key
EOF
cat > "$SECRETS/claude-xiaomi.env" <<'EOF'
ANTHROPIC_API_KEY=xiaomi-key
EOF

# ---- fixture: stub sops(把 decrypt 当 cat,避免真实 sops 调用)----
BINS=$TESTDIR/bin
mkdir -p "$BINS"
cat > "$BINS/sops" <<'EOF'
#!/usr/bin/env bash
[[ "$1" == "decrypt" ]] && shift
exec cat "$@"
EOF
chmod +x "$BINS/sops"

# ---- fixture: 真实 claude 的替身(只看 PROFILE 和 API_KEY,不做任何事)----
HB=$TESTDIR/opt/homebrew/bin
mkdir -p "$HB"
cat > "$HB/claude" <<'EOF'
#!/usr/bin/env bash
echo "API_KEY=${ANTHROPIC_API_KEY:-}"
echo "PROFILE=${CLAUDE_PROFILE:-}"
EOF
chmod +x "$HB/claude"

# ---- fixture: cmux wrapper 替身(看 CLAUDE_PROFILE 是不是带过来了)----
CMUX_STUB=$TESTDIR/cmux-stub
cat > "$CMUX_STUB" <<'EOF'
#!/usr/bin/env bash
# 不再 exec 下一跳,只看 CLAUDE_PROFILE 是不是对的
echo "CMUX_STUB_PROFILE=${CLAUDE_PROFILE:-}"
EOF
chmod +x "$CMUX_STUB"

# ---- fixture: 测试用的 bin/claude(复制 + 替换两个绝对路径)----
TEST_BIN=$BINS/claude
cp "$ENV_REPO/bin/claude" "$TEST_BIN"
chmod +x "$TEST_BIN"
sed -i.bak "s|source \"\\\$ENV/lib|source \"$ENV_REPO/lib|g" "$TEST_BIN"
sed -i.bak "s|\\\"\\\$ENV/etc/secrets/|\\\"$SECRETS/|g" "$TEST_BIN"
sed -i.bak "s|/opt/homebrew/bin/claude|$HB/claude|g" "$TEST_BIN"
rm -f "$TEST_BIN.bak"

# 创建不同名字的链接供 basename 测试
ln -sf "$TEST_BIN" "$BINS/claude-mini"
ln -sf "$TEST_BIN" "$BINS/claude-xiaomi"

# 让 native.sh / lib 等被原 $ENV 路径加载(已经替换过)
# 让 sops / homebrew-claude 走 stub 路径
export PATH="$BINS:$PATH"
export ENV=$ENV_REPO

PASS=0
FAIL=0
fail() { echo "  FAIL: $1"; FAIL=$((FAIL+1)); }
pass() { echo "  ok:   $1"; PASS=$((PASS+1)); }

# ---- 断言工具:验证 OUT 里 API_KEY 是期望值,PROFILE 是期望值 ----
assert_api_key() {
    local name="$1" out="$2" want="$3"
    if echo "$out" | grep -q "^API_KEY=${want}$"; then
        pass "$name: API_KEY=$want"
    else
        fail "$name: 期望 API_KEY=$want,实际:"
        echo "$out" | sed 's/^/    /'
    fi
}
assert_profile() {
    local name="$1" out="$2" want="$3"
    # want 是 "(unset)" 表示 CLAUDE_PROFILE 应为空
    local want_pat
    if [[ $want == "(unset)" ]]; then
        want_pat='^PROFILE=$'
    else
        want_pat="^PROFILE=${want}$"
    fi
    if echo "$out" | grep -q "$want_pat"; then
        pass "$name: PROFILE=$want"
    else
        fail "$name: 期望 PROFILE=$want,实际:"
        echo "$out" | sed 's/^/    /'
    fi
}

echo "=== A:非 cmux 内直接调 claude(basename=claude,无透传)→ 默认改写为 glm ==="
OUT=$("$TEST_BIN" -h 2>/dev/null)
assert_api_key "A" "$OUT" "glm-key"
assert_profile "A" "$OUT" "(unset)"

echo
echo "=== B:非 cmux 内直接调 claude,父 shell 已 CLAUDE_PROFILE=claude-mini → 透传 ==="
OUT=$(CLAUDE_PROFILE=claude-mini "$TEST_BIN" -h 2>/dev/null)
assert_api_key "B" "$OUT" "mini-key"
assert_profile "B" "$OUT" "(unset)"   # 直连分支主动 unset

echo
echo "=== C:非 cmux 内直接调 claude-xiaomi(链接名)→ 加载 xiaomi.env ==="
OUT=$("$BINS/claude-xiaomi" -h 2>/dev/null)
assert_api_key "C" "$OUT" "xiaomi-key"
assert_profile "C" "$OUT" "(unset)"

echo
echo "=== D:cmux 内调 claude-mini,第一跳(命中 cmux 握手,应回指 cmux stub) ==="
# stub 不再 exec 下一跳,只看 CLAUDE_PROFILE 是否透传(secrets 加载发生在第 1 跳之前)
OUT=$(CMUX_SURFACE_ID=surf-1 CMUX_CLAUDE_WRAPPER_SHIM="$CMUX_STUB" "$BINS/claude-mini" -h 2>/dev/null)
if echo "$OUT" | grep -q '^CMUX_STUB_PROFILE=claude-mini$'; then
    pass "D: 回指 cmux stub 时 CLAUDE_PROFILE=claude-mini 已透传"
else
    fail "D: 第一跳没把 CLAUDE_PROFILE 传给 cmux stub"
    echo "$OUT" | sed 's/^/    /'
fi

echo
echo "=== E(关键回归):cmux 回环到 env/bin/claude(basename=claude,CLAUDE_PROFILE=claude-mini 已透传) ==="
# 模拟跳 3:被绝对路径调用 + 父进程已 export CLAUDE_PROFILE
OUT=$(CLAUDE_PROFILE=claude-mini "$TEST_BIN" -h 2>/dev/null)
assert_api_key "E" "$OUT" "mini-key"     # 必须不被默认改写覆盖
assert_profile "E" "$OUT" "(unset)"      # 走直连分支,主动 unset

echo
echo "=== F:cmux 内显式调 claude(NAME=claude,无 CLAUDE_PROFILE)→ 应走 glm ==="
# stub 不再 exec 下一跳,只看 stub 收到的 CLAUDE_PROFILE 是不是 glm
OUT=$(CMUX_SURFACE_ID=surf-1 CMUX_CLAUDE_WRAPPER_SHIM="$CMUX_STUB" "$TEST_BIN" -h 2>/dev/null)
if echo "$OUT" | grep -q '^CMUX_STUB_PROFILE=claude-glm$'; then
    pass "F: 默认 claude 在 cmux 内走 GLM,stub 收到 CLAUDE_PROFILE=claude-glm"
else
    fail "F: 默认改写逻辑没传到 cmux stub"
    echo "$OUT" | sed 's/^/    /'
fi

echo
echo "--- 结果 ---"
echo "通过: $PASS"
echo "失败: $FAIL"
[[ $FAIL -eq 0 ]]