local options = { noremap = true, silent = true }

local on_attach = function(_)
  -- Toggle diagnostics for current buffer.
	vim.api.nvim_buf_set_keymap(0, "n", "<leader>dt", "<cmd>lua require('cstm.lsp.diagnostic.virtual_text').toggle()<CR>", options)
end

return {
	on_attach = on_attach,
}

