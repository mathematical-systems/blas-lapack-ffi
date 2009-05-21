/*
 * lapack_dlaexc.c
 *
 *This program is a C interface to dlaexc.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaexc(const long int wantq, const int n, double * t, const int ldt, double * q, const int ldq, const int j1, const int n1, const int n2, double * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ldt=ldt, F77_ldq=ldq, F77_j1=j1, F77_n1=n1, F77_n2=n2;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ldt ldt
	#define F77_ldq ldq
	#define F77_j1 j1
	#define F77_n1 n1
	#define F77_n2 n2
	#define F77_info info
#endif

#ifdef F77_LOG
	F77_LOG F77_wantq=wantq;
#else
	#define F77_wantq wantq
#endif

	f77_dlaexc(&F77_wantq, &F77_n, t, &F77_ldt, q, &F77_ldq, &F77_j1, &F77_n1, &F77_n2, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
