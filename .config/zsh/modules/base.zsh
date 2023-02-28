# History
# ref. https://zsh.sourceforge.io/Doc/Release/Options.html#History
HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt append_history       # Do not replace the history, but append
setopt extended_history     # Save timestamps and the duration in the front of each commands
setopt share_history        # Share the history list with other shells
setopt hist_ignore_all_dups # Duplicated command line will not be recorded into the history list
setopt hist_no_store        # Remove the `history` command from the history list
setopt hist_reduce_blanks   # Remove blanks from each command line

# Keybinding
bindkey '^r' anyframe-widget-put-history
bindkey '^g' anyframe-widget-cd-ghq-repository

# initialize anyframe
autoload -Uz anyframe-init && anyframe-init
