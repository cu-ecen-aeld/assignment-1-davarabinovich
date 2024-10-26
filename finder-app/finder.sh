#!/bin/bash


if [ $# -eq 0 ]
then
	echo "No parameters specified, 2 required"
	exit 1
fi

if [ ! -d $1 ]
then
	echo "The first parameter shall be a directory"
	exit 1
fi


FILES_DIR=$1
SEARCH_STR=$2


IFS=$'\n'

FILES="$(find ${FILES_DIR} -type f -name "*")"
FILES=(${FILES})
FILES_NUM=${#FILES[@]}

cd ${FILES_DIR}
LINES="$(grep -r "${SEARCH_STR}" *)"
LINES=(${LINES})
LINES_NUM=${#LINES[@]}

echo "The number of files are ${FILES_NUM} and the number of matching lines are ${LINES_NUM}"
exit 0

