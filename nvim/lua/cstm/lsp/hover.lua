local vimp = require('vimp')

local on_attach = function(_)
	vimp.nnoremap('K', function() vim.lsp.buf.hover() end)
end

return {
	on_attach = on_attach,
}

