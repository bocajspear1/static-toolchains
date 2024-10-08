#!/bin/bash

set -e

BUILD_ARCH=$1
CPU_COUNT="$(($(nproc --all)-1))"

mkdir -p ./output
docker buildx build --build-arg BUILD_ARCH=${BUILD_ARCH} --build-arg CPU_COUNT=${CPU_COUNT} --target artifact --output type=local,dest=. .
