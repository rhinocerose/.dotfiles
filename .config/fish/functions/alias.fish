function xr
	xrandr --output VGA1 --primary --mode 1920x1080 --output LVDS1 --off
end

function rfish
	source $HOME/config.fish
end

function aledit
	nvim $HOME/.dotfiles/.config/fish/functions/function.fish
end

function vedit
	nvim ~/.config/nvim/init.vim
end

function fedit
	nvim $HOME/config.fish
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
	nvim ~/.config/polybar/config
end

function ii
	nvim ~/.config/i3/config
end


function ll
	ls -lah
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
	sudo rm -rf
end

function ssh
	env TERM=xterm-256color ssh
end

function vim
	nvim
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
	bash ~/.dotfiles/bin/rename.sh
end

function yt
	tizonia --youtube-audio-search
end

function sc
	tizonia --soundcloud-tracks
end

function cal
	gcalcli --cal ashar.k.latif@gmail.com  quick
end

function api
	sudo pacman -S --noconfirm
end

function pb
	bash $HOME/.dotfiles/bin/pandoc/panbuild.sh
end

