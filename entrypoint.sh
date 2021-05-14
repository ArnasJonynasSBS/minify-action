#!/bin/sh -l

npm i minify@7.0.0 -g
apt-get update
apt-get -y install moreutils

find . -type f \( -iname \*.js -o -iname \*.css \) \( -path './public/skin/gentella/js/custom.js' \) | while read fname
    do
    minify ${fname} | sponge ${fname}
    done
