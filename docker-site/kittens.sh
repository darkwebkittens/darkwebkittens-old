#!/bin/bash

# Download (and verify!) list of Tor exits
curl -s --ssl-reqd https://check.torproject.org/exit-addresses -o /etc/nginx/tor-exits-raw
if [ ! -f "/etc/nginx/tor-exits-raw" ]; then echo "Tor exit list could not be downloaded. Exiting!" && exit 10; fi

# Format the IP list properly
TOREXITLIST=$(grep "ExitAddress" /etc/nginx/tor-exits-raw | awk '{print "\t" $2 " 1;"}')

# Pipe exit list into nginx-compatible conf file
echo -e "geo \$torExit {
\tdefault 0;
$TOREXITLIST
}" > /etc/nginx/torexits.conf

# Load php-fpm and nginx
php-fpm && nginx -g "daemon off;"
