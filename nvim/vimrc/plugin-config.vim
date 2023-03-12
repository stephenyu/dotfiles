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

if has('unix')
   set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
endif

" Stop Yggdroot/indentLine from hiding Double Quotes in JSON
autocmd Filetype json let g:indentLine_enabled = 0
autocmd Filetype json :IndentLinesDisable

set shortmess+=c

" always show signcolumns
set signcolumn=yes

let g:ale_html_tidy_options = '-q -e -config ~/tidy.conf -language en'

" autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" tab to autocomplete
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Rust Tool
" nmap gh :lua require'rust-tools.hover_actions'.hover_actions()<cr>

" CoC
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" https://github.com/neoclide/coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" https://github.com/rust-lang/rust.vim
" enable automatic running of :RustFmt when you save a buffer.
let g:rustfmt_autosave = 1
