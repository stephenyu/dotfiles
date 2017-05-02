" vim-airline
let g:airline#extensions#syntastic#enabled = 1

" CtrlP
nmap <F3> :CtrlPMixed<cr>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git'
let g:ctrlp_map = '<Leader>2'

" Do not change Current Path
let g:ctrlp_working_path_mode = 0

nma <F2> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 60

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

let g:neocomplete#enable_at_startup = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['']


let NERDTreeShowHidden=1
