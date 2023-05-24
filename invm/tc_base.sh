#!/bin/bash
./env.sh

export OMP_NUM_THREADS=8
gapbs/tc -f gapbs/benchmark/graphs/twitterU.sg -n1 >result 2>&1
