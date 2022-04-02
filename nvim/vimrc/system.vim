set hidden
set history=100

" Python Locations
let g:python3_host_prog  = '/opt/homebrew/bin/python3'

" remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Backspace doesn't work on Macs
set backspace=start,eol,indent

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

syntax sync minlines=100
syntax sync maxlines=240
set synmaxcol=800

"" Directories for swp files
set nobackup
set noswapfile

set autoread
set updatetime=10

set previewheight=40

" Set Clipboard
" if has('unix')
    set clipboard+=unnamedplus " Standard Ctrl+C Clipboard, *not* Copy on Select
" else
"     set clipboard=unnamed
" endif

" Live Substitutions
" http://vimcasts.org/episodes/neovim-eyecandy/
set inccommand=split

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

function! HighlightWordUnderCursor()
	if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
		exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
	else
		match none
	endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>
