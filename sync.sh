#!/bin/bash
# Sync dotfiles to git working dir
rsync -ar --delete --files-from="$HOME/.dotfiles/files.txt" $HOME $HOME/.dotfiles/

