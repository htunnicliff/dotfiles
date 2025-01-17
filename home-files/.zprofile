# Homebrew
if [[ -a /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Mise
if [[ -a ~/.local/bin/mise ]]; then
  if [[ "$TERM_PROGRAM" != 'vscode' ]]; then
    eval "$(~/.local/bin/mise activate zsh)"
  elif; then
    # When in VSCode, use shims
    eval "$(~/.local/bin/mise activate zsh --shims)"
  fi;
fi
