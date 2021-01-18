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

# BASEDIR=/data/docker-data/volumes/
LOGTIME=$(date)
echo "daily-alfresco-log-cleanup.sh has been started against $BASEDIR at ----> $LOGTIME" >> /var/log/daily-alfresco-log-cleanup.sh.log

BASEDIR=/data/docker-data/volumes/
# BASEDIR=/home/forrayz/development/public/linux-desktop/backup


ALFRESCO_FOLDERS=$(find $BASEDIR -type d -name alfresco-data)
FILE_PATTERN="*.log"

for ii in ${ALFRESCO_FOLDERS}
do

  if ls $ii/tomcat/logs/$FILE_PATTERN &>/dev/null 
     then
        echo "$FILE_PATTERN  files found"
        find  $ii/tomcat/logs/ -name $FILE_PATTERN -type f -mtime +2 -exec rm -f {} \;
        echo "$FILE_PATTERN found in alfresco-data---------------> $ $ii/tomcat/logs/"
     else
        echo "Not found."
  fi
    
done


echo "daily-logdelete.sh has been run against $BASEDIR at ----> $LOGTIME" >> /var/log/daily-logdelete.sh.log





