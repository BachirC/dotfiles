local options = { noremap = true, silent = true }

local on_attach = function(client)
	if not client.resolved_capabilities.implementation then return end

	vim.api.nvim_buf_set_keymap(0, "n", "<C-\\>", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
end

return {
	on_attach = on_attach,
}
