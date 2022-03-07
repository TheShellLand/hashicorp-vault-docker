#!/bin/bash

# build script for phantom bastion

export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

set -xe

docker build -t hashicorp-vault .

docker images | grep hashicorp-vault
