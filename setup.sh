#!/bin/bash
# Link dotfiles from repo to $HOME
# USAGE: setup <recipe> <opts>
# e.g. 

# shellcheck disable=SC2059

# Strict mode
set -e
set -o pipefail

# Get options from optargs
_getOpts() {
  while getopts "f" option; do
    case $option in
      f) forceMode="true";;  # remove by default any conflicting file
      *) printf "${red}ERROR:${reset} %s\n" "Unexpected argument."
    esac
  done
}

# slice arguments as getopts don't work with mixed parameters/arguments
# e.g. script.sh target -a
_getOpts "${@:2}"  # 2nd to nth

# Get recipe
if ! [ "$1" ] || [ "${1:0:1}" == "-" ]; then
  recipe=default
else
  recipe="$1"
fi

# Fix recipe path
recipe="$(git rev-parse --show-toplevel)/recipes/${recipe}"

# ANSI escape codes
reset="\e[0m"
strong="\e[1;39m"
red="\e[1;31m"
yellow="\e[1;33m"
blue="\e[1;34m"
green="\e[1;32m"

# Lib
_backup() {
  if ! [ -e "$1.bak" ]; then
    mv "$1" "$1.bak"
  else
    printf "${red}ERROR:${reset} ${strong}'%s'${reset} already exists.\n" "$1.bak"
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
    printf "${red}ERROR:${reset} ${strong}'%s'${reset} was not found.\n" "trash-cli"
    return 1
  fi
}

_link() {
  # Symbolic links using absolute paths
  # NOTE: Conf will break if source is renamed.

  # Return error if expected argument is missing
  if [ "$#" -lt 2 ]; then
    printf "${red}ERROR:${reset} %s\n" "Missing arguments."
    return 1
  fi

  src="$PWD/$1"
  dst="$HOME/$2"
  dst_dir="${dst%/*?}"

  # Is there a broken symlink at destination?
  if [ -h "$dst" ] && ! [ -e "$dst" ]; then
    _remove "$dst"
    printf "${blue}NOTICE:${reset} ${strong}'%s'${reset} was a broken symlink and was removed.\n" "$dst"
  fi

  # Does destination already exists?
  if [ -e "$dst" ]; then
    if [ $forceMode ]; then
      _remove "$dst"
    
    # be sensible
    else
      # noop if it's the right symlink
      if [ "$(readlink "$dst")" = "$src" ]; then
        printf "${blue}NOTICE:${reset} ${strong}'%s'${reset} is already correctly linked.\n" "$dst"

      # otherwise get rid or skip
      else
        printf "${blue}NOTICE:${reset} destination ${strong}'%s'${reset} already exists.\n" "$dst"
        printf "${yellow}What to do?${reset} backup ${green}(b)${reset}, remove ${red}(r)${reset} or ignore ${blue}(i)${reset} it?\n"

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
  fi

  # Ensure parent dirs exist at destination
  mkdir -p "$dst_dir"

  # Link files
  ln -s "$src" "$dst" &&
  printf "${green}SUCCESS:${reset} linked ${strong}'%s'${reset} to ${strong}'%s'${reset}.\n" "$dst" "$src"
}

# Main
if [ -e "$recipe" ]; then
  # shellcheck disable=SC1090
  source "$recipe"
else
  printf "${red}ERROR:${reset} Recipe ${strong}%s${reset} not found.\n"
fi
