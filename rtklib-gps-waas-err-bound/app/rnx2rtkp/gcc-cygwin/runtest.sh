#!/bin/bash

declare -i status=0;
#echo "command: $1" 1>&2
${1};
diff ${2}.pos-expected ${2}.pos > /dev/null
status=$?
if [ $status -ne 0 ]; then echo "${2} failed, status = $status"; else echo "${2} passed."; fi 1>&2
