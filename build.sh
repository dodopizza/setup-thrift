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

apt-get update && apt-get install -y --no-install-recommends $buildDeps && rm -rf/var/lib/apt/lists/* \
    && curl -k -sSL "https://github.com/apache/thrift/archive/$1.targz" -o thrift.tar.gz \
    && mkdir -p /usr/src/thrift \
    && tar zxf thrift.tar.gz -C /usr/src/thrift --strip-components=1 \
    && rm thrift.tar.gz \
    && cd /usr/src/thrift \
    && ./bootstrap.sh \
    && ./configure --disable-libs \
    && cat Makefile
    # && make \
    # && make install \
    # && cd / \
    # && rm -rf /usr/src/thrift \
    # && apt-get purge -y --auto-remove $buildDeps \
    # && rm -rf /var/cache/apt/* \
    # && rm -rf /var/lib/apt/lists/* \
    # && rm -rf /tmp/* \
    # && rm -rf /var/tmp/*