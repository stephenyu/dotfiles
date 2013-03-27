" Highlight Extra White Space
highlight SpecialKey ctermbg=lightblue guifg=#ffc000 guibg=#6e00b7

set nu   " Show Line Numbers
set ls=2 " Always show Status Bar

set background=dark

set showmatch
set nowrap

set nocompatible

set incsearch

set nobackup
set nowb
set noswapfile

set paste
set ignorecase

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set bs=2

" Hide / Show Invisible Chars
nmap <leader>l :set list!<CR>
set list

" Using same symbols as TextMate
set listchars=tab:▸\ ,trail:·

" Adds the dictionary to Vim
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

" CTRL-N CTRL-N SpellCheck
set complete-=k complete+=k

" popup menu doesn't select the first completion item
" menu will come up even if there's only one match
set completeopt=longest,menuone

inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ?  "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Delete Windows Carriage Returns
nnoremap <Leader>dwcr :%s/\r\+$//e<CR>
vnoremap <Leader>dwcr :%s/\r\+$//e<CR>

" Delete Whitespace
nnoremap <Leader>dws mp:%s/\s\+$//<CR>`pzz
vnoremap <Leader>:!sed 's/[ \t]*$//'<CR>

" Copy and Paste using the Clipboard
vnoremap <Leader>c "+y
vnoremap <Leader>v "+p
nnoremap <Leader>v "+p

" Add a Blank Line, stay in command mode
nnoremap o o<ESC>
nnoremap O O<ESC>

" Open Vimrc in a VSplit
nnoremap <leader>orc :vsplit $MYVIMRC<cr>

" Load Vimrc in a VSplit
nnoremap <leader>lrc :source $MYVIMRC<cr>

" VIMDIFF COMMANDS
" Ignore Whitespace within VimDif
set diffopt+=iwhite

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
