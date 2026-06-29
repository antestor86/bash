#!/bin/bash

read -p "write birth year: " birthdate

CURRENT_YEAR = $(date + '%Y')

#age = $(( CURRENT_YEAR - birthdate ))

echo $CURRENT_YEAR
echo $age

