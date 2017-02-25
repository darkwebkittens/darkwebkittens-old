#!/bin/sh

test -f /etc/tor/torrc && tor -f /etc/tor/torrc
test -f /etc/nginx/nginx.conf && nginx -c /etc/nginx/nginx.conf

# Since everything above succeeds, Docker will happily exit now so we need to
# tell the script to sleep forever.
sleep infinity
