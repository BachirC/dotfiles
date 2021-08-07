local vimp = require('vimp')

local on_attach = function(_)
	vimp.nnoremap('gr', function() vim.lsp.buf.references() end)
end

return {
	on_attach = on_attach,
}
