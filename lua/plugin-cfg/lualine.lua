local ok, lualine = pcall(require, "lualine")
if not ok then 
  vim.notify("lualine not found")
  return
end

lualine.setup({
  options = {
    theme = "tokyonight",
    globalstatus = true,
  },
  extensions = { "nvim-tree" },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location', 'filesize'}
  },
})
