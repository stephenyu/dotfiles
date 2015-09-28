# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

plugins=(git docker)

export SVN_EDITOR=vim

alias tm="tmux attach -t main || tmux new -s main"

alias hw=_tmux()

replace-phpcs () {
  cat "$1" | phpcbf --standard=~/.vim/phpcs/maglabs-php-codestyle.xml > /tmp/file
  cp /tmp/file "$1"
}

cs () {
  if [[ $1 == '--sum' ]]; then
    ((prev = $2 - 1))
    echo "Websvn URL: http://trac.maglabs.net/websvn/listing.php?repname=Main&path=%2F&rev=$2&sc=1"
    svn log -l 1 -r$2 "https://trac.maglabs.net/svn-repos/"
    svn diff -r$prev:$2 --summarize 'https://trac.maglabs.net/svn-repos/'
  elif [[ $1 == '--diff' ]]; then
    ((prev = $2 - 1))
    echo "Websvn URL: http://trac.maglabs.net/websvn/listing.php?repname=Main&path=%2F&rev=$2&sc=1"
    svn log -l 1 -r$2 "https://trac.maglabs.net/svn-repos/"
    svn diff -r$prev:$2 'https://trac.maglabs.net/svn-repos/'
  else
    echo "Websvn URL: http://trac.maglabs.net/websvn/listing.php?repname=Main&path=%2F&rev=$1&sc=1"
    svn log -l 1 -r$1 "https://trac.maglabs.net/svn-repos/"
  fi
}

# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export TERM=xterm-256color

PROMPT='[%{$fg[red]%}%B%n%b%{$reset_color%}@%{$fg[green]%}%B%M%b%{$reset_color%}:%3d] %{$fg[cyan]%}%B~%b%{$reset_color%} '
RPROMPT='[%*]' # prompt for right side of screen

compinit -D

zstyle ':completion:*' accept-exact '*(N)'

#Alias

