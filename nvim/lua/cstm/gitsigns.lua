local gitsigns = require("gitsigns")

local on_attach = function(bufnr)
	local function map(mode, lhs, rhs, opts)
		opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
		vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
	end

	map("n", "]s", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
	map("n", "[s", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
	map("n", "<leader>sr", "<cmd>Gitsigns reset_hunk<CR>")
	map("n", "<leader>sS", "<cmd>Gitsigns stage_hunk<CR>")
	map("n", "<leader>su", "<cmd>Gitsigns undo_stage_hunk<CR>")
	map("n", "<leader>sb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
end

gitsigns.setup({ on_attach = on_attach })
