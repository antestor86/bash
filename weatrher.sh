#!/bin/bash
WEATHER=$(curl -s "wttr.in/Yerevan?format=%t")
echo $WEATHER
