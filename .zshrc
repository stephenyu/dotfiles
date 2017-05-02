# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

plugins=(git docker svn)

export SVN_EDITOR=vim

alias tm="tmux attach -t main || tmux new -s main"

alias hw=_tmux()

export TERM=xterm-256color

PROMPT='%{$fg[white]%}[%*] %{$fg[red]%}%n %{$fg[white]%}at %{$fg[cyan]%}%M %{$fg[white]%}in %{$fg[green]%}%C
%{$reset_color%}~ '

# PROMPT='[%{$fg[red]%}%B%n%b%{$reset_color%}@%{$fg[green]%}%B%M%b%{$reset_color%}:%3d] %{$fg[cyan]%}%B~%b%{$reset_color%} '
# RPROMPT='$(svn_mark) $(svn_get_branch_name) $(svn_get_repo_name) $(svn_prompt_info) $(svn_dirty)' # prompt for right side of screen

compinit -D

# zstyle ':completion:*' accept-exact '*(N)'
export LS_COLORS="di=31;41:ln=31;41:so=31;41:pi=31;41:ex=31;41:bd=31;41:cd=31;41:su=31;41:sg=31;41:tw=31;41:ow=31;41:"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

svn_mark() {
    if in_svn; then
        echo 'X'
    fi
}

eval $(thefuck --alias)
