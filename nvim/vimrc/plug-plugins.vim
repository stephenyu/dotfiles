" Check if Plug is installed.
let plug_path = stdpath('config') . '/autoload/plug.vim'

if !filereadable(plug_path)
  echo "Installing Vim-Plug..."
  echo ""
  exe '!curl -fLo ' . plug_path . ' --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
endif

call plug#begin('~/.config/nvim/plugged')

" Coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
Plug 'mg979/vim-visual-multi'

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

" Nerdtree
Plug 'preservim/nerdtree'

" Github
Plug 'ruanyl/vim-gh-line'

" Snippets
" Plug 'honza/vim-snippets'

" Quick Motion
Plug 'justinmk/vim-sneak'

" Highlight Word
Plug 'RRethy/vim-illuminate'

" WordMotion
Plug 'chaoren/vim-wordmotion'

" Treesitter (Neovim Syntax Highlighting System)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Language Server Protocol (LSP)
Plug 'neovim/nvim-lspconfig'

" Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" ---
" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'windwp/nvim-autopairs'

Plug 'quick-lint/quick-lint-js', {'rtp': 'plugin/vim/quick-lint-js.vim', 'tag': '2.4.2'}

" Writing
" Plug 'jose-elias-alvarez/null-ls.nvim'
" Plug 'nvim-lua/plenary.nvim'

call plug#end()
