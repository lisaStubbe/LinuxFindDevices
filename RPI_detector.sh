#!/bin/bash
##ip_addr_stream_raw=$(tcpdump -l -c1 -nn "ether[6:2] == 0xb827 and ether[8:1] == 0xeb")
#echo $ip_addr_stream_raw
##ip_addr=$(grep -o -E 'IP [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'<<<"$ip_addr_stream_raw")
#ip_addr=$(grep -o -E 'IP [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'<<<"IP 192.168.0.116.50834 > 216.58.208.110.443: Flags [P.], seq 956069419:956070009, ack 2456084586, win 3097, options [nop,nop,TS val 1621283006 ecr 2243252515], length 590")
#ip_addresses = ()
#ip_addresses = (1 2)
stream_raw=$(tcpdump -nn -c5 -i wlan0 -e)
#echo $stream_raw
ip_addr=$(grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'<<<"$stream_raw")
mac_addr=$(grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'<<<"$stream_raw")