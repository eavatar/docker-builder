FROM ubuntu:14.04.1
MAINTAINER sampot <sam@eavatar.com>

ENV DEBIAN_FRONTEND noninteractive
RUN \
    apt-get update &&\
    apt-get install -y --force-yes \
    build-essential \
    curl \
    git \
    python \
    python-dev \
    python-pip \
    python-virtualenv \
    cython \
    wget \
    openssl &&\
    rm -rf /var/cache/apt/archives/*.deb &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /root/* &&\
    rm -rf /tmp/*

# the user in the builder for setting ownership.
RUN echo ava:x:1000:1000::/home/ava:/bin/bash >> etc/passwd &&\
    echo ava:x:1000: >> etc/group
