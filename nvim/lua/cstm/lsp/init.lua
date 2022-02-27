local on_attach = function(client)
	require("cstm.lsp.definition").on_attach(client)
	require("cstm.lsp.diagnostic").on_attach(client)
	require("cstm.lsp.hover").on_attach(client)
	require("cstm.lsp.implementation").on_attach(client)
	require("cstm.lsp.references").on_attach(client)
	require("cstm.lsp.rename").on_attach(client)
	require("cstm.lsp.code_action").on_attach(client)

	print("lsp: Attaching to client " .. client.name)
end

local capabilities = require("cstm.lsp.completion").capabilities

local servers = {
	"tsserver",
	"sumneko_lua",
}

for _, server in ipairs(servers) do
	local module = "cstm.lsp.server." .. server
	require(module).setup(on_attach, capabilities)
end

-- List of lsp capabilities defined in neovim:
-- https://github.com/neovim/neovim/blob/master/runtime/lua/vim/lsp/protocol.lua
