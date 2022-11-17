" Default Indentation
filetype indent on
set nowrap
set tabstop=4
set expandtab
set shiftwidth=4

augroup auFileTypes
  autocmd!

  " Markdown specific textwidth
  autocmd FileType markdown setlocal textwidth=100
augroup end
