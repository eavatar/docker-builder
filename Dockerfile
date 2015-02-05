FROM ubuntu:14.04.1
MAINTAINER sampot <sam@eavatar.com>

ENV DEBIAN_FRONTEND noninteractive
RUN \
    apt-get update &&\
    apt-get install -y --force-yes \
    build-essential \
    curl \
    cython \
    git \
    python \
    python-dev \
    python-pip \
    python-virtualenv \
    libzmq3-dev \
    libevent1-dev \
    wget \
    openssl &&\
    rm -rf /var/cache/apt/archives/*.deb &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /root/* &&\
    rm -rf /tmp/*

RUN \
    wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.2.tar.gz &&\
    tar zxvf libsodium-1.0.2.tar.gz &&\
    cd libsodium-1.0.2 &&\
    ./configure &&\
    make &&\
    make install &&\
    cd .. &&\
    rm -rf libsodium-1.0.2.tar.gz &&\
    rm -rf libsodium-1.0.2

# the user in the builder for setting ownership.
RUN echo ava:x:1000:1000::/home/ava:/bin/bash >> etc/passwd &&\
    echo ava:x:1000: >> etc/group
