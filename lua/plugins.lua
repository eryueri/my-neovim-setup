return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'folke/tokyonight.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 
      'kyazdani42/nvim-web-devicons', -- optional, for file icons 
    }
  }

  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    "akinsho/toggleterm.nvim", 
    tag = 'v2.*', 
    config = function()
      require("toggleterm").setup()
    end
  }

  use 'neovim/nvim-lspconfig'
  -- compelition
  use 'hrsh7th/cmp-nvim-lsp'
  -- use 'hrsh7th/cmp-buffer'
  -- use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

end)
