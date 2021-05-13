#!/bin/sh -l

npm i minify@7.0.0 -g
apt-get update
apt-get -y install moreutils

find . -type f \( -iname \*.js -o -iname \*.css \) -not \( -path './public/js/Gantt/*' -o -path './public/js/TreeGrid2/*' -o -path './public/js/GridE.js' -o -path '*.min.js' \)  | while read fname
    do
    minify ${fname} | sponge ${fname}
    done
