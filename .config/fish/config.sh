alias xr="xrandr --output VGA1 --primary --mode 1920x1080 --output LVDS1 --off"

alias reload="source $HOME/.zshrc"
alias rfish="source $HOME/config.sh"
alias aledit="nano $HOME/.dotfiles/.zsh/aliases.zsh"
alias zedit="nano $HOME/.zshrc"
alias fedit="nano $HOME/config.sh"

alias dl="cd ~/Downloads"
alias dot="cd $HOME/.dotfiles"
alias con="cd ~/.config"
alias poly="nano ~/.config/polybar/config"
alias ii="nano ~/.config/i3/config"

alias ll="ls -lah"
alias ..="cd .."
alias ...="cd ../.."
alias clr="clear"
alias rr="sudo rm -rf"
alias ssh="env TERM=xterm-256color ssh"

alias g="git"
alias gp="git push origin master"
alias gc="git add -A; and git commit -m 'quick commit'; and git push origin master"

alias kd="kitty +kitten diff"
alias rename="bash ~/.dotfiles/bin/rename.sh"
alias tele="/mnt/TV/tv/"
alias yt="tizonia --youtube-audio-search"
alias sc="tizonia --soundcloud-tracks"
alias cal="gcalcli --cal ashar.k.latif@gmail.com  quick"
alias api="sudo pacman -S"

alias pb="bash $HOME/.dotfiles/bin/pandoc/panbuild.sh"

function mkd
        sudo mkdir -pv "$argv"; and cd "$argv"
end

function topi
	scp "$argv" rpi:~/Downloads/
end

function todesk
	scp "$argv" desk:~/Downloads
end

function look
	bash ~/.dotfiles/bin/appearance.sh "$argv"
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
set PATH "/opt/gcc-arm/bin:$PATH"
