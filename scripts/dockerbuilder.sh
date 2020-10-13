#!/bin/sh

set -eux

docker build $(git rev-parse --show-toplevel) -t openwrt:$(git rev-parse HEAD)

docker run -it -v $(git rev-parse --show-toplevel):/home/builder/openwrt openwrt:$(git rev-parse HEAD)