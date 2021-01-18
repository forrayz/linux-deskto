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
BASEDIR=/home/forrayz/development/public/linux-desktop/backup
LOGTIME=$(date)
# echo "daily-alfresco-log-cleanup.sh has been started against $BASEDIR at ----> $LOGTIME" >> /var/log/daily-alfresco-log-cleanup.sh.log

ALFRESCO_FOLDERS=$(find $BASEDIR -type d -name alfresco-data)
FILE_PATTERN="*.log"
# SUBFOLDERS=$(find ${BASEDIR} -name $FILE_PATTERN -not -path "*/commitlog/*" -not -path "*/journal/*" -printf "%h\n" | sort -u)
for ii in ${ALFRESCO_FOLDERS}
do
                
    find  $ALFRESCO_FOLDERS/tomcat/logs/ -name $FILE_PATTERN -type f -mtime +2 -exec rm -f {} \;
    echo "$FILE_PATTERN found in alfresco-data---------------> $ $ii/tomcat/logs/"  
    
done

ALFRESCO_FOLDERS=$(find $BASEDIR -type d -name alfresco-community)

FILE_PATTERN="*.log"
# # SUBFOLDERS=$(find ${BASEDIR} -name $FILE_PATTERN -not -path "*/commitlog/*" -not -path "*/journal/*" -printf "%h\n" | sort -u)
for ii in ${ALFRESCO_FOLDERS}
do
                
    find  $ALFRESCO_FOLDERS/tomcat/logs/ -name $FILE_PATTERN -type f -mtime +2 -exec rm -f {} \;
    echo "$FILE_PATTERN found in  alfresco-data---------------> $ii/tomcat/logs/"  
    
done

echo "daily-logdelete.sh has been run against $BASEDIR at ----> $LOGTIME" >> /var/log/daily-logdelete.sh.log
