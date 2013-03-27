" NERDTree
let g:NERDTreeWinSize = 50
let g:NERDTreeShowHidden = 1

" AutoFocus
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

" Tabular
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>

" F1 Toggle Gundo (Changes)
nnoremap <F1> :GundoToggle<CR>

" F2 NERDTreeToggle
nmap <F2> <ESC>:NERDTreeToggle<RETURN>
nmap <S-F2> <ESC>:NERDTreeFind<RETURN>

" F3 MRU
nmap <F3> <ESC>:MRU<RETURN>

" F4 Tagbar Settings
nnoremap <silent> <F4> :TagbarToggle<CR>

" F5 Tabnew
nmap <F5> <ESC>:tabnew<RETURN>
