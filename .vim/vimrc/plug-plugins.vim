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

" YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" NerdTree
Plug 'scrooloose/nerdtree'

" Fuzzyfinder, Most-Recent-View, Buffer
Plug 'ctrlpvim/ctrlp.vim'

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

Plug 'tmhedberg/matchit'

Plug 'tpope/vim-commentary'

Plug 'Yggdroot/indentLine'

Plug 'vim-syntastic/syntastic'

" ---
" LANGUAGE SPECIFICS
" ---

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'

" HTML
Plug 'rstacruz/sparkup'

" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" React
" Plug 'mxw/vim-jsx'

call plug#end()
