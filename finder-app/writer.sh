#!/bin/sh

if [ $# -eq 0 ]
then
	echo "No argumets specified. Shall be 2 ones"
	exit 1
fi

WRITEFILE=$1
WRITESTR=$2

if [ -d ${WRITEFILE} ]
then
	echo "${WRITEFILE} is a directory. Specify a correct file name"
	exit 1
fi

WRITEDIR="$(dirname ${WRITEFILE})"
if [ ! -d ${WRITEDIR} ]
then
	mkdir -p ${WRITEDIR}
	result=$?
	if [ $result -ne 0 ]
	then
		exit 1
	fi
fi

touch ${WRITEFILE}
result=$?
if [ $result -ne 0 ]
then
	exit 1
fi

echo ${WRITESTR} > ${WRITEFILE}

