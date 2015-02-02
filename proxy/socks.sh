#!/bin/bash
set -e
SCRIPT_DIR=$(dirname $(readlink -f $0))
SCRIPT_CONFIG="proxy"
source ${SCRIPT_DIR}/../config/${SCRIPT_CONFIG}
ssh -D ${PORT_LOCAL} ${HOST_REMOTE} &
