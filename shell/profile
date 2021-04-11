# Preferred programs
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export VISUAL="alacritty -e nvim"
export MANPAGER="nvim -c 'set ft=man ts=8 nomod nolist noma'" # neovim as manpager
export BROWSER="chromium"

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Cleanup
# Check: https://wiki.archlinux.org/index.php/XDG_Base_Directory
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME/android"
export ATOM_HOME="$XDG_DATA_HOME/atom"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle" BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle" BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export GEM_HOME="$XDG_DATA_HOME/gem" GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem" 
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE=- # delete file
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
export NODEJS_HOME="$XDG_DATA_HOME"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_DATA_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export PYTHONHISTFILE="$XDG_DATA_HOME/python" # FIXME: I don't think its working.
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export TEXMFHOME="$XDG_DATA_HOME/texmf"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export TEXMFCONFIG="$XDG_CONFIG_HOME/texlive/texmf-config"
export VIMINIT="set runtimepath^=~/.config/vim|set runtimepath+=~/.config/vim/after|source ~/.config/vim/vimrc" # vim and neovim
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export TASKDATA="$XDG_DATA_HOME/task" # taskwarrior
export TASKRC="$XDG_CONFIG_HOME/task/taskrc"
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"

# History
export HISTFILE="$XDG_DATA_HOME/shell/history"
export HISTSIZE=10000
export SAVEHIST=10000

# Path
export PATH=/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$XDG_DATA_HOME/npm/bin
export PATH=$PATH:$GOPATH/bin

# Autostart
# Will run after login and will not run again until next boot even if .profile is sourced
autostart_lock=/run/user/$(id -u)/autostart.lock
if [ -f "$XDG_CONFIG_HOME/shell/autostart" ] && ! [ -f "$autostart_lock" ]; then
    "$XDG_CONFIG_HOME/shell/autostart"
    touch "$autostart_lock"
fi

# FZF
# Set bg: -1 and fg: -1 to enable transparency
export FZF_DEFAULT_COMMAND="fd -t f -i -E '**/.git/**' -E '**cache/**' -E '**/node_modules/**'"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=dark,bg+:#373e47,bg:#2d333b,spinner:#6bac00,hl:#0087e9 \
--color=fg:#adbac7,header:#009385,info:#d9b600,pointer:#b37eff \
--color=marker:#cf2424,fg+:#dddddd,prompt:#d40059,hl+:#ff5c00"

# Broot
# shellcheck disable=SC1090
[ -f "$XDG_CONFIG_HOME/broot/launcher/bash/br" ] && source "$XDG_CONFIG_HOME/broot/launcher/bash/br"

# ACO over LLVM
export RADV_PERFTEST=aco

# Socket for Docker rootless
# export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
