#!/bin/bash

if [ -e failed_tests ]; then
	echo ""
	echo "----------------Test failure summary-------------------";
	cat failed_tests;
	rm -f failed_tests;
else
	echo ""
	echo "----------------All tests passed-----------------------";
fi
