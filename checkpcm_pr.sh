#!/bin/bash

FILE="BWDONE_PR"

sleep 300

while ! [[ -f "${FILE}" ]];do
	sleep 3
done

