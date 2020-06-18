#!/bin/bash

plugpath=~/.config/nvim/autoload/plugged/
just-colors --theme "$1" --no-apply
cat "$HOME"/.dotfiles/.config/i3/config.base "$HOME"/.config/just-colors/cache/i3-colors.local > "$HOME"/.dotfiles/.config/i3/config
cat "$HOME"/.dotfiles/.config/qutebrowser/config.py.local "$HOME"/.config/just-colors/cache/qutebrowser-config.py > "$HOME"/.dotfiles/.config/qutebrowser/config.py

ln -sfn ~/.config/just-colors/cache/kitty-colors.conf ~/.config/kitty/colors.conf	
ln -sfn ~/.config/just-colors/cache/colors.Xresources ~/colors.Xresources
mkdir -pv ~/.config/zathura
ln -sfn ~/.config/just-colors/cache/zathurarc ~/.config/zathura/zathurarc
ln -sfn ~/.dotfiles/.config/i3/config ~/.config/i3/config
mkdir -pv ~/.dotfiles/.config/vimthemes/"$1"/autoload/lightline/colorscheme
mkdir -pv ~/.dotfiles/.config/vimthemes/"$1"/autoload/airline/themes
mkdir -pv ~/.dotfiles/.config/vimthemes/"$1"/autoload/lightline/colorscheme
mkdir -pv ~/.dotfiles/.config/vimthemes/"$1"/colors

mv ~/.config/just-colors/cache/colors.vim ~/.dotfiles/.config/vimthemes/"$1"/colors/"$1".vim
ln -sfn ~/.dotfiles/.config/vimthemes/"$1"/colors/"$1".vim ~/.config/nvim/colors/base16-"$1".vim

ln -sfn ~/.dotfiles/.config/vimthemes/"$1"/colors/"$1".vim ~/.config/nvim/colors/base16-"$1"
mv ~/.config/just-colors/cache/colors.airline ~/.dotfiles/.config/vimthemes/"$1"/autoload/airline/themes/"$1".vim


mv ~/.config/just-colors/cache/colors.lightline ~/.dotfiles/.config/vimthemes/"$1"/autoload/lightline/colorscheme/"$1".vim
ln -sfn ~/.dotfiles/.config/vimthemes/"$1"/autoload/lightline/colorscheme/"$1".vim $plugpath/lightline.vim/autoload/lightline/colorscheme/"$1".vim 
sudo ln -sfn ~/.dotfiles/.config/vimthemes/"$1"/autoload/lightline/colorscheme/"$1".vim /usr/share/nvim/runtime/colors/"$1".vim 
