let mapleader=" "

" Reload Vimfile
map <leader>s :source ~/.vimrc<cr>

" Toggle Highlight
noremap <F4> :set hlsearch! hlsearch?<CR>

" F5 Tabnew
nmap <F5> <ESC>:tabnew<RETURN>

" F6 Toggles Line Numbers
nmap <F6> :set invnumber<cr>

" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Add a Blank Line, stay in Command Mode
nnoremap o o<ESC>
nnoremap O O<ESC>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Delete Windows Carriage Returns
nnoremap <Leader>dwcr :%s/\r\+$//e<CR>
vnoremap <Leader>dwcr :%s/\r\+$//e<CR>

" Copy and Paste using the Clipboard
vnoremap <Leader>c "+y
vnoremap <Leader>v "+p
nnoremap <Leader>v "+p

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
