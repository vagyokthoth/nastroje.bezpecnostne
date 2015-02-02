#!/bin/bash
set -e
SCRIPT_DIR=$(dirname $(readlink -f $0))
SCRIPT_CONFIG="random"
source ${SCRIPT_DIR}/../config/color
source ${SCRIPT_DIR}/../config/${SCRIPT_CONFIG}
if [ `whoami` != "root" ]; then
    echo -ne "\nERROR: must run as root\n\n"
    exit 1
fi
echo -ne "\n${THOTHSEC_COLOR}"
if [ "$1" == "" ]; then
    ifconfig -s
    echo -ne "\n\niface: "
    read INPUT_IFACE
else
    INPUT_IFACE=$1
fi
echo -ne "\nrandomizing ${INPUT_IFACE}...\n"
ifconfig ${INPUT_IFACE} down
macchanger -b --another ${INPUT_IFACE}
ifconfig ${INPUT_IFACE} up
ifconfig -s
echo -ne "\e[0m\n";
