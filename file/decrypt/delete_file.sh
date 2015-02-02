#!/bin/bash
set -e
SCRIPT_DIR=$(dirname $(readlink -f $0))
SCRIPT_CONFIG="file"
source ${SCRIPT_DIR}/../config/color
source ${SCRIPT_DIR}/../config/${SCRIPT_CONFIG}
if [ "$1" == "" ]; then
  echo -ne "\n${THOTHSEC_COLOR}filename: "
  read INPUT_FILE
else
  INPUT_FILE=$1
fi
DIR_WORKING=`pwd`
INPUT_PATH=${DIR_WORKING}"/"${INPUT_FILE}
OUTPUT_FILE=`echo ${INPUT_FILE} | cut -d"." --complement -f3-`
OUTPUT_PATH=${DIR_WORKING}"/"${OUTPUT_FILE}
echo -ne "\n* * * * * * * *"
echo -ne "\n decrypting... "
echo -ne "\n\n pwd: "${DIR_WORKING}
echo -ne "\n out: "${OUTPUT_FILE}
echo -ne "\n* * * * * * * *\n"
PASS_FILE=`echo -n ${THOTHSEC_ENCRYPT_PREFIX}${INPUT_FILE}${THOTHSEC_ENCRYPT_SUFFIX} | md5sum | awk '{print $1}'`
openssl aes-128-cbc -d -pass pass:${PASS_FILE} < ${INPUT_PATH} > ${OUTPUT_PATH}
rm ${INPUT_PATH}
echo -ne "\e[0m\n";
