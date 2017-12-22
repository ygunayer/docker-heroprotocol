#!/bin/bash

if [ -z"$VERSION" ]
    echo "No version specified"
    exit -1
fi

docker build -t ygunayer/heroprotocol:latest .
