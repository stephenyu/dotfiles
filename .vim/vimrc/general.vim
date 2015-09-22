set ls=2 " Always show Status Bar

set background=dark

set showmatch
set nowrap

set nocompatible

set incsearch

set nobackup
set nowb
set noswapfile

set nopaste
set ignorecase

set smartindent
set expandtab
set bs=2

" Hide / Show Invisible Chars
nmap <leader>l :set list!<CR>
set list

" Using same symbols as TextMate
set listchars=tab:▸\ ,trail:~,extends:>,precedes:<,nbsp:+

" scan other loaded buffers that are in the buffer list
set complete-=.,w,b,u,t,i complete+=.,w,b,u,t,i

" popup menu doesn't select the first completion item
" menu will come up even if there's only one match
set completeopt=menuone

" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Delete Windows Carriage Returns
nnoremap <Leader>w :w<CR>
vnoremap <Leader>w :w<CR>

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

" Split Vim: Vertical
nnoremap <Leader>s<bar> :vsplit<CR>
nnoremap <Leader>s- :split<CR>

" Add a Blank Line, stay in command mode
nnoremap o o<ESC>
nnoremap O O<ESC>

" Open Vimrc in a VSplit
nnoremap <leader>orc :vsplit $MYVIMRC<cr>

" Load Vimrc in a VSplit
nnoremap <leader>lrc :source $MYVIMRC<cr>

"Disable Ex-mode!!1
nnoremap Q <nop>

" VIMDIFF COMMANDS
" Ignore Whitespace within VimDif
set diffopt+=iwhite

vnorem // y/<c-r>"<cr>"

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
