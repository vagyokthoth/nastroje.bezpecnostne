#!/bin/bash
set -e
SCRIPT_DIR=$(dirname $(readlink -f $0))
SCRIPT_CONFIG="password"
source ${SCRIPT_DIR}/../config/color
source ${SCRIPT_DIR}/../config/${SCRIPT_CONFIG}
FLAG_INTERACTIVE=
if [ "$1" == "" ]; then
    FLAG_INTERACTIVE=1
    echo -ne "\n${THOTHSEC_COLOR}username: "
    read INPUT_USER
else
	INPUT_USER=$1
fi
INPUT_PWD=`echo -n ${THOTHSEC_PASSWD_PREFIX}${INPUT_USER}${THOTHSEC_PASSWD_SUFFIX} | md5sum | awk '{printf $1}'`
if [ "$1" != "" ]; then
    echo -n ${INPUT_PWD}
    exit 0
fi
xsel -b --delete
echo -n ${INPUT_PWD} | xsel -bi
echo -ne "\n* * * * * * *\n";
${SCRIPT_DIR}/master.sh
echo -ne "\n* * * * * * *";
echo -ne "\e[0m\n";
