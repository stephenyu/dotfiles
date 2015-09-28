" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

"" -----------------------
"" --- UI enhancements ---
"" -----------------------
" Highlight levels of indentation
Bundle 'nathanaelkane/vim-indent-guides'

" Ultimate Vim statusline utility
" 23/Jul/13 'Something going on with this plugin, used to work. Very slow over sshfs:'
" https://github.com/Lokaltog/powerline/issues/549
"Bundle 'Lokaltog/powerline'
Bundle 'Lokaltog/vim-powerline'

" Bubble Movements
Bundle 'tpope/vim-unimpaired'

" Most Recent Updates Toggle
Bundle 'mru.vim'

" Easy Motion
Bundle 'Lokaltog/vim-easymotion'


" Display Marks
Bundle 'kshenoy/vim-signature'

" Ctrl-P
" Bundle 'kien/ctrlp.vim'

" tmux-complete.vim
" Vim plugin for insert mode completion of words in adjacent tmux panes
" 25/Feb/15 Doesn't actually work
" Bundle 'wellle/tmux-complete.vim'

""" ----------------------------
""" --- Editing enhancements ---
""" ----------------------------
" Shortcuts to comment code. Use <Leader>cc or <Leader>c<Space>
Bundle 'scrooloose/nerdcommenter'

" Simple shortcuts to deal with surrounding symbols
Bundle 'tpope/vim-surround'

" Text filtering and alignment
Bundle 'godlygeek/tabular'

" Insert-mode autocompletion for quotes, parens, brackets, etc.
Bundle 'Raimondi/delimitMate'

" Syntax checking in Vim!
Bundle 'scrooloose/syntastic'

" Perform all vim insert mode completions with Tab!
Bundle 'ervandew/supertab'

" Add PHP Docs
Bundle 'PDV--phpDocumentor-for-Vim'

" Vim Text Objects
Bundle 'bkad/CamelCaseMotion'

" SnipMate Dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "timmywil/snipmate-snippets"

" Sublime Text's awesome multiple selection
Bundle "terryma/vim-multiple-cursors"

"" --------------------------------------
"" --- Language Specific Enhancements ---
"" --------------------------------------
" Javascript
Bundle "pangloss/vim-javascript"
Bundle "maksimr/vim-jsbeautify"

" Twig
Bundle "evidens/vim-twig"

" Angular JS
Bundle "othree/javascript-libraries-syntax.vim"
Bundle "matthewsimo/angular-vim-snippets"

" PHP
Bundle 'StanAngeloff/php.vim'
Bundle 'adoy/vim-php-refactoring-toolbox'
Bundle 'stephpy/vim-php-cs-fixer'

" HTML
Bundle "othree/html5.vim"
Bundle "rstacruz/sparkup"

" SnipMate
Bundle "garbas/vim-snipmate"

" Haml, Sass, and SCSS
Bundle "tpope/vim-haml"

" Ruby
Bundle "vim-ruby/vim-ruby"

" Markdown
Bundle "plasticboy/vim-markdown"
