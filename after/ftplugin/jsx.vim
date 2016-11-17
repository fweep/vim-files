" vim-jsx renames the filetype to javascript.jsx, but this file needs to be jsx.vim to load.
setlocal tabstop=2 shiftwidth=2 softtabstop=2
setlocal foldmethod=indent foldlevel=20 formatoptions-=o
autocmd BufWinEnter,BufEnter,WinEnter       * if &ft ==# 'javascript.jsx' | setlocal cursorline | endif
autocmd BufWinLeave,BufLeave,WinLeave       * if &ft ==# 'javascript.jsx' | setlocal nocursorline | endif
