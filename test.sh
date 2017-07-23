#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

echo "Adding message"
hash=$(cf ssh ipfs -c 'export HOME=`pwd`/app; export PATH=$PATH:`pwd`/app; echo "I <3 IPFS -$(whoami) on $(date)" | ipfs add -q')
echo

echo "Reading from localhost via 'cf ssh'"
cf ssh ipfs -c "curl -s \"http://127.0.0.1:8080/ipfs/$hash\""
echo

echo "Reading from ipfs.io"
curl "https://ipfs.io/ipfs/$hash"
echo
