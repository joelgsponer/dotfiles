""""""""""""""""""""""
"""Nvim config file"""
""""""""""""""""""""""
" Save this file to ~/.config/nvim/init.vim
let g:mapleader = ','
" PLUGINS
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ }
" Use deoplete.
let g:deoplete#enable_at_startup = 1

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F3> :call LanguageClient#textDocument_rename()<CR>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>a <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>a <Plug>(EasyAlign)
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=a                 
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
:set nowrap
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
set smarttab
set laststatus=1            " Remove white background of status line at bottom of nvim viewport (default is 2)
hi Cursor guifg=black guibg=green gui=reverse
set cursorline
" set relativenumber
set clipboard=unnamed
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase
set smartcase

" highlight search results (after pressing Enter)
set hlsearch

" highlight all pattern matches WHILE typing the pattern
set incsearch

"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:lightline = { 'colorscheme': 'onedark' }
let g:airline_theme = "onedark"
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
" Italics for my favorite color scheme
let g:onedark_terminal_italics=1
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
"let g:palenight_color_overrides = {
"
"\    'black': { 'gui': '#000000', "cterm": "0", "cterm16": "0" },
"\}
set background=dark
colorscheme onedark
"""""""""""""""""""""""
command W w !sudo tee % > /dev/null " Write write protected files

" Key mapping
"split navigations
nnoremap d "_d
nnoremap m d
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>
tnoremap <C-H> <C-W><C-H>
" esc in insert mode
nnoremap kj <esc>
inoremap kj <esc>
vnoremap kj <esc>
tnoremap kj <C-\><C-n>
tnoremap <Esc> <C-\><C-n>

" Line moving
" nnoremap ª :m .+1<CR>==:
nnoremap ˚ :m .-2<CR>==
nnoremap ∆ :m .+<CR>==
inoremap ˚ <Esc>:m .-2<CR>==gi
inoremap ∆ <Esc>:m .+1<CR>==gi
vnoremap ˚ :m '<-2<CR>gv=gv
vnoremap ∆ :m '>+1<CR>gv=gv
" Resizing
nnoremap <A-Up> :res -5<CR>
nnoremap <A-Down> :res +5<CR>
nnoremap <A-Left> :vertical resize -5<CR>
nnoremap <A-Right> :vertical resize +5<CR>
inoremap <Up> <Up><Esc>
inoremap <Down> <Down><Esc>
inoremap <Right> <Right><Esc>
inoremap <Left> <Left><Esc>


" Activate spell checker
nnoremap <leader>s :set invspell<CR>
" Add date
inoremap <leader>d <C-R>=strftime("%Y-%m-%dT%H:%M")<CR>

" R
map <F2> <Plug>RStart 
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
let R_assign = 0
