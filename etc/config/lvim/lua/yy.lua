local local_dir = vim.env.HOME .. "/.local"

local M = {}

function M:init()
    vim.g.python3_host_prog = local_dir .. "/venv/bin/python3"

    if not lvim then
        vim.g.mapleader = " "
    end

    return M
end

function M:finalize()
    local keymap_opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("s", "<LeftRelease>", '"*ygv', keymap_opts)

    if lvim then
        lvim.keys.normal_mode["<Esc><Esc>"] = ":nohlsearch<cr>"
        lvim.keys.visual_mode["<LeftRelease>"] = '"*ygv'

        lvim.builtin.which_key.mappings["<Space>"] = { "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>", "Fold Toggle" }
        lvim.builtin.which_key.mappings["n"] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" }
        lvim.builtin.which_key.mappings["N"] = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" }
    else
        vim.api.nvim_set_keymap("n", "<C-s>", ":w<cr>", keymap_opts)

        vim.api.nvim_set_keymap("n", "<Esc><Esc>", ":nohlsearch<cr>", keymap_opts)
        vim.api.nvim_set_keymap("n", "<Leader><Space>", "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>", keymap_opts)
        vim.api.nvim_set_keymap("v", "<LeftRelease>", '"*ygv', keymap_opts)
    end

    vim.opt.clipboard = "unnamedplus"
    vim.opt.cmdheight = 1
    vim.opt.fileencodings = "ucs-bom,utf-8,chinese,default,latin1"
    vim.opt.foldmethod = "marker"
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.tagfunc="v:lua.vim.lsp.tagfunc"

end

return M
