#!/bin/bash

# Make sure to pipe the output of this script somewhere when running it, or it will dump everything directly into the terminal.

IPADDR=`curl -s https://check.torproject.org/exit-addresses | grep ExitAddress | awk '{print "\t" $2 " 1;"}'`

echo -e "geo \$torExit {
\tdefault 0;
$IPADDR
}"
