bash ~/.dotfiles/bin/kittyupdate.sh
source ~/.xinitrc

alias reload="source $HOME/.zshrc"
alias rfish="source $HOME/config.sh"
alias aledit="nano $HOME/.dotfiles/.zsh/aliases.zsh"
alias zedit="nano $HOME/.zshrc"
alias fedit="nano $HOME/config.sh"
alias dot="cd $HOME/.dotfiles"
alias con="cd ~/.config"
alias poly="nano ~/.config/polybar/config"
alias ii="nano ~/.config/i3/config"

alias ll="ls -lah"
alias ..="cd .."
alias ...="cd ../.."
alias clr="clear"

alias g="git"
alias gp="git push origin master"
alias gc="git add -A; and git commit -m 'quick commit'; git push origin master"
alias kd="kitty +kitten diff"

alias rr="rm -rf"

alias api="sudo pacman -S"
alias apu="sudo apt update"

alias pb="bash $HOME/.dotfiles/bin/pandoc/panbuild.sh"

function mkd
        mkdir -pv "$argv"; and cd "$argv"
end

function cd
        if count $argv > /dev/null
                builtin cd "$argv"; and ll
        else
                builtin cd ~; and ll
        end
end

set PATH "/bin:$PATH"
set PATH "$HOME/.local/bin:$PATH"
set PATH "/usr/bin:$PATH"
set PATH "/usr/sbin:$PATH"
set PATH "$HOME/bin:$PATH"
set PATH "$DOTFILES_DIR/bin:$PATH"
set PATH "$HOME/.npm-global/bin:$PATH"
