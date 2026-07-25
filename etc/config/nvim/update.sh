#!/usr/bin/env bash
set -o pipefail
source "$ENV/lib/bash/color.sh"
source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/native.sh"

if [[ -z "${PROXY_ENABLED:-}" ]] && has-command proxy; then
    exec proxy "$0" "$@"
fi

SCRIPT_DIR="$(current-script-directory)"

LOG_DIR="$SCRIPT_DIR/log"
LOG_KEEP=10
mkdir -p "$LOG_DIR"

# 列出指定前缀的日志，按修改时间从新到旧。文件名固定为 prefix-时间戳.log，无空白与特殊字符。
list_logs() {
    local prefix="$1"
    find "$LOG_DIR" -maxdepth 1 -type f -name "${prefix}-*.log" -exec stat -f '%m %N' {} + 2>/dev/null \
        | sort -rn | cut -d' ' -f2-
}

# 落盘后处理：与上一份内容相同则丢弃本次并刷新上一份的 mtime，最后把同前缀日志裁剪到 LOG_KEEP 份。
finalize_log() {
    local log_file="$1" prefix="$2" prev
    prev="$(list_logs "$prefix" | grep -vF "$log_file" | head -n 1)"
    if [[ -n "$prev" ]] && cmp -s "$log_file" "$prev"; then
        rm -f "$log_file"
        touch "$prev"
    fi
    list_logs "$prefix" | tail -n "+$((LOG_KEEP + 1))" | xargs -I{} rm -f {}
}

TS="$(date +%Y%m%d-%H%M%S)"
LAZY_LOG="$LOG_DIR/lazy-$TS.log"
TREESITTER_LOG="$LOG_DIR/treesitter-$TS.log"
MASON_LOG="$LOG_DIR/mason-$TS.log"

h1 Updating lazy.nvim plugins
nvim --headless "+Lazy! update" +qa 2>&1 | tee "$LAZY_LOG" | "$SCRIPT_DIR/lazy-progress.py"
finalize_log "$LAZY_LOG" lazy
echo

h1 Updating treesitter parsers
create-temp-file LUA
cat >"$LUA" <<'EOF'
-- lazy.nvim 的 build 钩子里 TSUpdate 是异步的，lazy 不等它跑完就结束任务，
-- nvim 一退出编译就被打断：parser 停在旧版，而 queries 是软链、已随插件更新到新版，
-- 于是打开对应文件时报 Query error: Invalid node type。这里显式同步等待，补上这一步。
local ok, err = pcall(function()
    require("nvim-treesitter").update(nil, { summary = true }):wait(900000)
end)
if not ok then
    vim.api.nvim_echo({ { "[nvim-treesitter]: update failed: " .. tostring(err), "ErrorMsg" } }, true, {})
    vim.cmd("cquit 1") -- cspell:ignore cquit
end
EOF

# nvim-treesitter 的日志前缀是 [nvim-treesitter/install/<lang>]: msg，且 headless 下
# nvim_echo 的高亮组不会变成 ANSI 码。这里转成 lazy.nvim 的 [plugin] task | msg 格式
# 并补上配色，好让 lazy-progress.py 按语言原地刷新；配色与对齐规则同 mason 段
nvim --headless -c "luafile $LUA" +qa 2>&1 \
    | tee "$TREESITTER_LOG" \
    | awk -v C_PKG=$'\033[35m' -v C_ACT=$'\033[36m' -v C_SEP=$'\033[90m' \
        -v C_OK=$'\033[32m' -v C_WARN=$'\033[33m' -v C_ERR=$'\033[31m' -v C_RST=$'\033[0m' '
    # 对齐逻辑同 lazy.nvim：plugin_name + task 合计填充到 20 字符，task 右对齐
    function emit(name, task, msg,    pad) {
        pad = 20 - length(name) - length(task)
        if (pad < 0) pad = 0
        printf "%s[%s]%s %s%*s%s %s|%s %s\n",
            C_PKG, name, C_RST, C_ACT, pad + length(task), task, C_RST, C_SEP, C_RST, msg
    }
    {
        if (match($0, /^\[nvim-treesitter\/([^]\/]+)\/([^]]+)\](:| warning:| error:) (.*)$/, m)) {
            name = m[2]; task = m[1]; sev = m[3]; msg = m[4]
        } else if (match($0, /^\[nvim-treesitter\](:| warning:| error:) (.*)$/, m)) {
            name = "nvim-treesitter"; task = "update"; sev = m[1]; msg = m[2]
        } else {
            print; next
        }
        if (sev == " warning:") msg = C_WARN "warning: " C_RST msg
        else if (sev == " error:") msg = C_ERR "error: " C_RST msg
        else if (msg ~ /up-to-date|Language installed|^Installed /) msg = C_OK msg C_RST
        emit(name, task, msg)
    }' \
    | "$SCRIPT_DIR/lazy-progress.py"
