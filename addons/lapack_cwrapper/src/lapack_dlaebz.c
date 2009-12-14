/*
 * lapack_dlaebz.c
 *
 *This program is a C interface to dlaebz.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaebz(const int ijob, const int nitmax, const int n, const int mmax, const int minp, const int nbmin, const double abstol, const double reltol, const double pivmin, const double * d, const double * e, const double * e2, int * nval, double * ab, double * c, int * mout, int * nab, double * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_ijob=ijob, F77_nitmax=nitmax, F77_n=n, F77_mmax=mmax, F77_minp=minp, F77_nbmin=nbmin;
	int i_local;
	F77_INT F77_nval[minp*1];
	for(i_local=0;i_local<minp*1;i_local++) {
		F77_nval[i_local]=(F77_INT) nval[i_local];
	}
	F77_INT F77_mout[1];
	F77_INT F77_nab[mmax*2];
	for(i_local=0;i_local<mmax*2;i_local++) {
		F77_nab[i_local]=(F77_INT) nab[i_local];
	}
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_ijob ijob
	#define F77_nitmax nitmax
	#define F77_n n
	#define F77_mmax mmax
	#define F77_minp minp
	#define F77_nbmin nbmin
	#define F77_nval nval
	#define F77_mout mout
	#define F77_nab nab
	#define F77_iwork iwork
	#define F77_info info
#endif

	f77_dlaebz(&F77_ijob, &F77_nitmax, &F77_n, &F77_mmax, &F77_minp, &F77_nbmin, &abstol, &reltol, &pivmin, d, e, e2, F77_nval, ab, c, F77_mout, F77_nab, work, F77_iwork, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<minp*1;i_local++) {
		nval[i_local]=(int) F77_nval[i_local];
	}

	mout[0]=(int) F77_mout[0];
	for(i_local=0;i_local<mmax*2;i_local++) {
		nab[i_local]=(int) F77_nab[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
