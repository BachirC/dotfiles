local vimp = require('vimp')

local on_attach = function(client)
	if not client.resolved_capabilities.implementation then return end

	vimp.nnoremap('gi', function() vim.lsp.buf.implementation() end)
end

return {
	on_attach = on_attach,
}
