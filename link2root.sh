#!/bin/bash
# Link root dotfiles to some user dotfiles so they share the same environment
files=(".bashrc" ".profile" ".config/vim" ".config/zsh" ".local/share/shell/aliases" ".local/share/shell/functions" ".profile" ".zshrc")

[[ $USER == root ]] && ( echo "Should not be run directly as root! Use sudo instead." || exit )

for f in "${files[@]}"; do
	sudo rm -rf "/root/$f"
	sudo ln -s "$HOME/$f" "/root/$f"
done

# FIXME: Script will fail if parent dirs don't exist
