#!/bin/bash
# Link dotfiles from repo to $HOME
#
# Usage: ./setup.py <recipe> <opts>
#
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
_check_path() {
  if [ -e "$1" ]; then
    printf "${red}ERROR:${reset} ${strong}'%s'${reset} already exists.\n" "$1"
    return 1
  else
    return 0
  fi
}

_backup() {
  local _source="$1"
  local _target="$_source.bak"
  _check_path "$_target" && mv "$_source" "$_target"
}

_remove() {
  local _file="$1"
  rm -rf "$_file"
}

_trash() {
  local _file="$1"

  if [ "$(command -v trash)" ]; then
    trash "$_file"
  else
    printf "${red}ERROR:${reset} ${strong}'%s'${reset} was not found.\n" "trash-cli"
    return 1
  fi
}

_symlink() {
  # Ensure parent dirs exist at destination
  mkdir -p "$target_dir"

  # Symbolic link files
  # NOTE: Uses absolute path. Config will break if source is renamed.
  _check_path "$target" && ln -s "$source" "$target" &&
  printf "${green}SUCCESS:${reset} linked ${strong}'%s'${reset} to ${strong}'%s'${reset}.\n" "$target" "$source"
}

_link() {
  # Return error if expected argument is missing
  if [ "$#" -lt 2 ]; then
    printf "${red}ERROR:${reset} %s\n" "Missing arguments."
    return 1
  fi

  local source="$PWD/$1"
  local target="$HOME/$2"
  local target_dir="${target%/*?}"

  # Is there a broken symlink at destination?
  if [ -h "$target" ] && ! [ -e "$target" ]; then
    _remove "$target"
    printf "${blue}NOTICE:${reset} ${strong}'%s'${reset} was a broken symlink and was removed.\n" "$target"
  fi

  # Does destination already exists?
  if [ -e "$target" ]; then
    if [ "$forceMode" ]; then
      _remove "$target"
    
    # be sensible
    else
      # noop if it's the right symlink
      if [ "$(readlink "$target")" = "$source" ]; then
        printf "${blue}NOTICE:${reset} ${strong}'%s'${reset} is already correctly linked.\n" "$target"

      # otherwise get rid or skip
      else
        printf "${blue}NOTICE:${reset} destination ${strong}'%s'${reset} already exists.\n" "$target"
        printf "${yellow}What to do?${reset} backup ${green}(b)${reset}, remove ${red}(r)${reset} or ignore ${blue}(i)${reset} it?\n"

        while true; do
          read -r answer
          case ${answer:0:1} in
            b|B) _backup "$target" && _symlink;;
            r|R) _remove "$target" && _symlink;;
            i|I) break;;
              *) continue;;
          esac
        done
      fi
    fi
  else
    _symlink
  fi
}

# Main
if [ -e "$recipe" ]; then
  # shellcheck disable=SC1090
  source "$recipe"
else
  printf "${red}ERROR:${reset} Recipe ${strong}%s${reset} not found.\n"
fi
