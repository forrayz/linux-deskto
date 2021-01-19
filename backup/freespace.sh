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


CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')


if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
    mail -s 'Disk Space Alert' forray.zoltan@ulyssys.hu<< EOF
Your root partition remaining free space is critically low. Used: $CURRENT%
EOF
echo "we have $CURRENT space used  on root filesystem this is less than than $THRESHOLD "

fi

CURRENT=$(df / | grep /data | awk '{ print $5}' | sed 's/%//g')


if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
     mail -s 'Disk Space Alert' forray.zoltan@ulyssys.hu << EOF
 Your root partition remaining free space is critically low. Used: $CURRENT%
EOF
echo "we have $CURRENT space used  on root filesystem this is less than than $THRESHOLD "
fi
