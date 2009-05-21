/*
 * lapack_clalsa.c
 *
 *This program is a C interface to clalsa.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_clalsa(const int icompq, const int smlsiz, const int n, const int nrhs, void * b, const int ldb, void * bx, const int ldbx, const float * u, const int ldu, const float * vt, const int * k, const float * difl, const float * difr, const float * z, const float * poles, const int * givptr, const int * givcol, const int ldgcol, const int * perm, const float * givnum, const float * c, const float * s, float * rwork, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_icompq=icompq, F77_smlsiz=smlsiz, F77_n=n, F77_nrhs=nrhs, F77_ldb=ldb, F77_ldbx=ldbx, F77_ldu=ldu, F77_ldgcol=ldgcol;
	int i_local;
	F77_INT F77_k[n*.];
	for(i_local=0;i_local<n*.;i_local++) {
		F77_k[i_local]=(F77_INT) k[i_local];
	}
	F77_INT F77_givptr[n*.];
	for(i_local=0;i_local<n*.;i_local++) {
		F77_givptr[i_local]=(F77_INT) givptr[i_local];
	}
	F77_INT F77_givcol[1*1];
	for(i_local=0;i_local<1*1;i_local++) {
		F77_givcol[i_local]=(F77_INT) givcol[i_local];
	}
	F77_INT F77_perm[1*1];
	for(i_local=0;i_local<1*1;i_local++) {
		F77_perm[i_local]=(F77_INT) perm[i_local];
	}
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_icompq icompq
	#define F77_smlsiz smlsiz
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_ldb ldb
	#define F77_ldbx ldbx
	#define F77_ldu ldu
	#define F77_k k
	#define F77_givptr givptr
	#define F77_givcol givcol
	#define F77_ldgcol ldgcol
	#define F77_perm perm
	#define F77_iwork iwork
	#define F77_info info
#endif

	f77_clalsa(&F77_icompq, &F77_smlsiz, &F77_n, &F77_nrhs, b, &F77_ldb, bx, &F77_ldbx, u, &F77_ldu, vt, F77_k, difl, difr, z, poles, F77_givptr, F77_givcol, &F77_ldgcol, F77_perm, givnum, c, s, rwork, F77_iwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
