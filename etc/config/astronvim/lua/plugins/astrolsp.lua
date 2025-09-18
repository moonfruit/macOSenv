-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    native_lsp_config = true,
    -- Configuration table of features provided by AstroLSP
    features = {
      codelens = true,        -- enable/disable codelens refresh on start
      inlay_hints = true,     -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- Customize lsp formatting options
    formatting = {
      -- Control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        -- allow_filetypes = { -- enable format on save for specified filetypes only
        --   "go",
        -- },
        -- ignore_filetypes = { -- disable format on save for specified filetypes
        --   "python",
        -- },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        "basedpyright",
        "bashls",
        "gopls",
        "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- Enable servers that you already have installed without mason
    servers = {
      "basedpyright",
      "bashls",
      "clangd",
      "cssls",
      "denols",
      "dockerls",
      "eslint",
      "gopls",
      "helm_ls",
      "html",
      "jsonls",
      "kotlin_language_server",
      "lua_ls",
      "marksman",
      "ruff",
      "ruby_lsp",
      "tailwindcss",
      "taplo",
      "yamlls",
    },
    -- Customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      bashls = {
        settings = {
          bashIde = {
            shellcheckArguments = "--external-sources",
          },
        },
      },
      lemminx = {
        settings = {
          maxLineWidth = 120,
        },
      },
      ruff = {
        capabilities = {
          general = {
            positionEncodings = { "utf-16" }
          },
        },
        init_options = {
          settings = {
            lineLength = 120,
          },
        },
      },
    },
    -- Configure how language servers are attached
    -- handlers = {
    --   -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
    --   -- function(server, opts) require("lspconfig")[server].setup(opts) end
    --   -- the key is the server that is being setup with `lspconfig`
    --   -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
    --   -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
    -- },
  },
}
