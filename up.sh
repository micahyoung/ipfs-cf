#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

if ! [ -d ipfs-bin ]; then
  mkdir ipfs-bin
  pushd ipfs-bin
    curl -L https://dist.ipfs.io/go-ipfs/v0.4.10/go-ipfs_v0.4.10_linux-amd64.tar.gz > go-ipfs.tar.gz
    tar xf go-ipfs.tar.gz
    rm go-ipfs.tar.gz
  popd
fi

rm -rf pcf-root
mkdir pcf-root
cp ipfs-bin/go-ipfs/ipfs pcf-root/

cf delete ipfs -f
cf push ipfs     -f manifest.yml     -p pcf-root/
