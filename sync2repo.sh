#!/bin/bash
# Sync dotfiles to git working dir
cd data
rsync -ar --delete --files-from="./.gitinclude" --exclude-from="./.gitignore" "$HOME" "./"
