#!/bin/ksh
set -e

# Download exit list (curl example included if you want to use that, but I
# prefer ftp since it's in base, and that's one fewer package to install).
ftp -S do -o /root/tor-exits-raw https://check.torproject.org/exit-addresses
#curl -sL --ssl-reqd -o /root/tor-exits-raw https://check.torproject.org/exit-addresses

# Format for pf
grep "ExitAddress" /root/tor-exits-raw | awk '{print $2"/32"}' | sort | uniq > /etc/torexits

# Reload pf Rules
pfctl -f /etc/pf.conf

# Finish
echo "Tor exit list downloaded and updated."
