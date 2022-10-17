vim.g.mapleader=" "

local opt = {
  noremap = true,
  silent = true
}

local map = vim.api.nvim_set_keymap

-- moving cursor quicker
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)

-- indent in visual mode
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
