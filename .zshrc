# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

plugins=(git svn)

alias tm="tmux attach -t main || tmux new -s main"
alias irssi='TERM=screen-256color irssi'

# SVN Aliases
alias sc="svn commit"
alias ss="svn status"
alias si="svn info"
alias su="svn up"
alias sa="svn add"

alias hw=_tmux()

# mkdir, then cd
mkcd () { mkdir -p "$@" && cd "$@" }

# extract tar
untar () { tar -zxvf "$@" }

# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export TERM=xterm-256color

PROMPT='[%{$fg[red]%}%B%n%b%{$reset_color%}@%{$fg[green]%}%B%M%b%{$reset_color%}:%3d] %{$fg[cyan]%}%B~%b%{$reset_color%} '
RPROMPT='[%*]' # prompt for right side of screen

compinit -D

zstyle ':completion:*' accept-exact '*(N)'
