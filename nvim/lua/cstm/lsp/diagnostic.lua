local options = { noremap = true, silent = true }
local on_attach = function(_)
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end
	vim.diagnostic.config({
		virtual_text = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})

	-- Initialize toggle flag.
	vim.b.lsp_diagnostic_enabled = true

	-- Toggle diagnostics for current buffer.
	vim.api.nvim_buf_set_keymap(
		0,
		"n",
		"<leader>dt",
		"<cmd>lua require('cstm.lsp.diagnostic.toggle').call()<CR>",
		options
	)
	-- Go to next diagnostic.
	vim.api.nvim_buf_set_keymap(0, "n", "<leader>dn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR> zz", options)
	-- Go to previous diagnostic.
	vim.api.nvim_buf_set_keymap(0, "n", "<leader>dp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR> zz", options)
	-- Display list of diagnostics of the given line.
	vim.api.nvim_buf_set_keymap(
		0,
		"n",
		"<leader>ds",
		"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
		options
	)
end

return {
	on_attach = on_attach,
}
