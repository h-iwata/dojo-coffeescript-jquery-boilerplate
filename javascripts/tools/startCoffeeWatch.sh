#!/bin/sh
BASEDIR=$(cd $(dirname $0) && pwd)
echo 'set debug mode to config.js'
perl -pwi -e "s/var debug = false;/var debug = true;/g" "$BASEDIR/../config.js"
echo 'done!'
coffee -cw --output $BASEDIR/../src $BASEDIR/../coffee
