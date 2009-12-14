/*
 * lapack_dlasd1.c
 *
 *This program is a C interface to dlasd1.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlasd1(const int nl, const int nr, const int sqre, double * d, double * alpha, double * beta, double * u, const int ldu, double * vt, const int ldvt, int * idxq, int * iwork, double * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_nl=nl, F77_nr=nr, F77_sqre=sqre, F77_ldu=ldu, F77_ldvt=ldvt;
	int i_local;
	F77_INT F77_idxq[(nl+nr+1)*1];
	for(i_local=0;i_local<(nl+nr+1)*1;i_local++) {
		F77_idxq[i_local]=(F77_INT) idxq[i_local];
	}
	#define F77_iwork iwork
	F77_INT F77_info[1];
	F77_info[0]=(F77_INT) info[0];
#else
	#define F77_nl nl
	#define F77_nr nr
	#define F77_sqre sqre
	#define F77_ldu ldu
	#define F77_ldvt ldvt
	#define F77_idxq idxq
	#define F77_iwork iwork
	#define F77_info info
#endif


	f77_dlasd1(&F77_nl, &F77_nr, &F77_sqre, d, alpha, beta, u, &F77_ldu, vt, &F77_ldvt, F77_idxq, F77_iwork, work, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<(nl+nr+1)*1;i_local++) {
		idxq[i_local]=(int) F77_idxq[i_local];
	}

	info[0]=(int) F77_info[0];

#endif
	
}
