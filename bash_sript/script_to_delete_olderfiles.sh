#!/bin/bash

echo "this is the script file to delete the files which are olderthan desired number of days"

path=$1
days=$2

find $path -mtime +$days -delete

if [[ $? -eq 0 ]];
then
        echo "Files in path: $path older than $days days are deleted successfully"
else
        echo "deletion is not successfull"
fi                                                                         


$? is used to check the status,0 means successfull execution
