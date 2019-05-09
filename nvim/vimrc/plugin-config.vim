let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nmap <F3> :Files<cr>

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

let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
            \ 'auto_complete_delay': 100,
            \ 'smart_case': v:true,
            \ })

" nvim typescript
let g:nvim_typescript#default_mappings = 1

let NERDTreeShowHidden=1

let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings = {
\  'typescript' : {
\      'extends' : 'jsx',
\   },
\  'javascript' : {
\      'extends' : 'jsx',
\   }
\}

" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif

let g:vim_markdown_folding_disabled = 1
set nofoldenable
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_conceal = 0

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:ale_linters = {
\   'javascript': [],
\   'typescript': ['tsserver'],
\   'html': [],
\   'php': ['php -l', 'phpcs'],
\   'css': ['prettier'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_fix_on_save = 1

" CTags
nnoremap <leader>. :CtrlPTag<cr>

if has('unix')
   set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
endif

" Stop Yggdroot/indentLine from hiding Double Quotes in JSON
autocmd Filetype json let g:indentLine_enabled = 0
autocmd Filetype json :IndentLinesDisable

let g:ale_html_tidy_options = '-q -e -config ~/tidy.conf -language en'
