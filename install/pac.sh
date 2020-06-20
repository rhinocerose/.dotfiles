#!bin/sh
while read line
do
       sudo pacman -S --noconfirm $line
done < $1
