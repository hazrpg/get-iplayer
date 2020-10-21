#!/bin/bash
# Script to download tv shows from BBC iPlayer
#echo "Refreshing..."
#/usr/bin/get_iplayer --refresh
echo "Running GUI..."
/usr/bin/get_iplayer.cgi --listen 0.0.0.0 --port 1935
