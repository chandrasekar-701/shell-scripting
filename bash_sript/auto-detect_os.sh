#!/bin/bash
if [ -f /etc/os-release ];  # -f=check for file exists(regular file),-d=check directory, -e= check for all( file, directory, irregular file{symblink,zip,tar,.sh..etc}), -x= for existing file is executable, -r=redable, -w= wirtable
then  
    . /etc/os-release # (or) use {source /etc/os-release}   #It loads the content of a file(/etc/os-release) into the current shell session, so that any variables in that file become available in our current script.
    OS=$ID
else
    echo "Cannot determine OS type."
    exit 1
fi

echo "Detected OS: $OS"

# block to install curl packages
    if [[ "$OS" == "ubuntu" ]]; 
    then
        sudo apt update
        sudo apt install -y curl
    elif [[ "$OS" == "centos" || "$OS" == "rhel" ]]; 
    then
        sudo yum install -y curl
    else
        echo "Unsupported OS for curl installation."
    fi
}

# block for adding user {add user} -----------------using function 
add_user() {
    username="$1"
    if [[ -z "$username" ]];  #-z flag gives true as a o/p if the $username varible is EMPTY(no value), -n flag give true as a o/p if the $username varible if NOT EMPTY(if the variable have values in it)
    then
        echo "Usage: add_user <username>"
        return    #The return keywork is used to exit from a function early — without running the rest of the function. and go back to where the function was called.
    fi
    sudo useradd "$username"
    sudo passwd "$username"
    
    if [[ "$OS" == "ubuntu" ]]; then
        sudo usermod -aG sudo "$username"
    elif [[ "$OS" == "centos" || "$OS" == "rhel" ]]; then
        sudo usermod -aG wheel "$username"
    fi
}

# Function to enable firewall
enable_firewall() {
    if [[ "$OS" == "ubuntu" ]]; then
        sudo ufw enable
        sudo ufw allow 22
    elif [[ "$OS" == "centos" || "$OS" == "rhel" ]]; then
        sudo systemctl enable firewalld --now
        sudo firewall-cmd --permanent --add-port=22/tcp
        sudo firewall-cmd --reload
    else
        echo "Unsupported OS for firewall config."
    fi
}



add_user $1    # this line call the add_user funtion with argument $1
enable_firewall
