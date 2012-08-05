set nocompatible
set encoding=utf-8

set t_Co=256
set term=xterm-256color

colorscheme railscasts
syntax on
filetype plugin indent on

set hidden
set history=1000

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

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

set backupdir=~/.vim/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,/var/tmp,/tmp

"set listchars=tab:>-,trail:·,eol:$,extends:>
"nmap <silent> <leader>s :set nolist!<CR>

let mapleader = ","

set pastetoggle=<F2>
nnoremap ' `
nnoremap ` '
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>
nmap <silent> <C-n> :silent :nohlsearch<CR>
imap <silent> <S-tab> <C-v><tab>
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>
imap <khome> <home>
nmap <khome> <home>
map <C-v><BS> X

nnoremap <Left> :echoe "Use H"<CR>
nnoremap <Right> :echoe "Use L"<CR>
nnoremap <Up> :echoe "Use K"<CR>
nnoremap <Down> :echoe "Use J"<CR>

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

call pathogen#infect()

nnoremap <leader>d :NERDTreeToggle<cr>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let g:Powerline_symbols = 'fancy'
