local M = {
  "ishan9299/nvim-solarized-lua",
  "ellisonleao/gruvbox.nvim",
}

local colorscheme = nil
if not vim.neovide then
  if vim.env.COLORTERM ~= "truecolor" then
    colorscheme = "gruvbox"
  elseif vim.env.LC_TERMINAL == "iTerm2" then
    -- colorscheme = "solarized"
    if vim.env.ITERM_PROFILE == "dark" then
      colorscheme = "habamax"
    end
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
