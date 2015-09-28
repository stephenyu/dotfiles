setl number
set tabstop=4
set shiftwidth=4

" PHP CS Fix
nnoremap <leader>f :w<CR>:call PhpCsFixerFixFile()<CR>

nnoremap <leader>u ::Phpunit %<cr>
