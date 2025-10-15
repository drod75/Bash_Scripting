#!/bin/bash

package=htop

sudo apt install $package

if [ $? -eq 0 ]; then
    echo "The installation of $package was successful."
else
    echo "The installation of $package failed."
fi
