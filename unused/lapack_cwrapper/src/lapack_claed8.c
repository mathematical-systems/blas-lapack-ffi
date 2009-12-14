/*
 * lapack_claed8.c
 *
 *This program is a C interface to claed8.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_claed8(int * k, const int n, const int qsiz, void * q, const int ldq, float * d, float * rho, const int cutpnt, const float * z, float * dlamda, void * q2, const int ldq2, float * w, int * indxp, int * indx, const int * indxq, int * perm, int * givptr, int * givcol, float * givnum, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_qsiz=qsiz, F77_ldq=ldq, F77_cutpnt=cutpnt, F77_ldq2=ldq2;
	int i_local;
	F77_INT F77_k[1];
	F77_INT F77_indxp[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_indxp[i_local]=(F77_INT) indxp[i_local];
	}
	F77_INT F77_indx[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_indx[i_local]=(F77_INT) indx[i_local];
	}
	F77_INT F77_indxq[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_indxq[i_local]=(F77_INT) indxq[i_local];
	}
	F77_INT F77_perm[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_perm[i_local]=(F77_INT) perm[i_local];
	}
	F77_INT F77_givptr[1];
	F77_INT F77_givcol[2* n];
	for(i_local=0;i_local<2* n;i_local++) {
		F77_givcol[i_local]=(F77_INT) givcol[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_k k
	#define F77_n n
	#define F77_qsiz qsiz
	#define F77_ldq ldq
	#define F77_cutpnt cutpnt
	#define F77_ldq2 ldq2
	#define F77_indxp indxp
	#define F77_indx indx
	#define F77_indxq indxq
	#define F77_perm perm
	#define F77_givptr givptr
	#define F77_givcol givcol
	#define F77_info info
#endif

	f77_claed8(F77_k, &F77_n, &F77_qsiz, q, &F77_ldq, d, rho, &F77_cutpnt, z, dlamda, q2, &F77_ldq2, w, F77_indxp, F77_indx, F77_indxq, F77_perm, F77_givptr, F77_givcol, givnum, F77_info);

#ifdef F77_INT
	k[0]=(int) F77_k[0];
	for(i_local=0;i_local<n*1;i_local++) {
		indxp[i_local]=(int) F77_indxp[i_local];
	}

	for(i_local=0;i_local<n*1;i_local++) {
		indx[i_local]=(int) F77_indx[i_local];
	}

	for(i_local=0;i_local<n*1;i_local++) {
		perm[i_local]=(int) F77_perm[i_local];
	}

	givptr[0]=(int) F77_givptr[0];
	for(i_local=0;i_local<2* n;i_local++) {
		givcol[i_local]=(int) F77_givcol[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
