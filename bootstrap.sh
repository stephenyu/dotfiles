#!/usr/bin/env bash
set -euo pipefail

DOTFILES_REPO="https://github.com/stephenyu/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

echo ""
echo "==> Starting bootstrap..."
echo ""

# ── 1. Homebrew ────────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure brew is on PATH (Apple Silicon path)
eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null || eval "$(/usr/local/bin/brew shellenv)"

# ── 2. Clone dotfiles ──────────────────────────────────────────────────────────
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "==> Cloning dotfiles..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  echo "==> Dotfiles already cloned, pulling latest..."
  git -C "$DOTFILES_DIR" pull
fi

# ── 3. Install packages ────────────────────────────────────────────────────────
echo "==> Installing packages from Brewfile..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

# ── 4. Oh My Zsh ──────────────────────────────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# ── 5. Rust ────────────────────────────────────────────────────────────────────
if ! command -v cargo &>/dev/null; then
  echo "==> Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

# Ensure cargo is on PATH
# shellcheck source=/dev/null
source "$HOME/.cargo/env"

# ── 6. Cargo crates ────────────────────────────────────────────────────────────
echo "==> Installing cargo crates..."
cargo install gitstatus ccal

# ── 7. Symlink dotfiles ────────────────────────────────────────────────────────
echo "==> Symlinking dotfiles..."
make -C "$DOTFILES_DIR"

echo ""
echo "✓ Done! Open a new terminal to get started."
echo ""
