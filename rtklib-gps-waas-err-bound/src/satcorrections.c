/*
 *          Copyright (C) 2007-2013 by T.TAKASU, All rights reserved.
 */
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "satcorrections.h"
#include "rtklib.h"

static int numCorr = 0;
static int nextCorr = -1;
static SatCorrections satCorr[MAXOBS];

void updateCorr(int prn, double time, const double rs[3], double dts, double dtrp, double dion) {
	SatCorrections* p;
	for (p = &satCorr[0]; p <= &satCorr[numCorr-1]; p++) {
		if (prn != p->prn) continue;
		p->prn = prn;
		p->time = time;
		memcpy(p->rs, rs, 3*sizeof(double));
		p->dts = dts;
		p->dtrp = dtrp;
		p->dion = dion;
		return;
	}
	if (numCorr >= MAXOBS) {
		fprintf(stderr, "Too many corrections at %s:%d", __FILE__, __LINE__);
		exit(-1);
	}
	p = &satCorr[numCorr++];
	p->prn = prn;
	p->time = time;
	memcpy(p->rs, rs, 3*sizeof(double));
	p->dts = dts;
	p->dtrp = dtrp;
	p->dion = dion;
}

void clearCorr() {
	numCorr = 0;
	nextCorr = -1;
}

SatCorrections* getNextCorr() {
	if (nextCorr == -1) nextCorr = 0;
	if (nextCorr >= numCorr) {
		nextCorr = -1;
		return NULL;
	}
	return &satCorr[nextCorr++];
}
