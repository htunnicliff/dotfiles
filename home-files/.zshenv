# Local zshenv
if [[ -f ~/.config/zsh/.zshenv ]]; then
  source ~/.config/zsh/.zshenv
fi

# Go path
export GOPATH="${GOPATH:-$HOME/go}"
if [[ -d "$GOPATH/bin" ]]; then
  path=("$GOPATH/bin" $path)
fi
