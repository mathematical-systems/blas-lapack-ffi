/*
 * lapack_clarrv.c
 *
 *This program is a C interface to clarrv.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_clarrv(const int n, float * d, float * l, const int * isplit, const int m, const float * w, const int * iblock, const float * gersch, const float tol, void * z, const int ldz, int * isuppz, float * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_m=m, F77_ldz=ldz;
	int i_local;
	F77_INT F77_isplit[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_isplit[i_local]=(F77_INT) isplit[i_local];
	}
	F77_INT F77_iblock[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_iblock[i_local]=(F77_INT) iblock[i_local];
	}
	F77_INT F77_isuppz[1*m];
	for(i_local=0;i_local<1*m;i_local++) {
		F77_isuppz[i_local]=(F77_INT) isuppz[i_local];
	}
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_isplit isplit
	#define F77_m m
	#define F77_iblock iblock
	#define F77_ldz ldz
	#define F77_isuppz isuppz
	#define F77_iwork iwork
	#define F77_info info
#endif

	f77_clarrv(&F77_n, d, l, F77_isplit, &F77_m, w, F77_iblock, gersch, &tol, z, &F77_ldz, F77_isuppz, work, F77_iwork, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<1*m;i_local++) {
		isuppz[i_local]=(int) F77_isuppz[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
