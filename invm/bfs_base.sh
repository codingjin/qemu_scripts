#!/bin/bash

./env.sh

export OMP_NUM_THREADS=4
gapbs/bfs -f gapbs/benchmark/graphs/twitter.sg -n256 >result 2>&1
