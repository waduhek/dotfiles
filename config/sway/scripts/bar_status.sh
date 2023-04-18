#!/bin/bash

time=$(date +'%Y-%m-%d %I:%M:%S %p')
mem_usage=$(free -h --giga | grep Mem | awk '{ print $3 }')

echo "Mem: $mem_usage | $time"
