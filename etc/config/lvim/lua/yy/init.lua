local local_dir = vim.env.HOME .. "/.local"

local M = {}

function M:initialize()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.g.node_host_prog = local_dir .. "/node_modules/.bin/neovim-node-host"
    vim.g.python3_host_prog = local_dir .. "/venv/bin/python3"
    vim.g.ruby_host_prog = local_dir .. "/bin/neovim-ruby-host"

    if lvim then
        if vim.g.neovide then
            lvim.colorscheme = "lunar"
            vim.opt.guifont = ""
        else
            lvim.colorscheme = "solarized"
            lvim.transparent_window = true
        end
    else
        vim.g.mapleader = " "
    end

    return M
end

local function is_table(value)
    return type(value) == "table"
end

local set_keymap
if lvim then
    M.lualine = require("yy.lualine")

    local mode_adapters = {
        normal_mode = "mappings",
        visual_mode = "vmappings",
    }

    function set_keymap(mode, key, value)
        if is_table(value) then
            lvim.builtin.which_key[mode_adapters[mode]][key] = value
        else
            lvim.keys[mode][key] = value
        end
    end
else
    local mode_adapters = {
        insert_mode = "i",
        normal_mode = "n",
        term_mode = "t",
        visual_mode = "v",
        visual_block_mode = "x",
        command_mode = "c",
    }
    local keymap_opts = {
        noremap = true,
        silent = true,
    }

    function set_keymap(mode, key, value)
        if is_table(value) then
            vim.api.nvim_set_keymap(mode_adapters[mode], "<Leader>" .. key, value[1], keymap_opts)
        else
            vim.api.nvim_set_keymap(mode_adapters[mode], key, value, keymap_opts)
        end
    end
end

local function set_keymaps(keymaps)
    for mode, maps in pairs(keymaps) do
        for key, value in pairs(maps) do
            set_keymap(mode, key, value)
        end
    end
end

function M:finalize()
    set_keymaps({
        insert_mode = {
            ["<M-A>s"] = "<C-o><Cmd>up<CR>",
        },
        normal_mode = {
            ["<M-A>a"] = "ggVG",
            ["<M-A>s"] = "<Cmd>up<CR>",
            ["<M-A>z"] = "u",
            ["<M-A>Z"] = "<C-R>",
            ["<Space>"] = { "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>", "Fold Toggle" },
        },
        visual_mode = {
            ["<M-A>c"] = '"+y',
        },
    })

    if vim.g.neovide then
        set_keymaps({
            insert_mode = {
                ["<D-s>"] = "<C-o><Cmd>up<CR>",
                ["<D-v>"] = '<C-o>"+p',
            },
            normal_mode = {
                ["<D-a>"] = "ggVG",
                ["<D-s>"] = "<Cmd>up<CR>",
                ["<D-v>"] = '"+p',
                ["<D-z>"] = "u",
                ["<S-D-z>"] = "<C-R>",
            },
            visual_mode = {
                ["<D-c>"] = '"+y',
            },
        })
    end

    vim.opt.clipboard = ""
    vim.opt.cmdheight = 1
    vim.opt.fileencodings = "ucs-bom,utf-8,gb18030,big5,default,latin1"
    vim.opt.foldmethod = "marker"
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.tagfunc = "v:lua.vim.lsp.tagfunc"
end

function M.list_extend(dst, src)
    vim.list_extend(dst, src, 1, #src)
end

return M
