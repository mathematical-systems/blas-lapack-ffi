/*
 * lapack_slamrg.c
 *
 *This program is a C interface to slamrg.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slamrg(const int n1, const int n2, const float * a, const int strd1, const int strd2, int * index )
{
#ifdef F77_INT
	F77_INT F77_n1=n1, F77_n2=n2, F77_strd1=strd1, F77_strd2=strd2;
	int i_local;
	F77_INT F77_index[n1+n2*1];
	for(i_local=0;i_local<n1+n2*1;i_local++) {
		F77_index[i_local]=(F77_INT) index[i_local];
	}
#else
	#define F77_n1 n1
	#define F77_n2 n2
	#define F77_strd1 strd1
	#define F77_strd2 strd2
	#define F77_index index
#endif

	f77_slamrg(&F77_n1, &F77_n2, a, &F77_strd1, &F77_strd2, F77_index);

#ifdef F77_INT
	for(i_local=0;i_local<n1+n2*1;i_local++) {
		index[i_local]=(int) F77_index[i_local];
	}

#endif

}
