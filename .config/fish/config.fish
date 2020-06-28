# Base16 Shell
source ~/.dotfiles/.config/fish/functions/alias.fish


set PATH "/bin:$PATH"
set PATH "$HOME/.local/bin:$PATH"
set PATH "/usr/bin:$PATH"
set PATH "/usr/sbin:$PATH"
set PATH "$HOME/bin:$PATH"
set PATH "$DOTFILES_DIR/bin:$PATH"
set PATH "$HOME/.npm-global/bin:$PATH"
set PATH "$HOME/npm-modules:$PATH"
set PATH "/opt/gcc-arm/bin:$PATH"
set -gx EDITOR vim
set TERM xterm-256color

starship init fish | source
