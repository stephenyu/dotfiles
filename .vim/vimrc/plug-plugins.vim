let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" AirLine
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NerdTree
Plug 'scrooloose/nerdtree'

" Fuzzyfinder, Most-Recent-View, Buffer
Plug 'ctrlpvim/ctrlp.vim'

" Multiple Languages
Plug 'sheerun/vim-polyglot'

" SnipMate
Plug 'garbas/vim-snipmate'

" SnipMate Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'timmywil/snipmate-snippets'

" Allows Bubble Movement
Plug 'tpope/vim-unimpaired'

" Easy Motion
Plug 'Lokaltog/vim-easymotion'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Text Objects
Plug 'jiangmiao/auto-pairs'

Plug 'ervandew/supertab'

Plug 'tmhedberg/matchit'

" ---
" LANGUAGE SPECIFICS
" ---

Plug 'vim-syntastic/syntastic'

Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'rstacruz/sparkup'

Plug 'tpope/vim-commentary'

Plug 'Yggdroot/indentLine'


call plug#end()
