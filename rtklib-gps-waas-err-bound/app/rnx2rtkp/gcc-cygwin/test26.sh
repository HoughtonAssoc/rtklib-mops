#!/bin/bash

declare -i status=0;
$1 -k SSSS.conf Uslo3610.06O Uslo3610.06N Geo135_00b4_1407_03.sbs -o Uslo3610SSSS.pos
grep -v % Uslo3610SSSS.pos | diff uslo3610SSSS-expected - > /dev/null
status=$?
if [ $status -ne 0 ]; then echo "test26 failed, status = $status"; fi
