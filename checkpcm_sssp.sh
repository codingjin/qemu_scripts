#!/bin/bash

sleep 300

FILE="BWDONE_SSSP"
while ! [[ -f "${FILE}" ]];do
	sleep 3
done

