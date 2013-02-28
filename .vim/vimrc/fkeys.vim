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

" F6 Toggles Relative Numbers and Absolute Numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <F6> :call NumberToggle()<cr>
