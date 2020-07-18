#!/bin/bash
# Sync dotfiles to git working dir
rsync -ar --delete --files-from="./.rsync-include" --exclude-from="./.gitignore" "$HOME" ./
