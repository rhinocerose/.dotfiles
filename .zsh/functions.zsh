#!/usr/bin/env zsh

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
