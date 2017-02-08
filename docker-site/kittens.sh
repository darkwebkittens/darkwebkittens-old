#!/bin/bash

# Download list of Tor exits
TOREXITLIST=`curl -s https://check.torproject.org/exit-addresses | grep ExitAddress | awk '{print "\t" $2 " 1;"}'`

# Pipe exit list into nginx-compatible conf file
echo -e "geo \$torExit {
\tdefault 0;
$TOREXITLIST
}" > /etc/nginx/torexits.conf

# Only load PHP/nginx if the Tor exit file has been properly generated
if [ -f "/etc/nginx/torexits.conf" ]; then
	php-fpm && nginx -g "daemon off;"
else
	echo "Tor exit list was not downloaded!"
	echo "Exiting."
	exit 10
fi
