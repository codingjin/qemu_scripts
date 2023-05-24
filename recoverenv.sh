#!/bin/bash

enable_turbo()
{
	echo 1 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo >/dev/null 2>&1
}

enable_ht()
{
	echo on | sudo tee /sys/devices/system/cpu/smt/control >/dev/null 2>&1
}

set_powersave_mode()
{
	for governor in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
		echo powersave | sudo tee $governor >/dev/null 2>&1
	done
}

kill_pmqos()
{
	sudo pkill 'pmqos'
}

enable_turbo
enable_ht
set_powersave_mode
kill_pmqos


