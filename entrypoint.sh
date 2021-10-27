#!/bin/bash -l
set -eu

# command = $1

cmd="$1"

echo "$cmd"

sh -c "$cmd"