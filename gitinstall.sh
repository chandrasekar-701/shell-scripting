#!/usr/bin/bash
echo "script to install git in your machine"
if [ "$(uname)" == "Linux" ];
then
	echo "this is linux machine and i am ready to install here"
	sudo apt install git
elif [ "$(uname)" != "Linux" ];
then
	echo "sorry boss this is not linux machine "
	echo "please try it in linux machine"
fi
