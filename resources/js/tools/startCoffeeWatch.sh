#!/bin/sh
APP_NAME="jobofferSourcing"
BASEDIR=$(cd $(dirname $0) && pwd)
coffee -cw --output $BASEDIR/../src/$APP_NAME $BASEDIR/../coffee/$APP_NAME
