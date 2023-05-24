#!/bin/bash

pqemu=$(ps -ef | grep "qemu-system-x86_64" | grep -v "grep")

echo $pqemu

if [ -n "${pqemu}" ]
then
	echo "not empty"
	sudo pkill qemu-system-x86_64
	#echo "not empty"
else
	echo "Empty!"
fi

