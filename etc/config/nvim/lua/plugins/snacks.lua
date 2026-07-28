--- Snacks.image 依赖 kitty graphics protocol，只在支持的终端里启用。
--- neovide 目前不支持该协议（PR neovide#3039 仍是 draft，且依赖 snacks 的 fork），
--- 而它会继承启动它的终端的 $TERM_PROGRAM，所以必须显式排除。
local function supports_graphics()
  if vim.g.neovide then
    return false
  end
  local term, term_program = vim.env.TERM, vim.env.TERM_PROGRAM
  local ghostty = term_program == "ghostty" or term == "xterm-ghostty"
  local kitty = vim.env.KITTY_WINDOW_ID ~= nil or term == "xterm-kitty"
  return ghostty or kitty
end

if not supports_graphics() then
  return {}
end

---@type LazySpec
return {
  { "snacks.nvim", opts = { image = { enabled = true } } },
}
