#!/usr/bin/bash

#use case
echo "this is the script to delete files which are more than 30days old, in the selected folder"
#the folder path in which the script to be executed is passed via command line argument


#path
path=$1

#command to count total old files
total=`find $1 -mtime +30 |wc -l`
echo "total old files count : $total"

#command to delete old files
find $1 -mtime +30 -delete
if [ $? -eq 0 ];
then
echo "$total files deleted sucessfuly"
else
	echo "exit status : $?"
	echo "deletion not sussesful"
fi

