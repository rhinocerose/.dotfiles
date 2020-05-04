if status --is-interactive
    abbr --add --global rpi 'pi@192.168.1.3'
    abbr --add --global second 'asharkl@cse.red.yorku.ca'
    # etcetera
end


alias reload="source $HOME/.zshrc"
alias rfish="source $HOME/config.sh"
alias aledit="nano $HOME/.dotfiles/.zsh/aliases.zsh"
alias zedit="nano $HOME/.zshrc"
alias fedit="nano $HOME/config.sh"
alias dot="cd $HOME/.dotfiles"

alias ll="ls -lah"
alias ..="cd .."
alias ...="cd ../.."
alias cl="clear"

alias g="git"
alias gp="git push origin master"
alias gc="git add -A && git commit -m 'quick commit'"
alias rr="rm -rf"

alias api="sudo apt install -y"
alias apu="sudo apt update"

alias pb="zsh panbuild.sh"


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
