" ~/.vim/vimrc

" Be more Vimmy.
set nocompatible

" Add vim-shared to runtimepath for autoload.
set runtimepath+=$HOME/.config/nvim/vim-shared

" Shared plugins.
source $HOME/.vim/vim-shared/plugins.vim

" Turn on syntax highlighting.
syntax enable

" Auto-load plugins and indent files based on filetype.
filetype plugin indent on

" Shared options.
source $HOME/.vim/vim-shared/options.vim

" Shared theme/visualization config.
source $HOME/.vim/vim-shared/theme.vim

" Shared key mappings/bindings.
source $HOME/.vim/vim-shared/mappings.vim

" This probably belongs in shared/options.vim or something.
runtime macros/matchit.vim

" Add vim-shared/after to override plugin defaults.
set runtimepath+=$HOME/.config/nvim/vim-shared/after
