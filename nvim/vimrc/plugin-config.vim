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


