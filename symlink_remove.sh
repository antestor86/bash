#!/bin/bash
function remove(){

	read -p "write filename or folder name: " LINK
	LINK="/home/error404/Desktop/$LINK"
	ORIGINAL_FILE=$(readlink -f $LINK)

	if [ -L $LINK ]
	then
		echo "the file is symlink $ORIGINAL_FILE" 
		rm  $LINK >&2

		cp -r "$ORIGINAL_FILE" "$LINK"
		echo "symlink is removed now $LINK is a Regular file"
	else
		echo "There is not any  symlink"
	fi

}


remove
