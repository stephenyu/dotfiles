SHELL := bash

.PHONY: all
all: dotfiles

.PHONY: directories
directories:
	mkdir -p $(HOME)/.config/

.PHONY: dotfiles
dotfiles: directories
	ln -snf $(CURDIR)/config/nvim $(HOME)/.config/nvim
	ln -snf $(CURDIR)/.tmux.conf $(HOME)/.tmux.conf
	ln -snf $(CURDIR)/.alacritty.toml $(HOME)/.alacritty.toml
	ln -snf $(CURDIR)/.gitconfig $(HOME)/.gitconfig
	ln -snf $(CURDIR)/.gitignore $(HOME)/.gitignore
	ln -snf $(CURDIR)/zsh/zshrc $(HOME)/.zshrc
	ln -snf $(CURDIR)/zsh/zprofile $(HOME)/.zprofile
