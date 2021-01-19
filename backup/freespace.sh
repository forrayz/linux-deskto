#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset
echo  "##################################################################"
echo  "#     free-space.sh      BASH scipt                              #"
echo  "#     Author        : Zoltán Forray                              #"
echo  "#     version 1.0.0 :                                            #"
echo  "##################################################################"

THRESHOLD=$1


CURRENT=$(df /data | grep / | awk '{ print $5}' | sed 's/%//g')


if [ "$CURRENT" -gt "$THRESHOLD" ] ; then

echo "The following partition belongs to /data has reached $CURRENT % alert has been triggerd due to the treshold : $THRESHOLD has been reached " | mail -s "Free space Alert from fikszalt.alig.hu" forray.zoltan@ulyssys.hu

fi

CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')


if [ "$CURRENT" -gt "$THRESHOLD" ] ; then

echo "The following partition belongs to / (root) has reached $CURRENT % alert has been triggerd due to the treshold : $THRESHOLD has been reached " | mail -s "Free space Alert from fikszalt.alig.hu" forray.zoltan@ulyssys.hu

fi
