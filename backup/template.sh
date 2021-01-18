#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset
echo "###################################################################"
echo "#     template.sh      BASH scipt                                 #"
echo "#     author: Zoltan forray                                       #"
echo "#     contributor:      Z                                         #"
echo "###################################################################"
echo "argument--1----------------------------------------------------->$1"
#trap "set +x; sleep 1; set -x" DEBUG