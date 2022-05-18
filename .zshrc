# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"
fpath+=~/.zfunc

# Enable Homebrew ZSH completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

export DENO_INSTALL="/Users/hunter/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"


# Enable ZSH completions
autoload -Uz compinit
compinit

# Enable `pure` prompt
autoload -U promptinit; promptinit
prompt pure

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# Git aliases
alias s="git status"
alias br="git branch"
alias c="git commit -m"
alias co="git checkout"
alias d="git diff"
alias l="git log"
alias p="git pull"
alias last="git log -1 HEAD"
alias unstage="git reset HEAD --"

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Laravel
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias artisan='[ -f artisan ] && php artisan'

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
