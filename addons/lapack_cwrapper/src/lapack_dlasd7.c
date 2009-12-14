/*
 * lapack_dlasd7.c
 *
 *This program is a C interface to dlasd7.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlasd7(const int icompq, const int nl, const int nr, const int sqre, int * k, double * d, double * z, double * zw, double * vf, double * vfw, double * vl, double * vlw, const double alpha, const double beta, double * dsigma, int * idx, int * idxp, const int * idxq, int * perm, int * givptr, int * givcol, const int ldgcol, double * givnum, const int ldgnum, double * c, double * s, int * info )
{
#ifdef F77_INT
	F77_INT F77_icompq=icompq, F77_nl=nl, F77_nr=nr, F77_sqre=sqre, F77_ldgcol=ldgcol, F77_ldgnum=ldgnum;
	int i_local;
	F77_INT F77_k[1];
	F77_INT F77_idx[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_idx[i_local]=(F77_INT) idx[i_local];
	}
	F77_INT F77_idxp[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_idxp[i_local]=(F77_INT) idxp[i_local];
	}
	F77_INT F77_idxq[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_idxq[i_local]=(F77_INT) idxq[i_local];
	}
	F77_INT F77_perm[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_perm[i_local]=(F77_INT) perm[i_local];
	}
	F77_INT F77_givptr[1];
	F77_INT F77_givcol[ldgcol* 2];
	for(i_local=0;i_local<ldgcol* 2;i_local++) {
		F77_givcol[i_local]=(F77_INT) givcol[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_icompq icompq
	#define F77_nl nl
	#define F77_nr nr
	#define F77_sqre sqre
	#define F77_k k
	#define F77_idx idx
	#define F77_idxp idxp
	#define F77_idxq idxq
	#define F77_perm perm
	#define F77_givptr givptr
	#define F77_givcol givcol
	#define F77_ldgcol ldgcol
	#define F77_ldgnum ldgnum
	#define F77_info info
#endif

	f77_dlasd7(&F77_icompq, &F77_nl, &F77_nr, &F77_sqre, F77_k, d, z, zw, vf, vfw, vl, vlw, &alpha, &beta, dsigma, F77_idx, F77_idxp, F77_idxq, F77_perm, F77_givptr, F77_givcol, &F77_ldgcol, givnum, &F77_ldgnum, c, s, F77_info);

#ifdef F77_INT
	k[0]=(int) F77_k[0];
	for(i_local=0;i_local<n*1;i_local++) {
		idx[i_local]=(int) F77_idx[i_local];
	}

	for(i_local=0;i_local<n*1;i_local++) {
		idxp[i_local]=(int) F77_idxp[i_local];
	}

	for(i_local=0;i_local<n*1;i_local++) {
		perm[i_local]=(int) F77_perm[i_local];
	}

	givptr[0]=(int) F77_givptr[0];
	for(i_local=0;i_local<ldgcol* 2;i_local++) {
		givcol[i_local]=(int) F77_givcol[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
