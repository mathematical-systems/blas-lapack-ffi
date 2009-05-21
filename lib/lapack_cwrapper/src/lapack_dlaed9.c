/*
 * lapack_dlaed9.c
 *
 *This program is a C interface to dlaed9.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaed9(const int k, const int kstart, const int kstop, const int n, double * d, double * q, const int ldq, const double rho, const double * dlamda, const double * w, double * s, const int lds, int * info )
{
#ifdef F77_INT
	F77_INT F77_k=k, F77_kstart=kstart, F77_kstop=kstop, F77_n=n, F77_ldq=ldq, F77_lds=lds;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_k k
	#define F77_kstart kstart
	#define F77_kstop kstop
	#define F77_n n
	#define F77_ldq ldq
	#define F77_lds lds
	#define F77_info info
#endif

	f77_dlaed9(&F77_k, &F77_kstart, &F77_kstop, &F77_n, d, q, &F77_ldq, &rho, dlamda, w, s, &F77_lds, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
