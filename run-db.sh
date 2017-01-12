#!/usr/bin/env bash


if [[ ! -d /indexed ]]; then
    echo "/indexed does not exist. Making directory..."
    mkdir /indexed
fi

cd /indexed

if [[ ! -e /indexed/finished.txt ]]; then
    wget $INDEX_URL
    tar -xzvf indexed.tar.gz
    mv /indexed/indexed/* /indexed
    touch /indexed/finished.txt
fi

# export JVM_ARGS=-Xmx4000M

cd /jena-fuseki
./fuseki-server --port=3030 --loc /indexed /custom
