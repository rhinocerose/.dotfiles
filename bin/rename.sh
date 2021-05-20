#!/bin/bash
# Rename clusters of TV files using botclean

path=$1
vidfile=$(find $path -type f -name '*.avi' -o -name '*.mp4' -o -name '*.mkv')

if [ "${vidfile}" = "" ]
then
	echo 'No files found...'
	exit 1
else
	mv $path/*/* $path
	filebot -rename -r $path --db tvmaze -non-strict
fi

bash ~/.dotfiles/bin/botclean.sh $path
