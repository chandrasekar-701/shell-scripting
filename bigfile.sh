#!/usr/bin/bash
#this is a script to find top 10 biggest file in a given path. which i passed via command line argument
path=$1
echo "$path"
du -ah $path|sort -rh|head -10 > /tmp/bigfile.txt
echo "top 10 biggest file in path:$1 are,"
cat /tmp/bigfile.txt



