#!/bin/bash
set -u

# This script is for downloading and formatting the list of current Tor Exits
# so we can feed it to Nginx and redirect our user to our .onion domain if they
# arrive via a Tor exit.
#
# See: https://github.com/ajhaydock/CreativeCommonsCatPictures/wiki/Auto-Onion-Redirect

# Download (and verify!) list of Tor exits
curl -s --ssl-reqd https://check.torproject.org/exit-addresses -o /etc/nginx/tor-exits-raw
if [ ! -f "/etc/nginx/tor-exits-raw" ]; then echo "Tor exit list could not be downloaded. Exiting!" && exit 10; fi

# Format the IP list properly and remove dupes
TOREXITLIST=$(grep "ExitAddress" /etc/nginx/tor-exits-raw | awk '{print "\t" $2 " 1;"}' | sort | uniq)

# Pipe exit list into nginx-compatible conf file
echo -e "geo \$torExit {
\tdefault 0;
$TOREXITLIST
}" > /etc/nginx/torexits.conf

# Load php-fpm and nginx (-D daemonizes PHP)
php-fpm -D && nginx -g "daemon off;"
