#!bin/sh
while read line
do
       sudo pacman -S --noconfirm $word
done < $1