local M = {
  "craftzdog/solarized-osaka.nvim",
  "navarasu/onedark.nvim",
}

local colorscheme = nil
if not vim.g.neovide then
  if vim.env.COLORTERM ~= "truecolor" then
    vim.opt.termguicolors = false
    colorscheme = "retrobox"
  -- elseif vim.env.TERM_PROGRAM == "iTerm.app" then
    -- colorscheme = "tokyonight"
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
