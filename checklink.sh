#!/bin/bash

read -p "write link: " LINK
LINK="/home/error404/Desktop/$LINK"


if [ ! -e "$LINK" ] && [ ! -L "$LINK" ]
then
    echo "file does not exist"
else

    if [ -L "$LINK" ]
    then 
        ORIGINAL_PATH=$(readlink -f "$LINK")
        echo "The file has soft link"
        echo "Original File Path: $ORIGINAL_PATH"
        rm "$LINK"
        echo "Soft Link removed"
    else

        NUMBERSOFLINKS=$(stat -c "%h" "$LINK")
        if [ "$NUMBERSOFLINKS" -gt 1 ]
        then
            echo "Numbers of hard link is $NUMBERSOFLINKS"
        else
            echo "This is a regular file with no additional hard links"
        fi
    fi
fi