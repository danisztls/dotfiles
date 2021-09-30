#!/bin/bash
# Link dotfiles from repo to $HOME

# Strict mode
set -e
set -o pipefail

# Get options from optargs
# -f is force mode, remove by default any conflicting file 
while getopts "f" option; do
  case $option in
    f) forceMode=true;;
    *) printf "${error}ERROR:${reset} %s\n" "Something unexpected happened."
  esac
done

# ANSI escape codes
reset="\e[0m"
strong="\e[1;39m"
error="\e[1;31m"
warning="\e[1;33m"
notice="\e[1;34m"
success="\e[1;32m"

_backup() {
  if ! [ -e "$1.bak" ]; then
    mv "$1" "$1.bak"
  else
    printf "${error}ERROR:${reset} ${strong}'%s'${reset} already exists.\n" "$1.bak"
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
    printf "${error}ERROR:${reset} ${strong}'%s'${reset} was not found.\n" "trash-cli"
    return 1
  fi
}

_link() {
  # Symbolic links using absolute paths
  # NOTE: Conf will break if source is renamed .

  # Return error if expected argument is missing
  if [ "$#" -lt 2 ]; then
    printf "${error}ERROR:${reset} %s\n" "Missing arguments."
    return 1
  fi

  src="$PWD/$1"
  dst="$HOME/$2"
  dst_dir="${dst%/*?}"

  # Is there a broken symlink at destination?
  if [ -h "$dst" ] && ! [ -e "$dst" ]; then
    rm -f "$dst"
    printf "${notice}NOTICE:${reset} ${strong}'%s'${reset} was a broken symlink and was removed.\n" "$dst"
  fi

  # Does destination already exists?
  if [ -e "$dst" ]; then

    # noop if it's the right symlink
    if ! [ $forceMode ] && [ "$(readlink "$dst")" = "$src" ]; then
      printf "${notice}NOTICE:${reset} ${strong}'%s'${reset} is already correctly linked.\n" "$dst"
      return 0

    # otherwise get rid or skip
    else
      printf "${notice}NOTICE:${reset} destination ${strong}'%s'${reset} already exists.\n" "$dst"
      # shellcheck disable=SC2059
      printf "${warning}What to do?${reset} backup ${success}(b)${reset}, remove ${error}(r)${reset} or ignore ${notice}(i)${reset} it?\n"
      while true; do
        read -r answer
        case ${answer:0:1} in
          b|B) _backup "$dst" && break;;
          r|R) _remove "$dst" && break;;
          i|I) break;;
            *) continue;;
        esac
      done
    fi
  fi

  # Ensure parent dirs exist at destination
  mkdir -p "$dst_dir"

  # Link files
  ln -s "$src" "$dst" &&
  printf "${success}SUCCESS:${reset} linked ${strong}'%s'${reset} to ${strong}'%s'${reset}.\n" "$dst" "$src"
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
