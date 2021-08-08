local options = { noremap = true, silent = true }

local on_attach = function(_)
	-- Initialize toggle flag.
	vim.b.lsp_diagnostic_enabled = true

  -- Toggle diagnostics for current buffer.
	vim.api.nvim_buf_set_keymap(0, "n", "<leader>dt", "<cmd>lua require('cstm.lsp.diagnostic.toggle').call()<CR>", options)
end

return {
	on_attach = on_attach,
}

