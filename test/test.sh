#!/bin/bash
sleep 10
runtime="2 minute"
endtime=$(date -ud "$runtime" +%s)

realIP=$(curl -s https://ipecho.net/plain)
echo "Real external IP $realIP" 
lastIP=$realIP
while [[ $(date -u +%s) -le $endtime ]]
do
    curl -s --socks5-hostname tor-socks-proxy:9150 https://ipecho.net/plain | echo $?
       
    sleep 10
done
