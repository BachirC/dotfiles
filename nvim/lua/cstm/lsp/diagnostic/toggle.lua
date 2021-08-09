local function call()
	-- current buffer
	local bufnr = 0

	-- toggle all active clients
	local clients = vim.lsp.get_active_clients()

	if vim.b.lsp_diagnostic_enabled then
		for _, client in pairs(clients) do
			vim.lsp.diagnostic.disable(bufnr, client.id)
		end
	else
		for _, client in pairs(clients) do
		  vim.lsp.diagnostic.enable(bufnr, client.id)
		end
	end

	vim.b.lsp_diagnostic_enabled = not vim.b.lsp_diagnostic_enabled
end

return {
	call = call,
}
