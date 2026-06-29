#!/bin/bash

#if arguments count are not equal 2 get error
if [ $# -ne 2 ]
then 

	echo "2 arguments are needed"
	exit 1
fi

#check if argument is file
if [ ! -f $1 ]
then
	echo "Argument $1  is not file type"
	exit 1
fi
#check if target  argument is file
if [ ! -f $2 ]
then
        echo "Argument $2  is not file type"
	exit 1
fi

if cp -r $1 $2 && rm -r $1
then
	echo "file $1 renamed $2"
	exit 0
else
       echo "Error! Something went wrong!"
fi

