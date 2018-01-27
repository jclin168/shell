#!/bin/sh

# A shell script for embedded linux router to update no-ip DDNS service
#
# 1. mkdir -p ~/noip
# 2. touch ~/noip/ip.last
# 3. save the script to ~/noip/noip & chmod 700
# 4. change USER,PASS,HOST to your own setting
# 5. add crontab job
# 0 */8 * * * ~/noip/noip

USER="user"
PASS="pass"
HOST="yours.noip.me"

cd ~/noip && rm -f ip && wget -q ipinfo.io/ip && (cmp -s ip ip.last || (mv ip ip.last && wget -q -O- "${USER}:${PASS}@dynupdate.no-ip.com/nic/update?hostname=${HOST}&myip=`cat ip.last`")) >& /dev/null

