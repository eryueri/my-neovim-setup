local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  vim.notify("nvim-autopairs not found")
  return
end

autopairs.setup({
  map_cr = true,
  fast_wrap = {
    map = "<A-e>"
  },
})
