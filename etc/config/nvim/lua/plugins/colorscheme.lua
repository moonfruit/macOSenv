local M = {
  "ishan9299/nvim-solarized-lua",
  "ellisonleao/gruvbox.nvim",
}

local colorscheme = nil
if not vim.neovide then
  if vim.env.COLORTERM ~= "truecolor" then
    vim.opt.termguicolors = false
    colorscheme = "retrobox"
  elseif vim.env.LC_TERMINAL == "iTerm2" then
    colorscheme = "catppuccin"
  end
end

if colorscheme then
  table.insert(M, {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = colorscheme,
    },
  })
end

return M
