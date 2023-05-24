#!/bin/bash

echo 15 > /proc/sys/vm/zone_reclaim_mode
echo 2 > /proc/sys/kernel/numa_balancing
echo 1 > /sys/kernel/mm/numa/demotion_enabled
echo 200 > /proc/sys/vm/demote_scale_factor

./env.sh

export OMP_NUM_THREADS=8
gapbs/pr -f gapbs/benchmark/graphs/twitter.sg -i1000 -t1e-4 -n3 >result 2>&1
