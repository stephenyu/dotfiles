" Default Indentation
filetype indent on
set nowrap
set tabstop=4
set expandtab
set shiftwidth=4

augroup auFileTypes
  autocmd!

  autocmd FileType markdown setlocal wrap
augroup end
