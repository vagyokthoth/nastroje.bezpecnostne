#!/bin/bash
set -e
SCRIPT_DIR=$(dirname $(readlink -f $0))
SCRIPT_CONFIG="password"
source ${SCRIPT_DIR}/../config/color
source ${SCRIPT_DIR}/../config/${SCRIPT_CONFIG}
if [ "$1" == "" ]; then
    echo -ne "\n${THOTHSEC_COLOR}username: "
    read INPUT_USER
    echo -ne "\ndomain: "
    read INPUT_DOMAIN
    INPUT_STRING=${INPUT_USER}"@"${INPUT_DOMAIN}
else
    INPUT_STRING=$1
fi
INPUT_PASSWD=`${SCRIPT_DIR}/user.sh $INPUT_STRING`
echo -n $INPUT_PASSWD | xsel -b
echo -ne "\n* * * * * * *\n";
${SCRIPT_DIR}/master.sh
echo -ne "\n* * * * * * *\e[0m\n";
