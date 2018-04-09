let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Status Bar
Plug 'itchyny/lightline.vim'
"
" YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" NerdTree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" Fuzzyfinder, Most-Recent-View, Buffer
Plug 'ctrlpvim/ctrlp.vim', {'on': 'CtrlP'}

" Multiple Languages
Plug 'sheerun/vim-polyglot'

" Allows Bubble Movement
Plug 'tpope/vim-unimpaired'

" Easy Motion
Plug 'Lokaltog/vim-easymotion'

" UltiSnips
Plug 'SirVer/ultisnips'

" Snippets
Plug 'honza/vim-snippets'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Matching of Elements using %
Plug 'tmhedberg/matchit'

" Toggle Commenting in and out of lines.
Plug 'tpope/vim-commentary'

" Shows the indentation of Lines
Plug 'Yggdroot/indentLine'

" Plug 'vim-syntastic/syntastic'
"
Plug 'w0rp/ale'

Plug 'terryma/vim-multiple-cursors'
" ---
" LANGUAGE SPECIFICS
" ---

" Javascript
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}

" HTML
Plug 'mattn/emmet-vim'

" TypeScript
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'

" React
" Plug 'mxw/vim-jsx'

call plug#end()
