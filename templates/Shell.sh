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

if ! [ $# -eq 1 ] ; then
  printf "ERROR: wrong number of arguments.\n"
fi

# is it running under systemd?
if [ "$TERM" = "dumb" ]; then
  _log_emerg="<0>%s\n" # red
  _log_alert="<1>%s\n"
  _log_crit="<2>%s\n"
  _log_error="<3>%s\n"
  _log_warning="<4>%s\n" # yellow
  _log_notice="<5>%s\n" # white
  _log_info="<6>%s\n"
  _log_debug="<7>%s\n" # muted 

else
  # formatting escape codes
  _fmt_clear="\e[0;0m"
  _fmt_bold="\e[0;1m"
  _fmt_muted="\e[0;2m"
  _fmt_italic="\e[0;3m"
  _fmt_underlined="\e[0;4m"
  _fmt_black="\e[1;30m"
  _fmt_red="\e[1;31m"
  _fmt_green="\e[1;32m"
  _fmt_yellow="\e[1;33m"
  _fmt_blue="\e[1;34m"
  _fmt_purple="\e[1;35m"
  _fmt_cyan="\e[1;36m"
  _fmt_white="\e[1;37m"

  # log levels strings (systemd convention)
  _log_emerg="${_fmt_red}EMERGENCY: %s${_fmt_clear}\n"
  _log_alert="${_fmt_red}ALERT: %s${_fmt_clear}\n"
  _log_crit="${_fmt_red}CRITICAL: %s${_fmt_clear}\n"
  _log_error="${_fmt_red}ERROR: %s${_fmt_clear}\n"
  _log_warning="${_fmt_yellow}WARNING: %s${_fmt_clear}\n"
  _log_notice="${_fmt_bold}NOTICE: %s${_fmt_clear}\n"
  _log_info="${_fmt_clear}INFO: %s\n${_fmt_clear}\n"
  _log_debug="${_fmt_muted}DEBUG: %s${_fmt_clear}\n"
fi

# Dependencies
_deps=(ls)
for _prog in "${_deps[@]}"; do
  if [ ! "$(command -v "$_prog")" ]; then
    # shellcheck disable=SC2059
    printf "$_log_error" "$_prog not found found."
    exit 1
  fi
done

# OptArgs
_getOpts() {
  while getopts "ab:" _option; do
    case $_option in
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
