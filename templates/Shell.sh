#!/usr/bin/env bash
#
# This is a docstring with a description of what this file does.

# @author: Daniel Souza <me@posix.dev.br>
# @license: MIT

# Text Decorators
reset="\e[0m"
strong="\e[1;39m"
red="\e[1;31m"
yellow="\e[1;33m"
green="\e[1;32m"
blue="\e[1;34m"

printf "${strong}Colors:${reset} \
${red}%s${reset}, \
${yellow}%s${reset}, \
${green}%s${reset}, \
${blue}%s${reset}.\n" \
"Red" "Yellow" "Green" "Blue"

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
