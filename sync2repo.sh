#!/bin/bash
# Sync dotfiles to git working dir
cd dotfiles
rsync -ar --delete --files-from="./.gitinclude" --exclude-from="./.gitignore" "$HOME" "./"
