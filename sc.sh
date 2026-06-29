#!/bin/bash
read -p "please enter username " username
if [ $username = "Anna" ]
then 
	read -s -p "please enter the password" password
	if [ $password = "123" ]
	then 
		echo "Welcome $username"
	else
		echo "wrong password"
		exit 1
	fi
else
	 echo "invalid username"
fi

