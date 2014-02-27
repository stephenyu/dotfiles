" AutoFocus
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

" NERDTree
let g:NERDTreeWinSize = 50
let g:NERDTreeShowHidden = 1

" Tabular
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>

" F2 NERDTreeToggle
nmap <F2> <ESC>:NERDTreeToggle<RETURN>
nmap <Leader><F2> <ESC>:NERDTreeFind<RETURN>

let NERDTreeMapHelp='<f12>'

let NERDTreeIgnore = ['\.DS_Store$', '\.svn$']

" F3 MRU
nmap <F3> <ESC>:MRU<RETURN>

" F5 Tabnew
nmap <F5> <ESC>:tabnew<RETURN>

" PHP documenter script bound to Control-P
autocmd FileType php inoremap <C-p> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-p> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-p> :call PhpDocRange()<CR>

" Ident-Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 3

" PDV PHP
let g:DisableAutoPHPFolding = 1

" Syntanstic
" PHP - Run Code Style
let g:syntastic_php_checkers=['php']
