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
