" .vimrc

" Be more Vimmy.
set nocompatible

" Encode all files in UTF-8 by default.
set encoding=utf-8

filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
" Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'mxw/vim-jsx'
" bufkill doesn't get along with netrw; disabling pending bugfix https://github.com/qpkorr/vim-bufkill/issues/11
" Plugin 'qpkorr/vim-bufkill'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-abolish'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-repeat'
" Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/syntastic'

" Needs to be after Powerline to override its tabline wrongness.
Plugin 'fweep/vim-tabber'

call vundle#end()

" Turn on syntax highlighting.
syntax enable

" Auto-load plugins and indent files based on filetype.
filetype plugin indent on

" Use dark solarized color theme (slightly modified).
set background=dark
colorscheme solarized

" Disable underline for folds.
highlight Folded cterm=NONE

" Change leader from default \.
let mapleader = ','

" Honor modeline settings in files.
set modeline modelines=5

" Disable automatic comment leader insertion except on textwidth wrap
set formatoptions-=ro

" Keep files open even if there's no active window into them.
set hidden

" Save 1000 lines of history.
set history=1000

" Yank to system clipboard.
set clipboard=unnamed

" Replace tabs with the appropriate number of spaces in insert mode.
set expandtab

" Tabs are 2 spaces.
set tabstop=2

" Backspace deletes to previous tabstop.
set softtabstop=2

" Shift lines left/right by 2 spaces with <<, >>, indent with ==
set shiftwidth=2

" Allow backspace over everything in insert mode.
set backspace=indent,eol,start

" No line wrapping.
set nowrap

" Scroll window sideways by 1 character at a time.
set sidescroll=1

" Keep cursor 20 characters from edge of window when scrolling horizontally.
set sidescrolloff=20

" Keep cursor 8 lines from top/bottom of window when scrolling vertically.
set scrolloff=8

" Don't create backup files.
set nobackup
set nowritebackup

" Save more history for marks, commands, searches, etc. between invocations.
set viminfo='100,/1000,:1000,<50,s100,h,c,n~/.vim/viminfo

" Save undo history between Vim invocations.
set undofile

" Store various temp files in ~/.vim.
set undodir=~/.vim/undo
set backupdir=~/.vim/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,/var/tmp,/tmp

" Prepend .git/tags to tag file search path.
" FIXME: consider removing most tag paths for speed.  Keep .git/tags, ./tags, ./tmp/tags,
" anything Pathogen/Bundler plugins generate.
set tags^=.git/tags

" Set window title.
set title

" Always show statusline.
set laststatus=2

" Always show tabline.
set showtabline=2

" Reload externally-changed files when there are no changes in Vim.
set autoread

" Allow the cursor to move beyond EOL in visual mode block selections.
set virtualedit=block

" Show line numbers, width 4 in the column by default.
set number
set numberwidth=4

" Disable error bells when error messages are printed.
set noerrorbells

" Disable visual flash on error bells.
set visualbell t_vb=

" Reduce the number of hit-enter prompts from status messages.
set shortmess=aTI

" Flash to matching paren/bracket/brace when matching pair is typed.
set showmatch

" Instantly flash back to current character are showing match.
set matchtime=0

" For multi-character mappings and keycodes, wait 500ms and 50ms respectively
" for the next key press before timing out and running the command.
set timeout timeoutlen=500 ttimeoutlen=50

" Highlight matching patterns when searching.
set hlsearch

" Move to matches as a search is performed.
set incsearch

" Case-insensitive searching when the pattern contains only lowercase.
set ignorecase

" Override ignorecase when the pattern contains uppercase characters.
set smartcase

" :substitute is global by default (append /g to patterns toggle off).
set gdefault

" Display tokens for leading/trailing whitespace, literals tabs and nbsp.
set list listchars=tab:>·,trail:·,nbsp:·,extends:>

" Allow <BS>, <Space>, <Left>, <Right> to line-wrap in normal mode.
set whichwrap=b,s,<,>

" Enable filename completion on <Tab> in command-line.
set wildmenu

" First <Tab> completes longest common match, second <Tab> opens wildmenu.
set wildmode=list:longest,list:full

