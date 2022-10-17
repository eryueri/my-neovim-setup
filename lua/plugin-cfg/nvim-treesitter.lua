local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("nvim-treesitter not found")
  return 
end

treesitter.setup({
  ensure_installed = {"bash", "c", "cmake", "cpp", "glsl", "java", "lua", "python", "rust"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },
  indent = {
    enable = false,
  },
})
