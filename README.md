vim-files
========

This is my current Vim configuration.  Uses Solarized (dark).  Plugins
are primarily targeted at Rails and Vimscript development.

Requirements
------------

* Font patched for [Powerline](https://github.com/Lokaltog/vim-powerline.git).
* [Solarized](https://github.com/altercation/solarized) terminal.

Contents
--------

Includes the following plugins:

* [tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)
  Manages plugins.

* [mileszs/ack.vim](https://github.com/mileszs/ack.vim.git)
  Output from [ack](http://betterthangrep.com/) (a code-savvy grep replacement) in the quickfix window.

* [vim-scripts/bufkill.vim](https://github.com/vim-scripts/bufkill.vim.git)
  Buffer unload/delete/wipe without closing the current window.

* [Conque-Shell](http://code.google.com/p/conque/)
  Interactive shell in a window.

* [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim.git)
  Fuzzy file/buffer/tag finder.

* [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree.git)
  Directory navigation & bookmarks.

* [chrisbra/NrrwRgn](https://github.com/chrisbra/NrrwRgn.git)
  Edit part of a file in a temporary buffer.

* [ervandew/supertab](https://github.com/ervandew/supertab.git)
  Tab completion.

* [scrooloose/syntastic](https://github.com/scrooloose/syntastic.git)
  Display syntax errors.

* [majutsushi/tagbar](https://github.com/majutsushi/tagbar.git)
  Navigate code based on CTAGS.

* [tpope/vim-abolish](https://github.com/tpope/vim-abolish.git)
  Case-insensitive-but-case-preserving search-and-replace, CamelCase-to-snakecase refactoring.

* [jeetsukumaran/vim-buffergator](https://github.com/jeetsukumaran/vim-buffergator.git)
  Buffer navigation.

* [tpope/vim-bundler](https://github.com/tpope/vim-bundler.git)
  Tools for working with Ruby [Bundler](http://gembundler.com).

* [kchmck/vim-coffee-script](https://github.com/kchmck/vim-coffee-script.git)
  [CoffeeScript](http://coffeescript.org) syntax highlighting and more.

* [tpope/vim-commentary](https://github.com/tpope/vim-commentary.git)
  Quick code commenting.

* [tpope/vim-endwise](https://github.com/tpope/vim-endwise.git)
  Add closing keywords automatically (do -> end).

* [tpope/vim-eunuch](https://github.com/tpope/vim-eunuch.git)
  Rename file & buffer and other file-related tools.

* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive.git)
  [Git](http://git-scm.com) wrapper.

* [Lokaltog/vim-powerline](https://github.com/Lokaltog/vim-powerline.git)
  Fancy status line, with Git branch and other information.

* [tpope/vim-rails](https://github.com/tpope/vim-rails.git)
  Rails awesomeness.

* [tpope/vim-repeat](https://github.com/tpope/vim-repeat.git)
  Not sure this needs to be here...

* [janx/vim-rubytest](https://github.com/janx/vim-rubytest.git)
  Run Ruby tests.

* [tpope/vim-surround](https://github.com/tpope/vim-surround.git)
  Refactor quotes/tags around text.

* [vim-scripts/YankRing](https://github.com/vim-scripts/YankRing.vim.git)
  Retain and browse yank history.

* [mattn/zencoding-vim](https://github.com/mattn/zencoding-vim)
  Expand abbreviations, snippet-like.

* [vim-scripts/ZoomWin](https://github.com/vim-scripts/ZoomWin.git)
  Temporarily make the current window the only one visible, then restore layout.

Most plugins are Git submodules.  Pathogen is intentionally not a submodule.  Conque-Shell is installed from source because the vim-scripts version is missing the Python files.

If the author maintains a GitHub account, their repository is used.  If not,
the [vim-scripts](https://github.com/vim-scripts) version is used.  If
neither of those exist, the files are included directly in this repository.
