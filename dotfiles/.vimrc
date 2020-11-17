set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" This gave me some problems 
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()


" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set mouse=a
syntax on 
colorscheme sublimemonokai
" :W sudo saves the file when the file is open in readonly mode
command W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""
" Line
""""""""""""""""""""""""""""""""""""
" show line numbers
set number

"""""""""""""""""""""""""""""""""""""
" Indents
"""""""""""""""""""""""""""""""""""""
" replace tabs with spaces
set expandtab
" 1 tab = 2 spaces
set tabstop=2 shiftwidth=2

" when deleting whitespace at the beginning of a line, delete 
" 1 tab worth of spaces (for us this is 2 spaces)
set smarttab

" when creating a new line, copy the indentation from the line above
set autoindent

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

"""""""""""""""""""""""""""""""""""""
" Mix
"""""""""""""""""""""""""""""""""""""
" show the mathing brackets
set showmatch

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" Nerd tree
map <C-n> :NERDTreeToggle<CR>
" Changing color depending on mode
" Enable CursorLine
set cursorline
set relativenumber
set clipboard=unnamed
set clipboard=unnamedplus

" esc in insert mode
inoremap kj <esc>

" esc in command mode
cnoremap kj <C-C>
" Note: In command mode mappings to esc run the command for some odd
" historical vi compatibility reason. We use the alternate method of
" existing which is Ctrl-C


nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>


autocmd BufRead scp://* :set bt=acwrite

" Line moving
" nnoremap ª :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
nnoremap ∆ :m .+<CR>==
