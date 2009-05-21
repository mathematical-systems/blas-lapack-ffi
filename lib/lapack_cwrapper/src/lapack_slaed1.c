/*
 * lapack_slaed1.c
 *
 *This program is a C interface to slaed1.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slaed1(const int n, float * d, float * q, const int ldq, int * indxq, const float rho, const int cutpnt, float * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ldq=ldq, F77_cutpnt=cutpnt;
	int i_local;
	F77_INT F77_indxq[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_indxq[i_local]=(F77_INT) indxq[i_local];
	}
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ldq ldq
	#define F77_indxq indxq
	#define F77_cutpnt cutpnt
	#define F77_iwork iwork
	#define F77_info info
#endif

	f77_slaed1(&F77_n, d, q, &F77_ldq, F77_indxq, &rho, &F77_cutpnt, work, F77_iwork, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<n*1;i_local++) {
		indxq[i_local]=(int) F77_indxq[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
