" FIXME: consider installing vim-shared as a plugin with an after directory.

" pylint only runs on save.  flake8/pep8 can run in realtime.
let g:ale_linters = {
      \ 'python': ['pylint', 'flake8'],
      \ }

" FIXME: current client needs pep8; this should be flake8 in default config.
let g:ale_python_flake8_executable = 'pep8'

" Ignore some flake8 errors.
" FIXME: current client rules; this should be per-project.
let g:ale_python_flake8_options = '--ignore=E501,E123'

" Don't lint while in insert mode; wait until we're back in normal mode.
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" Always show the sign column so text doesn't shift around with realtime linting.
let g:ale_sign_column_always = 1

" Use highlights that go well with Solarized Dark.
highlight ALEErrorSign ctermbg=1 ctermfg=7
highlight ALEWarningSign ctermbg=2 ctermfg=7
