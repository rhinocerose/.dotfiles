#!bin/sh
while read line
do
    for word in $line
    do
       sudo yay -S $word
    done
done < $1