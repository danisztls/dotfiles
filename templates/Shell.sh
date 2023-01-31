#!/usr/bin/env bash
#
# This is a docstring with a description of what this script does.

# @author: Daniel Souza <me@posix.dev.br>
# @license: MIT
# @usage:
# @deps:

# shellcheck disable=SC2034

# Utils
# -----

# Debug
# set -x  # enable
# set +x  # disable

# verbosity, prints shell input lines as they are read
# set -v

# exit when a command has a non-zero exit status
# note: '||:' at the end of a pipe mask a non-zero exit
set -e

# exit when referencing undefined variable
# note: $* and $@ are exceptions
set -u

# exit if any command in a pipe fail
set -o pipefail

# Text Formatting 
reset="\e[0;0m"
red="\e[1;31m"
green="\e[1;32m"
yellow="\e[1;33m"
blue="\e[1;34m"
strong="\e[1;39m"

# Dependencies
deps=(ls)
for prog in "${deps[@]}"; do
  if [ ! "$(command -v "$prog")" ]; then
    printf "${red}Required dependency not found: ${strong}%s${reset}\n" "$prog"
    exit 1
  fi
done

# OptArgs
_getOpts() {
  while getopts "ab:" option; do
    case $option in
      a) testFlag="true";;
      b) testVar="$OPTARG";;
      *) echo "Not a valid argument."
    esac
  done
}

# slice arguments as getopts don't work with mixed parameters/arguments
# e.g. script.sh target -a
_getOpts "${@:2}"  # 2nd to nth

# Main
# ----
