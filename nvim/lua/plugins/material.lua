-- Required since neovim 0.4.0 https://github.com/norcalli/nvim-colorizer.lua#installation-and-usage
vim.api.nvim_set_option('termguicolors', true)
--vimp.nnoremap('<leader>mm', function() 
--  require('material.functions').toggle_style()
--end)
vim.g.material_style = "deep ocean"
require('material').set()
