#!/bin/bash
read -p "write link: " LINK
LINK="/home/error404/Desktop/$LINK"
if [ -L $LINK ]
then 
    ORIGINAL_PATH=$(readlink -f "$LINK")
    echo "Original File Path: $ORIGINAL_PATH"
    rm $LINK
     echo "Soft Link removed"
elif [ $(stat -c "%h" $LINK) ]
then
    NUMBERSOFLINKS=$(stat -c "%h" $LINK)
    echo  $NUMBERSOFLINKS

else
    echo "file is not exists"
fi
