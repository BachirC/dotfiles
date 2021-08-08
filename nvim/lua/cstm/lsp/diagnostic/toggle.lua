local function call()
	-- current buffer and client
	local bufnr = 0
	local client_id = 1

	if vim.b.lsp_diagnostic_enabled then
		vim.lsp.diagnostic.disable(bufnr, client_id)
	else
		vim.lsp.diagnostic.enable(bufnr, client_id)
	end

	vim.b.lsp_diagnostic_enabled = not vim.b.lsp_diagnostic_enabled
end

return {
	call = call,
}
