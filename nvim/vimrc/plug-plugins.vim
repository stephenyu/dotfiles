" Check if Plug is installed.
let plug_path = stdpath('config') . '/autoload/plug.vim'

if !filereadable(plug_path)
  echo "Installing Vim-Plug..."
  echo ""
  exe '!curl -fLo ' . plug_path . ' --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
endif

call plug#begin('~/.config/nvim/plugged')

" Status Bar
Plug 'itchyny/lightline.vim'

" ColorThemes
Plug 'stephenyu/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'

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

" Git Wrapper
Plug 'tpope/vim-fugitive'

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Github
Plug 'ruanyl/vim-gh-line'

" Snippets
Plug 'honza/vim-snippets'

" Quick Motion
Plug 'justinmk/vim-sneak'

" ---
" LANGUAGE SPECIFICS
" ---

" TypeScript
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-snippets']

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Rust
Plug 'rust-lang/rust.vim'

" Proto
Plug 'uarun/vim-protobuf'

call plug#end()
