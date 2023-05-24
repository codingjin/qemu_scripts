#!/bin/bash

echo 15 > /proc/sys/vm/zone_reclaim_mode
echo 2 > /proc/sys/kernel/numa_balancing
echo 1 > /sys/kernel/mm/numa/demotion_enabled
echo 200 > /proc/sys/vm/demote_scale_factor

./env.sh

export OMP_NUM_THREADS=4
gapbs/cc -f gapbs/benchmark/graphs/twitter.sg -n80 >result 2>&1
