#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Setting up symlinks..."

# シンボリックリンク
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.zimrc" "$HOME/.zimrc"
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
# starship
if command -v starship &>/dev/null; then
    mkdir -p "$HOME/.config"
    ln -sf "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"
fi

# Ghostty
if command -v ghostty &>/dev/null; then
    mkdir -p "$HOME/.config/ghostty"
    ln -sf "$DOTFILES_DIR/.config/ghostty/config" "$HOME/.config/ghostty/config"
fi
ln -sf "$DOTFILES_DIR/.zshrc.darwin" "$HOME/.zshrc.darwin"
ln -sf "$DOTFILES_DIR/.zshrc.linux" "$HOME/.zshrc.linux"

echo "Dotfiles setup completed!"

# .gitconfig.local の作成（存在しない場合のみ）
if [ ! -f "$HOME/.gitconfig.local" ]; then
    touch "$HOME/.gitconfig.local"
    echo "[user]" > "$HOME/.gitconfig.local"
    echo "    name = " >> "$HOME/.gitconfig.local"
    echo "    email = " >> "$HOME/.gitconfig.local"
    echo "Created ~/.gitconfig.local. Please edit it to add your name and email."
fi
