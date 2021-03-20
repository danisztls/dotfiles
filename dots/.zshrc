# .profile forced load if root
[[ $USER == root ]] && source "/root/.profile"

# Colors
autoload -U colors && colors

# Prompt
export PS1="%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$reset_color%} $%b "

# Aliases
[ -f "$XDG_CONFIG_HOME/shell/aliases" ] && source "$XDG_CONFIG_HOME/shell/aliases" 

# Functions
if [[ $USER != root ]]; then
	if [ -d "$XDG_CONFIG_HOME/shell/functions" ]; then
		fpath=( "$XDG_CONFIG_HOME/shell/functions" "${fpath[@]}" )
		autoload -Uz extract yolo
	fi
fi

# Autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
mkdir -p $XDG_CACHE_HOME/zsh 
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots) # include hidden files

# Bindings
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[5~"  vi-forward-word
bindkey  "^[[6~"  vi-backward-word 
bindkey  "^[[2~"  delete-word
bindkey  "^[[3~"  delete-char

# Ctrl-e to edit line in editor
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Change cursor shape for different vi modes
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
  	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
	fi
}

function zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}

zle -N zle-keymap-select
zle -N zle-line-init

echo -ne '\e[5 q' # use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # use beam shape cursor for each new prompt.

# Dynamic window title on X
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (alacritty*|gnome*|konsole*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

# Fuzzy finder
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#858B8E"

# Broot
source /home/lobo/.config/broot/launcher/bash/br

# Powerlevel10k
if test "$TERM" != "linux"; then
	source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme && source "$XDG_CONFIG_HOME/zsh/p10k.zsh"
fi

# Syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

