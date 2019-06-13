#!/usr/bin/env bash

export DEBUG_LEVEL=DEBUG

# run default entrypoint
/entrypoint.sh &> /tmp/stdout.log

sleep 10
