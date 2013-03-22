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

if [ ! -d "$TOOLSDIR" ]; then
	echo "Can't find Dojo build tools -- did you initialise submodules? (git submodule update --init --recursive)"
	exit 1
fi

if [ ! -d "$DISTDIR" ]; then
	mkdir $DISTDIR
fi

echo "compile coffee to javascript..."
coffee -c --output $SRCDIR $COFFEEDIR
echo "done!"


echo "Building application with $PROFILE to $DISTDIR."

if [ -d "$DISTDIR" ]; then
	echo -n "old file detected.... Clean up old files..."
	rm -r "$DISTDIR" 
	echo " Done"
fi
cd "$TOOLSDIR"

echo $SRCDIR
# use node.js
if which node >/dev/null ; then
    node $SRCDIR/dojo/dojo.js load=build --dojoConfig "$LOADERCONF" --profile "$PROFILE" --releaseDir "$DISTDIR" $@
    echo "done!"
else
	echo "Need node.js "
	exit 1
fi

if [ -d "$DISTDIR" ] && [ -n "$(find $DISTDIR -type f -name '*.uncompressed.js')" ]; then
    echo "delete .uncompressed files in the release folder..."
        cd $DISTDIR
    find . -type f -name '*.uncompressed.js' -print0 | xargs -0 rm -r
    echo "done!"
fi
cd "$BASEDIR"

echo "remove dojo local files in the release folder"
if [ -d "$DISTDIR/dojo" ]; then
	rm -r ../../release/dojo/
	rm -r ../../release/dijit/
	rm -r ../../release/dojox/
fi
echo "complete !!"
