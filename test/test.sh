#!/bin/bash
sleep 10
runtime="2 minute"
endtime=$(date -ud "$runtime" +%s)
CMD="curl -s --socks5-hostname 127.0.0.1:9150 https://ipecho.net/plain"
realIP=$(curl -s https://ipecho.net/plain)
echo "Real external IP $realIP" 
lastIP=$realIP
while [[ $(date -u +%s) -le $endtime ]]
do
    echo $CMD 
    echo "$($CMD)"
    sleep 10
done
