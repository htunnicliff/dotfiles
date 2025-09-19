# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

ARCH=$(uname -m)
OS=$(uname)

# Set up Homebrew for Apple Silicon Macs
if [[ ${ARCH} == arm* ]] && [[ ${OS} == Darwin ]] && [[ -f /opt/homebrew/bin/brew ]]; then
	BREW_ENV=$(/opt/homebrew/bin/brew shellenv)
	eval "${BREW_ENV}"
fi
