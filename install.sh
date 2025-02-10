#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

echo "Setting up symlinks..."

# シンボリックリンクを作成（-sf オプションで既存のリンクを上書き）
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

echo "Dotfiles setup completed!"