" Ignore files matching these patterns when completing.
set wildignore+=*/.git
set wildignore+=*/*.swp
set wildignore+=*/tmp/*

" Ignore some sources for faster autocompletion of tags.
" Current file, other open windows/buffers, included files, tags.
set complete=.,w,b,i,t
" Current file, tags.
" set complete=.,t

" Don't save open help windows in session.
set sessionoptions-=help

" Support SGR mouse if available, fall back to xterm2 mouse.
if has("mouse_sgr")
  " Allows mouse clicking beyond terminal column 222.
  set ttymouse=sgr
else
  set ttymouse=xterm2
endif

" Enable mouse in all modes.
set mouse=a

" Hide the mouse while typing (default; just being explicit here).
set mousehide

" Don't redraw while executing macros.
set lazyredraw

" Expand the default preview window size (used by Fugitive for Gstatus, etc).
set previewheight=20

" Make ~ for case-swapping require a motion by default.
set tildeop

" Map jk to <Esc> in insert mode; disable <Esc> in insert mode.
inoremap jk <Esc>
inoremap <Esc> <nop>

" Faster window switching
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Map <Leader>l to redraw since <C-l> mapping was changed.
nnoremap <silent> <Leader>l :redraw!<CR>

" Disable <F1> help because I always fat-finger <Esc> on tiny keyboards.
nnoremap <F1> <Nop>

" <F2> toggles paste mode in normal/insert modes.
nnoremap <silent> <F2> :set paste!<CR>
set pastetoggle=<F2>

" Disabled paste mode when leaving insert mode.
autocmd InsertLeave * set nopaste

" Visually select entire buffer.
nnoremap <Leader>a ggVG

" Make . on a visual selection sensible.
vnoremap . :normal .<CR>

" Swap behavior of ' and ` for easier typing.
nnoremap ' `
nnoremap ` '

" Make Y behave like C and D.
nnoremap Y y$

" Make X like D into a black hole.
nnoremap X "_D

" Toggle search highlighting off more easily.
nnoremap <silent> <space> :nohlsearch<CR>

" Default to "very magic" mode for searching.
nnoremap / /\v
vnoremap / /\v

" if has("cscope")
"   "TODO: turn this all into a plugin.

"   set nocscopetag
"   set cscopequickfix=s-,c-,d-,i-,t-,e-
"   set nocscopeverbose
"   if filereadable(".git/cscope.out")
"     cscope add .git/cscope.out
"   endif
"   set cscopeverbose

"   "TODO: figure out which of these are useless in Ruby and disable them.
"   nnoremap <Leader>fs :cscope find s <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>
"   nnoremap <Leader>fg :cscope find g <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>
"   nnoremap <Leader>fc :cscope find c <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>
"   nnoremap <Leader>ft :cscope find t <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>
"   nnoremap <Leader>fe :cscope find e <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>
"   nnoremap <Leader>ff :cscope find f <C-R>=expand("<cfile>")<CR><CR>:botright cwindow<CR>
"   nnoremap <Leader>fd :cscope find d <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>
"   nnoremap <Leader>fi :cscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>:botright cwindow<CR>
"   "TODO: figure out how to get cstag output in quickfix or a popup menu.
"   map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>

"   function! CscopeRebuild()
"     cscope kill .git/cscope.out
"     silent execute "!./.git/hooks/cscope"
"     if v:shell_error
"       redraw!
"       echohl ErrorMsg | echo "Unable to run cscope command." | echohl None
"     else
"       if filereadable(".git/cscope.out")
"         redraw!
"         cscope add .git/cscope.out
"       else
"         redraw!
"         echohl ErrorMsg | echo "Unable to read cscope database." | echohl None
"       endif
"     endif
"   endfunction

"   command! Cscope call CscopeRebuild()
" endif

" Make <Home> alternately jump between column 0 and the first non-whitespace column.
nnoremap <silent> <Home> :call Home()<CR>
inoremap <silent> <Home> <C-O>:call Home()<CR>

if !exists("*Home")
  function Home()
      let curcol = wincol()
      normal ^
      let newcol = wincol()
      if newcol == curcol
          normal 0
      endif
  endfunction
endif

" Open help in a vertical split.
cnoreabbrev <expr> vhelp getcmdtype() == ':' && getcmdline() == 'vhelp' ? 'vert bo h' : 'vhelp'
cnoreabbrev <expr> vh getcmdtype() == ':' && getcmdline() == 'vh' ? 'vert bo h' : 'vh'

cnoremap <C-a> <Home>

runtime macros/matchit.vim

" FIXME: not sure these work anymore
let g:session_autoload=0
let g:session_autosave=1
nnoremap <C-s><C-s> :SaveSession<CR>
nnoremap <C-s><C-r> :OpenSession<CR>

autocmd QuickFixCmdPost *grep* cwindow

if !exists("*LoadAndDisplayRSpecQuickfix")
  function! LoadAndDisplayRSpecQuickfix()
    let quickfix_filename = "../../.git/quickfix.out"
    if filereadable(quickfix_filename) && getfsize(quickfix_filename) != 0
      silent execute ":cfile " . quickfix_filename
      botright cwindow
      cc
    else
      redraw!
      echohl WarningMsg | echo "Quickfix file " . quickfix_filename . " is missing or empty." | echohl None
    endif
  endfunction
endif

noremap <Leader>q :call LoadAndDisplayRSpecQuickfix()<CR>

autocmd BufRead,BufNewFile .tmux-osx.conf                   setfiletype tmux

autocmd BufRead,BufNewFile README.md   setlocal wrap textwidth=72 formatoptions-=lc formatoptions+=t

command! Vvimrc if CurrentBufferIsEmpty() | edit ~/.vimrc | else | botright vsplit ~/.vimrc | endif
command! Svimrc if CurrentBufferIsEmpty() | edit ~/.vimrc | else | split ~/.vimrc | endif
command! Vimrc  Vvimrc

if !exists("*CurrentBufferIsEmpty")
  function CurrentBufferIsEmpty()
    return line('$') == 1 && getline(1) == ''
  endfunction
endif

if !exists("*DeleteHiddenBuffers")
  function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
      silent execute 'bwipeout' buf
    endfor
  endfunction
endif

function! DeleteTrailingWhitespace()
    let line = line(".")
    let col = col(".")
    %s/\s\+$//e
    call cursor(line, col)
endfunction

nnoremap <silent> <Leader>w :call DeleteTrailingWhitespace()<CR>

function! DeleteHiddenBuffers()
    " http://stackoverflow.com/a/8459043/719547
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

" Populate quickfix window with FIXME/TODO.
command! Fixme Ack 'fixme|todo'

if filereadable('.vimrc-project') | source .vimrc-project | endif

if filereadable(expand('~/.vim-local/vimrc-local')) | source ~/.vim-local/vimrc-local | endif
