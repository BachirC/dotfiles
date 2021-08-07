local system_name

local nvim_lsp = require('lspconfig')

local lua_ls_path = "/usr/local/opt/lua-language-server"

local setup = function(on_attach)
	nvim_lsp.sumneko_lua.setup {
		-- TODO: Use a variable for the os
		on_attach = on_attach,
		cmd = {lua_ls_path .. "/bin/macOS/lua-language-server", "-E", lua_ls_path.."/main.lua"};
		settings = {
			Lua = {
				diagnostics = {
					enable = true,
					-- Get the language server to recognize the `vim` global
					globals = {'vim', 'use'},
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	}
end

return { setup = setup }
