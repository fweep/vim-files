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

"TODO: move to plugins

function! FweepParseChars(arg)
  "TODO: attribution to powerline
  let arg = a:arg
  if type(arg) == type([])
    call map(arg, 'nr2char(v:val)')
    return join(arg, '')
  endif
  return arg
endfunction

function! FweepSetTabName(tab_number, label)
  if !exists("g:fweep_tab_names")
    let g:fweep_tab_names = {}
  endif
  let g:fweep_tab_names[a:tab_number] = a:label
  redraw!
endfunction

function! FweepClearTabName(tab_number)
  if exists("g:fweep_tab_names")
    let removed_tab_name = get(g:fweep_tab_names, a:tab_number, "***NONEFOUND***")
    if removed_tab_name != "***NONEFOUND***"
      let removed = remove(g:fweep_tab_names, a:tab_number) "unlet g:fweep_tab_names[a:tab_number]
      redraw!
    endif
  endif
endfunction

function! FweepTabLine()
  if !exists("g:fweep_tab_names")
    let g:fweep_tab_names = {}
  endif
  let dividers = [ [0x2b80], [0x2b81], [0x2b82], [0x2b83] ]
  let divider_hard = FweepParseChars(deepcopy(dividers[0]))
  let divider_soft = FweepParseChars(deepcopy(dividers[1]))

  exec 'hi FweepTabLineTabNumber ctermbg=235 ctermfg=33'
  exec 'hi FweepTabLineTabNumberSel ctermbg=239 ctermfg=33'
  exec 'hi FweepTabLineWindowCount ctermbg=235 ctermfg=33'
  exec 'hi FweepTabLineWindowCountSel ctermbg=239 ctermfg=33'
  exec 'hi FweepTabLineModifiedFlag ctermbg=235 ctermfg=red'
  exec 'hi FweepTabLineModifiedFlagSel ctermbg=239 ctermfg=red'
  exec 'hi FweepTabLine ctermfg=244 ctermbg=235'
  exec 'hi FweepTabLineSel cterm=reverse ctermfg=239 ctermbg=187'
  exec 'hi FweepTabLineFill ctermfg=244 ctermbg=235'
  exec 'hi FweepTabLineDivider cterm=reverse ctermfg=239 ctermbg=235'
  exec 'hi FweepTabLineDividerSel ctermbg=235 ctermfg=239'
  exec 'hi FweepTabLineUserLabel ctermfg=173 ctermbg=235'
  exec 'hi FweepTabLineUserLabelSel ctermfg=173 ctermbg=239'

  let s = ''

  let current_tab_number = tabpagenr()
  let tab_count = tabpagenr('$')

  for tab_index in range(tab_count)

    let tab_number = tab_index + 1
    let buffer_list = tabpagebuflist(tab_number)
    let window_number = tabpagewinnr(tab_number)
    let buffer_name = bufname(buffer_list[window_number - 1])
    let number_of_windows = tabpagewinnr(tab_number, '$')

    let sel = ''
    if tab_number == current_tab_number
      let sel = 'Sel'
    endif

    let tab_highlight = '%#FweepTabLine' . sel . '#'
    let s .= tab_highlight . ' '
    let s .= '%' . tab_number . 'T'
    let s .= '%#FweepTabLineTabNumber' . sel . '#' .tab_number . tab_highlight

    if number_of_windows > 1
      let s .= ':' . '%#FweepTabLineWindowCount' . sel . '#' . number_of_windows . tab_highlight
    endif

    let modified = 0
    for buffer_number in buffer_list
      let buffer_modified = getbufvar(buffer_number, '&modified')
      if buffer_modified
        let modified = 1
      endif
    endfor

    if modified
      let s .= ' ' . '%#FweepTabLineModifiedFlag' . sel . '#+' . tab_highlight
    endif

    if buffer_name != ''
      let default_tab_label = pathshorten(buffer_name)
    else
      let default_tab_label = '[No Name]'
    endif

    "FIXME: figure out why this doesn't work:
    " let user_label = get(g:fweep_tab_names, tab_number)
    " if user_label == 0
    let user_label = get(g:fweep_tab_names, tab_number, "***NONEFOUND***")
    if user_label == "***NONEFOUND***"
      let tab_label = default_tab_label
    else
      let tab_label = '%#FweepTabLineUserLabel' . sel . '#' . user_label . tab_highlight
    endif

    let s .= ' ' . tab_label

    let s .= '%T '

    if (current_tab_number == tab_number || current_tab_number == (tab_number + 1))
      let s .= '%#FweepTabLineDivider' . sel . '#' . divider_hard . tab_highlight
    elseif tab_number != tab_count
      let s .= divider_soft
    endif

    "divider

  endfor

  let s .= '%#FweepTabLineFill#%=%999XX'

  return s
endfunction

set tabline=%!FweepTabLine()
