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
call plug#end()


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>a <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>a <Plug>(EasyAlign)
map <C-n> :NERDTreeToggle<CR>

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
set smarttab
set nowrap
set laststatus=1            " Remove white background of status line at bottom of nvim viewport (default is 2)

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

set guicursor=
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

colorscheme sublimemonokai

"""""""""""""""""""""""
command W w !sudo tee % > /dev/null " Write write protected files

" Key mapping
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" esc in insert mode
nnoremap kj <esc>
inoremap kj <esc>
vnoremap kj <esc>
" Line moving
" nnoremap ª :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
nnoremap ∆ :m .+<CR>==
inoremap ˚ <Esc>:m .-2<CR>==gi
inoremap ∆ <Esc>:m .+1<CR>==gi
vnoremap ˚ :m '<-2<CR>gv=gv
vnoremap ∆ :m '>+1<CR>gv=gv



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
