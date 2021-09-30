#!/bin/bash
# Link dotfiles from repo to $HOME

# Strict mode
set -e
set -o pipefail

# TODO: Use variables for escape codes

# Get options from optargs
# -f is force mode, remove by default any conflicting file 
while getopts "f" option; do
  case $option in
    f) forceMode=true;;
    *) printf "\e[33mSomething unexpected happened.\n\e[0m"
  esac
done

_backup() {
  if ! [ -e "$1.bak" ]; then
    mv "$1" "$1.bak"
  else
    printf "ERROR: %s already exists\n" "$1.bak"
    return 1
  fi
}

_remove() {
  rm -rf "$1"
}

_trash() {
  if [ "$(command -v trash)" ]; then
    trash "$1"
  else
    printf "%s\n" "ERROR: trash-cli is not found"
    return 1
  fi
}

_link() {
  # Symbolic links using absolute paths
  # NOTE: Conf will break if source is renamed .

  # Return error if expected argument is missing
  if [ "$#" -lt 2 ]; then
    printf "\e[31mMissing arguments!\n\e[0m"
    return 1
  fi

  src="$PWD/$1"
  dst="$HOME/$2"
  dst_dir="${dst%/*?}"

  # Is there a broken symlink at destination?
  if [ -h "$dst" ] && ! [ -e "$dst" ]; then
    rm -f "$dst"
    printf "NOTICE: %s was a broken symlink and was removed." "$dst"
  fi

  # Does destination already exists?
  if [ -e "$dst" ]; then
    # noop if it's the right symlink
    if ! [ $forceMode ] && [ "$(readlink "$dst")" = "$src" ]; then
      printf "\e[1;39m'%s'\e[0;34m is already set up!\n" "$dst"
      return 0
      # otherwise get rid or skip

    else
      printf "\e[1;39m'%s'\e[0;33m exists. What do you want to do?\e[1;39m backup (b), remove (r), ignore (i)\n\e[0m" "$dst"
      while true; do
        read -r answer
        case ${answer:0:1} in
          b|B) _backup "$dst" && break;;
          r|R) _remove "$dst" && break;;
          i|I) break;;
          *)   continue;;
        esac
      done
    fi
  fi

  # Ensure parent dirs exist at destination
  mkdir -p "$dst_dir"

  # Link files
  ln -s "$src" "$dst" &&
  printf "\e[32mSuccesfully linked\e[1;39m '%s'\e[0;32m to\e[1;39m '%s'\e[0;32m!\n\e[0m" "$src" "$dst"
}

_link "shell/profile"           ".profile"
_link "shell/bashrc"            ".bashrc"
_link "shell/Xresources"        ".Xresources"
_link "shell/zshrc"             ".zshrc"
_link "shell/zsh"               ".config/zsh"
_link "shell/aliases"           ".config/shell/aliases"
_link "shell/autostart"         ".config/shell/autostart"
_link "shell/completions"       ".config/shell/completions"
_link "shell/tmux"              ".config/tmux"
_link "shell/alacritty.yml"     ".config/alacritty.yml"
_link "shell/kitty"             ".config/kitty"
_link "vim"                     ".config/vim"
_link "git/config"              ".gitconfig"
_link "misc/rofi"               ".config/rofi"
_link "templates"               ".templates"
_link "weechat"                 ".config/weechat"
