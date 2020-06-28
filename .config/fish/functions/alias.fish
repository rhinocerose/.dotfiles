function cat
	bat "$argv"
end


function mkd
        mkdir -pv "$argv"; and cd "$argv"
end

function topi
	scp "$argv" rpi:~/Downloads/
end

function todesk
	scp "$argv" desk:~/Downloads/
end

function tocse
	scp "$argv" cse:~/Downloads/
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

function link
	bash ~/.dotfiles/install/link.sh "$argv"
end

function xr
	xrandr --output VGA1 --primary --mode 1920x1080 --output LVDS1 --off
end

function reload
	source $HOME/config.fish
	source $HOME/.dotfiles/.config/fish/functions/alias.fish
end

function aledit
	vim $HOME/.dotfiles/.config/fish/functions/alias.fish
end

function vedit
	vim ~/.vim/vimrc
end

function fedit
	vim $HOME/config.fish
end

function dl
	cd ~/Downloads
end

function dot
	cd $HOME/.dotfiles
end

function con
	cd ~/.config
end

function poly
	vim ~/.config/polybar/config
end

function ii
	vim ~/.config/i3/config
end

function fd
	ls -lah | rg -i "$argv"
end

function ll
	colorls -la 
end

function ..
	cd ..
end

function ...
	cd ../..
end

function clr
	clear
end

function rr
	sudo rm -rf $argv
end

function ssh
	env TERM=xterm-256color ssh "$argv"
end

function gp
	git push origin master
end

function gc
	git add -A; and git commit -m 'quick commit'; and git push origin master
end

function kd
	kitty +kitten diff
end

function rename
	bash ~/.dotfiles/bin/rename.sh $argv
end

function yt
	tizonia --youtube-audio-search "$argv"
end

function sc
	tizonia --soundcloud-tracks "$argv"
end

function cal
	gcalcli --cal ashar.k.latif@gmail.com  quick
end

function api
	sudo pacman -S --noconfirm $argv
end

function apr
	sudo pacman -Rcns $argv
end


function pb
	bash $HOME/.dotfiles/bin/pandoc/panbuild.sh $argv
end


