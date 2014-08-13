/*------------------------------------------------------------------------------
* rtklib unit test driver : waasprotlevel() function
*-----------------------------------------------------------------------------*/
#include <math.h>
#include "utest.h"
#include <stdlib.h>
#include "../../src/rtklib.h"

#define MAX_OBS 100
#define DTOL  1.e-12
#define EAST  0
#define NORTH 1
#define UP    2
#define TIME  3

#define A4(i,j) (4*(i)+(j))
#define SQR(x) (x)*(x)

int waas_calc = 1;

extern int waasprotlevels(double* azel, int nv, int* vobs2obs, double* var,
		protlevels_t *pl);

/*
 * Terminate execution with the given message and the
 * EXIT_FAILURE return code.
 */
static void die(const char* msg) {
	printf(msg);
	printf("\n");
	exit(EXIT_FAILURE);
}

/*
 * Compare the D matrix calculation with expected results and
 * check protection level calculations.
 */
void unittest1(void)
{
    FILE *fp;
    int lineno = 0;
    int i, j, k, nobs;
	double d2east, d2north, d2en, dmajor, hpl, vpl;
	double ca, sa, ce, se, g[4];
	double d[16], de[16], dmax;
    double azel[2*MAX_OBS], w, wmax, var[MAX_OBS];
	protlevels_t pl;
	int vobs2obs[MAX_OBS];

    /* Open the expected-results file. */
    if (!(fp = fopen("pl-expected-results.txt", "r"))) {
    	die("Cannot open \"expected-results.txt\"");
    }

    /* Read loop over test data sets. */
    while (fscanf(fp, "%d", &nobs) != EOF) {
    	assert(nobs >= 4);
    	lineno++;
    	printf("Processing data set beginning at line %d\n", lineno);
    	fflush(stdout);

    	/* Read and process observations. */
    	wmax = 0.;
    	memset(d, '\0', sizeof(d));
    	for (k = 0; k < nobs; k++) {
    		vobs2obs[k] = k;
    		assert(fscanf(fp, "%lf %lf %lf", azel+2*k, azel+2*k+1, &w)
    				== 3);
        	lineno++;
    		assert(w >= 0.);
    		if (w > wmax) wmax = w;
    		var[k] = 1./w;
    		assert(azel[2*k] <= 2. * PI);
    		assert(azel[2*k] >= 0.);
    		assert(azel[2*k+1] <= PI);
    		assert(azel[2*k+1] >= 0.);

        	/* Accumulate the inverse of the D matrix. */
        	ca = cos(azel[2*k]);
        	sa = sin(azel[2*k]);
        	ce = cos(azel[2*k+1]);
        	se = sin(azel[2*k+1]);
        	g[EAST] = -ce * sa;
        	g[NORTH] = -ce * ca;
        	g[UP] = -se;
        	g[TIME] = 1;
        	for (i = 0; i < 4; i++) for (j = 0; j < 4; j++)
        		d[A4(i,j)] += g[i] * g[j] / var[k];
    	}

    	/* Invert matrix to get the calculated D matrix. */
    	assert(!matinv(d,4));

    	/* Read expected D matrix from the expected-results file. */
    	dmax = 0.;
    	for (i = 0; i < 4; i++) {
        	lineno++;
    		for (j = 0; j < 4; j++) {
    			assert(fscanf(fp, "%lg", de+A4(i,j)) == 1);
    			if (fabs(de[A4(i,j)]) > dmax) dmax = fabs(de[A4(i,j)]);
    		}
    	}

    	/*
    	 * Verify that the calculated D matrix agrees with the expected
    	 * D matrix.
    	 */
    	assert(fabs(d[A4(EAST ,EAST )] - de[A4(EAST ,EAST )]) / dmax < DTOL);
    	assert(fabs(d[A4(EAST ,NORTH)] - de[A4(EAST ,NORTH)]) / dmax < DTOL);
    	assert(fabs(d[A4(EAST ,UP   )] - de[A4(EAST ,UP   )]) / dmax < DTOL);
    	assert(fabs(d[A4(EAST ,TIME )] - de[A4(EAST ,TIME )]) / dmax < DTOL);
    	assert(fabs(d[A4(NORTH,EAST )] - de[A4(NORTH,EAST )]) / dmax < DTOL);
    	assert(fabs(d[A4(NORTH,NORTH)] - de[A4(NORTH,NORTH)]) / dmax < DTOL);
    	assert(fabs(d[A4(NORTH,UP   )] - de[A4(NORTH,UP   )]) / dmax < DTOL);
    	assert(fabs(d[A4(NORTH,TIME )] - de[A4(NORTH,TIME )]) / dmax < DTOL);
    	assert(fabs(d[A4(UP   ,EAST )] - de[A4(UP   ,EAST )]) / dmax < DTOL);
    	assert(fabs(d[A4(UP   ,NORTH)] - de[A4(UP   ,NORTH)]) / dmax < DTOL);
    	assert(fabs(d[A4(UP   ,UP   )] - de[A4(UP   ,UP   )]) / dmax < DTOL);
    	assert(fabs(d[A4(UP   ,TIME )] - de[A4(UP   ,TIME )]) / dmax < DTOL);
    	assert(fabs(d[A4(TIME ,EAST )] - de[A4(TIME ,EAST )]) / dmax < DTOL);
    	assert(fabs(d[A4(TIME ,NORTH)] - de[A4(TIME ,NORTH)]) / dmax < DTOL);
    	assert(fabs(d[A4(TIME ,UP   )] - de[A4(TIME ,UP   )]) / dmax < DTOL);
    	assert(fabs(d[A4(TIME ,TIME )] - de[A4(TIME ,TIME )]) / dmax < DTOL);

    	/* Calculate expected protection levels from calculated D matrix. */
    	d2east = d[A4(EAST,EAST)];
    	d2north = d[A4(NORTH,NORTH)];
    	d2en = d[A4(EAST,NORTH)];
    	dmajor = sqrt((d2east+d2north)/2.+sqrt(SQR((d2east-d2north)/2.)
    			+SQR(d2en)));
    	hpl = 6.00 * dmajor;
    	vpl = 5.33 * sqrt(d[A4(UP,UP)]);

    	/* Calculate protection levels with function under test. */
    	assert(!waasprotlevels(azel, nobs, vobs2obs, var, &pl));

    	/* Verify that protection levels agree. */
    	assert(fabs(pl.hpl - hpl) * sqrt(wmax) < DTOL);
    	assert(fabs(pl.vpl - vpl) * sqrt(wmax) < DTOL);
    } /* Loop over test data sets. */
    fclose(fp);

    PRINT_OK("unittest1");
}

