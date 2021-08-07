local options = { noremap = true, silent = true }

local on_attach = function(_)
	vim.api.nvim_buf_set_keymap(0, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
end

return {
	on_attach = on_attach,
}

