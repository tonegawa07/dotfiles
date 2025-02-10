#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

echo "Setting up symlinks..."

# シンボリックリンク
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

echo "Dotfiles setup completed!"

# .gitconfig.local の作成（存在しない場合のみ）
if [ ! -f "$HOME/.gitconfig.local" ]; then
    touch "$HOME/.gitconfig.local"
    echo "[user]" > "$HOME/.gitconfig.local"
    echo "    name = " >> "$HOME/.gitconfig.local"
    echo "    email = " >> "$HOME/.gitconfig.local"
    echo "Created ~/.gitconfig.local. Please edit it to add your name and email."
fi

