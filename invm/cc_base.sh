#!/bin/bash
./env.sh

export OMP_NUM_THREADS=4
gapbs/cc -f gapbs/benchmark/graphs/twitter.sg -n80 >result 2>&1
