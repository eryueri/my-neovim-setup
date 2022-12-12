colorscheme = "tokyonight"
require("tokyonight").setup({
  style = "day",
})

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("colorscheme: " .. colorscheme .. " not found!")
  return
end
