#!/bin/sh
BASEDIR=$(cd $(dirname $0) && pwd)
coffee -cw --output $BASEDIR/../src $BASEDIR/../coffee