/* Null pointer tests. */
void unittest2(void)
{
    double azel[2*MAX_OBS], var[MAX_OBS];
	protlevels_t pl;
	int vobs2obs[MAX_OBS], nobs = 5;

	assert(waasprotlevels(NULL, nobs, vobs2obs, var , &pl ) == 2);
	assert(waasprotlevels(azel, nobs, NULL    , var , &pl ) == 2);
	assert(waasprotlevels(azel, nobs, vobs2obs, NULL, &pl ) == 2);
	assert(waasprotlevels(azel, nobs, vobs2obs, var , NULL) == 2);

    PRINT_OK("unittest2")
}

/* Too few observations test. */
void unittest3(void)
{
    double azel[2*MAX_OBS], var[MAX_OBS];
	protlevels_t pl;
	int vobs2obs[MAX_OBS], nobs = 3;

   	assert(waasprotlevels(azel, nobs, vobs2obs, var, &pl) == 3);

   	PRINT_OK("unittest3");
}

/*
 * Test singular matrix processing.
 */
void unittest4(void)
{
    int nobs = 4;
    double azel[] = {0.0000000000000000, 0.0000000000000000,
    		         0.0000000000000000, 0.0000000000000000,
    		         0.0000000000000000, 0.0000000000000000,
    		         0.0000000000000000, 0.0000000000000000};
    double var[] = {1., 1., 1., 1.};
	protlevels_t pl;
	int vobs2obs[] = {0, 1, 2, 3};

	/* Calculate protection levels with function under test. */
	assert(waasprotlevels(azel, nobs, vobs2obs, var, &pl) == 1);

    PRINT_OK("unittest4");
}

int main(void)
{
    unittest1();
    unittest2();
    unittest3();
    unittest4();
    return EXIT_SUCCESS;
}
