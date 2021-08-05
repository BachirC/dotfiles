local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	require('completion')

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  --Defined in Telescope: buf_set_keymap('n', '<leader>td', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>th', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --Defined in Telescope: buf_set_keymap('n', '<leader>ki', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>ts', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --Defined in Telescope: buf_set_keymap('n', '<leader>kt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>tn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --buf_set_keymap('n', '<leader>kr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>tc', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
  buf_set_keymap('n', '<leader>to', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
  buf_set_keymap("n", "<leader>tf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  buf_set_keymap('n', '<leader>te', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<leader>tl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<leader>tx", "<cmd>lua vim.lsp.diagnostic.clear(0)<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {"gopls", "solargraph"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Options
vim.g.completion_enable_auto_popup = 0

-- Key mappings
local vimp = require('vimp')

vimp.imap('<TAB>', '<Plug>(completion_smart_tab)')
vimp.imap('<S-TAB>', '<Plug>(completion_smart_s_tab)')
