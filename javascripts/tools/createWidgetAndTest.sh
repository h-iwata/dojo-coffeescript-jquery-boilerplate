#!/bin/bash
#
# @(#) createWidgetAndTest.sh ver.1.0.0 2013.11.15
#
# Usage:
#   ./tools/createWidgetAndTest.sh [PathFromView/]WidgetName [PackageName]
#     widgetName - new widget name.
#     packageName - the  name  of the package the widget belongs to .
#
# Description:
#   create new Widget and Test right way.
# Author:
#   h-iwata
#
###########################################################################

set -e

# Base directory for this tool
BASEDIR=$(cd $(dirname $0) && pwd)
# CoffeeScript directory for develop
COFFEEDIR="$BASEDIR/../coffee"
#default package name
PACKAGE_NAME="App"

if [ $# -eq 0 ]; then
  echo "usage: createWidgetAndTest.sh [PathFromView/]WidgetName [PackageName]"
  echo "example: createWidgetAndTest.sh Corporation/Index/MyButton MyApp"
  exit 1
fi

if [ $# -gt 2 ]; then
    echo "too many arguments"
  exit 1
fi

WIDGET_NAME=$1
if [ $# -eq 2 ]; then
    PACKAGE_NAME=$2
fi

mkdir -p "${COFFEEDIR}/${PACKAGE_NAME}/Views"
mkdir -p "${COFFEEDIR}/${PACKAGE_NAME}/tests/Views"

if echo $WIDGET_NAME | grep "/" > /dev/null; then
    WIDGET_DIR=`echo $WIDGET_NAME | sed -e "s@\(^[a-zA-Z_0-9\/]\+\)/[a-zA-Z_0-9]\+@\1@g"`
    mkdir -p "${COFFEEDIR}/${PACKAGE_NAME}/Views/${WIDGET_DIR}"
    mkdir -p "${COFFEEDIR}/${PACKAGE_NAME}/tests/Views/${WIDGET_DIR}"
fi
cat $BASEDIR/templates/Widget.coffee | sed -e "s@#{PackageName}@$PACKAGE_NAME@g" | sed -e "s@#{WidgetName}@$WIDGET_NAME@g" > ${COFFEEDIR}/${PACKAGE_NAME}/Views/$WIDGET_NAME.coffee
cat $BASEDIR/templates/Test.coffee | sed -e "s@#{PackageName}@$PACKAGE_NAME@g" | sed -e "s@#{WidgetName}@$WIDGET_NAME@g" > ${COFFEEDIR}/${PACKAGE_NAME}/tests/Views/$WIDGET_NAME.coffee
cat $BASEDIR/templates/demo-page.html | sed -e "s@#{PackageName}@$PACKAGE_NAME@g" | sed -e "s@#{WidgetName}@$WIDGET_NAME@g" > ${COFFEEDIR}/${PACKAGE_NAME}/tests/Views/$WIDGET_NAME.html

coffee -c --output $BASEDIR/../src $BASEDIR/../coffee

if [ -f ${COFFEEDIR}/${PACKAGE_NAME}/tests/module.coffee ]; then
    if ! grep "  doh.register '$WIDGET_NAME', require.toUrl('/javascripts/coffee/$PACKAGE_NAME/tests/Views/$WIDGET_NAME.html'), 999999" ${COFFEEDIR}/${PACKAGE_NAME}/tests/module.coffee  > /dev/null; then
        echo "  doh.register '$WIDGET_NAME', require.toUrl('/javascripts/coffee/$PACKAGE_NAME/tests/Views/$WIDGET_NAME.html'), 999999" >> ${COFFEEDIR}/${PACKAGE_NAME}/tests/module.coffee
    fi
else
    cat $BASEDIR/templates/module.coffee | sed -e "s@#{PackageName}@$PACKAGE_NAME@g" | sed -e "s@#{WidgetName}@$WIDGET_NAME@g" > ${COFFEEDIR}/${PACKAGE_NAME}/tests/module.coffee
fi

if ! grep "{ name: '$PACKAGE_NAME', location: '$PACKAGE_NAME'}" $BASEDIR/../config.js > /dev/null; then
    perl -pwi'.bak' -e "s/packages: \[/packages: \[\n\t\t{ name: '$PACKAGE_NAME', location: '$PACKAGE_NAME'}\,/" $BASEDIR/../config.js
fi

echo "widget and test are created. start test server, then see "
echo "http://localhost:3000/javascripts/coffee/$PACKAGE_NAME/tests/Views/$WIDGET_NAME.html"

exit 0






