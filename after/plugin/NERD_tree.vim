let g:NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeWinSize = 51
let g:NERDTreeMinimalUI = 1

function! NerdTreeIsOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! NerdTreeFindOrClose()
  if NerdTreeIsOpen()
    NERDTreeToggle
  else
    NERDTreeFind
  endif
endfunction

nnoremap <silent> <Leader>d :call NerdTreeFindOrClose()<cr>