finalize_log "$TREESITTER_LOG" treesitter
echo

h1 Updating mason.nvim packages
create-temp-file LUA
cat >"$LUA" <<'EOF'
-- 对齐 lazy.nvim 的配色：plugin=品红, action=青, 分隔=灰
local C = {
    reset  = "\27[0m",
    pkg    = "\27[35m",
    action = "\27[36m",
    sep    = "\27[90m",
    ok     = "\27[32m",
    err    = "\27[31m",
}

-- 输出格式与 lazy.nvim 一致：[name] action | message
-- 对齐逻辑同 lazy.nvim：plugin_name + action 合计填充到 20 字符，action 右对齐
local function log(pkg_name, action, msg)
    local pad = math.max(0, 20 - #pkg_name - #action)
    local padded_action = string.rep(" ", pad) .. action
    io.stderr:write(string.format("%s[%s]%s %s%s%s %s|%s %s\n",
        C.pkg, pkg_name, C.reset,
        C.action, padded_action, C.reset,
        C.sep, C.reset,
        msg))
    io.stderr:flush()
end

-- mason 被 LazyVim 懒加载，这里先强制加载，确保 mason-registry 可用
pcall(vim.cmd, "Lazy load mason.nvim")

local ok, registry = pcall(require, "mason-registry")
if not ok then
    io.stderr:write(C.err .. "mason-registry not available" .. C.reset .. "\n")
    io.stderr:flush()
    vim.cmd("cquit 1") -- cspell:ignore cquit
    return
end

local done = false

registry.refresh(function()
    local packages = registry.get_installed_packages()
    if #packages == 0 then
        io.stderr:write("No mason packages installed\n")
        io.stderr:flush()
        done = true
        return
    end

    -- 按名称排序
    table.sort(packages, function(a, b) return a.name < b.name end)

    -- 所有包先显示 check 状态
    for _, pkg in ipairs(packages) do
        log(pkg.name, "check", "checking...")
    end

    -- 检查版本并更新
    local pending = #packages
    for _, pkg in ipairs(packages) do
        local current = pkg:get_installed_version()
        local latest = pkg:get_latest_version()
        if current == latest then
            log(pkg.name, "check", C.ok .. "up to date" .. C.reset
                .. " (" .. (current or "?") .. ")")
            pending = pending - 1
            if pending == 0 then done = true end
        else
            log(pkg.name, "update", (current or "<none>") .. " -> " .. latest)
            local handle = pkg:install()
            handle:once("closed", function()
                pending = pending - 1
                if pkg:is_installed() then
                    log(pkg.name, "update", C.ok .. "ok" .. C.reset
                        .. " (" .. (current or "<none>") .. " -> " .. latest .. ")")
                else
                    log(pkg.name, "update", C.err .. "FAILED" .. C.reset)
                end
                if pending == 0 then done = true end
            end)
        end
    end
end)

-- 等直到全部完成；若真的太慢，由用户自行 Ctrl+C 介入
while not done do
    vim.wait(500, function() return done end)
end
EOF

nvim --headless -c "luafile $LUA" +qa 2>&1 | tee "$MASON_LOG" | "$SCRIPT_DIR/lazy-progress.py"
finalize_log "$MASON_LOG" mason
echo
