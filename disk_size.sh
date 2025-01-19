#!/bin/bash
echo "to check the disk utilization percentage in linux system"
disk_size=`df -h |grep /dev/sda2|awk '{print $5}'|cut -d '%' -f1`
echo "memory utilized by /dev/sda2 is $disk_size%"
if [ $disk_size -gt 80 ];
then
	echo "memory utilization more than 80%,expand the disk size or delete some files soon"
else
	echo "enough space is available"
fi
