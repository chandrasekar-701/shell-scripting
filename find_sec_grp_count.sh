#!/usr/bin/bash

#this is the script to seperate the secondary group from total list groups(system,primary,secondary) in cat /etc/group

# idea is separting the unique user in /etc/passwd and /etc/group it gives only the secondary user as a result

alluser=`cat /etc/passwd |awk -F ':' '$3 > 999 && $3 < 60000 {print $1}'`

echo "$alluser" > /tmp/alluser.txt

allgroup=`cat /etc/group |awk -F ':' '$3 > 999 && $3 < 60000 {print $1}'`

echo "$allgroup" > /tmp/allgroup.txt

final=`cat /tmp/alluser.txt /tmp/allgroup.txt|sort|uniq -u`
count=`cat /tmp/alluser.txt /tmp/allgroup.txt|sort|uniq -u|wc -l`

echo "the total number of secondary group is: $count
secondary groups are :
$final"




