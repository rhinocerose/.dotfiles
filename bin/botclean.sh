#!/bin/bash
# Clean up cruft (subtitles, nfo files, etc) left behind by botcleann
# Usually invoked by rename.sh
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
