if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason
local function remove(array, item)
  for i = #array, 1, -1 do
    if array[i] == item then
      table.remove(array, i)
    end
  end
end

local function remove_all(array, items)
  vim.print(vim.inspect(array))
  for _, item in ipairs(items) do
    remove(array, item)
  end
end

---@type LazySpec
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      remove_all(opts.ensure_installed, {
        -- Docker
        "hadolint",
        -- Go
        "gofumpt",
        "goimports",
        "gomodifytags",
        "impl",
        -- Javascript
        "biome",
        "prettier",
        -- Kotlin
        "ktlint",
        -- Lua
        "stylua",
        -- Markdown
        "markdown-toc",
        "markdownlint-cli2",
        -- Python
        "black",
        -- Ruby
        "erb-formatter",
        "erb-lint",
        -- Shell
        "shellcheck",
        "shfmt",
        -- SQL
        "sqlfluff",
      })
    end,
  },
  -- use mason-tool-installer for automatically installing Mason packages
  -- {
    -- "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    -- opts = {
      -- Make sure to use the names found in `:Mason`
      -- ensure_installed = {
        -- install language servers
        -- "lua-language-server",
        -- install formatters
        -- "stylua",
        -- install debuggers
        -- "debugpy",
        -- install any other package
        -- "tree-sitter-cli",
      -- },
    -- },
  -- },
}
