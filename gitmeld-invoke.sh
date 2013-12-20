#!/bin/bash

LEFT_FILE=$1
RIGHT_FILE=$2

# Please put a forward slash (/) between two patterns
EXCLUSION_PATTERN=*.vcproj/*.sln


LEFT_FILE_BASENAME=`basename $LEFT_FILE`
echo $LEFT_FILE_BASENAME | grep \\.  >/dev/null
if [  "$?" == "0" ];then
    # The filename has an extension
    LEFT_FILE_EXT=.`echo $LEFT_FILE_BASENAME | awk -F . '{print $2}'`
    echo $LEFT_FILE_EXT
    echo $EXCLUSION_PATTERN | grep $LEFT_FILE_EXT > /dev/null
else
    echo $EXCLUSION_PATTERN | grep $LEFT_FILE_BASENAME > /dev/null
fi

if [ "$?" == "1" ]; then
    echo $LEFT_FILE $RIGHT_FILE
else
    echo "Ignoring: $LEFT_FILE"
fi