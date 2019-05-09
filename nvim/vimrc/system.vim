set hidden
set history=100

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

"" Directories for swp files
set nobackup
set noswapfile

set autoread
set updatetime=10

set previewheight=40

" Set Clipboard
if has('unix')
    set clipboard=unnamedplus " Standard Ctrl+C Clipboard, *not* Copy on Select
else
    set clipboard=unnamed
endif

function! HighlightWordUnderCursor()
	if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
		exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
	else
		match none
	endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
