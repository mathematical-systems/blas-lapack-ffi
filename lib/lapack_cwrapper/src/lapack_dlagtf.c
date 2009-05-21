/*
 * lapack_dlagtf.c
 *
 *This program is a C interface to dlagtf.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlagtf(const int n, double * a, const double lambda, double * b, double * c, const double tol, double * d, const int * in, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n;
	int i_local;
	F77_INT F77_in[1];
	F77_in[0]=(F77_INT) in[0];
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_in in
	#define F77_info info
#endif

	f77_dlagtf(&F77_n, a, &lambda, b, c, &tol, d, F77_in, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
