/*
 * lapack_dlasda.c
 *
 *This program is a C interface to dlasda.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlasda(const int icompq, const int smlsiz, const int n, const int sqre, double * d, const double * e, double * u, const int ldu, double * vt, int * k, double * difl, double * difr, double * z, double * poles, int * givptr, int * givcol, const int ldgcol, int * perm, double * givnum, double * c, double * s, double * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_icompq=icompq, F77_smlsiz=smlsiz, F77_n=n, F77_sqre=sqre, F77_ldu=ldu, F77_ldgcol=ldgcol;
	int i_local;
	F77_INT F77_k[1*1];
	for(i_local=0;i_local<1*1;i_local++) {
		F77_k[i_local]=(F77_INT) k[i_local];
	}
	F77_INT F77_givptr[1*1];
	for(i_local=0;i_local<1*1;i_local++) {
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
	#define F77_sqre sqre
	#define F77_ldu ldu
	#define F77_k k
	#define F77_givptr givptr
	#define F77_givcol givcol
	#define F77_ldgcol ldgcol
	#define F77_perm perm
	#define F77_iwork iwork
	#define F77_info info
#endif

	f77_dlasda(&F77_icompq, &F77_smlsiz, &F77_n, &F77_sqre, d, e, u, &F77_ldu, vt, F77_k, difl, difr, z, poles, F77_givptr, F77_givcol, &F77_ldgcol, F77_perm, givnum, c, s, work, F77_iwork, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<1*1;i_local++) {
		k[i_local]=(int) F77_k[i_local];
	}

	for(i_local=0;i_local<1*1;i_local++) {
		givptr[i_local]=(int) F77_givptr[i_local];
	}

	for(i_local=0;i_local<1*1;i_local++) {
		givcol[i_local]=(int) F77_givcol[i_local];
	}

	for(i_local=0;i_local<1*1;i_local++) {
		perm[i_local]=(int) F77_perm[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
