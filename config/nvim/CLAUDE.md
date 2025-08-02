# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration using LazyVim as the base distribution. The configuration is part of a dotfiles repository and follows LazyVim's modular plugin architecture.

## Key Architecture Components

### LazyVim Bootstrap
- Entry point: `init.lua` bootstraps the entire configuration by requiring `config.lazy`
- `lua/config/lazy.lua` sets up the Lazy.nvim plugin manager and LazyVim framework
- Uses LazyVim v8 with automatic plugin update checking enabled

### Configuration Structure
- `lua/config/`: Core LazyVim configuration overrides
  - `keymaps.lua`: Custom keybindings (includes Shift+Arrow for line movement)
  - `autocmds.lua`: Custom autocommands (currently minimal)
- `lua/plugins/`: Plugin specifications that extend or override LazyVim defaults
- `lua/myplugin/`: Custom plugin development area

### Plugin Management
- Uses Lazy.nvim for plugin management with lazy loading disabled by default
- Plugins are automatically imported from the `plugins/` directory
- `lazy-lock.json` locks plugin versions for reproducible installs
- `lazyvim.json` tracks LazyVim version and news

### Key Plugins

#### AI Integration
- **claudecode.nvim**: Primary Claude Code integration with comprehensive keybindings under `<leader>a`
  - Toggle, focus, resume, continue Claude sessions
  - Buffer management and diff handling
  - File tree integration for adding files

#### Development Workflow
- Claude Code provides integrated development workflow with buffer management and diff handling

## Plugin Development
- Custom plugins should be placed in `lua/myplugin/` directory
- Follow LazyVim plugin specification format in `lua/plugins/` for new plugin configurations

## Configuration Management
- This configuration extends LazyVim rather than replacing it
- Plugin specifications in `lua/plugins/` override LazyVim defaults
- Custom keymaps and autocommands supplement LazyVim's defaults