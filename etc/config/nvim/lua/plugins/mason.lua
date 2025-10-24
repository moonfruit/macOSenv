local yy = require("yy")

local function disable_mason(servers, names)
  for _, name in ipairs(names) do
    local server = servers[name]
    if server then
      server.mason = false
    end
  end
end

---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      disable_mason(opts.servers, {
        -- Bash
        "bashls",
        -- C
        "clangd",
        -- CSS
        "cssls",
        "tailwindcss",
        -- Docker
        "dockerls",
        -- Go
        "gopls",
        -- Helm
        "helm_ls",
        -- HTML
        "html",
        -- Javascript
        "eslint",
        -- Json
        "jsonls",
        -- Kotlin
        "kotlin_language_server",
        -- Lua
        "lua_ls",
        -- Markdown
        "marksman",
        -- Python
        "basedpyright",
        "pyright",
        "ruff",
        -- Ruby
        "ruby_lsp",
        -- TOML
        "taplo",
        -- XML
        "lemminx",
        -- YAML
        "yamlls",
      })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      yy.remove_items(opts.ensure_installed, {
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
}
