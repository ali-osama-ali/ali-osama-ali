#!/bin/bash

echo >/home/ali_osama/tcm_course/tmp.txt
for i in {1..10}; do
    ping 192.168.1.$i -c 1 -w 1 | grep "64 bytes" | awk {'print $4'} | tr -d ":" >>/home/ali_osama/tcm_course/tmp.txt
done

for ip in $(cat tmp.txt); do
    nmap -A -p- $ip
done
