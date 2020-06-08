#!/bin/bash

path=$1
filebot -script fn:cleaner $path
tempfile=$(find $path -type f -name '*.txt')

if [ "${tempfile}" = "" ]
then
	echo 'No text files found...'
	exit 1
else
	rm -f *.{txt,torrent,dat}
fi
