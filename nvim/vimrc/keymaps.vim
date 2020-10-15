let mapleader=" "

nmap <F3> :Files<cr>
nmap <leader>b :Buffers<cr>
nnoremap <leader><leader> :b#<cr>

" Insert a Single Char in Normal
nnoremap <Leader>i i_<Esc>r
" Insert a Single Char in Normal
nnoremap <Leader>a a_<Esc>r

nmap <F2> :Lexplore<CR>
nmap <F1> :Explore<CR>
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_localrmdir='rm -rf'

" Reload Vimfile
map <leader>s :source ~/.config/nvim/init.vim<cr>

" Toggle Highlight
noremap <F4> :set hlsearch! hlsearch?<CR>

" F5 Tabnew
nmap <F5> :echoe "Use :tabnew, or perhaps a buffer ;)"<CR>

" F6 Toggles Line Numbers
nmap <F6> :set invnumber<cr>

" Bubble single lines
nmap <Up> [e
nmap <Down> ]e

" Bubble multiple lines
vmap <Up> [egv
vmap <Down> ]egv

" Add a Blank Line, stay in Command Mode
nnoremap o o<ESC>
nnoremap O O<ESC>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>

" Delete Windows Carriage Returns
nnoremap <Leader>dwcr :%s/\r\+$//e<CR>
vnoremap <Leader>dwcr :%s/\r\+$//e<CR>

" Copy and Paste using the Clipboard
vnoremap <Leader>c "+y
vnoremap <Leader>v "+p
nnoremap <Leader>v "+p

" Path File Path
map <leader>pwd :put %<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" My Common Typos
cnoreabbrev W! w!
cnoreabbrev W1 w!
cnoreabbrev Q! q!
cnoreabbrev Q1 q!
cnoreabbrev Qall! qall!
cnoreabbrev Qall1 qall!
cnoreabbrev qa1 qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
