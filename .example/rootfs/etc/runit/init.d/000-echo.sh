#!/usr/bin/env bash

# set -e : Exit the script if any statement returns a non-true return value.
# set -u : Exit the script when using uninitialised variable.
set -eu

# Add libraries
source /usr/local/lib/bash-logger.sh
source /usr/local/lib/persist-env.sh

#
NOTICE " *** This is a simple echo from /etc/runit/init.d"
