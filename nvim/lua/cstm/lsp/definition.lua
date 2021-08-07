local vimp = require('vimp')

local on_attach = function(_)
	vimp.nnoremap('gd', function() vim.lsp.buf.definition() end)
end

return {
	on_attach = on_attach,
}
