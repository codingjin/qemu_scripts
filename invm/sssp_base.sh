#!/bin/bash
./env.sh

export OMP_NUM_THREADS=8
gapbs/sssp -f gapbs/benchmark/graphs/twitter.wsg -n64 -d2 >result 2>&1
