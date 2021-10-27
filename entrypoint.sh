#!/bin/sh
set -eu

# command = $1

cmd="thrift $@"

echo "$cmd"

sh -c "$cmd"