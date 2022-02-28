local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local setup = function(on_attach, capabilities)
	local on_local_attach = function(client, bufnr)
		on_attach(client, bufnr)
	end

	local cmd = { "lua-language-server" }
	local settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				enable = true,
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "use" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				preloadFileSize = 1000,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	}

	require("lspconfig").sumneko_lua.setup({
		settings = settings,
		on_attach = on_local_attach,
		cmd = cmd,
		capabilities = capabilities,
	})
end

return { setup = setup }
