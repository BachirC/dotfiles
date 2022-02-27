vim.g.mapleader = " "

require("cstm.plugins")
require("cstm.basic")

vim.cmd([[colorscheme despacio]])
-- Fixes confusing highlighting on brackets and other surrounding characters.
vim.cmd([[highlight MatchParen gui=bold guibg=NONE guifg=blue cterm=bold ctermbg=NONE]])
