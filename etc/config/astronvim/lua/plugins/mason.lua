-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

local function remove(array, item)
  for i = #array, 1, -1 do
    if array[i] == item then
      table.remove(array, i)
    end
  end
end

local function remove_all(array, items)
  for _, item in ipairs(items) do
    remove(array, item)
  end
end

local list_insert_unique = require("astrocore").list_insert_unique

---@type LazySpec
return {
  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   opts = {
  --     ensure_installed = { "rubocop" },
  --   }
  -- },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   opts = {
  --     ensure_installed = { "rubocop" },
  --   }
  -- },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      remove_all(opts.ensure_installed, {
        -- Bash
        "bash-language-server",
        "shellcheck",
        "shfmt",
        -- CPP
        "clangd",
        -- CSS
        "css-lsp",
        -- Docker
        "dockerfile-language-server",
        "hadolint",
        -- ESLint
        "eslint-lsp",
        -- Go
        "delve",
        "gopls",
        "gomodifytags",
        "gotests",
        "impl",
        "goimports",
        -- Helm
        "helm-ls",
        -- HTML
        "html-lsp",
        -- Javascript
        "deno",
        -- JSON
        "json-lsp",
        -- Lua
        "lua-language-server",
        "stylua",
        "selene",
        -- Kotlin
        "kotlin-language-server",
        "ktlint",
        -- Markdown
        "marksman",
        -- Prettier
        "prettierd",
        -- Python
        "basedpyright",
        "ruff",
        -- Ruby
        "solargraph",
        "standardrb",
        -- SQL
        "sqlfluff",
        -- Tailwindcss
        "tailwindcss-language-server",
        -- TOML
        "taplo",
        -- YAML
        "yaml-language-server",
      })
      -- list_insert_unique(opts.ensure_installed, { "rubocop" })
    end,
  },
}
