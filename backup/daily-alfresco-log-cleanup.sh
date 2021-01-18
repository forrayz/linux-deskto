#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset
echo "############################################################"
echo "#     daily-alfresco-log-cleanup.sh      BASH scipt        #"
echo "#     author: Zoltan forray                                #"
echo "#     contributor:      Z                                  #"
echo "############################################################"
#trap "set +x; sleep 1; set -x" DEBUG
BASEDIR=/data/docker-data/volumes/

LOGTIME=$(date)
echo "daily-alfresco-log-cleanup.sh has been started against $BASEDIR at ----> $LOGTIME" >> /var/log/daily-alfresco-log-cleanup.sh.log

# BASEDIR=/home/forrayz/development/public/linux-desktop/backup


ALFRESCO_FOLDERS=$(find $BASEDIR -type d -name alfresco-data)
FILE_PATTERN1="*.log"
FILE_PATTERN2="*.gz"
FILE_PATTERN3="*.txt"

for ii in ${ALFRESCO_FOLDERS}
do
        find  $ii/tomcat/logs/ -name $FILE_PATTERN1 -type f -mtime +2 -exec rm -f {} \;
        find  $ii/tomcat/logs/ -name $FILE_PATTERN2 -type f -mtime +2 -exec rm -f {} \;
        find  $ii/tomcat/logs/ -name $FILE_PATTERN3 -type f -mtime +2 -exec rm -f {} \;
        echo "possible logfolder alfresco-data for pattern $FILE_PATTERN1,  $FILE_PATTERN2,  $FILE_PATTERN3 ---------------> $ $ii/tomcat/logs/"
    
done
echo "daily-logdelete.sh has been run against $BASEDIR at ----> $LOGTIME" >> /var/log/daily-logdelete.sh.log
