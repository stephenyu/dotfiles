set nocompatible               " be iMproved
filetype off                   " required!
syntax on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

source $HOME/.vim/vimrc/os.vim
source $HOME/.vim/vimrc/vundle-plugins.vim
source $HOME/.vim/vimrc/plugins-config.vim

source $HOME/.vim/vimrc/filetypes.vim
source $HOME/.vim/vimrc/fkeys.vim
source $HOME/.vim/vimrc/general.vim
source $HOME/.vim/vimrc/gui.vim
source $HOME/.vim/vimrc/work.vim

filetype plugin indent on     " required!
