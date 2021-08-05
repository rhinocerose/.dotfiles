#!/bin/bash

ln -sfn ~/.dotfiles/.bashrc ~/.bashrc
ln -sfn ~/.dotfiles/.xprofile ~/.xprofile
ln -sfn ~/.dotfiles/.zshrc ~/.zshrc
ln -sfn ~/.dotfiles/.Xresources ~/.Xresources
ln -sfn ~/.dotfiles/config/npm/.npmrc ~/.npmrc
ln -sfn ~/.dotfiles/config/fish/config.fish ~/config.fish
ln -sfn ~/.dotfiles/config/git/.gitconfig ~/.gitconfig
ln -sfn ~/.dotfiles/config/git/.gitignore ~/.gitignore
rm -rf ~/.config/fish
ln -sfn ~/.dotfiles/config/fish ~/.config/fish
ln -sfn ~/.dotfiles/config/npm ~/.config/npm
rm -rf ~/.config/polybar
ln -sfn ~/.dotfiles/config/polybar ~/.config/polybar
ln -sfn ~/.dotfiles/config/colorls ~/.config/colorls
ln -sfn ~/.dotfiles/config/gtk-3.0 ~/.config/gtk-3.0
rm -rf ~/.config/kitty
ln -sfn ~/.dotfiles/config/kitty ~/.config/kitty
rm -rf ~/.config/neofetch
ln -sfn ~/.dotfiles/config/neofetch ~/.config/neofetch
ln -sfn ~/dotfiles-private/.config/tizonia ~/.config/tizonia
ln -sfn ~/dotfiles-private/.config/mps-youtube ~/.config/mps-youtube
ln -sfn ~/.dotfiles/config/starship.toml ~/.config/starship.toml
mkdir -pv ~/.ssh
ln -sfn ~/dotfiles-private/.config/ssh/config ~/.ssh/
ln -sfn ~/.dotfiles/config/vim/vim-plug.vim ~/.vim/vim-plug.vim
ln -sfn ~/.dotfiles/config/vim/vimrc ~/.vim/vimrc
chmod +x ~/.config/polybar/polybar.sh
ln -sfn ~/.dotfiles/fonts/*.ttf /usr/share/fonts/TTF/
ln -sfn ~/.dotfiles/fonts/*.otf /usr/share/fonts/OTF/
bash ~/.dotfiles/bin/"appearance.sh" "$1"
