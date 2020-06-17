#!/bin/bash

just-colors --theme $1 --no-apply
cat $HOME/.dotfiles/.config/i3/config.base $HOME/.config/just-colors/cache/i3-colors.local > $HOME/.dotfiles/.config/i3/config
cat $HOME/.dotfiles/.config/qutebrowser/config.py.local $HOME/.config/just-colors/cache/qutebrowser-config.py > $HOME/.dotfiles/.config/qutebrowser/config.py

ln -sfn ~/.config/just-colors/cache/kitty-colors.conf ~/.config/kitty/colors.conf	
ln -sfn ~/.config/just-colors/cache/colors.Xresources ~/colors.Xresources
mkdir -pv ~/.config/zathura
ln -sfn ~/.config/just-colors/cache/zathurarc ~/.config/zathura/zathurarc
ln -sfn ~/.dotfiles/.config/i3/config ~/.config/i3/config
