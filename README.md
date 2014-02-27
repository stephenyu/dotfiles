Stephen's Dotfiles
==================

Basically all my dotfiles in one handy repository, storing all my settings for the following tools:

 * vim
 * tmux
 * zsh
 * screen
 * bash

There are a few _duplicate_ programs in there, which complete the same tasks: basically I work on a lot of legacy
servers which simply do not have the alternatives - nor can I install my prefered work-stack.

However, the installation method will only attempt installation in a single way:

 * git

This actually limits me in places where git isn't installed (I know, I know)

  bash <(curl --silent https://raw.github.com/stephenyu/dotfiles/master/install.sh)
