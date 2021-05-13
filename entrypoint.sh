#!/bin/sh -l

npm i minify@7.0.0 -g
apt-get update
apt-get -y install moreutils

find . -type f \( -iname \*.js -o -iname \*.css \) -not -path './public/js/Gantt/*' -and -not -path './public/js/SlickGrid/*'  | while read fname
    do
    minify ${fname} | sponge ${fname}
    done
