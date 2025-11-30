USER="ashar"

alias reload='source ~/.bashrc'
alias bedit='vim ~/.bash_aliases'
alias python='python3'
alias ..='cd ..'
alias ...='cd ../..'
alias rr='rm -rf'
alias desk='cd /mnt/c/Users/$USER/Desktop'
alias gh='cd /mnt/c/Users/$USER/Documents/github-files'
alias gitmod='git submodule update --init --recursive'
alias vedit='vim ~/.vim/vimrc'

function mkd () {
        if [ $# != 1 ]; then
                echo "Usage: mkd <dir>"
        else
                mkdir -pv "$1" && cd "$1"
        fi
}

function cd () {
        if [ -n "$1" ]; then
                builtin cd "$@" && ll
        else
                builtin cd ~ && ll
        fi
}

function gc () {
    git add . && git commit -m "$1" && git push
}

function gclone () {
    git clone --recurse-submodules --remote-submodules -j8 git@git-rhino:rhinocerose/"$1"
}

function grhino () {
    git clone git@git-rhino:rhinocerose/"$1"
}

function gadd () {
    git sadd git@git-rhino:rhinocerose/"$1"
}
