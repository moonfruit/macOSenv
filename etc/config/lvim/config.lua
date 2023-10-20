local yy = require("yy"):initialize()

--- Vim options
vim.opt.relativenumber = true

--- General
lvim.log.level = "info"
lvim.format_on_save = true
-- lvim.format_on_save = {
--   enabled = true,
--   pattern = "*.lua",
--   timeout = 1000,
-- }
--- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

--- Change theme settings
-- lvim.colorscheme = "lunar"
-- lvim.colorscheme = "tokyonight"
-- lvim.colorscheme = "solarized"

-- Key mappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
--- Add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

--- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["n"] = { "<Cmd>BufferLineCycleNext<CR>", "Next Buffer" }
lvim.builtin.which_key.mappings["N"] = { "<Cmd>BufferLineCyclePrev<CR>", "Previous Buffer" }
lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
lvim.builtin.which_key.mappings["T"]["n"] = { "<Cmd>TSInstallInfo<CR>", "InstallInfo" }
lvim.builtin.which_key.mappings["T"]["t"] = { "<Cmd>TSToggle<CR>", "Toggle" }
lvim.builtin.which_key.mappings["T"]["u"] = { "<Cmd>TSUpdate<CR>", "Update" }

lvim.builtin.nvimtree.setup.filters.dotfiles = true

--- Always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }
-- lvim.builtin.treesitter.ignore_install = { "gitcommit" }

-- Generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

--- Disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false
lvim.lsp.installer.setup.automatic_installation = {
    exclude = {
        "bashls",
        "clangd",
        "cssls",
        "eslint",
        "gopls",
        "html",
        "jdtls",
        "jsonls",
        "lua_ls",
        "marksman",
        "pyright",
        "solargraph",
        "sumneko_lua",
        "tailwindcss",
        "taplo",
        "tsserver",
        "yamlls",
    },
}

--- Configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
--- see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "solargraph" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

--- Remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
--- `:LvimInfo` lists which server(s) are skipped for the current filetype
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
    return server ~= "ruby_ls"
end, lvim.lsp.automatic_configuration.skipped_servers)

--- You can set a custom on_attach function that will be used for all the language servers
--- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --- Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

--- Linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
    { command = "shfmt" },
    { command = "black", extra_args = { "--line-length", "120" } },
    { command = "prettier", extra_args = { "--print-width", "120" } },
    { command = "stylua", extra_args = { "--indent-type", "Spaces" } },
    -- { command = "swift-format", extra_args = { "--assume-filename", "$FILENAME" }, filetypes = { "swift" } },
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
    {
        command = "codespell",
        disabled_filetypes = { "c", "cpp", "objc", "objcpp" },
        extra_args = { "--builtin", "clear,rare,code", "--ignore-words", get_config_dir() .. "/dictionary.txt" },
    },
    -- { command = "shellcheck", extra_args = { "--severity", "warning" } }, -- included by bashls
    { command = "flake8", extra_args = { "--max-line-length=120" } },
    { command = "eslint" },
})

--- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    "ishan9299/nvim-solarized-lua",
    "folke/tokyonight.nvim",
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    {
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
                lastplace_open_folds = true,
            })
        end,
    },
    "udalov/kotlin-vim",
    "TovarishFin/vim-solidity",
}

--- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

--- Plugin: lualine
local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_x = {
    components.diagnostics,
    components.treesitter,
    components.lsp,
    components.spaces,
    components.filetype,
    yy.lualine.encoding,
    yy.lualine.fileformat,
}

--- Plugin: which-key
lvim.builtin.which_key.setup.plugins.marks = true
lvim.builtin.which_key.setup.plugins.registers = true
lvim.builtin.which_key.setup.plugins.presets.operators = true
lvim.builtin.which_key.setup.plugins.presets.motions = true
lvim.builtin.which_key.setup.plugins.presets.text_objects = true
lvim.builtin.which_key.setup.plugins.presets.windows = true
lvim.builtin.which_key.setup.plugins.presets.nav = true
lvim.builtin.which_key.setup.plugins.presets.z = true
lvim.builtin.which_key.setup.plugins.presets.g = true

yy:finalize()
