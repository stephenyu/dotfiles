" CtrlP
" nmap <F3> :CtrlPMixed<cr>
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git'
" let g:ctrlp_map = '<Leader>2'

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nmap <F3> :Files<cr>

" Do not change Current Path
let g:ctrlp_working_path_mode = 0

nmap <F2> :NERDTreeToggle<CR>
nmap <F1> :NERDTreeFind<CR>
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

let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\   },
\}

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_server_python_interpreter = '/usr/local/bin/python'
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

let g:vim_markdown_folding_disabled = 1
set nofoldenable
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_conceal = 0

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'html': [],
\   'php': ['php -l', 'phpcs'],
\}

" CTags
nnoremap <leader>. :CtrlPTag<cr>

let g:ale_html_tidy_options = '-q -e -config ~/tidy.conf -language en'

" Typescript
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript setlocal completeopt+=menu,preview
