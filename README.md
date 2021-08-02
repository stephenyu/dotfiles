Stephen's Dotfiles
==================

All my dotfiles in one handy repository, storing all my settings for the following tools:

 * neovim
 * tmux
 * fish
 * git

There will be some legacy dotfiles here and there, but those 3 are my day-to-day tools.

## Tmux

Tmux Plugin Manager

`https://github.com/tmux-plugins/tpm`

## Neovim

Using the built-in LSP Client so this needs a bit of setup to get going

### Typescript

Install the Typescript LSP
```
; npm install -g typescript typescript-language-server diagnostic-languageserver
```

```
:LspInfo
```

To verify it's all working.  Any complaints? You probably didn't install anything...
