#!/bin/bash

exec 2>&1
set -e
set -x

apt-get update

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
    openssl

cd /
rm -rf /var/cache/apt/archives/*.deb
rm -rf /var/lib/apt/lists/*
rm -rf /root/*
rm -rf /tmp/*

echo -e "\nInstalled versions:"
(
  git --version
  ruby -v
  gem -v
  python -V
) | sed -u "s/^/  /"

echo -e "\nSuccess!"
exit 0
