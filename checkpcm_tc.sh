#!/bin/bash

FILE="BWDONE_TC"

sleep 280

while ! [[ -f "${FILE}" ]];do
	sleep 3
done

