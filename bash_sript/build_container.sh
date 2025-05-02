#!/bin/bash

#this the script to fetch the docker file source code from github public repository and to build an image and to build a container


wget -O dockerfile  https://raw.githubusercontent.com/chandrasekar-701/task/refs/heads/main/docker_file

#build image using the docker file

docker build -t myapache2 .

#command to build a container

docker run -itd --name kvs2 -p 805:80 myapache2


