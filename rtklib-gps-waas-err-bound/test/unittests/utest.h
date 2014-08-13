#ifndef UTEST_H
#define UTEST_H

#include <stdio.h>
#include <assert.h>

#define PRINT_OK(func) printf("%s " #func " : OK\n",__FILE__);\
	fflush(stdout);

#endif
