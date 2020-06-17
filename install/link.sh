#!bin/bash
	ln -sfn ~/.dotfiles/.bashrc ~/.bashrc
	ln -sfn ~/.dotfiles/.zshrc ~/.zshrc
	ln -sfn ~/.dotfiles/.Xresources ~/.Xresources
	ln -sfn ~/.dotfiles/.config/npm/.npmrc ~/.npmrc
	ln -sfn ~/.dotfiles/.config/fish/config.fish ~/config.fish
	ln -sfn ~/.dotfiles/.config/git/.gitconfig ~/.gitconfig	
	rm -rf ~/.config/fish
	ln -sfn ~/.dotfiles/.config/fish ~/.config/fish
	ln -sfn ~/.dotfiles/.config/npm ~/.config/npm
	rm -rf ~/.config/polybar
	ln -sfn ~/.dotfiles/.config/polybar ~/.config/polybar
	ln -sfn ~/.dotfiles/.config/gtk-3.0 ~/.config/gtk-3.0
	rm -rf ~/.config/kitty
	ln -sfn ~/.dotfiles/.config/kitty ~/.config/kitty
	rm -rf ~/.config/neofetch
	ln -sfn ~/.dotfiles/.config/neofetch ~/.config/neofetch
	ln -sfn ~/.dotfiles/.config/i3status ~/.config/i3status
	mkdir -pv ~/.ssh
	ln -sfn ~/.dotfiles/.config/ssh/config ~/.ssh/
	ln -sfn ~/.dotfiles/.config/vim/ ~/
	chmod +x ~/.config/polybar/polybar.sh
	bash ~/.dotfiles/bin/appearance.sh loudpastel
