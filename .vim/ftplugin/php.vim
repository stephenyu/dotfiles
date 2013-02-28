" PHP Stuff
" <Leader>s ArgumentWrap
nnoremap <silent> <leader>s :call argumentrewrap#RewrapArguments()<CR>

" Ctrl-P for Documentation Completion
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

" Assign Line to Variable
nnoremap <C-N> ^i$ = <ESC>^li

" Replace all " with ' on a single line
nnoremap <leader>2 V:!tr \" \'<CR>

"
"  Coding Style
"
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set bs=2

" Highlight Lines Longer Than 90
set colorcolumn=90
hi colorcolumn ctermbg=lightcyan guibg=#004433
