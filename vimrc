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

nmap <C-s><C-s> :SaveSession<CR>
nmap <C-s><C-r> :OpenSession<CR>

nnoremap <silent> <F11> :YRShow<CR>

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
nnoremap <F8> :TagbarToggle<CR>

let g:buffergator_suppress_keymaps=1
nnoremap <leader><leader> :BuffergatorToggle<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let g:Powerline_symbols='fancy'

let g:session_autoload=0
let g:session_autosave=1

let g:yankring_window_height = 10
let g:yankring_default_menu_mode = 0

autocmd QuickFixCmdPost *grep* cwindow

let g:syntastic_disabled_filetypes = ['cucumber']

"TODO: move to plugins

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    let s .= '%' . (i + 1) . 'T'
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor
  let s .= '%T%=%#TabLineFill#'
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif
  return s
endfunction

function MyTabLabel(tab_number)
  "TODO: allow manual setting of current tab name
  let buffer_list = tabpagebuflist(a:tab_number)
  let window_number = tabpagewinnr(a:tab_number)
  let buffer_name = bufname(buffer_list[window_number - 1])
  let buffer_modified = getbufvar(a:tab_number, '&modified')
  let number_of_windows = tabpagewinnr(a:tab_number, '$')

  let s = a:tab_number
  if number_of_windows > 1
    let s .= ':' . window_number
  endif
  if buffer_modified
    let s .= ' +'
  endif
  if buffer_name != ''
    let s .= ' ' . pathshorten(buffer_name)
  else
    let s .= ' [No Name]'
  endif

  return s
endfunction

set tabline=%!MyTabLine()
