setlocal tabstop=4 shiftwidth=4 softtabstop=4
setlocal foldmethod=syntax foldlevel=20 formatoptions-=o
autocmd BufWinEnter,BufEnter,WinEnter       * if &ft ==# 'javascript' | setlocal cursorline | endif
autocmd BufWinLeave,BufLeave,WinLeave       * if &ft ==# 'javascript' | setlocal nocursorline | endif
