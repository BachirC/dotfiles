local vimp = require("vimp")
local ts = require("telescope.builtin")

-- Basic key mapping
vimp.nnoremap("<leader><Space>", function()
	-- Include hidden files and symlinks
	ts.find_files({ hidden = true, follow = true })
end)
vimp.nnoremap("<leader>g", function()
	ts.live_grep({ hidden = true })
end)
vimp.nnoremap("<leader>b", function()
	ts.buffers()
end)

local actions = require("telescope.actions")
require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = false,
		},
	},
	defaults = {
		mappings = {
			i = {
				["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
			n = {
				["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "🔍 ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			preview_cutoff = 80,
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "mock", "cassettes" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		theme = "dropdown",
		scroll_strategy = "cycle",

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
	pickers = {
		-- Special builtin config goes in here
		buffers = {
			sort_lastused = true,
			theme = "dropdown",
			previewer = false,
		},
		find_files = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
	},
})
