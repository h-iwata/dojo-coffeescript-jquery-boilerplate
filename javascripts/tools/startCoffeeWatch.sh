#!/bin/sh

BASEDIR=$(cd $(dirname $0) && pwd)

# Source directory for unbuilt code
SRCDIR="$BASEDIR/../src"

$BASEDIR/prepareCoffee.sh

coffee -cw --output $BASEDIR/../src $BASEDIR/../coffee
