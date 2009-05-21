/*
 * lapack_dlaic1.c
 *
 *This program is a C interface to dlaic1.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaic1(const int job, const int j, const double * x, const double sest, const double * w, const double gamma, double * sestpr, double * s, double * c )
{
#ifdef F77_INT
	F77_INT F77_job=job, F77_j=j;
#else
	#define F77_job job
	#define F77_j j
#endif

	f77_dlaic1(&F77_job, &F77_j, x, &sest, w, &gamma, sestpr, s, c);

#ifdef F77_INT
#endif

}
