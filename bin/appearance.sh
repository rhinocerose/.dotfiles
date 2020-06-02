#!/bin/bash

just-colors --theme $1 --no-apply
cat $HOME/.dotfiles/.config/i3/config.base $HOME/.config/just-colors/cache/colors.local > $HOME/.dotfiles/.config/i3/config

ln -sfn ~/.config/just-colors/cache/colors.conf ~/.config/kitty/colors.conf	
ln -sfn ~/.config/just-colors/cache/colors.Xresources ~/colors.Xresources
mkdir -pv ~/.config/qutebrowser
ln -sfn ~/.config/just-colors/cache/config.py ~/.config/qutebrowser/config.py
m -rf ~/.config/zathura
mkdir -pv ~/.config/zathura
ln -sfn ~/.config/just-colors/cache/zathurarc ~/.config/zathura/zathurarc
ln -sfn ~/.dotfiles/.config/i3/config ~/.config/i3/config
