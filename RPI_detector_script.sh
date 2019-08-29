#!/bin/bash
stream_raw=$(tcpdump -nn -c5 -i wlan0 -e)