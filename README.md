Stephen's Dotfiles
==================

All my dotfiles in one handy repository, storing all my settings for the following tools:

 * neovim
 * tmux
 * fish
 * git

There will be some legacy dotfiles here and there, but those are my day-to-day tools.

## CD Back

To get `cdb` functional, install my rust crate.

```
cargo install cdback
```

## Neovim

Using the built-in LSP Client so this needs a bit of setup to get going

### Eslint

First install a Language Server i.e. https://github.com/mattn/efm-langserver

```
$ brew install efm-langserver
```

```
$ npm install -g eslint_d eslint
```

There needs to be an `.eslint*` file

```
$ eslint --init
```

### Typescript

Install the Typescript LSP
```
$ npm install -g typescript typescript-language-server diagnostic-languageserver
```

In Vim use `:LspInfo` to verify everything is working.
