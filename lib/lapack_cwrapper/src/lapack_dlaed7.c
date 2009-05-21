/*
 * lapack_dlaed7.c
 *
 *This program is a C interface to dlaed7.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaed7(const int icompq, const int n, const int qsiz, const int tlvls, const int curlvl, const int curpbm, double * d, double * q, const int ldq, int * indxq, const double rho, const int cutpnt, double * qstore, int * qptr, const int * prmptr, const int * perm, const int * givptr, const int * givcol, const double * givnum, double * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_icompq=icompq, F77_n=n, F77_qsiz=qsiz, F77_tlvls=tlvls, F77_curlvl=curlvl, F77_curpbm=curpbm, F77_ldq=ldq, F77_cutpnt=cutpnt;
	int i_local;
	F77_INT F77_indxq[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_indxq[i_local]=(F77_INT) indxq[i_local];
	}
	F77_INT F77_qptr[n+2*1];
	for(i_local=0;i_local<n+2*1;i_local++) {
		F77_qptr[i_local]=(F77_INT) qptr[i_local];
	}
	F77_INT F77_prmptr[1*1];
	for(i_local=0;i_local<1*1;i_local++) {
		F77_prmptr[i_local]=(F77_INT) prmptr[i_local];
	}
	F77_INT F77_perm[1*1];
	for(i_local=0;i_local<1*1;i_local++) {
		F77_perm[i_local]=(F77_INT) perm[i_local];
	}
	F77_INT F77_givptr[1*1];
	for(i_local=0;i_local<1*1;i_local++) {
		F77_givptr[i_local]=(F77_INT) givptr[i_local];
	}
	F77_INT F77_givcol[1*1];
	for(i_local=0;i_local<1*1;i_local++) {
		F77_givcol[i_local]=(F77_INT) givcol[i_local];
	}
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_icompq icompq
	#define F77_n n
	#define F77_qsiz qsiz
	#define F77_tlvls tlvls
	#define F77_curlvl curlvl
	#define F77_curpbm curpbm
	#define F77_ldq ldq
	#define F77_indxq indxq
	#define F77_cutpnt cutpnt
	#define F77_qptr qptr
	#define F77_prmptr prmptr
	#define F77_perm perm
	#define F77_givptr givptr
	#define F77_givcol givcol
	#define F77_iwork iwork
	#define F77_info info
#endif

	f77_dlaed7(&F77_icompq, &F77_n, &F77_qsiz, &F77_tlvls, &F77_curlvl, &F77_curpbm, d, q, &F77_ldq, F77_indxq, &rho, &F77_cutpnt, qstore, F77_qptr, F77_prmptr, F77_perm, F77_givptr, F77_givcol, givnum, work, F77_iwork, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<n*1;i_local++) {
		indxq[i_local]=(int) F77_indxq[i_local];
	}

	for(i_local=0;i_local<n+2*1;i_local++) {
		qptr[i_local]=(int) F77_qptr[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
