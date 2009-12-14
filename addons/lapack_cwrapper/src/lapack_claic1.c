/*
 * lapack_claic1.c
 *
 *This program is a C interface to claic1.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_claic1(const int job, const int j, const void * x, const float sest, const void * w, const void * gamma, float * sestpr, void * s, void * c )
{
#ifdef F77_INT
	F77_INT F77_job=job, F77_j=j;
#else
	#define F77_job job
	#define F77_j j
#endif

	f77_claic1(&F77_job, &F77_j, x, &sest, w, gamma, sestpr, s, c);

#ifdef F77_INT
#endif

}
