#!/bin/bash
for path in /etc/*
do
	if [ -f "$path" ]
	then
		wc -l $path	
	fi
done 2>/dev/null
