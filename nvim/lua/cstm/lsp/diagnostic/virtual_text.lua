local virtual_text = {}

virtual_text.show = true

virtual_text.toggle = function()
	virtual_text.show = not virtual_text.show
	local bufnr = 0
	local client_id = 1
	-- Display diagnostics from the cache in current buffer (0) for client 1.
	vim.lsp.diagnostic.display(
		vim.lsp.diagnostic.get(bufnr, client_id),
		bufnr,
		client_id,
		{virtual_text = virtual_text.show}
	)
end

return virtual_text
