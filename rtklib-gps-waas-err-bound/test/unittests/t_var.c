/*------------------------------------------------------------------------------
* rtklib unit test driver : pseudorange variances functions
*-----------------------------------------------------------------------------*/
#include <stdio.h>
#include <math.h>
#include <assert.h>
#include "../../src/rtklib.h"

extern double varrx(double , int );
extern double varfcorr(int );
extern double varicorr(int );

/* varrx() */
void unittest1(void)
{
	double vrx;							/* noise and multipath variance [m] */
    double el[]={-10.0,0.0,45.0,90.0};	/* tested elevation angles [deg] */
	double vs[]={0.1296,3.24};			/* noise bound for GPS (0.36^2), GEO (1.8^2) [m] */
	int sys[]={1,2,255};				/* GPS, SBAS, all */

	vrx=varrx(el[0]*D2R,sys[0]);
        assert(fabs(vrx-2.596665)<1E-6);
	vrx=varrx(el[1]*D2R,sys[0]);
        assert(fabs(vrx-0.5652)<1E-6);
	vrx=varrx(el[2]*D2R,sys[0]);
        assert(fabs(vrx-0.148065)<1E-6);
	vrx=varrx(el[3]*D2R,sys[0]);
        assert(fabs(vrx-0.146517)<1E-6);
	vrx=varrx(el[0]*D2R,sys[1]);
        assert(fabs(vrx-5.707065)<1E-6);
	vrx=varrx(el[1]*D2R,sys[1]);
        assert(fabs(vrx-3.6756)<1E-6);
	vrx=varrx(el[2]*D2R,sys[1]);
        assert(fabs(vrx-3.258465)<1E-6);
	vrx=varrx(el[3]*D2R,sys[1]);
        assert(fabs(vrx-3.256917)<1E-6);
	vrx=varrx(el[2]*D2R,sys[2]);
        assert(fabs(vrx-0.018465)<1E-6);

    printf("%s utset1 : OK\n",__FILE__);
}
/* varfcorr() */
void unittest2(void)
{
    double udre;
    double udre_truth[14]={0.052,0.0924,0.1444,0.283,0.4678,0.8315,
		1.2992,1.8709,2.5465,3.326,5.1968,20.7870,230.9661,2078.695};
    int index;
    for (index=1;index<15;index++) {
		udre=varfcorr(index);
		assert(fabs(udre-udre_truth[index-1])<1E-7);
    }
    for (index=15;index<20;index++) {
		udre=varfcorr(index);
		assert(udre==0.0);
    }
    
    printf("%s utset2 : OK\n",__FILE__);
}
/* varicorr() */
void unittest3(void)
{
    double give;
    double give_truth[15]={0.0084,0.0333,0.0749,0.1331,0.2079,0.2994,0.4075,
		0.5322,0.6735,0.8315,1.1974,1.8709,3.326,20.787,187.0826};
    int index;
    for (index=1;index<16;index++) {
		give=varicorr(index);
		assert(fabs(give-give_truth[index-1])<1E-7);
    }
    for (index=16;index<20;index++) {
		give=varicorr(index);
		assert(give==0.0);
    }

    printf("%s utset3 : OK\n",__FILE__);
}
int main(void)
{
    unittest1();
    unittest2();
    unittest3();
    return 0;
}
