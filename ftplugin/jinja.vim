setlocal foldmethod=syntax foldlevel=20 formatoptions-=o
autocmd BufWinEnter,BufEnter,WinEnter       * if &ft ==# 'jinja' | setlocal cursorline | endif
autocmd BufWinLeave,BufLeave,WinLeave       * if &ft ==# 'jinja' | setlocal nocursorline | endif
