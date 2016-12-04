" vim-airline
let g:airline#extensions#syntastic#enabled = 1

" CtrlP
nmap <F3> :CtrlPMixed<cr>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_map = '2'

nmap <F2> :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

let g:syntastic_javascript_checkers = ['standard']
