# Homebrew
if [[ -a /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Mise
if [[ -a ~/.local/bin/mise ]]; then
  eval "$(~/.local/bin/mise activate zsh)"
fi
