#!/bin/bash

# test script for vault docker

export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

set -xe

docker run --rm -it --env-file user_env.sh hashicorp-vault "$@"

