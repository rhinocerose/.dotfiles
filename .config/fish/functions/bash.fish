function repoadd
    repo-add ~/customrepo/repo.db.tar.gz /home/arch/.cache/yay/*/*.pkg.tar.*
end

function f
    find . -name "$argv"
end

function grep
	rg -i "$argv"
end

function mkd
        mkdir -pv "$argv"; and cd "$argv"
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

function ds
    cd /srv/salt
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
	lsd -la
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

function kd
	kitty +kitten diff
end

function rename
	bash ~/.dotfiles/bin/rename.sh $argv
end
