local options = { noremap = true, silent = true }

local on_attach = function(_)
	vim.api.nvim_buf_set_keymap(0, "n", "<C-\\>", "<cmd>lua vim.lsp.buf.references()<CR>", options)
end

return {
	on_attach = on_attach,
}
