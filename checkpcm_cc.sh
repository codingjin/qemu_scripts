#!/bin/bash

FILE="BWDONE_CC"

sleep 60

while ! [[ -f "${FILE}" ]];do
	sleep 3
done

