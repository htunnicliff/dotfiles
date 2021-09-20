# oh-my-zsh configuration path
export ZSH="/$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# NVM
export NVM_COMPLETION=true
plugins=(git zsh-nvm)
source $ZSH/oh-my-zsh.sh

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
