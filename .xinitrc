#xrandr --output VGA1 --mode 1920x1080
#xrandr --output LVDS1 --off
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec i3
