fpath+=~/.zfunc

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

# Gitignore helper
gi() {
  curl \
    --output .gitignore \
    --silent \
    "https://raw.githubusercontent.com/github/gitignore/main/${1}.gitignore"
  echo "Created .gitignore file for $1"
}

# Deno
export DENO_INSTALL="/Users/hunter/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Bun
export BUN_INSTALL="/Users/side/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/hunter/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Go
export PATH="$HOME/go/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
