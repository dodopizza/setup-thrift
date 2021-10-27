#!/bin/sh
set -eu

# args = $1

cmd="$1"

echo "thrift $cmd"

sh -c "thrift $cmd"