/*
 * lapack_dlals0.c
 *
 *This program is a C interface to dlals0.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlals0(const int icompq, const int nl, const int nr, const int sqre, const int nrhs, double * b, const int ldb, double * bx, const int ldbx, const int * perm, const int givptr, const int * givcol, const int ldgcol, const double * givnum, const int ldgnum, const double * poles, const double * difl, const double * difr, const double * z, const int k, const double c, const double s, double * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_icompq=icompq, F77_nl=nl, F77_nr=nr, F77_sqre=sqre, F77_nrhs=nrhs, F77_ldb=ldb, F77_ldbx=ldbx, F77_givptr=givptr, F77_ldgcol=ldgcol, F77_ldgnum=ldgnum, F77_k=k;
	int i_local;
	F77_INT F77_perm[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_perm[i_local]=(F77_INT) perm[i_local];
	}
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
	#define F77_nrhs nrhs
	#define F77_ldb ldb
	#define F77_ldbx ldbx
	#define F77_perm perm
	#define F77_givptr givptr
	#define F77_givcol givcol
	#define F77_ldgcol ldgcol
	#define F77_ldgnum ldgnum
	#define F77_k k
	#define F77_info info
#endif

	f77_dlals0(&F77_icompq, &F77_nl, &F77_nr, &F77_sqre, &F77_nrhs, b, &F77_ldb, bx, &F77_ldbx, F77_perm, &F77_givptr, F77_givcol, &F77_ldgcol, givnum, &F77_ldgnum, poles, difl, difr, z, &F77_k, &c, &s, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
