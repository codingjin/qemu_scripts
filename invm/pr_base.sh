#!/bin/bash

./env.sh

export OMP_NUM_THREADS=8
gapbs/pr -f gapbs/benchmark/graphs/twitter.sg -i1000 -t1e-4 -n8 >result 2>&1
