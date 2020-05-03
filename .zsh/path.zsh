#!/usr/bin/env zsh

[[ ":$PATH:" != *":/bin:"* ]] && PATH="/bin:${PATH}"
[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && PATH="$HOME/.local/bin:${PATH}"
[[ ":$PATH:" != *":/usr/bin:"* ]] && PATH="/usr/bin:${PATH}"
[[ ":$PATH:" != *":/usr/sbin:"* ]] && PATH="/usr/sbin:${PATH}"
[[ ":$PATH:" != *":$HOME/bin:"* ]] && PATH="$HOME/bin:${PATH}"
[[ ":$PATH:" != *":$DOTFILES_DIR/bin:"* ]] && PATH="$DOTFILES_DIR/bin:${PATH}"
[[ ":$PATH:" != *":$HOME/.npm-global/bin:"* ]] && PATH="$HOME/.npm-global/bin:${PATH}"
