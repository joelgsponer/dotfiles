set nocompatible              " required
filetype off                  " required
syntax on 
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

" Nerd tree
map <C-n> :NERDTreeToggle<CR>
" Changing color depending on mode
" Enable CursorLine
set cursorline
set clipboard=unnamed
set clipboard=unnamedplus

" Key mapping
"split navigations
nnoremap d "_d
nnoremap m d
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-J>
" esc in insert mode
nnoremap kj <esc>
inoremap kj <esc>
vnoremap kj <esc>

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


