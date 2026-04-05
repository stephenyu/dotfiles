Stephen's Dotfiles
==================

Dotfiles for my day-to-day setup, managed with symlinks and a Makefile.

- neovim
- tmux
- alacritty
- zsh (oh-my-zsh)
- git

## Fresh machine setup

Run the bootstrap script. It will install Homebrew, clone this repo, install all packages, set up Rust, and symlink everything into place.

```sh
curl -fsSL https://raw.githubusercontent.com/stephenyu/dotfiles/master/bootstrap.sh | bash
```

Then open a new terminal.

## Manual setup

If you've already cloned the repo, you can just run:

```sh
make
```

This symlinks all config files to their expected locations in `$HOME`.

## Packages

Homebrew packages are declared in `Brewfile`. To install:

```sh
brew bundle
```

To add a new package, edit `Brewfile` and run `brew bundle` again.

## Rust crates

Two CLI tools are installed via cargo:

- [`gitstatus`](https://crates.io/crates/gitstatus) — used in the shell prompt
- [`ccal`](https://crates.io/crates/ccal) — terminal calendar

To install manually:

```sh
cargo install gitstatus ccal
```
