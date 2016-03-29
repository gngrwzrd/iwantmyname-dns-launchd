#!/bin/bash
USER=$1
PASS=$2
DOMAINS=$3
LOGFILE=~/Library/Logs/iwantmyname-dns.log

touch $LOGFILE

IPADDRESS=`curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'`
IPADDRESS=$(echo -n "${IPADDRESS//[[:space:]]/}")

curl -u "$USER:$PASS" "https://iwantmyname.com/basicauth/ddns?hostname=$DOMAINS&myip=$IPADDRESS" >> $LOGFILE
echo "" >> $LOGFILE
