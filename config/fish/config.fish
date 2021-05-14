source ~/.dotfiles/.config/fish/functions/*.fish
#source ~/.dotfiles/.config/fish/functions/websearch


set PATH "/bin:$PATH"
set PATH "$HOME/.local/bin:$PATH"
set PATH "/usr/bin:$PATH"
set PATH "/usr/sbin:$PATH"
set PATH "$HOME/miniconda3/condabin:$PATH"
set PATH "$HOME/bin:$PATH"
set PATH "$DOTFILES_DIR/bin:$PATH"
set PATH "$HOME/.npm-global/bin:$PATH"
set PATH "$HOME/npm-modules:$PATH"
set PATH "/opt/gcc-arm/bin:$PATH"
set PATH "$HOME/.gem/ruby/2.7.0/bin:$PATH"
set PATH "$HOME/anaconda3/bin:$PATH"

set -gx EDITOR vim
set -gx VISUAL "$EDITOR"
set TERM xterm-256color
set LANG "en_US.UTF-8"

set ARDUINO_DIR "/usr/share/arduino"
set ARDMK_DIR "/usr/share/arduino"
set AVR_TOOLS_DIR "/usr"

set FZF_DEFAULT_COMMAND 'rg --hidden --ignore .git --nocolor -g ""'
set FZF_DEFAULT_OPTS "--color fg:242,bg:233,hl:65,fg+:15,bg+:234,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168
--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'
--bind alt-j:down,alt-k:up"

starship init fish | source

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# eval /home/arch/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# # <<< conda initialize <<<

