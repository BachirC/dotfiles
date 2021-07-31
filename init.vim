" Basic options
set nocompatible
syntax on
filetype plugin indent on
set encoding=utf-8
set bs=2 " Enable delete key 
set number " Show line number.
let mapleader = " "

" Plugin list.
" The plugins are stored in the folder `~/.config/nvim/plugged`.
call plug#begin()

Plug 'aliou/hybrid.vim' " Colorscheme
Plug 'neovim/nvim-lspconfig' " LSP plugin
Plug 'nvim-lua/completion-nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  " General fuzzy finder
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'elixir-editors/vim-elixir' " Using vim-plug
Plug 'aliou/sql-heredoc.vim' " Heredoc highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'wincent/scalpel' " Better replace occurences of a word

call plug#end()

set background=dark
" Set colorscheme.
color hybrid

" Map ; to :.
nnoremap ; :
vnoremap ; :

" Disable arrow keys.
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
noremap % %v

" FINDINF FILES:

" Search down into subfolders
" " Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

set wildignore+=node_modules/**
" ,spec/cassettes/**

" TAG JUMPING:

" Highlight search results.
set hlsearch
set shiftwidth=2 " Number of spaces for indent.
set tabstop=2
set expandtab

set tw=100 " Maximum text width
set cc=+1  " Highlight the column after the textwidth value.
set undofile " Maintain undo history between sessions
" Abbreviations
cabbrev T tabnew

""" Buffers
set hidden
set switchbuf=useopen " Jump to first open window containing specified buffer
" Open buffers list and ask for a buffer to open
nnoremap gb :ls<CR>:b<Space>
" Open a buffer in a vertical split
nnoremap vb :ls<CR>:vert sb<Space>
" Shortcut for bbye Bdelete
nnoremap <leader>q :Bdelete<CR>

" Don't bother about checking whether Escape is being used as a means to enter
" a Meta-key combination, just register Escape immediately
if exists('+esckeys')
  set noesckeys
endif

" Don't bother drawing the screen while executing macros or other automated or
" scripted processes, just draw the screen as it is when the operation
" completes
set lazyredraw

" Improve redrawing smoothness by assuming that my terminal is reasonably
" fast
set ttyfast

" Never use any kind of bell, visual or not
set visualbell t_vb=

" Require less than one second between keys for mappings to work correctly
set timeout
set timeoutlen=1000

" Require less than a twentieth of a second between keys for key codes to work
" correctly; I don't use Escape as a meta key anyway
set ttimeout
set ttimeoutlen=50

" If the optional +reltime feature is compiled, significantly increase the
" default maximum time in milliseconds of syntax highlighting that leverages the
" regex-based :match builtin. The default value of 2000 fails to suffice for
" sufficiently large buffers for filetypes whose syntax highlighting plugins
" sufficiently complex calls to the :match builtin (e.g., Python scripts of more
" than ~1,500 lines). The value set here comes directly from Vim developers. For
" further details, see the following open issue:
"     https://github.com/vim/vim/issues/2790#issuecomment-400547834
if has('reltime')
  set redrawtime=10000
endif

" Avro
autocmd BufNewFile,BufRead *.avsc set filetype=json

" LSP config
" completion nvim
lua require'lspconfig'.solargraph.setup{on_attach=require'completion'.on_attach}
lua <<EOF
  require'lspconfig'.gopls.setup{
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }
EOF
" lua require'lspconfig'.elixirls.setup{}
lua require'lspconfig'.jsonls.setup{}


nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-[> <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Keeps the history of previous searches.
" You can use ctrl-n or ctr-p to navigate the history on a FZF window
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:rg_command = 'rg --vimgrep -S'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

command! -bang LegacyFiles call fzf#vim#files('~/go/src/github.com/heetch/universe/src/services/legacy', fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
nnoremap <leader><leader> :Files<CR>
nnoremap <leader>l :LegacyFiles<CR>
nnoremap <leader>b :Buffers<CR>

" Autocomplete
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert "noselect if no select on activation

" Avoid showing message extra message when using completion
set shortmess+=c

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:completion_trigger_character = ['.', '::']
let g:completion_enable_auto_popup = 1
let g:completion_enable_auto_hover = 0
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

" Enable Ctrl-x Ctrl-o 
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Enable folding
autocmd FileType ruby setlocal foldmethod=syntax

" Folding
nnoremap <Tab> za

" With karabiner mapping, this allows to use Tab for folding while not breaking <C-i> for forward jump.
nnoremap <F6> <C-i>

lua <<EOF
  function goimports(timeoutms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    local method = "textDocument/codeAction"
    local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
    if resp and resp[1] then
      local result = resp[1].result
      if result and result[1] then
        local edit = result[1].edit
        vim.lsp.util.apply_workspace_edit(edit)
      end
    end

    vim.lsp.buf.formatting()
  end
EOF

autocmd BufWritePre *.go lua goimports(1000)

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF
