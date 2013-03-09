" Where all the plugins are specified, using Vundle

" Initialize vundle!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ----------------------------
" Plugins, managed by Vundle!
" ----------------------------

" Use to manage plugins!
Bundle 'gmarik/vundle'

" ----------------
" --- Movement ---
" ----------------
" Easier vim motions. Try <Leader><Leader>w or <Leader><Leader>fo
Bundle 'Lokaltog/vim-easymotion'
" Like Command-T or fuzzyfinder. Use to fuzzy find files
Bundle 'kien/ctrlp.vim'

" -----------------------
" --- UI enhancements ---
" -----------------------
" Highlight levels of indentation
Bundle 'mutewinter/vim-indent-guides'
" File explorer within Vim
Bundle 'scrooloose/nerdtree'
" Ultimate Vim statusline utility
Bundle 'Lokaltog/vim-powerline'
" Highlights the matching HTML tag
Bundle 'gregsexton/MatchTag'
" Rainbow parentheses!! :)
Bundle 'kien/rainbow_parentheses.vim'
