alias ..="cd .."
alias ...="cd ../.."
alias _="sudo"
alias g="git"

alias rr="rm -rf"

alias df = "cd ~/.dotfiles"

mkd () {
	if [ count $argv != 1 ]; then
		echo "Usage: mkd <dir>"
	else
		mkdir -pv "$1" && cd "$1"
	fi
}

cd () {
	if [ -n "$1" ]; then
		builtin cd "$argv" && ll
	else
		builtin cd ~ && ll
	fi
}

set PATH "/bin:$PATH"
set PATH "~/.local/bin:$PATH"
set PATH "/usr/bin:$PATH"
set PATH "/usr/sbin:$PATH"
set PATH "$HOME/bin:$PATH"
set PATH "$DOTFILES_DIR/bin:$PATH"
set PATH "~/.npm-global/bin:$PATH"
