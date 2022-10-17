-- utf8
vim.g.encoding="UTF-8"
vim.o.fileencoding="utf-8"
-- show line number and relative line number
vim.o.number=true
vim.o.relativenumber=true
-- ramain 8 rows when moving cursor using 'j/k'
vim.o.scrolloff=8
vim.o.sidescrolloff=8
-- ignorecase during search unless UPPERCASE is used
vim.o.ignorecase=true
vim.o.smartcase=true
vim.o.showmatch=true
-- use space instead of tab and each tab equals to 2 space
vim.o.expandtab=true
vim.o.tabstop=2
vim.o.softtabstop=2
vim.o.shiftwidth=2
-- auto indent kind of thing
vim.o.autoindent=true
vim.o.smartindent=true
vim.o.smarttab=true
-- no search highlight and search while typing
vim.o.hlsearch=false
vim.o.incsearch=true
-- set 400ms limit to trigger a combine key
-- vim.o.timeoutlen=400

-- set mouse only work in normal node
vim.o.mouse=n

-- to limit the height of a popup window
vim.o.pumheight=7
