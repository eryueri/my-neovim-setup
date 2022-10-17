vim.g.mapleader=" "

local opt = {
  noremap = true,
  silent = true
}

local map = vim.api.nvim_set_keymap

-- unbind 'q' for i don't use its origin function
-- and make leader+q become Esc in insert mode
map("n", "q", "", opt)
map("i", "<C-q>", "<ESC>", opt)

-- about save file
map("n", "<leader>w", ":w<CR>", opt)

-- about exit
map("n", "qq", ":q!<CR>", opt)
map("n", "<leader>q", ":wq<CR>", opt)

-- moving cursor quicker
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)

map("n", "<C-d>", "10j", opt)
map("n", "<C-u>", "10k", opt)

-- indent in visual mode
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- to move selected text in visual mode
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- about multiwindows
map("n", "s", "", opt) -- unbind 's'
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

-- close windows
map("n", "sc", "<C-w>c", opt) -- close self
map("n", "so", "<C-w>o", opt) -- close others

-- jump between windows
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -10<CR>", opt)
map("n", "s.", ":vertical resize +10<CR>", opt)

-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)

-- 相等比例
map("n", "s=", "<C-w>=", opt)

-- terminal
map("n", "st", ":sp | terminal<CR>", opt)
map("n", "stv", ":vsp | terminal<CR>", opt)

-- plugin shortcuts

-- nvim-tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)

-- bufferline
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
-- map("n", "<leader>bc", ":Bdelete!<CR>", opt)
-- map("n", "<C-w>", ":Bdelete!<CR>", opt)
-- 关闭左/右侧标签页
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- 关闭其他标签页
map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
-- 关闭选中标签页
map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)
-- toggleterm settings
map("n", "<leader>tf", ":ToggleTerm direction=float<CR>", opt)
map("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", opt)
map("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", opt)
map("t", "<ESC>", "<C-\\><C-n>", opt)
