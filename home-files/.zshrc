fpath+=~/.zfunc

# Configure history
export HISTFILE=~/.zsh_history
setopt HIST_FIND_NO_DUPS

# Add Homebrew completions to FPATH
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# Enable completions
autoload -Uz compinit; compinit -i

# Enable `pure` prompt
autoload -U promptinit; promptinit
prompt pure

# Enable history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$key[Up]" up-line-or-beginning-search # Up
bindkey "$key[Down]" down-line-or-beginning-search # Down

export EDITOR='nano'

# Git aliases
alias s="git status"
alias br="git branch"
alias c="git commit -m"
alias co="git checkout"
alias p="git pull"
alias d="git difftool"
alias l="git log"
alias last="git log -1 HEAD"
alias unstage="git reset HEAD --"

# Scripts
export PATH="$HOME/Scripts:$PATH"

# Gitignore helper
gi() {
  curl \
    --output .gitignore \
    --silent \
    "https://raw.githubusercontent.com/github/gitignore/main/${1}.gitignore"
  echo "Created .gitignore file for $1"
}

# PNPM alias
alias pn="pnpm"

# Go
export PATH="$HOME/go/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
