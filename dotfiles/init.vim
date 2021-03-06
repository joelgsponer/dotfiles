"""Nvim config file"""
""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
"Plug 'tpope/vim-surround'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'tpope/vim-fugitive'
Plug 'rakr/vim-one'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-peekaboo'
Plug 'jpalardy/vim-slime'
call plug#end()

" Plugin Setting
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

"" fzf
nnoremap ; :Buffers <CR>
nnoremap ;; :Files <CR>
nnoremap ;;; :Rg <CR>
nnoremap <Space><Space> :BLines <CR>
nnoremap <Space><SPACE><SPACE> :Lines <CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

function! s:paste_rhistory(cmd)
	" has to be a function to avoid the extra space fzf#run insers otherwise
  let @z = a:cmd
	" execute feedkeys('<C-c> i')  
  execute feedkeys('"zp')
	execute feedkeys('i')  
endfunction(cmd)

command! -nargs=* FZFRhistory call fzf#run({
			\   'source': 'grep \+ ~/.radian_history | sed -e "s/+//g"',
      \   'window': { 'width': 0.9, 'height': 0.6 },
      \   'sink': function('<sid>paste_rhistory')
			\ })
tnoremap <C-UP> <C-\><C-n> :FZFRhistory<CR>

"" EasyMotion
""" <ceader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap ff <Plug>(easymotion-overwin-f)

""" s{char}{char} to move to {char}{char}
map <Leader>s <Plug>(easymotion-overwin-f2)
map fff <Plug>(easymotion-overwin-f2)

""" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
nmap <Leader>l <Plug>(easymotion-overwin-line)

""" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap ww <Plug>(easymotion-overwin-w)
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
" Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" Settings
set background=dark
colorscheme one
let NERDTreeShowHidden=1
set hidden
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set showcmd
set ignorecase              " case insensitive matching
set mouse=a                 
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set cindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
augroup numbertoggle
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set nowrap
set cursorline
set clipboard=unnamedplus
set cc=80                  " set an 80 column border for good coding style
set ignorecase
set smartcase
set incsearch
syntax on                   " syntax highlighting
filetype plugin on
filetype plugin indent on   " allows auto-indenting depending on file type
set timeoutlen=200
set termguicolors
set guicursor=n-c-v:block-Cursor/Cursor-blinkon0
set guicursor+=i-ci:ver1-Cursor/Cursor-blinkwait300-blinkon200-blinkoff150
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set pastetoggle=<F2>

"""""""""""""""""""""""
" Key mapping
" General
nnoremap GG GVgg
nnoremap <CR> o<Esc>
command! Src :source $MYVIMRC
" Saving
nnoremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>
" Quitting
nnoremap <C-q> :q!<CR>
inoremap <C-q> <Esc>:q!<CR>
xnoremap <C-q> <Esc>:q!<CR>
vnoremap <C-q> <Esc>:q!<CR>
" esc in insert mode
nnoremap kj <esc>
nnoremap kj <esc>
cnoremap kj <esc>
vnoremap kj <esc>
inoremap kj <esc>
tnoremap kj <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
" Select completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Line moving
nnoremap ˚ :m .-2<CR>==
nnoremap ∆ :m .+<CR>==
inoremap ˚ <Esc>:m .-2<CR>==gi
inoremap ∆ <Esc>:m .+1<CR>==gi
vnoremap ˚ :m '<-2<CR>gv=gv
vnoremap ∆ :m '>+1<CR>gv=gv
" Arrows
inoremap <Up> <ESC><UP>
inoremap <DOWN> <ESC><Down>
inoremap <Left> <ESC><Left>
inoremap <Right> <ESC><Right>
inoremap <LeftMouse> <LeftMouse><Esc>

" Macro type command
" Spread on new line after comma
command! MReflowParams :normal f,r<CR><ESC>
"*******************************************************************************
"**************************         Snippets         ***************************
"*******************************************************************************
command! Banner :r! R --slave -e 'suppressMessages(library(waRRior));waRRior::banner("<cword>")'
command! Divider :r! R --slave -e 'suppressMessages(library(waRRior));waRRior::divider()'
command! Function :r! R --slave -e 'suppressMessages(library(waRRior));waRRior::skeleton_function("<cword>")'
"#===============================================================================
" Activate spell checker
nnoremap <leader>s :set invspell<CR>

" Nvimr
function StartRFromPath(path)
    let g:R_path = a:path
    call StartR("R")
endfunction
command! R363 :call StartRFromPath('/opt/bee_tools/R/3.6.3/bin')<CR>
command! R361 :call StartRFromPath('/opt/bee_tools/R/3.6.1/bin')<CR>
command! R :call StartR("R") 
let R_assign = 0
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1
let R_csv_app = 'terminal:vd'

" R
command! RBuildInstall :!Rscript -e "devtools::build(); devtools::install();" <CR>
" Post Load Fixes
" ---
function CorrectColorScheme()
  highlight SignColumn guibg=black
  hi Normal guibg=#0a0909
  hi Cursor ctermfg=1 ctermbg=1 guibg=#00ff21
  highlight CursorLine guibg=#300200
  highlight StatusLine guibg=darkgreen
  hi VertSplit guibg=darkgreen guifg=darkgreen
endfunction

function StyleInsert()
  highlight StatusLine guibg=darkred
  highlight CursorLine guibg=#300200
  hi Cursor ctermfg=1 ctermbg=1 guibg=#fc0c00
  hi Normal guibg=#050000
  hi VertSplit guibg=darkred guifg=darkred
endfunction
  


autocmd VimEnter * call CorrectColorScheme()
autocmd InsertEnter * call StyleInsert() 
autocmd  * call StyleInsert() 
autocmd InsertLeave * call CorrectColorScheme()
" Statusline
" https://github.com/Greduan/dotfiles/blob/76e16dd8a04501db29989824af512c453550591d/vim/after/plugin/statusline.vim

let g:currentmode={
      \ 'n'  : 'N ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'V ',
      \ 'V'  : 'V·Line ',
      \ '' : 'V·Block ',
      \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
      \ '' : 'S·Block ',
      \ 'i'  : 'I ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \ 't'  : 'Terminal '
      \}


highlight User1 cterm=None gui=None ctermfg=007 guifg=fgcolor
highlight User2 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User3 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User4 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User5 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User7 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User8 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User9 cterm=None gui=None ctermfg=007 guifg=fgcolor

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008 guifg=fgcolor gui=None cterm=None'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=005 guifg=#00ff00 gui=None cterm=None'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004 guifg=#6CBCE8 gui=None cterm=None'
  else
    exe 'hi! StatusLine ctermfg=006 guifg=orange gui=None cterm=None'
  endif
  return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024

  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

" http://stackoverflow.com/a/10416234/213124
set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%0*\ [%n]                                " buffernr
set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
set statusline+=%0*\ %{GitInfo()}                        " Git Branch name
set statusline+=%0*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%0*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size


hi VertSplit guibg=darkgreen guifg=darkgreen
hi Split guibg=magenta guifg=magenta
highlight SignColumn guibg=black
hi Normal guibg=#0a0909
hi Cursor ctermfg=1 ctermbg=1 guibg=#00ff21
highlight CursorLine guibg=#300200
highlight StatusLine guibg=darkgreen

function! _EscapeText_r(text)
  call system("cat > ~/.slime_r", a:text)
  return ["source('~/.slime_r', echo = TRUE, max.deparse.length = 4095, local = TRUE)\r"]
endfunction
