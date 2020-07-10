# Preferred programs
export EDITOR="nvim"
export VISUAL="alacritty -e nvim"
export MANPAGER="nvim -c 'set ft=man ts=8 nomod nolist noma'" # neovim as manpager
[[ $USER != root ]] && export BROWSER="chromium"

# TODO: Setup a text based browser for root

# Cleanup
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME/android"
export ATOM_HOME="$XDG_DATA_HOME/atom"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle" BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle" BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export GEM_HOME="$XDG_DATA_HOME/gem" GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem" 
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE=- # delete file
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
export NODEJS_HOME="$XDG_DATA_HOME"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export VIMINIT="set runtimepath^=~/.config/vim|set runtimepath+=~/.config/vim/after|source ~/.config/vim/vimrc" # vim and neovim
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# Shell history
if [[ $USER != root ]]; then
	export HISTFILE="$XDG_DATA_HOME/shell/history"
else
	export HISTFILE="/tmp/shell-history"
fi
	
export HISTSIZE=10000
export SAVEHIST=10000

# Path
export PATH=/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$NODEJS_HOME/bin
export PATH=$PATH:$HOME/.perl5/bin
[[ $USER != root ]] && export PATH=$PATH:$HOME/Workshop/source/bin # personal scripts 

# Fuzzy finder
export FZF_DEFAULT_COMMAND="rg --ignore-case --files" 
export FZF_DEFAULT_OPTS="--bind 'f1:execute(nvim {}),f2:execute(xdg-open {}),f3:execute(nautilus {}),f4:execute(ranger {}),f5:execute(echo {} | xclip)' --color=dark --color=fg:-1,bg:-1,hl:#9173eb,fg+:#ffffff,bg+:#2d3444,hl+:#7047eb --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef"

# Autostart
[ -f "$XDG_DATA_HOME/shell/autostart" ] && ( [ -r "/tmp/$USER" ] || "$XDG_DATA_HOME/shell/autostart" )

# Broot
[ -f "$XDG_CONFIG_HOME/broot/launcher/bash/br" ] && source "$XDG_CONFIG_HOME/broot/launcher/bash/br"

