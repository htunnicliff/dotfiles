# Homebrew
if [[ -a /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Mise
if [[ -a ~/.local/bin/mise ]]; then
  if [[ "$TERM_PROGRAM" == 'vscode' ]]; then
    # When in VSCode, use shims
    eval "$(~/.local/bin/mise activate zsh --shims)"
  elif; then
    eval "$(~/.local/bin/mise activate zsh)"
  fi;
fi
