local local_dir = vim.env.HOME .. "/.local"

local M = {}

function M:init()
    vim.g.python3_host_prog = local_dir .. "/venv/bin/python3"

    if not lvim then
        vim.g.mapleader = " "
    end

    return M
end

local set_keymap
if lvim then
    local mode_adapters = {
        normal_mode = "mappings",
        visual_mode = "vmappings",
    }

    function set_keymap(mode, key, value)
        if type(value) == "table" then
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
        if type(value) == "table" then
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
        normal_mode = {
            ["<C-S>"] = "<Cmd>w<CR>",
            ["<Space>"] = { "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>", "Fold Toggle" },
        },
        visual_mode = {
            ["<LeftRelease>"] = '"*ygv',
        },
    })

    if lvim then
        set_keymaps({
            normal_mode = {
                n = { "<Cmd>BufferLineCycleNext<CR>", "Next Buffer" },
                N = { "<Cmd>BufferLineCyclePrev<CR>", "Previous Buffer" },
            },
        })
    end

    vim.opt.clipboard = "unnamedplus"
    vim.opt.cmdheight = 1
    vim.opt.fileencodings = "ucs-bom,utf-8,chinese,default,latin1"
    vim.opt.foldmethod = "marker"
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.tagfunc = "v:lua.vim.lsp.tagfunc"
end

return M