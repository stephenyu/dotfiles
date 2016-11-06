" AutoFocus
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

" Tabular
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>

" Standard Explore
nnoremap <F2> :Explore<CR>

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
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
hi IndentGuidesEven guifg=#1a1a1a ctermbg=238 guifg=#333333 ctermfg=190
hi IndentGuidesOdd guifg=#1a1a1a ctermbg=234 guifg=#333333 ctermfg=220

let g:ycm_server_python_interpreter = "/Users/stephen/anaconda/bin/python"

" Vim AirLine
let g:airline_powerline_fonts = 0

" PDV PHP
let g:DisableAutoPHPFolding = 1
let g:PHP_vintage_case_default_indent = 1

" Vim Signature
nmap <Leader>m <ESC>:SignatureToggle<RETURN>

" Syntanstic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" PHP - Run Code Style
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=/Users/stephen/temp/code_style.xml"

let g:syntastic_html_checkers = ['']

let g:syntastic_python_checkers = ['pep8']

let g:syntastic_javascript_checkers = ['']
"let g:syntastic_javascript_checkers = ['jslint']
"let g:syntastic_javascript_jscs_args = "--preset=airbnb"

" othree/javascript-libraries-syntax.vim
let g:used_javascript_libs = 'underscore,backbone,jquery'

" PhpCsFixerFixFile()
let g:php_cs_fixer_level = "psr2"

"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" dash compilation
nmap <silent> <leader>d <Plug>DashSearch

" vim-php-refactoring-toolbox
nnoremap <unique> <Leader>rrlv :call PhpRenameLocalVariable()<CR>
nnoremap <unique> <Leader>rrcv :call PhpRenameClassVariable()<CR>
nnoremap <unique> <Leader>rrm :call PhpRenameMethod()<CR>
nnoremap <unique> <Leader>reu :call PhpExtractUse()<CR>
vnoremap <unique> <Leader>rec :call PhpExtractConst()<CR>
nnoremap <unique> <Leader>rep :call PhpExtractClassProperty()<CR>
vnoremap <unique> <Leader>rem :call PhpExtractMethod()<CR>
nnoremap <unique> <Leader>rnp :call PhpCreateProperty()<CR>
nnoremap <unique> <Leader>rdu :call PhpDetectUnusedUseStatements()<CR>
vnoremap <unique> <Leader>r== :call PhpAlignAssigns()<CR>
nnoremap <unique> <Leader>rsg :call PhpCreateSettersAndGetters()<CR>
nnoremap <unique> <Leader>rda :call PhpDocAll()<CR>
