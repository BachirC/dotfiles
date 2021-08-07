local spec = function()
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Search files
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() require('cstm.telescope') end
  }

  -- Vim-api wrapper
  use 'svermeulen/vimpeccable'

  -- Color scheme
  use {
    'marko-cerovac/material.nvim',
    config = function() require('cstm.material') end
  }

	-- Completion
	use {
		'nvim-lua/completion-nvim'
	}

  -- Code highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
		config = function() require('cstm.treesitter') end
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
		run = ':TSUpdate',
		config = function() require('cstm.lsp') end
  }

	-- Github wrapper
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('gitsigns').setup()
		end
	}
end

require('packer').startup(spec)
