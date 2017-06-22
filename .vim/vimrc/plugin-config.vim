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

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['']

let NERDTreeShowHidden=1

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]

" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif

let g:ycm_semantic_triggers['typescript'] = ['.']

" Typescript
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

