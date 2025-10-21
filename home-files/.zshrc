fpath+=~/.zfunc

# Colors
export CLICOLOR=auto

# Configure history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS

# Enable `mise`
if [[ ! -f $HOME/.local/bin/mise ]]; then
  curl https://mise.run | sh
fi

# Add Homebrew completions to FPATH
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# Enable completions
autoload -Uz compinit; compinit -i

# Enable `pure` prompt
if [[ ! -d $HOME/.zsh/pure ]]; then
  mkdir -p "$HOME/.zsh"
  git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi

fpath+=($HOME/.zsh/pure)
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
b() {
  if ! command -v fzf >/dev/null 2>&1; then
    echo "fzf is not installed. Please install fzf to use this function."
    return 1
  fi
  git branch | fzf | xargs -I {} git checkout {}
}

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

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# Homebrew
if [[ -a /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Mise
if [[ -a ~/.local/bin/mise ]]; then
  if [ -t 1 ]; then
    eval "$(~/.local/bin/mise activate zsh)"
  else
    # When in VSCode, use shims
    eval "$(~/.local/bin/mise activate zsh --shims)"
  fi;
fi

# Node
alias bignode="NODE_OPTIONS='--max-old-space-size=20480'"

# Copilot
alias gc="gh copilot"
alias gcs="gh copilot suggest"
alias gce="gh copilot explain"


# Local zshrc
if [[ -f ~/.config/zsh/.zshrc ]]; then
  source ~/.config/zsh/.zshrc
fi
