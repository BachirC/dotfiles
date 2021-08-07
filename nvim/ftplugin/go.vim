" autocmd BufWritePre *.go lua require'plugins.lsp'.format_and_organize_imports
autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
