local spec = function()
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Search files
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() require('plugins/telescope') end
  }

  -- Vim-api wrapper
  use 'svermeulen/vimpeccable'

  -- Color scheme
  -- use 'morhetz/gruvbox'
  use {
    'marko-cerovac/material.nvim',
    config = function() require('plugins/material') end
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
		run = ':TSUpdate',
		config = function() require('plugins/lsp') end
  }

  -- Code highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
		config = function() require('plugins/treesitter') end
  }
end

require('packer').startup(spec)

