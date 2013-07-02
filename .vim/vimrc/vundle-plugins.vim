" let Vundle manage Vundle
" required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"" -----------------------
"" --- UI enhancements ---
"" -----------------------
"" Highlight levels of indentation
Bundle 'mutewinter/vim-indent-guides'
""" File explorer within Vim
Bundle 'scrooloose/nerdtree'
" Ultimate Vim statusline utility
Bundle 'Lokaltog/vim-powerline'
" Bubble Movements
Bundle 'tpope/vim-unimpaired'
" Most Recent Updates Toggle
Bundle 'mru.vim'
" Easy Motion
Bundle 'Lokaltog/vim-easymotion'

"" ----------------------------
"" --- Editing enhancements ---
"" ----------------------------
"" Shortcuts to comment code. Use <Leader>cc or <Leader>c<Space>
Bundle 'scrooloose/nerdcommenter'
""" Simple shortcuts to deal with surrounding symbols
Bundle 'tpope/vim-surround'
""" Text filtering and alignment
Bundle 'godlygeek/tabular'
""" Insert-mode autocompletion for quotes, parens, brackets, etc.
Bundle 'Raimondi/delimitMate'
""" Syntax checking in Vim!
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
Bundle "honza/snipmate-snippets"

"" --------------------------------------
"" --- Language Specific Enhancements ---
"" --------------------------------------
" SnipMate
Bundle "garbas/vim-snipmate"

" Sass
Bundle "cakebaker/scss-syntax.vim"

" Dash Integration (Mac Only)
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
