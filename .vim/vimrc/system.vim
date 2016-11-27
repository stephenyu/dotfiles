set hidden
set history=100

" remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e
