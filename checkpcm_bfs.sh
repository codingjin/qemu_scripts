#!/bin/bash

FILE="BWDONE_BFS"

sleep 60

while ! [[ -f "${FILE}" ]];do
	sleep 3
done

