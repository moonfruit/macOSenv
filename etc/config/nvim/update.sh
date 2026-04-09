#!/usr/bin/env bash
set -o pipefail
source "$ENV/lib/bash/color.sh"
source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/native.sh"

if [[ -z "${PROXY_ENABLED:-}" ]] && has-command proxy; then
    exec proxy "$0" "$@"
fi

# 过滤 lazy.nvim 的任务调度记账行，只保留有意义的更新/错误输出
filter-lazy-noise() {
    rg --line-buffered -v 'Running task|Finished task \w+ in \d+ms|^\s*$' || true
}

h1 Updating lazy.nvim plugins
nvim --headless "+Lazy! update" +qa 2>&1 | filter-lazy-noise >&2
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

-- Neovim headless 下 print 会把控制字符转义成可视形式（ESC -> ^[），
-- 导致 ANSI 颜色失效；这里直接走 stderr stdio，绕过 nvim 的 print 过滤层
local function echo(msg)
    io.stderr:write(msg)
    io.stderr:write("\n")
    io.stderr:flush()
end

local function log(pkg_name, action, msg)
    echo(string.format("%s[%s]%s %s%s%s %s|%s %s",
        C.pkg, pkg_name, C.reset,
        C.action, action, C.reset,
        C.sep, C.reset,
        msg))
end

-- mason 被 LazyVim 懒加载，这里先强制加载，确保 mason-registry 可用
pcall(vim.cmd, "Lazy load mason.nvim")

local ok, registry = pcall(require, "mason-registry")
if not ok then
    echo(C.err .. "mason-registry not available" .. C.reset)
    vim.cmd("cquit 1")
    return
end

local done = false

registry.refresh(function()
    local packages = registry.get_installed_packages()
    if #packages == 0 then
        echo("No mason packages installed")
        done = true
        return
    end

    -- 筛出真正有新版本的包（对齐 mason UI 的 check_new_package_versions 逻辑）
    local outdated = {}
    for _, pkg in ipairs(packages) do
        local current = pkg:get_installed_version()
        local latest = pkg:get_latest_version()
        if current ~= latest then
            table.insert(outdated, { pkg = pkg, current = current, latest = latest })
        end
    end

    if #outdated == 0 then
        echo(string.format("%sAll %d mason packages are up to date%s", C.ok, #packages, C.reset))
        done = true
        return
    end

    echo(string.format("%d of %d mason packages need update", #outdated, #packages))

    local pending = #outdated
    for _, entry in ipairs(outdated) do
        local pkg = entry.pkg
        log(pkg.name, "update", string.format("%s -> %s", entry.current or "<none>", entry.latest))
        local handle = pkg:install()
        handle:once("closed", function()
            pending = pending - 1
            local status = pkg:is_installed()
                and (C.ok .. "ok" .. C.reset)
                or (C.err .. "FAILED" .. C.reset)
            log(pkg.name, "finished", string.format("%s (%d remaining)", status, pending))
            if pending == 0 then
                done = true
            end
        end)
    end
end)

-- 等直到全部完成；若真的太慢，由用户自行 Ctrl+C 介入
while not done do
    vim.wait(500, function() return done end)
end
EOF

nvim --headless -c "luafile $LUA" +qa
echo
