#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset
echo "############################################################"
echo "#     daily-logdelete.sh      BASH scipt                   #"
echo "#     author: Zoltan forray                                #"
echo "#     contributor:      Z                                  #"
echo "###################################################################"
#trap "set +x; sleep 1; set -x" DEBUG

# BASEDIR=/data/docker-data/volumes/
BASEDIR=/home/forrayz/development/public/linux-desktop/backup

FILE_PATTERN="*.log"
SUBFOLDERS=$(find ${BASEDIR} -name $FILE_PATTERN -printf "%h\n" | sort -u)
for ii in ${SUBFOLDERS}
do
    jj=${ii:${#BASEDIR}} #strip off BASEDIR, jj is the relative path

            
    find  $BASEDIR/ -name $FILE_PATTERN -type f -mtime +1 -exec rm -f {} \;
    echo "$FILE_PATTERN found in ---------------> $BASEDIR$jj"  
    
done

FILE_PATTERN="*.gz"
SUBFOLDERS=$(find ${BASEDIR} -name $FILE_PATTERN -printf "%h\n" | sort -u)
for ii in ${SUBFOLDERS}
do
    jj=${ii:${#BASEDIR}} #strip off BASEDIR, jj is the relative path

            
    find  $BASEDIR/ -name $FILE_PATTERN -type f -mtime +1 -exec rm -f {} \;
    echo "$FILE_PATTERN found in ----------------> $BASEDIR$jj"  
    
done


FILE_PATTERN="access.txt"
SUBFOLDERS=$(find ${BASEDIR} -name $FILE_PATTERN -printf "%h\n" | sort -u)
for ii in ${SUBFOLDERS}
do
    jj=${ii:${#BASEDIR}} #strip off BASEDIR, jj is the relative path

            
    find  $BASEDIR/ -name $FILE_PATTERN -type f -mtime +1 -exec rm -f {} \;
    echo "$FILE_PATTERN found in ----------> $BASEDIR$jj"  
    
done


LOGTIME=$(date)
echo "daily-logdelete has been run at ----> $LOGTIME"




