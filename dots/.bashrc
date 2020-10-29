# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

export TERM="xterm-256color"	# getting proper colors
export HISTCONTROL=ignoredups:erasedups	# no duplicate entries

# colors
colors() {
  local fgc bgc vals seq0

  printf "Color escapes are %s\n \e[${value};...;${value}m"
  printf "Values 30..37 are \e[33mforeground colors\e[m\n"
  printf "Values 40..47 are \e[43mbackground colors\e[m\n"
  printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

  for fgc in {30..37}; do # foreground colors
    for bgc in {40..47}; do # background colors
      fgc=${fgc#37} # white
      bgc=${bgc#40} # black

      vals="${fgc:+$fgc;}${bgc}"
      vals=${vals%%;}

      seq0="${vals:+\e[${vals}m}"
      printf "  %-9s" "${seq0:-(default)}"
      printf " ${seq0}TEXT\e[m"
      printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
    done
    echo; echo
  done
}

# colorful PS1 only on colorful terminals
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
  && type -P dircolors >/dev/null \
  && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
  if type -P dircolors >/dev/null ; then
    if [[ -f ~/.dir_colors ]] ; then
      eval "$(dircolors -b ~/.dir_colors)"
    elif [[ -f /etc/DIR_COLORS ]] ; then
      eval "$(dircolors -b /etc/DIR_COLORS)"
    fi
  fi

  if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;36m\] \W\[\033[01;31m\]\$\[\033[00m\] '
  else
    PS1='\[\033[01;33m\]\u\[\033[01;32m\]@\[\033[01;34m\]\h \[\033[01;35m\]\w \[\033[00m\]\$ '
  fi

else
  if [[ ${EUID} == 0 ]] ; then
    PS1='\u@\h \W \$ '
  else
    PS1='\u@\h \w \$ '
  fi
fi

unset use_color safe_term match_lhs sh

# enable history appending instead of overwriting
shopt -s histappend

# sigwinch fix
shopt -s checkwinsize

# load bash completions
[ -r "/usr/share/bash-completion/bash_completion" ] && . "/usr/share/bash-completion/bash_completion"

# load aliases
[ -f "$XDG_DATA_HOME/shell/aliases" ] && source "$XDG_DATA_HOME/shell/aliases"
shopt -s expand_aliases

# load functions
source "$XDG_CONFIG_HOME/shell/functions/extract"
source "$XDG_CONFIG_HOME/shell/functions/fzf-special"

# change the window title of X terminals
case ${TERM} in
	xterm|rxvt*|Eterm*|aterm|alacritty|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"';;
	screen*) # && exec zsh # use zsh on X terminals
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"';;
esac
