#!/bin/bash

ssh -p5556 root@localhost "ls > lsfile && exit"

ls
