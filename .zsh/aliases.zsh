#!/usr/bin/env zsh

alias reload="source $HOME/.zshrc"
alias aledit="nano $HOME/.dotfiles/.zsh/aliases.zsh"
alias zedit="nano $HOME/.dotfiles/.zshrc"

alias ..="cd .."
alias ...="cd ../.."
alias _="sudo"

alias g="git"
alias gp="git push origin master"
alias gc="git add -A && git commit -m 'quick commit'"

alias ll="ls -lah"

alias rr="rm -rf"

alias df="cd $HOME/.dotfiles"
alias omz="cd $HOME/.oh-my-zsh"

alias api="sudo apt install -y"
alias apu="sudo apt update"

alias cse="ssh asharkl@red.cse.yorku.ca"
alias rpi="ssh pi@192.168.1.3"

alias pb="zsh $HOME/.dotfiles/bin/pandoc/panbuild.sh "
