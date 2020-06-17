#!bin/sh
while read line
do
    for word in $line
    do
       python3 -m pip install --upgrade --user $word
    done
done < $1