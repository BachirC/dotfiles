local vimp = require('vimp')

local on_attach = function(_)
	vimp.nnoremap('<leader>rn', function() vim.lsp.buf.rename() end)
end

return {
	on_attach = on_attach,
}

