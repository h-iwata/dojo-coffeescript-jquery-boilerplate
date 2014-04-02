#!/bin/sh

BASEDIR=$(cd $(dirname $0) && pwd)

# Source directory for unbuilt code
SRCDIR="$BASEDIR/../src"

echo 'set debug mode to config.js'
perl -pwi'.bak' -e "s/var debug = false;/var debug = true;/g" "$BASEDIR/../config.js"
echo 'done!'

if [ -f "$BASEDIR/../coffee/App/package.json" ]; then
  echo "Copy package.json to src folder"
  cp $BASEDIR/../coffee/App/package.json $SRCDIR/App/package.json
fi

if [ ! -d "$SRCDIR/dojo" ]; then
    echo "Can not find dojo resources in 'src/dojo'..."
    git clone https://github.com/dojo/dojo "$SRCDIR/dojo"
fi

if [ ! -d "$SRCDIR/dijit" ]; then
    echo "Can not find dijit resources in 'src/dijit'..."
    git clone https://github.com/dojo/dijit "$SRCDIR/dijit"
fi

if [ ! -d "$SRCDIR/dojox" ]; then
    echo "Can not find dojox resources in 'src/dojox'..."
    git clone https://github.com/dojo/dojox "$SRCDIR/dojox"
fi

if [ ! -d "$SRCDIR/util" ]; then
    echo "Can not find util resources in 'src/util'..."
    git clone https://github.com/dojo/util "$SRCDIR/util"
fi

coffee -cw --output $BASEDIR/../src $BASEDIR/../coffee
