vim-files
========

This is my current Vim configuration.  Uses Solarized (dark).  Plugins
are primarily targeted at Python, Rails and Vimscript development.
Mostly Python these days, so the others may be stale.

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

* [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim.git)
  Fuzzy file/buffer/tag finder.

* [sjl/gundo](http://github.com/sjl/gundo.vim.git)
  Visualize undo tree.

* [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree.git)
  Directory navigation & bookmarks.

* [chrisbra/NrrwRgn](https://github.com/chrisbra/NrrwRgn.git)
  Edit part of a file in a temporary buffer.

* [klen/python-mode](https://github.com/klen/python-mode)
  Various helpful things for Python development. I disable most of it
because other plugins provide better implementations (syntastic and
YouCompleteMe in particular), and some features are disabled because
the key bindings conflicted (Rope), but it seems worth exploring.

* [scrooloose/syntastic](https://github.com/scrooloose/syntastic.git)
  Display syntax errors.

* [godlygeek/tabular](https://github.com/godlygeek/tabular)
  For aligning text.

* [majutsushi/tagbar](https://github.com/majutsushi/tagbar.git)
  Navigate code based on CTAGS.

* tslime
  Interact with tmux. Not a submodule, and never use it, so I dunno
what version/origin it has. In theory, it's something I might want to
use.

* [https://github.com/SirVer/ultisnips](https://github.com/SirVer/ultisnips)
  Programmable snippets. Another thing I never use but really ought to.
It seems like fun.

* [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
  Code-completion engine that supports smart, context-sensitive tab completion
for a number of languages, and generic tab completion for everything
else.

* [tpope/vim-abolish](https://github.com/tpope/vim-abolish.git)
  Case-insensitive-but-case-preserving search-and-replace, CamelCase-to-snakecase refactoring.

* [jgdavey/vim-blockle](https://github.com/jgdavey/vim-blockle)
  Toggle Ruby block styles, between `do`/`end` and `{` braces `}`.

* [jeetsukumaran/vim-buffergator](https://github.com/jeetsukumaran/vim-buffergator.git)
  Buffer navigation. Nice display of open buffers similar to nerdtree's
directory listing, with the ability to delete or open in splits.

* [tpope/vim-bundler](https://github.com/tpope/vim-bundler.git)
  Tools for working with Ruby [Bundler](http://gembundler.com).

* [kchmck/vim-coffee-script](https://github.com/kchmck/vim-coffee-script.git)
  [CoffeeScript](http://coffeescript.org) syntax highlighting and more.

* [altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized.git)
  [Solarized](http://ethanschoonover.com/solarized) colorscheme.

* [tpope/vim-commentary](https://github.com/tpope/vim-commentary.git)
  Quick code commenting.

* [tpope/vim-endwise](https://github.com/tpope/vim-endwise.git)
  Add closing keywords automatically (do -> end).

* [tpope/vim-eunuch](https://github.com/tpope/vim-eunuch.git)
  Rename file & buffer and other file-related tools.

* [nvie/vim-flake8](https://github.com/nvie/vim-flake8)
  A Python pyflakes/pep8 plugin. Turns out to be unnecessary because
both python-mode and syntastic will already run these. But it's still
laying around.

* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive.git)
  [Git](http://git-scm.com) wrapper.

* [Glench/Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax)
  Syntax highlighting for the [Jinja2](http://jinja.pocoo.org/)
HTML (and others) templating system for Python.

* [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)
  Syntax highlighting for
[Markdown](http://daringfireball.net/projects/markdown/) files.

* [tpope/vim-obsession](https://github.com/tpope/vim-obsession)
  Improvements to session management. _I never use sessions, so I don't
know how well this works._

* [Lokaltog/vim-powerline](https://github.com/Lokaltog/vim-powerline.git)
  Fancy status line, with Git branch and other information.

* [tpope/vim-rails](https://github.com/tpope/vim-rails.git)
  Rails awesomeness.

* [tpope/vim-repeat](https://github.com/tpope/vim-repeat.git)
  Makes many of Tim Pope's plugin actions repeatable via `.`.

* [janx/vim-rubytest](https://github.com/janx/vim-rubytest.git)
  Run Ruby tests.

* [tpope/vim-scriptease](https://github.com/tpope/vim-scriptease)
  Easier editing/exploring of Vim runtime files/bundles.

* [tpope/vim-surround](https://github.com/tpope/vim-surround.git)
  Refactor quotes/tags around text.

* [fweep/vim-tabber](https://github.com/fweep/vim-tabber)
  Improved tabline display, programmable tab labels.

* [nelstrom/vim-textobj-rubyblock](https://github.com/nelstrom/vim-textobj-rubyblock)
  Ruby syntax-aware textobjects for various syntactic blocks.

* [kana/vim-textobj-user](https://github.com/kana/vim-textobj-user)
  Dependency of vim-textobj-rubyblock.

* [tpope/vim-unimpaired](https://github.com/tpope/vim-unimpaired)
  Easier navigation of buffer stack and quickfix entries, among other
things.

* [mattn/zencoding-vim](https://github.com/mattn/zencoding-vim)
  Expand abbreviations, snippet-like.

* [vim-scripts/ZoomWin](https://github.com/vim-scripts/ZoomWin.git)
  Temporarily make the current window the only one visible, then restore layout.

Most plugins are Git submodules.  Pathogen is intentionally not a submodule.

Plugins I used to use
----

I've removed these plugins, but want to keep notes about them. They
either conflicted with keybindings, or were obsoleted by other plugin
functionality.

_(Note to plugin developers: if your plugin creates more than a couple
basic bindings, you should rethink your UI or namespace them under an
easy-to-change `<Leader>` prefix.)_

* [ervandew/supertab](https://github.com/ervandew/supertab.git)
  Tab completion. Deprecated in favor of
[Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe),
but still a nice plugin if the latter is overkill.

* [vim-scripts/YankRing](https://github.com/vim-scripts/YankRing.vim.git)
  Retain and browse yank history. Never worked it into my routine, and
its bindings were causing me trouble. Might be worth learning.

Notes
-----

If the author maintains a GitHub account, their repository is used.  If not,
the [vim-scripts](https://github.com/vim-scripts) version is used.  If
neither of those exist, the files are included directly in this repository.
