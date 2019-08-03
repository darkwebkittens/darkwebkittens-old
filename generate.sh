#!/bin/sh

# Run ./generate.sh > cats.txt to generate the imgs var that can go in the background switching JS

echo "var urls = ["

for i in $(ls -1 ./images/cats); do echo "    '/images/cats/$i',"; done

echo "];"
