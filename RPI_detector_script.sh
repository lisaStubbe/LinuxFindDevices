#!/bin/bash
stream_raw=$(tcpdump -nn -c5 -i wlan0 -e)

ip_addr=$(grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'<<<"$stream_raw")
mac_addr=$(grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'<<<"$stream_raw")

mapfile -t ip_addresses < <(grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'<<<"$stream_raw")
mapfile -t mac_addresses < <(grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'<<<"$stream_raw")

RPI_index=()
count=0
RPI_MAC='b8:27:eb'

for i in "${mac_addresses[@]}"
  do
    :
    #echo $count
    if [[ $i =~ "b8:27:eb" ]];
    then
      RPI_index+=($count)
      #echo $count
    fi
    count=$((count+1))
done