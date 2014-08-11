#!/bin/bash

declare -i status=0;
#echo "command: $1" 1>&2
${1};
diff -w ${3} ${4} > /dev/null
status=$?
if [ $status -ne 0 ]; then
	echo "${2} failed, status = $status";
	echo "${2} failed, status = $status" >> failed_tests;
else
	echo "${2} passed.";
fi 1>&2

