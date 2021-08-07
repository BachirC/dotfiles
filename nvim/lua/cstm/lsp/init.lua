local servers = {
	'gopls',
	'solargraph',
	'sumneko_lua',
}

for _, server in ipairs(servers) do
	local module = 'cstm.lsp.server.' .. server
	require(module).setup()
end

-- Options
vim.g.completion_enable_auto_popup = 0

-- Key mappings
--local vimp = require('vimp')

--vimp.imap('<TAB>', '<Plug>(completion_smart_tab)')
--vimp.imap('<S-TAB>', '<Plug>(completion_smart_s_tab)')
