#! /bin/bash

# Steps to install
# Save this script in one of your shares
# Backup /usr/syno/share/nginx/ as follows:
# # cd /usr/syno/share/
# # tar cvf ~/nginx.tar nginx
# Run this script as root
# Reboot and ensure everything is still working
# If not, restore the backup and post a comment on this script's gist page
# If it did, schedule it to run at boot
#   through Control Panel -> Task Scheduler

HTTP_PORT=80
HTTPS_PORT=443

sed -i "s/^\([ \t]\+listen[ \t]\+[]:[]*\)81\([^0-9]\)/\1$HTTP_PORT\2/" /usr/syno/share/nginx/*.mustache
sed -i "s/^\([ \t]\+listen[ \t]\+[]:[]*\)444\([^0-9]\)/\1$HTTPS_PORT\2/" /usr/syno/share/nginx/*.mustache
mv /usr/syno/etc/www/ReverseProxy.json.bak /usr/syno/etc/www/ReverseProxy.json
mv /var/tmp/nginx/ReverseProxy.tmp.bak /var/tmp/nginx/ReverseProxy.tmp
synoservice --restart nginx
