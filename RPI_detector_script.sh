#!/bin/bash
stream_raw=$(tcpdump -nn -c5 -i wlan0 -e)

ip_addr=$(grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'<<<"$stream_raw")
mac_addr=$(grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'<<<"$stream_raw")
