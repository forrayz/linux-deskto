#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset
echo "###################################################################"
echo "#     catalina.out.logrotate.sh      BASH scipt                   #"
echo "#     author: Zoltan forray                                       #"
echo "#     contributor:      Z                                         #"
echo "###################################################################"
#trap "set +x; sleep 1; set -x" DEBUG

# BASEDIR=/data/docker-data/volumes/
BASEDIR=/home/forrayz/development/ulyssys/misc/
#destdir=${BASEDIR} # if you want rotated files in the same directories
# CONFIG_FILE=/etc/logrotate.d/catalina.out.files.conf
CONFIG_FILE=/home/forrayz/development/ulyssys/misc/catalina.out.files.conf

> ${CONFIG_FILE} #clear existing CONFIG_FILE contents

SUBFOLDERS=$(find ${BASEDIR} -name 'catalina.out' -printf "%h\n" | sort -u)

for ii in ${SUBFOLDERS}
do
    jj=${ii:${#BASEDIR}} #strip off BASEDIR, jj is the relative path

    #append new entry to CONFIG_FILE
    echo -e "${BASEDIR}${jj}/catalina.out {
    copytruncate
  	daily
  	rotate 5
  	missingok
  	dateext
  	size 10M
    } \n" >> ${CONFIG_FILE}
   
    
done