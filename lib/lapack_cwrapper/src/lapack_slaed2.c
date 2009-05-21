/*
 * lapack_slaed2.c
 *
 *This program is a C interface to slaed2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slaed2(int * k, const int n, const int n1, float * d, float * q, const int ldq, int * indxq, float * rho, const float * z, float * dlamda, float * w, float * q2, int * indx, int * indxc, int * indxp, int * coltyp, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_n1=n1, F77_ldq=ldq;
	int i_local;
	F77_INT F77_k[1];
	F77_INT F77_indxq[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_indxq[i_local]=(F77_INT) indxq[i_local];
	}
	F77_INT F77_indx[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_indx[i_local]=(F77_INT) indx[i_local];
	}
	F77_INT F77_indxc[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_indxc[i_local]=(F77_INT) indxc[i_local];
	}
	F77_INT F77_indxp[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_indxp[i_local]=(F77_INT) indxp[i_local];
	}
	F77_INT F77_coltyp[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_coltyp[i_local]=(F77_INT) coltyp[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_k k
	#define F77_n n
	#define F77_n1 n1
	#define F77_ldq ldq
	#define F77_indxq indxq
	#define F77_indx indx
	#define F77_indxc indxc
	#define F77_indxp indxp
	#define F77_coltyp coltyp
	#define F77_info info
#endif

	f77_slaed2(F77_k, &F77_n, &F77_n1, d, q, &F77_ldq, F77_indxq, rho, z, dlamda, w, q2, F77_indx, F77_indxc, F77_indxp, F77_coltyp, F77_info);

#ifdef F77_INT
	k[0]=(int) F77_k[0];
	for(i_local=0;i_local<n*1;i_local++) {
		indxq[i_local]=(int) F77_indxq[i_local];
	}

	for(i_local=0;i_local<n*1;i_local++) {
		indx[i_local]=(int) F77_indx[i_local];
	}

	for(i_local=0;i_local<n*1;i_local++) {
		indxc[i_local]=(int) F77_indxc[i_local];
	}

	for(i_local=0;i_local<n*1;i_local++) {
		indxp[i_local]=(int) F77_indxp[i_local];
	}

	for(i_local=0;i_local<n*1;i_local++) {
		coltyp[i_local]=(int) F77_coltyp[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
