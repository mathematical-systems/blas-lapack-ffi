/*
 * lapack_dlasd3.c
 *
 *This program is a C interface to dlasd3.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlasd3(const int nl, const int nr, const int sqre, const int k, double * d, double * q, const int ldq, const double * dsigma, double * u, const int ldu, double * u2, const int ldu2, double * vt, const int ldvt, double * vt2, const int ldvt2, const int * idxc, const int * ctot, const double * z, int * info )
{
#ifdef F77_INT
	F77_INT F77_nl=nl, F77_nr=nr, F77_sqre=sqre, F77_k=k, F77_ldq=ldq, F77_ldu=ldu, F77_ldu2=ldu2, F77_ldvt=ldvt, F77_ldvt2=ldvt2;
	int i_local;
	F77_INT F77_idxc[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_idxc[i_local]=(F77_INT) idxc[i_local];
	}
	F77_INT F77_ctot[4*1];
	for(i_local=0;i_local<4*1;i_local++) {
		F77_ctot[i_local]=(F77_INT) ctot[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_nl nl
	#define F77_nr nr
	#define F77_sqre sqre
	#define F77_k k
	#define F77_ldq ldq
	#define F77_ldu ldu
	#define F77_ldu2 ldu2
	#define F77_ldvt ldvt
	#define F77_ldvt2 ldvt2
	#define F77_idxc idxc
	#define F77_ctot ctot
	#define F77_info info
#endif

	f77_dlasd3(&F77_nl, &F77_nr, &F77_sqre, &F77_k, d, q, &F77_ldq, dsigma, u, &F77_ldu, u2, &F77_ldu2, vt, &F77_ldvt, vt2, &F77_ldvt2, F77_idxc, F77_ctot, z, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
