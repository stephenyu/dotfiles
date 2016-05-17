filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab

" Wyoming Interactive Specific Commands
:autocmd BufWritePost *.scss set noet|retab! <afile>
