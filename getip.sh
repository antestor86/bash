#!/bin/bash

read -p "write DNS name: " dns_name
result=$(nslookup $dns_name | grep "Address" | head -n 1 | cut -d ' ' -f2 )

echo "$result"

