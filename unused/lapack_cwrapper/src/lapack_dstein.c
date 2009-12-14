/*
 * lapack_dstein.c
 *
 *This program is a C interface to dstein.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dstein(const int n, const double * d, const double * e, const int m, const double * w, const int * iblock, const int * isplit, double * z, const int ldz, double * work, int * iwork, int * ifail, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_m=m, F77_ldz=ldz;
	int i_local;
	F77_INT F77_iblock[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_iblock[i_local]=(F77_INT) iblock[i_local];
	}
	F77_INT F77_isplit[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_isplit[i_local]=(F77_INT) isplit[i_local];
	}
	#define F77_iwork iwork
	F77_INT F77_ifail[m*1];
	for(i_local=0;i_local<m*1;i_local++) {
		F77_ifail[i_local]=(F77_INT) ifail[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_m m
	#define F77_iblock iblock
	#define F77_isplit isplit
	#define F77_ldz ldz
	#define F77_iwork iwork
	#define F77_ifail ifail
	#define F77_info info
#endif

	f77_dstein(&F77_n, d, e, &F77_m, w, F77_iblock, F77_isplit, z, &F77_ldz, work, F77_iwork, F77_ifail, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<m*1;i_local++) {
		ifail[i_local]=(int) F77_ifail[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
