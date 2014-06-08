#!/bin/bash

declare -i status=0;
$1 -k SBMB.conf Uslo3610.06O Uslo3610.06N -o uslo3610SBMB.pos
grep -v % Uslo3610SBMB.pos | diff uslo3610SBMB-expected - > /dev/null
status=$?
if [ $status != 0 ]; then echo "test27 failed, status = $status"; fi
