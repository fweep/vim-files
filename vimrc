" .vimrc

" Be more Vimmy.
set nocompatible

" Shared plugins.
source $HOME/.vim/vim-shared/plugins.vim

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
