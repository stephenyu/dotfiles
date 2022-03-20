SHELL := bash

.PHONY: all
all: bin dotfiles

.PHONY: bin
bin:
	for file in $(shell find $(CURDIR)/bin -type f); do \
		f=$$(basename $$file); \
		sudo ln -sf $$file /usr/local/bin/$$f; \
	done
	sudo mkdir -p $(HOME)/.config/

.PHONY: directories
directories:
	sudo mkdir -p $(HOME)/.config/

.PHONY: dotfiles
dotfiles: directories
	sudo ln -snf $(CURDIR)/nvim $(HOME)/.config/nvim
	sudo ln -snf $(CURDIR)/fish $(HOME)/.config/fish
	sudo ln -snf $(CURDIR)/.tmux.conf $(HOME)/.tmux.conf
	sudo ln -snf $(CURDIR)/.alacritty.yml $(HOME)/.alacritty.yml
	sudo ln -snf $(CURDIR)/.gitconfig $(HOME)/.gitconfig
	sudo ln -snf $(CURDIR)/.gitignore $(HOME)/.gitignore
