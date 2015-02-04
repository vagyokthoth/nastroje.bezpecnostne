#!/bin/bash
set -e
SCRIPT_DIR=$(dirname $(readlink -f $0))
SCRIPT_CONFIG="file"
source ${SCRIPT_DIR}/../../config/color
source ${SCRIPT_DIR}/../../config/${SCRIPT_CONFIG}
if [ "$1" == "" ]; then
  echo -ne "\n${THOTHSEC_COLOR}filename: "
  read INPUT_FILE
else
  INPUT_FILE=$1
fi
DIR_WORKING=`pwd`
INPUT_PATH=${DIR_WORKING}"/"${INPUT_FILE}
echo -ne "\n* * * * * * * *"
echo -ne "\n generating... "
echo -ne "\n\n pwd: "${DIR_WORKING}
echo -ne "\n* * * * * * * *\n"
PASS_FILE=`echo -n ${THOTHSEC_ENCRYPT_PREFIX}${INPUT_FILE}${THOTHSEC_ENCRYPT_SUFFIX}".aes-128-cbc" | md5sum | awk '{print $1}'`
echo ${INPUT_FILE}" -> "${INPUT_FILE}".aes-128-cbc"
openssl aes-128-cbc -pass pass:${PASS_FILE} < ${INPUT_PATH} > ${INPUT_PATH}".aes-128-cbc"
echo -ne "\e[0m\n";
