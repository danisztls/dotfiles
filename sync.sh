#!/bin/bash
# Sync dotfiles to git working dir
repo="$HOME/Workshop/source/system/dotfiles"
rsync -ar --delete --files-from="$repo/.rsync-include" --exclude-from="$repo/.gitignore" "$HOME" "$repo/"
