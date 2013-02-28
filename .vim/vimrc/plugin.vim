" This is for Pathogen to load all the bundles
call pathogen#runtime_append_all_bundles()
call pathogen#infect()

" Update CTags When Saving
au BufWritePost .php silent! !ctags -R &
set tags=ctags;/*/

" Open Definition in a New Tab
map <C-T> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

let g:NERDTreeWinSize = 50

" AutoFocus
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

" Vim-Indent-Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Tabular
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
