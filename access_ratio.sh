#!/bin/bash

pbw_read=($(cat MBW | grep -E 'PMM Read' | tr -d '[:space:]' | cut -d':' -f2 | cut -d'-' -f1))
pbw_write=($(cat MBW | grep -E 'PMM Write' | tr -d '[:space:]' | cut -d':' -f2 | cut -d'-' -f1))
mbw=($(cat MBW | grep -E 'Memory' | tr -d '[:space:]' | cut -d':' -f2 | cut -d'-' -f1))


#echo "PMM Read: ${pbw_read}"
#echo "PMM Wtite: ${pbw_write}"
#echo "Memory: ${mbw}"

paratio=($(echo "scale=3; (${pbw_read}+${pbw_write})*100/${mbw}" | bc -l))
echo "PMM Access Ratio: "${paratio}"%"
