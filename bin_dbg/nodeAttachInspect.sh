#!/bin/bash
node -e "process._debugProcess($1)"

# kill -SIGUSR1 $1
