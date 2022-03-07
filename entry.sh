#!/bin/bash

# bastion entrypoint

set -x

exec vault $@
