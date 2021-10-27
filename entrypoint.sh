#!/bin/sh
set -eu

# args = $1

cmd="thrift $@"

echo "$cmd"

sh -c "$cmd"