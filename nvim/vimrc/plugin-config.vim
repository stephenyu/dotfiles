let g:spelunker_highlight_type = 1
highlight SpelunkerSpellBad cterm=underline gui=underline
let g:spelunker_disable_acronym_checking = 1

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:gruvbox_contrast_dark='hard'

let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings = {
\  'typescript' : {
\      'extends' : 'jsx',
\   },
\  'javascript' : {
\      'extends' : 'jsx',
\   }
\}

let g:vim_markdown_folding_disabled = 1
set nofoldenable
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_conceal = 0

let g:sneak#label = 1

" CTags
nnoremap <leader>. :CtrlPTag<cr>

if has('unix')
   set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
endif

" Stop Yggdroot/indentLine from hiding Double Quotes in JSON
autocmd Filetype json let g:indentLine_enabled = 0
autocmd Filetype json :IndentLinesDisable

set shortmess+=c

" https://github.com/neoclide/coc.nvim
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh :call CocAction('doHover')<CR>
nmap <silent> qf  <Plug>(coc-fix-current)

noremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>

let g:ale_html_tidy_options = '-q -e -config ~/tidy.conf -language en'
