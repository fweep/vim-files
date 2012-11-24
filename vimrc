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

set foldmethod=syntax
set foldlevel=20

set nowrap
set scrolloff=4
set sidescrolloff=10
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
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
imap <silent> <S-tab> <C-v><tab>
nmap <C-j> :bp<CR>
nmap <C-k> :bn<CR>
imap <khome> <home>
nmap <khome> <home>
map <C-v><BS> X

nnoremap <Leader>1 :tabnext 1<CR>
nnoremap <Leader>2 :tabnext 2<CR>
nnoremap <Leader>3 :tabnext 3<CR>
nnoremap <Leader>4 :tabnext 4<CR>
nnoremap <Leader>5 :tabnext 5<CR>
nnoremap <Leader>6 :tabnext 6<CR>
nnoremap <Leader>7 :tabnext 7<CR>
nnoremap <Leader>8 :tabnext 8<CR>
nnoremap <Leader>9 :tabnext 9<CR>

nmap <C-s><C-s> :SaveSession<CR>
nmap <C-s><C-r> :OpenSession<CR>

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

runtime macros/matchit.vim

nmap <unique> <C-w>w <Plug>ZoomWin

nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <F6> :TagbarToggle<CR>

let g:buffergator_suppress_keymaps=1
nnoremap <leader><leader> :BuffergatorToggle<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let g:Powerline_symbols='fancy'

let g:session_autoload=0
let g:session_autosave=1

let g:yankring_window_height = 10
let g:yankring_default_menu_mode = 0

autocmd QuickFixCmdPost *grep* cwindow

let g:syntastic_disabled_filetypes = ['cucumber'] "FIXME: don't think this is disabling

let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_TERM = 'xterm-256color'

set tabline=%!tabline#TabLine()

nnoremap <silent> <C-t> :TabLineNew<CR>
