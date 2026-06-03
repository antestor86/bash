#!/bin/bash

read -p "write domainn name: " DNS_NAME

if ping -q "$DNS_NAME" > /dev/null
then
	echo "$DNS_NAME"
fi
