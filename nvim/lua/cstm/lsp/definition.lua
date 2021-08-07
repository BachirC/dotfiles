local options = { noremap = true, silent = true }

local on_attach = function(client)
	if not client.resolved_capabilities.goto_definition then return end

	vim.api.nvim_buf_set_keymap(0, "n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
end

return {
	on_attach = on_attach,
}
