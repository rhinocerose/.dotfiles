function api
	sudo pacman -S --noconfirm $argv
end

function apr
	sudo pacman -R $argv
end

function apu
	sudo pacman -Syyu
end
