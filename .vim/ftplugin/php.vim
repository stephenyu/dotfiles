filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab

nnoremap <leader>f :call PhpCsFixerFixFile()<CR>

" Wyoming Interactive Specific Commands
:autocmd BufWritePost *.php set noet|retab! <afile>
