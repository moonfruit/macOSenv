-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

if vim.g.neovide then
    vim.opt.guifont = "JetBrainsMono Nerd Font"
end

vim.opt.clipboard = ""
vim.opt.fileencodings = "ucs-bom,utf-8,gb18030,big5,default,latin1"
vim.opt.list = true
vim.opt.listchars = "tab:<->,trail:.,nbsp:+,extends:>,precedes:<"
vim.opt.shiftwidth = 4
vim.opt.spelllang = { "en", "cjk" }
vim.opt.tabstop = 4
