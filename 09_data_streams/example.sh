#!/bin/bash

release_file=/etc/os-release
logfile=/var/log/updater.log
errorfile=/var/log/updater_error.log

if grep -q "Arch" $release_file
then
    sudo pacman -Syu 1>>$logfile 2>>$errorfile
    if [ $? -ne 0 ]
    then
        echo "An error occured, please check $errorfile file"
    fi
fi
if grep -q "Debian" $release_file ||grep -q "Ubuntu" $release_file
then
    sudo apt update 1>>$logfile 2>>$errorfile
    if [ $? -ne 0 ]
    then
        echo "An error occured, please check $errorfile file"
    fi
    sudo apt dist-upgrade 1>>$logfile 2>>$errorfile
    if [ $? -ne 0 ]
    then
        echo "An error occured, please check $errorfile file"
    fi
fi
