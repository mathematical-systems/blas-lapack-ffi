/*
 * lapack_slaed3.c
 *
 *This program is a C interface to slaed3.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slaed3(const int k, const int n, const int n1, float * d, float * q, const int ldq, const float rho, float * dlamda, const float * q2, const int * indx, const int * ctot, float * w, float * s, const int lds, int * info )
{
#ifdef F77_INT
	F77_INT F77_k=k, F77_n=n, F77_n1=n1, F77_ldq=ldq, F77_lds=lds;
	int i_local;
	F77_INT F77_indx[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_indx[i_local]=(F77_INT) indx[i_local];
	}
	F77_INT F77_ctot[4*1];
	for(i_local=0;i_local<4*1;i_local++) {
		F77_ctot[i_local]=(F77_INT) ctot[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_k k
	#define F77_n n
	#define F77_n1 n1
	#define F77_ldq ldq
	#define F77_indx indx
	#define F77_ctot ctot
	#define F77_lds lds
	#define F77_info info
#endif

	f77_slaed3(&F77_k, &F77_n, &F77_n1, d, q, &F77_ldq, &rho, dlamda, q2, F77_indx, F77_ctot, w, s, &F77_lds, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
