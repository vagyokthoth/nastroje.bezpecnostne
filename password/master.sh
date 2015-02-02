#!/bin/bash
set -e
SCRIPT_DIR=$(dirname $(readlink -f $0))
for iter in `seq 1 3`; do
        echo -n `shuf "${SCRIPT_DIR}/.secrets" -n1`
done;
