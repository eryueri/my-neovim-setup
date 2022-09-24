if exists('g:vscode')
	" VSCode extension
else
	" ordinary neovim
endif

lua require("basic")
lua require("keybindings")
lua require("plugins")
lua require("colorscheme")

lua require("plugin-cfg.nvim-tree")
lua require("plugin-cfg.bufferline")
lua require("plugin-cfg.nvim-treesitter")
lua require("plugin-cfg.comment")
lua require("plugin-cfg.nvim-autopairs")
lua require("plugin-cfg.lualine")
lua require("plugin-cfg.toggleterm")

lua require("lsp.setup")
