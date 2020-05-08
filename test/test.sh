#!/bin/bash
sleep 10
runtime="2 minute"
endtime=$(date -ud "$runtime" +%s)

realIP=$(curl -s https://ipecho.net/plain)
echo "Real external IP $realIP" 
lastIP=$realIP
while [[ $(date -u +%s) -le $endtime ]]
do
    TorIP=$(curl -s --socks5-hostname tor-socks-proxy:$PORT https://ipecho.net/plain)
    echo "new IP $TorIP"
    if [ "$lastIP" = "$TorIP" ]; then
        echo "Test Fail : last IP = $lastIP New IP = $TorIP" 
        exit 1
    fi
    lastIP=$TorIP
    sleep 10
done

