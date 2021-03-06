set backspace=start,eol,indent

syntax sync minlines=100
syntax sync maxlines=240
set synmaxcol=800

source $HOME/.vim/vimrc/gui.vim
source $HOME/.vim/vimrc/keymaps.vim
source $HOME/.vim/vimrc/system.vim
source $HOME/.vim/vimrc/plug-plugins.vim
source $HOME/.vim/vimrc/plugin-config.vim
source $HOME/.vim/vimrc/indent.vim

let g:ycm_server_python_interpreter = '/usr/bin/python'
