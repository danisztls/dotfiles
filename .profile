# preferred programs
export EDITOR="nvim"
export VISUAL="alacritty -e nvim"
export BROWSER="chromium"

# use nvim as manpager
export MANPAGER="nvim -c 'set ft=man ts=8 nomod nolist noma'"

# shell history
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$HOME/.cache/sh-history"

# set QT window decoration platform
# export QT_QPA_PLATFORMTHEME=qt5ct

# set programs to xdg dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store" # Pass # FIXME: What this expansion does?
export GNUPGHOME="$XDG_DATA_HOME/gnupg" # GnuPG
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android" # Android
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go" # Go

#export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
#export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"

# set path
export PATH=/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/Workshop/source/bin # personal scripts 

export NODEJS_HOME=$XDG_DATA_HOME/node_modules # Node
export npm_config_prefix=$XDG_DATA_HOME/npm
export PATH=$PATH:$NODEJS_HOME/bin

export PATH=$PATH:$HOME/.perl5/bin

export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin # Ruby

# link specific apps cache to /tmp
cache_dirs=("chromium" "mesa_shader_cache")
config_dirs=("Code - OSS/Cache" "Code - OSS/CachedData" "Code - OSS/CachedExtensions" "Code - OSS/Code Cache" "Code - OSS/GPUCache" "variety/wallpaper")
config_files=("variety/history.txt" "variety/variety.log" "variety/.last_change_time")

for dir in "${cache_dirs[@]}"; do
	mkdir -p "/tmp/$USER/cache/$dir" && rm -rf "${XDG_CACHE_HOME:?}/$dir" && ln -s "/tmp/$USER/cache/$dir" "${XDG_CACHE_HOME:?}/$dir"
done

for dir in "${config_dirs[@]}"; do
	mkdir -p "/tmp/$USER/config/$dir" && rm -rf "${XDG_CONFIG_HOME:?}/$dir" && ln -s "/tmp/$USER/config/$dir" "${XDG_CONFIG_HOME:?}/$dir"
done

for file in "${config_files[@]}"; do
	rm -f "${XDG_CONFIG_HOME:?}/$file" && ln -s "/tmp/$USER/config/$file" "${XDG_CONFIG_HOME:?}/$file"
done

# fzf
export FZF_DEFAULT_COMMAND="rg --ignore-case --files" # override by aliases 
export FZF_DEFAULT_OPTS="--bind 'f1:execute(nvim {}),f2:execute(xdg-open {}),f3:execute(nautilus {}),f4:execute(ranger {}),f5:execute(echo {} | xclip)' --color=dark --color=fg:-1,bg:-1,hl:#9173eb,fg+:#ffffff,bg+:#2d3444,hl+:#7047eb --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef"

# broot launcher
source "$XDG_CONFIG_HOME/broot/launcher/bash/br"

