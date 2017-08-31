" .vimrc

" Be more Vimmy.
set nocompatible

filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'pangloss/vim-javascript'

let g:buffergator_suppress_keymaps = 1
Plugin 'jeetsukumaran/vim-buffergator'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
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
Plugin 'scrooloose/syntastic'
Plugin 'elixir-lang/vim-elixir'
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-dispatch'
Plugin 'thoughtbot/vim-rspec'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'sjl/gundo.vim'

" Needs to be after Powerline to override its tabline wrongness.
Plugin 'fweep/vim-tabber'
Plugin 'fweep/vim-cscope'

call vundle#end()

" Turn on syntax highlighting.
syntax enable

" Auto-load plugins and indent files based on filetype.
filetype plugin indent on

runtime macros/matchit.vim

" Shared options.
source $HOME/.vim/vim-shared/options.vim

" Shared theme/visualization config.
source $HOME/.vim/vim-shared/theme.vim

" Shared key mappings/bindings.
source $HOME/.vim/vim-shared/mappings.vim

" Vim-specific config.

" Support SGR mouse if available, fall back to xterm2 mouse.
if has("mouse_sgr")
  " Allows mouse clicking beyond terminal column 222.
  set ttymouse=sgr
else
  set ttymouse=xterm2
endif

" Save more history for marks, commands, searches, etc. between invocations.
set viminfo='100,/1000,:1000,<50,s100,h,c

" Local overrides.
if filereadable(expand('~/.vim-local/vimrc-local')) | source ~/.vim-local/vimrc-local | endif

" Read project-specific vimrc.  NOTE: this is dangerous in downloaded projects,
" and Vim already supports this functionality via 'exrc', but I'm using it for my
" own projects.
if filereadable('.vimrc-project') | source .vimrc-project | endif
