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

sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends $buildDeps \
    && curl -k -sSL "https://github.com/apache/thrift/archive/$1.tar.gz" -o thrift.tar.gz \
    && mkdir -p ./thrift \
    && tar zxf thrift.tar.gz -C ./thrift --strip-components=1 \
    && cd ./thrift \
    && ./bootstrap.sh \
    && ./configure --disable-libs \
    && make \
    && mkdir -p ./dist \
    && make DESTDIR=./dist install \
    && ls -laR ./dist

   # && make \
    # && make install \
    # && cd / \
    # && rm -rf /usr/src/thrift \
    # && sudo apt-get purge -y --auto-remove $buildDeps \
    # && rm -rf /var/cache/apt/* \
    # && rm -rf /var/lib/apt/lists/* \
    # && rm -rf /tmp/* \
    # && rm -rf /var/tmp/*