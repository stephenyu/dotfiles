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

" Show Marks
Plug 'kshenoy/vim-signature'

" fzf vim
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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

" Highlight Word
Plug 'RRethy/vim-illuminate'

" Spell Checking
" Plug 'kamykn/spelunker.vim'

" WordMotion
Plug 'chaoren/vim-wordmotion'

" ---
" LANGUAGE SPECIFICS
" ---

" Rust
Plug 'rust-lang/rust.vim'

" TypeScript
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-snippets']

Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'leafgarland/typescript-vim'
"Plug 'stephenyu/vim-jsx-typescript'

" Proto
Plug 'uarun/vim-protobuf'

call plug#end()
