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

" YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" NerdTree
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}

" fzf vim
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Surround
Plug 'tpope/vim-surround'

" Allows Bubble Movement
Plug 'tpope/vim-unimpaired'

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" Easy Motion
Plug 'Lokaltog/vim-easymotion'

" UltiSnips
Plug 'SirVer/ultisnips'

" Snippets
Plug 'honza/vim-snippets'

" Matching of Elements using %
Plug 'tmhedberg/matchit'

" Toggle Commenting in and out of lines.
Plug 'tpope/vim-commentary'

" Shows the indentation of Lines
Plug 'Yggdroot/indentLine'

Plug 'w0rp/ale'

Plug 'terryma/vim-multiple-cursors'

" Git Wrapper
Plug 'tpope/vim-fugitive'

" Git Gutter
Plug 'airblade/vim-gitgutter'

Plug 'Xuyuanp/nerdtree-git-plugin'
" ---
" LANGUAGE SPECIFICS
" ---

" Javascript
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
" Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}

" HTML
Plug 'mattn/emmet-vim', {'for': ['html', 'javascript.jsx', 'typescript.tsx']}

" PHP
Plug 'StanAngeloff/php.vim', {'for': 'php'}

" JSX
Plug 'mxw/vim-jsx'

" Nginx
Plug 'chr4/nginx.vim'

" Markdown
" Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

" Solarized theme
Plug 'altercation/vim-colors-solarized'

" TypeScript
Plug 'leafgarland/typescript-vim'   " Syntax
Plug 'HerringtonDarkholme/yats.vim' " Syntax
Plug 'Quramy/tsuquyomi'             " YouCompleteMe
Plug 'ianks/vim-tsx'                " .tsx file format

call plug#end()
