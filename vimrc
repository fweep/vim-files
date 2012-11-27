set nocompatible
set encoding=utf-8

syntax on
filetype plugin indent on

call pathogen#infect()

set t_Co=256
set term=xterm-256color

" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" set background=dark
" colorscheme solarized

colorscheme railscasts "NOTE: modifications need to go in after/plugin/CSApprox.vim

set hidden
set history=1000

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

set nowrap
set scrolloff=8
set sidescrolloff=20
set sidescroll=1

set title
set number
set visualbell t_vb=
set noerrorbells
set shortmess=aTI
set laststatus=2
set showmatch
set matchtime=0

set hlsearch
set incsearch
set ignorecase
set smartcase

set list listchars=tab:>·,trail:·,nbsp:·,extends:>

set wildmenu
set wildmode=list:longest
set wildignore=.git,*.swp,*/tmp/*

set sessionoptions-=help

set backupdir=~/.vim/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,/var/tmp,/tmp

set showtabline=2

let mapleader = ","

set pastetoggle=<F2>
nnoremap ' `
nnoremap ` '
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
nnoremap <C-k> :bp<CR>
nnoremap <C-j> :bn<CR>

" Why are these here?
noremap <C-v><BS> X
inoremap <khome> <home>
nnoremap <khome> <home>

nnoremap <silent> <Leader>1 :tabnext 1<CR>
nnoremap <silent> <Leader>2 :tabnext 2<CR>
nnoremap <silent> <Leader>3 :tabnext 3<CR>
nnoremap <silent> <Leader>4 :tabnext 4<CR>
nnoremap <silent> <Leader>5 :tabnext 5<CR>
nnoremap <silent> <Leader>6 :tabnext 6<CR>
nnoremap <silent> <Leader>7 :tabnext 7<CR>
nnoremap <silent> <Leader>8 :tabnext 8<CR>
nnoremap <silent> <Leader>9 :tabnext 9<CR>

let g:session_autoload=0
let g:session_autosave=1
noremap <C-s><C-s> :SaveSession<CR>
nnoremap <C-s><C-r> :OpenSession<CR>

let g:yankring_window_height = 10
let g:yankring_default_menu_mode = 0
nnoremap <silent> <F12> :YRShow<CR>

inoremap <silent> <home> <C-O>:call Home()<CR>
nnoremap <silent> <home> :call Home()<CR>
function Home()
    let curcol = wincol()
    normal ^
    let newcol = wincol()
    if newcol == curcol
        normal 0
    endif
endfunction

" Open help in a full-height vertical split at the right.
cnoreabbrev <expr> help getcmdtype() == ':' && getcmdline() == 'help' ? 'vert bo h' : 'help'
cnoreabbrev <expr> h getcmdtype() == ':' && getcmdline() == 'h' ? 'vert bo h' : 'h'

runtime macros/matchit.vim

nnoremap <unique> <C-w>w <Plug>ZoomWin
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <F6> :TagbarToggle<CR>

let g:buffergator_suppress_keymaps=1
nnoremap <leader><leader> :BuffergatorToggle<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let g:Powerline_symbols='fancy'

autocmd QuickFixCmdPost *grep* cwindow

autocmd FileType vim setlocal foldmethod=marker foldlevel=0
autocmd FileType ruby setlocal foldmethod=syntax foldlevel=20

let g:syntastic_disabled_filetypes = ['cucumber'] "FIXME: don't think this is disabling

let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_TERM = 'xterm-256color'

set tabline=%!tabber#TabLine()

nnoremap <C-t> :999TabberNew<CR>
nnoremap <C-e> :TabberSelectLastActive<CR>
nnoremap < :TabberShiftLeft<CR>
nnoremap > :TabberShiftRight<CR>

if filereadable('.vimrc-project')
  source .vimrc-project
endif

let g:tabber_wrap_when_shifting = 1
" let g:tabber_default_unknown_label = 'Unknown'
" let g:tabber_default_user_label = 'Scratch'
" let g:tabber_prompt_for_new_label = 1
