filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab

nnoremap <leader>f :call JsBeautify()<cr>

"Replace Double Quotes with Single Quotes
nnoremap <Leader>rdq V:s/\"/\'/g<CR>
nnoremap <Leader>rdq V:s/\"/\'/g<CR>

" Wyoming Interactive Specific Commands
:autocmd BufWritePost *.js set noet|retab! <afile>
