#!/bin/bash
./env.sh

export OMP_NUM_THREADS=8
gapbs/bc -f gapbs/benchmark/graphs/twitter.sg -i4 -n8 >result 2>&1
