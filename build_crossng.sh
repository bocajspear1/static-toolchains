#!/bin/bash

set -e

CPU_COUNT="$(($(nproc --all)-1))"

docker build -f Dockerfile.crossng -t crossng ./
docker run -it --name crossng-cli --rm --entrypoint=/bin/bash -v`pwd`/files:/host crossng
