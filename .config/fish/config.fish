# General

## Locale
set -x LC_aLL ja_JP.UTF-8
set -x LANG en_US.UTF-8

set -x FISH_HOME $HOME/.config/fish

## Alias
source $FISH_HOME/alias.fish

## Envirionment variables
source $FISH_HOME/env.fish

# Plugins

## Fisherman
if not functions -q fisher
  echo "＜(゜∀ ) Installing Fisherman ..."
  curl git.io/fisherman --create-dirs -sLo $FISH_HOME/functions/fisher.fish
  fish -c fisher
end

## fzf
set -x FZF_DEFAULT_OPTS '--height 80% --border --ansi --multi'
set -x FZF_ALT_C_OPTS '--select-1 --exit-0'
