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

curr_dir=$(pwd)

# sudo apt-get update \
#     && sudo apt-get install -y --no-install-recommends $buildDeps \
#     && curl -k -sSL "https://github.com/apache/thrift/archive/$1.tar.gz" -o thrift.tar.gz \
#     && mkdir -p ./thrift \
#     && tar zxf thrift.tar.gz -C ./thrift --strip-components=1 \
#     && cd ./thrift \
#     && ./bootstrap.sh \
#     && ./configure --disable-libs \
#     && make \
#     && mkdir -p $curr_dir/dist \
#     && make DESTDIR=$curr_dir/dist install \
#     && cd $curr_dir/dist \
#     && tar -czvf thrift.$1.tar.gz ./usr/local/bin/thrift

mkdir -p $curr_dir/dist \
    && cd $curr_dir/dist \
    && mkdir -p ./usr/local/bin/ \
    && touch ./usr/local/bin/thrift \
    && tar -czvf thrift.$1.tar.gz ./usr/local/bin/thrift \
    && ls -lsR .
