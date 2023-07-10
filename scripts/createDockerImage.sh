#!/bin/bash

imageName="$1"
dockerfilePath="$2"

cd "$dockerfilePath"
docker build --no-cache -f Dockerfile -t $imageName .
