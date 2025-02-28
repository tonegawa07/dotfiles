#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

echo "Setting up symlinks..."

# シンボリックリンク
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.zimrc" "$HOME/.zimrc"
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

# GitHub CLI extensions
if command -v gh &>/dev/null; then
    echo "Installing GitHub CLI extensions..."
    while IFS= read -r ext; do
        if [ -n "$ext" ]; then
            if gh extension install "$ext"; then
                echo "✅ Successfully installed: $ext"
            else
                echo "❌ Failed to install: $ext"
            fi
        fi
    done < "$DOTFILES_DIR/gh_extensions.txt"
    echo "🎉 All GitHub CLI extensions have been installed!"
fi
