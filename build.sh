#!/bin/sh
set -eu

buildDeps=" \
    automake \
    bison \
    curl \
    flex \
    g++ \
    libboost-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-test-dev \
    libevent-dev \
    libssl-dev \
    libtool \
    make \
    pkg-config \
";

root_dir=$(pwd)

sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends $buildDeps \
    && curl -k -sSL "https://github.com/apache/thrift/archive/$1.tar.gz" -o thrift.$1.tar.gz \
    && mkdir -p $root_dir/src/$1/ \
    && tar zxf thrift.$1.tar.gz -C $root_dir/src/$1 --strip-components=1 \
    && cd $root_dir/src/$1 \
    && ./bootstrap.sh \
    && ./configure --disable-libs \
    && make \
    && mkdir -p $root_dir/dist/$1 \
    && make DESTDIR=$root_dir/dist/$1 install \
    && cd $root_dir/dist/$1 \
    && tar -czvf thrift.$1.tar.gz -C ./usr/local/bin thrift
