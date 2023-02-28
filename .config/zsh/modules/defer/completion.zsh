# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Append completions to fpath
fpath=(
    ${ASDF_DIR}/completions/_asdf
    $fpath
)

autoload -Uz compinit && compinit
