set nocompatible
behave xterm
filetype plugin indent on
syntax on

source $HOME/.vim/vimrc/filetype.vim
source $HOME/.vim/vimrc/general.vim
source $HOME/.vim/vimrc/gui.vim
source $HOME/.vim/vimrc/fkeys.vim
source $HOME/.vim/vimrc/work.vim
source $HOME/.vim/vimrc/os.vim
source $HOME/.vim/vimrc/vundle-plugins.vim
source $HOME/.vim/vimrc/plugin-configs.vim

" Source a local vimrc if it exists
if filereadable(expand("$HOME/.vimrc.local"))
  source $HOME/.vimrc.local
endif
