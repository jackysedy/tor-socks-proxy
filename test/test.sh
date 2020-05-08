#!/bin/bash

runtime="2 minute"
endtime=$(date -ud "$runtime" +%s)

realIP=$(curl -s https://ipecho.net/plain)
echo "Real external IP $realIP" 
lastIP=$realIP
while [[ $(date -u +%s) -le $endtime ]]
do
    TorIP="$(curl -s --socks5-hostname 127.0.0.1:9150 https://ipecho.net/plain)"
    echo "new IP $TorIP"
    if [ $lastIP = $TorIP ]; then
        exit 1
    fi
    lastIP=$TorIP
    sleep 10
done
