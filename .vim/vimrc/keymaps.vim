let mapleader=" "

" Reload Vimfile
map <leader>s :source ~/.vimrc<CR>

" Press Esc to stop Search
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Standard Explore
nnoremap <F2> :Explore<CR>

" Toggle Highlight
noremap <F4> :set hlsearch! hlsearch?<CR>

" F5 Tabnew
nmap <F5> <ESC>:tabnew<RETURN>

" F6 Toggles Line Numbers
nnoremap <F6> :set invnumber<CR>
