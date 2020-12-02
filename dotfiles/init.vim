""""""""""""""""""""""
"""Nvim config file"""
""""""""""""""""""""""
nnoremap <SPACE> <Nop>
let g:mapleader = " "
" PLUGINS
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'kassio/neoterm'
Plug 'rakr/vim-one'
call plug#end()



" Plugin keymappings
"" fzf
map ; :tabnew <bar> :Files <CR>
"" EasyMotion
""" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

""" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

""" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

""" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

"" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
nnoremap <C-f> <Esc> /
inoremap <C-f> <Esc> /
vnoremap <C-f> <Esc> /
xnoremap <C-f> <Esc> /

map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
let g:neoterm_term_per_tab=1
let g:neoterm_autoinsert=1
let g:neoterm_shell='/bin/bash'
let g:neoterm_default_mod='botright'
"
set background=dark
colorscheme one


" Settings
let NERDTreeShowHidden=1
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=a                 
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set nowrap
set cursorline
set clipboard=unnamed
set clipboard=unnamedplus
set cc=80                  " set an 80 column border for good coding style
set ignorecase
set smartcase
set incsearch
syntax on                   " syntax highlighting
filetype plugin indent on   " allows auto-indenting depending on file type
set timeoutlen=200
set guicursor=n-c-v:block-Cursor/Cursor-blinkon0
set guicursor+=i-ci:ver1-Cursor/Cursor-blinkwait300-blinkon200-blinkoff150

"""""""""""""""""""""""
" Key mapping
nnoremap <CR> o<Esc>
nnoremap R ciw
nnoremap <C-r> <Esc>:source $MYVIMRC<CR>
" Undo
inoremap <C-z> <ESC>u
nnoremap <C-z> <ESC>u
vnoremap <C-z> <ESC>u
" Indentation
inoremap <C-]> <C-t>
inoremap <C-[> <C-d>
nnoremap <C-]> >>
nnoremap <C-[> <<
vnoremap <C-]> >gv
vnoremap <C-[> <gv
" Brackets
"inoremap { {}<ESC>ha
"inoremap ( ()<ESC>ha
"inoremap [ []<ESC>ha
" Saving
nnoremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>
" Quitting
noremap <C-q> <Esc>:q!<CR>
"command W w!sudo tee % > /dev/null " Write write protected files
" Copy and pasting
nnoremap d "_d
nnoremap m d
" Window navigation
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
cnoremap kj <esc>
vnoremap kj <esc>
inoremap kj <esc>
xnoremap kj <esc>
tnoremap kj <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
" Arrow keys
inoremap <Down> <Down><ESC>
inoremap <Up> <Up><ESC>
inoremap <Left> <Left><ESC>
inoremap <Right> <Right><ESC>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
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

" Activate spell checker
nnoremap <leader>s :set invspell<CR>
" Add date
inoremap <leader>d <C-R>=strftime("%Y-%m-%dT%H:%M")<CR>

" Tab navigation
nnoremap <C-p> :tabNext<CR>
nnoremap <C-o> :tabprevious<CR>

" R
nnoremap <C-CR> :TREPLSendFile<CR>

map <F2> <Plug>RStart 
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
nmap <Space><Space> <Plug>RDSendLine
let R_assign = 0
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1

" Banners
autocmd FileType vim map <C-L> I"<Del>  <Esc>A  "<Del><Esc>yyp0lv$hhr"yykPjj
autocmd FileType javascript,php,c map <leader>b I//  <Esc>A  //<Esc>yyp0llv$hhhr-yykPjj
autocmd FileType python,ruby,sh,zsh map <leader>ccb I#  <Esc>A  #<Esc>yyp0lv$hhr-yykPjj
autocmd FileType css map <leader>ccb I/*  <Esc>A  */<Esc>yyp0llv$r-$hc$*/<Esc>b

map <C-L> I"<Del>  <Esc>A  "<Del><Esc>yyp0lv$hhr"yykPjj

" R
nnoremap <C-S-B> :!Rscript -e "devtools::build(); devtools::install();" <CR>

" ---
" Post Load Fixes
" ---
function CorrectColorScheme()
  highlight SignColumn guibg=black
  hi Normal guibg=#0a0909
  hi Cursor ctermfg=1 ctermbg=1 guibg=#750f00
  highlight CursorLine guibg=#000000
endfunction
autocmd VimEnter * call CorrectColorScheme()

