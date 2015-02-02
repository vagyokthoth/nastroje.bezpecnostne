#!/bin/bash
set -e
SCRIPT_DIR=$(dirname $(readlink -f $0))
SCRIPT_CONFIG="install"
source ${SCRIPT_DIR}/../config/color
source ${SCRIPT_DIR}/../config/${SCRIPT_CONFIG}
echo -ne "${THOTHSEC_COLOR}"
#
# because it is better to use security easily
#
# this will create for you some symlinks and add
#  thothsec_ to your shell PATH variable
#
PARENT_DIR=${SCRIPT_DIR}"/../"
BIN_DIR=${PARENT_DIR}"bin/"
rm -rf ${BIN_DIR}
echo -ne "\n/bin/thothsec_*"
mkdir ${BIN_DIR}
ln -s ${PARENT_DIR}file/decrypt/delete_file.sh ${BIN_DIR}thothsec_decrypt_file_delete
ln -s ${PARENT_DIR}file/decrypt/file.sh ${BIN_DIR}thothsec_decrypt_file
ln -s ${PARENT_DIR}file/encrypt/dir.sh ${BIN_DIR}thothsec_encrypt_dir
ln -s ${PARENT_DIR}file/encrypt/file.sh ${BIN_DIR}thothsec_encrypt_file
ln -s ${PARENT_DIR}file/encrypt/file_delete.sh ${BIN_DIR}thothsec_encrypt_file_delete
ln -s ${PARENT_DIR}password/host.sh ${BIN_DIR}thothsec_passwd_host
ln -s ${PARENT_DIR}password/user.sh ${BIN_DIR}thothsec_passwd_user
ln -s ${PARENT_DIR}proxy/socks.sh ${BIN_DIR}thothsec_proxy_socks
ln -s ${PARENT_DIR}random/mac.sh ${BIN_DIR}thothsec_random_mac
echo -ne "\n\n# thothsec: add security tools to path\nPATH=\"${BIN_DIR}:${PATH}\"\n\n" >> ~/.profile
echo " [done]"
#
# santayana has said:
#
# those who cannot remember history are doomed to repeat it
#  ... but if history is all greatest hits, i see no problem
#
echo -ne "\n~/.bash_history -> /dev/null"
rm ~/.bash_history && ln -s /dev/null ~/.bash_history
echo " [done]"
echo -ne "\e[0m\n";
