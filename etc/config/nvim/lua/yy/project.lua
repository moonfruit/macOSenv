--- 寻找项目根目录，逻辑对应 `$ENV/lib/bash/project.sh` 的 `project-root`：
---   阶段 1: git 顶层目录
---   阶段 2: 工具标志（.claude/.vscode/.idea 目录，或 .envrc/.lazy.lua 文件）
---   阶段 3: 语言标志（Gradle / Maven / package.json / go.mod / …）
--- 向上查找到 `/` 或 `$HOME` 即停止，且这两个目录本身永远不会作为项目根返回。
---@module 'yy.project'

local M = {}

---@param dir string
---@return string
local function parent(dir)
  return vim.fn.fnamemodify(dir, ":h")
end

---@param p string
---@return boolean
local function isdir(p)
  return vim.fn.isdirectory(p) == 1
end

---@param p string
---@return boolean
local function isfile(p)
  return vim.fn.filereadable(p) == 1
end

local HOME = ((vim.uv or vim.loop).os_homedir() or ""):gsub("/$", "")

--- 向上查找的边界：/ 与 $HOME 只用于终止查找，自身永远不作为项目根。
---@param d string
---@return boolean
local function is_boundary(d)
  return d == "/" or (HOME ~= "" and d == HOME)
end

--- pom.xml 逐级上爬到最外层仍含 pom.xml 的目录（对应 bash 的 climb_pom）。
---@param d string
---@return string
local function climb_pom(d)
  while not is_boundary(parent(d)) and isfile(parent(d) .. "/pom.xml") do
    d = parent(d)
  end
  return d
end

--- 从 `start` 的父目录起向上找 settings.gradle（对应 bash 的 climb_for_settings）。
---@param start string
---@return string|nil
local function climb_for_settings(start)
  local d = parent(start)
  while not is_boundary(d) do
    if isfile(d .. "/settings.gradle") or isfile(d .. "/settings.gradle.kts") then
      return d
    end
    d = parent(d)
  end
  return nil
end

--- 寻找 `start`（默认 cwd）所属的项目根。
---@param start? string
---@return string|nil root 找到返回绝对路径；找不到返回 nil
function M.root(start)
  start = vim.fn.fnamemodify(start or vim.fn.getcwd(), ":p")
  if #start > 1 then
    start = (start:gsub("/$", ""))
  end
  if not isdir(start) then
    return nil
  end

  -- 阶段 1: git
  if vim.fn.executable("git") == 1 then
    local out = vim.fn.systemlist({ "git", "-C", start, "rev-parse", "--show-toplevel" })
    if vim.v.shell_error == 0 and out[1] and out[1] ~= "" and not is_boundary(out[1]) then
      return out[1]
    end
  end

  -- 阶段 2: 工具标志
  local d = start
  while not is_boundary(d) do
    if
      isdir(d .. "/.claude")
      or isdir(d .. "/.vscode")
      or isdir(d .. "/.idea")
      or isfile(d .. "/.envrc")
      or isfile(d .. "/.lazy.lua")
    then
      return d
    end
    d = parent(d)
  end

  -- 阶段 3: 语言标志（Gradle / Maven / 其他）
  d = start
  while not is_boundary(d) do
    if isfile(d .. "/settings.gradle") or isfile(d .. "/settings.gradle.kts") then
      return d
    end
    if isfile(d .. "/build.gradle") or isfile(d .. "/build.gradle.kts") then
      return climb_for_settings(d) or d
    end
    if isfile(d .. "/pom.xml") then
      return climb_pom(d)
    end
    if
      isfile(d .. "/package.json")
      or isfile(d .. "/go.mod")
      or isfile(d .. "/pyproject.toml")
      or isdir(d .. "/venv")
      or isfile(d .. "/Cargo.toml")
    then
      return d
    end
    d = parent(d)
  end

  return nil
end

return M
