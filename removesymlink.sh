#!/bin/bash

function removelink(){
    read -p  "write link name  " LINK
    if [ -L "/home/error404/Desktop/$LINK" ]
    then
        echo "readlink -f "/home/error404/Desktop/$LINK"
        ORIGINAL_PATH= readlink -f "/home/error404/Desktop/$LINK"
        echo $ORIGINAL_PATH
        rm "/home/error404/Desktop/$LINK" >&2
        #cp $ORIGINAL_PATH /home/error404/Desktop/$LINK>&2
    else
        echo "the file is not symlink"    

    fi
}


removelink