/*
 *          Copyright (C) 2007-2013 by T.TAKASU, All rights reserved.
 */
#ifndef SAT_CORRECTIONS_H
#define SAT_CORRECTIONS_H

typedef struct {
	double time;   /* Time of corrections. */
	double rs[3];  /* Satellite position. */
	double dts;    /* Satellite clock correction. */
	double dtrp;   /* Troposheric correction. */
	double dion;   /* Ionospheric correction. */
	int prn;       /* Satellite PRN. */
} SatCorrections;

void updateCorr(int prn, double time, const double rs[3], double dts, double dtrp, double dion);
void clearCorr();
SatCorrections* getNextCorr();

#endif /* SAT_CORRECTIONS_H */
