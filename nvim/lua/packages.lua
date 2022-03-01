local spec = function()
	-- Packer
	use("wbthomason/packer.nvim")

	use({
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("cstm.gitlinker")
		end,
	})

	-- Dim inactive windows
	use("blueyed/vim-diminactive")

	-- Enhanced surrounding characters manipulation
	use("tpope/vim-surround")

	-- More intuitive navigation
	use("tpope/vim-unimpaired")

	-- Autoclose code tags
	use("windwp/nvim-ts-autotag")

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("cstm.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- colorscheme
	use("alessandroyorba/despacio")

	-- Search files
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = function()
			require("cstm.telescope")
		end,
	})

	-- Vim-api wrapper
	use("svermeulen/vimpeccable")

	use({
		"hoob3rt/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto", -- or "auto"
				},
			})
		end,
	})

	-- Code highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("cstm.treesitter")
		end,
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("cstm.lsp")
		end,
	})

	-- Github wrapper
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("cstm.gitsigns")
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip" },
		},
		config = function()
			require("cstm.cmp")
		end,
	})
end

require("packer").startup(spec)
