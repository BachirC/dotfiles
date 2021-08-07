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
