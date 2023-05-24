#!/bin/bash

FILE="BWDONE_BC"

sleep 180

while ! [[ -f "${FILE}" ]];do
	sleep 3
done

