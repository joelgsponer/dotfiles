""""""""""""""""""""""
"""Nvim config file"""
""""""""""""""""""""""
nnoremap <SPACE> <Nop>
let g:mapleader = " "
" PLUGINS
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline-themes'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'airblade/vim-gitgutter'
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'kassio/neoterm'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'chriskempson/base16-vim'
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

let g:LanguageClient_serverCommands = {
    \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ }
" Use deoplete.
let g:deoplete#enable_at_startup = 1

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
noremap <silent> <F3> :call LanguageClient#textDocument_rename()<CR>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>a <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>a <Plug>(EasyAlign)
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
let g:neoterm_term_per_tab=1
let g:neoterm_autoinsert=1
let g:neoterm_shell='/bin/bash'
let g:neoterm_default_mod='botright'
let g:lightline = { 'colorscheme': 'onedark' }
let g:airline_theme = "onedark"
if (has("termguicolors"))
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
" Italics for my favorite color scheme
let g:onedark_terminal_italics=1
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < ttps://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  set termguicolors
endif
"let g:palenight_color_overrides = {
"
      "\    'black': { 'gui': '#000000', "cterm": "0", "cterm16": "0" },
"\}
set background=dark
let ayucolor="dark"   " for dark version of theme
colorscheme one


" Settings
let NERDTreeShowHidden=1
set nocompatible            " disable compatibility to old-time vi
set smartindent
set hlsearch
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
set nowrap
set wildmode=longest,list   " get bash-like tab completions
set smarttab
set cursorline
set clipboard=unnamed
set clipboard=unnamedplus
set cc=80                   " set an 80 column border for good coding style
set laststatus=1            " Remove white background of status line at bottom of nvim viewport (default is 2)
set ignorecase
set smartcase
set hlsearch
set incsearch
set guicursor=n-c-v:block-Cursor/Cursor-blinkon0
set guicursor+=i-ci:ver1-Cursor/Cursor-blinkwait300-blinkon200-blinkoff150
syntax on                   " syntax highlighting
filetype plugin indent on   " allows auto-indenting depending on file type
set timeoutlen=200

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

