if has("autocmd")
  autocmd BufRead,BufNewFile Guardfile,.Guardfileset,.guardrc setfiletype ruby
endif
