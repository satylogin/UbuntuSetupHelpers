if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
source "$HOME/.cargo/env"

export PATH="$HOME/.poetry/bin:$PATH"

if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi
