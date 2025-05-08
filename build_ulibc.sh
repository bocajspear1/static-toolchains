#!/bin/bash

set -e

BUILD_ARCH=$1
CPU_COUNT="$(($(nproc --all)-1))"

mkdir -p ./output
docker buildx build -f Dockerfile.ulibc --build-arg BUILD_ARCH=${BUILD_ARCH} --target artifact --output type=local,dest=. .
