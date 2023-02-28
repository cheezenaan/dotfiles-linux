# Use XDG Base Directory Strategy
# ref. https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_LOCAL_HOME="$HOME/.local"

# Configuring $PATH
# refs.
#   - https://wiki.archlinux.org/title/Zsh#Configuring_$PATH
#   - https://qiita.com/mollifier/items/42ae46ff4140251290a7

export GOBIN=$HOME/go/bin

typeset -U path PATH
path=(
    ${XDG_LOCAL_HOME}/bin
    $GOBIN
    $path
)

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# enable homebrew
if [ -f "/opt/homebrew/bin/brew" ]; then
    eval $(/opt/homebrew/bin/brew shellenv);
fi
