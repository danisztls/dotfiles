# Preferred programs
export EDITOR="nvim"
export VISUAL="alacritty -e nvim"
export MANPAGER="nvim -c 'set ft=man ts=8 nomod nolist noma'" # neovim as manpager
[[ $USER != root ]] && export BROWSER="chromium"

# ACO over LLVM
export RADV_PERFTEST=aco

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

# History
export HISTFILE="$XDG_DATA_HOME/shell/history"
export HISTSIZE=10000
export SAVEHIST=10000

# Path
export PATH=/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$XDG_DATA_HOME/npm/bin

# Autostart
[ -f "$XDG_CONFIG_HOME/shell/autostart" ] && ( [ -r "/tmp/$USER" ] || "$XDG_CONFIG_HOME/shell/autostart" )

# Fzf
export FZF_DEFAULT_COMMAND="fd -t f -i -E '**/.git/**' -E '**cache/**' -E '**/node_modules/**'"

# Broot
# shellcheck disable=SC1090
[ -f "$XDG_CONFIG_HOME/broot/launcher/bash/br" ] && source "$XDG_CONFIG_HOME/broot/launcher/bash/br"

# Socket for Docker rootless
# export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

