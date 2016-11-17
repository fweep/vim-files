setlocal tabstop=2 shiftwidth=2 softtabstop=2
setlocal foldmethod=indent foldlevel=20 formatoptions-=o
autocmd BufWinEnter,BufEnter,WinEnter       * if &ft ==# 'javascript' | setlocal cursorline | endif
autocmd BufWinLeave,BufLeave,WinLeave       * if &ft ==# 'javascript' | setlocal nocursorline | endif
