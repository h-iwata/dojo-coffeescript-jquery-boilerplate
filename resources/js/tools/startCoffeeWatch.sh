#!/bin/sh
APP_NAME="App"
BASEDIR=$(cd $(dirname $0) && pwd)
coffee -cw --output $BASEDIR/../src/$APP_NAME $BASEDIR/../coffee/$APP_NAME
