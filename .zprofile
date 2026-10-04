# Make Homebrew tools available before initializing language runtimes.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Build helpers use non-interactive login shells, which do not read .zshrc.
# Interactive shells initialize fnm and directory switching in .zshrc instead.
if [[ ! -o interactive ]] && (( $+commands[fnm] )); then
  eval "$(fnm env --shell zsh --version-file-strategy recursive)"
  fnm use --install-if-missing --silent-if-unchanged
fi
