local local_dir = vim.env.HOME .. "/.local"

local M = {}

function M:initialize()
    vim.g.python3_host_prog = local_dir .. "/venv/bin/python3"

    if not lvim then
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

local function get_plugin_location(plugin)
    if is_table(plugin) then
        return plugin[1]
    else
        return plugin
    end
end

local function append_plugin(plugins, plugin)
    local location = get_plugin_location(plugin)
    for _, item in pairs(plugins) do
        if get_plugin_location(item) == location then
            return
        end
    end
    table.insert(plugins, plugin)
end

local colorscheme_plugins = {
    solarized = "ishan9299/nvim-solarized-lua",
    tokyonight = "folke/tokyonight.nvim",
}

function M:finalize()
    set_keymaps({
        normal_mode = {
            ["<C-S>"] = "<Cmd>w<CR>",
            ["<Space>"] = { "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>", "Fold Toggle" },
        },
        visual_mode = {
            ["<LeftRelease>"] = '"+ygv',
        },
    })

    if lvim then
        set_keymaps({
            normal_mode = {
                n = { "<Cmd>BufferLineCycleNext<CR>", "Next Buffer" },
                N = { "<Cmd>BufferLineCyclePrev<CR>", "Previous Buffer" },
            },
        })

        local plugin = colorscheme_plugins[lvim.colorscheme]
        if plugin then
            append_plugin(lvim.plugins, plugin)
        end
    end

    vim.opt.clipboard = ""
    vim.opt.cmdheight = 1
    vim.opt.fileencodings = "ucs-bom,utf-8,gb18030,big5,default,latin1"
    vim.opt.foldmethod = "marker"
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.tagfunc = "v:lua.vim.lsp.tagfunc"
end

return M
