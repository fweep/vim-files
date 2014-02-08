let g:syntastic_python_checkers = ["flake8"]
" E711: comparison to None should be 'if condition is None:'
" E712: comparison to True should be 'if condition is True:'
let g:syntastic_python_flake8_args = "--max-line-length=119 --ignore=E711,E712"
