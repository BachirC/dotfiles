-- ###### OPTIONS #######

-- Interface
vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'cursorline', true)
vim.api.nvim_buf_set_option(0, 'expandtab', true)
vim.api.nvim_set_option('hidden', true)
vim.api.nvim_set_option('tabstop', 2)
vim.api.nvim_set_option('shiftwidth', 2)
-- vim.cmd([[set tw=100]]) -- Maximum text width
-- vim.api.nvim_win_set_option(0, 'cc', '+1') -- Color column after text width

-- Don't bother drawing the screen while executing macros or other automated or
-- scripted processes, just draw the screen as it is when the operation " completes
vim.api.nvim_set_option('lazyredraw', true)

-- Use persistent history.
vim.api.nvim_set_option('undodir', '/tmp/.vim-undo-dir')
vim.api.nvim_set_option('undofile', true)



-- ##### KEY MAPPINGS #####
local vimp = require('vimp')

-- With karabiner mapping, this allows to use Tab for folding while not breaking <C-i> for forward jump.
vimp.nnoremap('<F6>', '<C-i>')

-- Quickfix list
vimp.nnoremap('<leader>cn', ':cnext<CR>')
vimp.nnoremap('<leader>cp', ':cprevious<CR>')
vimp.nnoremap('<leader>co', ':copen<CR>')
vimp.nnoremap('<leader>cc', ':cclose<CR>')
vimp.nnoremap('<leader>cx', ':cex []<CR>') -- Clear qf list

-- Open nvim conf folder
vimp.map('<leader>vm', ':e ~/dotfiles/nvim<CR>')
