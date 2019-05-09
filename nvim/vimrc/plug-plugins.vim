let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo "
  silent !\curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')

" Status Bar
Plug 'itchyny/lightline.vim'

" Autocompletion Bar
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" ColorThemes
Plug 'stephenyu/vim-tomorrow-theme'

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

" HTML
Plug 'mattn/emmet-vim', {'for': ['html', 'javascript.jsx', 'typescript.tsx']}

Plug 'mxw/vim-jsx'

Plug 'Shougo/denite.nvim'

" TypeScript
Plug 'HerringtonDarkholme/yats.vim' " Syntax
Plug 'mhartington/nvim-typescript', {'for': ['typescript', 'tsx'], 'do': './install.sh' }

call plug#end()
