#!/bin/bash
TOTAL_SPACE=$(df / | tail -n 1 | awk '{print $2}')
FREE_SPACE=$(df / | tail -n 1 | awk '{print $4}')

USED_SPACE=$(($TOTAL_SPACE - $FREE_SPACE))
echo $USED_SPACE




