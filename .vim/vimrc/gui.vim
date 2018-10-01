" Syntax Highlighting Based on Filetype
filetype on
syntax on

colorscheme Tomorrow-Night-Eighties

" Always Show Status
set laststatus=2
set hlsearch

" Hide / Show Invisible Chars
nmap <leader>l :set list!<CR>
set list
"
set shell=bash
"
" Using same symbols as TextMate
set listchars=tab:▸\ ,trail:~,extends:>,precedes:<,nbsp:+

set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=237
