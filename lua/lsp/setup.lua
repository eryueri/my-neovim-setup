local lspOk, lsp_cfg = pcall(require, "lspconfig")
if not lspOk then
  vim.notify("lspconfig not found!")
  return
end
local cmpOk, cmp = pcall(require, "cmp")
if not cmpOk then
  vim.notify("cmp not found!")
  return
end
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>dt', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<A-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local feedkeys = require'cmp.utils.feedkeys'

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  completion = { autocomplete = false, },
  window = {},
  mapping = cmp.mapping.preset.insert({
    ['<C-g>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-a>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(), }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<TAB>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn['vsnip#jumpable'](1) == 1 then
        feedkeys.call(t"<Plug>(vsnip-jump-next)", "")
      else
        fallback()
      end
    end, { 'i', 's', 'c' }), 
    ['<S-TAB>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        feedkeys.call(t"<Plug>(vsnip-jump-prev)", "")
      else
        fallback()
      end
    end, { 'i', 's', 'c' }), 
  }),
  sources = cmp.config.sources(
  {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  },
  {
    { name = 'buffer' },
  }
  ),
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_cfg.clangd.setup{
  on_attach = on_attach, 
  capabilities = capabilities, 
  flags = lsp_flags,
  cmd = { "clangd", "--header-insertion=never", "--completion-style=detailed" },
  settings = {
    ["--header-insertion-decorators"] = false,
  }
}

-- lsp_cfg.rust_analyzer.setup{
--   on_attach = on_attach, 
--   cmd = {"rust-analyzer"}, 
--   filetypes = {"rust"}, 
--   settings = {
--     ["rust-analyzer"] = {}
--   }
-- }
