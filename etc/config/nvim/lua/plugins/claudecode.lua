-- 覆盖 LazyVim 的 `lazyvim.plugins.extras.ai.claudecode`：
--   1. 非懒加载——extra 因为挂了 `keys`，默认会被懒加载。
--   2. monkey patch `lockfile.get_workspace_folders`：把写入 IDE lock 文件
--      （~/.claude/ide/<port>.lock 的 workspaceFolders）里原本的 getcwd() 那一项
--      替换为项目根；找不到项目根时回退到 getcwd()。其余 LSP workspace folders 保留。
return {
  "coder/claudecode.nvim",
  -- 目标 1：不懒加载。用 VimEnter 而非 lazy=false：不阻塞启动，且在 cwd
  -- 安定（启动 autocmd 全部跑完）后再算项目根、写 lock 文件。
  event = "VimEnter",
  -- 覆盖 extra 默认的 config（`require("claudecode").setup(opts)`），在 setup 前打补丁。
  config = function(_, opts)
    local lockfile = require("claudecode.lockfile")
    local project = require("yy.project")

    -- `lockfile.create()` 通过 `M.get_workspace_folders()` 动态调用本函数，
    -- 因此替换模块字段即可，与 server 的 auto_start 时机无关。
    local get_workspace_folders = lockfile.get_workspace_folders
    lockfile.get_workspace_folders = function()
      local folders = get_workspace_folders()
      local cwd = vim.fn.getcwd()
      local root = project.root(cwd) or cwd

      local out, seen = {}, {}
      local function add(p)
        if p and p ~= "" and not seen[p] then
          seen[p] = true
          out[#out + 1] = p
        end
      end

      add(root) -- 用项目根替换原来的 getcwd 项
      for _, folder in ipairs(folders) do
        if folder ~= cwd then -- 丢弃原 cwd 项，保留其余（LSP workspace folders）
          add(folder)
        end
      end
      return out
    end

    require("claudecode").setup(opts)
  end,
}
