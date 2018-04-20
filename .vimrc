" Basic options
syntax on
filetype plugin indent on

" Plugin list.
" The plugins are stored in the folder `~/.vim/bundle`.
call plug#begin('~/.vim/bundle')

Plug 'aliou/hybrid.vim' " Colorscheme
Plug 'aliou/sql-heredoc.vim' " SQL heredoc highlighter.
Plug 'tpope/vim-sensible' " Sensible defaults.
Plug 'tpope/vim-fugitive' " Git in VIM.
Plug 'tpope/vim-rails' " Rails in VIM.
Plug 'tpope/vim-dispatch' " Asynchronous tasks from VIM.
Plug 'elixir-lang/vim-elixir' " Elixir in VIM.
Plug 'godlygeek/tabular' " markdown dependence
Plug 'plasticboy/vim-markdown' " markdown  VIM
Plug 'tpope/vim-endwise' " Automatically close blocks and such
Plug 'takac/vim-hardtime' " avoid jjjj kkkk
Plug 'henrik/vim-qargs' " vim-qargs
Plug 'alcesleo/vim-uppercase-sql' " automatically uppercase SQL keywords
Plug 'sheerun/vim-polyglot' " Syntax highlighter
Plug 'pangloss/vim-javascript' " Add JS highlighter
Plug 'mxw/vim-jsx' " Add JSX highlighter
Plug 'alvan/vim-closetag' " Automatic closing tags for HTML
Plug 'ekalinin/Dockerfile.vim' " Docker highlighting
Plug 'w0rp/ale' " Asynchronous Lint Engine
Plug 'ctrlpvim/ctrlp.vim' " Search files

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

" Automatic closing curly brackets
" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}

" Automatic closing brackets
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" Automatic closing parenthesis
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" Show line number.
set number

" Highlight search results.
set hlsearch

" Search plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*.DS_Store
set wildignore+=*/tmp/*,*.so,*.sw?,*.zip,*.png,*.jpg
set wildignore+=*node_modules,*deps,_build,*public

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules|deps|_build)$'
let g:ctrlp_show_hidden = 1

set autoindent   " Copy indentation for new line.
set smartindent  " Autoindent.
set shiftwidth=2 " Number of spaces for indent.
set tabstop=2
set expandtab

set tw=100 " Maximum text width
set cc=+1  " Highlight the column after the textwidth value.

" Files to apply autocomplete on closing HTML tag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml, *.js, *.jsx"

" Delete trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
" Prepend wrapped lines to avoid getting deleted as trailing whitespaces
set wrap
set linebreak
" note trailing space at end of next line
set showbreak=>\ \ \

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir " Store undo histories in .vim/

let g:ale_linters = {
\   'ruby': ['rubocop'],
\   'elixir': ['mix', 'credo'],
\}

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'elixir': ['mix_format'],
\   'javascript': ['prettier', 'eslint'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" Abbreviations
cabbrev T tabnew

" Status line
let s:ale_running = 0
let s:ale_error_count = 0

highlight GitBr ctermfg=250 ctermbg=237 guifg=#c5c8c6 guibg=#0c0d0f

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! s:status_git()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?' '.l:branchname.' ':''
endfunction

function! s:status_ale_pre()
  let s:ale_running = 1
  redrawstatus
endfunction

function! s:status_ale_post()
  let s:ale_running = 0
  let s:ale_error_count = ale#statusline#Count(bufnr('')).total
  redrawstatus
endfunction

function! StatusActive()
  let l:statusline=''                 " Custom status line
  let l:statusline.='%#PmenuSel#'     " Use this for color
  let l:statusline.='[%n] %y '        " Buffer number and Filetype
  let l:statusline.='%#GitBr#'        " Use this for color
  let l:statusline.=s:status_git()    " git branch
  let l:statusline.='%#PmenuSel#'     " Use this for color
  let l:statusline.=' %f%<'           " File name, truncated if too long.
  let l:statusline.='%m%r '           " Modified and read only flags.

  let l:statusline.='%='              " Right align the following

  let l:statusline.='%c '             " Use this for color
  let l:statusline.='%#CursorColumn#' " Use this for color
  let l:statusline.=' %p%% '          " Percentage through file

  let l:statusline.='%#PmenuSel#'
  let l:statusline.= s:ale_running ? ' ⋯ ' : s:ale_error_count ? ' ✗ ' : ' ✓ '

  return l:statusline
endfunction

function! StatusInactive()
  let l:statusline='%#CursorColumn#' " Use this for color
  let l:statusline.=' %f%'          " File name, truncated if too long.

  return l:statusline
endfunction

set statusline=%!StatusActive()

augroup statusline
  autocmd!

  " Use a simpler status line when the window is not in focus.
  autocmd WinEnter * setlocal statusline=%!StatusActive()
  autocmd WinLeave * setlocal statusline=%!StatusInactive()

  " Update ale indicator in status line.
  autocmd User ALELintPre  call s:status_ale_pre()
  autocmd User ALELintPost call s:status_ale_post()
augroup END
