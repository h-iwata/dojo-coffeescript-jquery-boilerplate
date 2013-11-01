#!/usr/bin/env bash

set -e

# Base directory for this entire project
BASEDIR=$(cd $(dirname $0) && pwd)

# Main application package build configuration
PROFILE="$BASEDIR/profile.js"

# Destination directory for built code
DISTDIR="$BASEDIR/../../release"

# Source directory for unbuilt code
SRCDIR="$BASEDIR/../../src"

# CoffeeScript directory for develop
COFFEEDIR="$BASEDIR/../../coffee"

# Main application package loader configuration
LOADERCONF="$BASEDIR/config.js"

# Directory containing dojo build utilities
TOOLSDIR="$SRCDIR/util/buildscripts"

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

if [ ! -d "$DISTDIR" ]; then
	mkdir $DISTDIR
fi

echo "compile coffee to javascript..."
coffee -c --output $SRCDIR $COFFEEDIR
echo "done!"

if [ -d "$DISTDIR" ]; then
	echo -n "old file detected.... Clean up old files..."
	rm -r "$DISTDIR" 
	echo "done"
fi

cd "$TOOLSDIR"
echo "Building application with $SRCDIR to $DISTDIR..."

# use node.js
if which node >/dev/null ; then
    node $SRCDIR/dojo/dojo.js load=build --dojoConfig "$LOADERCONF" --profile "$PROFILE" --releaseDir "$DISTDIR" $@
    echo "done!"
    #if you got some error but need continue , comment out file util/build/main:line 186 as follows
    # //bc.exitCode = 1;
    
else
	echo "Need node.js "
	exit 1
fi

echo "remove dojo local resources in the release folder"
if [ -d "$DISTDIR/dojo" ]; then
    rm -r "$DISTDIR/dojo"
fi

if [ -d "$DISTDIR/dijit" ]; then
    rm -r "$DISTDIR/dijit"
fi

if [ -d "$DISTDIR/dojox" ]; then
    rm -r "$DISTDIR/dojox"
fi

if [ -d "$DISTDIR/doh" ]; then
    rm -r "$DISTDIR/doh"
fi

if [ -d "$DISTDIR/doh" ]; then
	rm -r "$DISTDIR/doh"
fi

if [ -d "$DISTDIR" ] && [ -n "$(find $DISTDIR -type f -name '*.uncompressed.js')" ]; then
    echo "delete .uncompressed files in the release folder..."
        cd $DISTDIR
    find . -type f -name '*.uncompressed.js' -print0 | xargs -0 rm -r
    echo "done!"
fi
cd "$BASEDIR"

echo 'set release mode to config.js'
perl -pwi'.bak' -e "s/var debug = true;/var debug = false;/g" "$BASEDIR/../../config.js"
echo 'done!'

echo "complete !!"








