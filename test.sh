#!/bin/bash
read -p "write count: " count
num=0
while [ $num -le $count ]
do
	echo $num
	num=$num + 1
done

