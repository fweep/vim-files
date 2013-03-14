set nocompatible
set encoding=utf-8

syntax on
filetype plugin indent on

call pathogen#infect()

set t_Co=256
set term=xterm-256color

set background=dark
colorscheme solarized

" Disable underline for folds.
highlight Folded cterm=NONE

set modeline
set hidden
set history=1000
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set nowrap
set sidescrolloff=20
set sidescroll=1
set scrolloff=8
set nobackup
set nowritebackup
set undofile
set undodir=~/.vim/undo
set backupdir=~/.vim/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,/var/tmp,/tmp
set tags+=.git/tags
set title
set laststatus=2
set showtabline=2
set autoread
set virtualedit=block
set number
set numberwidth=4
set visualbell t_vb=
set noerrorbells
set shortmess=aTI
set showmatch
set matchtime=0
set timeout timeoutlen=500 ttimeoutlen=50
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set list listchars=tab:>·,trail:·,nbsp:·,extends:>
set wildmenu
set wildmode=list:longest
set wildignore=.git,*.swp,*/tmp/*
set sessionoptions-=help
set ttymouse=xterm2
set mouse=a

let mapleader = ','

set pastetoggle=<F2>
nnoremap ' `
nnoremap ` '
nnoremap Y y$
nnoremap <Leader><space> :nohlsearch<CR>
nnoremap <C-k> :bprevious<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <C-d> :quit<CR>
nnoremap / /\v
vnoremap / /\v

"Various broken (at least in KiTTY) attempts at home key stuff.

" nnoremap [1~ <home>

" inoremap <khome> <home> " Why are these here?
" nnoremap <khome> <home>

" noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
" imap <silent> <Home> <C-O><Home>

" inoremap <silent> <home> <C-O>:call Home()<CR>
" nnoremap <silent> <home> :call Home()<CR>

" function Home()
"     let curcol = wincol()
"     normal ^
"     let newcol = wincol()
"     if newcol == curcol
"         normal 0
"     endif
" endfunction

" Open help in a full-height vertical split at the right.
cnoreabbrev <expr> help getcmdtype() == ':' && getcmdline() == 'help' ? 'vert bo h' : 'help'
cnoreabbrev <expr> h getcmdtype() == ':' && getcmdline() == 'h' ? 'vert bo h' : 'h'

runtime macros/matchit.vim

let g:session_autoload=0
let g:session_autosave=1
nnoremap <C-s><C-s> :SaveSession<CR>
nnoremap <C-s><C-r> :OpenSession<CR>

nnoremap <unique> <C-w>w <Plug>ZoomWin
nnoremap <Leader>d :NERDTreeToggle<cr>
nnoremap <F5> :GundoToggle<CR>

let g:tagbar_left = 1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1

nnoremap <F6> :TagbarToggle<CR>

let g:buffergator_suppress_keymaps=1
nnoremap <Leader>g :BuffergatorToggle<CR>
nnoremap <Leader>G :BuffergatorTabsToggle<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

let g:Powerline_symbols='fancy'
let g:Powerline_theme = 'fweep' "Disable encoding and newline indicators.
let g:Powerline_colorscheme = 'skwp'

autocmd QuickFixCmdPost *grep* cwindow

autocmd FileType vim  call SetVimScriptFileTypeOptions()
autocmd FileType ruby call SetRubyFileTypeOptions()
autocmd FileType zsh  call SetZshFileTypeOptions()

autocmd BufRead,BufNewFile *.zsh       setlocal filetype=zsh
autocmd BufRead,BufNewFile *.zsh-theme setlocal filetype=zsh

autocmd BufRead,BufNewFile README.md   setlocal wrap textwidth=72 formatoptions-=lc formatoptions+=t

augroup local_buffergator
  autocmd!
  autocmd BufEnter \[\[buffergator-buffers\]\] unmap ds
  autocmd BufLeave \[\[buffergator-buffers\]\] nmap ds <Plug>Dsurround
augroup END

function! SetZshFileTypeOptions()
  setlocal foldmethod=syntax foldlevel=20 formatoptions-=o
  autocmd BufWinEnter,BufEnter,WinEnter       * if &ft ==# 'zsh' | setlocal cursorline | endif
  autocmd BufWinLeave,BufLeave,WinLeave       * if &ft ==# 'zsh' | setlocal nocursorline | endif
endfunction

function! SetRubyFileTypeOptions()
  setlocal foldmethod=syntax foldlevel=20 formatoptions-=o
  autocmd BufWinEnter,BufEnter,WinEnter       * if &ft ==# 'ruby' | setlocal cursorline | endif
  autocmd BufWinLeave,BufLeave,WinLeave       * if &ft ==# 'ruby' | setlocal nocursorline | endif
endfunction

function! SetVimScriptFileTypeOptions()
  setlocal foldmethod=marker foldlevel=0 formatoptions-=o
  autocmd BufWinEnter,BufEnter,WinEnter       * if &ft ==# 'vim' | setlocal cursorline | endif
  autocmd BufWinLeave,BufLeave,WinLeave       * if &ft ==# 'vim' | setlocal nocursorline | endif
endfunction

command! Vvimrc if CurrentBufferIsEmpty() | edit ~/.vimrc | else | botright vsplit ~/.vimrc | endif
command! Svimrc if CurrentBufferIsEmpty() | edit ~/.vimrc | else | split ~/.vimrc | endif

function! CurrentBufferIsEmpty()
  return line('$') == 1 && getline(1) == ''
endfunction

let g:rubytest_spec_drb = 1
map <Leader>r <Plug>RubyTestRun
map <Leader>R <Plug>RubyFileRun

if filereadable('.vimrc-project') | source .vimrc-project | endif
if filereadable(expand('~/.vim-local/vimrc-local')) | source ~/.vim-local/vimrc-local | endif
