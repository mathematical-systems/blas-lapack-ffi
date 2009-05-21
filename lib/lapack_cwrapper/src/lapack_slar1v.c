/*
 * lapack_slar1v.c
 *
 *This program is a C interface to slar1v.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slar1v(const int n, const int b1, const int bn, const float sigma, const float * l, const float * d, const float * ld, const float * lld, const float * gersch, float * z, float * ztz, float * mingma, int * r, int * isuppz, float * work )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_b1=b1, F77_bn=bn;
	int i_local;
	F77_INT F77_r[1];
	F77_r[0]=(F77_INT) r[0];
	F77_INT F77_isuppz[2*1];
	for(i_local=0;i_local<2*1;i_local++) {
		F77_isuppz[i_local]=(F77_INT) isuppz[i_local];
	}
#else
	#define F77_n n
	#define F77_b1 b1
	#define F77_bn bn
	#define F77_r r
	#define F77_isuppz isuppz
#endif

	f77_slar1v(&F77_n, &F77_b1, &F77_bn, &sigma, l, d, ld, lld, gersch, z, ztz, mingma, F77_r, F77_isuppz, work);

#ifdef F77_INT
	r[0]=(int) F77_r[0];
	for(i_local=0;i_local<2*1;i_local++) {
		isuppz[i_local]=(int) F77_isuppz[i_local];
	}

#endif

}
