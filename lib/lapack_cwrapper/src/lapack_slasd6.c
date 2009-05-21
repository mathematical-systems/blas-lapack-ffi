/*
 * lapack_slasd6.c
 *
 *This program is a C interface to slasd6.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slasd6(const int icompq, const int nl, const int nr, const int sqre, float * d, float * vf, float * vl, float * alpha, float * beta, int * idxq, int * perm, int * givptr, int * givcol, const int ldgcol, float * givnum, const int ldgnum, float * poles, float * difl, float * difr, float * z, int * k, float * c, float * s, float * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_icompq=icompq, F77_nl=nl, F77_nr=nr, F77_sqre=sqre, F77_ldgcol=ldgcol, F77_ldgnum=ldgnum;
	int i_local;
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
	F77_INT F77_k[1];
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_icompq icompq
	#define F77_nl nl
	#define F77_nr nr
	#define F77_sqre sqre
	#define F77_idxq idxq
	#define F77_perm perm
	#define F77_givptr givptr
	#define F77_givcol givcol
	#define F77_ldgcol ldgcol
	#define F77_ldgnum ldgnum
	#define F77_k k
	#define F77_iwork iwork
	#define F77_info info
#endif

	f77_slasd6(&F77_icompq, &F77_nl, &F77_nr, &F77_sqre, d, vf, vl, alpha, beta, F77_idxq, F77_perm, F77_givptr, F77_givcol, &F77_ldgcol, givnum, &F77_ldgnum, poles, difl, difr, z, F77_k, c, s, work, F77_iwork, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<n*1;i_local++) {
		idxq[i_local]=(int) F77_idxq[i_local];
	}

	for(i_local=0;i_local<n*1;i_local++) {
		perm[i_local]=(int) F77_perm[i_local];
	}

	givptr[0]=(int) F77_givptr[0];
	for(i_local=0;i_local<ldgcol* 2;i_local++) {
		givcol[i_local]=(int) F77_givcol[i_local];
	}

	k[0]=(int) F77_k[0];
	info[0]=(int) F77_info[0];
#endif

}
