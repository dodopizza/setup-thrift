#!/bin/sh
set -eu

# command = $1

cmd="thrift $1"

echo "$cmd"

sh -c "$cmd"