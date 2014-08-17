#!/bin/bash

echo ""
echo "----------------Test failure summary-------------------";
grep failed t_*.out > /dev/null;
if [ $? -ne 0 ]; then
	echo "All tests passed.";
else
	grep failed t_*.out;
fi
