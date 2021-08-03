local vimp = require('vimp')
local ts = require('telescope.builtin')

-- Basic key mapping
vimp.nnoremap('<leader><Space>', function()
  ts.find_files()
end)
vimp.nnoremap('<leader>g', function()
  ts.live_grep()
end)
vimp.nnoremap('<leader>b', function()
  ts.buffers()
end)

-- Work: Search in legacy
vimp.nnoremap('<leader>l<Space>', function()
  ts.find_files({ search_dirs = {"apps", "delivery", "db"} })
end)

-- LSP mapping
vimp.nnoremap('<leader>tr', function()
  ts.lsp_references()
end)
vimp.nnoremap('<leader>ti', function()
  ts.lsp_implementations()
end)
vimp.nnoremap('<leader>td', function()
  ts.lsp_definitions()
end)

local actions = require('telescope.actions')
require('telescope').setup{
  extensions = {
    fzf = {
      fuzzy = false
    }
  },
  defaults = {
    mappings = {
      i = {
				["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
      n = {
				["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix="🔍 ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    theme = "dropdown",

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  pickers = {
    -- Special builtin config goes in here
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<C-u>"] = require("telescope.actions").delete_buffer, -- FIXME
        },
        n = {
          ["<C-u>"] = require("telescope.actions").delete_buffer, -- FIXME
        }
      }
    },
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    }
  },
}
