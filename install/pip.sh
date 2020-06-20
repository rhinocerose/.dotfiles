#!bin/sh
while read line
do
       python3 -m pip install --upgrade --user $line
done < $1
