/*
 * lapack_dlarre.c
 *
 *This program is a C interface to dlarre.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlarre(const int n, double * d, double * e, const double tol, int * nsplit, int * isplit, int * m, double * w, double * woff, double * gersch, const double * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n;
	int i_local;
	F77_INT F77_nsplit[1];
	F77_INT F77_isplit[2*n*1];
	for(i_local=0;i_local<2*n*1;i_local++) {
		F77_isplit[i_local]=(F77_INT) isplit[i_local];
	}
	F77_INT F77_m[2*n*1];
	for(i_local=0;i_local<2*n*1;i_local++) {
		F77_m[i_local]=(F77_INT) m[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_nsplit nsplit
	#define F77_isplit isplit
	#define F77_m m
	#define F77_info info
#endif

	f77_dlarre(&F77_n, d, e, &tol, F77_nsplit, F77_isplit, F77_m, w, woff, gersch, work, F77_info);

#ifdef F77_INT
	nsplit[0]=(int) F77_nsplit[0];
	for(i_local=0;i_local<2*n*1;i_local++) {
		isplit[i_local]=(int) F77_isplit[i_local];
	}

	for(i_local=0;i_local<2*n*1;i_local++) {
		m[i_local]=(int) F77_m[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
